package com.belkin.wemo.rules.impl;

import com.belkin.wemo.rules.IWeMoRules;

public class WeMoRulesFactory
{
  public static final String TAG = "RulesFactory";
  private static IWeMoRules rulesInstance;
  
  /* Error */
  public static IWeMoRules getInstance(android.content.Context paramContext)
  {
    // Byte code:
    //   0: ldc 2
    //   2: monitorenter
    //   3: ldc 8
    //   5: new 18	java/lang/StringBuilder
    //   8: dup
    //   9: invokespecial 19	java/lang/StringBuilder:<init>	()V
    //   12: ldc 21
    //   14: invokevirtual 25	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   17: invokestatic 31	java/lang/System:currentTimeMillis	()J
    //   20: invokevirtual 34	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   23: invokevirtual 38	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   26: invokestatic 44	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   29: invokestatic 50	com/belkin/wemo/cache/utils/NetworkMode:isLocal	()Z
    //   32: ifeq +44 -> 76
    //   35: invokestatic 55	com/belkin/wemo/rules/impl/RulesLocalImpl:getInstance	()Lcom/belkin/wemo/rules/impl/RulesLocalImpl;
    //   38: putstatic 57	com/belkin/wemo/rules/impl/WeMoRulesFactory:rulesInstance	Lcom/belkin/wemo/rules/IWeMoRules;
    //   41: ldc 8
    //   43: new 18	java/lang/StringBuilder
    //   46: dup
    //   47: invokespecial 19	java/lang/StringBuilder:<init>	()V
    //   50: ldc 59
    //   52: invokevirtual 25	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   55: invokestatic 31	java/lang/System:currentTimeMillis	()J
    //   58: invokevirtual 34	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   61: invokevirtual 38	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   64: invokestatic 44	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   67: getstatic 57	com/belkin/wemo/rules/impl/WeMoRulesFactory:rulesInstance	Lcom/belkin/wemo/rules/IWeMoRules;
    //   70: astore_2
    //   71: ldc 2
    //   73: monitorexit
    //   74: aload_2
    //   75: areturn
    //   76: invokestatic 64	com/belkin/wemo/rules/impl/RulesRemoteImpl:getInstance	()Lcom/belkin/wemo/rules/impl/RulesRemoteImpl;
    //   79: putstatic 57	com/belkin/wemo/rules/impl/WeMoRulesFactory:rulesInstance	Lcom/belkin/wemo/rules/IWeMoRules;
    //   82: goto -41 -> 41
    //   85: astore_1
    //   86: ldc 2
    //   88: monitorexit
    //   89: aload_1
    //   90: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	91	0	paramContext	android.content.Context
    //   85	5	1	localObject	Object
    //   70	5	2	localIWeMoRules	IWeMoRules
    // Exception table:
    //   from	to	target	type
    //   3	41	85	finally
    //   41	71	85	finally
    //   76	82	85	finally
  }
  
  /* Error */
  public void onNetworkSwitch()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: invokestatic 50	com/belkin/wemo/cache/utils/NetworkMode:isLocal	()Z
    //   5: ifeq +22 -> 27
    //   8: ldc 8
    //   10: ldc 67
    //   12: invokestatic 44	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   15: invokestatic 55	com/belkin/wemo/rules/impl/RulesLocalImpl:getInstance	()Lcom/belkin/wemo/rules/impl/RulesLocalImpl;
    //   18: putstatic 57	com/belkin/wemo/rules/impl/WeMoRulesFactory:rulesInstance	Lcom/belkin/wemo/rules/IWeMoRules;
    //   21: invokestatic 70	com/belkin/wemo/rules/impl/RulesRemoteImpl:destroyInstance	()V
    //   24: aload_0
    //   25: monitorexit
    //   26: return
    //   27: ldc 8
    //   29: ldc 72
    //   31: invokestatic 44	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   34: invokestatic 64	com/belkin/wemo/rules/impl/RulesRemoteImpl:getInstance	()Lcom/belkin/wemo/rules/impl/RulesRemoteImpl;
    //   37: putstatic 57	com/belkin/wemo/rules/impl/WeMoRulesFactory:rulesInstance	Lcom/belkin/wemo/rules/IWeMoRules;
    //   40: invokestatic 73	com/belkin/wemo/rules/impl/RulesLocalImpl:destroyInstance	()V
    //   43: goto -19 -> 24
    //   46: astore_1
    //   47: aload_0
    //   48: monitorexit
    //   49: aload_1
    //   50: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	51	0	this	WeMoRulesFactory
    //   46	4	1	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   2	24	46	finally
    //   27	43	46	finally
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/impl/WeMoRulesFactory.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */