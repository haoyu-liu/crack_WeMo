package org.apache.http;

@Deprecated
public abstract interface RequestLine
{
  public abstract String getMethod();
  
  public abstract ProtocolVersion getProtocolVersion();
  
  public abstract String getUri();
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/http/RequestLine.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */