/*
 * Copyright (c) 2003-2006 Terracotta, Inc. All rights reserved.
 */
package com.tc.aspectwerkz.annotation;

/**
 * Annotation for pointcut
 * <p/>
 * TODO: rename to Pointcut and remove pointcut as field ??
 *
 * @author <a href="mailto:alex AT gnilux DOT com">Alexandre Vasseur</a>
 */
public interface Expression {
  /**
   * The pointcut expression
   */
  String value();
}
