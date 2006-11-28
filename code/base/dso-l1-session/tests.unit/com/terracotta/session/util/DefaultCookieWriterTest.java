/*
 * Copyright (c) 2003-2006 Terracotta, Inc. All rights reserved.
 */
package com.terracotta.session.util;

import com.terracotta.session.SessionId;

import java.util.Properties;

import javax.servlet.http.Cookie;
import javax.servlet.http.MockHttpServletRequest;
import javax.servlet.http.MockHttpServletResponse;

import junit.framework.TestCase;

public class DefaultCookieWriterTest extends TestCase {

  private final String            cookieName = "SomeCookieName";
  private final String            idValue    = "SomeSessionId";
  
  private DefaultCookieWriter     writer;
  private MockHttpServletRequest  req;
  private MockHttpServletResponse res;
  private SessionId               id;

  public final void setUp() {
    writer = new DefaultCookieWriter(true, true, true, cookieName, null, ConfigProperties.defaultCookiePath, null, -1, false);
    req = new MockHttpServletRequest();
    res = new MockHttpServletResponse();
    id = new DefaultSessionId(idValue, idValue, idValue);
  }

  public final void testConstructor() {
    // test default c-tor
    DefaultCookieWriter w = DefaultCookieWriter.makeInstance(new ConfigProperties(null, new Properties()));
    assertEquals(ConfigProperties.defaultCookieName, w.cookieName);

  }

  public final void testCreateCookie() {
    final Cookie c = writer.createCookie(req, res, id);
    checkCookie(cookieName, idValue, ConfigProperties.defaultCookiePath, c);
  }

  public final void testWriteCookie() {
    writer.writeCookie(req, res, id);
    Cookie[] cookies = res.getCookies();
    assertNotNull(cookies);
    assertEquals(1, cookies.length);
    checkCookie(cookieName, idValue, ConfigProperties.defaultCookiePath, cookies[0]);
  }
  
  public final void testUrlRewrite() {
    final String requestUrl = "http://localhost:8080/some_page.jsp";
    req.setRequestUrl(requestUrl);
    req.setRequestedSessionId(id.getExternalId());
    req.setSidFromCookie(false);
    req.setSidValid(true);
    req.setScheme("http");
    req.setServerName("localhost");
    req.setServerPort(8080);
    final String actual = writer.encodeRedirectURL("/", req);
    final String expected = "/;" + this.cookieName.toLowerCase() + "=" + id.getExternalId();
    assertEquals(expected, actual);
  }
  
  private final void checkCookie(final String cName, final String cVal, final String path, Cookie c) {
    assertEquals(cName, c.getName());
    assertEquals(cVal, c.getValue());
    assertEquals(path, c.getPath());
  }

}
