package com.loopj.android.http;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.util.Log;
import java.io.IOException;
import java.net.URI;
import org.apache.http.Header;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.client.HttpResponseException;

public abstract class AsyncHttpResponseHandler
  implements ResponseHandlerInterface
{
  protected static final int BUFFER_SIZE = 4096;
  protected static final int CANCEL_MESSAGE = 6;
  public static final String DEFAULT_CHARSET = "UTF-8";
  protected static final int FAILURE_MESSAGE = 1;
  protected static final int FINISH_MESSAGE = 3;
  private static final String LOG_TAG = "AsyncHttpResponseHandler";
  protected static final int PROGRESS_MESSAGE = 4;
  protected static final int RETRY_MESSAGE = 5;
  protected static final int START_MESSAGE = 2;
  protected static final int SUCCESS_MESSAGE = 0;
  public static final String UTF8_BOM = "﻿";
  private Handler handler;
  private Looper looper = null;
  private Header[] requestHeaders = null;
  private URI requestURI = null;
  private String responseCharset = "UTF-8";
  private boolean useSynchronousMode;
  
  public AsyncHttpResponseHandler()
  {
    this(null);
  }
  
  public AsyncHttpResponseHandler(Looper paramLooper)
  {
    if (paramLooper == null) {
      paramLooper = Looper.myLooper();
    }
    this.looper = paramLooper;
    setUseSynchronousMode(false);
  }
  
  public String getCharset()
  {
    if (this.responseCharset == null) {
      return "UTF-8";
    }
    return this.responseCharset;
  }
  
  public Header[] getRequestHeaders()
  {
    return this.requestHeaders;
  }
  
  public URI getRequestURI()
  {
    return this.requestURI;
  }
  
  /* Error */
  byte[] getResponseData(org.apache.http.HttpEntity paramHttpEntity)
    throws IOException
  {
    // Byte code:
    //   0: sipush 4096
    //   3: istore_2
    //   4: aconst_null
    //   5: astore_3
    //   6: aload_1
    //   7: ifnull +197 -> 204
    //   10: aload_1
    //   11: invokeinterface 87 1 0
    //   16: astore 4
    //   18: aconst_null
    //   19: astore_3
    //   20: aload 4
    //   22: ifnull +182 -> 204
    //   25: aload_1
    //   26: invokeinterface 91 1 0
    //   31: lstore 5
    //   33: lload 5
    //   35: ldc2_w 92
    //   38: lcmp
    //   39: ifle +13 -> 52
    //   42: new 95	java/lang/IllegalArgumentException
    //   45: dup
    //   46: ldc 97
    //   48: invokespecial 100	java/lang/IllegalArgumentException:<init>	(Ljava/lang/String;)V
    //   51: athrow
    //   52: lload 5
    //   54: lconst_0
    //   55: lcmp
    //   56: ifgt +115 -> 171
    //   59: new 102	org/apache/http/util/ByteArrayBuffer
    //   62: dup
    //   63: iload_2
    //   64: invokespecial 105	org/apache/http/util/ByteArrayBuffer:<init>	(I)V
    //   67: astore 7
    //   69: sipush 4096
    //   72: newarray <illegal type>
    //   74: astore 10
    //   76: iconst_0
    //   77: istore 11
    //   79: aload 4
    //   81: aload 10
    //   83: invokevirtual 111	java/io/InputStream:read	([B)I
    //   86: istore 12
    //   88: iload 12
    //   90: iconst_m1
    //   91: if_icmpeq +94 -> 185
    //   94: invokestatic 117	java/lang/Thread:currentThread	()Ljava/lang/Thread;
    //   97: invokevirtual 121	java/lang/Thread:isInterrupted	()Z
    //   100: ifne +85 -> 185
    //   103: iload 11
    //   105: iload 12
    //   107: iadd
    //   108: istore 11
    //   110: aload 7
    //   112: aload 10
    //   114: iconst_0
    //   115: iload 12
    //   117: invokevirtual 125	org/apache/http/util/ByteArrayBuffer:append	([BII)V
    //   120: lload 5
    //   122: lconst_0
    //   123: lcmp
    //   124: ifgt +54 -> 178
    //   127: lconst_1
    //   128: lstore 13
    //   130: aload_0
    //   131: iload 11
    //   133: lload 13
    //   135: l2i
    //   136: invokevirtual 129	com/loopj/android/http/AsyncHttpResponseHandler:sendProgressMessage	(II)V
    //   139: goto -60 -> 79
    //   142: astore 8
    //   144: aload 4
    //   146: invokestatic 135	com/loopj/android/http/AsyncHttpClient:silentCloseInputStream	(Ljava/io/InputStream;)V
    //   149: aload_1
    //   150: invokestatic 139	com/loopj/android/http/AsyncHttpClient:endEntityViaReflection	(Lorg/apache/http/HttpEntity;)V
    //   153: aload 8
    //   155: athrow
    //   156: astore 9
    //   158: invokestatic 144	java/lang/System:gc	()V
    //   161: new 79	java/io/IOException
    //   164: dup
    //   165: ldc -110
    //   167: invokespecial 147	java/io/IOException:<init>	(Ljava/lang/String;)V
    //   170: athrow
    //   171: lload 5
    //   173: l2i
    //   174: istore_2
    //   175: goto -116 -> 59
    //   178: lload 5
    //   180: lstore 13
    //   182: goto -52 -> 130
    //   185: aload 4
    //   187: invokestatic 135	com/loopj/android/http/AsyncHttpClient:silentCloseInputStream	(Ljava/io/InputStream;)V
    //   190: aload_1
    //   191: invokestatic 139	com/loopj/android/http/AsyncHttpClient:endEntityViaReflection	(Lorg/apache/http/HttpEntity;)V
    //   194: aload 7
    //   196: invokevirtual 151	org/apache/http/util/ByteArrayBuffer:toByteArray	()[B
    //   199: astore 15
    //   201: aload 15
    //   203: astore_3
    //   204: aload_3
    //   205: areturn
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	206	0	this	AsyncHttpResponseHandler
    //   0	206	1	paramHttpEntity	org.apache.http.HttpEntity
    //   3	172	2	i	int
    //   5	200	3	localObject1	Object
    //   16	170	4	localInputStream	java.io.InputStream
    //   31	148	5	l1	long
    //   67	128	7	localByteArrayBuffer	org.apache.http.util.ByteArrayBuffer
    //   142	12	8	localObject2	Object
    //   156	1	9	localOutOfMemoryError	OutOfMemoryError
    //   74	39	10	arrayOfByte1	byte[]
    //   77	55	11	j	int
    //   86	30	12	k	int
    //   128	53	13	l2	long
    //   199	3	15	arrayOfByte2	byte[]
    // Exception table:
    //   from	to	target	type
    //   69	76	142	finally
    //   79	88	142	finally
    //   94	103	142	finally
    //   110	120	142	finally
    //   130	139	142	finally
    //   59	69	156	java/lang/OutOfMemoryError
    //   144	156	156	java/lang/OutOfMemoryError
    //   185	201	156	java/lang/OutOfMemoryError
  }
  
  public boolean getUseSynchronousMode()
  {
    return this.useSynchronousMode;
  }
  
  protected void handleMessage(Message paramMessage)
  {
    switch (paramMessage.what)
    {
    default: 
      return;
    case 0: 
      Object[] arrayOfObject4 = (Object[])paramMessage.obj;
      if ((arrayOfObject4 != null) && (arrayOfObject4.length >= 3))
      {
        onSuccess(((Integer)arrayOfObject4[0]).intValue(), (Header[])arrayOfObject4[1], (byte[])arrayOfObject4[2]);
        return;
      }
      Log.e("AsyncHttpResponseHandler", "SUCCESS_MESSAGE didn't got enough params");
      return;
    case 1: 
      Object[] arrayOfObject3 = (Object[])paramMessage.obj;
      if ((arrayOfObject3 != null) && (arrayOfObject3.length >= 4))
      {
        onFailure(((Integer)arrayOfObject3[0]).intValue(), (Header[])arrayOfObject3[1], (byte[])arrayOfObject3[2], (Throwable)arrayOfObject3[3]);
        return;
      }
      Log.e("AsyncHttpResponseHandler", "FAILURE_MESSAGE didn't got enough params");
      return;
    case 2: 
      onStart();
      return;
    case 3: 
      onFinish();
      return;
    case 4: 
      Object[] arrayOfObject2 = (Object[])paramMessage.obj;
      if ((arrayOfObject2 != null) && (arrayOfObject2.length >= 2)) {
        try
        {
          onProgress(((Integer)arrayOfObject2[0]).intValue(), ((Integer)arrayOfObject2[1]).intValue());
          return;
        }
        catch (Throwable localThrowable)
        {
          Log.e("AsyncHttpResponseHandler", "custom onProgress contains an error", localThrowable);
          return;
        }
      }
      Log.e("AsyncHttpResponseHandler", "PROGRESS_MESSAGE didn't got enough params");
      return;
    case 5: 
      Object[] arrayOfObject1 = (Object[])paramMessage.obj;
      if ((arrayOfObject1 != null) && (arrayOfObject1.length == 1))
      {
        onRetry(((Integer)arrayOfObject1[0]).intValue());
        return;
      }
      Log.e("AsyncHttpResponseHandler", "RETRY_MESSAGE didn't get enough params");
      return;
    }
    onCancel();
  }
  
  protected Message obtainMessage(int paramInt, Object paramObject)
  {
    if (this.handler == null)
    {
      Message localMessage = Message.obtain();
      if (localMessage != null)
      {
        localMessage.what = paramInt;
        localMessage.obj = paramObject;
      }
      return localMessage;
    }
    return Message.obtain(this.handler, paramInt, paramObject);
  }
  
  public void onCancel()
  {
    Log.d("AsyncHttpResponseHandler", "Request got cancelled");
  }
  
  public abstract void onFailure(int paramInt, Header[] paramArrayOfHeader, byte[] paramArrayOfByte, Throwable paramThrowable);
  
  public void onFinish() {}
  
  public void onPostProcessResponse(ResponseHandlerInterface paramResponseHandlerInterface, HttpResponse paramHttpResponse) {}
  
  public void onPreProcessResponse(ResponseHandlerInterface paramResponseHandlerInterface, HttpResponse paramHttpResponse) {}
  
  public void onProgress(int paramInt1, int paramInt2)
  {
    Object[] arrayOfObject = new Object[3];
    arrayOfObject[0] = Integer.valueOf(paramInt1);
    arrayOfObject[1] = Integer.valueOf(paramInt2);
    if (paramInt2 > 0) {}
    for (double d = 100.0D * (1.0D * paramInt1 / paramInt2);; d = -1.0D)
    {
      arrayOfObject[2] = Double.valueOf(d);
      Log.v("AsyncHttpResponseHandler", String.format("Progress %d from %d (%2.0f%%)", arrayOfObject));
      return;
    }
  }
  
  public void onRetry(int paramInt)
  {
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = Integer.valueOf(paramInt);
    Log.d("AsyncHttpResponseHandler", String.format("Request retry no. %d", arrayOfObject));
  }
  
  public void onStart() {}
  
  public abstract void onSuccess(int paramInt, Header[] paramArrayOfHeader, byte[] paramArrayOfByte);
  
  protected void postRunnable(Runnable paramRunnable)
  {
    if (paramRunnable != null)
    {
      if ((getUseSynchronousMode()) || (this.handler == null)) {
        paramRunnable.run();
      }
    }
    else {
      return;
    }
    this.handler.post(paramRunnable);
  }
  
  public final void sendCancelMessage()
  {
    sendMessage(obtainMessage(6, null));
  }
  
  public final void sendFailureMessage(int paramInt, Header[] paramArrayOfHeader, byte[] paramArrayOfByte, Throwable paramThrowable)
  {
    Object[] arrayOfObject = new Object[4];
    arrayOfObject[0] = Integer.valueOf(paramInt);
    arrayOfObject[1] = paramArrayOfHeader;
    arrayOfObject[2] = paramArrayOfByte;
    arrayOfObject[3] = paramThrowable;
    sendMessage(obtainMessage(1, arrayOfObject));
  }
  
  public final void sendFinishMessage()
  {
    sendMessage(obtainMessage(3, null));
  }
  
  protected void sendMessage(Message paramMessage)
  {
    if ((getUseSynchronousMode()) || (this.handler == null)) {
      handleMessage(paramMessage);
    }
    while (Thread.currentThread().isInterrupted()) {
      return;
    }
    this.handler.sendMessage(paramMessage);
  }
  
  public final void sendProgressMessage(int paramInt1, int paramInt2)
  {
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = Integer.valueOf(paramInt1);
    arrayOfObject[1] = Integer.valueOf(paramInt2);
    sendMessage(obtainMessage(4, arrayOfObject));
  }
  
  public void sendResponseMessage(HttpResponse paramHttpResponse)
    throws IOException
  {
    StatusLine localStatusLine;
    byte[] arrayOfByte;
    if (!Thread.currentThread().isInterrupted())
    {
      localStatusLine = paramHttpResponse.getStatusLine();
      arrayOfByte = getResponseData(paramHttpResponse.getEntity());
      if (!Thread.currentThread().isInterrupted())
      {
        if (localStatusLine.getStatusCode() < 300) {
          break label85;
        }
        sendFailureMessage(localStatusLine.getStatusCode(), paramHttpResponse.getAllHeaders(), arrayOfByte, new HttpResponseException(localStatusLine.getStatusCode(), localStatusLine.getReasonPhrase()));
      }
    }
    return;
    label85:
    sendSuccessMessage(localStatusLine.getStatusCode(), paramHttpResponse.getAllHeaders(), arrayOfByte);
  }
  
  public final void sendRetryMessage(int paramInt)
  {
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = Integer.valueOf(paramInt);
    sendMessage(obtainMessage(5, arrayOfObject));
  }
  
  public final void sendStartMessage()
  {
    sendMessage(obtainMessage(2, null));
  }
  
  public final void sendSuccessMessage(int paramInt, Header[] paramArrayOfHeader, byte[] paramArrayOfByte)
  {
    Object[] arrayOfObject = new Object[3];
    arrayOfObject[0] = Integer.valueOf(paramInt);
    arrayOfObject[1] = paramArrayOfHeader;
    arrayOfObject[2] = paramArrayOfByte;
    sendMessage(obtainMessage(0, arrayOfObject));
  }
  
  public void setCharset(String paramString)
  {
    this.responseCharset = paramString;
  }
  
  public void setRequestHeaders(Header[] paramArrayOfHeader)
  {
    this.requestHeaders = paramArrayOfHeader;
  }
  
  public void setRequestURI(URI paramURI)
  {
    this.requestURI = paramURI;
  }
  
  public void setUseSynchronousMode(boolean paramBoolean)
  {
    if ((!paramBoolean) && (this.looper == null)) {
      paramBoolean = true;
    }
    if ((!paramBoolean) && (this.handler == null)) {}
    for (this.handler = new ResponderHandler(this, this.looper);; this.handler = null) {
      do
      {
        this.useSynchronousMode = paramBoolean;
        return;
      } while ((!paramBoolean) || (this.handler == null));
    }
  }
  
  private static class ResponderHandler
    extends Handler
  {
    private final AsyncHttpResponseHandler mResponder;
    
    ResponderHandler(AsyncHttpResponseHandler paramAsyncHttpResponseHandler, Looper paramLooper)
    {
      super();
      this.mResponder = paramAsyncHttpResponseHandler;
    }
    
    public void handleMessage(Message paramMessage)
    {
      this.mResponder.handleMessage(paramMessage);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/loopj/android/http/AsyncHttpResponseHandler.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */