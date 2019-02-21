package com.belkin.wemo.rules.device.runnable;

import android.text.TextUtils;
import android.util.Base64;
import com.belkin.cybergarage.wrapper.ControlActionHandler;
import com.belkin.cybergarage.wrapper.ControlActionHandler.ControlActionErrorCallback;
import com.belkin.cybergarage.wrapper.ControlActionHandler.ControlActionSuccessCallback;
import com.belkin.upnp.parser.Parser;
import com.belkin.utils.LogUtils;
import com.belkin.utils.UploadFileUtil;
import com.belkin.wemo.rules.device.callback.StoreDeviceRulesCallback;
import com.belkin.wemo.rules.device.error.RuleDeviceError;
import com.belkin.wemo.runnable.WeMoRunnable;
import java.util.HashMap;
import org.cybergarage.upnp.Action;
import org.cybergarage.upnp.Device;
import org.json.JSONException;
import org.json.JSONObject;

public class StoreDeviceRulesStoreSupportRunnable
  extends WeMoRunnable
{
  public static final String DO_NOT_PROCESS_DB = "0";
  public static final String PROCESS_DB_ON_DEVICE = "1";
  private StoreDeviceRulesCallback callback;
  private String dbVersionToSet;
  private Device device;
  private String localZippedDBFilePath;
  private int processDB;
  
  public StoreDeviceRulesStoreSupportRunnable(StoreDeviceRulesCallback paramStoreDeviceRulesCallback, Device paramDevice, String paramString1, String paramString2, int paramInt)
  {
    this.device = paramDevice;
    this.dbVersionToSet = paramString1;
    this.localZippedDBFilePath = paramString2;
    this.processDB = paramInt;
    this.callback = paramStoreDeviceRulesCallback;
  }
  
  private String getDBInBase64Encoding()
  {
    byte[] arrayOfByte = UploadFileUtil.readFile(this.localZippedDBFilePath);
    if (arrayOfByte != null)
    {
      String str = new String(Base64.encode(arrayOfByte, 0)).trim().replaceAll("\n", "").replaceAll("\\n", "").replaceAll("\n\r", "");
      LogUtils.infoLog(this.TAG, "Store Rules: Encoded DB length" + str.length());
      return "<![CDATA[" + str + "]]>";
    }
    LogUtils.errorLog(this.TAG, "Error: Unable to read DB file at " + this.localZippedDBFilePath);
    return "";
  }
  
  private JSONObject parseControlActionResponse(String paramString)
  {
    Parser localParser = new Parser();
    JSONObject localJSONObject = new JSONObject();
    localParser.uPnPResponseParser(localJSONObject, 18, paramString);
    LogUtils.infoLog(this.TAG, "Store Device Rules Response JSON: " + localJSONObject);
    return localJSONObject;
  }
  
  private void sendResponseViaCallbacks(JSONObject paramJSONObject, String paramString)
  {
    try
    {
      if (paramJSONObject.getString("errorInfo").equals("Storing of rules DB Successful!"))
      {
        this.callback.onSuccess(paramString);
        return;
      }
      this.callback.onError(new RuleDeviceError(paramString));
      return;
    }
    catch (JSONException localJSONException)
    {
      LogUtils.errorLog(this.TAG, "JSONException in Device STORE RULES: ", localJSONException);
      this.callback.onError(new RuleDeviceError(-1, localJSONException.getMessage(), paramString));
      return;
    }
    catch (NumberFormatException localNumberFormatException)
    {
      LogUtils.errorLog(this.TAG, "NumberFormatException in Device STORE RULES: ", localNumberFormatException);
      this.callback.onError(new RuleDeviceError(-1, localNumberFormatException.getMessage(), paramString));
    }
  }
  
  public void run()
  {
    if (TextUtils.isEmpty(getDBInBase64Encoding()))
    {
      if (this.callback != null) {
        this.callback.onError(new RuleDeviceError(this.device.getUDN()));
      }
      return;
    }
    Action localAction = this.device.getAction("StoreRules");
    HashMap localHashMap = new HashMap();
    localHashMap.put("ruleDbVersion", this.dbVersionToSet);
    if (this.processDB == -1) {}
    for (String str = "0";; str = "1")
    {
      localHashMap.put("processDb", str);
      localHashMap.put("ruleDbBody", getDBInBase64Encoding());
      StoreRulesActionCallback localStoreRulesActionCallback = new StoreRulesActionCallback(this.device.getUDN());
      ControlActionHandler.newInstance().postControlAction(localAction, 15000, 4000, localStoreRulesActionCallback, localStoreRulesActionCallback, localHashMap);
      return;
    }
  }
  
  private class StoreRulesActionCallback
    implements ControlActionHandler.ControlActionErrorCallback, ControlActionHandler.ControlActionSuccessCallback
  {
    private String deviceUdn;
    
    StoreRulesActionCallback(String paramString)
    {
      this.deviceUdn = paramString;
    }
    
    public void onActionError(Exception paramException)
    {
      String str;
      if (StoreDeviceRulesStoreSupportRunnable.this.callback != null)
      {
        str = paramException.getMessage();
        if (!str.equals("Socket connection error while trying to post uPnP Action.")) {
          break label54;
        }
      }
      label54:
      for (RuleDeviceError localRuleDeviceError = new RuleDeviceError(65336, str, this.deviceUdn);; localRuleDeviceError = new RuleDeviceError(this.deviceUdn))
      {
        StoreDeviceRulesStoreSupportRunnable.this.callback.onError(localRuleDeviceError);
        return;
      }
    }
    
    public void onActionSuccess(String paramString)
    {
      if (StoreDeviceRulesStoreSupportRunnable.this.callback != null) {
        StoreDeviceRulesStoreSupportRunnable.this.sendResponseViaCallbacks(StoreDeviceRulesStoreSupportRunnable.access$100(StoreDeviceRulesStoreSupportRunnable.this, paramString), this.deviceUdn);
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/device/runnable/StoreDeviceRulesStoreSupportRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */