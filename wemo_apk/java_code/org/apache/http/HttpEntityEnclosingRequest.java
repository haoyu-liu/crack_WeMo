package org.apache.http;

@Deprecated
public abstract interface HttpEntityEnclosingRequest
  extends HttpRequest
{
  public abstract boolean expectContinue();
  
  public abstract HttpEntity getEntity();
  
  public abstract void setEntity(HttpEntity paramHttpEntity);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/http/HttpEntityEnclosingRequest.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */