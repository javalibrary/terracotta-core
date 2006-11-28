/*
 * Copyright (c) 2003-2006 Terracotta, Inc. All rights reserved.
 */
package com.tctest;


public class ByteCodePerformanceTest extends TransparentTestBase {
  private static final int NODE_COUNT = 1;

  public void setUp() throws Exception {
    super.setUp();
    getTransparentAppConfig().setClientCount(NODE_COUNT).setIntensity(1);
    initializeTestRunner();
  }

  protected Class getApplicationClass() {
    return ByteCodePerformanceTestApp.class;
  }

  protected boolean getStartServer() {
    return true;
  }

}
