/*
 * Copyright (c) 2003-2006 Terracotta, Inc. All rights reserved.
 */
package com.tctest.spring.bean;


public class SingletonWithTransientField  extends BaseSingletonWithTransientField {

    private transient String foo;
}

