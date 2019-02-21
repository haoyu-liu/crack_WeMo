package com.loopj.android.http;

import android.util.Log;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URI;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.impl.client.AbstractHttpClient;
import org.apache.http.protocol.HttpContext;

public class AsyncHttpRequest
  implements Runnable
{
  private boolean cancelIsNotified;
  private final AbstractHttpClient client;
  private final HttpContext context;
  private int executionCount;
  private boolean isCancelled;
  private boolean isFinished;
  private boolean isRequestPreProcessed;
  private final HttpUriRequest request;
  private final ResponseHandlerInterface responseHandler;
  
  public AsyncHttpRequest(AbstractHttpClient paramAbstractHttpClient, HttpContext paramHttpContext, HttpUriRequest paramHttpUriRequest, ResponseHandlerInterface paramResponseHandlerInterface)
  {
    this.client = paramAbstractHttpClient;
    this.context = paramHttpContext;
    this.request = paramHttpUriRequest;
    this.responseHandler = paramResponseHandlerInterface;
  }
  
  private void makeRequest()
    throws IOException
  {
    try
    {
      if (isCancelled()) {
        return;
      }
      if (this.request.getURI().getScheme() == null) {
        throw new MalformedURLException("No valid URI scheme was provided");
      }
    }
    catch (Exception localException)
    {
      this.responseHandler.sendFailureMessage(0, null, null, localException);
      return;
    }
    HttpResponse localHttpResponse = this.client.execute(this.request, this.context);
    if ((!isCancelled()) && (this.responseHandler != null))
    {
      this.responseHandler.onPreProcessResponse(this.responseHandler, localHttpResponse);
      if (!isCancelled())
      {
        this.responseHandler.sendResponseMessage(localHttpResponse);
        if (!isCancelled()) {
          this.responseHandler.onPostProcessResponse(this.responseHandler, localHttpResponse);
        }
      }
    }
  }
  
  /* Error */
  private void makeRequestWithRetries()
    throws IOException
  {
    // Byte code:
    //   0: iconst_1
    //   1: istore_1
    //   2: aload_0
    //   3: getfield 28	com/loopj/android/http/AsyncHttpRequest:client	Lorg/apache/http/impl/client/AbstractHttpClient;
    //   6: invokevirtual 93	org/apache/http/impl/client/AbstractHttpClient:getHttpRequestRetryHandler	()Lorg/apache/http/client/HttpRequestRetryHandler;
    //   9: astore_2
    //   10: aconst_null
    //   11: astore_3
    //   12: iload_1
    //   13: ifeq +240 -> 253
    //   16: aload_0
    //   17: invokespecial 95	com/loopj/android/http/AsyncHttpRequest:makeRequest	()V
    //   20: return
    //   21: astore 16
    //   23: new 37	java/io/IOException
    //   26: dup
    //   27: new 97	java/lang/StringBuilder
    //   30: dup
    //   31: invokespecial 98	java/lang/StringBuilder:<init>	()V
    //   34: ldc 100
    //   36: invokevirtual 104	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   39: aload 16
    //   41: invokevirtual 107	java/net/UnknownHostException:getMessage	()Ljava/lang/String;
    //   44: invokevirtual 104	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   47: invokevirtual 110	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   50: invokespecial 111	java/io/IOException:<init>	(Ljava/lang/String;)V
    //   53: astore 10
    //   55: aload_0
    //   56: getfield 113	com/loopj/android/http/AsyncHttpRequest:executionCount	I
    //   59: ifle +66 -> 125
    //   62: iconst_1
    //   63: aload_0
    //   64: getfield 113	com/loopj/android/http/AsyncHttpRequest:executionCount	I
    //   67: iadd
    //   68: istore 17
    //   70: aload_0
    //   71: iload 17
    //   73: putfield 113	com/loopj/android/http/AsyncHttpRequest:executionCount	I
    //   76: aload_2
    //   77: aload 10
    //   79: iload 17
    //   81: aload_0
    //   82: getfield 30	com/loopj/android/http/AsyncHttpRequest:context	Lorg/apache/http/protocol/HttpContext;
    //   85: invokeinterface 119 4 0
    //   90: ifeq +35 -> 125
    //   93: iconst_1
    //   94: istore_1
    //   95: iload_1
    //   96: ifeq +217 -> 313
    //   99: aload_0
    //   100: getfield 34	com/loopj/android/http/AsyncHttpRequest:responseHandler	Lcom/loopj/android/http/ResponseHandlerInterface;
    //   103: ifnull +210 -> 313
    //   106: aload_0
    //   107: getfield 34	com/loopj/android/http/AsyncHttpRequest:responseHandler	Lcom/loopj/android/http/ResponseHandlerInterface;
    //   110: aload_0
    //   111: getfield 113	com/loopj/android/http/AsyncHttpRequest:executionCount	I
    //   114: invokeinterface 123 2 0
    //   119: aload 10
    //   121: astore_3
    //   122: goto -110 -> 12
    //   125: iconst_0
    //   126: istore_1
    //   127: goto -32 -> 95
    //   130: astore 13
    //   132: new 37	java/io/IOException
    //   135: dup
    //   136: new 97	java/lang/StringBuilder
    //   139: dup
    //   140: invokespecial 98	java/lang/StringBuilder:<init>	()V
    //   143: ldc 125
    //   145: invokevirtual 104	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   148: aload 13
    //   150: invokevirtual 126	java/lang/NullPointerException:getMessage	()Ljava/lang/String;
    //   153: invokevirtual 104	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   156: invokevirtual 110	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   159: invokespecial 111	java/io/IOException:<init>	(Ljava/lang/String;)V
    //   162: astore 10
    //   164: iconst_1
    //   165: aload_0
    //   166: getfield 113	com/loopj/android/http/AsyncHttpRequest:executionCount	I
    //   169: iadd
    //   170: istore 14
    //   172: aload_0
    //   173: iload 14
    //   175: putfield 113	com/loopj/android/http/AsyncHttpRequest:executionCount	I
    //   178: aload_2
    //   179: aload 10
    //   181: iload 14
    //   183: aload_0
    //   184: getfield 30	com/loopj/android/http/AsyncHttpRequest:context	Lorg/apache/http/protocol/HttpContext;
    //   187: invokeinterface 119 4 0
    //   192: istore 15
    //   194: iload 15
    //   196: istore_1
    //   197: goto -102 -> 95
    //   200: astore 8
    //   202: aload_0
    //   203: invokevirtual 42	com/loopj/android/http/AsyncHttpRequest:isCancelled	()Z
    //   206: istore 9
    //   208: iload 9
    //   210: ifne -190 -> 20
    //   213: aload 8
    //   215: astore 10
    //   217: iconst_1
    //   218: aload_0
    //   219: getfield 113	com/loopj/android/http/AsyncHttpRequest:executionCount	I
    //   222: iadd
    //   223: istore 11
    //   225: aload_0
    //   226: iload 11
    //   228: putfield 113	com/loopj/android/http/AsyncHttpRequest:executionCount	I
    //   231: aload_2
    //   232: aload 10
    //   234: iload 11
    //   236: aload_0
    //   237: getfield 30	com/loopj/android/http/AsyncHttpRequest:context	Lorg/apache/http/protocol/HttpContext;
    //   240: invokeinterface 119 4 0
    //   245: istore 12
    //   247: iload 12
    //   249: istore_1
    //   250: goto -155 -> 95
    //   253: aload_3
    //   254: astore 4
    //   256: aload 4
    //   258: athrow
    //   259: astore 5
    //   261: aload_3
    //   262: pop
    //   263: ldc -128
    //   265: ldc -126
    //   267: aload 5
    //   269: invokestatic 136	android/util/Log:e	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   272: pop
    //   273: new 37	java/io/IOException
    //   276: dup
    //   277: new 97	java/lang/StringBuilder
    //   280: dup
    //   281: invokespecial 98	java/lang/StringBuilder:<init>	()V
    //   284: ldc -118
    //   286: invokevirtual 104	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   289: aload 5
    //   291: invokevirtual 139	java/lang/Exception:getMessage	()Ljava/lang/String;
    //   294: invokevirtual 104	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   297: invokevirtual 110	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   300: invokespecial 111	java/io/IOException:<init>	(Ljava/lang/String;)V
    //   303: astore 4
    //   305: goto -49 -> 256
    //   308: astore 5
    //   310: goto -47 -> 263
    //   313: aload 10
    //   315: astore_3
    //   316: goto -304 -> 12
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	319	0	this	AsyncHttpRequest
    //   1	249	1	i	int
    //   9	223	2	localHttpRequestRetryHandler	org.apache.http.client.HttpRequestRetryHandler
    //   11	305	3	localObject1	Object
    //   254	50	4	localObject2	Object
    //   259	31	5	localException1	Exception
    //   308	1	5	localException2	Exception
    //   200	14	8	localIOException	IOException
    //   206	3	9	bool1	boolean
    //   53	261	10	localObject3	Object
    //   223	12	11	j	int
    //   245	3	12	bool2	boolean
    //   130	19	13	localNullPointerException	NullPointerException
    //   170	12	14	k	int
    //   192	3	15	bool3	boolean
    //   21	19	16	localUnknownHostException	java.net.UnknownHostException
    //   68	12	17	m	int
    // Exception table:
    //   from	to	target	type
    //   16	20	21	java/net/UnknownHostException
    //   16	20	130	java/lang/NullPointerException
    //   16	20	200	java/io/IOException
    //   16	20	259	java/lang/Exception
    //   23	55	259	java/lang/Exception
    //   132	164	259	java/lang/Exception
    //   202	208	259	java/lang/Exception
    //   55	93	308	java/lang/Exception
    //   99	119	308	java/lang/Exception
    //   164	194	308	java/lang/Exception
    //   217	247	308	java/lang/Exception
  }
  
  private void sendCancelNotification()
  {
    try
    {
      if ((!this.isFinished) && (this.isCancelled) && (!this.cancelIsNotified))
      {
        this.cancelIsNotified = true;
        if (this.responseHandler != null) {
          this.responseHandler.sendCancelMessage();
        }
      }
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public boolean cancel(boolean paramBoolean)
  {
    this.isCancelled = true;
    this.request.abort();
    return isCancelled();
  }
  
  public boolean isCancelled()
  {
    if (this.isCancelled) {
      sendCancelNotification();
    }
    return this.isCancelled;
  }
  
  public boolean isDone()
  {
    return (isCancelled()) || (this.isFinished);
  }
  
  public void onPostProcessRequest(AsyncHttpRequest paramAsyncHttpRequest) {}
  
  public void onPreProcessRequest(AsyncHttpRequest paramAsyncHttpRequest) {}
  
  public void run()
  {
    if (isCancelled()) {}
    for (;;)
    {
      return;
      if (!this.isRequestPreProcessed)
      {
        this.isRequestPreProcessed = true;
        onPreProcessRequest(this);
      }
      if (isCancelled()) {
        continue;
      }
      if (this.responseHandler != null) {
        this.responseHandler.sendStartMessage();
      }
      if (isCancelled()) {
        continue;
      }
      try
      {
        makeRequestWithRetries();
        if (isCancelled()) {
          continue;
        }
        if (this.responseHandler != null) {
          this.responseHandler.sendFinishMessage();
        }
        if (isCancelled()) {
          continue;
        }
        onPostProcessRequest(this);
        this.isFinished = true;
        return;
      }
      catch (IOException localIOException)
      {
        for (;;)
        {
          if ((!isCancelled()) && (this.responseHandler != null)) {
            this.responseHandler.sendFailureMessage(0, null, null, localIOException);
          } else {
            Log.e("AsyncHttpRequest", "makeRequestWithRetries returned error, but handler is null", localIOException);
          }
        }
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/loopj/android/http/AsyncHttpRequest.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */