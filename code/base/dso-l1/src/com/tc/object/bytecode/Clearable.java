/*
 * Copyright (c) 2003-2006 Terracotta, Inc. All rights reserved.
 */
package com.tc.object.bytecode;

public interface Clearable {

  public int clearReferences(int toClear);

}
