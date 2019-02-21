package com.belkin.wemo.rules.operation.runnable;

import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.rules.data.RMDBRule;
import com.belkin.wemo.rules.device.RMIDeviceRules;
import com.belkin.wemo.rules.device.callback.RMStoreDeviceRulesErrorCallback;
import com.belkin.wemo.rules.device.callback.RMStoreDeviceRulesSuccesCallback;
import com.belkin.wemo.rules.device.dbrules.RMDeviceRulesDBFactory;
import com.belkin.wemo.runnable.WeMoRunnable;
import java.util.HashMap;

public class RMStoreDevDBRulesLocalRunnable
  extends WeMoRunnable
{
  private DeviceInformation device;
  private RMStoreDeviceRulesErrorCallback errorCallback;
  private HashMap<String, Object> params;
  private RMDBRule rule;
  private RMStoreDeviceRulesSuccesCallback successCallback;
  
  public RMStoreDevDBRulesLocalRunnable(RMDBRule paramRMDBRule, DeviceInformation paramDeviceInformation, HashMap<String, Object> paramHashMap, RMStoreDeviceRulesSuccesCallback paramRMStoreDeviceRulesSuccesCallback, RMStoreDeviceRulesErrorCallback paramRMStoreDeviceRulesErrorCallback)
  {
    this.device = paramDeviceInformation;
    this.successCallback = paramRMStoreDeviceRulesSuccesCallback;
    this.errorCallback = paramRMStoreDeviceRulesErrorCallback;
    this.rule = paramRMDBRule;
    this.params = paramHashMap;
  }
  
  public void run()
  {
    RMIDeviceRules localRMIDeviceRules = RMDeviceRulesDBFactory.INSTANCE.getDeviceRulesInstance(this.device);
    if (localRMIDeviceRules != null) {
      localRMIDeviceRules.storeDeviceRulesData(this.device, this.rule, this.params, this.successCallback, this.errorCallback);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/operation/runnable/RMStoreDevDBRulesLocalRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */