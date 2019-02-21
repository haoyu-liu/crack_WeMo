package com.belkin.wemo.rules.store;

import android.text.TextUtils;
import com.belkin.wemo.WeMo;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.rules.RMIRulesDependencyProvider;
import com.belkin.wemo.rules.RMRulesSDK;
import com.belkin.wemo.rules.data.RMRule;
import com.belkin.wemo.rules.error.RMRulesError;
import com.belkin.wemo.rules.store.callback.RMStoreRulesErrorCallback;
import com.belkin.wemo.rules.store.callback.RMStoreRulesSuccessCallback;
import com.belkin.wemo.rules.store.handler.RMStoreRulesDBResponseHandler;
import com.belkin.wemo.rules.util.RMIRulesUtils;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public enum RMStoreRulesManager
{
  public static final String PARAM_DB_ZIP_FILE_LOC = "db_zip_file";
  public static final String PARAM_NEW_DB_VERSION = "new_db_version";
  public static final String PARAM_PROCESS_DB = "process_db";
  private static final String TAG = RMStoreRulesManager.class.getSimpleName();
  
  static
  {
    RMStoreRulesManager[] arrayOfRMStoreRulesManager = new RMStoreRulesManager[1];
    arrayOfRMStoreRulesManager[0] = INSTANCE;
    $VALUES = arrayOfRMStoreRulesManager;
  }
  
  private RMStoreRulesManager() {}
  
  private int getDBVersionToStoreOnDevice(RMIRulesUtils paramRMIRulesUtils)
  {
    int i = 1;
    String str = paramRMIRulesUtils.getRulesDBVerion();
    if (TextUtils.isDigitsOnly(str)) {
      i = 1 + Integer.valueOf(str).intValue();
    }
    return i;
  }
  
  /* Error */
  private void storeDBRules(List<DeviceInformation> paramList, RMRule paramRMRule, RMStoreRulesSuccessCallback paramRMStoreRulesSuccessCallback, RMStoreRulesErrorCallback paramRMStoreRulesErrorCallback)
  {
    // Byte code:
    //   0: invokestatic 75	com/belkin/wemo/rules/RMRulesSDK:instance	()Lcom/belkin/wemo/rules/RMRulesSDK;
    //   3: astore 5
    //   5: aload 5
    //   7: ifnull +392 -> 399
    //   10: new 77	java/util/ArrayList
    //   13: dup
    //   14: invokespecial 79	java/util/ArrayList:<init>	()V
    //   17: astore 6
    //   19: aload_1
    //   20: invokeinterface 85 1 0
    //   25: astore 7
    //   27: aload 7
    //   29: invokeinterface 91 1 0
    //   34: ifeq +46 -> 80
    //   37: aload 7
    //   39: invokeinterface 95 1 0
    //   44: checkcast 97	com/belkin/wemo/cache/data/DeviceInformation
    //   47: astore 20
    //   49: getstatic 102	com/belkin/wemo/WeMo:INSTANCE	Lcom/belkin/wemo/WeMo;
    //   52: invokevirtual 106	com/belkin/wemo/WeMo:getContext	()Landroid/content/Context;
    //   55: invokestatic 112	com/belkin/wemo/cache/devicelist/DeviceListManager:getInstance	(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    //   58: aload 20
    //   60: invokevirtual 115	com/belkin/wemo/cache/data/DeviceInformation:getUDN	()Ljava/lang/String;
    //   63: invokevirtual 119	com/belkin/wemo/cache/devicelist/DeviceListManager:isSmart	(Ljava/lang/String;)Z
    //   66: ifne -39 -> 27
    //   69: aload 6
    //   71: aload 20
    //   73: invokevirtual 123	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   76: pop
    //   77: goto -50 -> 27
    //   80: aload 6
    //   82: invokevirtual 126	java/util/ArrayList:size	()I
    //   85: istore 8
    //   87: getstatic 39	com/belkin/wemo/rules/store/RMStoreRulesManager:TAG	Ljava/lang/String;
    //   90: new 128	java/lang/StringBuilder
    //   93: dup
    //   94: invokespecial 129	java/lang/StringBuilder:<init>	()V
    //   97: ldc -125
    //   99: invokevirtual 135	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   102: iload 8
    //   104: invokevirtual 138	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   107: invokevirtual 141	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   110: invokestatic 147	com/belkin/wemo/cache/utils/SDKLogUtils:debugLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   113: iload 8
    //   115: ifne +23 -> 138
    //   118: aload 4
    //   120: new 149	com/belkin/wemo/rules/error/RMRulesError
    //   123: dup
    //   124: sipush 300
    //   127: ldc -105
    //   129: invokespecial 154	com/belkin/wemo/rules/error/RMRulesError:<init>	(ILjava/lang/String;)V
    //   132: invokeinterface 160 2 0
    //   137: return
    //   138: aload 5
    //   140: invokevirtual 164	com/belkin/wemo/rules/RMRulesSDK:getDependencyProvider	()Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;
    //   143: invokeinterface 170 1 0
    //   148: astore 9
    //   150: aload_0
    //   151: aload 9
    //   153: invokespecial 172	com/belkin/wemo/rules/store/RMStoreRulesManager:getDBVersionToStoreOnDevice	(Lcom/belkin/wemo/rules/util/RMIRulesUtils;)I
    //   156: istore 10
    //   158: aload 9
    //   160: invokeinterface 175 1 0
    //   165: astore 11
    //   167: aload 9
    //   169: invokeinterface 178 1 0
    //   174: astore 12
    //   176: aload 12
    //   178: invokestatic 181	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   181: ifeq +25 -> 206
    //   184: aload 4
    //   186: ifnull -49 -> 137
    //   189: aload 4
    //   191: new 149	com/belkin/wemo/rules/error/RMRulesError
    //   194: dup
    //   195: invokespecial 182	com/belkin/wemo/rules/error/RMRulesError:<init>	()V
    //   198: invokeinterface 160 2 0
    //   203: goto -66 -> 137
    //   206: aload 9
    //   208: aload 11
    //   210: invokeinterface 186 2 0
    //   215: ldc -69
    //   217: if_icmplt +9 -> 226
    //   220: invokestatic 192	com/belkin/wemo/rules/db/RMRulesDBManager:getInstance	()Lcom/belkin/wemo/rules/db/RMRulesDBManager;
    //   223: invokevirtual 195	com/belkin/wemo/rules/db/RMRulesDBManager:executeVacuum	()V
    //   226: aload 9
    //   228: aload 11
    //   230: aload 12
    //   232: invokeinterface 198 3 0
    //   237: new 200	java/util/HashMap
    //   240: dup
    //   241: iconst_2
    //   242: invokespecial 203	java/util/HashMap:<init>	(I)V
    //   245: astore 14
    //   247: aload 14
    //   249: ldc 13
    //   251: aload 12
    //   253: invokevirtual 207	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   256: pop
    //   257: aload 14
    //   259: ldc 16
    //   261: iload 10
    //   263: invokestatic 210	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   266: invokevirtual 207	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   269: pop
    //   270: new 212	com/belkin/wemo/rules/store/handler/RMStoreRulesDBResponseHandler
    //   273: dup
    //   274: aload_3
    //   275: aload 4
    //   277: aload 9
    //   279: iload 10
    //   281: invokestatic 217	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   284: invokespecial 220	com/belkin/wemo/rules/store/handler/RMStoreRulesDBResponseHandler:<init>	(Lcom/belkin/wemo/rules/store/callback/RMStoreRulesSuccessCallback;Lcom/belkin/wemo/rules/store/callback/RMStoreRulesErrorCallback;Lcom/belkin/wemo/rules/util/RMIRulesUtils;Ljava/lang/String;)V
    //   287: astore 17
    //   289: invokestatic 225	com/belkin/wemo/rules/operation/impl/RMDBRulesOperationFactory:getInstance	()Lcom/belkin/wemo/rules/operation/RMIRulesOperation;
    //   292: astore 18
    //   294: aload 18
    //   296: ifnull +81 -> 377
    //   299: aload 18
    //   301: aload 6
    //   303: aload_2
    //   304: checkcast 227	com/belkin/wemo/rules/data/RMDBRule
    //   307: aload 14
    //   309: aload 17
    //   311: aload 17
    //   313: invokeinterface 233 6 0
    //   318: goto -181 -> 137
    //   321: astore 19
    //   323: aload 4
    //   325: ifnull -188 -> 137
    //   328: aload 4
    //   330: new 149	com/belkin/wemo/rules/error/RMRulesError
    //   333: dup
    //   334: invokespecial 182	com/belkin/wemo/rules/error/RMRulesError:<init>	()V
    //   337: invokeinterface 160 2 0
    //   342: return
    //   343: astore 13
    //   345: getstatic 39	com/belkin/wemo/rules/store/RMStoreRulesManager:TAG	Ljava/lang/String;
    //   348: ldc -21
    //   350: aload 13
    //   352: invokestatic 239	com/belkin/wemo/cache/utils/SDKLogUtils:errorLog	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V
    //   355: aload 4
    //   357: ifnull -120 -> 237
    //   360: aload 4
    //   362: new 149	com/belkin/wemo/rules/error/RMRulesError
    //   365: dup
    //   366: invokespecial 182	com/belkin/wemo/rules/error/RMRulesError:<init>	()V
    //   369: invokeinterface 160 2 0
    //   374: goto -137 -> 237
    //   377: aload 4
    //   379: ifnull -242 -> 137
    //   382: aload 4
    //   384: new 149	com/belkin/wemo/rules/error/RMRulesError
    //   387: dup
    //   388: invokespecial 182	com/belkin/wemo/rules/error/RMRulesError:<init>	()V
    //   391: invokeinterface 160 2 0
    //   396: goto -259 -> 137
    //   399: getstatic 39	com/belkin/wemo/rules/store/RMStoreRulesManager:TAG	Ljava/lang/String;
    //   402: ldc -15
    //   404: invokestatic 243	com/belkin/wemo/cache/utils/SDKLogUtils:errorLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   407: aload 4
    //   409: ifnull -272 -> 137
    //   412: aload 4
    //   414: new 149	com/belkin/wemo/rules/error/RMRulesError
    //   417: dup
    //   418: invokespecial 182	com/belkin/wemo/rules/error/RMRulesError:<init>	()V
    //   421: invokeinterface 160 2 0
    //   426: return
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	427	0	this	RMStoreRulesManager
    //   0	427	1	paramList	List<DeviceInformation>
    //   0	427	2	paramRMRule	RMRule
    //   0	427	3	paramRMStoreRulesSuccessCallback	RMStoreRulesSuccessCallback
    //   0	427	4	paramRMStoreRulesErrorCallback	RMStoreRulesErrorCallback
    //   3	136	5	localRMRulesSDK	RMRulesSDK
    //   17	285	6	localArrayList	ArrayList
    //   25	13	7	localIterator	Iterator
    //   85	29	8	i	int
    //   148	130	9	localRMIRulesUtils	RMIRulesUtils
    //   156	124	10	j	int
    //   165	64	11	str1	String
    //   174	78	12	str2	String
    //   343	8	13	localIOException	java.io.IOException
    //   245	63	14	localHashMap	java.util.HashMap
    //   287	25	17	localRMStoreRulesDBResponseHandler	RMStoreRulesDBResponseHandler
    //   292	8	18	localRMIRulesOperation	com.belkin.wemo.rules.operation.RMIRulesOperation
    //   321	1	19	localRuleDBException	com.belkin.wemo.rules.operation.db.exception.RuleDBException
    //   47	25	20	localDeviceInformation	DeviceInformation
    // Exception table:
    //   from	to	target	type
    //   220	226	321	com/belkin/wemo/rules/operation/db/exception/RuleDBException
    //   226	237	343	java/io/IOException
  }
  
  private void storeTNGRules(List<DeviceInformation> paramList, RMRule paramRMRule, RMStoreRulesSuccessCallback paramRMStoreRulesSuccessCallback, RMStoreRulesErrorCallback paramRMStoreRulesErrorCallback)
  {
    ArrayList localArrayList = new ArrayList();
    new RMStoreRulesDBResponseHandler(paramRMStoreRulesSuccessCallback, paramRMStoreRulesErrorCallback, RMRulesSDK.instance().getDependencyProvider().provideIRulesUtils(), "");
    Iterator localIterator = paramList.iterator();
    while (localIterator.hasNext())
    {
      DeviceInformation localDeviceInformation = (DeviceInformation)localIterator.next();
      if (DeviceListManager.getInstance(WeMo.INSTANCE.getContext()).isSmart(localDeviceInformation.getUDN())) {
        localArrayList.add(localDeviceInformation);
      }
    }
    int i = localArrayList.size();
    SDKLogUtils.debugLog(TAG, "Store Rules: TNG based online devices count: " + i);
    if (i == 0) {
      paramRMStoreRulesErrorCallback.onStoreRulesFailed(new RMRulesError(300, "No device is online."));
    }
  }
  
  public void storeRules(RMRule paramRMRule, RMStoreRulesSuccessCallback paramRMStoreRulesSuccessCallback, RMStoreRulesErrorCallback paramRMStoreRulesErrorCallback, List<DeviceInformation> paramList)
  {
    if (2 == paramRMRule.getRulesType()) {
      storeDBRules(paramList, paramRMRule, paramRMStoreRulesSuccessCallback, paramRMStoreRulesErrorCallback);
    }
    while (1 != paramRMRule.getRulesType()) {
      return;
    }
    storeTNGRules(paramList, paramRMRule, paramRMStoreRulesSuccessCallback, paramRMStoreRulesErrorCallback);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/store/RMStoreRulesManager.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */