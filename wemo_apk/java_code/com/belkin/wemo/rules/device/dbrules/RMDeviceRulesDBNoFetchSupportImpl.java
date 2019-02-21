package com.belkin.wemo.rules.device.dbrules;

import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.rules.data.RMDBRule;
import com.belkin.wemo.rules.device.RMIDeviceRules;
import com.belkin.wemo.rules.device.callback.RMFetchDeviceRulesErrorCallback;
import com.belkin.wemo.rules.device.callback.RMFetchDeviceRulesSuccesCallback;
import com.belkin.wemo.rules.device.callback.RMStoreDeviceRulesErrorCallback;
import com.belkin.wemo.rules.device.callback.RMStoreDeviceRulesSuccesCallback;
import com.belkin.wemo.rules.device.dbrules.handler.RMFetchDevRulesNoFetchSupportLocal;
import com.belkin.wemo.rules.device.dbrules.handler.RMStoreDevRulesNoStoreSupportLocal;
import com.belkin.wemo.rules.device.dbrules.handler.RMSyncDevRulesNoStoreSupportLocal;
import com.belkin.wemo.rules.device.error.RMRuleDeviceError;
import com.belkin.wemo.rules.util.RMIRulesUtils;
import java.util.HashMap;
import org.cybergarage.upnp.Device;

public class RMDeviceRulesDBNoFetchSupportImpl
  implements RMIDeviceRules
{
  private static final String TAG = RMDeviceRulesDBNoFetchSupportImpl.class.getSimpleName();
  private RMIRulesUtils ruleUtils;
  
  public RMDeviceRulesDBNoFetchSupportImpl(RMIRulesUtils paramRMIRulesUtils)
  {
    this.ruleUtils = paramRMIRulesUtils;
  }
  
  public void fetchDeviceRulesData(DeviceInformation paramDeviceInformation, RMFetchDeviceRulesSuccesCallback paramRMFetchDeviceRulesSuccesCallback, RMFetchDeviceRulesErrorCallback paramRMFetchDeviceRulesErrorCallback)
  {
    if (paramDeviceInformation != null)
    {
      localDevice = paramDeviceInformation.getDevice();
      if (localDevice != null) {
        new RMFetchDevRulesNoFetchSupportLocal(localDevice, paramRMFetchDeviceRulesSuccesCallback, paramRMFetchDeviceRulesErrorCallback, this.ruleUtils).fetch();
      }
    }
    while (paramRMFetchDeviceRulesErrorCallback == null)
    {
      Device localDevice;
      do
      {
        return;
      } while (paramRMFetchDeviceRulesErrorCallback == null);
      SDKLogUtils.errorLog(TAG, "Fetch Rules: for single DB device (NO FETCH) via local. Device object inside DeviceInformation is NULL.");
      paramRMFetchDeviceRulesErrorCallback.onError(new RMRuleDeviceError());
      return;
    }
    SDKLogUtils.errorLog(TAG, "Fetch Rules: for single DB device (NO FETCH) via local. DeviceInformation object is NULL.");
    paramRMFetchDeviceRulesErrorCallback.onError(new RMRuleDeviceError());
  }
  
  public void storeDeviceRulesData(DeviceInformation paramDeviceInformation, RMDBRule paramRMDBRule, HashMap<String, Object> paramHashMap, RMStoreDeviceRulesSuccesCallback paramRMStoreDeviceRulesSuccesCallback, RMStoreDeviceRulesErrorCallback paramRMStoreDeviceRulesErrorCallback)
  {
    if (paramDeviceInformation != null)
    {
      if (paramDeviceInformation.getDevice() != null) {
        break label67;
      }
      SDKLogUtils.errorLog(TAG, "Store Rules: for single DB device (No STORE support) via local. Device object inside DeviceInformation is NULL.");
      if (paramRMStoreDeviceRulesErrorCallback != null) {
        paramRMStoreDeviceRulesErrorCallback.onError(new RMRuleDeviceError());
      }
    }
    label67:
    do
    {
      do
      {
        do
        {
          return;
          SDKLogUtils.errorLog(TAG, "Store Rules: for single DB device (NO STORE) via local. DeviceInformation object is NULL.");
        } while (paramRMStoreDeviceRulesErrorCallback == null);
        paramRMStoreDeviceRulesErrorCallback.onError(new RMRuleDeviceError());
        return;
        if (paramRMDBRule != null) {
          break;
        }
        SDKLogUtils.errorLog(TAG, "Store Rules: for single DB device (No STORE support) via local. Rule Object is NULL.");
      } while (paramRMStoreDeviceRulesErrorCallback == null);
      paramRMStoreDeviceRulesErrorCallback.onError(new RMRuleDeviceError());
      return;
      if (paramHashMap != null) {
        break;
      }
      SDKLogUtils.errorLog(TAG, "Store Rules: for single DB device (No STORE support) via local. params are NULL.");
    } while (paramRMStoreDeviceRulesErrorCallback == null);
    paramRMStoreDeviceRulesErrorCallback.onError(new RMRuleDeviceError());
    return;
    new RMStoreDevRulesNoStoreSupportLocal(paramDeviceInformation, paramRMDBRule, paramHashMap, paramRMStoreDeviceRulesSuccesCallback, paramRMStoreDeviceRulesErrorCallback, this.ruleUtils).process();
  }
  
  public void syncDeviceRulesData(DeviceInformation paramDeviceInformation, HashMap<String, Object> paramHashMap, RMStoreDeviceRulesSuccesCallback paramRMStoreDeviceRulesSuccesCallback, RMStoreDeviceRulesErrorCallback paramRMStoreDeviceRulesErrorCallback)
  {
    if (paramDeviceInformation != null)
    {
      if (paramDeviceInformation.getDevice() != null) {
        break label67;
      }
      SDKLogUtils.errorLog(TAG, "Store Rules: for single DB device (No STORE support) via local. Device object inside DeviceInformation is NULL.");
      if (paramRMStoreDeviceRulesErrorCallback != null) {
        paramRMStoreDeviceRulesErrorCallback.onError(new RMRuleDeviceError());
      }
    }
    label67:
    do
    {
      do
      {
        return;
        SDKLogUtils.errorLog(TAG, "Store Rules: for single DB device (NO STORE) via local. DeviceInformation object is NULL.");
      } while (paramRMStoreDeviceRulesErrorCallback == null);
      paramRMStoreDeviceRulesErrorCallback.onError(new RMRuleDeviceError());
      return;
      if (paramHashMap != null) {
        break;
      }
      SDKLogUtils.errorLog(TAG, "Store Rules: for single DB device (No STORE support) via local. params are NULL.");
    } while (paramRMStoreDeviceRulesErrorCallback == null);
    paramRMStoreDeviceRulesErrorCallback.onError(new RMRuleDeviceError());
    return;
    new RMSyncDevRulesNoStoreSupportLocal(paramDeviceInformation, paramHashMap, paramRMStoreDeviceRulesSuccesCallback, paramRMStoreDeviceRulesErrorCallback, this.ruleUtils).process();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBNoFetchSupportImpl.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */