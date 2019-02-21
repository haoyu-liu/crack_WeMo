package org.apache.http.impl.conn.tsccm;

import java.lang.ref.Reference;

@Deprecated
public abstract interface RefQueueHandler
{
  public abstract void handleReference(Reference<?> paramReference);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/http/impl/conn/tsccm/RefQueueHandler.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */