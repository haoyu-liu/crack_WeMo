package org.apache.http.message;

import org.apache.http.Header;
import org.apache.http.HeaderIterator;
import org.apache.http.HttpMessage;
import org.apache.http.params.HttpParams;

@Deprecated
public abstract class AbstractHttpMessage
  implements HttpMessage
{
  protected HeaderGroup headergroup;
  protected HttpParams params;
  
  protected AbstractHttpMessage()
  {
    throw new RuntimeException("Stub!");
  }
  
  protected AbstractHttpMessage(HttpParams paramHttpParams)
  {
    throw new RuntimeException("Stub!");
  }
  
  public void addHeader(String paramString1, String paramString2)
  {
    throw new RuntimeException("Stub!");
  }
  
  public void addHeader(Header paramHeader)
  {
    throw new RuntimeException("Stub!");
  }
  
  public boolean containsHeader(String paramString)
  {
    throw new RuntimeException("Stub!");
  }
  
  public Header[] getAllHeaders()
  {
    throw new RuntimeException("Stub!");
  }
  
  public Header getFirstHeader(String paramString)
  {
    throw new RuntimeException("Stub!");
  }
  
  public Header[] getHeaders(String paramString)
  {
    throw new RuntimeException("Stub!");
  }
  
  public Header getLastHeader(String paramString)
  {
    throw new RuntimeException("Stub!");
  }
  
  public HttpParams getParams()
  {
    throw new RuntimeException("Stub!");
  }
  
  public HeaderIterator headerIterator()
  {
    throw new RuntimeException("Stub!");
  }
  
  public HeaderIterator headerIterator(String paramString)
  {
    throw new RuntimeException("Stub!");
  }
  
  public void removeHeader(Header paramHeader)
  {
    throw new RuntimeException("Stub!");
  }
  
  public void removeHeaders(String paramString)
  {
    throw new RuntimeException("Stub!");
  }
  
  public void setHeader(String paramString1, String paramString2)
  {
    throw new RuntimeException("Stub!");
  }
  
  public void setHeader(Header paramHeader)
  {
    throw new RuntimeException("Stub!");
  }
  
  public void setHeaders(Header[] paramArrayOfHeader)
  {
    throw new RuntimeException("Stub!");
  }
  
  public void setParams(HttpParams paramHttpParams)
  {
    throw new RuntimeException("Stub!");
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/http/message/AbstractHttpMessage.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */