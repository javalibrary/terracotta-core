/*
 * Copyright (c) 2003-2006 Terracotta, Inc. All rights reserved.
 */
package com.tc.config.schema.test;

import com.tc.config.schema.builder.RootConfigBuilder;

/**
 * Allows you to build valid config for a root. This class <strong>MUST NOT</strong> invoke the actual XML beans to do
 * its work; one of its purposes is, in fact, to test that those beans are set up correctly.
 */
public class RootConfigBuilderImpl extends BaseConfigBuilder implements RootConfigBuilder {

  public RootConfigBuilderImpl() {
    super(4, ALL_PROPERTIES);
  }
  
  public void setFieldName(String name) {
    setProperty("field-name", name);
  }

  public void setRootName(String name) {
    setProperty("root-name", name);
  }
  
  private static final String[] ALL_PROPERTIES = new String[] { "field-name", "root-name" };
  
  public String toString() {
    return elements(ALL_PROPERTIES);
  }

}
