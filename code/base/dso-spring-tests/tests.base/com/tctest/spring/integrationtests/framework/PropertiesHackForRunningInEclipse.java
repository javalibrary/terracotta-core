/*
 * Copyright (c) 2003-2006 Terracotta, Inc. All rights reserved.
 */
package com.tctest.spring.integrationtests.framework;


public class PropertiesHackForRunningInEclipse {

  public static void initializePropertiesWhenRunningInEclipse() {
/*
2006-07-31 andrew -- This should no longer be necessary; the new
check_prep stuff should let you run in Eclipse with no problem at all.
But this is in here temporarily for Eugene's use.
    if (System.getProperty("tc.tests.info.property-files") == null) {
      String configFile = "../build/externally-run-tests/dso-spring-tests/tests.system.test-configuration";
      Assert.assertTrue("missing: " + configFile, new File(configFile).exists());
      System.setProperty("tc.tests.info.property-files", configFile);
      System.setProperty("tc.install-root", "..");
    }
 */
 }

}
