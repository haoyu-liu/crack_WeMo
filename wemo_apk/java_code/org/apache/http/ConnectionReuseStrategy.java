package org.apache.http;

import org.apache.http.protocol.HttpContext;

@Deprecated
public abstract interface ConnectionReuseStrategy
{
  public abstract boolean keepAlive(HttpResponse paramHttpResponse, HttpContext paramHttpContext);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/http/ConnectionReuseStrategy.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */