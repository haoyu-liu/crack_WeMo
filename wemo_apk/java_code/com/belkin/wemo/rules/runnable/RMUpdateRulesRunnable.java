package com.belkin.wemo.rules.runnable;

import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.rules.callback.RMShowRulesErrorCallback;
import com.belkin.wemo.rules.callback.RMShowRulesSuccessCallback;
import com.belkin.wemo.rules.fetch.RMFetchRulesManager;
import java.util.List;

public class RMUpdateRulesRunnable
  extends RMShowRulesRunnable
{
  private static final String TAG = RMUpdateRulesRunnable.class.getSimpleName();
  private int rulesType;
  
  public RMUpdateRulesRunnable(RMShowRulesSuccessCallback paramRMShowRulesSuccessCallback, RMShowRulesErrorCallback paramRMShowRulesErrorCallback, int paramInt, List<DeviceInformation> paramList)
  {
    super(paramRMShowRulesSuccessCallback, paramRMShowRulesErrorCallback, paramList);
    this.rulesType = paramInt;
  }
  
  public void run()
  {
    SDKLogUtils.infoLog(TAG, "Fetch Rules: fetching rules from all uPnP devices.");
    RMShowRulesRunnable.FetchRulesFromDevicesCallback localFetchRulesFromDevicesCallback = new RMShowRulesRunnable.FetchRulesFromDevicesCallback(this, this.successCallback, this.errorCallback);
    RMFetchRulesManager.INSTANCE.fetchRules(localFetchRulesFromDevicesCallback, localFetchRulesFromDevicesCallback, this.rulesType, this.activeDeviceList);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/runnable/RMUpdateRulesRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */