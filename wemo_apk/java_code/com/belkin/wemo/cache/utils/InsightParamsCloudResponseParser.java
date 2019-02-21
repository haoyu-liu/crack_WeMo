package com.belkin.wemo.cache.utils;

import com.belkin.wemo.cache.cloud.XMLParser;
import com.belkin.wemo.cache.devicelist.JSONConstants;
import com.belkin.wemo.cache.devicelist.UpnpConstants;
import org.json.JSONObject;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

public class InsightParamsCloudResponseParser
{
  private final String TAG = "SDK_InsightParamsCloudResponseParser";
  
  public JSONObject parseGetResponse(String paramString)
  {
    JSONObject localJSONObject1 = new JSONObject();
    try
    {
      XMLParser localXMLParser = new XMLParser();
      String[] arrayOfString1 = UpnpConstants.GET_INSIGHT_PARAMS_DATA;
      Document localDocument = localXMLParser.getDomElement(paramString);
      Element localElement1 = (Element)localDocument.getElementsByTagName("applianceConsumption").item(0);
      for (int i = 0; i < arrayOfString1.length; i++)
      {
        JSONObject localJSONObject2 = new JSONObject();
        localJSONObject2.put("value", localXMLParser.getValue(localElement1, Constants.KEY_INSIGHT_REMOTE_DATA[i]));
        localJSONObject1.put(arrayOfString1[i], localJSONObject2);
      }
      localJSONObject1.put(JSONConstants.INSIGHT_EXPORT_INTERVAL, new JSONObject().put("value", localXMLParser.getValue(localElement1, JSONConstants.INSIGHT_EXPORT_INTERVAL)));
      localJSONObject1.put(JSONConstants.INSIGHT_EXPORT_EMAIL, new JSONObject().put("value", ""));
      String[] arrayOfString2 = UpnpConstants.GET_INSIGHT_HOME_SETTINGS_DATA;
      Element localElement2 = (Element)localDocument.getElementsByTagName("homeSettings").item(0);
      for (int j = 1; j < arrayOfString2.length; j++)
      {
        JSONObject localJSONObject3 = new JSONObject();
        localJSONObject3.put("value", localXMLParser.getValue(localElement2, arrayOfString2[j]));
        localJSONObject1.put(arrayOfString2[j], localJSONObject3);
      }
      SDKLogUtils.infoLog("SDK_InsightParamsCloudResponseParser", "insight attribute list: " + localJSONObject1);
      return localJSONObject1;
    }
    catch (Exception localException)
    {
      SDKLogUtils.errorLog("SDK_InsightParamsCloudResponseParser", "Exception while parsing insight params ", localException);
    }
    return localJSONObject1;
  }
  
  public boolean parseSetResponse(String paramString)
  {
    try
    {
      XMLParser localXMLParser = new XMLParser();
      String str = localXMLParser.getValue((Element)localXMLParser.getDomElement(paramString).getElementsByTagName("plugin").item(0), "macAddress");
      SDKLogUtils.infoLog("SDK_InsightParamsCloudResponseParser", "Success response for insight: " + str);
      return true;
    }
    catch (Exception localException)
    {
      SDKLogUtils.errorLog("SDK_InsightParamsCloudResponseParser", "Exception while parsing API response " + paramString, localException);
    }
    return false;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/utils/InsightParamsCloudResponseParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */