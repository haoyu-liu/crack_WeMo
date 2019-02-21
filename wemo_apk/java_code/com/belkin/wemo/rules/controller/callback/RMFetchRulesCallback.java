package com.belkin.wemo.rules.controller.callback;

import com.belkin.utils.LogUtils;
import com.belkin.wemo.rules.callback.RMShowRulesErrorCallback;
import com.belkin.wemo.rules.callback.RMShowRulesSuccessCallback;
import com.belkin.wemo.rules.data.RMRule;
import com.belkin.wemo.rules.error.RMRulesError;
import java.util.Iterator;
import java.util.List;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.PluginResult;
import org.apache.cordova.PluginResult.Status;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class RMFetchRulesCallback
  extends RMAbstractRulesCallback
  implements RMShowRulesErrorCallback, RMShowRulesSuccessCallback
{
  public RMFetchRulesCallback(CallbackContext paramCallbackContext)
  {
    super(paramCallbackContext, null);
  }
  
  private JSONArray getRulesJSONArray(List<RMRule> paramList)
    throws JSONException
  {
    JSONArray localJSONArray = new JSONArray();
    Iterator localIterator = paramList.iterator();
    while (localIterator.hasNext()) {
      localJSONArray.put(((RMRule)localIterator.next()).toJSON(new JSONObject()));
    }
    LogUtils.debugLog(this.TAG, "Fetch Rules: JSONArray of Rules List: " + localJSONArray);
    return localJSONArray;
  }
  
  public void onError(RMRulesError paramRMRulesError)
  {
    sendError(paramRMRulesError);
  }
  
  public void onSuccess(List<RMRule> paramList)
  {
    if (this.callbackContext != null) {}
    try
    {
      PluginResult localPluginResult = new PluginResult(PluginResult.Status.OK, getRulesJSONArray(paramList));
      this.callbackContext.sendPluginResult(localPluginResult);
      return;
    }
    catch (JSONException localJSONException)
    {
      LogUtils.errorLog(this.TAG, "Fetch Rules: JSONException while converting rules list to JSONArray: ", localJSONException);
      sendError(new RMRulesError(-1, "Error while processing Rules!"));
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/controller/callback/RMFetchRulesCallback.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */