package com.android.volley;

import android.annotation.TargetApi;
import android.net.TrafficStats;
import android.os.Build.VERSION;
import java.util.concurrent.BlockingQueue;

public class NetworkDispatcher
  extends Thread
{
  private final Cache mCache;
  private final ResponseDelivery mDelivery;
  private final Network mNetwork;
  private final BlockingQueue<Request<?>> mQueue;
  private volatile boolean mQuit = false;
  
  public NetworkDispatcher(BlockingQueue<Request<?>> paramBlockingQueue, Network paramNetwork, Cache paramCache, ResponseDelivery paramResponseDelivery)
  {
    this.mQueue = paramBlockingQueue;
    this.mNetwork = paramNetwork;
    this.mCache = paramCache;
    this.mDelivery = paramResponseDelivery;
  }
  
  @TargetApi(14)
  private void addTrafficStatsTag(Request<?> paramRequest)
  {
    if (Build.VERSION.SDK_INT >= 14) {
      TrafficStats.setThreadStatsTag(paramRequest.getTrafficStatsTag());
    }
  }
  
  private void parseAndDeliverNetworkError(Request<?> paramRequest, VolleyError paramVolleyError)
  {
    VolleyError localVolleyError = paramRequest.parseNetworkError(paramVolleyError);
    this.mDelivery.postError(paramRequest, localVolleyError);
  }
  
  public void quit()
  {
    this.mQuit = true;
    interrupt();
  }
  
  /* Error */
  public void run()
  {
    // Byte code:
    //   0: bipush 10
    //   2: invokestatic 80	android/os/Process:setThreadPriority	(I)V
    //   5: invokestatic 86	android/os/SystemClock:elapsedRealtime	()J
    //   8: lstore_1
    //   9: aload_0
    //   10: getfield 24	com/android/volley/NetworkDispatcher:mQueue	Ljava/util/concurrent/BlockingQueue;
    //   13: invokeinterface 92 1 0
    //   18: checkcast 43	com/android/volley/Request
    //   21: astore 4
    //   23: aload 4
    //   25: ldc 94
    //   27: invokevirtual 98	com/android/volley/Request:addMarker	(Ljava/lang/String;)V
    //   30: aload 4
    //   32: invokevirtual 102	com/android/volley/Request:isCanceled	()Z
    //   35: ifeq +45 -> 80
    //   38: aload 4
    //   40: ldc 104
    //   42: invokevirtual 107	com/android/volley/Request:finish	(Ljava/lang/String;)V
    //   45: goto -40 -> 5
    //   48: astore 8
    //   50: aload 8
    //   52: invokestatic 86	android/os/SystemClock:elapsedRealtime	()J
    //   55: lload_1
    //   56: lsub
    //   57: invokevirtual 111	com/android/volley/VolleyError:setNetworkTimeMs	(J)V
    //   60: aload_0
    //   61: aload 4
    //   63: aload 8
    //   65: invokespecial 113	com/android/volley/NetworkDispatcher:parseAndDeliverNetworkError	(Lcom/android/volley/Request;Lcom/android/volley/VolleyError;)V
    //   68: goto -63 -> 5
    //   71: astore_3
    //   72: aload_0
    //   73: getfield 22	com/android/volley/NetworkDispatcher:mQuit	Z
    //   76: ifeq -71 -> 5
    //   79: return
    //   80: aload_0
    //   81: aload 4
    //   83: invokespecial 115	com/android/volley/NetworkDispatcher:addTrafficStatsTag	(Lcom/android/volley/Request;)V
    //   86: aload_0
    //   87: getfield 26	com/android/volley/NetworkDispatcher:mNetwork	Lcom/android/volley/Network;
    //   90: aload 4
    //   92: invokeinterface 121 2 0
    //   97: astore 9
    //   99: aload 4
    //   101: ldc 123
    //   103: invokevirtual 98	com/android/volley/Request:addMarker	(Ljava/lang/String;)V
    //   106: aload 9
    //   108: getfield 128	com/android/volley/NetworkResponse:notModified	Z
    //   111: ifeq +84 -> 195
    //   114: aload 4
    //   116: invokevirtual 131	com/android/volley/Request:hasHadResponseDelivered	()Z
    //   119: ifeq +76 -> 195
    //   122: aload 4
    //   124: ldc -123
    //   126: invokevirtual 107	com/android/volley/Request:finish	(Ljava/lang/String;)V
    //   129: goto -124 -> 5
    //   132: astore 5
    //   134: iconst_1
    //   135: anewarray 135	java/lang/Object
    //   138: astore 6
    //   140: aload 6
    //   142: iconst_0
    //   143: aload 5
    //   145: invokevirtual 139	java/lang/Exception:toString	()Ljava/lang/String;
    //   148: aastore
    //   149: aload 5
    //   151: ldc -115
    //   153: aload 6
    //   155: invokestatic 147	com/android/volley/VolleyLog:e	(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    //   158: new 73	com/android/volley/VolleyError
    //   161: dup
    //   162: aload 5
    //   164: invokespecial 150	com/android/volley/VolleyError:<init>	(Ljava/lang/Throwable;)V
    //   167: astore 7
    //   169: aload 7
    //   171: invokestatic 86	android/os/SystemClock:elapsedRealtime	()J
    //   174: lload_1
    //   175: lsub
    //   176: invokevirtual 111	com/android/volley/VolleyError:setNetworkTimeMs	(J)V
    //   179: aload_0
    //   180: getfield 30	com/android/volley/NetworkDispatcher:mDelivery	Lcom/android/volley/ResponseDelivery;
    //   183: aload 4
    //   185: aload 7
    //   187: invokeinterface 64 3 0
    //   192: goto -187 -> 5
    //   195: aload 4
    //   197: aload 9
    //   199: invokevirtual 154	com/android/volley/Request:parseNetworkResponse	(Lcom/android/volley/NetworkResponse;)Lcom/android/volley/Response;
    //   202: astore 10
    //   204: aload 4
    //   206: ldc -100
    //   208: invokevirtual 98	com/android/volley/Request:addMarker	(Ljava/lang/String;)V
    //   211: aload 4
    //   213: invokevirtual 159	com/android/volley/Request:shouldCache	()Z
    //   216: ifeq +37 -> 253
    //   219: aload 10
    //   221: getfield 165	com/android/volley/Response:cacheEntry	Lcom/android/volley/Cache$Entry;
    //   224: ifnull +29 -> 253
    //   227: aload_0
    //   228: getfield 28	com/android/volley/NetworkDispatcher:mCache	Lcom/android/volley/Cache;
    //   231: aload 4
    //   233: invokevirtual 168	com/android/volley/Request:getCacheKey	()Ljava/lang/String;
    //   236: aload 10
    //   238: getfield 165	com/android/volley/Response:cacheEntry	Lcom/android/volley/Cache$Entry;
    //   241: invokeinterface 174 3 0
    //   246: aload 4
    //   248: ldc -80
    //   250: invokevirtual 98	com/android/volley/Request:addMarker	(Ljava/lang/String;)V
    //   253: aload 4
    //   255: invokevirtual 179	com/android/volley/Request:markDelivered	()V
    //   258: aload_0
    //   259: getfield 30	com/android/volley/NetworkDispatcher:mDelivery	Lcom/android/volley/ResponseDelivery;
    //   262: aload 4
    //   264: aload 10
    //   266: invokeinterface 183 3 0
    //   271: goto -266 -> 5
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	274	0	this	NetworkDispatcher
    //   8	167	1	l	long
    //   71	1	3	localInterruptedException	InterruptedException
    //   21	242	4	localRequest	Request
    //   132	31	5	localException	Exception
    //   138	16	6	arrayOfObject	Object[]
    //   167	19	7	localVolleyError1	VolleyError
    //   48	16	8	localVolleyError2	VolleyError
    //   97	101	9	localNetworkResponse	NetworkResponse
    //   202	63	10	localResponse	Response
    // Exception table:
    //   from	to	target	type
    //   23	45	48	com/android/volley/VolleyError
    //   80	129	48	com/android/volley/VolleyError
    //   195	253	48	com/android/volley/VolleyError
    //   253	271	48	com/android/volley/VolleyError
    //   9	23	71	java/lang/InterruptedException
    //   23	45	132	java/lang/Exception
    //   80	129	132	java/lang/Exception
    //   195	253	132	java/lang/Exception
    //   253	271	132	java/lang/Exception
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/android/volley/NetworkDispatcher.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */