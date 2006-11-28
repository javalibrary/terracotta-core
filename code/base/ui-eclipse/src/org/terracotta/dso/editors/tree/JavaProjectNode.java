/*
 * Copyright (c) 2003-2006 Terracotta, Inc. All rights reserved.
 */
package org.terracotta.dso.editors.tree;

public abstract class JavaProjectNode extends ProjectNode {
  public JavaProjectNode(Object object) {
    super(object);
  }
  
  public abstract String getSignature();
  public abstract String[] getFields();
}
