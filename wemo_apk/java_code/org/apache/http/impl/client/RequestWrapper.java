package org.apache.http.impl.client;

import java.net.URI;
import org.apache.http.HttpRequest;
import org.apache.http.ProtocolException;
import org.apache.http.ProtocolVersion;
import org.apache.http.RequestLine;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.message.AbstractHttpMessage;

@Deprecated
public class RequestWrapper
  extends AbstractHttpMessage
  implements HttpUriRequest
{
  public RequestWrapper(HttpRequest paramHttpRequest)
    throws ProtocolException
  {
    throw new RuntimeException("Stub!");
  }
  
  public void abort()
    throws UnsupportedOperationException
  {
    throw new RuntimeException("Stub!");
  }
  
  public int getExecCount()
  {
    throw new RuntimeException("Stub!");
  }
  
  public String getMethod()
  {
    throw new RuntimeException("Stub!");
  }
  
  public HttpRequest getOriginal()
  {
    throw new RuntimeException("Stub!");
  }
  
  public ProtocolVersion getProtocolVersion()
  {
    throw new RuntimeException("Stub!");
  }
  
  public RequestLine getRequestLine()
  {
    throw new RuntimeException("Stub!");
  }
  
  public URI getURI()
  {
    throw new RuntimeException("Stub!");
  }
  
  public void incrementExecCount()
  {
    throw new RuntimeException("Stub!");
  }
  
  public boolean isAborted()
  {
    throw new RuntimeException("Stub!");
  }
  
  public boolean isRepeatable()
  {
    throw new RuntimeException("Stub!");
  }
  
  public void resetHeaders()
  {
    throw new RuntimeException("Stub!");
  }
  
  public void setMethod(String paramString)
  {
    throw new RuntimeException("Stub!");
  }
  
  public void setProtocolVersion(ProtocolVersion paramProtocolVersion)
  {
    throw new RuntimeException("Stub!");
  }
  
  public void setURI(URI paramURI)
  {
    throw new RuntimeException("Stub!");
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/http/impl/client/RequestWrapper.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */