package com.belkin.cordova.plugin;

import com.belkin.utils.LogUtils;
import com.belkin.wemo.rules.RMIRulesDependencyProvider;
import com.belkin.wemo.rules.RMRulesSDK;
import com.belkin.wemo.rules.controller.RMRulesController;
import com.belkin.wemo.rules.util.RMIRulesUtils;
import java.io.FileNotFoundException;
import java.io.IOException;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaWebView;
import org.apache.cordova.PluginResult;
import org.apache.cordova.PluginResult.Status;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class RulesPlugin
  extends CordovaPlugin
{
  public static final int ACTION_RULES_DELETE = 7004;
  public static final int ACTION_RULES_EDIT = 7003;
  public static final int ACTION_RULES_EXTRACT_FROM_DB = 7009;
  public static final int ACTION_RULES_GET_SUNRISE_TIME = 7006;
  public static final int ACTION_RULES_GET_SUNSET_TIME = 7007;
  public static final int ACTION_RULES_RESET_DEVICE = 7008;
  public static final int ACTION_RULES_SAVE = 7002;
  public static final int ACTION_RULES_SHOW = 7001;
  public static final int ACTION_RULES_TOGGLE_STATE = 7005;
  private final String TAG = RulesPlugin.class.getSimpleName();
  
  private void cloneRulesDB()
  {
    try
    {
      RMRulesSDK.instance().getDependencyProvider().provideIRulesUtils().copyRulesDB("0", "1");
      return;
    }
    catch (FileNotFoundException localFileNotFoundException)
    {
      LogUtils.errorLog(this.TAG, "FileNotFoundException while cloning rules DB: ", localFileNotFoundException);
      return;
    }
    catch (IOException localIOException)
    {
      LogUtils.errorLog(this.TAG, "IOException while cloning rules DB: ", localIOException);
    }
  }
  
  public boolean execute(String paramString, JSONArray paramJSONArray, CallbackContext paramCallbackContext)
    throws JSONException
  {
    int i = Integer.parseInt(paramString);
    LogUtils.infoLog(RulesPlugin.class, "execute(): ActionID = " + i + "; JSONArray Params: " + paramJSONArray);
    switch (i)
    {
    default: 
      LogUtils.infoLog(RulesPlugin.class, "execute(): Invalid action ID = " + i);
      return false;
    case 7001: 
      RMRulesController.INSTANCE.fetchRules(paramCallbackContext);
      return true;
    case 7002: 
      if ((paramJSONArray != null) && (paramJSONArray.length() >= 1))
      {
        cloneRulesDB();
        JSONObject localJSONObject7 = paramJSONArray.getJSONObject(0);
        RMRulesController.INSTANCE.saveNewRule(localJSONObject7, paramCallbackContext);
        return true;
      }
      paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR, "Parameters provided are INVALID."));
      return true;
    case 7003: 
      if ((paramJSONArray != null) && (paramJSONArray.length() >= 1))
      {
        cloneRulesDB();
        JSONObject localJSONObject6 = paramJSONArray.getJSONObject(0);
        RMRulesController.INSTANCE.editRule(localJSONObject6, paramCallbackContext);
        return true;
      }
      paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR, "Parameters provided are INVALID."));
      return true;
    case 7004: 
      if ((paramJSONArray != null) && (paramJSONArray.length() >= 1))
      {
        cloneRulesDB();
        JSONObject localJSONObject5 = paramJSONArray.getJSONObject(0);
        RMRulesController.INSTANCE.deleteRule(localJSONObject5, paramCallbackContext);
        return true;
      }
      paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR, "Parameters provided are INVALID."));
      return true;
    case 7005: 
      if ((paramJSONArray != null) && (paramJSONArray.length() >= 1))
      {
        cloneRulesDB();
        JSONObject localJSONObject4 = paramJSONArray.getJSONObject(0);
        RMRulesController.INSTANCE.toggleRule(localJSONObject4, paramCallbackContext);
        return true;
      }
      paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR, "Parameters provided are INVALID."));
      return true;
    case 7006: 
      if ((paramJSONArray != null) && (paramJSONArray.length() >= 1))
      {
        JSONObject localJSONObject3 = paramJSONArray.getJSONObject(0);
        double d3 = RMRulesController.INSTANCE.getSunriseTime(localJSONObject3);
        paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.OK, (float)d3));
        return true;
      }
      paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR, "Parameters provided are INVALID."));
      return true;
    case 7007: 
      if ((paramJSONArray != null) && (paramJSONArray.length() >= 1))
      {
        JSONObject localJSONObject2 = paramJSONArray.getJSONObject(0);
        double d2 = RMRulesController.INSTANCE.getSunsetTime(localJSONObject2);
        paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.OK, (float)d2));
        return true;
      }
      paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR, "Parameters provided are INVALID."));
      return true;
    case 7008: 
      if ((paramJSONArray != null) && (paramJSONArray.length() >= 1))
      {
        cloneRulesDB();
        JSONObject localJSONObject1 = paramJSONArray.getJSONObject(0);
        double d1 = RMRulesController.INSTANCE.getSunsetTime(localJSONObject1);
        paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.OK, (float)d1));
        return true;
      }
      paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR, "Parameters provided are INVALID."));
      return true;
    }
    RMRulesController.INSTANCE.extractRulesFromDB(paramCallbackContext);
    return true;
  }
  
  public void initialize(CordovaInterface paramCordovaInterface, CordovaWebView paramCordovaWebView)
  {
    super.initialize(paramCordovaInterface, paramCordovaWebView);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/cordova/plugin/RulesPlugin.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */