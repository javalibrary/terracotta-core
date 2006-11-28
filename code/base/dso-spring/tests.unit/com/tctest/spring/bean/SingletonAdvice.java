/*
 * Copyright (c) 2003-2006 Terracotta, Inc. All rights reserved.
 */
package com.tctest.spring.bean;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;

public class SingletonAdvice implements MethodInterceptor {
  private int counter = 0;
  
  public Object invoke(MethodInvocation invocation) throws Throwable {
    synchronized(this) {
      this.counter++;
    }
    return invocation.proceed();
  }
  
  synchronized public int getCounter() {
    return counter;
  }

}
