package com.belkin.wemo.cache.cloud;

import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.devicelist.JSONConstants;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

public class CRScheduleDataExport
  extends AbstractCloudRequestSetInsightParams
{
  private final String TAG = "SDK_CRScheduleDataExport";
  
  public CRScheduleDataExport(DeviceListManager paramDeviceListManager, DeviceInformation paramDeviceInformation, String paramString, JSONObject paramJSONObject)
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
    Object localObject = "";
    try
    {
      String str = "<plugins><plugin><recipientId>" + localDeviceInformation.getPluginID() + "</recipientId>" + "<macAddress>" + localDeviceInformation.getMAC() + "</macAddress>" + "<content><![CDATA[<scheduleDataExport>" + "<plugin>" + "<macAddress>" + localDeviceInformation.getMAC() + "</macAddress>" + "<emailAddress>" + getInsightParams().getString(JSONConstants.INSIGHT_EXPORT_EMAIL) + "</emailAddress>" + "<dataExportType>" + getInsightParams().getString(JSONConstants.INSIGHT_EXPORT_INTERVAL) + "</dataExportType>" + "</plugin>" + "</scheduleDataExport>]]></content>" + "</plugin>" + "</plugins>";
      localObject = str;
    }
    catch (JSONException localJSONException)
    {
      for (;;)
      {
        SDKLogUtils.errorLog("SDK_CRScheduleDataExport", "JSONException while making xml string ", localJSONException);
      }
    }
    SDKLogUtils.infoLog("SDK_CRScheduleDataExport", "xmlString:::" + (String)localObject);
    return (String)localObject;
  }
  
  public boolean isAuthHeaderRequired()
  {
    return true;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CRScheduleDataExport.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */