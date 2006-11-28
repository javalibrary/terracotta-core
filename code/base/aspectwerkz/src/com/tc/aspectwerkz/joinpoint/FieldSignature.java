/*
 * Copyright (c) 2003-2006 Terracotta, Inc. All rights reserved.
 */
package com.tc.aspectwerkz.joinpoint;

import java.lang.reflect.Field;

/**
 * Interface for the field signature.
 *
 * @author <a href="mailto:jboner@codehaus.org">Jonas Bon�r </a>
 */
public interface FieldSignature extends MemberSignature {
  /**
   * Returns the field.
   *
   * @return the field
   */
  Field getField();

  /**
   * Returns the field type.
   *
   * @return the field type
   */
  Class getFieldType();
}