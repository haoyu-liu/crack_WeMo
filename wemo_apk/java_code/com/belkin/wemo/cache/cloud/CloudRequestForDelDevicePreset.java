package com.belkin.wemo.cache.cloud;

import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.callback.SetAndGetActionCallBack;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

public class CloudRequestForDelDevicePreset
  implements CloudRequestInterface
{
  private final String TAG = "CloudRequestForDelDevicePreset";
  private int TIMEOUT = 30000;
  private final int TIMEOUT_LIMIT = 30000;
  private final String URL = CloudConstants.CLOUD_URL + "/apis/http/device/presets/preset/delete/";
  private SetAndGetActionCallBack callback = null;
  private String id = "";
  private String isGroupId = "";
  private String name = "";
  private String type = "";
  private String value = "";
  private String version = "";
  
  public CloudRequestForDelDevicePreset(SetAndGetActionCallBack paramSetAndGetActionCallBack, JSONArray paramJSONArray)
    throws JSONException
  {
    this.callback = paramSetAndGetActionCallBack;
    initDeletePresetRequestValues(paramJSONArray);
  }
  
  private String buildXMLRequest()
  {
    return "<presetList> \n<devicePreset> \n<id>" + this.id + "</id> \n" + "<isGroupID>" + this.isGroupId + "</isGroupID> \n" + "<version>" + this.version + "</version> \n" + "<content> \n" + "<![CDATA[<setDevicePreset> <presetList> <presets>" + " <version>" + this.version + "</version>" + " <isGroupID>" + this.isGroupId + "</isGroupID>" + " <id>" + this.id + "</id>" + " <preset>" + " <name>" + this.name + "</name> " + "<value>" + this.value + "</value> " + "<type>" + this.type + "</type> " + "</preset> " + "</presets> </presetList> </setDevicePreset> ]]>" + "</content> \n" + "<presets> \n" + "<preset> \n" + "<name>" + this.name + "</name> \n" + "<value>" + this.value + "</value> \n" + "<type>" + this.type + "</type> \n" + "</preset> \n" + "</presets> \n" + "</devicePreset> \n" + "</presetList> \n";
  }
  
  private void initDeletePresetRequestValues(JSONArray paramJSONArray)
    throws JSONException
  {
    this.version = Integer.toString(paramJSONArray.getJSONObject(0).getInt("version"));
    this.isGroupId = Integer.toString(paramJSONArray.getJSONObject(0).getInt("isGroupID"));
    this.id = paramJSONArray.getJSONObject(0).getString("id");
    this.name = paramJSONArray.getJSONObject(0).getString("name");
    this.value = paramJSONArray.getJSONObject(0).getString("value");
    this.type = paramJSONArray.getJSONObject(0).getString("type");
  }
  
  private String parseResponse(String paramString)
  {
    String str1 = "";
    XMLParser localXMLParser = new XMLParser();
    NodeList localNodeList = localXMLParser.getDomElement(paramString).getElementsByTagName("devicePreset");
    if ((localNodeList != null) && (localNodeList.getLength() > 0))
    {
      String str2 = localXMLParser.getValue((Element)localNodeList.item(0), "resultCode");
      if ((str2 != null) && (!str2.equals(""))) {
        break label103;
      }
    }
    label103:
    for (str1 = "success";; str1 = "error")
    {
      SDKLogUtils.infoLog("CloudRequestForDelDevicePreset", "parseResponse:: " + str1);
      return str1;
    }
  }
  
  public Map<String, String> getAdditionalHeaders()
  {
    return null;
  }
  
  public String getBody()
  {
    return buildXMLRequest();
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
    SDKLogUtils.infoLog("CloudRequestForDelDevicePreset", "requestComplete status: " + paramBoolean);
    if (paramBoolean) {
      try
      {
        String str1 = new String(paramArrayOfByte, "UTF-8");
        SDKLogUtils.infoLog("CloudRequestForDelDevicePreset", " :: response is:: " + str1);
        String str2 = parseResponse(str1);
        this.callback.onSuccess(str2);
        return;
      }
      catch (Exception localException)
      {
        SDKLogUtils.errorLog("CloudRequestForDelDevicePreset", "Exception occured in Cloud request for delete device preset", localException);
        this.callback.onError();
        return;
      }
    }
    this.callback.onError();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestForDelDevicePreset.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */