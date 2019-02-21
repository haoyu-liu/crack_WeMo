package org.apache.http;

import org.apache.http.util.CharArrayBuffer;

@Deprecated
public abstract interface FormattedHeader
  extends Header
{
  public abstract CharArrayBuffer getBuffer();
  
  public abstract int getValuePos();
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/http/FormattedHeader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */