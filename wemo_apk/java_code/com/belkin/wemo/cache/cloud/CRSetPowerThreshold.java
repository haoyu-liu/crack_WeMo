package com.belkin.wemo.cache.cloud;

import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.devicelist.JSONConstants;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

public class CRSetPowerThreshold
  extends AbstractCloudRequestSetInsightParams
{
  private final String TAG = "SDK_CRSetPowerThreshold";
  
  public CRSetPowerThreshold(DeviceListManager paramDeviceListManager, DeviceInformation paramDeviceInformation, String paramString, JSONObject paramJSONObject)
  {
    super(paramDeviceListManager, paramDeviceInformation, paramString, paramJSONObject);
  }
  
  public Map<String, String> getAdditionalHeaders()
  {
    return null;
  }
  
  public String getBody()
  {
    DeviceInformation localDeviceInformation = getDeviceInfo();
    String str1 = getPowerThresold();
    if (getDefaultPowerThreshold() != null) {}
    for (String str2 = getDefaultPowerThreshold();; str2 = str1)
    {
      String str3 = "<plugins><plugin><recipientId>" + localDeviceInformation.getPluginID() + "</recipientId>" + "<macAddress>" + localDeviceInformation.getMAC() + "</macAddress>" + "<content><![CDATA[<setPowerThreshold>" + "<plugin>" + "<pluginID>" + localDeviceInformation.getPluginID() + "</pluginID>" + "<macAddress>" + localDeviceInformation.getMAC() + "</macAddress>" + "<defaultPowerThreshold>" + str2 + "</defaultPowerThreshold>" + "<powerThreshold>" + str1 + "</powerThreshold>" + "</plugin>" + "</setPowerThreshold>]]></content>" + "</plugin>" + "</plugins>";
      SDKLogUtils.debugLog("SDK_CRSetPowerThreshold", "SetPowerThreshold: xmlString: " + str3);
      return str3;
    }
  }
  
  protected String getDefaultPowerThreshold()
  {
    return null;
  }
  
  protected String getPowerThresold()
  {
    try
    {
      String str = getInsightParams().getString(JSONConstants.INSIGHT_POWER_THRESHOLD);
      return str;
    }
    catch (JSONException localJSONException)
    {
      SDKLogUtils.errorLog("SDK_CRSetPowerThreshold", "JSONException while extracting powerThreshold on attribute list: ", localJSONException);
    }
    return "";
  }
  
  public boolean isAuthHeaderRequired()
  {
    return true;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CRSetPowerThreshold.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */