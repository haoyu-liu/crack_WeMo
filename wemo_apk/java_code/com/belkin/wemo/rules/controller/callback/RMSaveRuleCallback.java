package com.belkin.wemo.rules.controller.callback;

import com.belkin.utils.LogUtils;
import com.belkin.wemo.WeMo;
import com.belkin.wemo.cache.cloud.CloudRequestManager;
import com.belkin.wemo.cache.cloud.CloudRequestPushMobileNotifications;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.SharePreferences;
import com.belkin.wemo.rules.RMIRulesDependencyProvider;
import com.belkin.wemo.rules.RMRulesSDK;
import com.belkin.wemo.rules.callback.RMSaveRuleErrorCallback;
import com.belkin.wemo.rules.callback.RMSaveRuleSuccessCallback;
import com.belkin.wemo.rules.data.RMDBRule;
import com.belkin.wemo.rules.data.RMDBRuleType;
import com.belkin.wemo.rules.data.RMRule;
import com.belkin.wemo.rules.data.device.RMDBRuleDevice;
import com.belkin.wemo.rules.error.RMRulesError;
import com.belkin.wemo.rules.util.RMIRulesUtils;
import java.util.Iterator;
import java.util.Set;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.PluginResult;
import org.apache.cordova.PluginResult.Status;

public class RMSaveRuleCallback
  extends RMAbstractRulesCallback
  implements RMSaveRuleSuccessCallback, RMSaveRuleErrorCallback
{
  public RMSaveRuleCallback(CallbackContext paramCallbackContext, RMRule paramRMRule)
  {
    super(paramCallbackContext, paramRMRule);
  }
  
  public void onError(RMRulesError paramRMRulesError)
  {
    sendError(paramRMRulesError);
  }
  
  public void onSuccess(RMRule paramRMRule)
  {
    LogUtils.debugLog(this.TAG, "Store Rules: New rule saved successfully. RuleId: " + paramRMRule.getRuleId());
    if (paramRMRule.getRulesType() == 2)
    {
      RMDBRule localRMDBRule = (RMDBRule)paramRMRule;
      if (localRMDBRule.getRuleType() == RMDBRuleType.LONG_PRESS)
      {
        Iterator localIterator = localRMDBRule.getRuleDeviceSet().iterator();
        while (localIterator.hasNext())
        {
          RMDBRuleDevice localRMDBRuleDevice = (RMDBRuleDevice)localIterator.next();
          DeviceListManager.getInstance(WeMo.INSTANCE.getContext()).refreshLongPressRuleDetails(paramRMRule.getRuleId(), localRMDBRuleDevice.getUiUdn());
          SharePreferences localSharePreferences = new SharePreferences(WeMo.INSTANCE.getContext());
          new CloudRequestManager(WeMo.INSTANCE.getContext()).makeByteStreamRequest(new CloudRequestPushMobileNotifications(localSharePreferences.getHomeId(), localRMDBRuleDevice.getUiUdn(), RMRulesSDK.instance().getDependencyProvider().provideIRulesUtils().getRulesDBVerion(), true, null));
        }
      }
    }
    if (this.callbackContext != null)
    {
      PluginResult localPluginResult = new PluginResult(PluginResult.Status.OK, paramRMRule.getRuleId());
      this.callbackContext.sendPluginResult(localPluginResult);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/controller/callback/RMSaveRuleCallback.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */