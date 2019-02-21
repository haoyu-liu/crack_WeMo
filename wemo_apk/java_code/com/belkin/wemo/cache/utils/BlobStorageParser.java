package com.belkin.wemo.cache.utils;

import com.belkin.wemo.cache.cloud.XMLParser;
import java.util.Iterator;
import org.json.JSONException;
import org.json.JSONObject;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

public class BlobStorageParser
{
  private static final String TAG = "BlobStorageParser";
  
  public static String createArgumentList(JSONObject paramJSONObject)
    throws JSONException
  {
    StringBuffer localStringBuffer = new StringBuffer();
    Iterator localIterator = paramJSONObject.keys();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      localStringBuffer.append("<attribute>");
      localStringBuffer.append("<name>");
      localStringBuffer.append(str);
      localStringBuffer.append("</name>");
      localStringBuffer.append("<value>");
      localStringBuffer.append(paramJSONObject.optString(str));
      localStringBuffer.append("</value>");
      localStringBuffer.append("</attribute>");
    }
    SDKLogUtils.infoLog("BlobStorageParser", "Parsed: " + localStringBuffer);
    return localStringBuffer.toString();
  }
  
  public static JSONObject parseGetResponse(String paramString)
  {
    JSONObject localJSONObject1 = new JSONObject();
    try
    {
      NodeList localNodeList1 = new XMLParser().getDomElement(paramString).getElementsByTagName("attributeLists");
      for (int i = 0; i < localNodeList1.getLength(); i++)
      {
        Element localElement1 = (Element)localNodeList1.item(i);
        NodeList localNodeList2 = localElement1.getElementsByTagName("name");
        int j = localNodeList2.getLength();
        Element localElement2 = null;
        if (j > 0) {
          localElement2 = (Element)localNodeList2.item(0);
        }
        NodeList localNodeList3 = localElement1.getElementsByTagName("value");
        if (localNodeList3.getLength() > 0) {
          localElement2 = (Element)localNodeList3.item(0);
        }
        JSONObject localJSONObject2 = new JSONObject();
        localJSONObject2.put("name", localElement2.getNodeValue());
        localJSONObject2.put("value", null.getNodeValue());
        localJSONObject1.put(StringUtils.toLowerCamelCase(localElement2.getNodeValue()), localJSONObject2);
      }
      SDKLogUtils.infoLog("BlobStorageParser", "blob storage attribute list attribute list: " + localJSONObject1);
      return localJSONObject1;
    }
    catch (Exception localException)
    {
      SDKLogUtils.errorLog("BlobStorageParser", "Exception while parsing blob storage cloud response  ", localException);
    }
    return localJSONObject1;
  }
  
  public static boolean parseSetResponse(String paramString)
  {
    try
    {
      XMLParser localXMLParser = new XMLParser();
      String str = localXMLParser.getValue((Element)localXMLParser.getDomElement(paramString).getElementsByTagName("plugin").item(0), "macAddress");
      SDKLogUtils.infoLog("BlobStorageParser", "Success response for mac: " + str);
      return true;
    }
    catch (Exception localException)
    {
      SDKLogUtils.errorLog("BlobStorageParser", "Exception while parsing API response " + paramString, localException);
    }
    return false;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/utils/BlobStorageParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */