package com.belkin.wemo.rules.fetch.handler;

import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.rules.db.broadcast.RMIRulesUpdatedBroadcaster;
import com.belkin.wemo.rules.fetch.callback.RMFetchRulesErrorCallback;
import com.belkin.wemo.rules.fetch.callback.RMFetchRulesSuccessCallback;
import com.belkin.wemo.rules.util.RMIRulesUtils;
import java.util.ArrayList;
import java.util.Iterator;

public class RMFetchAndSyncRulesResponseHandler
  extends RMFetchRulesResponseHandler
{
  private static final String TAG = RMFetchAndSyncRulesResponseHandler.class.getSimpleName();
  private RMIRulesUtils rulesUtils;
  
  public RMFetchAndSyncRulesResponseHandler(int paramInt, RMFetchRulesSuccessCallback paramRMFetchRulesSuccessCallback, RMFetchRulesErrorCallback paramRMFetchRulesErrorCallback, RMIRulesUtils paramRMIRulesUtils, RMIRulesUpdatedBroadcaster paramRMIRulesUpdatedBroadcaster)
  {
    super(paramInt, paramRMFetchRulesSuccessCallback, paramRMFetchRulesErrorCallback, paramRMIRulesUpdatedBroadcaster);
    this.rulesUtils = paramRMIRulesUtils;
  }
  
  private ArrayList<DeviceInformation> getDevicesToSync(ArrayList<String> paramArrayList)
  {
    ArrayList localArrayList = new ArrayList();
    SDKLogUtils.debugLog(TAG, "Fetch Rules: Syncing uPnP devices with older DB versions. Such devices UDNs count: " + paramArrayList.size());
    Iterator localIterator = paramArrayList.iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      DeviceInformation localDeviceInformation = this.rulesUtils.getDeviceInformationByUDNFromMemory(str);
      if (localDeviceInformation != null) {
        localArrayList.add(localDeviceInformation);
      }
    }
    return localArrayList;
  }
  
  /* Error */
  public void onSingleTypeRulesFetched(int paramInt, ArrayList<String> paramArrayList, String... paramVarArgs)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: iload_1
    //   4: aload_2
    //   5: aload_3
    //   6: invokespecial 88	com/belkin/wemo/rules/fetch/handler/RMFetchRulesResponseHandler:onSingleTypeRulesFetched	(ILjava/util/ArrayList;[Ljava/lang/String;)V
    //   9: aload_2
    //   10: invokevirtual 91	java/util/ArrayList:isEmpty	()Z
    //   13: ifne +124 -> 137
    //   16: iload_1
    //   17: iconst_2
    //   18: if_icmpne +119 -> 137
    //   21: aload_0
    //   22: getfield 25	com/belkin/wemo/rules/fetch/handler/RMFetchAndSyncRulesResponseHandler:rulesUtils	Lcom/belkin/wemo/rules/util/RMIRulesUtils;
    //   25: invokeinterface 94 1 0
    //   30: astore 5
    //   32: aload_0
    //   33: getfield 25	com/belkin/wemo/rules/fetch/handler/RMFetchAndSyncRulesResponseHandler:rulesUtils	Lcom/belkin/wemo/rules/util/RMIRulesUtils;
    //   36: invokeinterface 97 1 0
    //   41: astore 6
    //   43: aload 6
    //   45: invokestatic 102	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   48: istore 7
    //   50: iload 7
    //   52: ifne +85 -> 137
    //   55: aload_0
    //   56: getfield 25	com/belkin/wemo/rules/fetch/handler/RMFetchAndSyncRulesResponseHandler:rulesUtils	Lcom/belkin/wemo/rules/util/RMIRulesUtils;
    //   59: aload 5
    //   61: aload 6
    //   63: invokeinterface 105 3 0
    //   68: new 107	java/util/HashMap
    //   71: dup
    //   72: invokespecial 108	java/util/HashMap:<init>	()V
    //   75: astore 9
    //   77: aload 9
    //   79: ldc 110
    //   81: aload 6
    //   83: invokevirtual 114	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   86: pop
    //   87: aload_3
    //   88: ifnull +23 -> 111
    //   91: aload_3
    //   92: arraylength
    //   93: iconst_1
    //   94: if_icmplt +17 -> 111
    //   97: aload 9
    //   99: ldc 116
    //   101: aload_3
    //   102: iconst_0
    //   103: aaload
    //   104: invokestatic 122	java/lang/Integer:valueOf	(Ljava/lang/String;)Ljava/lang/Integer;
    //   107: invokevirtual 114	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   110: pop
    //   111: invokestatic 128	com/belkin/wemo/rules/operation/impl/RMDBRulesOperationFactory:getInstance	()Lcom/belkin/wemo/rules/operation/RMIRulesOperation;
    //   114: astore 11
    //   116: aload 11
    //   118: ifnull +19 -> 137
    //   121: aload 11
    //   123: aload_0
    //   124: aload_2
    //   125: invokespecial 130	com/belkin/wemo/rules/fetch/handler/RMFetchAndSyncRulesResponseHandler:getDevicesToSync	(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    //   128: aload 9
    //   130: aconst_null
    //   131: aconst_null
    //   132: invokeinterface 136 5 0
    //   137: aload_0
    //   138: monitorexit
    //   139: return
    //   140: astore 8
    //   142: getstatic 18	com/belkin/wemo/rules/fetch/handler/RMFetchAndSyncRulesResponseHandler:TAG	Ljava/lang/String;
    //   145: ldc -118
    //   147: aload 8
    //   149: invokestatic 142	com/belkin/wemo/cache/utils/SDKLogUtils:errorLog	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V
    //   152: goto -84 -> 68
    //   155: astore 4
    //   157: aload_0
    //   158: monitorexit
    //   159: aload 4
    //   161: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	162	0	this	RMFetchAndSyncRulesResponseHandler
    //   0	162	1	paramInt	int
    //   0	162	2	paramArrayList	ArrayList<String>
    //   0	162	3	paramVarArgs	String[]
    //   155	5	4	localObject	Object
    //   30	30	5	str1	String
    //   41	41	6	str2	String
    //   48	3	7	bool	boolean
    //   140	8	8	localIOException	java.io.IOException
    //   75	54	9	localHashMap	java.util.HashMap
    //   114	8	11	localRMIRulesOperation	com.belkin.wemo.rules.operation.RMIRulesOperation
    // Exception table:
    //   from	to	target	type
    //   55	68	140	java/io/IOException
    //   2	16	155	finally
    //   21	50	155	finally
    //   55	68	155	finally
    //   68	87	155	finally
    //   91	111	155	finally
    //   111	116	155	finally
    //   121	137	155	finally
    //   142	152	155	finally
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/fetch/handler/RMFetchAndSyncRulesResponseHandler.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */