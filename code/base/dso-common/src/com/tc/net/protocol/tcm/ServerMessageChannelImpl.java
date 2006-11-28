package com.tc.net.protocol.tcm;

import com.tc.logging.TCLogger;
import com.tc.logging.TCLogging;
import com.tc.net.protocol.NetworkStackID;

/**
 * TODO: Document me
 * 
 * @author teck
 */
public class ServerMessageChannelImpl extends AbstractMessageChannel implements ServerMessageChannel {
  private static final TCLogger logger = TCLogging.getLogger(ServerMessageChannel.class);
  private final ChannelID       sessionID;

  /**
   * this is for the server it needs a session ID
   */
  protected ServerMessageChannelImpl(ChannelID sessionID, TCMessageRouter router, TCMessageFactory msgFactory) {
    super(router, logger, msgFactory);
    this.sessionID = sessionID;

    // server message channels should always be open initially
    this.getStatus().open();
  }

  public ChannelID getChannelID() {
    return sessionID;
  }

  public NetworkStackID open() {
    throw new UnsupportedOperationException("Server channels don't support open()");
  }

}