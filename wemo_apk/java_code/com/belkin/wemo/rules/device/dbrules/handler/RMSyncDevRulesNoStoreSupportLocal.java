package com.belkin.wemo.rules.device.dbrules.handler;

import android.text.TextUtils;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.controlaction.ControlActionHandler;
import com.belkin.wemo.controlaction.callback.ControlActionErrorCallback;
import com.belkin.wemo.controlaction.callback.ControlActionSuccessCallback;
import com.belkin.wemo.rules.device.callback.RMStoreDeviceRulesErrorCallback;
import com.belkin.wemo.rules.device.callback.RMStoreDeviceRulesSuccesCallback;
import com.belkin.wemo.rules.device.error.RMRuleDeviceError;
import com.belkin.wemo.rules.util.RMIRulesUtils;
import java.io.IOException;
import java.util.HashMap;
import org.cybergarage.upnp.Action;
import org.cybergarage.upnp.Device;

public class RMSyncDevRulesNoStoreSupportLocal
{
  private static final String TAG = RMSyncDevRulesNoStoreSupportLocal.class.getSimpleName();
  protected DeviceInformation device;
  protected RMStoreDeviceRulesErrorCallback errorCallback;
  protected HashMap<String, Object> params;
  protected RMIRulesUtils rulesUtils;
  protected RMStoreDeviceRulesSuccesCallback successCallback;
  
  public RMSyncDevRulesNoStoreSupportLocal(DeviceInformation paramDeviceInformation, HashMap<String, Object> paramHashMap, RMStoreDeviceRulesSuccesCallback paramRMStoreDeviceRulesSuccesCallback, RMStoreDeviceRulesErrorCallback paramRMStoreDeviceRulesErrorCallback, RMIRulesUtils paramRMIRulesUtils)
  {
    this.successCallback = paramRMStoreDeviceRulesSuccesCallback;
    this.errorCallback = paramRMStoreDeviceRulesErrorCallback;
    this.device = paramDeviceInformation;
    this.params = paramHashMap;
    this.rulesUtils = paramRMIRulesUtils;
  }
  
  private void setRulesDBVersionOnDevice()
  {
    Integer localInteger = (Integer)this.params.get("new_db_version");
    Action localAction = this.device.getDevice().getAction("SetRulesDBVersion");
    HashMap localHashMap = new HashMap();
    localHashMap.put("RulesDBVersion", String.valueOf(localInteger));
    SetRulesDBVersionActionCallback localSetRulesDBVersionActionCallback = new SetRulesDBVersionActionCallback(this.device.getUDN(), this.successCallback, this.errorCallback);
    ControlActionHandler.newInstance().postControlAction(localAction, 15000, 4000, localSetRulesDBVersionActionCallback, localSetRulesDBVersionActionCallback, localHashMap);
  }
  
  public void process()
  {
    writeDBFileToDevice(this.device.getUDN());
  }
  
  protected void writeDBFileToDevice(String paramString)
  {
    String str1 = this.rulesUtils.getRulesDBPathInDevice(paramString);
    SDKLogUtils.infoLog(TAG, "STORE RULES (No Store): Parsed DB Path of device: " + str1);
    String str2;
    if (!TextUtils.isEmpty(str1))
    {
      SDKLogUtils.infoLog(TAG, "STORE RULES (No Store): Device DB path: " + str1);
      str2 = (String)this.params.get("db_zip_file");
    }
    do
    {
      try
      {
        this.rulesUtils.writeDBToDevice(str2, str1, 10000);
        SDKLogUtils.infoLog(TAG, "STORE RULES (No Store): Write DB File to Device SUCCESS");
        setRulesDBVersionOnDevice();
        return;
      }
      catch (IOException localIOException)
      {
        RMRuleDeviceError localRMRuleDeviceError;
        do
        {
          SDKLogUtils.errorLog(TAG, "STORE RULES (No Store): IOException while writing DB to device: ", localIOException);
          localRMRuleDeviceError = new RMRuleDeviceError(paramString);
          localRMRuleDeviceError.setErrorMessage(localIOException.getMessage());
        } while (this.errorCallback == null);
        this.errorCallback.onError(localRMRuleDeviceError);
        return;
      }
      SDKLogUtils.errorLog(TAG, "STORE RULES (No Store): GetRulesDBPath received is empty. device: " + paramString);
    } while (this.errorCallback == null);
    this.errorCallback.onError(new RMRuleDeviceError(paramString));
  }
  
  private class SetRulesDBVersionActionCallback
    implements ControlActionErrorCallback, ControlActionSuccessCallback
  {
    private String deviceUdn;
    private RMStoreDeviceRulesErrorCallback errorCallback;
    private RMStoreDeviceRulesSuccesCallback successCallback;
    
    public SetRulesDBVersionActionCallback(String paramString, RMStoreDeviceRulesSuccesCallback paramRMStoreDeviceRulesSuccesCallback, RMStoreDeviceRulesErrorCallback paramRMStoreDeviceRulesErrorCallback)
    {
      this.deviceUdn = paramString;
      this.successCallback = paramRMStoreDeviceRulesSuccesCallback;
      this.errorCallback = paramRMStoreDeviceRulesErrorCallback;
    }
    
    public void onActionError(Exception paramException)
    {
      SDKLogUtils.errorLog(RMSyncDevRulesNoStoreSupportLocal.TAG, "STORE RULES (No Store): Setting Rules DB version to Device FAILED. Device: " + this.deviceUdn);
      if (this.errorCallback != null) {
        this.errorCallback.onError(new RMRuleDeviceError(-1, paramException.getMessage(), this.deviceUdn));
      }
    }
    
    public void onActionSuccess(String paramString)
    {
      if (this.successCallback != null) {
        this.successCallback.onSuccess(this.deviceUdn);
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */