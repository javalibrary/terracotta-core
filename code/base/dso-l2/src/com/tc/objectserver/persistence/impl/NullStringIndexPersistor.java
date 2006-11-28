/*
 * Copyright (c) 2003-2006 Terracotta, Inc. All rights reserved.
 */
package com.tc.objectserver.persistence.impl;

import com.tc.objectserver.persistence.api.StringIndexPersistor;

import gnu.trove.TLongObjectHashMap;

public class NullStringIndexPersistor implements StringIndexPersistor {

  public TLongObjectHashMap loadMappingsInto(TLongObjectHashMap target) {
    return target;
  }

  public void saveMapping(long index, String string) {
    return;
  }

}
