package com.tc.net.protocol;

import com.tc.bytes.TCByteBuffer;
import com.tc.bytes.TCByteBufferFactory;
import com.tc.net.core.TCConnection;

public class NullProtocolAdaptor implements TCProtocolAdaptor {

  public NullProtocolAdaptor() {
    super();
  }

  public void addReadData(TCConnection source, TCByteBuffer[] data, int length) {
    return;
  }

  public TCByteBuffer[] getReadBuffers() {
    return TCByteBufferFactory.getFixedSizedInstancesForLength(false, 4096);
  }
}