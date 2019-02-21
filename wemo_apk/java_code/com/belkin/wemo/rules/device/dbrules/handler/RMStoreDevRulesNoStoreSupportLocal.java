package com.belkin.wemo.rules.device.dbrules.handler;

import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.controlaction.ControlActionHandler;
import com.belkin.wemo.controlaction.callback.ControlActionErrorCallback;
import com.belkin.wemo.controlaction.callback.ControlActionSuccessCallback;
import com.belkin.wemo.rules.data.RMDBRule;
import com.belkin.wemo.rules.data.RMUserRules;
import com.belkin.wemo.rules.data.device.RMDBRuleDevice;
import com.belkin.wemo.rules.data.device.RMLed;
import com.belkin.wemo.rules.data.weeklycalendar.RMWeeklyCalendarGeneratorUtility;
import com.belkin.wemo.rules.device.callback.RMStoreDeviceRulesErrorCallback;
import com.belkin.wemo.rules.device.callback.RMStoreDeviceRulesSuccesCallback;
import com.belkin.wemo.rules.device.error.RMRuleDeviceError;
import com.belkin.wemo.rules.util.RMIRulesUtils;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import org.cybergarage.upnp.Action;
import org.cybergarage.upnp.Device;

public class RMStoreDevRulesNoStoreSupportLocal
  extends RMSyncDevRulesNoStoreSupportLocal
{
  private static final String TAG = RMStoreDevRulesNoStoreSupportLocal.class.getSimpleName();
  private String deviceUdn;
  private RMDBRule rule;
  
  public RMStoreDevRulesNoStoreSupportLocal(DeviceInformation paramDeviceInformation, RMDBRule paramRMDBRule, HashMap<String, Object> paramHashMap, RMStoreDeviceRulesSuccesCallback paramRMStoreDeviceRulesSuccesCallback, RMStoreDeviceRulesErrorCallback paramRMStoreDeviceRulesErrorCallback, RMIRulesUtils paramRMIRulesUtils)
  {
    super(paramDeviceInformation, paramHashMap, paramRMStoreDeviceRulesSuccesCallback, paramRMStoreDeviceRulesErrorCallback, paramRMIRulesUtils);
    this.rule = paramRMDBRule;
    this.deviceUdn = paramDeviceInformation.getUDN();
  }
  
  private void postWeeklyCalendarAction(Action paramAction, Map<String, String> paramMap)
  {
    WeeklyCalendarActionCallback localWeeklyCalendarActionCallback = new WeeklyCalendarActionCallback(this.device.getUDN());
    ControlActionHandler.newInstance().postControlAction(paramAction, 15000, 4000, localWeeklyCalendarActionCallback, localWeeklyCalendarActionCallback, paramMap);
  }
  
  public void process()
  {
    if (RMUserRules.INSTANCE.isProcessDBRequired(this.rule, this.deviceUdn))
    {
      Action localAction = this.device.getDevice().getAction("UpdateWeeklyCalendar");
      if (this.deviceUdn.contains("Bridge"))
      {
        Iterator localIterator = this.rule.getRuleDeviceSet().iterator();
        while (localIterator.hasNext()) {
          if (!((RMDBRuleDevice)localIterator.next()).getClass().equals(RMLed.class)) {}
        }
      }
      postWeeklyCalendarAction(localAction, RMWeeklyCalendarGeneratorUtility.getWeeklyCalendarStringMap(this.deviceUdn));
      return;
    }
    writeDBFileToDevice(this.device.getUDN());
  }
  
  private class WeeklyCalendarActionCallback
    implements ControlActionErrorCallback, ControlActionSuccessCallback
  {
    protected String deviceUdn;
    
    public WeeklyCalendarActionCallback(String paramString)
    {
      this.deviceUdn = paramString;
    }
    
    public void onActionError(Exception paramException)
    {
      SDKLogUtils.errorLog(RMStoreDevRulesNoStoreSupportLocal.TAG, "STORE RULES (No Store): Update Weekly calendar call failed, device: " + this.deviceUdn);
      if (RMStoreDevRulesNoStoreSupportLocal.this.errorCallback != null) {
        RMStoreDevRulesNoStoreSupportLocal.this.errorCallback.onError(new RMRuleDeviceError(-1, paramException.getMessage(), this.deviceUdn));
      }
    }
    
    public void onActionSuccess(String paramString)
    {
      RMStoreDevRulesNoStoreSupportLocal.this.writeDBFileToDevice(RMStoreDevRulesNoStoreSupportLocal.this.device.getUDN());
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesNoStoreSupportLocal.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */