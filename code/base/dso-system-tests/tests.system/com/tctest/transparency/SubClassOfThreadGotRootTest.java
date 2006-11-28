/*
 * Copyright (c) 2003-2006 Terracotta, Inc. All rights reserved.
 */
package com.tctest.transparency;

import com.tctest.TestConfigurator;
import com.tctest.TransparentTestBase;
import com.tctest.TransparentTestIface;

public class SubClassOfThreadGotRootTest extends TransparentTestBase implements TestConfigurator {

  private static final int NODE_COUNT = 2;
  
  protected Class getApplicationClass() {
    return SubClassOfThreadGotRootTestApp.class;
  }

  public void doSetUp(TransparentTestIface t) throws Exception {
    t.getTransparentAppConfig().setClientCount(NODE_COUNT).setIntensity(1);
    t.initializeTestRunner();
  }

}
