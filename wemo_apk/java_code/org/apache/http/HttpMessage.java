package org.apache.http;

import org.apache.http.params.HttpParams;

@Deprecated
public abstract interface HttpMessage
{
  public abstract void addHeader(String paramString1, String paramString2);
  
  public abstract void addHeader(Header paramHeader);
  
  public abstract boolean containsHeader(String paramString);
  
  public abstract Header[] getAllHeaders();
  
  public abstract Header getFirstHeader(String paramString);
  
  public abstract Header[] getHeaders(String paramString);
  
  public abstract Header getLastHeader(String paramString);
  
  public abstract HttpParams getParams();
  
  public abstract ProtocolVersion getProtocolVersion();
  
  public abstract HeaderIterator headerIterator();
  
  public abstract HeaderIterator headerIterator(String paramString);
  
  public abstract void removeHeader(Header paramHeader);
  
  public abstract void removeHeaders(String paramString);
  
  public abstract void setHeader(String paramString1, String paramString2);
  
  public abstract void setHeader(Header paramHeader);
  
  public abstract void setHeaders(Header[] paramArrayOfHeader);
  
  public abstract void setParams(HttpParams paramHttpParams);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/http/HttpMessage.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */