package com.belkin.wemo.rules.device.dbrules.handler;

import com.belkin.wemo.rules.data.RMDBRule;
import com.belkin.wemo.rules.data.RMUserRules;
import com.belkin.wemo.rules.device.callback.RMStoreDeviceRulesErrorCallback;
import com.belkin.wemo.rules.device.callback.RMStoreDeviceRulesSuccesCallback;
import com.belkin.wemo.rules.util.RMIRulesUtils;
import com.belkin.wemo.rules.util.RMRulesUtility;
import java.util.HashMap;
import org.cybergarage.upnp.Device;

public class RMStoreDevRulesStoreSupportLocal
  extends RMSyncDevRulesStoreSupportLocal
{
  public static final String TAG = RMRulesUtility.class.getSimpleName();
  
  public RMStoreDevRulesStoreSupportLocal(Device paramDevice, RMDBRule paramRMDBRule, HashMap<String, Object> paramHashMap, RMStoreDeviceRulesSuccesCallback paramRMStoreDeviceRulesSuccesCallback, RMStoreDeviceRulesErrorCallback paramRMStoreDeviceRulesErrorCallback, RMIRulesUtils paramRMIRulesUtils)
  {
    super(paramDevice, paramRMDBRule, paramHashMap, paramRMStoreDeviceRulesSuccesCallback, paramRMStoreDeviceRulesErrorCallback, paramRMIRulesUtils);
  }
  
  protected String getProcessDBValue(RMDBRule paramRMDBRule, String paramString)
  {
    String str = "0";
    if (RMUserRules.INSTANCE.isProcessDBRequired(paramRMDBRule, paramString)) {
      str = "1";
    }
    return str;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesStoreSupportLocal.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */