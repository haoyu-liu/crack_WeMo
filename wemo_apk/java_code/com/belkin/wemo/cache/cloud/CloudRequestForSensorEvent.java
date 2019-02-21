package com.belkin.wemo.cache.cloud;

import android.content.Context;
import android.text.TextUtils;
import com.belkin.wemo.cache.CacheManager;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.callback.SetAndGetActionCallBack;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class CloudRequestForSensorEvent
  implements CloudRequestInterface
{
  private final String TAG = "CloudRequestForSensorEvent";
  private int TIMEOUT = 30000;
  private final int TIMEOUT_LIMIT = 30000;
  private final String URL = "http://10.20.90.173:6081/blink-event-webservice/wemoevent/eventSearchFilter";
  private JSONArray array;
  private CacheManager mCacheMgr;
  private SetAndGetActionCallBack mCallback;
  
  public CloudRequestForSensorEvent(Context paramContext, SetAndGetActionCallBack paramSetAndGetActionCallBack, JSONArray paramJSONArray)
  {
    this.mCacheMgr = CacheManager.getInstance(paramContext);
    this.mCallback = paramSetAndGetActionCallBack;
    this.array = paramJSONArray;
  }
  
  private String buildXMLForSensorDeviceList()
  {
    JSONArray localJSONArray = this.mCacheMgr.getSensorDevices();
    Object localObject = "";
    int i = 0;
    for (;;)
    {
      if (i >= localJSONArray.length()) {
        return localObject;
      }
      try
      {
        String str = (String)localObject + "<deviceId>" + localJSONArray.getString(i) + "</deviceId>";
        localObject = str;
        i++;
      }
      catch (JSONException localJSONException)
      {
        for (;;)
        {
          SDKLogUtils.errorLog("CloudRequestForSensorEvent", "There is error in fetching UDN array of sensor devices :: ", localJSONException);
        }
      }
    }
    return (String)localObject;
  }
  
  private String buildXMLRequestforEventHistory()
  {
    return "<eventSearchFilter><deviceIds>" + buildXMLForSensorDeviceList() + "</deviceIds>" + "<startTime>" + getStartTime() + "</startTime>" + "<endTime>" + getEndTime() + "</endTime>" + "<fetchSize>" + "25" + "</fetchSize>" + "</eventSearchFilter>";
  }
  
  private long getEndTime()
  {
    try
    {
      if (this.array.getString(0).equals("0")) {
        return 0L;
      }
      long l = System.currentTimeMillis();
      return l;
    }
    catch (JSONException localJSONException)
    {
      SDKLogUtils.errorLog("CloudRequestForSensorEvent", "JSON Exception during JSON parsing :: ", localJSONException);
    }
    return 0L;
  }
  
  private long getStartTime()
  {
    try
    {
      if (this.array.getString(0).equals("-1")) {
        return this.mCacheMgr.getLatestEventTimeStamp().longValue();
      }
      long l = this.array.getLong(1);
      return l;
    }
    catch (JSONException localJSONException)
    {
      SDKLogUtils.errorLog("CloudRequestForSensorEvent", "JSON Exception during JSON parsing :: ", localJSONException);
    }
    return 0L;
  }
  
  public Map<String, String> getAdditionalHeaders()
  {
    return null;
  }
  
  public String getBody()
  {
    return buildXMLRequestforEventHistory();
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
    return this.TIMEOUT;
  }
  
  public int getTimeoutLimit()
  {
    return 30000;
  }
  
  public String getURL()
  {
    return "http://10.20.90.173:6081/blink-event-webservice/wemoevent/eventSearchFilter";
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
    SDKLogUtils.infoLog("CloudRequestForSensorEvent", "requestComplete status: " + paramBoolean);
    if (paramBoolean) {
      try
      {
        String str = new String(paramArrayOfByte, "UTF-8");
        SDKLogUtils.infoLog("CloudRequestForSensorEvent", " :: response is:: " + str);
        if (!TextUtils.isEmpty(str))
        {
          JSONObject localJSONObject = new JSONObject(str);
          this.mCacheMgr.addSenosrEventsintoDB(localJSONObject);
          this.mCallback.onSuccess(str);
          return;
        }
        this.mCallback.onSuccess(null);
        return;
      }
      catch (Exception localException)
      {
        SDKLogUtils.errorLog("CloudRequestForSensorEvent", "Exception occured in Cloud request for Sensor Event History", localException);
        this.mCallback.onError();
        return;
      }
    }
    this.mCallback.onError();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestForSensorEvent.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */