/*
 * Copyright (c) 2003-2006 Terracotta, Inc. All rights reserved.
 */
package com.tc.management;

import com.tc.config.schema.setup.L2TVSConfigurationSetupManager;
import com.tc.exception.TCRuntimeException;
import com.tc.logging.CustomerLogging;
import com.tc.logging.TCLogger;
import com.tc.logging.TCLogging;
import com.tc.management.beans.L2MBeanNames;
import com.tc.management.beans.TCServerInfoMBean;
import com.tc.management.beans.object.ObjectManagementMonitor;
import com.tc.management.beans.object.ObjectManagementMonitorMBean;
import com.tc.util.PortChooser;

import java.io.IOException;
import java.net.BindException;
import java.util.List;

import javax.management.InstanceAlreadyExistsException;
import javax.management.MBeanRegistrationException;
import javax.management.MBeanServer;
import javax.management.MBeanServerFactory;
import javax.management.NotCompliantMBeanException;
import javax.management.ObjectName;
import javax.management.remote.JMXConnectorServer;
import javax.management.remote.JMXConnectorServerFactory;
import javax.management.remote.JMXServiceURL;

public class L2Management extends TerracottaManagement {

  private static final TCLogger                logger = TCLogging.getLogger(L2Management.class);

  private MBeanServer                          mBeanServer;
  private JMXConnectorServer                   jmxConnectorServer;
  private final L2TVSConfigurationSetupManager configurationSetupManager;
  private final TCServerInfoMBean              tcServerInfo;
  private final ObjectManagementMonitor        objectManagementBean;

  public L2Management(TCServerInfoMBean tcServerInfo, L2TVSConfigurationSetupManager configurationSetupManager)
      throws MBeanRegistrationException, NotCompliantMBeanException {
    this.tcServerInfo = tcServerInfo;
    this.configurationSetupManager = configurationSetupManager;

    try {
      objectManagementBean = new ObjectManagementMonitor();
    } catch (NotCompliantMBeanException ncmbe) {
      throw new TCRuntimeException(
                                   "Unable to construct one of the L2 MBeans: this is a programming error in one of those beans",
                                   ncmbe);
    }

    java.util.logging.Logger jmxRemoteOptionalLogger = java.util.logging.Logger
        .getLogger("javax.management.remote.generic");
    jmxRemoteOptionalLogger.setLevel(java.util.logging.Level.OFF);

    final List jmxServers = MBeanServerFactory.findMBeanServer(null);
    if (jmxServers != null && !jmxServers.isEmpty()) {
      mBeanServer = (MBeanServer) jmxServers.get(0);
    } else {
      mBeanServer = MBeanServerFactory.createMBeanServer();
    }
    registerMBeans();
  }

  public synchronized void start() throws Exception {
    int jmxPort = configurationSetupManager.commonl2Config().jmxPort().getInt();
    if (jmxPort == 0) {
      jmxPort = new PortChooser().chooseRandomPort();
    }
    try {
      JMXServiceURL url = new JMXServiceURL("jmxmp", "localhost", jmxPort);
      jmxConnectorServer = JMXConnectorServerFactory.newJMXConnectorServer(url, null, mBeanServer);
      jmxConnectorServer.start();
      CustomerLogging.getConsoleLogger().info("JMX Server started. Available at URL[" + url + "]");
    } catch (BindException be) {
      throw new Exception("Unable to bind JMX server on port " + jmxPort
                          + "; perhaps this port is already in use, or you don't have sufficient privileges?", be);
    }
  }

  public synchronized void stop() throws IOException {
    if (jmxConnectorServer != null) {
      jmxConnectorServer.stop();
    }
  }

  public Object findMBean(ObjectName objectName, Class mBeanInterface) throws IOException {
    return findMBean(objectName, mBeanInterface, mBeanServer);
  }

  public MBeanServer getMBeanServer() {
    return mBeanServer;
  }

  public ObjectManagementMonitorMBean findObjectManagementMonitorMBean() {
    return objectManagementBean;
  }

  private void registerMBeans() throws MBeanRegistrationException, NotCompliantMBeanException {
    try {
      mBeanServer.registerMBean(tcServerInfo, L2MBeanNames.TC_SERVER_INFO);
      mBeanServer.registerMBean(TCLogging.getAppender().getMBean(), L2MBeanNames.LOGGER);
      mBeanServer.registerMBean(objectManagementBean, L2MBeanNames.OBJECT_MANAGEMENT);
    } catch (InstanceAlreadyExistsException e) {
      // tests trigger multiple registration attemps of these mbeans 
      logger.warn("Could not register all mbeans in L2Management because InstanceAlreadyExistsException thrown.");
    }
  }

}
