package org.apache.http.protocol;

import java.io.IOException;
import org.apache.http.ConnectionReuseStrategy;
import org.apache.http.HttpException;
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.apache.http.HttpResponseFactory;
import org.apache.http.HttpServerConnection;
import org.apache.http.params.HttpParams;

@Deprecated
public class HttpService
{
  public HttpService(HttpProcessor paramHttpProcessor, ConnectionReuseStrategy paramConnectionReuseStrategy, HttpResponseFactory paramHttpResponseFactory)
  {
    throw new RuntimeException("Stub!");
  }
  
  protected void doService(HttpRequest paramHttpRequest, HttpResponse paramHttpResponse, HttpContext paramHttpContext)
    throws HttpException, IOException
  {
    throw new RuntimeException("Stub!");
  }
  
  public HttpParams getParams()
  {
    throw new RuntimeException("Stub!");
  }
  
  protected void handleException(HttpException paramHttpException, HttpResponse paramHttpResponse)
  {
    throw new RuntimeException("Stub!");
  }
  
  public void handleRequest(HttpServerConnection paramHttpServerConnection, HttpContext paramHttpContext)
    throws IOException, HttpException
  {
    throw new RuntimeException("Stub!");
  }
  
  public void setConnReuseStrategy(ConnectionReuseStrategy paramConnectionReuseStrategy)
  {
    throw new RuntimeException("Stub!");
  }
  
  public void setExpectationVerifier(HttpExpectationVerifier paramHttpExpectationVerifier)
  {
    throw new RuntimeException("Stub!");
  }
  
  public void setHandlerResolver(HttpRequestHandlerResolver paramHttpRequestHandlerResolver)
  {
    throw new RuntimeException("Stub!");
  }
  
  public void setHttpProcessor(HttpProcessor paramHttpProcessor)
  {
    throw new RuntimeException("Stub!");
  }
  
  public void setParams(HttpParams paramHttpParams)
  {
    throw new RuntimeException("Stub!");
  }
  
  public void setResponseFactory(HttpResponseFactory paramHttpResponseFactory)
  {
    throw new RuntimeException("Stub!");
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/http/protocol/HttpService.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */