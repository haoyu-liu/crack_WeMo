package com.belkin.wemo.rules.runnable;

import android.content.Context;
import android.text.TextUtils;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.cache.cloud.CloudRequestManager;
import com.belkin.wemo.cache.cloud.RMCloudRequestStoreRules;
import com.belkin.wemo.cache.cloud.RMCloudRequestStoreRules.PluginStoreRulesData;
import com.belkin.wemo.cache.cloud.listener.OnRequestCompleteListener;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.cache.utils.SharePreferences;
import com.belkin.wemo.rules.callback.StoreRulesErrorCallback;
import com.belkin.wemo.rules.callback.StoreRulesSuccessCallback;
import com.belkin.wemo.rules.error.RMRulesError;
import com.belkin.wemo.runnable.WeMoRunnable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import org.cybergarage.upnp.Device;

public class StoreRulesRemoteRunnable
  extends WeMoRunnable
  implements OnRequestCompleteListener
{
  public static final String BRIDGE_STUB = "bridge";
  public static final int STATE_DO_NOT_PROCESS_DB = -1;
  public static final int STATE_LINK_PROCESS_DB = 2;
  public static final int STATE_NOT_LINK_PROCESS_DB = 1;
  private String base64EncodedDbZip;
  private Context context;
  private int dbVersionToSend = -1;
  private List<DeviceInformation> devicesList;
  private StoreRulesErrorCallback errorCallback;
  private List<Device> nonRuleDevicesList;
  private ArrayList<RMCloudRequestStoreRules.PluginStoreRulesData> pluginStoreRulesDataList;
  private List<Device> ruleDevicesList;
  private SharePreferences sharePreference;
  private StoreRulesSuccessCallback successCallback;
  private HashMap<String, String[]> weeklyRecordsHashMap;
  
  public StoreRulesRemoteRunnable(Context paramContext, List<DeviceInformation> paramList, String paramString, HashMap<String, String[]> paramHashMap, StoreRulesSuccessCallback paramStoreRulesSuccessCallback, StoreRulesErrorCallback paramStoreRulesErrorCallback)
  {
    this.base64EncodedDbZip = paramString;
    this.context = paramContext;
    this.sharePreference = new SharePreferences(paramContext);
    this.weeklyRecordsHashMap = paramHashMap;
    this.successCallback = paramStoreRulesSuccessCallback;
    this.errorCallback = paramStoreRulesErrorCallback;
    this.devicesList = paramList;
  }
  
  private boolean checkUdnExistenceInWeeklyCalendar(String paramString)
  {
    boolean bool = false;
    Iterator localIterator = this.weeklyRecordsHashMap.keySet().iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      LogUtils.infoLog(this.TAG, "key: " + str + " value: " + ((String[])this.weeklyRecordsHashMap.get(str)).toString());
      if (str.toLowerCase(Locale.getDefault()).contains(paramString.toLowerCase(Locale.getDefault()))) {
        bool = true;
      }
    }
    LogUtils.infoLog(this.TAG, "flag " + bool);
    return bool;
  }
  
  private void createPluginStoreRulesDataList()
  {
    this.pluginStoreRulesDataList = new ArrayList();
    int i = this.devicesList.size();
    LogUtils.infoLog(this.TAG, "Store Rules: Total upnp devices count = " + i);
    Iterator localIterator = this.devicesList.iterator();
    while (localIterator.hasNext())
    {
      DeviceInformation localDeviceInformation = (DeviceInformation)localIterator.next();
      String str1 = localDeviceInformation.getPluginID();
      String str2 = "0";
      boolean bool = checkUdnExistenceInWeeklyCalendar(localDeviceInformation.getUDN());
      LogUtils.infoLog(this.TAG, "udnExitsInWeeklyCalendar " + bool + " devInfo: " + localDeviceInformation);
      if (bool) {
        str2 = "1";
      }
      String str3 = localDeviceInformation.getMAC();
      LogUtils.infoLog(this.TAG, "processDb " + str2 + " :plugingId: " + str1 + " :macAddress: " + str3);
      this.pluginStoreRulesDataList.add(new RMCloudRequestStoreRules.PluginStoreRulesData(str1, str3, str2));
    }
  }
  
  private int getDBVersionToStoreOnDevice()
  {
    String str;
    if (this.dbVersionToSend == -1)
    {
      str = this.sharePreference.getDBVersion();
      if (!TextUtils.isDigitsOnly(str)) {
        break label41;
      }
    }
    label41:
    for (this.dbVersionToSend = (1 + Integer.valueOf(str).intValue());; this.dbVersionToSend = 1) {
      return this.dbVersionToSend;
    }
  }
  
  protected String getLoggerTag()
  {
    return getClass().getSimpleName() + ":" + Thread.currentThread().getId();
  }
  
  public void onRequestComplete(boolean paramBoolean, int paramInt, byte[] paramArrayOfByte)
  {
    if (paramBoolean) {
      if (this.successCallback != null) {
        this.successCallback.onSuccess();
      }
    }
    while (this.errorCallback == null) {
      return;
    }
    this.errorCallback.onError(new RMRulesError());
  }
  
  public void run()
  {
    SDKLogUtils.infoLog(this.TAG, "in StoreRulesRemoteRunnable: is remote enabled: ");
    try
    {
      createPluginStoreRulesDataList();
      RMCloudRequestStoreRules localRMCloudRequestStoreRules = new RMCloudRequestStoreRules(this.pluginStoreRulesDataList, this, this.base64EncodedDbZip, getDBVersionToStoreOnDevice());
      new CloudRequestManager(this.context).makeRequest(localRMCloudRequestStoreRules);
      return;
    }
    catch (Exception localException)
    {
      SDKLogUtils.errorLog(this.TAG, "Exception: ", localException);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/runnable/StoreRulesRemoteRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */