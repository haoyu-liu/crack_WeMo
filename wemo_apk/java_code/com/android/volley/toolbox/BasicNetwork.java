package com.android.volley.toolbox;

import android.os.SystemClock;
import com.android.volley.Cache.Entry;
import com.android.volley.Network;
import com.android.volley.Request;
import com.android.volley.RetryPolicy;
import com.android.volley.ServerError;
import com.android.volley.VolleyError;
import com.android.volley.VolleyLog;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.Map;
import java.util.TreeMap;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.StatusLine;
import org.apache.http.impl.cookie.DateUtils;

public class BasicNetwork
  implements Network
{
  protected static final boolean DEBUG = VolleyLog.DEBUG;
  private static int DEFAULT_POOL_SIZE = 4096;
  private static int SLOW_REQUEST_THRESHOLD_MS = 3000;
  protected final HttpStack mHttpStack;
  protected final ByteArrayPool mPool;
  
  public BasicNetwork(HttpStack paramHttpStack)
  {
    this(paramHttpStack, new ByteArrayPool(DEFAULT_POOL_SIZE));
  }
  
  public BasicNetwork(HttpStack paramHttpStack, ByteArrayPool paramByteArrayPool)
  {
    this.mHttpStack = paramHttpStack;
    this.mPool = paramByteArrayPool;
  }
  
  private void addCacheHeaders(Map<String, String> paramMap, Cache.Entry paramEntry)
  {
    if (paramEntry == null) {}
    do
    {
      return;
      if (paramEntry.etag != null) {
        paramMap.put("If-None-Match", paramEntry.etag);
      }
    } while (paramEntry.lastModified <= 0L);
    paramMap.put("If-Modified-Since", DateUtils.formatDate(new Date(paramEntry.lastModified)));
  }
  
  private static void attemptRetryOnException(String paramString, Request<?> paramRequest, VolleyError paramVolleyError)
    throws VolleyError
  {
    RetryPolicy localRetryPolicy = paramRequest.getRetryPolicy();
    int i = paramRequest.getTimeoutMs();
    try
    {
      localRetryPolicy.retry(paramVolleyError);
      Object[] arrayOfObject2 = new Object[2];
      arrayOfObject2[0] = paramString;
      arrayOfObject2[1] = Integer.valueOf(i);
      paramRequest.addMarker(String.format("%s-retry [timeout=%s]", arrayOfObject2));
      return;
    }
    catch (VolleyError localVolleyError)
    {
      Object[] arrayOfObject1 = new Object[2];
      arrayOfObject1[0] = paramString;
      arrayOfObject1[1] = Integer.valueOf(i);
      paramRequest.addMarker(String.format("%s-timeout-giveup [timeout=%s]", arrayOfObject1));
      throw localVolleyError;
    }
  }
  
  protected static Map<String, String> convertHeaders(Header[] paramArrayOfHeader)
  {
    TreeMap localTreeMap = new TreeMap(String.CASE_INSENSITIVE_ORDER);
    for (int i = 0; i < paramArrayOfHeader.length; i++) {
      localTreeMap.put(paramArrayOfHeader[i].getName(), paramArrayOfHeader[i].getValue());
    }
    return localTreeMap;
  }
  
  private byte[] entityToBytes(HttpEntity paramHttpEntity)
    throws IOException, ServerError
  {
    PoolingByteArrayOutputStream localPoolingByteArrayOutputStream = new PoolingByteArrayOutputStream(this.mPool, (int)paramHttpEntity.getContentLength());
    byte[] arrayOfByte1 = null;
    InputStream localInputStream;
    try
    {
      localInputStream = paramHttpEntity.getContent();
      arrayOfByte1 = null;
      if (localInputStream == null) {
        throw new ServerError();
      }
    }
    finally {}
    try
    {
      paramHttpEntity.consumeContent();
      this.mPool.returnBuf(arrayOfByte1);
      localPoolingByteArrayOutputStream.close();
      throw ((Throwable)localObject);
      arrayOfByte1 = this.mPool.getBuf(1024);
      for (;;)
      {
        int i = localInputStream.read(arrayOfByte1);
        if (i == -1) {
          break;
        }
        localPoolingByteArrayOutputStream.write(arrayOfByte1, 0, i);
      }
      byte[] arrayOfByte2 = localPoolingByteArrayOutputStream.toByteArray();
      try
      {
        paramHttpEntity.consumeContent();
        this.mPool.returnBuf(arrayOfByte1);
        localPoolingByteArrayOutputStream.close();
        return arrayOfByte2;
      }
      catch (IOException localIOException2)
      {
        for (;;)
        {
          VolleyLog.v("Error occured when calling consumingContent", new Object[0]);
        }
      }
    }
    catch (IOException localIOException1)
    {
      for (;;)
      {
        VolleyLog.v("Error occured when calling consumingContent", new Object[0]);
      }
    }
  }
  
  private void logSlowRequests(long paramLong, Request<?> paramRequest, byte[] paramArrayOfByte, StatusLine paramStatusLine)
  {
    Object[] arrayOfObject;
    if ((DEBUG) || (paramLong > SLOW_REQUEST_THRESHOLD_MS))
    {
      arrayOfObject = new Object[5];
      arrayOfObject[0] = paramRequest;
      arrayOfObject[1] = Long.valueOf(paramLong);
      if (paramArrayOfByte == null) {
        break label91;
      }
    }
    label91:
    for (Object localObject = Integer.valueOf(paramArrayOfByte.length);; localObject = "null")
    {
      arrayOfObject[2] = localObject;
      arrayOfObject[3] = Integer.valueOf(paramStatusLine.getStatusCode());
      arrayOfObject[4] = Integer.valueOf(paramRequest.getRetryPolicy().getCurrentRetryCount());
      VolleyLog.d("HTTP response for request=<%s> [lifetime=%d], [size=%s], [rc=%d], [retryCount=%s]", arrayOfObject);
      return;
    }
  }
  
  protected void logError(String paramString1, String paramString2, long paramLong)
  {
    long l = SystemClock.elapsedRealtime();
    Object[] arrayOfObject = new Object[3];
    arrayOfObject[0] = paramString1;
    arrayOfObject[1] = Long.valueOf(l - paramLong);
    arrayOfObject[2] = paramString2;
    VolleyLog.v("HTTP ERROR(%s) %d ms to fetch %s", arrayOfObject);
  }
  
  /* Error */
  public com.android.volley.NetworkResponse performRequest(Request<?> paramRequest)
    throws VolleyError
  {
    // Byte code:
    //   0: invokestatic 220	android/os/SystemClock:elapsedRealtime	()J
    //   3: lstore_2
    //   4: aconst_null
    //   5: astore 4
    //   7: invokestatic 236	java/util/Collections:emptyMap	()Ljava/util/Map;
    //   10: astore 5
    //   12: new 238	java/util/HashMap
    //   15: dup
    //   16: invokespecial 239	java/util/HashMap:<init>	()V
    //   19: astore 6
    //   21: aload_0
    //   22: aload 6
    //   24: aload_1
    //   25: invokevirtual 243	com/android/volley/Request:getCacheEntry	()Lcom/android/volley/Cache$Entry;
    //   28: invokespecial 245	com/android/volley/toolbox/BasicNetwork:addCacheHeaders	(Ljava/util/Map;Lcom/android/volley/Cache$Entry;)V
    //   31: aload_0
    //   32: getfield 40	com/android/volley/toolbox/BasicNetwork:mHttpStack	Lcom/android/volley/toolbox/HttpStack;
    //   35: aload_1
    //   36: aload 6
    //   38: invokeinterface 250 3 0
    //   43: astore 4
    //   45: aload 4
    //   47: invokeinterface 256 1 0
    //   52: astore 17
    //   54: aload 17
    //   56: invokeinterface 203 1 0
    //   61: istore 18
    //   63: aload 4
    //   65: invokeinterface 260 1 0
    //   70: invokestatic 262	com/android/volley/toolbox/BasicNetwork:convertHeaders	([Lorg/apache/http/Header;)Ljava/util/Map;
    //   73: astore 5
    //   75: iload 18
    //   77: sipush 304
    //   80: if_icmpne +73 -> 153
    //   83: aload_1
    //   84: invokevirtual 243	com/android/volley/Request:getCacheEntry	()Lcom/android/volley/Cache$Entry;
    //   87: astore 19
    //   89: aload 19
    //   91: ifnonnull +23 -> 114
    //   94: new 264	com/android/volley/NetworkResponse
    //   97: dup
    //   98: sipush 304
    //   101: aconst_null
    //   102: aload 5
    //   104: iconst_1
    //   105: invokestatic 220	android/os/SystemClock:elapsedRealtime	()J
    //   108: lload_2
    //   109: lsub
    //   110: invokespecial 267	com/android/volley/NetworkResponse:<init>	(I[BLjava/util/Map;ZJ)V
    //   113: areturn
    //   114: aload 19
    //   116: getfield 271	com/android/volley/Cache$Entry:responseHeaders	Ljava/util/Map;
    //   119: aload 5
    //   121: invokeinterface 275 2 0
    //   126: new 264	com/android/volley/NetworkResponse
    //   129: dup
    //   130: sipush 304
    //   133: aload 19
    //   135: getfield 279	com/android/volley/Cache$Entry:data	[B
    //   138: aload 19
    //   140: getfield 271	com/android/volley/Cache$Entry:responseHeaders	Ljava/util/Map;
    //   143: iconst_1
    //   144: invokestatic 220	android/os/SystemClock:elapsedRealtime	()J
    //   147: lload_2
    //   148: lsub
    //   149: invokespecial 267	com/android/volley/NetworkResponse:<init>	(I[BLjava/util/Map;ZJ)V
    //   152: areturn
    //   153: aload 4
    //   155: invokeinterface 283 1 0
    //   160: ifnull +77 -> 237
    //   163: aload_0
    //   164: aload 4
    //   166: invokeinterface 283 1 0
    //   171: invokespecial 285	com/android/volley/toolbox/BasicNetwork:entityToBytes	(Lorg/apache/http/HttpEntity;)[B
    //   174: astore 25
    //   176: aload 25
    //   178: astore 9
    //   180: aload_0
    //   181: invokestatic 220	android/os/SystemClock:elapsedRealtime	()J
    //   184: lload_2
    //   185: lsub
    //   186: aload_1
    //   187: aload 9
    //   189: aload 17
    //   191: invokespecial 287	com/android/volley/toolbox/BasicNetwork:logSlowRequests	(JLcom/android/volley/Request;[BLorg/apache/http/StatusLine;)V
    //   194: iload 18
    //   196: sipush 200
    //   199: if_icmplt +11 -> 210
    //   202: iload 18
    //   204: sipush 299
    //   207: if_icmple +38 -> 245
    //   210: new 139	java/io/IOException
    //   213: dup
    //   214: invokespecial 288	java/io/IOException:<init>	()V
    //   217: athrow
    //   218: astore 21
    //   220: ldc_w 290
    //   223: aload_1
    //   224: new 292	com/android/volley/TimeoutError
    //   227: dup
    //   228: invokespecial 293	com/android/volley/TimeoutError:<init>	()V
    //   231: invokestatic 295	com/android/volley/toolbox/BasicNetwork:attemptRetryOnException	(Ljava/lang/String;Lcom/android/volley/Request;Lcom/android/volley/VolleyError;)V
    //   234: goto -230 -> 4
    //   237: iconst_0
    //   238: newarray <illegal type>
    //   240: astore 9
    //   242: goto -62 -> 180
    //   245: invokestatic 220	android/os/SystemClock:elapsedRealtime	()J
    //   248: lload_2
    //   249: lsub
    //   250: lstore 22
    //   252: new 264	com/android/volley/NetworkResponse
    //   255: dup
    //   256: iload 18
    //   258: aload 9
    //   260: aload 5
    //   262: iconst_0
    //   263: lload 22
    //   265: invokespecial 267	com/android/volley/NetworkResponse:<init>	(I[BLjava/util/Map;ZJ)V
    //   268: astore 24
    //   270: aload 24
    //   272: areturn
    //   273: astore 16
    //   275: ldc_w 297
    //   278: aload_1
    //   279: new 292	com/android/volley/TimeoutError
    //   282: dup
    //   283: invokespecial 293	com/android/volley/TimeoutError:<init>	()V
    //   286: invokestatic 295	com/android/volley/toolbox/BasicNetwork:attemptRetryOnException	(Ljava/lang/String;Lcom/android/volley/Request;Lcom/android/volley/VolleyError;)V
    //   289: goto -285 -> 4
    //   292: astore 15
    //   294: new 299	java/lang/RuntimeException
    //   297: dup
    //   298: new 301	java/lang/StringBuilder
    //   301: dup
    //   302: invokespecial 302	java/lang/StringBuilder:<init>	()V
    //   305: ldc_w 304
    //   308: invokevirtual 308	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   311: aload_1
    //   312: invokevirtual 311	com/android/volley/Request:getUrl	()Ljava/lang/String;
    //   315: invokevirtual 308	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   318: invokevirtual 314	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   321: aload 15
    //   323: invokespecial 317	java/lang/RuntimeException:<init>	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   326: athrow
    //   327: astore 8
    //   329: aconst_null
    //   330: astore 9
    //   332: aload 4
    //   334: ifnull +113 -> 447
    //   337: aload 4
    //   339: invokeinterface 256 1 0
    //   344: invokeinterface 203 1 0
    //   349: istore 10
    //   351: iconst_2
    //   352: anewarray 4	java/lang/Object
    //   355: astore 11
    //   357: aload 11
    //   359: iconst_0
    //   360: iload 10
    //   362: invokestatic 101	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   365: aastore
    //   366: aload 11
    //   368: iconst_1
    //   369: aload_1
    //   370: invokevirtual 311	com/android/volley/Request:getUrl	()Ljava/lang/String;
    //   373: aastore
    //   374: ldc_w 319
    //   377: aload 11
    //   379: invokestatic 322	com/android/volley/VolleyLog:e	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   382: aload 9
    //   384: ifnull +83 -> 467
    //   387: invokestatic 220	android/os/SystemClock:elapsedRealtime	()J
    //   390: lload_2
    //   391: lsub
    //   392: lstore 12
    //   394: new 264	com/android/volley/NetworkResponse
    //   397: dup
    //   398: iload 10
    //   400: aload 9
    //   402: aload 5
    //   404: iconst_0
    //   405: lload 12
    //   407: invokespecial 267	com/android/volley/NetworkResponse:<init>	(I[BLjava/util/Map;ZJ)V
    //   410: astore 14
    //   412: iload 10
    //   414: sipush 401
    //   417: if_icmpeq +11 -> 428
    //   420: iload 10
    //   422: sipush 403
    //   425: if_icmpne +32 -> 457
    //   428: ldc_w 324
    //   431: aload_1
    //   432: new 326	com/android/volley/AuthFailureError
    //   435: dup
    //   436: aload 14
    //   438: invokespecial 329	com/android/volley/AuthFailureError:<init>	(Lcom/android/volley/NetworkResponse;)V
    //   441: invokestatic 295	com/android/volley/toolbox/BasicNetwork:attemptRetryOnException	(Ljava/lang/String;Lcom/android/volley/Request;Lcom/android/volley/VolleyError;)V
    //   444: goto -440 -> 4
    //   447: new 331	com/android/volley/NoConnectionError
    //   450: dup
    //   451: aload 8
    //   453: invokespecial 334	com/android/volley/NoConnectionError:<init>	(Ljava/lang/Throwable;)V
    //   456: athrow
    //   457: new 141	com/android/volley/ServerError
    //   460: dup
    //   461: aload 14
    //   463: invokespecial 335	com/android/volley/ServerError:<init>	(Lcom/android/volley/NetworkResponse;)V
    //   466: athrow
    //   467: new 337	com/android/volley/NetworkError
    //   470: dup
    //   471: aconst_null
    //   472: invokespecial 338	com/android/volley/NetworkError:<init>	(Lcom/android/volley/NetworkResponse;)V
    //   475: athrow
    //   476: astore 8
    //   478: goto -146 -> 332
    //   481: astore 15
    //   483: goto -189 -> 294
    //   486: astore 20
    //   488: goto -213 -> 275
    //   491: astore 7
    //   493: goto -273 -> 220
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	496	0	this	BasicNetwork
    //   0	496	1	paramRequest	Request<?>
    //   3	388	2	l1	long
    //   5	333	4	localHttpResponse	org.apache.http.HttpResponse
    //   10	393	5	localMap	Map
    //   19	18	6	localHashMap	java.util.HashMap
    //   491	1	7	localSocketTimeoutException1	java.net.SocketTimeoutException
    //   327	125	8	localIOException1	IOException
    //   476	1	8	localIOException2	IOException
    //   178	223	9	arrayOfByte1	byte[]
    //   349	77	10	i	int
    //   355	23	11	arrayOfObject	Object[]
    //   392	14	12	l2	long
    //   410	52	14	localNetworkResponse1	com.android.volley.NetworkResponse
    //   292	30	15	localMalformedURLException1	java.net.MalformedURLException
    //   481	1	15	localMalformedURLException2	java.net.MalformedURLException
    //   273	1	16	localConnectTimeoutException1	org.apache.http.conn.ConnectTimeoutException
    //   52	138	17	localStatusLine	StatusLine
    //   61	196	18	j	int
    //   87	52	19	localEntry	Cache.Entry
    //   486	1	20	localConnectTimeoutException2	org.apache.http.conn.ConnectTimeoutException
    //   218	1	21	localSocketTimeoutException2	java.net.SocketTimeoutException
    //   250	14	22	l3	long
    //   268	3	24	localNetworkResponse2	com.android.volley.NetworkResponse
    //   174	3	25	arrayOfByte2	byte[]
    // Exception table:
    //   from	to	target	type
    //   180	194	218	java/net/SocketTimeoutException
    //   210	218	218	java/net/SocketTimeoutException
    //   245	270	218	java/net/SocketTimeoutException
    //   12	75	273	org/apache/http/conn/ConnectTimeoutException
    //   83	89	273	org/apache/http/conn/ConnectTimeoutException
    //   94	114	273	org/apache/http/conn/ConnectTimeoutException
    //   114	153	273	org/apache/http/conn/ConnectTimeoutException
    //   153	176	273	org/apache/http/conn/ConnectTimeoutException
    //   237	242	273	org/apache/http/conn/ConnectTimeoutException
    //   12	75	292	java/net/MalformedURLException
    //   83	89	292	java/net/MalformedURLException
    //   94	114	292	java/net/MalformedURLException
    //   114	153	292	java/net/MalformedURLException
    //   153	176	292	java/net/MalformedURLException
    //   237	242	292	java/net/MalformedURLException
    //   12	75	327	java/io/IOException
    //   83	89	327	java/io/IOException
    //   94	114	327	java/io/IOException
    //   114	153	327	java/io/IOException
    //   153	176	327	java/io/IOException
    //   237	242	327	java/io/IOException
    //   180	194	476	java/io/IOException
    //   210	218	476	java/io/IOException
    //   245	270	476	java/io/IOException
    //   180	194	481	java/net/MalformedURLException
    //   210	218	481	java/net/MalformedURLException
    //   245	270	481	java/net/MalformedURLException
    //   180	194	486	org/apache/http/conn/ConnectTimeoutException
    //   210	218	486	org/apache/http/conn/ConnectTimeoutException
    //   245	270	486	org/apache/http/conn/ConnectTimeoutException
    //   12	75	491	java/net/SocketTimeoutException
    //   83	89	491	java/net/SocketTimeoutException
    //   94	114	491	java/net/SocketTimeoutException
    //   114	153	491	java/net/SocketTimeoutException
    //   153	176	491	java/net/SocketTimeoutException
    //   237	242	491	java/net/SocketTimeoutException
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/android/volley/toolbox/BasicNetwork.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */