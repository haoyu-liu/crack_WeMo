package com.belkin.wemo.rules.controller.callback;

import com.belkin.wemo.error.WeMoError;
import com.belkin.wemo.rules.data.RMRule;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.PluginResult;
import org.apache.cordova.PluginResult.Status;

public abstract class RMAbstractRulesCallback
{
  protected final String TAG;
  protected CallbackContext callbackContext;
  protected RMRule rule;
  
  public RMAbstractRulesCallback(CallbackContext paramCallbackContext, RMRule paramRMRule)
  {
    this.callbackContext = paramCallbackContext;
    this.rule = paramRMRule;
    this.TAG = getClass().getSimpleName();
  }
  
  protected void sendError(WeMoError paramWeMoError)
  {
    if (this.callbackContext != null)
    {
      PluginResult localPluginResult = new PluginResult(PluginResult.Status.ERROR, paramWeMoError.toJson());
      this.callbackContext.sendPluginResult(localPluginResult);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/controller/callback/RMAbstractRulesCallback.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */