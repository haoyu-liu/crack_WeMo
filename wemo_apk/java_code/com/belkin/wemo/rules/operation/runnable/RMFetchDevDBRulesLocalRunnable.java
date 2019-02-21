package com.belkin.wemo.rules.operation.runnable;

import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.rules.device.RMIDeviceRules;
import com.belkin.wemo.rules.device.dbrules.RMDeviceRulesDBFactory;
import com.belkin.wemo.rules.operation.handler.RMFetchDBRulesResponseHandler;
import com.belkin.wemo.runnable.WeMoRunnable;

public class RMFetchDevDBRulesLocalRunnable
  extends WeMoRunnable
{
  private DeviceInformation device;
  private RMFetchDBRulesResponseHandler rulesDBResponseHandler;
  
  public RMFetchDevDBRulesLocalRunnable(DeviceInformation paramDeviceInformation, RMFetchDBRulesResponseHandler paramRMFetchDBRulesResponseHandler)
  {
    this.device = paramDeviceInformation;
    this.rulesDBResponseHandler = paramRMFetchDBRulesResponseHandler;
  }
  
  public void run()
  {
    RMIDeviceRules localRMIDeviceRules = RMDeviceRulesDBFactory.INSTANCE.getDeviceRulesInstance(this.device);
    if (localRMIDeviceRules != null) {
      localRMIDeviceRules.fetchDeviceRulesData(this.device, this.rulesDBResponseHandler, this.rulesDBResponseHandler);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/operation/runnable/RMFetchDevDBRulesLocalRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */