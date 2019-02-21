package com.belkin.wemo.cache.cloud;

import android.content.Context;
import com.belkin.wemo.cache.cloud.listener.OnRequestCompleteListener;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

public class CloudRequestResetFNIRulesZigbee
  implements CloudRequestInterface
{
  private final String MODEL_CODE_BRIDGE = "Bridge";
  private final String TAG = "CloudRequestResetFNIRulesZigbee";
  private final int TIMEOUT = 15000;
  private final int TIMEOUTLIMIT = 45000;
  private final String URLInsightParamsMessage = "https://api.xbcs.net:8443/apis/http/plugin/insight/message/";
  private OnRequestCompleteListener listener;
  private JSONObject mBridgeData;
  private Context mContext;
  private DeviceListManager mDLM;
  private String mFN;
  private String mMac;
  private String mPluginId;
  private String mUdn;
  
  public CloudRequestResetFNIRulesZigbee(DeviceListManager paramDeviceListManager, String paramString1, String paramString2, String paramString3, JSONObject paramJSONObject, String paramString4, OnRequestCompleteListener paramOnRequestCompleteListener)
  {
    this.mDLM = paramDeviceListManager;
    this.mMac = paramString3;
    this.mContext = DeviceListManager.context;
    this.mUdn = paramString1;
    this.mPluginId = paramString2;
    this.mFN = paramString4;
    this.mBridgeData = paramJSONObject;
    this.listener = paramOnRequestCompleteListener;
  }
  
  public Map<String, String> getAdditionalHeaders()
  {
    return null;
  }
  
  public String getBody()
  {
    String str = "";
    try
    {
      if ((this.mBridgeData != null) && (this.mBridgeData.length() > 2) && (this.mBridgeData.has("bridgeMacAddress")) && (this.mBridgeData.has("bridgePluginId")) && (this.mBridgeData.has("bridgeudn")))
      {
        str = "<plugins><plugin><recipientId>" + this.mBridgeData.getString("bridgePluginId") + "</recipientId>" + "<macAddress>" + this.mBridgeData.getString("bridgeMacAddress") + "</macAddress>" + "<modelCode>" + "Bridge" + "</modelCode>" + "<content><![CDATA[<resetNameRulesData>" + "<plugin>" + "<macAddress>" + this.mMac + "</macAddress>" + "<friendlyName>" + this.mFN + "</friendlyName>" + "<resetType>" + "1" + "</resetType>" + "</plugin>" + "</resetNameRulesData>]]></content>" + "</plugin>" + "</plugins>";
        SDKLogUtils.infoLog("CloudRequestResetFNIRulesZigbee", "xmlString: " + str);
        return str;
      }
    }
    catch (JSONException localJSONException)
    {
      SDKLogUtils.errorLog("CloudRequestResetFNIRulesZigbee", "Exception in getBody()", localJSONException);
    }
    return str;
  }
  
  public byte[] getFileByteArray()
  {
    return null;
  }
  
  public int getRequestMethod()
  {
    return 1;
  }
  
  public int getTimeout()
  {
    return 15000;
  }
  
  public int getTimeoutLimit()
  {
    return 45000;
  }
  
  public String getURL()
  {
    return "https://api.xbcs.net:8443/apis/http/plugin/insight/message/";
  }
  
  public String getUploadFileName()
  {
    return null;
  }
  
  public boolean isAuthHeaderRequired()
  {
    return true;
  }
  
  public void requestComplete(boolean paramBoolean, int paramInt, byte[] paramArrayOfByte)
  {
    SDKLogUtils.infoLog("CloudRequestResetFNIRulesZigbee", "Finished request to reset FN Icon Rules zigbee success: " + paramBoolean + ", response: " + paramArrayOfByte);
    CloudRequestManager localCloudRequestManager;
    JSONObject localJSONObject;
    if (paramBoolean)
    {
      localCloudRequestManager = new CloudRequestManager(this.mContext);
      if (this.mDLM == null) {
        this.mDLM = DeviceListManager.getInstance(this.mContext);
      }
      localJSONObject = this.mBridgeData;
    }
    try
    {
      localJSONObject.put("notificationName", "reset_fn_icon_rules");
      DeviceListManager localDeviceListManager = this.mDLM;
      Context localContext = this.mContext;
      String str1 = this.mUdn;
      String str2 = this.mPluginId;
      String str3 = this.mMac;
      String str4 = this.mFN;
      Object[] arrayOfObject = new Object[1];
      arrayOfObject[0] = this.mBridgeData;
      localCloudRequestManager.makeRequest(new CloudRequestChangeFriendlyName(localDeviceListManager, localContext, str1, str2, str3, str4, arrayOfObject));
      DeviceInformation localDeviceInformation = this.mDLM.getDevice(this.mUdn);
      if (localDeviceInformation != null)
      {
        localDeviceInformation.setFriendlyName(this.mFN);
        localDeviceInformation.setIcon("");
        localDeviceInformation.setIconVersion("");
        localDeviceInformation.setIsDiscovered(true);
        localDeviceInformation.setInActive(0);
        this.mDLM.setDeviceInformationToDevicesArray(localDeviceInformation, false);
        if (this.listener != null) {
          this.listener.onRequestComplete(paramBoolean, paramInt, paramArrayOfByte);
        }
      }
      return;
    }
    catch (JSONException localJSONException)
    {
      SDKLogUtils.errorLog("CloudRequestResetFNIRulesZigbee", "Exception in requestComplete adding props", localJSONException);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestResetFNIRulesZigbee.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */