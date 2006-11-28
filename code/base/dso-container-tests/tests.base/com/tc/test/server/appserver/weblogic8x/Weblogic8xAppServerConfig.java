/*
 * Copyright (c) 2003-2006 Terracotta, Inc. All rights reserved.
 */
package com.tc.test.server.appserver.weblogic8x;

import com.tc.test.server.tcconfig.StandardTerracottaAppServerConfig;

import java.io.File;

/**
 * Used to set appserver specific terracotta config elements such as excludes.
 */
public class Weblogic8xAppServerConfig extends StandardTerracottaAppServerConfig {

  public Weblogic8xAppServerConfig(File baseDir) {
    super(baseDir);
  }
}
