package android.net.http;

import android.content.ContentResolver;
import android.content.Context;
import java.io.IOException;
import java.io.InputStream;
import org.apache.http.HttpEntity;
import org.apache.http.HttpHost;
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.conn.ClientConnectionManager;
import org.apache.http.entity.AbstractHttpEntity;
import org.apache.http.params.HttpParams;
import org.apache.http.protocol.HttpContext;

public final class AndroidHttpClient
  implements HttpClient
{
  public static long DEFAULT_SYNC_MIN_GZIP_BYTES;
  
  AndroidHttpClient()
  {
    throw new RuntimeException("Stub!");
  }
  
  public static AbstractHttpEntity getCompressedEntity(byte[] paramArrayOfByte, ContentResolver paramContentResolver)
    throws IOException
  {
    throw new RuntimeException("Stub!");
  }
  
  public static long getMinGzipSize(ContentResolver paramContentResolver)
  {
    throw new RuntimeException("Stub!");
  }
  
  public static InputStream getUngzippedContent(HttpEntity paramHttpEntity)
    throws IOException
  {
    throw new RuntimeException("Stub!");
  }
  
  public static void modifyRequestToAcceptGzipResponse(HttpRequest paramHttpRequest)
  {
    throw new RuntimeException("Stub!");
  }
  
  public static AndroidHttpClient newInstance(String paramString)
  {
    throw new RuntimeException("Stub!");
  }
  
  public static AndroidHttpClient newInstance(String paramString, Context paramContext)
  {
    throw new RuntimeException("Stub!");
  }
  
  public static long parseDate(String paramString)
  {
    throw new RuntimeException("Stub!");
  }
  
  public void close()
  {
    throw new RuntimeException("Stub!");
  }
  
  public void disableCurlLogging()
  {
    throw new RuntimeException("Stub!");
  }
  
  public void enableCurlLogging(String paramString, int paramInt)
  {
    throw new RuntimeException("Stub!");
  }
  
  public <T> T execute(HttpHost paramHttpHost, HttpRequest paramHttpRequest, ResponseHandler<? extends T> paramResponseHandler)
    throws IOException, ClientProtocolException
  {
    throw new RuntimeException("Stub!");
  }
  
  public <T> T execute(HttpHost paramHttpHost, HttpRequest paramHttpRequest, ResponseHandler<? extends T> paramResponseHandler, HttpContext paramHttpContext)
    throws IOException, ClientProtocolException
  {
    throw new RuntimeException("Stub!");
  }
  
  public <T> T execute(HttpUriRequest paramHttpUriRequest, ResponseHandler<? extends T> paramResponseHandler)
    throws IOException, ClientProtocolException
  {
    throw new RuntimeException("Stub!");
  }
  
  public <T> T execute(HttpUriRequest paramHttpUriRequest, ResponseHandler<? extends T> paramResponseHandler, HttpContext paramHttpContext)
    throws IOException, ClientProtocolException
  {
    throw new RuntimeException("Stub!");
  }
  
  public HttpResponse execute(HttpHost paramHttpHost, HttpRequest paramHttpRequest)
    throws IOException
  {
    throw new RuntimeException("Stub!");
  }
  
  public HttpResponse execute(HttpHost paramHttpHost, HttpRequest paramHttpRequest, HttpContext paramHttpContext)
    throws IOException
  {
    throw new RuntimeException("Stub!");
  }
  
  public HttpResponse execute(HttpUriRequest paramHttpUriRequest)
    throws IOException
  {
    throw new RuntimeException("Stub!");
  }
  
  public HttpResponse execute(HttpUriRequest paramHttpUriRequest, HttpContext paramHttpContext)
    throws IOException
  {
    throw new RuntimeException("Stub!");
  }
  
  protected void finalize()
    throws Throwable
  {
    throw new RuntimeException("Stub!");
  }
  
  public ClientConnectionManager getConnectionManager()
  {
    throw new RuntimeException("Stub!");
  }
  
  public HttpParams getParams()
  {
    throw new RuntimeException("Stub!");
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/android/net/http/AndroidHttpClient.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */