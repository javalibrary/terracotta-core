/*
 * Copyright (c) 2003-2006 Terracotta, Inc. All rights reserved.
 */
package com.terracotta.session.util;

import java.util.Date;

public class Timestamp {

  private long millis = 0;

  public Timestamp(long millis) {
    this.millis = millis;
  }

  public synchronized long getMillis() {
    return millis;
  }

  public void setMillis(long millis) {
    this.millis = millis;
  }

  public String toString() {
    return new Date(millis).toString();
  }
}
