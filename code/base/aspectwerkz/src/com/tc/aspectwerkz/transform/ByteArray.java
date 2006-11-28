/*
 * Copyright (c) 2003-2006 Terracotta, Inc. All rights reserved.
 */
package com.tc.aspectwerkz.transform;

/**
 * A byte[] wrapper object
 *
 * @author <a href="mailto:alex@gnilux.com">Alexandre Vasseur </a>
 */
public class ByteArray {
  private byte[] bytes;

  public ByteArray(byte[] b) {
    bytes = b;
  }

  public byte[] getBytes() {
    return bytes;
  }
}