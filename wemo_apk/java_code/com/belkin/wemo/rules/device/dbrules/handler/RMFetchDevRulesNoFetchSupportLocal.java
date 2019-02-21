package com.belkin.wemo.rules.device.dbrules.handler;

import android.text.TextUtils;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.controlaction.ControlActionHandler;
import com.belkin.wemo.controlaction.callback.ControlActionErrorCallback;
import com.belkin.wemo.controlaction.callback.ControlActionSuccessCallback;
import com.belkin.wemo.rules.device.callback.RMFetchDeviceRulesErrorCallback;
import com.belkin.wemo.rules.device.callback.RMFetchDeviceRulesSuccesCallback;
import com.belkin.wemo.rules.device.error.RMRuleDeviceError;
import com.belkin.wemo.rules.util.RMIRulesUtils;
import com.belkin.wemo.upnp.parser.RMParser;
import com.belkin.wemo.upnp.response.RMRulesDBVersionResponse;
import org.cybergarage.upnp.Action;
import org.cybergarage.upnp.Device;

public class RMFetchDevRulesNoFetchSupportLocal
{
  private static final String TAG = RMFetchDevRulesNoFetchSupportLocal.class.getSimpleName();
  private Device device;
  private RMFetchDeviceRulesErrorCallback errorCallback;
  private RMIRulesUtils rulesUtils;
  private RMFetchDeviceRulesSuccesCallback successCallback;
  
  public RMFetchDevRulesNoFetchSupportLocal(Device paramDevice, RMFetchDeviceRulesSuccesCallback paramRMFetchDeviceRulesSuccesCallback, RMFetchDeviceRulesErrorCallback paramRMFetchDeviceRulesErrorCallback, RMIRulesUtils paramRMIRulesUtils)
  {
    this.successCallback = paramRMFetchDeviceRulesSuccesCallback;
    this.errorCallback = paramRMFetchDeviceRulesErrorCallback;
    this.device = paramDevice;
    this.rulesUtils = paramRMIRulesUtils;
  }
  
  private int getDBVersion(RMParser paramRMParser, String paramString)
    throws NumberFormatException
  {
    RMRulesDBVersionResponse localRMRulesDBVersionResponse = new RMRulesDBVersionResponse();
    paramRMParser.uPnPResponseParser(localRMRulesDBVersionResponse, 1, paramString);
    return Integer.valueOf(localRMRulesDBVersionResponse.getRulesDBVersion()).intValue();
  }
  
  public void fetch()
  {
    SDKLogUtils.debugLog(TAG, "Fetch Rules: Device does NOT suport FetchRules API. udn: " + this.device.getUDN());
    Action localAction = this.device.getAction("GetRulesDBVersion");
    GetDBVersionActionCallback localGetDBVersionActionCallback = new GetDBVersionActionCallback(this.rulesUtils, this.successCallback, this.errorCallback, this.device.getUDN());
    ControlActionHandler.newInstance().postControlAction(localAction, 15000, 4000, localGetDBVersionActionCallback, localGetDBVersionActionCallback);
  }
  
  private class GetDBVersionActionCallback
    implements ControlActionErrorCallback, ControlActionSuccessCallback
  {
    private String deviceUdn;
    private RMFetchDeviceRulesErrorCallback errorCallback;
    private RMIRulesUtils rulesUtils;
    private RMFetchDeviceRulesSuccesCallback successCallback;
    
    public GetDBVersionActionCallback(RMIRulesUtils paramRMIRulesUtils, RMFetchDeviceRulesSuccesCallback paramRMFetchDeviceRulesSuccesCallback, RMFetchDeviceRulesErrorCallback paramRMFetchDeviceRulesErrorCallback, String paramString)
    {
      this.rulesUtils = paramRMIRulesUtils;
      this.deviceUdn = paramString;
      this.successCallback = paramRMFetchDeviceRulesSuccesCallback;
      this.errorCallback = paramRMFetchDeviceRulesErrorCallback;
    }
    
    public void onActionError(Exception paramException)
    {
      if (this.errorCallback != null) {
        this.errorCallback.onError(new RMRuleDeviceError(-1, paramException.getMessage(), this.deviceUdn));
      }
    }
    
    public void onActionSuccess(String paramString)
    {
      if ((!TextUtils.isEmpty(paramString)) && (!paramString.equals("app_error"))) {}
      while (this.errorCallback == null) {
        try
        {
          if (this.successCallback != null)
          {
            RMParser localRMParser = new RMParser();
            String str = this.rulesUtils.getRulesDBPathInDevice(RMFetchDevRulesNoFetchSupportLocal.this.device.getUDN());
            this.successCallback.onSuccess(RMFetchDevRulesNoFetchSupportLocal.this.getDBVersion(localRMParser, paramString), str, this.deviceUdn);
          }
          return;
        }
        catch (NumberFormatException localNumberFormatException)
        {
          do
          {
            SDKLogUtils.errorLog(RMFetchDevRulesNoFetchSupportLocal.TAG, "Fetch Rules: No Fetch Support: NumberFormatException: ", localNumberFormatException);
          } while (this.errorCallback == null);
          this.errorCallback.onError(new RMRuleDeviceError(-1, localNumberFormatException.getMessage(), this.deviceUdn));
          return;
        }
      }
      this.errorCallback.onError(new RMRuleDeviceError());
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */