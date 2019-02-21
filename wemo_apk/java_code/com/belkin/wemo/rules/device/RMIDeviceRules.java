package com.belkin.wemo.rules.device;

import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.rules.data.RMDBRule;
import com.belkin.wemo.rules.device.callback.RMFetchDeviceRulesErrorCallback;
import com.belkin.wemo.rules.device.callback.RMFetchDeviceRulesSuccesCallback;
import com.belkin.wemo.rules.device.callback.RMStoreDeviceRulesErrorCallback;
import com.belkin.wemo.rules.device.callback.RMStoreDeviceRulesSuccesCallback;
import java.util.HashMap;

public abstract interface RMIDeviceRules
{
  public static final String DO_NOT_PROCESS_DB = "0";
  public static final String PROCESS_DB = "1";
  
  public abstract void fetchDeviceRulesData(DeviceInformation paramDeviceInformation, RMFetchDeviceRulesSuccesCallback paramRMFetchDeviceRulesSuccesCallback, RMFetchDeviceRulesErrorCallback paramRMFetchDeviceRulesErrorCallback);
  
  public abstract void storeDeviceRulesData(DeviceInformation paramDeviceInformation, RMDBRule paramRMDBRule, HashMap<String, Object> paramHashMap, RMStoreDeviceRulesSuccesCallback paramRMStoreDeviceRulesSuccesCallback, RMStoreDeviceRulesErrorCallback paramRMStoreDeviceRulesErrorCallback);
  
  public abstract void syncDeviceRulesData(DeviceInformation paramDeviceInformation, HashMap<String, Object> paramHashMap, RMStoreDeviceRulesSuccesCallback paramRMStoreDeviceRulesSuccesCallback, RMStoreDeviceRulesErrorCallback paramRMStoreDeviceRulesErrorCallback);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/device/RMIDeviceRules.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */