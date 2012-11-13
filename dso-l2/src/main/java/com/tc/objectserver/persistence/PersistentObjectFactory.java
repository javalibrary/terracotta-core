package com.tc.objectserver.persistence;

import org.terracotta.corestorage.ImmutableKeyValueStorageConfig;
import org.terracotta.corestorage.KeyValueStorage;
import org.terracotta.corestorage.KeyValueStorageConfig;
import org.terracotta.corestorage.StorageManager;

import com.tc.object.ObjectID;

/**
 * @author tim
 */
public class PersistentObjectFactory {
  private static final KeyValueStorageConfig<Object, Object> MAP_CONFIG = ImmutableKeyValueStorageConfig.builder(Object.class, Object.class)
      .keyTransformer(LiteralSerializer.INSTANCE)
      .valueTransformer(LiteralSerializer.INSTANCE)
      .concurrency(1).build();

  private final StorageManager storageManager;

  public PersistentObjectFactory(final StorageManager storageManager) {
    this.storageManager = storageManager;
  }

  public synchronized KeyValueStorage<Object, Object> getMap(ObjectID objectID, final boolean create) {
    KeyValueStorage<Object, Object> map = storageManager.getKeyValueStorage(objectID.toString(), Object.class, Object.class);
    if (map == null) {
      if (create) {
        map = storageManager.createKeyValueStorage(objectID.toString(), MAP_CONFIG);
      } else {
        throw new AssertionError("Map for object id " + objectID + " not found.");
      }
    }
    return map;
  }

  public synchronized void destroyMap(ObjectID oid) {
    storageManager.destroyKeyValueStorage(oid.toString());
  }
}