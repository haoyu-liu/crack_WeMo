package com.belkin.wemo.push.service;

import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import com.belkin.rules.db.RMRulesDBManager;
import com.belkin.utils.LogUtils;
import com.belkin.utils.RuleUtility;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.push.PushNotificationInfo;
import com.belkin.wemo.rules.IWeMoRules;
import com.belkin.wemo.rules.RMIRules;
import com.belkin.wemo.rules.RMIRulesDependencyProvider;
import com.belkin.wemo.rules.RMRulesSDK;
import com.belkin.wemo.rules.callback.FetchRulesErrorCallback;
import com.belkin.wemo.rules.callback.FetchRulesSuccessCallback;
import com.belkin.wemo.rules.callback.RMShowRulesSuccessCallback;
import com.belkin.wemo.rules.callback.StoreRulesErrorCallback;
import com.belkin.wemo.rules.callback.StoreRulesSuccessCallback;
import com.belkin.wemo.rules.data.RMRule;
import com.belkin.wemo.rules.data.RMUserRules;
import com.belkin.wemo.rules.error.RMRulesError;
import com.belkin.wemo.rules.impl.WeMoRulesFactory;
import com.belkin.wemo.rules.operation.db.exception.RuleDBException;
import com.belkin.wemo.rules.util.RMIRulesUtils;
import com.google.android.gms.gcm.GoogleCloudMessaging;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

public class GCMIntentService
  extends PushNotificationIntentService
{
  public static final String DELETED_MSG_STUB = "Messages deleted on server";
  public static final String ERROR_STUB = "Error received in GCM Push Notification";
  public static final String GCM_SERVICE_NAME = "GCMIntentService";
  public static final String KEY_PAYLOAD = "payload";
  public static RMRulesDBManager rMRulesDBManager;
  public static DeviceListManager sDeviceListManager;
  HashMap<String, String[]> weeklyRecordsHashMap = null;
  
  public GCMIntentService()
  {
    super("GCMIntentService");
  }
  
  public GCMIntentService(String paramString)
  {
    super(paramString);
  }
  
  private String getMessageType(Intent paramIntent)
  {
    String str = GoogleCloudMessaging.getInstance(this).getMessageType(paramIntent);
    LogUtils.infoLog(this.TAG, "Push Notification: GCM message received - message type: " + str);
    return str;
  }
  
  protected PushNotificationInfo getNotificationMessage(Intent paramIntent)
  {
    new String();
    PushNotificationInfo localPushNotificationInfo = new PushNotificationInfo();
    Bundle localBundle = paramIntent.getExtras();
    String str1 = getMessageType(paramIntent);
    if (!localBundle.isEmpty())
    {
      if (SDKLogUtils.isDebug())
      {
        LogUtils.debugLog(this.TAG, "Push Notification Bundle. Printing the Intent: " + paramIntent.toString());
        LogUtils.debugLog(this.TAG, "Push Notification Bundle. Printing the Extras inside Intent: " + localBundle.toString());
        Iterator localIterator2 = localBundle.keySet().iterator();
        while (localIterator2.hasNext())
        {
          String str17 = (String)localIterator2.next();
          try
          {
            LogUtils.debugLog(this.TAG, "Push Notification Bundle. Key: " + str17 + "; Value: " + localBundle.get(str17));
          }
          catch (Exception localException)
          {
            LogUtils.errorLog(this.TAG, "Exception while iterating over Push Notification Bundle Extras: ", localException);
          }
        }
      }
      if (!"send_error".equals(str1)) {
        break label233;
      }
      new StringBuilder().append("Error received in GCM Push Notification").append(localBundle.toString()).toString();
    }
    label233:
    do
    {
      return localPushNotificationInfo;
      if ("deleted_messages".equals(str1))
      {
        new StringBuilder().append("Messages deleted on server").append(localBundle.toString()).toString();
        return localPushNotificationInfo;
      }
    } while (!"gcm".equals(str1));
    sDeviceListManager = DeviceListManager.getInstance(getApplicationContext());
    String str2 = paramIntent.getStringExtra("statusMessage");
    if (str2 != null)
    {
      LogUtils.infoLog(this.TAG, "Push Notification: statusMessage: " + str2);
      if (!str2.contains("v10002")) {
        break label761;
      }
      LogUtils.infoLog(this.TAG, "Nest Silent Push Payload not available");
      sDeviceListManager.getNestDevicesFromCloud();
      if (str2.contains("REST_REMOVE"))
      {
        LogUtils.infoLog(this.TAG, "Push Notification: Nest Silent Push for Deauth");
        IWeMoRules localIWeMoRules = WeMoRulesFactory.getInstance(getApplicationContext());
        FetchDevicesRulesCallback localFetchDevicesRulesCallback = new FetchDevicesRulesCallback();
        localIWeMoRules.fetchRules(getApplicationContext(), localFetchDevicesRulesCallback, localFetchDevicesRulesCallback);
      }
    }
    label407:
    String str3 = paramIntent.getStringExtra("eventCode");
    localPushNotificationInfo.setEventCode(str3);
    LogUtils.infoLog(this.TAG, "Push Notification: " + str3);
    final String str14;
    if (!TextUtils.isEmpty(str3))
    {
      if (!str3.equals("CREATE_RULE")) {
        break label938;
      }
      String str12 = paramIntent.getStringExtra("eventMessage");
      if (!TextUtils.isEmpty(str12))
      {
        String[] arrayOfString1 = str12.split("#\\$");
        if (arrayOfString1.length >= 2)
        {
          String str13 = arrayOfString1[0];
          str14 = arrayOfString1[1];
          LogUtils.debugLog(this.TAG, "Push Notification: Rule change notification. UDN: " + str14 + "; ruleDBVersion: " + str13);
          String str15 = RMRulesSDK.instance().getDependencyProvider().provideIRulesUtils().getRulesDBVerion();
          if (str15 != null)
          {
            LogUtils.debugLog(this.TAG, "Push Notification: dbVersion: " + str15);
            if (Integer.valueOf(str13).intValue() <= Integer.valueOf(str15).intValue()) {
              break label917;
            }
            RMRulesSDK.instance().getDependencyProvider().provideIRulesUtils().setRulesDBVersion("0");
            RMIRules localRMIRules = RMRulesSDK.instance().getRules();
            RMShowRulesSuccessCallback local1 = new RMShowRulesSuccessCallback()
            {
              public void onSuccess(List<RMRule> paramAnonymousList)
              {
                DeviceListManager.getInstance(GCMIntentService.this.getApplicationContext()).refreshLongPressRuleDetails(str14, paramAnonymousList);
              }
            };
            localRMIRules.fetchRules(local1, null);
          }
        }
      }
    }
    for (;;)
    {
      String str4 = paramIntent.getStringExtra("payload");
      localPushNotificationInfo.setPushNotificationMsg(str4);
      if (!TextUtils.isEmpty(str4)) {
        break;
      }
      String str5 = paramIntent.getStringExtra("macAddress");
      String str6 = paramIntent.getStringExtra("status");
      LogUtils.infoLog(this.TAG, "Push Notification: Silent Notification: Status = " + str6 + "; MAC = " + str5);
      DeviceListManager.getInstance(getApplicationContext()).onSilentStatusNotificationReceived(str6, str5);
      return localPushNotificationInfo;
      label761:
      if (!str2.contains("v10001")) {
        break label407;
      }
      LogUtils.infoLog(this.TAG, "Push Notification: Nest Silent Push Payload available");
      Iterator localIterator1 = localBundle.keySet().iterator();
      while (localIterator1.hasNext())
      {
        String str16 = (String)localIterator1.next();
        if (str16.contains("WEMO00"))
        {
          String[] arrayOfString2 = str16.split("\\.");
          if (arrayOfString2.length > 0)
          {
            sDeviceListManager.onNestSilentPushNotificationReceived(arrayOfString2[0], arrayOfString2[1], localBundle.get(str16).toString());
            LogUtils.infoLog(this.TAG, "Push Notification: Nest attributeValue: " + localBundle.get(str16).toString() + "Nest :key: " + str16);
          }
        }
      }
      break label407;
      label917:
      DeviceListManager.getInstance(getApplicationContext()).refreshLongPressRuleDetails(str14, RMUserRules.INSTANCE.getRulesList());
      continue;
      label938:
      if (str3.equalsIgnoreCase("overtempoff"))
      {
        String str9 = paramIntent.getStringExtra("macAddress");
        if (str3.equalsIgnoreCase("overtempon"))
        {
          localPushNotificationInfo.setAlertDialogRequired(false);
          DeviceInformation localDeviceInformation3 = DeviceListManager.getInstance(getApplicationContext()).onOverTempNotificationReceived("1", str9);
          if (localDeviceInformation3 != null)
          {
            localPushNotificationInfo.setMac(str9);
            String str11 = paramIntent.getStringExtra("tempName");
            if (TextUtils.isEmpty(str11)) {
              str11 = localDeviceInformation3.getFriendlyName();
            }
            localPushNotificationInfo.setFriendlyName(str11);
          }
        }
        else if (str3.equalsIgnoreCase("overtempoff"))
        {
          localPushNotificationInfo.setAlertDialogRequired(false);
          DeviceInformation localDeviceInformation2 = DeviceListManager.getInstance(getApplicationContext()).onOverTempNotificationReceived("0", str9);
          if (localDeviceInformation2 != null)
          {
            localPushNotificationInfo.setMac(str9);
            String str10 = paramIntent.getStringExtra("tempName");
            if (TextUtils.isEmpty(str10)) {
              str10 = localDeviceInformation2.getFriendlyName();
            }
            localPushNotificationInfo.setFriendlyName(str10);
          }
        }
      }
      else if (str3.equalsIgnoreCase("overtempon2"))
      {
        String str7 = paramIntent.getStringExtra("macAddress");
        localPushNotificationInfo.setAlertDialogRequired(false);
        DeviceInformation localDeviceInformation1 = DeviceListManager.getInstance(getApplicationContext()).onOverTempNotificationReceived("2", str7);
        if (localDeviceInformation1 != null)
        {
          localPushNotificationInfo.setMac(str7);
          String str8 = paramIntent.getStringExtra("tempName");
          if (TextUtils.isEmpty(str8)) {
            str8 = localDeviceInformation1.getFriendlyName();
          }
          localPushNotificationInfo.setFriendlyName(str8);
        }
      }
    }
  }
  
  private class FetchDevicesRulesCallback
    implements FetchRulesErrorCallback, FetchRulesSuccessCallback
  {
    public FetchDevicesRulesCallback() {}
    
    private boolean doesRulesDBExist()
    {
      return new File(RuleUtility.getLocalDBPath(), RuleUtility.getLocalDBName()).exists();
    }
    
    private HashMap<String, String[]> getWeeklyCalender(ArrayList<String> paramArrayList)
    {
      LogUtils.infoLog(GCMIntentService.this.TAG, "Get Weekly Calendar");
      try
      {
        ArrayList localArrayList2 = GCMIntentService.rMRulesDBManager.getTargetDeviceUDNForNestDevices(paramArrayList);
        localArrayList1 = localArrayList2;
      }
      catch (RuleDBException localRuleDBException)
      {
        for (;;)
        {
          int i;
          LogUtils.errorLog(GCMIntentService.this.TAG, "RuleDBException: " + localRuleDBException.getMessage());
          localRuleDBException.printStackTrace();
          ArrayList localArrayList1 = null;
        }
      }
      HashMap localHashMap = new HashMap();
      for (i = 0; i < localArrayList1.size(); i++)
      {
        String str = (String)localArrayList1.get(i);
        LogUtils.infoLog(GCMIntentService.this.TAG, "Target Device UDN For Nest Devices: " + str);
        localHashMap.put(str, new String[0]);
      }
      return localHashMap;
    }
    
    public void onError()
    {
      LogUtils.errorLog(GCMIntentService.this.TAG, "FetchDevicerulesCallback: error during fetchRules().");
    }
    
    public void onSuccess(String paramString, int paramInt, ArrayList<String> paramArrayList)
    {
      LogUtils.infoLog(GCMIntentService.this.TAG, "FetchDevicerulesCallback: on success during fetchRules().");
      ArrayList localArrayList = null;
      if (doesRulesDBExist())
      {
        GCMIntentService.rMRulesDBManager = RMRulesDBManager.getInstance(GCMIntentService.this.getApplicationContext());
        try
        {
          localArrayList = GCMIntentService.rMRulesDBManager.getRuleIdArrayForNestDevices();
          GCMIntentService.this.weeklyRecordsHashMap = getWeeklyCalender(localArrayList);
          for (int i = 0; i < localArrayList.size(); i++)
          {
            String str = (String)localArrayList.get(i);
            LogUtils.infoLog(GCMIntentService.this.TAG, "RuleId: " + str);
            GCMIntentService.rMRulesDBManager.deleteRowRules(Integer.parseInt(str));
            GCMIntentService.rMRulesDBManager.deleteRowRuleDevices(Integer.parseInt(str));
          }
          GCMIntentService.StoreDeviceRulesCallback localStoreDeviceRulesCallback;
          LogUtils.infoLog(GCMIntentService.this.TAG, "Rule DB does not exists.");
        }
        catch (RuleDBException localRuleDBException)
        {
          LogUtils.errorLog(GCMIntentService.this.TAG, "RuleDBException: " + localRuleDBException.getMessage());
          if (localArrayList.size() > 0)
          {
            localStoreDeviceRulesCallback = new GCMIntentService.StoreDeviceRulesCallback(GCMIntentService.this);
            WeMoRulesFactory.getInstance(GCMIntentService.this.getApplicationContext()).storeRules(GCMIntentService.this.getApplicationContext(), GCMIntentService.this.weeklyRecordsHashMap, localStoreDeviceRulesCallback, localStoreDeviceRulesCallback);
          }
          return;
        }
      }
    }
  }
  
  private class StoreDeviceRulesCallback
    implements StoreRulesErrorCallback, StoreRulesSuccessCallback
  {
    public StoreDeviceRulesCallback() {}
    
    public void onError(RMRulesError paramRMRulesError)
    {
      LogUtils.infoLog(GCMIntentService.this.TAG, "Store Device Rules Callback on Error.");
      if (GCMIntentService.this.weeklyRecordsHashMap != null) {
        GCMIntentService.this.weeklyRecordsHashMap.clear();
      }
    }
    
    public void onSuccess()
    {
      LogUtils.infoLog(GCMIntentService.this.TAG, "Store Device Rules Callback on Success.");
      GCMIntentService.sDeviceListManager.sendNotification("nest_deauthorized", "", "");
      if (GCMIntentService.this.weeklyRecordsHashMap != null) {
        GCMIntentService.this.weeklyRecordsHashMap.clear();
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/push/service/GCMIntentService.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */