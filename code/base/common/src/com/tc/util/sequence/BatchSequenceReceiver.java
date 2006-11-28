/**
 * Copyright (c) 2003-2006 Terracotta, Inc. All rights reserved.
 */
package com.tc.util.sequence;

public interface BatchSequenceReceiver {
  public void setNextBatch(long start, long end);
  
  public boolean hasNext();
}
