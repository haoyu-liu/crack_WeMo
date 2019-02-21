package com.belkin.wemo.rules.controller.callback;

import com.belkin.utils.LogUtils;
import com.belkin.wemo.WeMo;
import com.belkin.wemo.cache.cloud.CloudRequestManager;
import com.belkin.wemo.cache.cloud.CloudRequestPushMobileNotifications;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.cache.utils.SharePreferences;
import com.belkin.wemo.rules.RMIRulesDependencyProvider;
import com.belkin.wemo.rules.RMRulesSDK;
import com.belkin.wemo.rules.callback.RMEditRuleErrorCallback;
import com.belkin.wemo.rules.callback.RMEditRuleSuccessCallback;
import com.belkin.wemo.rules.data.RMDBRule;
import com.belkin.wemo.rules.data.RMDBRuleType;
import com.belkin.wemo.rules.data.RMLongPressRule;
import com.belkin.wemo.rules.data.RMRule;
import com.belkin.wemo.rules.data.device.RMDBRuleDevice;
import com.belkin.wemo.rules.error.RMRulesError;
import com.belkin.wemo.rules.util.RMIRulesUtils;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.PluginResult;
import org.apache.cordova.PluginResult.Status;

public class RMEditRuleCallback
  extends RMAbstractRulesCallback
  implements RMEditRuleErrorCallback, RMEditRuleSuccessCallback
{
  public RMEditRuleCallback(CallbackContext paramCallbackContext, RMRule paramRMRule)
  {
    super(paramCallbackContext, paramRMRule);
  }
  
  public void onError(RMRulesError paramRMRulesError)
  {
    sendError(paramRMRulesError);
  }
  
  public void onSuccess(RMRule paramRMRule1, RMRule paramRMRule2)
  {
    LogUtils.debugLog(this.TAG, "Store Rules: Existing rule edited successfully. Rule: " + paramRMRule1.toString());
    if (paramRMRule1.getRulesType() == 2)
    {
      RMDBRule localRMDBRule3 = (RMDBRule)paramRMRule1;
      if (localRMDBRule3.getRuleType() == RMDBRuleType.LONG_PRESS)
      {
        SDKLogUtils.debugLog(this.TAG, "Store Rules: Edit Success: Attempting to refresh long press rule device details of NEW rule devices. Count: " + localRMDBRule3.getRuleDeviceSet().size());
        Iterator localIterator4 = localRMDBRule3.getRuleDeviceSet().iterator();
        while (localIterator4.hasNext())
        {
          RMDBRuleDevice localRMDBRuleDevice = (RMDBRuleDevice)localIterator4.next();
          DeviceListManager.getInstance(WeMo.INSTANCE.getContext()).refreshLongPressRuleDetails(paramRMRule1.getRuleId(), localRMDBRuleDevice.getUiUdn());
          SharePreferences localSharePreferences2 = new SharePreferences(WeMo.INSTANCE.getContext());
          CloudRequestManager localCloudRequestManager2 = new CloudRequestManager(WeMo.INSTANCE.getContext());
          localCloudRequestManager2.makeByteStreamRequest(new CloudRequestPushMobileNotifications(localSharePreferences2.getHomeId(), localRMDBRuleDevice.getUiUdn(), RMRulesSDK.instance().getDependencyProvider().provideIRulesUtils().getRulesDBVerion(), true, null));
        }
      }
    }
    if (paramRMRule1.getRulesType() == 2)
    {
      RMDBRule localRMDBRule1 = (RMDBRule)paramRMRule2;
      if (localRMDBRule1.getRuleType() == RMDBRuleType.LONG_PRESS)
      {
        SDKLogUtils.debugLog(this.TAG, "Store Rules: Edit Success: Attempting to refresh long press rule device details of OLD rule devices. Count: " + localRMDBRule1.getRuleDeviceSet().size());
        HashSet localHashSet = new HashSet();
        Iterator localIterator1 = localRMDBRule1.getRuleDeviceSet().iterator();
        while (localIterator1.hasNext())
        {
          String str2 = ((RMDBRuleDevice)localIterator1.next()).getUiUdn();
          LogUtils.debugLog(this.TAG, "Store Rules: Edit Success: Long Press Rule: OLD trigger device UDN: " + str2);
          if (paramRMRule1.getRulesType() == 2)
          {
            RMDBRule localRMDBRule2 = (RMDBRule)paramRMRule1;
            if (localRMDBRule2.getRuleType() == RMDBRuleType.LONG_PRESS)
            {
              Iterator localIterator3 = localRMDBRule2.getRuleDeviceSet().iterator();
              String str3;
              do
              {
                boolean bool = localIterator3.hasNext();
                i = 0;
                if (!bool) {
                  break;
                }
                str3 = ((RMDBRuleDevice)localIterator3.next()).getUiUdn();
                LogUtils.debugLog(this.TAG, "Store Rules: Edit Success: Long Press Rule: NEW trigger device UDN: " + str3);
              } while (!str3.equals(str2));
              int i = 1;
              if (i == 0) {
                localHashSet.add(str2);
              }
            }
          }
        }
        Iterator localIterator2 = localHashSet.iterator();
        while (localIterator2.hasNext())
        {
          String str1 = (String)localIterator2.next();
          DeviceListManager.getInstance(WeMo.INSTANCE.getContext()).refreshLongPressRuleDetails(str1, (RMLongPressRule)paramRMRule1);
          SharePreferences localSharePreferences1 = new SharePreferences(WeMo.INSTANCE.getContext());
          CloudRequestManager localCloudRequestManager1 = new CloudRequestManager(WeMo.INSTANCE.getContext());
          localCloudRequestManager1.makeByteStreamRequest(new CloudRequestPushMobileNotifications(localSharePreferences1.getHomeId(), str1, RMRulesSDK.instance().getDependencyProvider().provideIRulesUtils().getRulesDBVerion(), true, null));
        }
      }
    }
    if (this.callbackContext != null)
    {
      PluginResult localPluginResult = new PluginResult(PluginResult.Status.OK, paramRMRule1.getRuleId());
      this.callbackContext.sendPluginResult(localPluginResult);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/controller/callback/RMEditRuleCallback.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */