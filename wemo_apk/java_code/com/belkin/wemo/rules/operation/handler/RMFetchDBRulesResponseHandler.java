package com.belkin.wemo.rules.operation.handler;

import android.text.TextUtils;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.exception.InvalidArgumentsException;
import com.belkin.wemo.rules.device.callback.RMFetchDeviceRulesErrorCallback;
import com.belkin.wemo.rules.device.callback.RMFetchDeviceRulesSuccesCallback;
import com.belkin.wemo.rules.device.error.RMRuleDeviceError;
import com.belkin.wemo.rules.error.RMRulesTypeError;
import com.belkin.wemo.rules.operation.callback.RMFetchRulesTypeErrorCallback;
import com.belkin.wemo.rules.operation.callback.RMFetchRulesTypeSuccessCallback;
import com.belkin.wemo.rules.operation.download.RMIRulesDBDownloader;
import com.belkin.wemo.rules.operation.download.callback.RMRulesDBDownloadErrorCallback;
import com.belkin.wemo.rules.operation.download.callback.RMRulesDBDownloadSuccessCallback;
import com.belkin.wemo.rules.operation.download.impl.RMRulesDBDownloadFactory;
import com.belkin.wemo.rules.util.RMIRulesUtils;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.HashMap;

public class RMFetchDBRulesResponseHandler
  implements RMFetchDeviceRulesErrorCallback, RMFetchDeviceRulesSuccesCallback, RMRulesDBDownloadErrorCallback, RMRulesDBDownloadSuccessCallback
{
  public static final String TAG = RMFetchDBRulesResponseHandler.class.getSimpleName();
  private int activeRulDBDevicesCount;
  private RMFetchRulesTypeErrorCallback errorCallback;
  private int fetchCompleteCount;
  private StringBuilder latestDBPathSB;
  private int latestDBVersion;
  private StringBuilder latestDBVersionDeviceUDN;
  private ArrayList<String> lowerDBVersionDeviceUDNsList;
  private RMIRulesUtils rulesUtils;
  private RMFetchRulesTypeSuccessCallback successCallback;
  
  public RMFetchDBRulesResponseHandler(RMFetchRulesTypeSuccessCallback paramRMFetchRulesTypeSuccessCallback, RMFetchRulesTypeErrorCallback paramRMFetchRulesTypeErrorCallback, int paramInt, RMIRulesUtils paramRMIRulesUtils)
  {
    this.activeRulDBDevicesCount = paramInt;
    this.errorCallback = paramRMFetchRulesTypeErrorCallback;
    this.successCallback = paramRMFetchRulesTypeSuccessCallback;
    this.rulesUtils = paramRMIRulesUtils;
    this.latestDBPathSB = new StringBuilder();
    this.latestDBVersionDeviceUDN = new StringBuilder();
    this.lowerDBVersionDeviceUDNsList = new ArrayList();
  }
  
  private void downloadLatestDeviceDBToApp(String paramString1, String paramString2)
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put("download_location", this.rulesUtils.getDBFilePathWithNameInApp());
    localHashMap.put("download_url", paramString1);
    localHashMap.put("mac_address", paramString2);
    try
    {
      RMIRulesDBDownloader localRMIRulesDBDownloader = RMRulesDBDownloadFactory.getRulesDBDownloaderInstance();
      if (localRMIRulesDBDownloader != null)
      {
        localRMIRulesDBDownloader.downloadRulesDB(localHashMap, this, this);
        return;
      }
      if (this.errorCallback != null)
      {
        this.errorCallback.onSingleTypeRulesFetchError(new RMRulesTypeError(-1, "Error during register/unregister Push Notification!", 2));
        return;
      }
    }
    catch (InvalidArgumentsException localInvalidArgumentsException)
    {
      SDKLogUtils.errorLog(TAG, "Fetch Rules: InvalidArgumentsException while downloading DB file: ", localInvalidArgumentsException);
      if (this.errorCallback != null) {
        this.errorCallback.onSingleTypeRulesFetchError(new RMRulesTypeError(-1, localInvalidArgumentsException.getMessage(), 2));
      }
    }
  }
  
  private String getDeviceMAC(String paramString)
  {
    String str = "";
    DeviceInformation localDeviceInformation = this.rulesUtils.getDeviceInformationByUDNFromMemory(paramString);
    if (localDeviceInformation != null) {
      str = localDeviceInformation.getMAC();
    }
    return str;
  }
  
  private void onLatestDeviceDBCalculated()
  {
    SDKLogUtils.infoLog(TAG, "Fetch Rules: response received for all devices");
    String str1 = this.rulesUtils.getRulesDBVerion();
    SDKLogUtils.infoLog(TAG, "Fetch Rules: Latest Device DB Version = " + this.latestDBVersion);
    SDKLogUtils.infoLog(TAG, "Fetch Rules: DB Version In App = " + str1);
    SDKLogUtils.infoLog(TAG, "Fetch Rules: Latest device DB path: " + this.latestDBPathSB);
    boolean bool = this.rulesUtils.doesRulesDBFileExist();
    SDKLogUtils.infoLog(TAG, "Fetch Rules: Does Rules DB file exist in app: " + bool);
    if (this.latestDBVersion != 0)
    {
      if ((this.latestDBVersion > Integer.valueOf(str1).intValue()) || (!bool))
      {
        String str2 = this.latestDBPathSB.toString();
        if (!TextUtils.isEmpty(str2))
        {
          SDKLogUtils.infoLog(TAG, "Fetch Rules: Setting new App DB Version to " + this.latestDBVersion);
          this.rulesUtils.setRulesDBVersion(String.valueOf(this.latestDBVersion));
          downloadLatestDeviceDBToApp(str2, getDeviceMAC(this.latestDBVersionDeviceUDN.toString()));
        }
        do
        {
          return;
          SDKLogUtils.errorLog(TAG, "Fetch Rules: ERROR: Invalid Device DB Path");
        } while (this.errorCallback == null);
        this.errorCallback.onSingleTypeRulesFetchError(new RMRulesTypeError(65135, "Invalid Device DB Path", 2));
        return;
      }
      sendSuccessResponse(this.latestDBVersion, this.lowerDBVersionDeviceUDNsList);
      return;
    }
    SDKLogUtils.infoLog(TAG, "Fetch Rules: Setting new App DB Version to " + this.latestDBVersion);
    this.rulesUtils.setRulesDBVersion("0");
    this.rulesUtils.deleteRulesDBFileInApp();
    sendSuccessResponse(this.latestDBVersion, this.lowerDBVersionDeviceUDNsList);
  }
  
  private void sendSuccessResponse(int paramInt, ArrayList<String> paramArrayList)
  {
    if (this.successCallback != null)
    {
      RMFetchRulesTypeSuccessCallback localRMFetchRulesTypeSuccessCallback = this.successCallback;
      String[] arrayOfString = new String[1];
      arrayOfString[0] = String.valueOf(paramInt);
      localRMFetchRulesTypeSuccessCallback.onSingleTypeRulesFetched(2, paramArrayList, arrayOfString);
    }
  }
  
  public void onError(RMRuleDeviceError paramRMRuleDeviceError)
  {
    try
    {
      this.fetchCompleteCount = (1 + this.fetchCompleteCount);
      SDKLogUtils.errorLog(TAG, "Fetch Rules: fetch ERROR for device: " + paramRMRuleDeviceError.getDeviceUdn() + "\n Total device fetched count yet: " + this.fetchCompleteCount);
      if (this.fetchCompleteCount == this.activeRulDBDevicesCount) {
        onLatestDeviceDBCalculated();
      }
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public void onRulesDBDownloadException(Exception paramException)
  {
    SDKLogUtils.errorLog(TAG, "Exception while downloading DB: ", paramException);
    if ((FileNotFoundException.class.isAssignableFrom(paramException.getClass())) && (this.latestDBVersion == 0)) {
      sendSuccessResponse(this.latestDBVersion, this.lowerDBVersionDeviceUDNsList);
    }
    while (this.errorCallback == null) {
      return;
    }
    this.errorCallback.onSingleTypeRulesFetchError(new RMRulesTypeError(-1, paramException.getMessage(), 2));
  }
  
  public void onRulesDBDownloaded(String paramString)
  {
    sendSuccessResponse(this.latestDBVersion, this.lowerDBVersionDeviceUDNsList);
  }
  
  /* Error */
  public void onSuccess(int paramInt, String paramString1, String paramString2)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: getstatic 40	com/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler:TAG	Ljava/lang/String;
    //   5: new 54	java/lang/StringBuilder
    //   8: dup
    //   9: invokespecial 55	java/lang/StringBuilder:<init>	()V
    //   12: ldc_w 263
    //   15: invokevirtual 150	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   18: aload_3
    //   19: invokevirtual 150	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   22: ldc_w 265
    //   25: invokevirtual 150	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   28: iload_1
    //   29: invokevirtual 155	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   32: ldc_w 267
    //   35: invokevirtual 150	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   38: aload_0
    //   39: getfield 152	com/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler:latestDBVersion	I
    //   42: invokevirtual 155	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   45: ldc_w 269
    //   48: invokevirtual 150	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   51: aload_2
    //   52: invokevirtual 150	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   55: ldc_w 271
    //   58: invokevirtual 150	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   61: aload_0
    //   62: getfield 57	com/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler:latestDBPathSB	Ljava/lang/StringBuilder;
    //   65: invokevirtual 158	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   68: invokevirtual 150	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   71: invokevirtual 158	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   74: invokestatic 141	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   77: aload_0
    //   78: getfield 152	com/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler:latestDBVersion	I
    //   81: iload_1
    //   82: if_icmplt +116 -> 198
    //   85: aload_0
    //   86: getfield 57	com/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler:latestDBPathSB	Ljava/lang/StringBuilder;
    //   89: invokevirtual 274	java/lang/StringBuilder:length	()I
    //   92: ifne +20 -> 112
    //   95: aload_0
    //   96: getfield 57	com/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler:latestDBPathSB	Ljava/lang/StringBuilder;
    //   99: iconst_0
    //   100: aload_0
    //   101: getfield 57	com/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler:latestDBPathSB	Ljava/lang/StringBuilder;
    //   104: invokevirtual 274	java/lang/StringBuilder:length	()I
    //   107: aload_2
    //   108: invokevirtual 278	java/lang/StringBuilder:replace	(IILjava/lang/String;)Ljava/lang/StringBuilder;
    //   111: pop
    //   112: aload_0
    //   113: iconst_1
    //   114: aload_0
    //   115: getfield 230	com/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler:fetchCompleteCount	I
    //   118: iadd
    //   119: putfield 230	com/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler:fetchCompleteCount	I
    //   122: getstatic 40	com/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler:TAG	Ljava/lang/String;
    //   125: new 54	java/lang/StringBuilder
    //   128: dup
    //   129: invokespecial 55	java/lang/StringBuilder:<init>	()V
    //   132: ldc_w 280
    //   135: invokevirtual 150	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   138: aload_3
    //   139: invokevirtual 150	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   142: ldc_w 282
    //   145: invokevirtual 150	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   148: iload_1
    //   149: invokevirtual 155	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   152: ldc_w 284
    //   155: invokevirtual 150	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   158: aload_2
    //   159: invokevirtual 150	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   162: ldc -17
    //   164: invokevirtual 150	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   167: aload_0
    //   168: getfield 230	com/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler:fetchCompleteCount	I
    //   171: invokevirtual 155	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   174: invokevirtual 158	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   177: invokestatic 141	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   180: aload_0
    //   181: getfield 230	com/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler:fetchCompleteCount	I
    //   184: aload_0
    //   185: getfield 46	com/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler:activeRulDBDevicesCount	I
    //   188: if_icmpne +7 -> 195
    //   191: aload_0
    //   192: invokespecial 241	com/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler:onLatestDeviceDBCalculated	()V
    //   195: aload_0
    //   196: monitorexit
    //   197: return
    //   198: aload_0
    //   199: getfield 152	com/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler:latestDBVersion	I
    //   202: iload_1
    //   203: if_icmpge -91 -> 112
    //   206: aload_0
    //   207: getfield 59	com/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler:latestDBVersionDeviceUDN	Ljava/lang/StringBuilder;
    //   210: invokevirtual 158	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   213: astore 5
    //   215: aload 5
    //   217: invokestatic 190	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   220: ifne +53 -> 273
    //   223: aload_0
    //   224: getfield 64	com/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler:lowerDBVersionDeviceUDNsList	Ljava/util/ArrayList;
    //   227: aload 5
    //   229: invokevirtual 288	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   232: pop
    //   233: getstatic 40	com/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler:TAG	Ljava/lang/String;
    //   236: new 54	java/lang/StringBuilder
    //   239: dup
    //   240: invokespecial 55	java/lang/StringBuilder:<init>	()V
    //   243: ldc_w 290
    //   246: invokevirtual 150	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   249: aload 5
    //   251: invokevirtual 150	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   254: ldc_w 292
    //   257: invokevirtual 150	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   260: aload_0
    //   261: getfield 152	com/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler:latestDBVersion	I
    //   264: invokevirtual 155	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   267: invokevirtual 158	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   270: invokestatic 141	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   273: aload_0
    //   274: iload_1
    //   275: putfield 152	com/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler:latestDBVersion	I
    //   278: aload_0
    //   279: getfield 59	com/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler:latestDBVersionDeviceUDN	Ljava/lang/StringBuilder;
    //   282: iconst_0
    //   283: aload_0
    //   284: getfield 59	com/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler:latestDBVersionDeviceUDN	Ljava/lang/StringBuilder;
    //   287: invokevirtual 274	java/lang/StringBuilder:length	()I
    //   290: aload_3
    //   291: invokevirtual 278	java/lang/StringBuilder:replace	(IILjava/lang/String;)Ljava/lang/StringBuilder;
    //   294: pop
    //   295: aload_0
    //   296: getfield 57	com/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler:latestDBPathSB	Ljava/lang/StringBuilder;
    //   299: iconst_0
    //   300: aload_0
    //   301: getfield 57	com/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler:latestDBPathSB	Ljava/lang/StringBuilder;
    //   304: invokevirtual 274	java/lang/StringBuilder:length	()I
    //   307: aload_2
    //   308: invokevirtual 278	java/lang/StringBuilder:replace	(IILjava/lang/String;)Ljava/lang/StringBuilder;
    //   311: pop
    //   312: goto -200 -> 112
    //   315: astore 4
    //   317: aload_0
    //   318: monitorexit
    //   319: aload 4
    //   321: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	322	0	this	RMFetchDBRulesResponseHandler
    //   0	322	1	paramInt	int
    //   0	322	2	paramString1	String
    //   0	322	3	paramString2	String
    //   315	5	4	localObject	Object
    //   213	37	5	str	String
    // Exception table:
    //   from	to	target	type
    //   2	112	315	finally
    //   112	195	315	finally
    //   198	273	315	finally
    //   273	312	315	finally
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */