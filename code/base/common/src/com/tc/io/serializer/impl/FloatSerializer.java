package com.tc.io.serializer.impl;

import com.tc.io.serializer.api.Serializer;

import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;

/**
 * Float
 */
public final class FloatSerializer implements Serializer {

  public void serializeTo(Object o, ObjectOutput out) throws IOException {
    out.writeFloat(((Float)o).floatValue());
  }

  public Object deserializeFrom(ObjectInput in) throws IOException {
    return new Float(in.readFloat());
  }

  public byte getSerializerID() {
    return FLOAT;
  }
  
}