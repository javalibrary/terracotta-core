package com.tctest.spring.integrationtests.framework;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class ServerManagerUtil {

  protected static Log logger = LogFactory.getLog(ServerManagerUtil.class);

  public static ServerManager start(Class testClass, boolean withPersistentStore) throws Exception {
    ServerManager existingServerManager = getExistingServerManager();
    if (existingServerManager != null) {
      logger.debug("Using existing ServerManager");
      return existingServerManager;
    }
    logger.debug("Creating server manager");
    ServerManager serverManager = new ServerManager(testClass);
    serverManager.start(withPersistentStore);
    return serverManager;
  }

  public static void stop(ServerManager serverManager) {
    ServerManager existingServerManager = getExistingServerManager();
    if (existingServerManager != null) {
      logger.debug("Not stopping existing ServerManager");
      return;
    }
    logger.debug("Stopping ServerManager");
    serverManager.stop();
  }

  private static ThreadLocal serverManagerHolder = new ThreadLocal();

  private static ServerManager getExistingServerManager() {
    return (ServerManager) serverManagerHolder.get();
  }

  public static ServerManager startAndBind(Class testClass, boolean withPersistentStore) throws Exception {
    ServerManager sm = start(testClass, withPersistentStore);
    serverManagerHolder.set(sm);
    return sm;
  }

  public static void stopAndRelease(ServerManager sm) {
    serverManagerHolder.set(null);
    stop(sm);
  }

  public static void stopAllWebServers(ServerManager serverManager) {
    getExistingServerManager().stopAllWebServers();    
  }

}
