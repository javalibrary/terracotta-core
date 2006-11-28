/*
 * Copyright (c) 2003-2006 Terracotta, Inc. All rights reserved.
 */
package com.tc.simulator.container;

public final class ContainerResult {
  private final boolean success;
  private final int applicationInstanceCount;
  
  ContainerResult() {
    this(false, 0);
  }
  
  ContainerResult(Container.ContainerExecutionInstance containerExecution) {
    this(containerExecution.getResult(), containerExecution.getExecutionCount());
  }
  
  private ContainerResult(boolean success, int applicationInstanceCount) {
    this.success = success;
    this.applicationInstanceCount = applicationInstanceCount;
  }
  
  public String toString() {
    return getClass().getName() + "@" + System.identityHashCode(this) 
    + "[application instance count: " + this.applicationInstanceCount + ", success=" + success + "]"; 
  }
  
  public boolean success() {
    return this.success;
  }

  public int getApplicationInstanceCount() {
    return this.applicationInstanceCount;
  }
}
