package org.apache.http.protocol;

import java.io.IOException;
import org.apache.http.HttpException;
import org.apache.http.HttpRequest;
import org.apache.http.HttpRequestInterceptor;

@Deprecated
public class RequestExpectContinue
  implements HttpRequestInterceptor
{
  public RequestExpectContinue()
  {
    throw new RuntimeException("Stub!");
  }
  
  public void process(HttpRequest paramHttpRequest, HttpContext paramHttpContext)
    throws HttpException, IOException
  {
    throw new RuntimeException("Stub!");
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/http/protocol/RequestExpectContinue.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */