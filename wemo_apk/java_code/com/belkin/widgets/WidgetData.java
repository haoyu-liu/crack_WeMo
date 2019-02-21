package com.belkin.widgets;

import android.text.TextUtils;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.utils.IsDevice;
import org.json.JSONException;
import org.json.JSONObject;

public class WidgetData
{
  private static final String GROUP_KEY = "isGroup";
  private static final String ID_KEY = "id";
  private static final String LIGHT_LEVEL_KEY = "lightLevel";
  private static final String NAME_KEY = "name";
  private static final String STATE_KEY = "state";
  private static final String TAG = WidgetData.class.getSimpleName();
  private JSONObject data;
  
  public WidgetData(DeviceInformation paramDeviceInformation)
  {
    this.data = new JSONObject();
    boolean bool;
    String str1;
    if (TextUtils.isEmpty(paramDeviceInformation.getGroupID()))
    {
      bool = false;
      str1 = paramDeviceInformation.getFriendlyName();
    }
    for (String str2 = paramDeviceInformation.getUDN();; str2 = paramDeviceInformation.getGroupID())
    {
      setName(str1);
      setId(str2);
      setState(paramDeviceInformation.getState());
      setIsGroup(bool);
      setLightLevel(getLightLevelPercentage(paramDeviceInformation));
      return;
      bool = true;
      str1 = paramDeviceInformation.getGroupName();
    }
  }
  
  public WidgetData(String paramString)
  {
    try
    {
      this.data = new JSONObject(paramString);
      return;
    }
    catch (JSONException localJSONException)
    {
      LogUtils.errorLog(TAG, "JSONException while building WidgetData: ", localJSONException);
    }
  }
  
  private static int getLightLevelPercentage(DeviceInformation paramDeviceInformation)
  {
    if (paramDeviceInformation != null) {
      try
      {
        if (IsDevice.Dimmer(paramDeviceInformation.getUDN())) {
          return Integer.valueOf(paramDeviceInformation.getAttributeValue("brightness")).intValue();
        }
        JSONObject localJSONObject = new JSONObject(paramDeviceInformation.getCapabilities());
        if ((localJSONObject != null) && (localJSONObject.has("levelControl")))
        {
          String[] arrayOfString = localJSONObject.getString("levelControl").split(":");
          if ((arrayOfString.length > 0) && (!TextUtils.isEmpty(arrayOfString[0])))
          {
            int i = 100 * Integer.parseInt(arrayOfString[0]) / 255;
            return i;
          }
        }
      }
      catch (JSONException localJSONException)
      {
        LogUtils.debugLog(TAG, "Unable to parse device capabilities string");
      }
    }
    return -1;
  }
  
  public String getId()
  {
    return this.data.optString("id");
  }
  
  public int getLightLevel()
  {
    return this.data.optInt("lightLevel", -1);
  }
  
  public String getName()
  {
    return this.data.optString("name");
  }
  
  public int getState()
  {
    return this.data.optInt("state", -1);
  }
  
  public boolean isGroup()
  {
    return this.data.optBoolean("isGroup");
  }
  
  public boolean setId(String paramString)
  {
    try
    {
      this.data.put("id", paramString);
      return true;
    }
    catch (JSONException localJSONException)
    {
      LogUtils.errorLog(TAG, "JSONException while building WidgetData: ", localJSONException);
    }
    return false;
  }
  
  public boolean setIsGroup(boolean paramBoolean)
  {
    try
    {
      this.data.put("isGroup", paramBoolean);
      return true;
    }
    catch (JSONException localJSONException)
    {
      LogUtils.errorLog(TAG, "JSONException while building WidgetData: ", localJSONException);
    }
    return false;
  }
  
  public boolean setLightLevel(int paramInt)
  {
    try
    {
      this.data.put("lightLevel", paramInt);
      return true;
    }
    catch (JSONException localJSONException)
    {
      LogUtils.errorLog(TAG, "JSONException while building WidgetData: ", localJSONException);
    }
    return false;
  }
  
  public boolean setName(String paramString)
  {
    try
    {
      this.data.put("name", paramString);
      return true;
    }
    catch (JSONException localJSONException)
    {
      LogUtils.errorLog(TAG, "JSONException while building WidgetData: ", localJSONException);
    }
    return false;
  }
  
  public boolean setState(int paramInt)
  {
    try
    {
      this.data.put("state", paramInt);
      return true;
    }
    catch (JSONException localJSONException)
    {
      LogUtils.errorLog(TAG, "JSONException while building WidgetData: ", localJSONException);
    }
    return false;
  }
  
  public String toString()
  {
    return this.data.toString();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/widgets/WidgetData.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */