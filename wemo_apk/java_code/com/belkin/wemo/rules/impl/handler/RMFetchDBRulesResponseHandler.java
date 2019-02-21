package com.belkin.wemo.rules.impl.handler;

import android.content.Context;
import android.text.TextUtils;
import com.belkin.wemo.cache.cloud.CloudRequestManager;
import com.belkin.wemo.cache.cloud.RMCloudRequestGetDBFile;
import com.belkin.wemo.cache.cloud.listener.OnRequestCompleteListener;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.cache.utils.SharePreferences;
import com.belkin.wemo.rules.RMIRulesDependencyProvider;
import com.belkin.wemo.rules.RMRulesSDK;
import com.belkin.wemo.rules.callback.FetchRulesErrorCallback;
import com.belkin.wemo.rules.callback.FetchRulesSuccessCallback;
import com.belkin.wemo.rules.device.callback.RMFetchDeviceRulesErrorCallback;
import com.belkin.wemo.rules.device.callback.RMFetchDeviceRulesSuccesCallback;
import com.belkin.wemo.rules.device.error.RMRuleDeviceError;
import com.belkin.wemo.rules.error.RMRulesError;
import com.belkin.wemo.rules.util.RMIRulesUtils;
import java.io.IOException;
import java.util.ArrayList;

public class RMFetchDBRulesResponseHandler
  implements RMFetchDeviceRulesErrorCallback, RMFetchDeviceRulesSuccesCallback, OnRequestCompleteListener
{
  public static final String TAG = RMFetchDBRulesResponseHandler.class.getSimpleName();
  private int activeRulDBDevicesCount;
  private Context context;
  private FetchRulesErrorCallback errorCallback;
  private int fetchCompleteCount;
  private StringBuilder latestDBPathSB;
  private int latestDBVersion;
  private StringBuilder latestDBVersionDeviceUDN;
  private ArrayList<String> lowerDBVersionDeviceUDNsList;
  private RMIRulesUtils rulesUtils;
  private FetchRulesSuccessCallback successCallback;
  
  public RMFetchDBRulesResponseHandler(Context paramContext, FetchRulesSuccessCallback paramFetchRulesSuccessCallback, FetchRulesErrorCallback paramFetchRulesErrorCallback, int paramInt)
  {
    this.activeRulDBDevicesCount = paramInt;
    this.errorCallback = paramFetchRulesErrorCallback;
    this.successCallback = paramFetchRulesSuccessCallback;
    this.latestDBPathSB = new StringBuilder();
    this.latestDBVersionDeviceUDN = new StringBuilder();
    this.lowerDBVersionDeviceUDNsList = new ArrayList();
    this.context = paramContext;
    this.rulesUtils = RMRulesSDK.instance().getDependencyProvider().provideIRulesUtils();
  }
  
  private void downloadLatestDeviceDBToApp(String paramString)
  {
    RMCloudRequestGetDBFile localRMCloudRequestGetDBFile = new RMCloudRequestGetDBFile(DeviceListManager.getInstance(this.context).getDevice(this.latestDBVersionDeviceUDN.toString()).getMAC(), this);
    new CloudRequestManager(this.context).makeRequest(localRMCloudRequestGetDBFile);
  }
  
  private void onLatestDeviceDBCalculated()
  {
    SDKLogUtils.infoLog(TAG, "Fetch Rules: response received for all devices");
    String str1 = this.rulesUtils.getRulesDBVerion();
    SDKLogUtils.infoLog(TAG, "Fetch Rules: Latest Device DB Version = " + this.latestDBVersion);
    SDKLogUtils.infoLog(TAG, "Fetch Rules: DB Version In App = " + str1);
    SDKLogUtils.infoLog(TAG, "Fetch Rules: Latest device DB path: " + this.latestDBPathSB);
    if (((this.latestDBVersion != 0) && (this.latestDBVersion > Integer.valueOf(str1).intValue())) || (!this.rulesUtils.doesRulesDBFileExist()))
    {
      String str2 = this.latestDBPathSB.toString();
      if (!TextUtils.isEmpty(str2))
      {
        SDKLogUtils.infoLog(TAG, "Fetch Rules: Setting new App DB Version to " + this.latestDBVersion);
        this.rulesUtils.setRulesDBVersion(String.valueOf(this.latestDBVersion));
        downloadLatestDeviceDBToApp(str2);
        return;
      }
      sendError(new RMRulesError(65135, "Invalid Device DB Path"));
      return;
    }
    if (this.latestDBVersion == 0)
    {
      SDKLogUtils.infoLog(TAG, "Fetch Rules: Setting new App DB Version to " + this.latestDBVersion);
      this.rulesUtils.setRulesDBVersion("0");
      this.rulesUtils.deleteRulesDBFileInApp();
      sendSuccessResponse("", this.latestDBVersion, this.lowerDBVersionDeviceUDNsList);
      return;
    }
    sendSuccessResponse("", this.latestDBVersion, this.lowerDBVersionDeviceUDNsList);
  }
  
  private void sendError(RMRulesError paramRMRulesError)
  {
    SDKLogUtils.errorLog(TAG, "Fetch Rules: ERROR: " + paramRMRulesError.getErrorMessage());
    if (this.errorCallback != null) {
      this.errorCallback.onError();
    }
  }
  
  private void sendSuccessResponse(String paramString, int paramInt, ArrayList<String> paramArrayList)
  {
    if (this.successCallback != null) {
      this.successCallback.onSuccess(paramString, paramInt, paramArrayList);
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
  
  public void onRequestComplete(boolean paramBoolean, int paramInt, byte[] paramArrayOfByte)
  {
    try
    {
      com.belkin.rules.utils.RuleUtility.downloadFromUrl(paramArrayOfByte, com.belkin.utils.RuleUtility.getLocalDBPath() + com.belkin.utils.RuleUtility.getLocalDBName(), this.context);
      new SharePreferences(this.context).setDBVersion(String.valueOf(this.latestDBVersion));
      sendSuccessResponse("", paramInt, this.lowerDBVersionDeviceUDNsList);
      return;
    }
    catch (IOException localIOException)
    {
      while (this.errorCallback == null) {}
      this.errorCallback.onError();
    }
  }
  
  /* Error */
  public void onSuccess(int paramInt, String paramString1, String paramString2)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 138	com/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler:latestDBVersion	I
    //   6: iload_1
    //   7: if_icmpge +195 -> 202
    //   10: aload_0
    //   11: getfield 57	com/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler:latestDBVersionDeviceUDN	Ljava/lang/StringBuilder;
    //   14: invokevirtual 95	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   17: astore 6
    //   19: aload 6
    //   21: invokestatic 168	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   24: ifne +53 -> 77
    //   27: aload_0
    //   28: getfield 62	com/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler:lowerDBVersionDeviceUDNsList	Ljava/util/ArrayList;
    //   31: aload 6
    //   33: invokevirtual 263	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   36: pop
    //   37: getstatic 40	com/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler:TAG	Ljava/lang/String;
    //   40: new 52	java/lang/StringBuilder
    //   43: dup
    //   44: invokespecial 53	java/lang/StringBuilder:<init>	()V
    //   47: ldc_w 265
    //   50: invokevirtual 136	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   53: aload 6
    //   55: invokevirtual 136	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   58: ldc_w 267
    //   61: invokevirtual 136	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   64: aload_0
    //   65: getfield 138	com/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler:latestDBVersion	I
    //   68: invokevirtual 141	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   71: invokevirtual 95	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   74: invokestatic 125	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   77: aload_0
    //   78: iload_1
    //   79: putfield 138	com/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler:latestDBVersion	I
    //   82: aload_0
    //   83: getfield 57	com/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler:latestDBVersionDeviceUDN	Ljava/lang/StringBuilder;
    //   86: iconst_0
    //   87: aload_0
    //   88: getfield 57	com/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler:latestDBVersionDeviceUDN	Ljava/lang/StringBuilder;
    //   91: invokevirtual 270	java/lang/StringBuilder:length	()I
    //   94: aload_3
    //   95: invokevirtual 274	java/lang/StringBuilder:replace	(IILjava/lang/String;)Ljava/lang/StringBuilder;
    //   98: pop
    //   99: aload_0
    //   100: getfield 55	com/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler:latestDBPathSB	Ljava/lang/StringBuilder;
    //   103: iconst_0
    //   104: aload_0
    //   105: getfield 55	com/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler:latestDBPathSB	Ljava/lang/StringBuilder;
    //   108: invokevirtual 270	java/lang/StringBuilder:length	()I
    //   111: aload_2
    //   112: invokevirtual 274	java/lang/StringBuilder:replace	(IILjava/lang/String;)Ljava/lang/StringBuilder;
    //   115: pop
    //   116: aload_0
    //   117: iconst_1
    //   118: aload_0
    //   119: getfield 223	com/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler:fetchCompleteCount	I
    //   122: iadd
    //   123: putfield 223	com/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler:fetchCompleteCount	I
    //   126: getstatic 40	com/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler:TAG	Ljava/lang/String;
    //   129: new 52	java/lang/StringBuilder
    //   132: dup
    //   133: invokespecial 53	java/lang/StringBuilder:<init>	()V
    //   136: ldc_w 276
    //   139: invokevirtual 136	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   142: aload_3
    //   143: invokevirtual 136	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   146: ldc_w 278
    //   149: invokevirtual 136	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   152: iload_1
    //   153: invokevirtual 141	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   156: ldc_w 280
    //   159: invokevirtual 136	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   162: aload_2
    //   163: invokevirtual 136	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   166: ldc -24
    //   168: invokevirtual 136	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   171: aload_0
    //   172: getfield 223	com/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler:fetchCompleteCount	I
    //   175: invokevirtual 141	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   178: invokevirtual 95	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   181: invokestatic 125	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   184: aload_0
    //   185: getfield 223	com/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler:fetchCompleteCount	I
    //   188: aload_0
    //   189: getfield 46	com/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler:activeRulDBDevicesCount	I
    //   192: if_icmpne +7 -> 199
    //   195: aload_0
    //   196: invokespecial 234	com/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler:onLatestDeviceDBCalculated	()V
    //   199: aload_0
    //   200: monitorexit
    //   201: return
    //   202: aload_0
    //   203: getfield 138	com/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler:latestDBVersion	I
    //   206: iload_1
    //   207: if_icmple -91 -> 116
    //   210: getstatic 40	com/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler:TAG	Ljava/lang/String;
    //   213: new 52	java/lang/StringBuilder
    //   216: dup
    //   217: invokespecial 53	java/lang/StringBuilder:<init>	()V
    //   220: ldc_w 282
    //   223: invokevirtual 136	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   226: aload_3
    //   227: invokevirtual 136	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   230: ldc_w 267
    //   233: invokevirtual 136	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   236: iload_1
    //   237: invokevirtual 141	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   240: invokevirtual 95	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   243: invokestatic 125	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   246: aload_0
    //   247: getfield 62	com/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler:lowerDBVersionDeviceUDNsList	Ljava/util/ArrayList;
    //   250: aload_3
    //   251: invokevirtual 263	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   254: pop
    //   255: goto -139 -> 116
    //   258: astore 4
    //   260: aload_0
    //   261: monitorexit
    //   262: aload 4
    //   264: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	265	0	this	RMFetchDBRulesResponseHandler
    //   0	265	1	paramInt	int
    //   0	265	2	paramString1	String
    //   0	265	3	paramString2	String
    //   258	5	4	localObject	Object
    //   17	37	6	str	String
    // Exception table:
    //   from	to	target	type
    //   2	77	258	finally
    //   77	116	258	finally
    //   116	199	258	finally
    //   202	255	258	finally
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */