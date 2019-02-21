package com.belkin.wemo.rules.controller;

import android.text.TextUtils;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.rules.RMIRules;
import com.belkin.wemo.rules.RMRulesSDK;
import com.belkin.wemo.rules.builder.RMAbstractRuleBuilder;
import com.belkin.wemo.rules.builder.RMRuleBuilder;
import com.belkin.wemo.rules.callback.RMResetDeviceRulesErrorCallback;
import com.belkin.wemo.rules.callback.RMResetDeviceRulesSuccessCallback;
import com.belkin.wemo.rules.controller.callback.RMDeleteRuleCallback;
import com.belkin.wemo.rules.controller.callback.RMEditRuleCallback;
import com.belkin.wemo.rules.controller.callback.RMFetchRulesCallback;
import com.belkin.wemo.rules.controller.callback.RMSaveRuleCallback;
import com.belkin.wemo.rules.controller.callback.RMToggleRuleCallback;
import com.belkin.wemo.rules.data.RMLocationInfo;
import com.belkin.wemo.rules.data.RMRule;
import com.belkin.wemo.rules.data.RMUserLocation;
import com.belkin.wemo.rules.error.RMRulesError;
import com.belkin.wemo.rules.util.RMSunriseSunsetUtility;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.PluginResult;
import org.apache.cordova.PluginResult.Status;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public enum RMRulesController
{
  private static final String TAG = RMRulesController.class.getSimpleName();
  
  static
  {
    RMRulesController[] arrayOfRMRulesController = new RMRulesController[1];
    arrayOfRMRulesController[0] = INSTANCE;
    $VALUES = arrayOfRMRulesController;
  }
  
  private RMRulesController() {}
  
  public void deleteAllRules(JSONArray paramJSONArray, CallbackContext paramCallbackContext) {}
  
  public void deleteRule(JSONObject paramJSONObject, CallbackContext paramCallbackContext)
    throws JSONException
  {
    int i = paramJSONObject.getInt("RULE_ID");
    RMDeleteRuleCallback localRMDeleteRuleCallback = new RMDeleteRuleCallback(paramCallbackContext, i);
    RMRulesSDK.instance().getRules().deleteRule(i, localRMDeleteRuleCallback, localRMDeleteRuleCallback);
  }
  
  public void editRule(JSONObject paramJSONObject, CallbackContext paramCallbackContext)
    throws JSONException
  {
    RMRule localRMRule = new RMRuleBuilder().getBuilder(paramJSONObject).buildExisting();
    RMEditRuleCallback localRMEditRuleCallback = new RMEditRuleCallback(paramCallbackContext, localRMRule);
    RMRulesSDK.instance().getRules().editRule(localRMRule, localRMEditRuleCallback, localRMEditRuleCallback);
  }
  
  public void extractRulesFromDB(CallbackContext paramCallbackContext)
  {
    RMFetchRulesCallback localRMFetchRulesCallback = new RMFetchRulesCallback(paramCallbackContext);
    RMRulesSDK.instance().getRules().getRulesListFromCache(localRMFetchRulesCallback, localRMFetchRulesCallback);
  }
  
  public void fetchRules(CallbackContext paramCallbackContext)
  {
    RMFetchRulesCallback localRMFetchRulesCallback = new RMFetchRulesCallback(paramCallbackContext);
    RMRulesSDK.instance().getRules().fetchRules(localRMFetchRulesCallback, localRMFetchRulesCallback);
  }
  
  public void getRule(JSONArray paramJSONArray, CallbackContext paramCallbackContext) {}
  
  public double getSunriseTime(JSONObject paramJSONObject)
    throws JSONException
  {
    int i = paramJSONObject.getInt("dayID");
    RMLocationInfo localRMLocationInfo = RMUserLocation.getInstance().getLocationInfo();
    return RMSunriseSunsetUtility.getSunriseTime(localRMLocationInfo.getLatitude(), localRMLocationInfo.getLongitude(), i);
  }
  
  public double getSunsetTime(JSONObject paramJSONObject)
    throws JSONException
  {
    int i = paramJSONObject.getInt("dayID");
    RMLocationInfo localRMLocationInfo = RMUserLocation.getInstance().getLocationInfo();
    return RMSunriseSunsetUtility.getSunsetTime(localRMLocationInfo.getLatitude(), localRMLocationInfo.getLongitude(), i);
  }
  
  public void resetDeviceRules(JSONObject paramJSONObject, final CallbackContext paramCallbackContext)
    throws JSONException
  {
    final String str = paramJSONObject.getString("udn");
    if (!TextUtils.isEmpty(str)) {
      RMRulesSDK.instance().getRules().deleteRulesFromDevice(str, new RMResetDeviceRulesSuccessCallback()new RMResetDeviceRulesErrorCallback
      {
        public void onAllDeviceRulesReset(String paramAnonymousString)
        {
          LogUtils.debugLog(RMRulesController.TAG, "Reset Device Rules - SUCCESS. UDN: " + paramAnonymousString);
          if (paramCallbackContext != null) {
            paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.OK));
          }
        }
      }, new RMResetDeviceRulesErrorCallback()
      {
        public void onError(RMRulesError paramAnonymousRMRulesError)
        {
          LogUtils.debugLog(RMRulesController.TAG, "Reset Device Rules - ERROR. UDN: " + str + "; Msg: " + paramAnonymousRMRulesError.getErrorMessage());
          if (paramCallbackContext != null) {
            paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR, paramAnonymousRMRulesError.getErrorMessage()));
          }
        }
      });
    }
    while (paramCallbackContext == null) {
      return;
    }
    paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR, "UDN is invalid"));
  }
  
  public void saveNewRule(JSONObject paramJSONObject, CallbackContext paramCallbackContext)
    throws JSONException
  {
    RMRule localRMRule = new RMRuleBuilder().getBuilder(paramJSONObject).buildNew();
    RMSaveRuleCallback localRMSaveRuleCallback = new RMSaveRuleCallback(paramCallbackContext, localRMRule);
    RMRulesSDK.instance().getRules().saveRule(localRMRule, localRMSaveRuleCallback, localRMSaveRuleCallback);
  }
  
  public void toggleRule(JSONObject paramJSONObject, CallbackContext paramCallbackContext)
    throws JSONException
  {
    int i = paramJSONObject.getInt("RULE_ID");
    int j = paramJSONObject.getInt("STATE");
    RMToggleRuleCallback localRMToggleRuleCallback = new RMToggleRuleCallback(paramCallbackContext, i);
    if (j == 0)
    {
      RMRulesSDK.instance().getRules().disableRule(i, localRMToggleRuleCallback, localRMToggleRuleCallback);
      return;
    }
    RMRulesSDK.instance().getRules().enableRule(i, localRMToggleRuleCallback, localRMToggleRuleCallback);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/controller/RMRulesController.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */