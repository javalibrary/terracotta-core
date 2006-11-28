/*
 * Copyright (c) 2003-2006 Terracotta, Inc. All rights reserved.
 */
package com.tc.test.server.appserver.war;

/**
 * Creates a war that uses a dtd compliant web.xml file. Schema is not supported by older containers.
 */
public class DtdWar extends AbstractWar {
  
  public DtdWar(String appName) {
    super(appName, new Dtd2x3WebXml(appName));
  }
}
