/*
 * Copyright (c) 2003-2006 Terracotta, Inc. All rights reserved.
 */
package com.tc.objectserver.lockmanager.api;

import com.tc.net.protocol.tcm.ChannelID;
import com.tc.object.lockmanager.api.LockID;

public interface LockAwardContext {

  public ChannelID getChannelID();

  public LockID getLockID();
  
  public long getTimeout();

}
