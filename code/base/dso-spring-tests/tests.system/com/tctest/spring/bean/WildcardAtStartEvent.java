/*
 * Copyright (c) 2003-2006 Terracotta, Inc. All rights reserved.
 */
package com.tctest.spring.bean;

public class WildcardAtStartEvent extends SingletonEvent {

  public WildcardAtStartEvent(Object source, String message) {
    super(source, message);
  }

}
