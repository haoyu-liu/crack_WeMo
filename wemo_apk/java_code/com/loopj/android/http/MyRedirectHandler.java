package com.loopj.android.http;

import java.net.URI;
import java.net.URISyntaxException;
import org.apache.http.Header;
import org.apache.http.HttpHost;
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.apache.http.ProtocolException;
import org.apache.http.RequestLine;
import org.apache.http.StatusLine;
import org.apache.http.client.CircularRedirectException;
import org.apache.http.client.utils.URIUtils;
import org.apache.http.impl.client.DefaultRedirectHandler;
import org.apache.http.impl.client.RedirectLocations;
import org.apache.http.params.HttpParams;
import org.apache.http.protocol.HttpContext;

class MyRedirectHandler
  extends DefaultRedirectHandler
{
  private static final String REDIRECT_LOCATIONS = "http.protocol.redirect-locations";
  private final boolean enableRedirects;
  
  public MyRedirectHandler(boolean paramBoolean)
  {
    this.enableRedirects = paramBoolean;
  }
  
  public URI getLocationURI(HttpResponse paramHttpResponse, HttpContext paramHttpContext)
    throws ProtocolException
  {
    if (paramHttpResponse == null) {
      throw new IllegalArgumentException("HTTP response may not be null");
    }
    Header localHeader = paramHttpResponse.getFirstHeader("location");
    if (localHeader == null) {
      throw new ProtocolException("Received redirect response " + paramHttpResponse.getStatusLine() + " but no location header");
    }
    String str = localHeader.getValue().replaceAll(" ", "%20");
    Object localObject1;
    HttpParams localHttpParams;
    try
    {
      localObject1 = new URI(str);
      localHttpParams = paramHttpResponse.getParams();
      if (((URI)localObject1).isAbsolute()) {
        break label260;
      }
      if (localHttpParams.isParameterTrue("http.protocol.reject-relative-redirect")) {
        throw new ProtocolException("Relative redirect location '" + localObject1 + "' not allowed");
      }
    }
    catch (URISyntaxException localURISyntaxException3)
    {
      throw new ProtocolException("Invalid redirect URI: " + str, localURISyntaxException3);
    }
    HttpHost localHttpHost = (HttpHost)paramHttpContext.getAttribute("http.target_host");
    if (localHttpHost == null) {
      throw new IllegalStateException("Target host not available in the HTTP context");
    }
    HttpRequest localHttpRequest = (HttpRequest)paramHttpContext.getAttribute("http.request");
    label260:
    RedirectLocations localRedirectLocations;
    Object localObject2;
    for (;;)
    {
      try
      {
        URI localURI2 = URIUtils.resolve(URIUtils.rewriteURI(new URI(localHttpRequest.getRequestLine().getUri()), localHttpHost, true), (URI)localObject1);
        localObject1 = localURI2;
        if (!localHttpParams.isParameterFalse("http.protocol.allow-circular-redirects")) {
          break label442;
        }
        localRedirectLocations = (RedirectLocations)paramHttpContext.getAttribute("http.protocol.redirect-locations");
        if (localRedirectLocations == null)
        {
          localRedirectLocations = new RedirectLocations();
          paramHttpContext.setAttribute("http.protocol.redirect-locations", localRedirectLocations);
        }
        if (((URI)localObject1).getFragment() != null) {}
        URI localURI1;
        localObject2 = localObject1;
      }
      catch (URISyntaxException localURISyntaxException2)
      {
        try
        {
          localURI1 = URIUtils.rewriteURI((URI)localObject1, new HttpHost(((URI)localObject1).getHost(), ((URI)localObject1).getPort(), ((URI)localObject1).getScheme()), true);
          localObject2 = localURI1;
          if (!localRedirectLocations.contains((URI)localObject2)) {
            break;
          }
          throw new CircularRedirectException("Circular redirect to '" + localObject2 + "'");
        }
        catch (URISyntaxException localURISyntaxException1)
        {
          throw new ProtocolException(localURISyntaxException1.getMessage(), localURISyntaxException1);
        }
        localURISyntaxException2 = localURISyntaxException2;
        throw new ProtocolException(localURISyntaxException2.getMessage(), localURISyntaxException2);
      }
    }
    localRedirectLocations.add((URI)localObject2);
    label442:
    return (URI)localObject1;
  }
  
  public boolean isRedirectRequested(HttpResponse paramHttpResponse, HttpContext paramHttpContext)
  {
    if (!this.enableRedirects) {
      return false;
    }
    if (paramHttpResponse == null) {
      throw new IllegalArgumentException("HTTP response may not be null");
    }
    switch (paramHttpResponse.getStatusLine().getStatusCode())
    {
    case 304: 
    case 305: 
    case 306: 
    default: 
      return false;
    }
    return true;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/loopj/android/http/MyRedirectHandler.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */