package org.apache.cordova;

public class ResumeCallback
  extends CallbackContext
{
  private final String TAG = "CordovaResumeCallback";
  private PluginManager pluginManager;
  private String serviceName;
  
  public ResumeCallback(String paramString, PluginManager paramPluginManager)
  {
    super("resumecallback", null);
    this.serviceName = paramString;
    this.pluginManager = paramPluginManager;
  }
  
  /* Error */
  public void sendPluginResult(PluginResult paramPluginResult)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 32	org/apache/cordova/ResumeCallback:finished	Z
    //   6: ifeq +40 -> 46
    //   9: ldc 18
    //   11: new 34	java/lang/StringBuilder
    //   14: dup
    //   15: invokespecial 37	java/lang/StringBuilder:<init>	()V
    //   18: aload_0
    //   19: getfield 22	org/apache/cordova/ResumeCallback:serviceName	Ljava/lang/String;
    //   22: invokevirtual 41	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   25: ldc 43
    //   27: invokevirtual 41	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   30: aload_1
    //   31: invokevirtual 49	org/apache/cordova/PluginResult:getMessage	()Ljava/lang/String;
    //   34: invokevirtual 41	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   37: invokevirtual 52	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   40: invokestatic 58	org/apache/cordova/LOG:w	(Ljava/lang/String;Ljava/lang/String;)V
    //   43: aload_0
    //   44: monitorexit
    //   45: return
    //   46: aload_0
    //   47: iconst_1
    //   48: putfield 32	org/apache/cordova/ResumeCallback:finished	Z
    //   51: aload_0
    //   52: monitorexit
    //   53: new 60	org/json/JSONObject
    //   56: dup
    //   57: invokespecial 61	org/json/JSONObject:<init>	()V
    //   60: astore_3
    //   61: new 60	org/json/JSONObject
    //   64: dup
    //   65: invokespecial 61	org/json/JSONObject:<init>	()V
    //   68: astore 4
    //   70: aload 4
    //   72: ldc 63
    //   74: aload_0
    //   75: getfield 22	org/apache/cordova/ResumeCallback:serviceName	Ljava/lang/String;
    //   78: invokevirtual 67	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   81: pop
    //   82: aload 4
    //   84: ldc 69
    //   86: getstatic 73	org/apache/cordova/PluginResult:StatusMessages	[Ljava/lang/String;
    //   89: aload_1
    //   90: invokevirtual 77	org/apache/cordova/PluginResult:getStatus	()I
    //   93: aaload
    //   94: invokevirtual 67	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   97: pop
    //   98: aload_3
    //   99: ldc 79
    //   101: ldc 81
    //   103: invokevirtual 67	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   106: pop
    //   107: aload_3
    //   108: ldc 83
    //   110: aload 4
    //   112: invokevirtual 67	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   115: pop
    //   116: new 45	org/apache/cordova/PluginResult
    //   119: dup
    //   120: getstatic 89	org/apache/cordova/PluginResult$Status:OK	Lorg/apache/cordova/PluginResult$Status;
    //   123: aload_3
    //   124: invokespecial 92	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V
    //   127: astore 6
    //   129: new 94	java/util/ArrayList
    //   132: dup
    //   133: invokespecial 95	java/util/ArrayList:<init>	()V
    //   136: astore 7
    //   138: aload 7
    //   140: aload 6
    //   142: invokeinterface 101 2 0
    //   147: pop
    //   148: aload 7
    //   150: aload_1
    //   151: invokeinterface 101 2 0
    //   156: pop
    //   157: aload_0
    //   158: getfield 24	org/apache/cordova/ResumeCallback:pluginManager	Lorg/apache/cordova/PluginManager;
    //   161: ldc 103
    //   163: invokevirtual 109	org/apache/cordova/PluginManager:getPlugin	(Ljava/lang/String;)Lorg/apache/cordova/CordovaPlugin;
    //   166: checkcast 111	org/apache/cordova/CoreAndroid
    //   169: new 45	org/apache/cordova/PluginResult
    //   172: dup
    //   173: getstatic 89	org/apache/cordova/PluginResult$Status:OK	Lorg/apache/cordova/PluginResult$Status;
    //   176: aload 7
    //   178: invokespecial 114	org/apache/cordova/PluginResult:<init>	(Lorg/apache/cordova/PluginResult$Status;Ljava/util/List;)V
    //   181: invokevirtual 117	org/apache/cordova/CoreAndroid:sendResumeEvent	(Lorg/apache/cordova/PluginResult;)V
    //   184: return
    //   185: astore_2
    //   186: aload_0
    //   187: monitorexit
    //   188: aload_2
    //   189: athrow
    //   190: astore 5
    //   192: ldc 18
    //   194: ldc 119
    //   196: invokestatic 122	org/apache/cordova/LOG:e	(Ljava/lang/String;Ljava/lang/String;)V
    //   199: goto -83 -> 116
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	202	0	this	ResumeCallback
    //   0	202	1	paramPluginResult	PluginResult
    //   185	4	2	localObject	Object
    //   60	64	3	localJSONObject1	org.json.JSONObject
    //   68	43	4	localJSONObject2	org.json.JSONObject
    //   190	1	5	localJSONException	org.json.JSONException
    //   127	14	6	localPluginResult	PluginResult
    //   136	41	7	localArrayList	java.util.ArrayList
    // Exception table:
    //   from	to	target	type
    //   2	45	185	finally
    //   46	53	185	finally
    //   186	188	185	finally
    //   70	116	190	org/json/JSONException
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/cordova/ResumeCallback.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */