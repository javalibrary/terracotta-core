/*
 * Copyright (c) 2003-2006 Terracotta, Inc. All rights reserved.
 */
package com.tctest.perf.collections;

import com.tctest.TransparentTestBase;
import com.tctest.TransparentTestIface;

import java.util.Properties;


public class AbstractPerfTestBase extends TransparentTestBase {

  private  int nodes = 3;
  private int threads = 3;
  private int intensity = 10;
  private long maxTimeout = 25; //in minutes
  private Class TestClass;

  static final String PERF_NODE_COUNT = "PerfNodeCount";
  static final String PERF_THREAD_COUNT = "PerfThreadCount";
  static final String PERF_INTENSITY = "PerfIntensity";
  static final String PERF_TIMEOUT = "PerfTimeoutMinutes";

  
  public AbstractPerfTestBase(Class appCls) {
    Properties props = System.getProperties();
    nodes = new Integer(props.getProperty(PERF_NODE_COUNT, String.valueOf(nodes))).intValue();
    threads = new Integer(props.getProperty(PERF_THREAD_COUNT, String.valueOf(threads))).intValue();
    intensity = new Integer(props.getProperty(PERF_INTENSITY, String.valueOf(intensity))).intValue();
    maxTimeout = new Long(props.getProperty(PERF_TIMEOUT, String.valueOf(maxTimeout))).longValue();
    TestClass = appCls;
  }

  public void doSetUp(TransparentTestIface t) throws Exception {
    t.getTransparentAppConfig().setClientCount(nodes).setApplicationInstancePerClientCount(threads)
        .setIntensity(intensity);
    t.initializeTestRunner();
    t.getRunnerConfig().executionTimeout = maxTimeout * 60 * 1000; }

  protected Class getApplicationClass() {
    return TestClass;
  }

}