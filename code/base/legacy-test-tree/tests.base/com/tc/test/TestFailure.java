/*
 * Copyright (c) 2003-2006 Terracotta, Inc. All rights reserved.
 */
package com.tc.test;

import org.apache.commons.lang.exception.ExceptionUtils;

import java.util.Date;


public class TestFailure {
  private final long timestamp;
  private final String message;
  private final Thread thread;
  private final Throwable throwable;
  
  public TestFailure(String message, Thread thread, Throwable throwable) {
    this.timestamp = System.currentTimeMillis();
    this.message = message;
    this.thread = thread;
    this.throwable= throwable;
  }
  
  public String toString() {
    StringBuffer buf = new StringBuffer( new Date(timestamp) + " " + thread + message );
    if (this.throwable != null) {
      buf.append(": " + ExceptionUtils.getFullStackTrace(this.throwable));
    }
    return buf.toString();
  }
}