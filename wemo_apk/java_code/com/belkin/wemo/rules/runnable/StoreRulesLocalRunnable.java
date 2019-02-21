package com.belkin.wemo.rules.runnable;

import android.content.Context;
import android.text.TextUtils;
import com.belkin.utils.LogUtils;
import com.belkin.utils.RuleUtility;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.utils.SharePreferences;
import com.belkin.wemo.rules.IWeMoRules;
import com.belkin.wemo.rules.callback.FetchRulesErrorCallback;
import com.belkin.wemo.rules.callback.FetchRulesSuccessCallback;
import com.belkin.wemo.rules.callback.StoreRulesErrorCallback;
import com.belkin.wemo.rules.callback.StoreRulesSuccessCallback;
import com.belkin.wemo.rules.device.IDeviceRules;
import com.belkin.wemo.rules.device.callback.StoreDeviceRulesCallback;
import com.belkin.wemo.rules.device.error.RuleDeviceError;
import com.belkin.wemo.rules.device.impl.DeviceRulesFactory;
import com.belkin.wemo.rules.error.RMRulesError;
import com.belkin.wemo.rules.impl.WeMoRulesFactory;
import com.belkin.wemo.runnable.WeMoRunnable;
import com.belkin.wemo.thread.WeMoThreadPoolHandler;
import com.belkin.wemo.utils.WeMoUtils;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import org.cybergarage.upnp.Device;

public class StoreRulesLocalRunnable
  implements Runnable
{
  public static final String BRIDGE_STUB = "bridge";
  public static final String DB_DOWNLOAD_EXCEPTION = "DB Download failed.";
  public static final String DB_PATH_STUB = "/temprules.db";
  public static final String INVALID_DB_PATH_EXCEPTION = "Invalid Device DB Path";
  public static final String MAKER_STUB = "maker";
  public static final int STATE_DO_NOT_PROCESS_DB = -1;
  public static final int STATE_LINK_PROCESS_DB = 2;
  public static final int STATE_NOT_LINK_PROCESS_DB = 1;
  public static final String TAG = "StoreRulesLocalRunnable";
  public static final String UUID_STUB = "uuid";
  private static Object storeRuleslock = new Object();
  private Context context;
  private int dbVersionToSend = -1;
  private StoreRulesErrorCallback errorCallback;
  private String localZippedDBFilePath;
  private List<Device> nonRuleDevicesList;
  private List<Device> ruleDevicesList;
  private SharePreferences sharePreference;
  private StoreRulesSuccessCallback successCallback;
  private HashMap<String, ProcessDBModel> udnToProcessDBModelMap;
  private HashMap<String, String[]> weeklyRecordsHashMap;
  
  public StoreRulesLocalRunnable(Context paramContext, StoreRulesSuccessCallback paramStoreRulesSuccessCallback, StoreRulesErrorCallback paramStoreRulesErrorCallback, HashMap<String, String[]> paramHashMap)
  {
    this.context = paramContext;
    this.successCallback = paramStoreRulesSuccessCallback;
    this.errorCallback = paramStoreRulesErrorCallback;
    this.weeklyRecordsHashMap = paramHashMap;
    this.sharePreference = new SharePreferences(paramContext);
    this.localZippedDBFilePath = "";
    this.udnToProcessDBModelMap = new HashMap();
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
  
  private String getLocalZippedDBFilePath()
  {
    synchronized (storeRuleslock)
    {
      if (TextUtils.isEmpty(this.localZippedDBFilePath))
      {
        LogUtils.infoLog("StoreRulesLocalRunnable", "Store Rules: local zipped file path string is null. Creating zipped file");
        this.localZippedDBFilePath = new RuleUtility(this.context).getLocalZippedDBFilePath(getDBVersionToStoreOnDevice());
        String str = this.localZippedDBFilePath;
        return str;
      }
      LogUtils.infoLog("StoreRulesLocalRunnable", "Store Rules: local zipped file path string is avialable for use.");
    }
  }
  
  private ProcessDBModel getProcessDBModelForDevice(String paramString)
  {
    int i = -1;
    String[] arrayOfString = (String[])this.weeklyRecordsHashMap.get(paramString);
    if (arrayOfString != null) {
      i = 1;
    }
    for (;;)
    {
      return new ProcessDBModel(i, paramString, arrayOfString);
      arrayOfString = (String[])this.weeklyRecordsHashMap.get(WeMoUtils.getMakerUDNComparisonString(paramString));
      if (arrayOfString != null)
      {
        i = 1;
      }
      else
      {
        arrayOfString = (String[])this.weeklyRecordsHashMap.get("bridge");
        if ((arrayOfString != null) && (paramString.toLowerCase(Locale.getDefault()).contains("bridge"))) {
          i = 2;
        }
      }
    }
  }
  
  private void processRuleAndNonRuleDevicesData()
  {
    LogUtils.infoLog("StoreRulesLocalRunnable", "Store Rules: Separating out list of rule and non-rule devices.");
    this.ruleDevicesList = new ArrayList();
    this.nonRuleDevicesList = new ArrayList();
    this.udnToProcessDBModelMap.clear();
    List localList = WeMoUtils.getWiFiDeviceList(this.context);
    int i = localList.size();
    LogUtils.infoLog("StoreRulesLocalRunnable", "Store Rules: Total upnp devices count = " + i);
    Iterator localIterator = localList.iterator();
    while (localIterator.hasNext())
    {
      Device localDevice = ((DeviceInformation)localIterator.next()).getDevice();
      if (localDevice != null)
      {
        String str = localDevice.getUDN();
        if (WeMoUtils.isSmartDevice(localDevice.getDeviceType()))
        {
          LogUtils.infoLog("StoreRulesLocalRunnable", "Store Rules: Device: " + str + " is a Smart Device. Thus it shall be ignored.");
        }
        else
        {
          ProcessDBModel localProcessDBModel = getProcessDBModelForDevice(str);
          this.udnToProcessDBModelMap.put(str, localProcessDBModel);
          if (localProcessDBModel.getState() != -1)
          {
            LogUtils.infoLog("StoreRulesLocalRunnable", "Store Rules: Device: " + str + " is a RULE device.");
            this.ruleDevicesList.add(localDevice);
          }
          else
          {
            LogUtils.infoLog("StoreRulesLocalRunnable", "Store Rules: Device: " + str + " is NOT a RULE device.");
            this.nonRuleDevicesList.add(localDevice);
          }
        }
      }
    }
    LogUtils.infoLog("StoreRulesLocalRunnable", "Store Rules: Rule devices count: " + this.ruleDevicesList.size() + "; Non rule devices count: " + this.nonRuleDevicesList.size());
  }
  
  private void saveRuleToDevices(List<Device> paramList, RuleDevicesStoreDeviceRulesCallback paramRuleDevicesStoreDeviceRulesCallback)
  {
    LogUtils.infoLog("StoreRulesLocalRunnable", "Time: StoreRulesLocalRunnable: Runtime IN : " + System.currentTimeMillis());
    Iterator localIterator = paramList.iterator();
    while (localIterator.hasNext()) {
      WeMoThreadPoolHandler.executeInBackground(new DeviceStoreProcessingRunnable((Device)localIterator.next(), paramRuleDevicesStoreDeviceRulesCallback));
    }
    LogUtils.infoLog("StoreRulesLocalRunnable", "Time: StoreRulesLocalRunnable: Runtime OUT : " + System.currentTimeMillis());
  }
  
  private void startStoreRules()
  {
    LogUtils.infoLog("StoreRulesLocalRunnable", "Store Rules: Starting the process to save rule to all devices.");
    processRuleAndNonRuleDevicesData();
    if (this.ruleDevicesList.size() > 0) {
      saveRuleToDevices(this.ruleDevicesList, new RuleDevicesStoreDeviceRulesCallback(this.ruleDevicesList.size(), null));
    }
    do
    {
      return;
      if (this.nonRuleDevicesList.size() > 0)
      {
        saveRuleToDevices(this.nonRuleDevicesList, new NonRuleDevicesStoreRulesCallback(this.nonRuleDevicesList.size()));
        return;
      }
    } while (this.errorCallback == null);
    RMRulesError localRMRulesError = new RMRulesError();
    localRMRulesError.setErrorMessage("No device is online for rules processing.");
    this.errorCallback.onError(localRMRulesError);
  }
  
  private void syncLowerDevicesDB(int paramInt, ArrayList<String> paramArrayList)
  {
    int i = paramArrayList.size();
    LogUtils.infoLog("StoreRulesLocalRunnable", "Store Rules: Devices with older versions of DB to be synced: " + i);
    if (i > 0) {
      WeMoThreadPoolHandler.executeInBackground(new SyncRulesLocalRunnable(this.context, paramArrayList, paramInt));
    }
  }
  
  public void run()
  {
    LogUtils.infoLog("StoreRulesLocalRunnable", "Store Rules: Verifying if app has greatest DB version in the home network");
    new DBStatusCheckCallback(Integer.valueOf(this.sharePreference.getDBVersion()).intValue());
  }
  
  private class DBStatusCheckCallback
    implements FetchRulesSuccessCallback, FetchRulesErrorCallback
  {
    private int currentAppDBVersion;
    
    public DBStatusCheckCallback(int paramInt)
    {
      this.currentAppDBVersion = paramInt;
      WeMoRulesFactory.getInstance(StoreRulesLocalRunnable.this.context).fetchRules(StoreRulesLocalRunnable.this.context, this, this);
    }
    
    public void onError()
    {
      StoreRulesLocalRunnable.this.startStoreRules();
    }
    
    public void onSuccess(String paramString, int paramInt, ArrayList<String> paramArrayList)
    {
      LogUtils.infoLog("StoreRulesLocalRunnable", "Store Rules: Fetch rules completed. current App DB Version: " + this.currentAppDBVersion + ", latest DB Version: " + paramInt);
      if (this.currentAppDBVersion < paramInt)
      {
        if (StoreRulesLocalRunnable.this.errorCallback != null) {
          StoreRulesLocalRunnable.this.errorCallback.onError(new RMRulesError(-2, "Rule could not be saved. Please refresh the Rules Screen!"));
        }
        StoreRulesLocalRunnable.this.syncLowerDevicesDB(paramInt, paramArrayList);
        return;
      }
      StoreRulesLocalRunnable.this.startStoreRules();
    }
  }
  
  private class DeviceStoreProcessingRunnable
    extends WeMoRunnable
  {
    private StoreRulesLocalRunnable.RuleDevicesStoreDeviceRulesCallback callback;
    private Device device;
    
    public DeviceStoreProcessingRunnable(Device paramDevice, StoreRulesLocalRunnable.RuleDevicesStoreDeviceRulesCallback paramRuleDevicesStoreDeviceRulesCallback)
    {
      this.device = paramDevice;
      this.callback = paramRuleDevicesStoreDeviceRulesCallback;
    }
    
    public void run()
    {
      IDeviceRules localIDeviceRules = new DeviceRulesFactory().getDeviceRulesInstance(this.device);
      String str = this.device.getUDN();
      StoreRulesLocalRunnable.ProcessDBModel localProcessDBModel = (StoreRulesLocalRunnable.ProcessDBModel)StoreRulesLocalRunnable.this.udnToProcessDBModelMap.get(str);
      LogUtils.infoLog(this.TAG, "Store Rules: Current  device UDN: " + str + "; ProcessDB state: " + localProcessDBModel.getState());
      if (localIDeviceRules != null) {
        localIDeviceRules.storeDeviceRulesData(this.device, this.callback, String.valueOf(StoreRulesLocalRunnable.this.getDBVersionToStoreOnDevice()), StoreRulesLocalRunnable.this.getLocalZippedDBFilePath(), localProcessDBModel.getState(), localProcessDBModel.getWeeklyCalendarArray());
      }
    }
  }
  
  private class NonRuleDevicesStoreRulesCallback
    extends StoreRulesLocalRunnable.RuleDevicesStoreDeviceRulesCallback
  {
    public NonRuleDevicesStoreRulesCallback(int paramInt)
    {
      super(paramInt, null);
    }
    
    public void onError(RuleDeviceError paramRuleDeviceError)
    {
      try
      {
        this.devicesStoreRulesCallbackCount = (1 + this.devicesStoreRulesCallbackCount);
        LogUtils.errorLog("StoreRulesLocalRunnable", "STORE Rules for Rule Devices: storeRules ERROR for device: " + paramRuleDeviceError.getDeviceUdn() + "; Device fetched count yet: " + this.devicesStoreRulesCallbackCount + "; Total non rule devices count: " + this.devicesCount + "; ERROR CODE: " + paramRuleDeviceError.getErrorCode() + "; MESSAGE: " + paramRuleDeviceError.getErrorMessage());
        if (this.devicesStoreRulesCallbackCount == this.devicesCount) {
          onRulesSyncAttemptsComplete();
        }
        return;
      }
      finally
      {
        localObject = finally;
        throw ((Throwable)localObject);
      }
    }
    
    protected void onRulesSyncAttemptsComplete()
    {
      LogUtils.infoLog("StoreRulesLocalRunnable", "Store Rules: All NON rule devices callbacks received.");
      if (StoreRulesLocalRunnable.this.successCallback != null)
      {
        StoreRulesLocalRunnable.this.sharePreference.setDBVersion(String.valueOf(StoreRulesLocalRunnable.this.dbVersionToSend));
        StoreRulesLocalRunnable.this.successCallback.onSuccess();
      }
    }
    
    public void onSuccess(String paramString)
    {
      try
      {
        this.devicesStoreRulesCallbackCount = (1 + this.devicesStoreRulesCallbackCount);
        LogUtils.infoLog("StoreRulesLocalRunnable", "STORE Rules for NON Rule Devices: storeRules SUCCESS for device: " + paramString + "; Device callbacks received: " + this.devicesStoreRulesCallbackCount + "; NON Rule devices count: " + this.devicesCount);
        if (this.devicesStoreRulesCallbackCount == this.devicesCount) {
          onRulesSyncAttemptsComplete();
        }
        return;
      }
      finally
      {
        localObject = finally;
        throw ((Throwable)localObject);
      }
    }
  }
  
  public class ProcessDBModel
  {
    private int state;
    private String udn;
    private String[] weeklyCalendarArray;
    
    public ProcessDBModel() {}
    
    public ProcessDBModel(int paramInt, String paramString, String[] paramArrayOfString)
    {
      this.state = paramInt;
      this.udn = paramString;
      this.weeklyCalendarArray = paramArrayOfString;
    }
    
    public int getState()
    {
      return this.state;
    }
    
    public String getUdn()
    {
      return this.udn;
    }
    
    public String[] getWeeklyCalendarArray()
    {
      return this.weeklyCalendarArray;
    }
    
    public void setState(int paramInt)
    {
      this.state = paramInt;
    }
    
    public void setUdn(String paramString)
    {
      this.udn = paramString;
    }
    
    public void setWeeklyCalendarArray(String[] paramArrayOfString)
    {
      this.weeklyCalendarArray = paramArrayOfString;
    }
  }
  
  private class RuleDevicesStoreDeviceRulesCallback
    implements StoreDeviceRulesCallback
  {
    protected int devicesCount;
    protected int devicesStoreRulesCallbackCount;
    private int ruleDeviceErrorCount;
    
    private RuleDevicesStoreDeviceRulesCallback(int paramInt)
    {
      this.devicesCount = paramInt;
    }
    
    public void onError(RuleDeviceError paramRuleDeviceError)
    {
      try
      {
        this.devicesStoreRulesCallbackCount = (1 + this.devicesStoreRulesCallbackCount);
        this.ruleDeviceErrorCount = (1 + this.ruleDeviceErrorCount);
        LogUtils.errorLog("StoreRulesLocalRunnable", "STORE Rules for Rule Devices: storeRules ERROR for device: " + paramRuleDeviceError.getDeviceUdn() + "; Device fetched count yet: " + this.devicesStoreRulesCallbackCount + "; Total rule devices count: " + this.devicesCount + "; ERROR CODE: " + paramRuleDeviceError.getErrorCode() + "; MESSAGE: " + paramRuleDeviceError.getErrorMessage());
        if (this.devicesStoreRulesCallbackCount == this.devicesCount) {
          onRulesSyncAttemptsComplete();
        }
        return;
      }
      finally
      {
        localObject = finally;
        throw ((Throwable)localObject);
      }
    }
    
    protected void onRulesSyncAttemptsComplete()
    {
      LogUtils.infoLog("StoreRulesLocalRunnable", "Store Rules: All rule devices callbacks received.");
      if (this.ruleDeviceErrorCount == this.devicesCount)
      {
        LogUtils.errorLog("StoreRulesLocalRunnable", "Store Rules: Store rule on all rule devices failed. Rule devices count: " + this.devicesCount);
        if (StoreRulesLocalRunnable.this.errorCallback != null) {
          StoreRulesLocalRunnable.this.errorCallback.onError(new RMRulesError(-3, "Rule could not be saved on even a single rule device."));
        }
      }
      do
      {
        return;
        if (StoreRulesLocalRunnable.this.nonRuleDevicesList.size() > 0)
        {
          StoreRulesLocalRunnable.this.saveRuleToDevices(StoreRulesLocalRunnable.this.nonRuleDevicesList, new StoreRulesLocalRunnable.NonRuleDevicesStoreRulesCallback(StoreRulesLocalRunnable.this, StoreRulesLocalRunnable.this.nonRuleDevicesList.size()));
          return;
        }
        StoreRulesLocalRunnable.this.sharePreference.setDBVersion(String.valueOf(StoreRulesLocalRunnable.this.dbVersionToSend));
      } while (StoreRulesLocalRunnable.this.successCallback == null);
      StoreRulesLocalRunnable.this.successCallback.onSuccess();
    }
    
    public void onSuccess(String paramString)
    {
      try
      {
        this.devicesStoreRulesCallbackCount = (1 + this.devicesStoreRulesCallbackCount);
        LogUtils.infoLog("StoreRulesLocalRunnable", "STORE Rules for Rule Devices: storeRules SUCCESS for device: " + paramString + "; Device callbacks received: " + this.devicesStoreRulesCallbackCount + "; Rule devices count: " + this.devicesCount);
        if (this.devicesStoreRulesCallbackCount == this.devicesCount) {
          onRulesSyncAttemptsComplete();
        }
        return;
      }
      finally
      {
        localObject = finally;
        throw ((Throwable)localObject);
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/runnable/StoreRulesLocalRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */