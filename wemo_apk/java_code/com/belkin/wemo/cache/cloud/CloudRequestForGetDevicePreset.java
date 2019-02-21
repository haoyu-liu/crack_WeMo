package com.belkin.wemo.cache.cloud;

import com.belkin.wemo.cache.utils.Constants;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.callback.SetAndGetActionCallBack;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

public class CloudRequestForGetDevicePreset
  implements CloudRequestInterface
{
  private final String TAG = "CloudRequestForGetDevicePreset";
  private int TIMEOUT = 30000;
  private final int TIMEOUT_LIMIT = 30000;
  private String URL = CloudConstants.CLOUD_URL + "/apis/http/device/presets/";
  private SetAndGetActionCallBack callback = null;
  private String id = "";
  private String isGroupId = "";
  
  public CloudRequestForGetDevicePreset(SetAndGetActionCallBack paramSetAndGetActionCallBack, JSONArray paramJSONArray)
    throws JSONException
  {
    this.callback = paramSetAndGetActionCallBack;
    initSetPresetRequestValues(paramJSONArray);
    if (this.isGroupId.equals("0"))
    {
      this.URL = (this.URL + "device/" + this.id);
      return;
    }
    this.URL = (this.URL + "group/" + this.id);
  }
  
  private void initSetPresetRequestValues(JSONArray paramJSONArray)
    throws JSONException
  {
    this.isGroupId = Integer.toString(paramJSONArray.getJSONObject(0).getInt("isGroupID"));
    this.id = paramJSONArray.getJSONObject(0).getString("id");
  }
  
  private JSONObject parseResponse(String paramString)
  {
    JSONObject localJSONObject1 = new JSONObject();
    try
    {
      XMLParser localXMLParser = new XMLParser();
      String[] arrayOfString1 = Constants.KEY_GET_DEVICE_PRESET_DATA;
      Element localElement1 = (Element)localXMLParser.getDomElement(paramString).getElementsByTagName("devicePreset").item(0);
      if (localElement1 != null)
      {
        localJSONObject1.put(arrayOfString1[0], localXMLParser.getValue(localElement1, arrayOfString1[0]));
        localJSONObject1.put(arrayOfString1[1], this.isGroupId);
        localJSONObject1.put(arrayOfString1[2], this.id);
        NodeList localNodeList = localElement1.getElementsByTagName("preset");
        JSONArray localJSONArray = new JSONArray();
        for (int i = 0; i < localNodeList.getLength(); i++)
        {
          Element localElement2 = (Element)localNodeList.item(i);
          JSONObject localJSONObject2 = new JSONObject();
          for (String str : Constants.KEY_GET_PRESET_DATA) {
            localJSONObject2.put(str, localXMLParser.getValue(localElement2, str));
          }
          localJSONArray.put(localJSONObject2);
        }
        localJSONObject1.put("preset", localJSONArray);
      }
      return localJSONObject1;
    }
    catch (Exception localException)
    {
      SDKLogUtils.errorLog("CloudRequestForGetDevicePreset", " Exception while parsing get preset list " + localException);
    }
    return localJSONObject1;
  }
  
  public Map<String, String> getAdditionalHeaders()
  {
    return null;
  }
  
  public String getBody()
  {
    return "";
  }
  
  public byte[] getFileByteArray()
  {
    return null;
  }
  
  public int getRequestMethod()
  {
    return 2;
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
    return this.URL;
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
    SDKLogUtils.infoLog("CloudRequestForGetDevicePreset", "requestComplete status: " + paramBoolean);
    if (paramBoolean) {
      try
      {
        String str = new String(paramArrayOfByte, "UTF-8");
        SDKLogUtils.infoLog("CloudRequestForGetDevicePreset", " :: response is:: " + str);
        JSONObject localJSONObject = parseResponse(str);
        this.callback.onSuccess(localJSONObject.toString());
        return;
      }
      catch (Exception localException)
      {
        SDKLogUtils.errorLog("CloudRequestForGetDevicePreset", "Exception occured in Cloud request for get device preset", localException);
        this.callback.onError();
        return;
      }
    }
    this.callback.onError();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestForGetDevicePreset.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */