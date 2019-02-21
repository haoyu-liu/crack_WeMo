package com.belkin.wemo.rules.operation.runnable;

import android.content.Context;
import com.belkin.wemo.cache.cloud.CloudRequestManager;
import com.belkin.wemo.cache.cloud.XMLParser;
import com.belkin.wemo.cache.cloud.listener.OnRequestCompleteListener;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.rules.device.callback.RMFetchDeviceRulesErrorCallback;
import com.belkin.wemo.rules.device.callback.RMFetchDeviceRulesSuccesCallback;
import com.belkin.wemo.rules.device.error.RMRuleDeviceError;
import com.belkin.wemo.runnable.WeMoRunnable;
import java.io.UnsupportedEncodingException;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

public class GetDBVersionRemoteRunnable
  extends WeMoRunnable
  implements OnRequestCompleteListener
{
  private static final String REMOTE_DB_PATH_STUB = "remote_db_path_not_required";
  private static final String TAG_DB_VERSION = "dbVersion";
  private static final String TAG_PLUGIN = "plugin";
  private CloudRequestManager cloudRequestManager;
  private Context context;
  private DeviceInformation deviceInfo;
  private RMFetchDeviceRulesErrorCallback errorCallback;
  private RMFetchDeviceRulesSuccesCallback succesCallback;
  
  public GetDBVersionRemoteRunnable(Context paramContext, RMFetchDeviceRulesErrorCallback paramRMFetchDeviceRulesErrorCallback, RMFetchDeviceRulesSuccesCallback paramRMFetchDeviceRulesSuccesCallback, DeviceInformation paramDeviceInformation, CloudRequestManager paramCloudRequestManager)
  {
    this.deviceInfo = paramDeviceInformation;
    this.errorCallback = paramRMFetchDeviceRulesErrorCallback;
    this.succesCallback = paramRMFetchDeviceRulesSuccesCallback;
    this.cloudRequestManager = paramCloudRequestManager;
    this.context = paramContext;
  }
  
  private String parseResponse(String paramString)
  {
    XMLParser localXMLParser = new XMLParser();
    return localXMLParser.getValue((Element)localXMLParser.getDomElement(paramString).getElementsByTagName("plugin").item(0), "dbVersion");
  }
  
  public void onRequestComplete(boolean paramBoolean, int paramInt, byte[] paramArrayOfByte)
  {
    SDKLogUtils.debugLog(this.TAG, "FetchRules Remote: Get DB Version from clour. Request completed for UDN: " + this.deviceInfo.getUDN());
    if (paramBoolean) {}
    do
    {
      try
      {
        String str1 = new String(paramArrayOfByte, "UTF-8");
        SDKLogUtils.debugLog(this.TAG, "GetDBVersion cloud resposne: " + str1);
        String str2 = parseResponse(str1);
        if (this.succesCallback != null) {
          this.succesCallback.onSuccess(Integer.valueOf(str2).intValue(), "remote_db_path_not_required", this.deviceInfo.getUDN());
        }
        return;
      }
      catch (UnsupportedEncodingException localUnsupportedEncodingException)
      {
        while (this.errorCallback == null) {}
        SDKLogUtils.errorLog(this.TAG, "UnsupportedEncodingException while encoding GetDBVersion cloud response: ", localUnsupportedEncodingException);
        this.errorCallback.onError(new RMRuleDeviceError(-1, localUnsupportedEncodingException.getMessage(), this.deviceInfo.getUDN()));
        return;
      }
      catch (NumberFormatException localNumberFormatException)
      {
        while (this.errorCallback == null) {}
        SDKLogUtils.errorLog(this.TAG, "UnsupportedEncodingException for db version received from cloud: ", localNumberFormatException);
        this.errorCallback.onError(new RMRuleDeviceError(-1, localNumberFormatException.getMessage(), this.deviceInfo.getUDN()));
        return;
      }
      SDKLogUtils.errorLog(this.TAG, "Error received while fetching rules DB version from cloud for device: " + this.deviceInfo.getMAC() + "; STATUS CODE: " + paramInt);
    } while (this.errorCallback == null);
    this.errorCallback.onError(new RMRuleDeviceError(paramInt, "Error while processing Rules!", this.deviceInfo.getUDN()));
  }
  
  public void run()
  {
    int i = this.deviceInfo.getRulesDBVersion();
    SDKLogUtils.debugLog(this.TAG, "FetchRules Remote: UDN: " + this.deviceInfo.getUDN() + "; Rules DB Version: " + i);
    if (this.succesCallback != null) {
      this.succesCallback.onSuccess(i, "remote_db_path_not_required", this.deviceInfo.getUDN());
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/operation/runnable/GetDBVersionRemoteRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */