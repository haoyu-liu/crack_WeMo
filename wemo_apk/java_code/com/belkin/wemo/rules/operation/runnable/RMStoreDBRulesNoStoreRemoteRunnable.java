package com.belkin.wemo.rules.operation.runnable;

import com.belkin.wemo.cache.cloud.CloudRequestManager;
import com.belkin.wemo.cache.cloud.RMCloudRequestUpdateWeeklyCalendar;
import com.belkin.wemo.cache.cloud.data.RMPluginWeeklyCalendarData;
import com.belkin.wemo.cache.cloud.data.RMPluginWeeklyCalendarLinkData;
import com.belkin.wemo.cache.cloud.data.RMPluginWeeklyCalendarNonLinkData;
import com.belkin.wemo.cache.cloud.listener.OnRequestCompleteListener;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.utils.Constants;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.rules.data.RMDBRule;
import com.belkin.wemo.rules.data.device.RMDBRuleDevice;
import com.belkin.wemo.rules.data.weeklycalendar.RMWeeklyCalendarGeneratorUtility;
import com.belkin.wemo.rules.error.RMRulesError;
import com.belkin.wemo.rules.operation.callback.RMStoreRulesRemoteErrorCallback;
import com.belkin.wemo.rules.operation.callback.RMStoreRulesRemoteSuccessCallback;
import com.belkin.wemo.rules.util.RMIRulesUtils;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class RMStoreDBRulesNoStoreRemoteRunnable
  extends RMSyncDBRulesNoStoreRemoteRunnable
{
  private RMDBRule rule;
  
  public RMStoreDBRulesNoStoreRemoteRunnable(RMStoreRulesRemoteErrorCallback paramRMStoreRulesRemoteErrorCallback, RMStoreRulesRemoteSuccessCallback paramRMStoreRulesRemoteSuccessCallback, List<DeviceInformation> paramList, RMDBRule paramRMDBRule, HashMap<String, Object> paramHashMap, RMIRulesUtils paramRMIRulesUtils)
  {
    super(paramRMStoreRulesRemoteErrorCallback, paramRMStoreRulesRemoteSuccessCallback, paramList, paramHashMap, paramRMIRulesUtils);
    this.rule = paramRMDBRule;
  }
  
  private RMPluginWeeklyCalendarData getPluginWeeklyCalendarLink(String paramString, DeviceInformation paramDeviceInformation)
  {
    Map localMap = RMWeeklyCalendarGeneratorUtility.getLinkWeeklyCalendarStringMap(paramDeviceInformation.getUDN(), paramString);
    return new RMPluginWeeklyCalendarLinkData(paramDeviceInformation.getPluginID(), paramDeviceInformation.getMAC(), (String)localMap.get(Constants.TAG_CALENDAR_LIST));
  }
  
  private RMPluginWeeklyCalendarData getPluginWeeklyCalendarNonLink(DeviceInformation paramDeviceInformation)
  {
    Map localMap = RMWeeklyCalendarGeneratorUtility.getWeeklyCalendarStringMap(paramDeviceInformation.getUDN());
    return new RMPluginWeeklyCalendarNonLinkData(paramDeviceInformation.getPluginID(), paramDeviceInformation.getMAC(), (String)localMap.get(RMDBRule.DAY_STR_MONDAY), (String)localMap.get(RMDBRule.DAY_STR_TUESDAY), (String)localMap.get(RMDBRule.DAY_STR_WEDNESDAY), (String)localMap.get(RMDBRule.DAY_STR_THURSDAY), (String)localMap.get(RMDBRule.DAY_STR_FRIDAY), (String)localMap.get(RMDBRule.DAY_STR_SATURDAY), (String)localMap.get(RMDBRule.DAY_STR_SUNDAY));
  }
  
  public void run()
  {
    Set localSet = this.rule.getRuleDeviceSet();
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator1 = this.devicesList.iterator();
    while (localIterator1.hasNext())
    {
      String str1 = ((DeviceInformation)localIterator1.next()).getUDN();
      Iterator localIterator2 = localSet.iterator();
      while (localIterator2.hasNext())
      {
        String str2 = ((RMDBRuleDevice)localIterator2.next()).getUiUdn();
        SDKLogUtils.debugLog(this.TAG, "Store Rules (No Store): Is UpdateWeeklyCalendar required check. RuleDeviceUDN: " + str2 + "; Current Device UDN: " + str1);
        if (str2.equals(str1))
        {
          SDKLogUtils.debugLog(this.TAG, "Store Rules (No Store): MATCH FOUND. WEEKLY CALENDAR REQUIRED for UDN: " + str2);
          if (!str1.contains("Bridge")) {}
        }
      }
    }
    if (localArrayList.size() > 0)
    {
      RMCloudRequestUpdateWeeklyCalendar localRMCloudRequestUpdateWeeklyCalendar = new RMCloudRequestUpdateWeeklyCalendar(localArrayList, new UpdateWeeklyCalendarResponse(null));
      this.rulesUtils.getCloudRequestManager().makeRequest(localRMCloudRequestUpdateWeeklyCalendar);
      return;
    }
    sendDBFileToCloud();
  }
  
  private class UpdateWeeklyCalendarResponse
    implements OnRequestCompleteListener
  {
    private UpdateWeeklyCalendarResponse() {}
    
    public void onRequestComplete(boolean paramBoolean, int paramInt, byte[] paramArrayOfByte)
    {
      SDKLogUtils.infoLog(RMStoreDBRulesNoStoreRemoteRunnable.this.TAG, "Store Rules (No Store): updateWeeklyCalendar remote call response. status = " + paramInt);
      if (paramInt != 200)
      {
        if (RMStoreDBRulesNoStoreRemoteRunnable.this.errorCallback != null) {
          RMStoreDBRulesNoStoreRemoteRunnable.this.errorCallback.onError(new RMRulesError(), RMStoreDBRulesNoStoreRemoteRunnable.this.devicesList, 1);
        }
        return;
      }
      RMStoreDBRulesNoStoreRemoteRunnable.this.sendDBFileToCloud();
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/operation/runnable/RMStoreDBRulesNoStoreRemoteRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */