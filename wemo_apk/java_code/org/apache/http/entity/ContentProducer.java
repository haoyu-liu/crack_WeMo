package org.apache.http.entity;

import java.io.IOException;
import java.io.OutputStream;

@Deprecated
public abstract interface ContentProducer
{
  public abstract void writeTo(OutputStream paramOutputStream)
    throws IOException;
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/http/entity/ContentProducer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */