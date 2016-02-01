/*
 *
 *  The contents of this file are subject to the Terracotta Public License Version
 *  2.0 (the "License"); You may not use this file except in compliance with the
 *  License. You may obtain a copy of the License at
 *
 *  http://terracotta.org/legal/terracotta-public-license.
 *
 *  Software distributed under the License is distributed on an "AS IS" basis,
 *  WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
 *  the specific language governing rights and limitations under the License.
 *
 *  The Covered Software is Terracotta Core.
 *
 *  The Initial Developer of the Covered Software is
 *  Terracotta, Inc., a Software AG company
 *
 */
package com.tc.config.schema.setup;

import com.tc.config.schema.setup.ConfigurationSetupException;
import org.terracotta.config.TcConfiguration;

import java.io.File;

/**
 * An object that knows how to create configuration from some source and put it into repositories.
 */
public interface ConfigurationCreator {

  @Deprecated
  void createConfiguration() throws ConfigurationSetupException;
  /**
   * Load up the configuration.
   */
  void createConfiguration(ClassLoader loader) throws ConfigurationSetupException;

  /**
   * @return the directory containing the configuration file from which config was loaded,
   *         <em>IF<em> such a thing exists; this may well return <code>null</code> (for
   *         example, if configuration was loaded from a URL rather than a file).
   */
  File directoryConfigurationLoadedFrom();

  /**
   * @return true if the ConfigurationSource was a trusted one. Non-trusted sources require that the server be queried
   *         to enforce that the configuration-mode is development.
   */
  boolean loadedFromTrustedSource();

  /**
   * Return the config text as retrieved from source.
   */
  String rawConfigText();
  
  String source();

  String describeSources();

  String reloadServersConfiguration(boolean shouldLogConfig, boolean reportToConsole) throws ConfigurationSetupException;


  TcConfiguration getParsedConfiguration();
}
