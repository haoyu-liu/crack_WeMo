package org.apache.http.conn.params;

import java.net.InetAddress;
import org.apache.http.HttpHost;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.params.HttpParams;

@Deprecated
public class ConnRouteParams
  implements ConnRoutePNames
{
  public static final HttpHost NO_HOST = null;
  public static final HttpRoute NO_ROUTE = null;
  
  ConnRouteParams()
  {
    throw new RuntimeException("Stub!");
  }
  
  public static HttpHost getDefaultProxy(HttpParams paramHttpParams)
  {
    throw new RuntimeException("Stub!");
  }
  
  public static HttpRoute getForcedRoute(HttpParams paramHttpParams)
  {
    throw new RuntimeException("Stub!");
  }
  
  public static InetAddress getLocalAddress(HttpParams paramHttpParams)
  {
    throw new RuntimeException("Stub!");
  }
  
  public static void setDefaultProxy(HttpParams paramHttpParams, HttpHost paramHttpHost)
  {
    throw new RuntimeException("Stub!");
  }
  
  public static void setForcedRoute(HttpParams paramHttpParams, HttpRoute paramHttpRoute)
  {
    throw new RuntimeException("Stub!");
  }
  
  public static void setLocalAddress(HttpParams paramHttpParams, InetAddress paramInetAddress)
  {
    throw new RuntimeException("Stub!");
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/http/conn/params/ConnRouteParams.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */