package org.apache.http.conn.routing;

import java.net.InetAddress;
import org.apache.http.HttpHost;

@Deprecated
public final class HttpRoute
  implements RouteInfo
{
  public HttpRoute(HttpHost paramHttpHost)
  {
    throw new RuntimeException("Stub!");
  }
  
  public HttpRoute(HttpHost paramHttpHost1, InetAddress paramInetAddress, HttpHost paramHttpHost2, boolean paramBoolean)
  {
    throw new RuntimeException("Stub!");
  }
  
  public HttpRoute(HttpHost paramHttpHost1, InetAddress paramInetAddress, HttpHost paramHttpHost2, boolean paramBoolean, RouteInfo.TunnelType paramTunnelType, RouteInfo.LayerType paramLayerType)
  {
    throw new RuntimeException("Stub!");
  }
  
  public HttpRoute(HttpHost paramHttpHost, InetAddress paramInetAddress, boolean paramBoolean)
  {
    throw new RuntimeException("Stub!");
  }
  
  public HttpRoute(HttpHost paramHttpHost, InetAddress paramInetAddress, HttpHost[] paramArrayOfHttpHost, boolean paramBoolean, RouteInfo.TunnelType paramTunnelType, RouteInfo.LayerType paramLayerType)
  {
    throw new RuntimeException("Stub!");
  }
  
  public Object clone()
    throws CloneNotSupportedException
  {
    throw new RuntimeException("Stub!");
  }
  
  public final boolean equals(Object paramObject)
  {
    throw new RuntimeException("Stub!");
  }
  
  public final int getHopCount()
  {
    throw new RuntimeException("Stub!");
  }
  
  public final HttpHost getHopTarget(int paramInt)
  {
    throw new RuntimeException("Stub!");
  }
  
  public final RouteInfo.LayerType getLayerType()
  {
    throw new RuntimeException("Stub!");
  }
  
  public final InetAddress getLocalAddress()
  {
    throw new RuntimeException("Stub!");
  }
  
  public final HttpHost getProxyHost()
  {
    throw new RuntimeException("Stub!");
  }
  
  public final HttpHost getTargetHost()
  {
    throw new RuntimeException("Stub!");
  }
  
  public final RouteInfo.TunnelType getTunnelType()
  {
    throw new RuntimeException("Stub!");
  }
  
  public final int hashCode()
  {
    throw new RuntimeException("Stub!");
  }
  
  public final boolean isLayered()
  {
    throw new RuntimeException("Stub!");
  }
  
  public final boolean isSecure()
  {
    throw new RuntimeException("Stub!");
  }
  
  public final boolean isTunnelled()
  {
    throw new RuntimeException("Stub!");
  }
  
  public final String toString()
  {
    throw new RuntimeException("Stub!");
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/http/conn/routing/HttpRoute.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */