/*
 * Copyright (c) 2003-2006 Terracotta, Inc. All rights reserved.
 */
package com.tc.object.config.spec;

import EDU.oswego.cs.dl.util.concurrent.SynchronizedVariable;

import com.tc.object.config.ConfigVisitor;
import com.tc.object.config.DSOApplicationConfig;
import com.tc.object.config.Visitable;

public class SynchronizedVariableSpec implements Visitable {

  public ConfigVisitor visit(ConfigVisitor visitor, DSOApplicationConfig config) {
    String classname = SynchronizedVariable.class.getName();
    config.addIncludePattern(classname);
    config.addWriteAutolock("* " + classname + ".*(..)");
    return visitor;
  }

}
