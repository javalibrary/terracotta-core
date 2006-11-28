/*
 * Copyright (c) 2003-2006 Terracotta, Inc. All rights reserved.
 */
package com.tctest;

/**
 * System test for distributed wait/notify
 */
public class WaitNotifySystemTest extends TransparentTestBase {
  private static final int NODE_COUNT = 4;

  public void doSetUp(TransparentTestIface t) throws Exception {
    t.getTransparentAppConfig().setClientCount(NODE_COUNT).setIntensity(1);
    t.initializeTestRunner();
  }

  protected Class getApplicationClass() {
    return WaitNotifySystemTestApp.class;
  }

  protected boolean canRunCrash() {
    return true;
  }

}
