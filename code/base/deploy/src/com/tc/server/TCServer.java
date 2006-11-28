package com.tc.server;

import com.tc.config.schema.L2Info;
import com.tc.config.schema.setup.ConfigurationSetupException;
import com.tc.license.InvalidLicenseException;
import com.tc.license.TerracottaLicense;

public interface TCServer {
  void setActivationListener(TCServerActivationListener listener);

  void start() throws Exception;

  void stop();

  boolean isStarted();

  boolean isActive();

  boolean isStopped();

  long getStartTime();

  long getActivateTime();

  void shutdown();

  L2Info[] infoForAllL2s();

  TerracottaLicense getLicense() throws InvalidLicenseException, ConfigurationSetupException;

}
