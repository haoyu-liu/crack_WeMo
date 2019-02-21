package org.apache.http;

@Deprecated
public abstract interface HttpRequest
  extends HttpMessage
{
  public abstract RequestLine getRequestLine();
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/http/HttpRequest.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */