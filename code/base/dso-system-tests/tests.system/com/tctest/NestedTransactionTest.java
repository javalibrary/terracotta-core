/*
 * Created on Aug 24, 2004 TODO To change the template for this generated file go to Window - Preferences - Java - Code
 * Style - Code Templates
 */
package com.tctest;


public class NestedTransactionTest  extends TransparentTestBase implements TestConfigurator {


  protected Class getApplicationClass() {
    return NestedTransactionApp.class;
  }

  public void doSetUp(TransparentTestIface t) throws Exception {
    t.getTransparentAppConfig().setClientCount(NestedTransactionApp.NODE_COUNT).setApplicationInstancePerClientCount(1).setIntensity(1);
    t.initializeTestRunner();
  }

}
