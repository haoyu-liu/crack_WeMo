package org.apache.http.impl.client;

import java.util.Map;
import org.apache.http.Header;
import org.apache.http.HttpResponse;
import org.apache.http.auth.MalformedChallengeException;
import org.apache.http.protocol.HttpContext;

@Deprecated
public class DefaultProxyAuthenticationHandler
  extends AbstractAuthenticationHandler
{
  public DefaultProxyAuthenticationHandler()
  {
    throw new RuntimeException("Stub!");
  }
  
  public Map<String, Header> getChallenges(HttpResponse paramHttpResponse, HttpContext paramHttpContext)
    throws MalformedChallengeException
  {
    throw new RuntimeException("Stub!");
  }
  
  public boolean isAuthenticationRequested(HttpResponse paramHttpResponse, HttpContext paramHttpContext)
  {
    throw new RuntimeException("Stub!");
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/http/impl/client/DefaultProxyAuthenticationHandler.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */