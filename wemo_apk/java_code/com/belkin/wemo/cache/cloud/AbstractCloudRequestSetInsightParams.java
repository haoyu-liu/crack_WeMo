package com.belkin.wemo.cache.cloud;

import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.devicelist.JSONConstants;
import com.belkin.wemo.cache.utils.InsightParamsCloudResponseParser;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.io.UnsupportedEncodingException;
import org.json.JSONException;
import org.json.JSONObject;

public abstract class AbstractCloudRequestSetInsightParams
  extends AbstractCloudRequest
{
  private final String TAG = "SDK_CloudRequestSetInsightParams";
  private int TIMEOUT = 10000;
  private final int TIMEOUT_LIMIT = 40000;
  private final String URL = CloudConstants.CLOUD_URL + "/apis/http/plugin/message/";
  private String executeAction;
  private JSONObject insightParams;
  private DeviceListManager mDevMgr;
  private DeviceInformation mDeviceInfo;
  
  public AbstractCloudRequestSetInsightParams(DeviceListManager paramDeviceListManager, DeviceInformation paramDeviceInformation, String paramString, JSONObject paramJSONObject)
  {
    this.mDevMgr = paramDeviceListManager;
    this.mDeviceInfo = paramDeviceInformation;
    this.insightParams = paramJSONObject;
    this.executeAction = paramString;
  }
  
  public abstract String getBody();
  
  public DeviceInformation getDeviceInfo()
  {
    return this.mDeviceInfo;
  }
  
  public byte[] getFileByteArray()
  {
    return null;
  }
  
  public JSONObject getInsightParams()
  {
    return this.insightParams;
  }
  
  public int getRequestMethod()
  {
    return 1;
  }
  
  public int getTimeout()
  {
    return this.TIMEOUT;
  }
  
  public int getTimeoutLimit()
  {
    return 40000;
  }
  
  public String getURL()
  {
    return this.URL;
  }
  
  public String getUploadFileName()
  {
    return null;
  }
  
  public void requestComplete(boolean paramBoolean, int paramInt, byte[] paramArrayOfByte)
  {
    SDKLogUtils.debugLog("SDK_CloudRequestSetInsightParams", "Cloud Request for set insight params. isSucess:  " + paramBoolean);
    if (paramBoolean) {}
    do
    {
      boolean bool;
      for (;;)
      {
        try
        {
          String str = new String(paramArrayOfByte, "UTF-8");
          SDKLogUtils.infoLog("SDK_CloudRequestSetInsightParams", str);
          bool = new InsightParamsCloudResponseParser().parseSetResponse(str);
          if (bool) {
            this.mDeviceInfo.getAttributeList();
          }
          try
          {
            if (this.executeAction.equals("SetPowerThreshold"))
            {
              this.mDeviceInfo.setAttributeValue(JSONConstants.INSIGHT_POWER_THRESHOLD, this.insightParams.getString(JSONConstants.INSIGHT_POWER_THRESHOLD));
              this.mDevMgr.updateAtributeListForInsightInRemote(this.mDeviceInfo.getAttributeList(), this.mDeviceInfo);
              SDKLogUtils.infoLog("SDK_CloudRequestSetInsightParams", "Response parse: " + String.valueOf(bool));
              this.mDevMgr.sendNotification("set_state", Boolean.toString(paramBoolean), this.mDeviceInfo.getUDN());
              if (getOnCloudRequestCompletedListener() != null)
              {
                if (!bool) {
                  break;
                }
                getOnCloudRequestCompletedListener().onSuccess();
              }
              return;
            }
            if (this.executeAction.equals("SetInsightHomeSettings"))
            {
              this.mDeviceInfo.setAttributeValue(JSONConstants.INSIGHT_CURRENCY, this.insightParams.getString(JSONConstants.INSIGHT_CURRENCY));
              this.mDeviceInfo.setAttributeValue(JSONConstants.INSIGHT_ENERGY_PER_UNIT_COST, this.insightParams.getString(JSONConstants.INSIGHT_ENERGY_PER_UNIT_COST));
              continue;
            }
          }
          catch (JSONException localJSONException)
          {
            SDKLogUtils.errorLog("SDK_CloudRequestSetInsightParams", "JSONException while saving attibutes to DB", localJSONException);
            continue;
          }
          if (!this.executeAction.equals("ScheduleDataExport")) {
            continue;
          }
        }
        catch (UnsupportedEncodingException localUnsupportedEncodingException)
        {
          SDKLogUtils.errorLog("SDK_CloudRequestSetInsightParams", "UnsupportedEncodingException while parsing API response ", localUnsupportedEncodingException);
          return;
        }
        this.mDeviceInfo.setAttributeValue(JSONConstants.INSIGHT_EXPORT_EMAIL, this.insightParams.getString(JSONConstants.INSIGHT_EXPORT_EMAIL));
        this.mDeviceInfo.setAttributeValue(JSONConstants.INSIGHT_EXPORT_INTERVAL, this.insightParams.getString(JSONConstants.INSIGHT_EXPORT_INTERVAL));
      }
      getOnCloudRequestCompletedListener().onError(String.valueOf(bool));
      return;
      this.mDevMgr.sendNotification("set_state", Boolean.toString(paramBoolean), this.mDeviceInfo.getUDN());
    } while (getOnCloudRequestCompletedListener() == null);
    getOnCloudRequestCompletedListener().onError(Boolean.toString(paramBoolean));
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/AbstractCloudRequestSetInsightParams.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */