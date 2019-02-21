package com.belkin.wemo.rules.device.dbrules.handler;

import android.text.TextUtils;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.controlaction.ControlActionHandler;
import com.belkin.wemo.controlaction.callback.ControlActionErrorCallback;
import com.belkin.wemo.controlaction.callback.ControlActionSuccessCallback;
import com.belkin.wemo.exception.InvalidArgumentsException;
import com.belkin.wemo.rules.data.RMDBRule;
import com.belkin.wemo.rules.device.callback.RMStoreDeviceRulesErrorCallback;
import com.belkin.wemo.rules.device.callback.RMStoreDeviceRulesSuccesCallback;
import com.belkin.wemo.rules.device.error.RMRuleDeviceError;
import com.belkin.wemo.rules.util.RMIRulesUtils;
import com.belkin.wemo.rules.util.RMRulesUtility;
import com.belkin.wemo.upnp.parser.RMParser;
import com.belkin.wemo.upnp.response.RMStoreRulesResponse;
import java.util.HashMap;
import org.cybergarage.upnp.Action;
import org.cybergarage.upnp.Device;

public class RMSyncDevRulesStoreSupportLocal
  implements ControlActionErrorCallback, ControlActionSuccessCallback
{
  public static final String TAG = RMRulesUtility.class.getSimpleName();
  private Device device;
  private RMStoreDeviceRulesErrorCallback errorCallback;
  private HashMap<String, Object> params;
  private int processDB;
  private RMDBRule rule;
  private RMIRulesUtils rulesUtils;
  private RMStoreDeviceRulesSuccesCallback successCallback;
  
  public RMSyncDevRulesStoreSupportLocal(Device paramDevice, RMDBRule paramRMDBRule, HashMap<String, Object> paramHashMap, RMStoreDeviceRulesSuccesCallback paramRMStoreDeviceRulesSuccesCallback, RMStoreDeviceRulesErrorCallback paramRMStoreDeviceRulesErrorCallback, RMIRulesUtils paramRMIRulesUtils)
  {
    this.successCallback = paramRMStoreDeviceRulesSuccesCallback;
    this.errorCallback = paramRMStoreDeviceRulesErrorCallback;
    this.device = paramDevice;
    this.rule = paramRMDBRule;
    this.params = paramHashMap;
    this.rulesUtils = paramRMIRulesUtils;
  }
  
  private RMStoreRulesResponse parseControlActionResponse(String paramString)
  {
    RMParser localRMParser = new RMParser();
    RMStoreRulesResponse localRMStoreRulesResponse = new RMStoreRulesResponse();
    localRMParser.uPnPResponseParser(localRMStoreRulesResponse, 12, paramString);
    return localRMStoreRulesResponse;
  }
  
  private void sendResponseViaCallbacks(RMStoreRulesResponse paramRMStoreRulesResponse)
  {
    if (paramRMStoreRulesResponse.getErrorInfo().equals("Storing of rules DB Successful!")) {
      if (this.successCallback != null) {
        this.successCallback.onSuccess(this.device.getUDN());
      }
    }
    while (this.errorCallback == null) {
      return;
    }
    this.errorCallback.onError(new RMRuleDeviceError(this.device.getUDN()));
  }
  
  protected String getProcessDBValue(RMDBRule paramRMDBRule, String paramString)
  {
    return String.valueOf(this.processDB);
  }
  
  public void onActionError(Exception paramException)
  {
    if (this.errorCallback != null) {
      this.errorCallback.onError(new RMRuleDeviceError(-1, paramException.getMessage(), this.device.getUDN()));
    }
  }
  
  public void onActionSuccess(String paramString)
  {
    if (TextUtils.isEmpty(paramString))
    {
      if (this.errorCallback != null) {
        this.errorCallback.onError(new RMRuleDeviceError(this.device.getUDN()));
      }
      return;
    }
    sendResponseViaCallbacks(parseControlActionResponse(paramString));
  }
  
  public void process()
  {
    String str1 = (String)this.params.get("db_zip_file");
    Integer localInteger = (Integer)this.params.get("new_db_version");
    Object localObject = this.params.get("process_db");
    if (localObject != null) {
      this.processDB = ((Integer)localObject).intValue();
    }
    String str2;
    try
    {
      str2 = this.rulesUtils.getFileInBase64Encoding(str1);
      if (TextUtils.isEmpty(str2))
      {
        if (this.errorCallback != null) {
          this.errorCallback.onError(new RMRuleDeviceError());
        }
        return;
      }
    }
    catch (InvalidArgumentsException localInvalidArgumentsException)
    {
      do
      {
        SDKLogUtils.errorLog(TAG, "Store single device rule (local): InvalidArgumentsException while converting db zip to base64 encoding.", localInvalidArgumentsException);
      } while (this.errorCallback == null);
      RMRuleDeviceError localRMRuleDeviceError = new RMRuleDeviceError(this.device.getUDN());
      localRMRuleDeviceError.setErrorMessage(localInvalidArgumentsException.getMessage());
      this.errorCallback.onError(localRMRuleDeviceError);
      return;
    }
    Action localAction = this.device.getAction("StoreRules");
    HashMap localHashMap = new HashMap();
    localHashMap.put("ruleDbVersion", String.valueOf(localInteger));
    localHashMap.put("processDb", getProcessDBValue(this.rule, this.device.getUDN()));
    localHashMap.put("ruleDbBody", str2);
    ControlActionHandler.newInstance().postControlAction(localAction, 15000, 4000, this, this, localHashMap);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesStoreSupportLocal.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */