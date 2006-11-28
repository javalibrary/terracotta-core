/*
 * Copyright (c) 2003-2006 Terracotta, Inc. All rights reserved.
 */
package com.tc.test.server.appserver.weblogic8x;

import com.tc.test.server.appserver.war.AbstractDescriptorXml;

/**
 * Represents an additional XML descriptor used in WAR deployments for weblogic.
 */
public class Weblogic8xDescriptorXml extends AbstractDescriptorXml {

  private static final String NAME = "weblogic.xml";
  
  public byte[] getBytes() {
    add("<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>");
    add("<!DOCTYPE weblogic-web-app");
    add(1,"PUBLIC \"-//BEA Systems, Inc.//DTD Web Application 8.1//EN\"");
    add(1, "\"http://www.bea.com/servers/wls810/dtd/weblogic810-web-jar.dtd\">");
    add("");
    add("<weblogic-web-app>");
    add(1, "<session-descriptor>");
    add(2, "<session-param>");
    add(3, "<param-name>PersistentStoreType</param-name>");
    add(3, "<param-value>terracotta</param-value>");
    add(2, "</session-param>");
    add(1, "</session-descriptor>");
    add("</weblogic-web-app>");
    
    return sout().toString().getBytes();
  }

  public String getFileName() {
    return NAME;
  }
}
