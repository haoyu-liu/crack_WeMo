package com.loopj.android.http;

import android.os.Message;
import android.util.Log;

public abstract class DataAsyncHttpResponseHandler
  extends AsyncHttpResponseHandler
{
  private static final String LOG_TAG = "DataAsyncHttpResponseHandler";
  protected static final int PROGRESS_DATA_MESSAGE = 6;
  
  public static byte[] copyOfRange(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws ArrayIndexOutOfBoundsException, IllegalArgumentException, NullPointerException
  {
    if (paramInt1 > paramInt2) {
      throw new IllegalArgumentException();
    }
    int i = paramArrayOfByte.length;
    if ((paramInt1 < 0) || (paramInt1 > i)) {
      throw new ArrayIndexOutOfBoundsException();
    }
    int j = paramInt2 - paramInt1;
    int k = Math.min(j, i - paramInt1);
    byte[] arrayOfByte = new byte[j];
    System.arraycopy(paramArrayOfByte, paramInt1, arrayOfByte, 0, k);
    return arrayOfByte;
  }
  
  /* Error */
  byte[] getResponseData(org.apache.http.HttpEntity paramHttpEntity)
    throws java.io.IOException
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore_2
    //   2: aload_1
    //   3: ifnull +160 -> 163
    //   6: aload_1
    //   7: invokeinterface 49 1 0
    //   12: astore_3
    //   13: aconst_null
    //   14: astore_2
    //   15: aload_3
    //   16: ifnull +147 -> 163
    //   19: aload_1
    //   20: invokeinterface 53 1 0
    //   25: lstore 4
    //   27: lload 4
    //   29: ldc2_w 54
    //   32: lcmp
    //   33: ifle +13 -> 46
    //   36: new 21	java/lang/IllegalArgumentException
    //   39: dup
    //   40: ldc 57
    //   42: invokespecial 60	java/lang/IllegalArgumentException:<init>	(Ljava/lang/String;)V
    //   45: athrow
    //   46: lload 4
    //   48: lconst_0
    //   49: lcmp
    //   50: ifge +8 -> 58
    //   53: ldc2_w 61
    //   56: lstore 4
    //   58: new 64	org/apache/http/util/ByteArrayBuffer
    //   61: dup
    //   62: lload 4
    //   64: l2i
    //   65: invokespecial 67	org/apache/http/util/ByteArrayBuffer:<init>	(I)V
    //   68: astore 6
    //   70: sipush 4096
    //   73: newarray <illegal type>
    //   75: astore 9
    //   77: aload_3
    //   78: aload 9
    //   80: invokevirtual 73	java/io/InputStream:read	([B)I
    //   83: istore 10
    //   85: iload 10
    //   87: iconst_m1
    //   88: if_icmpeq +61 -> 149
    //   91: invokestatic 79	java/lang/Thread:currentThread	()Ljava/lang/Thread;
    //   94: invokevirtual 83	java/lang/Thread:isInterrupted	()Z
    //   97: ifne +52 -> 149
    //   100: aload 6
    //   102: aload 9
    //   104: iconst_0
    //   105: iload 10
    //   107: invokevirtual 87	org/apache/http/util/ByteArrayBuffer:append	([BII)V
    //   110: aload_0
    //   111: aload 9
    //   113: iconst_0
    //   114: iload 10
    //   116: invokestatic 89	com/loopj/android/http/DataAsyncHttpResponseHandler:copyOfRange	([BII)[B
    //   119: invokevirtual 93	com/loopj/android/http/DataAsyncHttpResponseHandler:sendProgressDataMessage	([B)V
    //   122: goto -45 -> 77
    //   125: astore 7
    //   127: aload_3
    //   128: invokestatic 99	com/loopj/android/http/AsyncHttpClient:silentCloseInputStream	(Ljava/io/InputStream;)V
    //   131: aload 7
    //   133: athrow
    //   134: astore 8
    //   136: invokestatic 102	java/lang/System:gc	()V
    //   139: new 41	java/io/IOException
    //   142: dup
    //   143: ldc 104
    //   145: invokespecial 105	java/io/IOException:<init>	(Ljava/lang/String;)V
    //   148: athrow
    //   149: aload_3
    //   150: invokestatic 99	com/loopj/android/http/AsyncHttpClient:silentCloseInputStream	(Ljava/io/InputStream;)V
    //   153: aload 6
    //   155: invokevirtual 109	org/apache/http/util/ByteArrayBuffer:toByteArray	()[B
    //   158: astore 11
    //   160: aload 11
    //   162: astore_2
    //   163: aload_2
    //   164: areturn
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	165	0	this	DataAsyncHttpResponseHandler
    //   0	165	1	paramHttpEntity	org.apache.http.HttpEntity
    //   1	163	2	localObject1	Object
    //   12	138	3	localInputStream	java.io.InputStream
    //   25	38	4	l	long
    //   68	86	6	localByteArrayBuffer	org.apache.http.util.ByteArrayBuffer
    //   125	7	7	localObject2	Object
    //   134	1	8	localOutOfMemoryError	OutOfMemoryError
    //   75	37	9	arrayOfByte1	byte[]
    //   83	32	10	i	int
    //   158	3	11	arrayOfByte2	byte[]
    // Exception table:
    //   from	to	target	type
    //   70	77	125	finally
    //   77	85	125	finally
    //   91	122	125	finally
    //   58	70	134	java/lang/OutOfMemoryError
    //   127	134	134	java/lang/OutOfMemoryError
    //   149	160	134	java/lang/OutOfMemoryError
  }
  
  protected void handleMessage(Message paramMessage)
  {
    super.handleMessage(paramMessage);
    switch (paramMessage.what)
    {
    default: 
      return;
    }
    Object[] arrayOfObject = (Object[])paramMessage.obj;
    if ((arrayOfObject != null) && (arrayOfObject.length >= 1)) {
      try
      {
        onProgressData((byte[])arrayOfObject[0]);
        return;
      }
      catch (Throwable localThrowable)
      {
        Log.e("DataAsyncHttpResponseHandler", "custom onProgressData contains an error", localThrowable);
        return;
      }
    }
    Log.e("DataAsyncHttpResponseHandler", "PROGRESS_DATA_MESSAGE didn't got enough params");
  }
  
  public void onProgressData(byte[] paramArrayOfByte)
  {
    Log.d("DataAsyncHttpResponseHandler", "onProgressData(byte[]) was not overriden, but callback was received");
  }
  
  public final void sendProgressDataMessage(byte[] paramArrayOfByte)
  {
    sendMessage(obtainMessage(6, new Object[] { paramArrayOfByte }));
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/loopj/android/http/DataAsyncHttpResponseHandler.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */