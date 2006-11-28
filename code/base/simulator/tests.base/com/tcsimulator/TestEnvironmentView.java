/*
 * Copyright (c) 2003-2006 Terracotta, Inc. All rights reserved.
 */
package com.tcsimulator;

import com.tcsimulator.distrunner.ServerSpec;

import java.util.Collection;

public interface TestEnvironmentView {

  public ServerView getServerView();

  public Collection getClientViews();

  public void update(ServerSpec serverSpec, Collection clientSpecs);

  public void update(ServerSpec serverSpec);

  public void update(Collection clientSpecs);

  public int getIntensity();

}
