/*
 * Copyright (c) 2003-2006 Terracotta, Inc. All rights reserved.
 */
package com.tc.objectserver.control;

import com.tc.process.LinkedJavaProcess;
import com.tc.test.TestConfigObject;
import com.tc.util.Assert;

import java.io.File;
import java.io.FileNotFoundException;

public class ExtraL1ProcessControl extends ExtraProcessServerControl {

  private final Class    mainClass;
  private final String[] mainArgs;
  private final File     directory;

  public ExtraL1ProcessControl(String l2Host, int dsoPort, Class mainClass, String configFileLoc, String[] mainArgs,
                               File directory) throws FileNotFoundException {
    super(new DebugParams(), l2Host, dsoPort, 0, configFileLoc, true);
    this.mainClass = mainClass;
    this.mainArgs = mainArgs;
    this.directory = directory;

    setJVMArgs();
  }

  protected LinkedJavaProcess createLinkedJavaProcess() {
    LinkedJavaProcess out = super.createLinkedJavaProcess();
    out.setDirectory(this.directory);
    return out;
  }

  private void setJVMArgs() {
    try {
      String bootclasspath = "-Xbootclasspath/p:" + TestConfigObject.getInstance().normalBootJar();
      System.err.println("Bootclasspath:" + bootclasspath);
      this.jvmArgs.add("-Dtc.classpath=" + System.getProperty("java.class.path"));
      this.jvmArgs.add(bootclasspath);
      this.jvmArgs.add("-Dtc.config=" + super.configFileLoc);
    } catch (Exception e) {
      throw Assert.failure("Can't set JVM args", e);
    }
  }

  protected String getMainClassName() {
    return mainClass.getName();
  }

  protected String[] getMainClassArguments() {
    return mainArgs;
  }

  public boolean isRunning() {
    // TODO:: comeback
    return true;
  }

  public void attemptShutdown() throws Exception {
    // TODO:: comeback
    process.destroy();
  }
}
