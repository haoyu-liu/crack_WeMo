package com.belkin.wemo.rules.device.runnable;

import android.text.TextUtils;
import com.belkin.cybergarage.wrapper.ControlActionHandler;
import com.belkin.cybergarage.wrapper.ControlActionHandler.ControlActionErrorCallback;
import com.belkin.cybergarage.wrapper.ControlActionHandler.ControlActionSuccessCallback;
import com.belkin.rules.beans.RulesDBPathResponseBean;
import com.belkin.upnp.parser.Parser;
import com.belkin.utils.LogUtils;
import com.belkin.utils.UploadFileUtil;
import com.belkin.wemo.rules.device.callback.StoreDeviceRulesCallback;
import com.belkin.wemo.rules.device.error.RuleDeviceError;
import com.belkin.wemo.runnable.WeMoRunnable;
import com.belkin.wemo.utils.WeMoUtils;
import java.util.HashMap;
import org.cybergarage.upnp.Action;
import org.cybergarage.upnp.Device;

public class StoreDeviceRulesNoStoreSupportRunnable
  extends WeMoRunnable
{
  public static final int EDIT_WEEKLY_CALENDAR_LENGTH = 2;
  private StoreDeviceRulesCallback callback;
  private String dbVersionToSet;
  private Device device;
  private String localZippedDBFilePath;
  private int processDBState;
  private String[] weeklyRecordArray;
  
  public StoreDeviceRulesNoStoreSupportRunnable(StoreDeviceRulesCallback paramStoreDeviceRulesCallback, Device paramDevice, String paramString1, String paramString2, int paramInt, String[] paramArrayOfString)
  {
    this.device = paramDevice;
    this.dbVersionToSet = paramString1;
    this.localZippedDBFilePath = paramString2;
    this.callback = paramStoreDeviceRulesCallback;
    this.processDBState = paramInt;
    this.weeklyRecordArray = paramArrayOfString;
  }
  
  private void editWeeklyCalenderString()
  {
    Action localAction = this.device.getAction("EditWeeklycalendar");
    HashMap localHashMap = new HashMap();
    localHashMap.put(com.belkin.wemo.cache.utils.Constants.SET_EDIT_WEEKLY_CALENDER_ARGS[0], String.valueOf(2));
    postWeeklyCalendarAction(localAction, localHashMap);
  }
  
  private void onInvalidWeeklyRecordError()
  {
    LogUtils.errorLog(this.TAG, "Store Rules: Old FW or Smart Device: Update Weekly calender Array NULL but process DB requested: " + this.device.getUDN());
    if (this.callback != null) {
      this.callback.onError(new RuleDeviceError(this.device.getUDN()));
    }
  }
  
  private String parseRulesDBPath(String paramString)
  {
    Parser localParser = new Parser();
    RulesDBPathResponseBean localRulesDBPathResponseBean = new RulesDBPathResponseBean();
    localParser.uPnPResponseParser(localRulesDBPathResponseBean, 12, paramString);
    return localRulesDBPathResponseBean.getStrRulesDBPath();
  }
  
  private void postWeeklyCalendarAction(Action paramAction, HashMap<String, String> paramHashMap)
  {
    WeeklyCalendarActionCallback localWeeklyCalendarActionCallback = new WeeklyCalendarActionCallback(this.device.getUDN());
    ControlActionHandler.newInstance().postControlAction(paramAction, 15000, 4000, localWeeklyCalendarActionCallback, localWeeklyCalendarActionCallback, paramHashMap);
  }
  
  private void setRulesDBVersionOnDevice()
  {
    Action localAction = this.device.getAction("SetRulesDBVersion");
    HashMap localHashMap = new HashMap();
    localHashMap.put("RulesDBVersion", this.dbVersionToSet);
    SetRulesDBVersionActionCallback localSetRulesDBVersionActionCallback = new SetRulesDBVersionActionCallback(this.device.getUDN());
    ControlActionHandler.newInstance().postControlAction(localAction, 15000, 4000, localSetRulesDBVersionActionCallback, localSetRulesDBVersionActionCallback, localHashMap);
  }
  
  private void updateWeeklyCalenderLinkDevice()
  {
    if (this.weeklyRecordArray.length == 2) {
      editWeeklyCalenderString();
    }
    Action localAction = this.device.getAction("UpdateWeeklyCalendar");
    HashMap localHashMap = new HashMap();
    String str = WeMoUtils.createWeeklyCalendarListString(this.weeklyRecordArray);
    localHashMap.put(com.belkin.wemo.cache.utils.Constants.SET_UPDATE_WEEKLY_CALENDER_LED_ARGS[0], str);
    postWeeklyCalendarAction(localAction, localHashMap);
  }
  
  private void updateWeeklyCalenderNonLinkDevice()
  {
    if (this.weeklyRecordArray.length == 2) {
      editWeeklyCalenderString();
    }
    Action localAction = this.device.getAction("UpdateWeeklyCalendar");
    HashMap localHashMap = new HashMap();
    int i = 0;
    for (;;)
    {
      if (i < 7) {
        try
        {
          localHashMap.put(com.belkin.wemo.cache.utils.Constants.SET_UPDATE_WEEKLY_CALENDER_ARGS[i], this.weeklyRecordArray[i]);
          i++;
        }
        catch (Exception localException)
        {
          LogUtils.errorLog(this.TAG, "; Exception: ", localException);
        }
      }
    }
    postWeeklyCalendarAction(localAction, localHashMap);
  }
  
  private void writeDBFileToDevice()
  {
    Action localAction = this.device.getAction("GetRulesDBPath");
    GetRulesDBPathActionCallback localGetRulesDBPathActionCallback = new GetRulesDBPathActionCallback(this.device.getUDN());
    ControlActionHandler.newInstance().postControlAction(localAction, 15000, 4000, localGetRulesDBPathActionCallback, localGetRulesDBPathActionCallback);
  }
  
  public void run()
  {
    if (this.processDBState == 2)
    {
      if (this.weeklyRecordArray != null)
      {
        updateWeeklyCalenderLinkDevice();
        return;
      }
      onInvalidWeeklyRecordError();
      return;
    }
    if (this.processDBState == 1)
    {
      if (this.weeklyRecordArray != null)
      {
        updateWeeklyCalenderNonLinkDevice();
        return;
      }
      onInvalidWeeklyRecordError();
      return;
    }
    writeDBFileToDevice();
  }
  
  private class GetRulesDBPathActionCallback
    extends StoreDeviceRulesNoStoreSupportRunnable.StoreDeviceRuleActionCallback
  {
    public GetRulesDBPathActionCallback(String paramString)
    {
      super(paramString);
    }
    
    public void onActionSuccess(String paramString)
    {
      if ((!TextUtils.isEmpty(paramString)) && (!paramString.equals("app_error")))
      {
        String str = StoreDeviceRulesNoStoreSupportRunnable.this.parseRulesDBPath(paramString);
        LogUtils.infoLog(StoreDeviceRulesNoStoreSupportRunnable.this.TAG, "STORE RULES (No Store): Extracted DB Path of device: " + str);
        if (!TextUtils.isEmpty(str))
        {
          UploadFileUtil.writeDBToDevice(StoreDeviceRulesNoStoreSupportRunnable.this.localZippedDBFilePath, str);
          LogUtils.infoLog(StoreDeviceRulesNoStoreSupportRunnable.this.TAG, "STORE RULES (No Store): Write DB File to Device SUCCESS");
          StoreDeviceRulesNoStoreSupportRunnable.this.setRulesDBVersionOnDevice();
        }
      }
      do
      {
        do
        {
          return;
          LogUtils.errorLog(StoreDeviceRulesNoStoreSupportRunnable.this.TAG, "STORE RULES (No Store): GetRulesDBPath received is empty.");
        } while (StoreDeviceRulesNoStoreSupportRunnable.this.callback == null);
        StoreDeviceRulesNoStoreSupportRunnable.this.callback.onError(new RuleDeviceError(this.deviceUdn));
        return;
        LogUtils.errorLog(StoreDeviceRulesNoStoreSupportRunnable.this.TAG, "STORE RULES (No Store): Error response received for Action: GetRulesDBPath");
      } while (StoreDeviceRulesNoStoreSupportRunnable.this.callback == null);
      StoreDeviceRulesNoStoreSupportRunnable.this.callback.onError(new RuleDeviceError(this.deviceUdn));
    }
    
    protected void onExceptionEncountered(Exception paramException)
    {
      LogUtils.errorLog(StoreDeviceRulesNoStoreSupportRunnable.this.TAG, "STORE RULES (No Store): Write DB File to Device FAILED. Device: " + this.deviceUdn);
    }
  }
  
  private class SetRulesDBVersionActionCallback
    extends StoreDeviceRulesNoStoreSupportRunnable.StoreDeviceRuleActionCallback
  {
    public SetRulesDBVersionActionCallback(String paramString)
    {
      super(paramString);
    }
    
    public void onActionSuccess(String paramString)
    {
      if (StoreDeviceRulesNoStoreSupportRunnable.this.callback != null) {
        StoreDeviceRulesNoStoreSupportRunnable.this.callback.onSuccess(this.deviceUdn);
      }
    }
    
    protected void onExceptionEncountered(Exception paramException)
    {
      LogUtils.errorLog(StoreDeviceRulesNoStoreSupportRunnable.this.TAG, "STORE RULES (No Store): Setting Rules DB version to Device FAILED. Device: " + this.deviceUdn);
    }
  }
  
  private abstract class StoreDeviceRuleActionCallback
    implements ControlActionHandler.ControlActionErrorCallback, ControlActionHandler.ControlActionSuccessCallback
  {
    protected String deviceUdn;
    
    public StoreDeviceRuleActionCallback(String paramString)
    {
      this.deviceUdn = paramString;
    }
    
    public void onActionError(Exception paramException)
    {
      onExceptionEncountered(paramException);
      String str;
      RuleDeviceError localRuleDeviceError;
      if (StoreDeviceRulesNoStoreSupportRunnable.this.callback != null)
      {
        str = paramException.getMessage();
        if (!str.equals("Socket connection error while trying to post uPnP Action.")) {
          break label59;
        }
        localRuleDeviceError = new RuleDeviceError(65336, str, this.deviceUdn);
      }
      for (;;)
      {
        StoreDeviceRulesNoStoreSupportRunnable.this.callback.onError(localRuleDeviceError);
        return;
        label59:
        localRuleDeviceError = new RuleDeviceError(this.deviceUdn);
        localRuleDeviceError.setErrorMessage(str);
      }
    }
    
    protected abstract void onExceptionEncountered(Exception paramException);
  }
  
  private class WeeklyCalendarActionCallback
    extends StoreDeviceRulesNoStoreSupportRunnable.StoreDeviceRuleActionCallback
  {
    public WeeklyCalendarActionCallback(String paramString)
    {
      super(paramString);
    }
    
    public void onActionSuccess(String paramString)
    {
      if (!TextUtils.isEmpty(paramString)) {
        StoreDeviceRulesNoStoreSupportRunnable.this.writeDBFileToDevice();
      }
      while (StoreDeviceRulesNoStoreSupportRunnable.this.callback == null) {
        return;
      }
      StoreDeviceRulesNoStoreSupportRunnable.this.callback.onError(new RuleDeviceError(this.deviceUdn));
    }
    
    protected void onExceptionEncountered(Exception paramException)
    {
      LogUtils.errorLog(StoreDeviceRulesNoStoreSupportRunnable.this.TAG, "STORE RULES (No Store): Update Weekly calendar call failed, device: " + this.deviceUdn + "; Exception: ", paramException);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */