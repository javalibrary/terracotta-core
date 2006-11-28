/*
 * Copyright (c) 2003-2006 Terracotta, Inc. All rights reserved.
 */

/* Generated By:JJTree: Do not edit this line. ASTArgs.java */

package com.tc.aspectwerkz.expression.ast;

public class ASTArgs extends SimpleNode {
  public ASTArgs(int id) {
    super(id);
  }

  public ASTArgs(ExpressionParser p, int id) {
    super(p, id);
  }

  /**
   * Accept the visitor. *
   */
  public Object jjtAccept(ExpressionParserVisitor visitor, Object data) {
    return visitor.visit(this, data);
  }
}