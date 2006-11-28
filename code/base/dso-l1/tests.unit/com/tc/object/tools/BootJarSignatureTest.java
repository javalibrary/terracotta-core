/*
 * Copyright (c) 2003-2006 Terracotta, Inc. All rights reserved.
 */
package com.tc.object.tools;

import com.tc.test.TCTestCase;

import java.util.Properties;

public class BootJarSignatureTest extends TCTestCase {

  public void testExceptions() {
    try {
      new BootJarSignature(new Properties());
      fail();
    } catch (UnsupportedVMException uve) {
      // expected
    }

    try {
      new BootJarSignature(makeProps(null, "Sun", "1.5.0_04", "i686"));
      fail();
    } catch (UnsupportedVMException uve) {
      // expected
    }

    try {
      new BootJarSignature(makeProps("Windows NT", null, "1.5.0_04", "i686"));
      fail();
    } catch (UnsupportedVMException uve) {
      // expected
    }

    try {
      new BootJarSignature(makeProps("Windows NT", "1.4.2_04", null, "i686"));
      fail();
    } catch (UnsupportedVMException uve) {
      // expected
    }

  }

  public void testSolaris() throws UnsupportedVMException {
    Properties props = makeProps("SunOS", "Sun Microsystems Inc.", "1.5.0_06", "sparc");
    BootJarSignature sig = new BootJarSignature(props);
    assertEquals("hotspot_solaris_150_06", sig.getSignature());

    props = makeProps("SunOS", "Sun Microsystems Inc.", "1.4.2_12", "x86");
    sig = new BootJarSignature(props);
    assertEquals("hotspot_solaris-x86_142_12", sig.getSignature());

    try {
      props = makeProps("SunOS", "Sun Microsystems Inc.", "1.5.0_06", null);
      new BootJarSignature(props);
      fail();
    } catch (UnsupportedVMException uve) {
      // expected (since os.arch was null)
    }

  }

  public void testWindows() throws UnsupportedVMException {
    Properties props = makeProps("Windows XP", "Sun Microsystems Inc.", "1.5.0_06", null);
    BootJarSignature sig = new BootJarSignature(props);
    assertEquals("hotspot_win32_150_06", sig.getSignature());

    props = makeProps("Windows 2000", "Sun Microsystems Inc.", "1.4.2_12", null);
    sig = new BootJarSignature(props);
    assertEquals("hotspot_win32_142_12", sig.getSignature());
  }

  public void testMac() throws UnsupportedVMException {
    Properties props = makeProps("Mac OS X", "Apple Computer, Inc.", "1.5.0_05", null);
    BootJarSignature sig = new BootJarSignature(props);
    assertEquals("hotspot_osx_150_05", sig.getSignature());
  }

  public void testLinux() throws UnsupportedVMException {
    Properties props = makeProps("Linux", "Sun Microsystems, Inc.", "1.5.0_01", null);
    BootJarSignature sig = new BootJarSignature(props);
    assertEquals("hotspot_linux_150_01", sig.getSignature());

    props = makeProps("Linux", "BEA Systems, Inc.", "1.5.0_03", null);
    sig = new BootJarSignature(props);
    assertEquals("jrockit_linux_150_03", sig.getSignature());

    // test this exceptional case
    props = makeProps("Linux", "Sun Microsystems, Inc.", "1.4.2_05", null);
    props.setProperty("java.vm.name", "BEA WebLogic JRockit(TM) 1.4.2_05 JVM R24.5.0-0");
    props.setProperty("jrockit.version", "ari-41062-20050215-0919-linux-ia32");
    sig = new BootJarSignature(props);
    assertEquals("jrockit_linux_142_05", sig.getSignature());
  }

  private Properties makeProps(String os, String vendor, String version, String arch) {
    Properties props = new Properties();
    if (version != null) props.put("java.version", version);
    if (os != null) props.put("os.name", os);
    if (arch != null) props.put("os.arch", arch);
    if (vendor != null) props.put("java.vendor", vendor);
    return props;
  }

}
