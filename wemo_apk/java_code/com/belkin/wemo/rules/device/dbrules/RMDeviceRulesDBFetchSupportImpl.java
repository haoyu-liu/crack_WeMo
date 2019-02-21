package com.belkin.wemo.rules.device.dbrules;

import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.rules.data.RMDBRule;
import com.belkin.wemo.rules.device.RMIDeviceRules;
import com.belkin.wemo.rules.device.callback.RMFetchDeviceRulesErrorCallback;
import com.belkin.wemo.rules.device.callback.RMFetchDeviceRulesSuccesCallback;
import com.belkin.wemo.rules.device.callback.RMStoreDeviceRulesErrorCallback;
import com.belkin.wemo.rules.device.callback.RMStoreDeviceRulesSuccesCallback;
import com.belkin.wemo.rules.device.dbrules.handler.RMFetchDevRulesFetchSupportLocal;
import com.belkin.wemo.rules.device.dbrules.handler.RMStoreDevRulesStoreSupportLocal;
import com.belkin.wemo.rules.device.dbrules.handler.RMSyncDevRulesStoreSupportLocal;
import com.belkin.wemo.rules.device.error.RMRuleDeviceError;
import com.belkin.wemo.rules.util.RMIRulesUtils;
import java.util.HashMap;
import org.cybergarage.upnp.Device;

public class RMDeviceRulesDBFetchSupportImpl
  implements RMIDeviceRules
{
  private static final String TAG = RMDeviceRulesDBFetchSupportImpl.class.getSimpleName();
  private RMIRulesUtils rulesUtils;
  
  public RMDeviceRulesDBFetchSupportImpl(RMIRulesUtils paramRMIRulesUtils)
  {
    this.rulesUtils = paramRMIRulesUtils;
  }
  
  public void fetchDeviceRulesData(DeviceInformation paramDeviceInformation, RMFetchDeviceRulesSuccesCallback paramRMFetchDeviceRulesSuccesCallback, RMFetchDeviceRulesErrorCallback paramRMFetchDeviceRulesErrorCallback)
  {
    if (paramDeviceInformation != null)
    {
      localDevice = paramDeviceInformation.getDevice();
      if (localDevice != null) {
        new RMFetchDevRulesFetchSupportLocal(localDevice, paramRMFetchDeviceRulesSuccesCallback, paramRMFetchDeviceRulesErrorCallback).fetch();
      }
    }
    while (paramRMFetchDeviceRulesErrorCallback == null)
    {
      Device localDevice;
      do
      {
        return;
      } while (paramRMFetchDeviceRulesErrorCallback == null);
      SDKLogUtils.errorLog(TAG, "Fetch Rules: for single DB device (FETCH supported) via local. Device object inside DeviceInformation is NULL.");
      paramRMFetchDeviceRulesErrorCallback.onError(new RMRuleDeviceError());
      return;
    }
    SDKLogUtils.errorLog(TAG, "Fetch Rules: for single DB device (FETCH supported) via local. DeviceInformation object is NULL.");
    paramRMFetchDeviceRulesErrorCallback.onError(new RMRuleDeviceError());
  }
  
  public void storeDeviceRulesData(DeviceInformation paramDeviceInformation, RMDBRule paramRMDBRule, HashMap<String, Object> paramHashMap, RMStoreDeviceRulesSuccesCallback paramRMStoreDeviceRulesSuccesCallback, RMStoreDeviceRulesErrorCallback paramRMStoreDeviceRulesErrorCallback)
  {
    if (paramDeviceInformation == null) {
      if (paramRMStoreDeviceRulesErrorCallback != null)
      {
        SDKLogUtils.errorLog(TAG, "Store Rules: for single DB device (STORE supported) via local. DeviceInformation is NULL.");
        paramRMStoreDeviceRulesErrorCallback.onError(new RMRuleDeviceError());
      }
    }
    Device localDevice;
    do
    {
      do
      {
        do
        {
          return;
          if (paramRMDBRule != null) {
            break;
          }
        } while (paramRMStoreDeviceRulesErrorCallback == null);
        SDKLogUtils.errorLog(TAG, "Store Rules: for single DB device (STORE supported) via local. Rule Object is NULL.");
        paramRMStoreDeviceRulesErrorCallback.onError(new RMRuleDeviceError());
        return;
        if (paramHashMap != null) {
          break;
        }
      } while (paramRMStoreDeviceRulesErrorCallback == null);
      SDKLogUtils.errorLog(TAG, "Store Rules: for single DB device (STORE supported) via local. params are NULL.");
      paramRMStoreDeviceRulesErrorCallback.onError(new RMRuleDeviceError());
      return;
      localDevice = paramDeviceInformation.getDevice();
      if (localDevice != null) {
        break;
      }
    } while (paramRMStoreDeviceRulesErrorCallback == null);
    SDKLogUtils.errorLog(TAG, "Store Rules: for single DB device (STORE supported) via local. uPnP Device object inside DeviceInformation is NULL.");
    paramRMStoreDeviceRulesErrorCallback.onError(new RMRuleDeviceError());
    return;
    new RMStoreDevRulesStoreSupportLocal(localDevice, paramRMDBRule, paramHashMap, paramRMStoreDeviceRulesSuccesCallback, paramRMStoreDeviceRulesErrorCallback, this.rulesUtils).process();
  }
  
  public void syncDeviceRulesData(DeviceInformation paramDeviceInformation, HashMap<String, Object> paramHashMap, RMStoreDeviceRulesSuccesCallback paramRMStoreDeviceRulesSuccesCallback, RMStoreDeviceRulesErrorCallback paramRMStoreDeviceRulesErrorCallback)
  {
    if (paramDeviceInformation == null) {
      if (paramRMStoreDeviceRulesErrorCallback != null)
      {
        SDKLogUtils.errorLog(TAG, "Store Rules: Sync for single DB device (STORE supported) via local. DeviceInformation is NULL.");
        paramRMStoreDeviceRulesErrorCallback.onError(new RMRuleDeviceError());
      }
    }
    Device localDevice;
    do
    {
      do
      {
        return;
        if (paramHashMap != null) {
          break;
        }
      } while (paramRMStoreDeviceRulesErrorCallback == null);
      SDKLogUtils.errorLog(TAG, "Store Rules: Sync for single DB device (STORE supported) via local. params are NULL.");
      paramRMStoreDeviceRulesErrorCallback.onError(new RMRuleDeviceError());
      return;
      localDevice = paramDeviceInformation.getDevice();
      if (localDevice != null) {
        break;
      }
    } while (paramRMStoreDeviceRulesErrorCallback == null);
    SDKLogUtils.errorLog(TAG, "Store Rules: Sync for single DB device (STORE supported) via local. uPnP Device object inside DeviceInformation is NULL.");
    paramRMStoreDeviceRulesErrorCallback.onError(new RMRuleDeviceError());
    return;
    new RMSyncDevRulesStoreSupportLocal(localDevice, null, paramHashMap, paramRMStoreDeviceRulesSuccesCallback, paramRMStoreDeviceRulesErrorCallback, this.rulesUtils).process();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFetchSupportImpl.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */