package com.tctest.spring.integrationtests.tests;

import com.tctest.spring.bean.FooService;
import com.tctest.spring.integrationtests.framework.AbstractTwoServerDeploymentTest;
import com.tctest.spring.integrationtests.framework.DeploymentBuilder;

import junit.extensions.TestSetup;
import junit.framework.Test;

/**
 * Runs a couple of tests within the same JVM
 * 
 * @author cer
 */

public class ParentChildBeanTest extends AbstractTwoServerDeploymentTest {

  private static final String REMOTE_SERVICE_NAME           = "Foo";
  private static final String REMOTE_SERVICE_NAME2          = "Foo2";
  private static final String BEAN_DEFINITION_FILE_FOR_TEST = "classpath:/com/tctest/spring/beanfactory-parent-child.xml";
  private static final String CONFIG_FILE_FOR_TEST          = "/tc-config-files/parent-child-tc-config.xml";

  private static FooService   foo1a;
  private static FooService   foo2a;
  private static FooService   foo1b;
  private static FooService   foo2b;

  public void testParentChildBeanDefinitionWithConcreteParent() throws Exception {
    assertEquals("rawValue-0", foo1a.serviceMethod());
    assertEquals("rawValue-1", foo2a.serviceMethod());
  }

  public void testParentChildBeanDefinitionWithConcreteChild() throws Exception {
    assertEquals("another-raw-0", foo1b.serviceMethod());
    assertEquals("another-raw-1", foo2b.serviceMethod());
  }

  private static class ParentChildBeanTestSetup extends TwoSvrSetup {

    private ParentChildBeanTestSetup() {
      super(ParentChildBeanTest.class, CONFIG_FILE_FOR_TEST, "test-parent-child");
    }

    protected void setUp() throws Exception {
      super.setUp();
      foo1a = (FooService) server1.getProxy(FooService.class, REMOTE_SERVICE_NAME);
      foo2a = (FooService) server2.getProxy(FooService.class, REMOTE_SERVICE_NAME);
      foo1b = (FooService) server1.getProxy(FooService.class, REMOTE_SERVICE_NAME2);
      foo2b = (FooService) server2.getProxy(FooService.class, REMOTE_SERVICE_NAME2);
    }

    protected void configureWar(DeploymentBuilder builder) {
      builder.addBeanDefinitionFile(BEAN_DEFINITION_FILE_FOR_TEST);
      builder.addRemoteService(REMOTE_SERVICE_NAME, "service1", FooService.class);
      builder.addRemoteService(REMOTE_SERVICE_NAME2, "service2", FooService.class);
    }
  }

  /**
   * JUnit test loader entry point
   */
  public static Test suite() {
    TestSetup setup = new ParentChildBeanTestSetup();
    return setup;
  }

}
