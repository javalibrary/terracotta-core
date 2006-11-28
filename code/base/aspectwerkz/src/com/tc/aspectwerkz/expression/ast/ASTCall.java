/*
 * Copyright (c) 2003-2006 Terracotta, Inc. All rights reserved.
 */

/* Generated By:JJTree: Do not edit this line. ASTCall.java */

package com.tc.aspectwerkz.expression.ast;

public class ASTCall extends SimpleNode {
  public ASTCall(int id) {
    super(id);
  }

  public ASTCall(ExpressionParser p, int id) {
    super(p, id);
  }

  /**
   * Accept the visitor. *
   */
  public Object jjtAccept(ExpressionParserVisitor visitor, Object data) {
    return visitor.visit(this, data);
  }
}