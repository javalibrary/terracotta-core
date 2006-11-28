/*
 * Copyright (c) 2003-2006 Terracotta, Inc. All rights reserved.
 */
package com.tc.exception;

import org.mortbay.util.MultiException;

import junit.framework.TestCase;

public class ExceptionHelperTest extends TestCase {
  public void test() {
    ExceptionHelperImpl helper = new ExceptionHelperImpl();
    helper.addHelper(new RuntimeExceptionHelper());
    helper.addHelper(new MortbayMultiExceptionHelper());
    
    Throwable ultimateCause = new AssertionError();
    Exception proximateCause = new RuntimeException(ultimateCause);
    Exception top = new TCRuntimeException(proximateCause);
    
    check(helper, ultimateCause, proximateCause, top);

    ultimateCause = new RuntimeException();
    proximateCause = new MultiException();
    ((MultiException)proximateCause).add((Exception)ultimateCause);
    top = new RuntimeException(proximateCause);
    check(helper, ultimateCause, proximateCause, top);
  }

  private void check(ExceptionHelper helper, Throwable ultimateCause, Exception proximateCause, Exception top) {
    assertSame(ultimateCause, helper.getUltimateCause(top));
    assertSame(ultimateCause, helper.getUltimateCause(proximateCause));
    assertSame(ultimateCause, helper.getUltimateCause(ultimateCause));
    assertSame(proximateCause, helper.getProximateCause(top));
    assertSame(ultimateCause, helper.getProximateCause(proximateCause));
    assertSame(ultimateCause, helper.getProximateCause(ultimateCause));
  }
}
