/*
 * Copyright (c) 2003-2006 Terracotta, Inc. All rights reserved.
 */
package com.tc.simulator.listener;



public interface ListenerProvider extends StatsListenerFactory {
  public OutputListener getOutputListener();
  public ResultsListener getResultsListener();

}