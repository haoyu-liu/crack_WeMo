package com.belkin.wemo.cache.cloud;

import android.content.Context;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.cache.utils.StringUtils;
import com.localytics.android.Localytics;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

public class CloudRequestSetNestAttribute
  implements CloudRequestInterface
{
  private static final String KEY_CODE = "code";
  private static final String KEY_DESCRIPTION = "description";
  private static final String KEY_RESULT_CODE = "resultCode";
  private static final String KEY_TYPE = "resultType";
  private static final String TAG = CloudRequestSetNestAttribute.class.getSimpleName();
  private final String LOCALYTICS_NEST_ATTRIBUTES = "Toggled";
  private final String LOCALYTICS_NEST_EVENT = "Nest_Event";
  private int TIMEOUT = 30000;
  private final int TIMEOUT_LIMIT = 30000;
  private final String URL = CloudConstants.CLOUD_URL + "/apis/http/plugin/message/";
  private String attributeName = "";
  private String attributeValue = "";
  private JSONObject changedAttributeList;
  private DeviceListManager mDevMgr;
  private String mac = "";
  private String pluginID = "";
  private String status = "";
  private String udn = "";
  
  public CloudRequestSetNestAttribute(Context paramContext, String paramString1, String paramString2, String paramString3, String paramString4, JSONObject paramJSONObject)
  {
    this.mDevMgr = DeviceListManager.getInstance(paramContext);
    this.pluginID = paramString2;
    this.mac = paramString3;
    this.status = paramString4;
    this.udn = paramString1;
    this.changedAttributeList = paramJSONObject;
    this.attributeName = StringUtils.toUpperCamelCase(String.valueOf(paramJSONObject).split(":")[0].replaceAll("\"", "").replaceAll("\\{", ""));
    this.attributeValue = String.valueOf(paramJSONObject).split(":")[1];
    this.attributeValue = this.attributeValue.replaceAll("\"", "").replaceAll("\\}", "");
    SDKLogUtils.infoLog(TAG, " :: attributeName:: " + this.attributeName + " :attributeValue: " + this.attributeValue);
  }
  
  private String buildXMLRequest()
  {
    StringBuffer localStringBuffer = new StringBuffer();
    Iterator localIterator = this.changedAttributeList.keys();
    for (;;)
    {
      String str1;
      try
      {
        if (localIterator.hasNext())
        {
          str1 = (String)localIterator.next();
          String str2 = String.valueOf(this.changedAttributeList.get(str1));
          localStringBuffer.append("\n <attribute>");
          localStringBuffer.append("\n <name>");
          if (str1.equals("hvac"))
          {
            localStringBuffer.append(str1.toUpperCase(Locale.getDefault()));
            localStringBuffer.append("</name>");
            localStringBuffer.append("\n <value>");
            localStringBuffer.append(str2);
            localStringBuffer.append("</value>");
            localStringBuffer.append("\n </attribute>");
          }
        }
        else
        {
          return "<plugins> \n<plugin> \n<recipientId>" + this.pluginID + "</recipientId> \n" + "<macAddress>" + this.mac + "</macAddress> \n" + "<content> \n" + "<![CDATA[ \n" + "<pluginSetDeviceStatus> \n" + "<plugin> \n" + "<pluginId>" + this.pluginID + "</pluginId> \n" + "<macAddress>" + this.mac + "</macAddress> \n" + "<status>" + this.status + "</status> \n" + "<attributeLists action=\"SetAttributes\" >" + localStringBuffer + " \n </attributeLists>\n" + "</plugin> \n" + "</pluginSetDeviceStatus> \n" + "]]> \n" + "</content> \n" + "</plugin> \n" + "</plugins> \n";
        }
      }
      catch (JSONException localJSONException)
      {
        localJSONException.printStackTrace();
      }
      localStringBuffer.append(StringUtils.toUpperCamelCase(str1));
    }
  }
  
  private String parseResponse(String paramString)
  {
    try
    {
      XMLParser localXMLParser = new XMLParser();
      Element localElement = (Element)localXMLParser.getDomElement(paramString).getElementsByTagName("resultCode").item(0);
      String str1 = localXMLParser.getValue(localElement, "code");
      String str2 = localXMLParser.getValue(localElement, "description");
      String str3 = localXMLParser.getValue(localElement, "resultType");
      String str4 = str1 + " &# " + str3 + " &# " + str2;
      return str4;
    }
    catch (Exception localException)
    {
      SDKLogUtils.errorLog(TAG, "Exception in parsing the response:", localException);
    }
    return null;
  }
  
  private void updateLocalytics(String paramString)
  {
    if (paramString != null)
    {
      HashMap localHashMap = new HashMap();
      localHashMap.put("Toggled", paramString);
      Localytics.tagEvent("Nest_Event", localHashMap);
      SDKLogUtils.infoLog(TAG, "updateLocalytics:" + paramString);
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
    if ("AwayState".equalsIgnoreCase(this.attributeName)) {
      updateLocalytics(this.attributeValue);
    }
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
    SDKLogUtils.infoLog(TAG, "requestComplete status: " + paramBoolean);
    if (paramBoolean) {
      try
      {
        this.mDevMgr.sendNotification("set_state", Boolean.toString(paramBoolean), this.udn);
        return;
      }
      catch (Exception localException2)
      {
        SDKLogUtils.errorLog(TAG, "Exception occured", localException2);
        return;
      }
    }
    try
    {
      String str1 = new String(paramArrayOfByte, "UTF-8");
      SDKLogUtils.infoLog(TAG, " :: response is:: " + str1);
      String str2 = parseResponse(str1);
      this.mDevMgr.sendNotification("set_nest_error_code", String.valueOf(str2), "");
      return;
    }
    catch (Exception localException1)
    {
      SDKLogUtils.errorLog(TAG, "Exception occured", localException1);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestSetNestAttribute.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */