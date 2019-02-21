package com.belkin.wemo.rules.device.dbrules.handler;

import android.text.TextUtils;
import com.belkin.wemo.controlaction.ControlActionHandler;
import com.belkin.wemo.controlaction.callback.ControlActionErrorCallback;
import com.belkin.wemo.controlaction.callback.ControlActionSuccessCallback;
import com.belkin.wemo.rules.device.callback.RMFetchDeviceRulesErrorCallback;
import com.belkin.wemo.rules.device.callback.RMFetchDeviceRulesSuccesCallback;
import com.belkin.wemo.rules.device.error.RMRuleDeviceError;
import com.belkin.wemo.upnp.parser.RMParser;
import com.belkin.wemo.upnp.response.RMFetchRulesResponse;
import org.cybergarage.upnp.Action;
import org.cybergarage.upnp.Device;

public class RMFetchDevRulesFetchSupportLocal
  implements ControlActionErrorCallback, ControlActionSuccessCallback
{
  private Device device;
  private RMFetchDeviceRulesErrorCallback errorCallback;
  private RMFetchDeviceRulesSuccesCallback successCallback;
  
  public RMFetchDevRulesFetchSupportLocal(Device paramDevice, RMFetchDeviceRulesSuccesCallback paramRMFetchDeviceRulesSuccesCallback, RMFetchDeviceRulesErrorCallback paramRMFetchDeviceRulesErrorCallback)
  {
    this.successCallback = paramRMFetchDeviceRulesSuccesCallback;
    this.errorCallback = paramRMFetchDeviceRulesErrorCallback;
    this.device = paramDevice;
  }
  
  public void fetch()
  {
    Action localAction = this.device.getAction("FetchRules");
    ControlActionHandler.newInstance().postControlAction(localAction, 15000, 4000, this, this);
  }
  
  public void onActionError(Exception paramException)
  {
    if (this.errorCallback != null) {
      this.errorCallback.onError(new RMRuleDeviceError(-1, paramException.getMessage(), this.device.getUDN()));
    }
  }
  
  public void onActionSuccess(String paramString)
  {
    if ((!TextUtils.isEmpty(paramString)) && (!paramString.equals("app_error")))
    {
      localRMParser = new RMParser();
      localRMFetchRulesResponse = new RMFetchRulesResponse();
      localRMParser.uPnPResponseParser(localRMFetchRulesResponse, 11, paramString);
      if (this.successCallback != null) {
        this.successCallback.onSuccess(localRMFetchRulesResponse.getRuleDBVersion(), localRMFetchRulesResponse.getRuleDBPath(), this.device.getUDN());
      }
    }
    while (this.errorCallback == null)
    {
      RMParser localRMParser;
      RMFetchRulesResponse localRMFetchRulesResponse;
      return;
    }
    this.errorCallback.onError(new RMRuleDeviceError(-1, "Error while processing Rules!", this.device.getUDN()));
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesFetchSupportLocal.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */