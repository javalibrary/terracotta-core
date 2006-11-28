/*
 * Copyright (c) 2003-2006 Terracotta, Inc. All rights reserved.
 */
package com.tc.aspectwerkz.transform.inlining.compiler;

import com.tc.aspectwerkz.transform.TransformationConstants;

/**
 * @author <a href="mailto:alex AT gnilux DOT com">Alexandre Vasseur</a>
 */
public class CompilerInput {

  public String joinPointClassName;

  public int joinPointInstanceIndex = TransformationConstants.INDEX_NOTAVAILABLE;

  public boolean isOptimizedJoinPoint = false;

  /**
   * Index on stack of the first target method arg (0 or 1, depends of static target or not
   */
  public int argStartIndex = TransformationConstants.INDEX_NOTAVAILABLE;

  public int callerIndex = TransformationConstants.INDEX_NOTAVAILABLE;
  public String callerClassSignature;

  public int calleeIndex = TransformationConstants.INDEX_NOTAVAILABLE;
  public String calleeClassSignature;

  /**
   * Returns a new instance that suits for proceed() ie where jp index is 0 etc.
   *
   * @return
   */
  public CompilerInput getCopyForProceed() {
    CompilerInput input = new CompilerInput();
    input.joinPointClassName = joinPointClassName;
    input.calleeClassSignature = calleeClassSignature;
    input.callerClassSignature = callerClassSignature;

    // proceed() needs specific values
    input.isOptimizedJoinPoint = false;
    input.joinPointInstanceIndex = 0;
    return input;
  }
}
