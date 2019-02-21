package org.apache.cordova;

import org.json.JSONArray;
import org.json.JSONObject;

public class CallbackContext
{
  private static final String LOG_TAG = "CordovaPlugin";
  private String callbackId;
  private int changingThreads;
  protected boolean finished;
  private CordovaWebView webView;
  
  public CallbackContext(String paramString, CordovaWebView paramCordovaWebView)
  {
    this.callbackId = paramString;
    this.webView = paramCordovaWebView;
  }
  
  public void error(int paramInt)
  {
    sendPluginResult(new PluginResult(PluginResult.Status.ERROR, paramInt));
  }
  
  public void error(String paramString)
  {
    sendPluginResult(new PluginResult(PluginResult.Status.ERROR, paramString));
  }
  
  public void error(JSONObject paramJSONObject)
  {
    sendPluginResult(new PluginResult(PluginResult.Status.ERROR, paramJSONObject));
  }
  
  public String getCallbackId()
  {
    return this.callbackId;
  }
  
  public boolean isChangingThreads()
  {
    return this.changingThreads > 0;
  }
  
  public boolean isFinished()
  {
    return this.finished;
  }
  
  /* Error */
  public void sendPluginResult(PluginResult paramPluginResult)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 58	org/apache/cordova/CallbackContext:finished	Z
    //   6: ifeq +46 -> 52
    //   9: ldc 8
    //   11: new 60	java/lang/StringBuilder
    //   14: dup
    //   15: invokespecial 61	java/lang/StringBuilder:<init>	()V
    //   18: ldc 63
    //   20: invokevirtual 67	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   23: aload_0
    //   24: getfield 22	org/apache/cordova/CallbackContext:callbackId	Ljava/lang/String;
    //   27: invokevirtual 67	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   30: ldc 69
    //   32: invokevirtual 67	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   35: aload_1
    //   36: invokevirtual 72	org/apache/cordova/PluginResult:getMessage	()Ljava/lang/String;
    //   39: invokevirtual 67	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   42: invokevirtual 75	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   45: invokestatic 81	android/util/Log:w	(Ljava/lang/String;Ljava/lang/String;)I
    //   48: pop
    //   49: aload_0
    //   50: monitorexit
    //   51: return
    //   52: aload_1
    //   53: invokevirtual 84	org/apache/cordova/PluginResult:getKeepCallback	()Z
    //   56: ifne +27 -> 83
    //   59: iconst_1
    //   60: istore_3
    //   61: aload_0
    //   62: iload_3
    //   63: putfield 58	org/apache/cordova/CallbackContext:finished	Z
    //   66: aload_0
    //   67: monitorexit
    //   68: aload_0
    //   69: getfield 24	org/apache/cordova/CallbackContext:webView	Lorg/apache/cordova/CordovaWebView;
    //   72: aload_1
    //   73: aload_0
    //   74: getfield 22	org/apache/cordova/CallbackContext:callbackId	Ljava/lang/String;
    //   77: invokeinterface 89 3 0
    //   82: return
    //   83: iconst_0
    //   84: istore_3
    //   85: goto -24 -> 61
    //   88: astore_2
    //   89: aload_0
    //   90: monitorexit
    //   91: aload_2
    //   92: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	93	0	this	CallbackContext
    //   0	93	1	paramPluginResult	PluginResult
    //   88	4	2	localObject	Object
    //   60	25	3	bool	boolean
    // Exception table:
    //   from	to	target	type
    //   2	51	88	finally
    //   52	59	88	finally
    //   61	68	88	finally
    //   89	91	88	finally
  }
  
  public void success()
  {
    sendPluginResult(new PluginResult(PluginResult.Status.OK));
  }
  
  public void success(int paramInt)
  {
    sendPluginResult(new PluginResult(PluginResult.Status.OK, paramInt));
  }
  
  public void success(String paramString)
  {
    sendPluginResult(new PluginResult(PluginResult.Status.OK, paramString));
  }
  
  public void success(JSONArray paramJSONArray)
  {
    sendPluginResult(new PluginResult(PluginResult.Status.OK, paramJSONArray));
  }
  
  public void success(JSONObject paramJSONObject)
  {
    sendPluginResult(new PluginResult(PluginResult.Status.OK, paramJSONObject));
  }
  
  public void success(byte[] paramArrayOfByte)
  {
    sendPluginResult(new PluginResult(PluginResult.Status.OK, paramArrayOfByte));
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/cordova/CallbackContext.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */