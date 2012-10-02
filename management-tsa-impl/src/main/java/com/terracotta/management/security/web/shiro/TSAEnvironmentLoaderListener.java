package com.terracotta.management.security.web.shiro;

import net.sf.ehcache.management.resource.services.validator.impl.JmxEhcacheRequestValidator;
import net.sf.ehcache.management.service.AgentService;
import net.sf.ehcache.management.service.CacheManagerService;
import net.sf.ehcache.management.service.CacheService;
import net.sf.ehcache.management.service.EntityResourceFactory;
import net.sf.ehcache.management.service.impl.JmxRepositoryService;
import org.apache.shiro.web.env.EnvironmentLoaderListener;
import org.terracotta.management.ServiceLocator;
import org.terracotta.management.resource.services.validator.RequestValidator;

import com.terracotta.management.security.ContextService;
import com.terracotta.management.security.IdentityAssertionServiceClient;
import com.terracotta.management.security.KeyChainAccessor;
import com.terracotta.management.security.RequestIdentityAsserter;
import com.terracotta.management.security.RequestTicketMonitor;
import com.terracotta.management.security.SSLContextFactory;
import com.terracotta.management.security.UserService;
import com.terracotta.management.security.impl.DfltContextService;
import com.terracotta.management.security.impl.DfltRequestTicketMonitor;
import com.terracotta.management.security.impl.DfltUserService;
import com.terracotta.management.security.impl.NullContextService;
import com.terracotta.management.security.impl.NullIdentityAsserter;
import com.terracotta.management.security.impl.NullRequestTicketMonitor;
import com.terracotta.management.security.impl.NullUserService;
import com.terracotta.management.security.impl.RelayingJerseyIdentityAssertionServiceClient;
import com.terracotta.management.security.impl.TSAIdentityAsserter;
import com.terracotta.management.security.web.config.TSAConfig;

import java.lang.management.ManagementFactory;

import javax.management.MBeanServer;
import javax.servlet.ServletContextEvent;

/**
 * @author Ludovic Orban
 */
public class TSAEnvironmentLoaderListener extends EnvironmentLoaderListener {

  @Override
  public void contextInitialized(ServletContextEvent sce) {
    try {
      ServiceLocator serviceLocator = new ServiceLocator();

      MBeanServer mBeanServer = ManagementFactory.getPlatformMBeanServer();
      boolean sslEnabled = TSAConfig.isSslEnabled();
      KeyChainAccessor kcAccessor = TSAConfig.getKeyChain();
      SSLContextFactory sslCtxtFactory = TSAConfig.getSSLContextFactory();
      String securityServiceLocation = TSAConfig.getSecurityServiceLocation();
      Integer securityTimeout = TSAConfig.getSecurityTimeout();

      if (sslEnabled) {
        ContextService contextService = new DfltContextService();
        UserService userService = new DfltUserService();
        IdentityAssertionServiceClient identityAssertionServiceClient = new RelayingJerseyIdentityAssertionServiceClient(kcAccessor, sslCtxtFactory, securityServiceLocation, securityTimeout, contextService);
        RequestTicketMonitor requestTicketMonitor = new DfltRequestTicketMonitor();
        TSAIdentityAsserter identityAsserter = new TSAIdentityAsserter(requestTicketMonitor, userService, kcAccessor);

        JmxEhcacheRequestValidator requestValidator = new JmxEhcacheRequestValidator(mBeanServer);
        JmxRepositoryService repoSvc = new JmxRepositoryService(mBeanServer, requestValidator, requestTicketMonitor, contextService, userService);

        serviceLocator.loadService(RequestTicketMonitor.class, requestTicketMonitor);
        serviceLocator.loadService(RequestIdentityAsserter.class, identityAsserter);
        serviceLocator.loadService(ContextService.class, contextService);
        serviceLocator.loadService(UserService.class, userService);
        serviceLocator.loadService(IdentityAssertionServiceClient.class, identityAssertionServiceClient);
        serviceLocator.loadService(RequestValidator.class, requestValidator);
        serviceLocator.loadService(KeyChainAccessor.class, kcAccessor);
        serviceLocator.loadService(SSLContextFactory.class, sslCtxtFactory);
        serviceLocator.loadService(CacheManagerService.class, repoSvc);
        serviceLocator.loadService(CacheService.class, repoSvc);
        serviceLocator.loadService(EntityResourceFactory.class, repoSvc);
        serviceLocator.loadService(AgentService.class, repoSvc);
      } else {
        ContextService contextService = new NullContextService();
        UserService userService = new NullUserService();
        RequestTicketMonitor requestTicketMonitor = new NullRequestTicketMonitor();
        RequestIdentityAsserter identityAsserter = new NullIdentityAsserter();

        JmxEhcacheRequestValidator requestValidator = new JmxEhcacheRequestValidator(mBeanServer);
        JmxRepositoryService repoSvc = new JmxRepositoryService(mBeanServer, requestValidator, requestTicketMonitor, contextService, userService);

        serviceLocator.loadService(RequestTicketMonitor.class, requestTicketMonitor);
        serviceLocator.loadService(RequestIdentityAsserter.class, identityAsserter);
        serviceLocator.loadService(ContextService.class, contextService);
        serviceLocator.loadService(UserService.class, userService);
        serviceLocator.loadService(RequestValidator.class, requestValidator);
        serviceLocator.loadService(KeyChainAccessor.class, kcAccessor);
        serviceLocator.loadService(SSLContextFactory.class, sslCtxtFactory);
        serviceLocator.loadService(CacheManagerService.class, repoSvc);
        serviceLocator.loadService(CacheService.class, repoSvc);
        serviceLocator.loadService(EntityResourceFactory.class, repoSvc);
        serviceLocator.loadService(AgentService.class, repoSvc);
      }

      ServiceLocator.load(serviceLocator);
    } catch (Exception e) {
      throw new RuntimeException("Error initializing TSAEnvironmentLoaderListener", e);
    }

    super.contextInitialized(sce);
  }

}