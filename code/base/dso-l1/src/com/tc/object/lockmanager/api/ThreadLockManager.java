/*
 * Copyright (c) 2003-2006 Terracotta, Inc. All rights reserved.
 */
package com.tc.object.lockmanager.api;

import com.tc.object.tx.WaitInvocation;

public interface ThreadLockManager {

  public LockID lockIDFor(String lockName);

  public void lock(LockID lockID, int lockLevel);
  
  public boolean tryLock(LockID lockID, int lockLevel);

  public void wait(LockID lockID, WaitInvocation call, Object object, WaitListener waitListener);

  public Notify notify(LockID lockID, boolean all);

  public void unlock(LockID lockID);

  public boolean isLocked(LockID lockID);
  
  public int heldCount(LockID lockID, int lockLevel);
  
  public int queueLength(LockID lockId);
  
  public int waitLength(LockID lockId);
}
