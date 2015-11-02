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

package com.tc.objectserver.persistence;

import org.terracotta.entity.ServiceProvider;
import org.terracotta.entity.ServiceConfiguration;
import org.terracotta.persistence.IPersistentStorage;

import com.tc.logging.TCLogger;
import com.tc.logging.TCLogging;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Collection;
import java.util.Collections;
import org.terracotta.entity.ServiceProviderConfiguration;

/**
 * This service provides a very simple key-value storage persistence system.  It allows key-value data to be serialized to
 * a file in the working directory using Java serialization.
 * 
 * The initial use was to test/support platform restart without depending on CoreStorage.
 */
public class FlatFileStorageServiceProvider implements ServiceProvider {
  private static final TCLogger logger = TCLogging.getLogger(FlatFileStorageServiceProvider.class);
  private Path directory;

  @Override
  public boolean initialize(ServiceProviderConfiguration configuration) {
    if (configuration instanceof FlatFileStorageProviderConfiguration) {
      this.directory = ((FlatFileStorageProviderConfiguration)configuration).getBasedir().toPath();
    } else {
      this.directory = Paths.get(".").toAbsolutePath().normalize();
    }
    logger.info("Initialized flat file storage to: " + this.directory);
    return true;
  }

  @Override
  public <T> T getService(long consumerID, ServiceConfiguration<T> configuration) {
    String filename = "consumer_" + consumerID + ".dat";
    return configuration.getServiceType().cast(new FlatFilePersistentStorage(this.directory.resolve(filename).toString()));
  }

  @Override
  public Collection<Class<?>> getProvidedServiceTypes() {
    return Collections.singleton(IPersistentStorage.class);
  }

  @Override
  public void close() {
    
  }
  
}