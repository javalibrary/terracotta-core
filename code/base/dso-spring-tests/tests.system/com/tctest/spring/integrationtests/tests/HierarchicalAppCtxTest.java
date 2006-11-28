package com.tctest.spring.integrationtests.tests;

import com.tctest.spring.bean.ISingleton;
import com.tctest.spring.integrationtests.framework.AbstractTwoServerDeploymentTest;
import com.tctest.spring.integrationtests.framework.DeploymentBuilder;

import junit.extensions.TestSetup;
import junit.framework.Test;


/**
 * Test the scenario of WebApplication Context with a parent application context.
 * The bean defined in the parent application context can be also shared.
 */
public class HierarchicalAppCtxTest extends AbstractTwoServerDeploymentTest {

  private static final String REMOTE_SERVICE_NAME           = "Singleton";
  private static final String CONFIG_FILE_FOR_TEST          = "/tc-config-files/singleton-tc-config.xml";

  private static ISingleton   singleton1;
  private static ISingleton   singleton2;

  public void testSharedField() throws Exception {

    logger.debug("testing shared fields");

    assertEquals(singleton1.getCounter(), singleton2.getCounter());
    singleton1.incrementCounter();
    assertEquals(singleton1.getCounter(), singleton2.getCounter());
    singleton2.incrementCounter();
    assertEquals(singleton2.getCounter(), singleton1.getCounter());

    logger.debug("!!!! Asserts passed !!!");
  }

  public void testTransientField() throws Exception {

    logger.debug("Testing transient fields");
    assertEquals("aaa", singleton1.getTransientValue());
    assertEquals("aaa", singleton2.getTransientValue());
    singleton1.setTransientValue("s1");
    assertEquals("aaa", singleton2.getTransientValue());
    singleton2.setTransientValue("s2");
    assertEquals("s1", singleton1.getTransientValue());
    assertEquals("s2", singleton2.getTransientValue());
    logger.debug("done testing transient fields");
  }
  
  public void testSharedBooleanField() throws Exception {
    assertTrue(singleton1.toggleBoolean());
    assertFalse(singleton2.toggleBoolean());
    assertTrue(singleton1.toggleBoolean());
  }

  private static class SingletonTestSetup extends TwoSvrSetup {
    private SingletonTestSetup() {
      super(HierarchicalAppCtxTest.class, CONFIG_FILE_FOR_TEST, "test-singleton");
    }

    protected void setUp() throws Exception {
      super.setUp();

      singleton1 = (ISingleton) server1.getProxy(ISingleton.class, REMOTE_SERVICE_NAME);
      singleton2 = (ISingleton) server2.getProxy(ISingleton.class, REMOTE_SERVICE_NAME);
    }

    protected void configureWar(DeploymentBuilder builder) {
      builder.setParentApplicationContextRef("/com/tctest/spring/hierarchicalAppCtxTest/beanfactoryRef.xml", "spring.xml");
      builder.addBeanDefinitionFile("classpath:/com/tctest/spring/hierarchicalAppCtxTest/child-beanfactory.xml");
      builder.addRemoteService(REMOTE_SERVICE_NAME, "singleton", ISingleton.class);
    }

  }

  /**
   *  JUnit test loader entry point
   */
  public static Test suite() {
    TestSetup setup = new SingletonTestSetup();
    return setup;
  }
}
