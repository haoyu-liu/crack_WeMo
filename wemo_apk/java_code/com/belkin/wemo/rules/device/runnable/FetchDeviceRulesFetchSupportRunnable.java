package com.belkin.wemo.rules.device.runnable;

import android.text.TextUtils;
import com.belkin.cybergarage.wrapper.ControlActionHandler;
import com.belkin.cybergarage.wrapper.ControlActionHandler.ControlActionErrorCallback;
import com.belkin.cybergarage.wrapper.ControlActionHandler.ControlActionSuccessCallback;
import com.belkin.upnp.parser.Parser;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.rules.device.callback.FetchDeviceRulesCallback;
import com.belkin.wemo.rules.device.error.RuleDeviceError;
import com.belkin.wemo.runnable.WeMoRunnable;
import org.cybergarage.upnp.Action;
import org.cybergarage.upnp.Device;
import org.json.JSONException;
import org.json.JSONObject;

public class FetchDeviceRulesFetchSupportRunnable
  extends WeMoRunnable
{
  private FetchDeviceRulesCallback callback;
  private Device device;
  
  public FetchDeviceRulesFetchSupportRunnable(FetchDeviceRulesCallback paramFetchDeviceRulesCallback, Device paramDevice)
  {
    this.device = paramDevice;
    this.callback = paramFetchDeviceRulesCallback;
  }
  
  public void run()
  {
    Action localAction = this.device.getAction("FetchRules");
    PostActionCallback localPostActionCallback = new PostActionCallback(this.device.getUDN());
    ControlActionHandler.newInstance().postControlAction(localAction, 15000, 4000, localPostActionCallback, localPostActionCallback);
  }
  
  private class PostActionCallback
    implements ControlActionHandler.ControlActionErrorCallback, ControlActionHandler.ControlActionSuccessCallback
  {
    private String udn;
    
    public PostActionCallback(String paramString)
    {
      this.udn = paramString;
    }
    
    public void onActionError(Exception paramException)
    {
      if (FetchDeviceRulesFetchSupportRunnable.this.callback != null) {
        FetchDeviceRulesFetchSupportRunnable.this.callback.onError(new RuleDeviceError(this.udn));
      }
    }
    
    public void onActionSuccess(String paramString)
    {
      JSONObject localJSONObject;
      if ((!TextUtils.isEmpty(paramString)) && (!paramString.equals("app_error")))
      {
        Parser localParser = new Parser();
        localJSONObject = new JSONObject();
        localParser.uPnPResponseParser(localJSONObject, 17, paramString);
        if (FetchDeviceRulesFetchSupportRunnable.this.callback == null) {}
      }
      try
      {
        String str1 = localJSONObject.getString("ruleDbVersion");
        String str2 = localJSONObject.getString("ruleDbPath");
        FetchDeviceRulesFetchSupportRunnable.this.callback.onSuccess(Integer.valueOf(str1).intValue(), str2, FetchDeviceRulesFetchSupportRunnable.this.device.getUDN());
        return;
      }
      catch (JSONException localJSONException)
      {
        LogUtils.errorLog(FetchDeviceRulesFetchSupportRunnable.this.TAG, "JSONException in Device FETCH RULES: ", localJSONException);
        FetchDeviceRulesFetchSupportRunnable.this.callback.onError(new RuleDeviceError(-1, localJSONException.getMessage(), this.udn));
        return;
      }
      catch (NumberFormatException localNumberFormatException)
      {
        LogUtils.errorLog(FetchDeviceRulesFetchSupportRunnable.this.TAG, "NumberFormatException in Device FETCH RULES: ", localNumberFormatException);
        FetchDeviceRulesFetchSupportRunnable.this.callback.onError(new RuleDeviceError(-1, localNumberFormatException.getMessage(), this.udn));
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/device/runnable/FetchDeviceRulesFetchSupportRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */