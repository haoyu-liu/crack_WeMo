package com.belkin.wemo.rules.operation.runnable;

import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.rules.device.RMIDeviceRules;
import com.belkin.wemo.rules.device.dbrules.RMDeviceRulesDBFactory;
import com.belkin.wemo.rules.operation.handler.RMSyncDBRulesLocalResponseHandler;
import com.belkin.wemo.runnable.WeMoRunnable;
import java.util.HashMap;

public class RMSyncDevDBRulesLocalRunnable
  extends WeMoRunnable
{
  private DeviceInformation device;
  private HashMap<String, Object> params;
  private RMSyncDBRulesLocalResponseHandler rulesDBResponseHandler;
  
  public RMSyncDevDBRulesLocalRunnable(DeviceInformation paramDeviceInformation, HashMap<String, Object> paramHashMap, RMSyncDBRulesLocalResponseHandler paramRMSyncDBRulesLocalResponseHandler)
  {
    this.device = paramDeviceInformation;
    this.rulesDBResponseHandler = paramRMSyncDBRulesLocalResponseHandler;
    this.params = paramHashMap;
  }
  
  public void run()
  {
    RMIDeviceRules localRMIDeviceRules = RMDeviceRulesDBFactory.INSTANCE.getDeviceRulesInstance(this.device);
    if (localRMIDeviceRules != null) {
      localRMIDeviceRules.syncDeviceRulesData(this.device, this.params, this.rulesDBResponseHandler, this.rulesDBResponseHandler);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/operation/runnable/RMSyncDevDBRulesLocalRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */