package com.terracotta.session;

import com.terracotta.session.util.Lock;


public interface SessionId {

  /**
   * @return requested session id unchanged
   */
  String getRequestedId();

  /**
   * @return session id that will be returned to the client browser. This might be diff from requestedSessionId and will
   *         contain key plus, potentially, server id
   */
  String getExternalId();

  /**
   * @return part of session id that serves as a constant key into collection of session objects; the OTHER parts of
   *         session id can change throughout session lifetime, this part must stay constant.
   */
  String getKey();

  boolean isServerHop();

  boolean isNew();

  void getWriteLock();

  boolean tryWriteLock();

  void commitLock();

  Lock getLock();
}
