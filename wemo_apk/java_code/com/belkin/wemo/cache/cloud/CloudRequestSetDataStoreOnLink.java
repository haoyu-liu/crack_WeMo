package com.belkin.wemo.cache.cloud;

import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.callback.SetAndGetActionCallBack;
import java.util.Map;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

public class CloudRequestSetDataStoreOnLink
  implements CloudRequestInterface
{
  private static final String KEY_ERROR_CODE = "errorCode";
  private static final String KEY_PLUGIN_TAG = "plugin";
  private static final String TAG = "SetDataStoreOnLink";
  private int TIMEOUT = 30000;
  private final int TIMEOUT_LIMIT = 30000;
  private final String URL = CloudConstants.CLOUD_URL + "/apis/http/plugin/message/";
  private SetAndGetActionCallBack callback = null;
  private String emergencyContacts = "";
  private String mac = "";
  private String pluginID = "";
  
  public CloudRequestSetDataStoreOnLink(SetAndGetActionCallBack paramSetAndGetActionCallBack, String paramString1, String paramString2, String paramString3, String paramString4)
  {
    this.pluginID = paramString2;
    this.mac = paramString3;
    this.callback = paramSetAndGetActionCallBack;
    this.emergencyContacts = paramString4;
  }
  
  private String buildXMLRequest()
  {
    return "<plugins> \n<plugin> \n<recipientId>" + this.pluginID + "</recipientId> \n" + "<macAddress>" + this.mac + "</macAddress> \n" + "<content><![CDATA[<pluginId>" + this.pluginID + "</pluginId> \n" + "<macAddress>" + this.mac + "</macAddress> \n" + "<status></status> \n" + "<dataStores action=\"SetDataStores\">\n" + "<dataStore> \n" + "<name>EmergencyContacts</name> \n" + "<value>" + this.emergencyContacts + "</value> \n" + "</dataStore> \n" + "</dataStores>]]></content> \n" + "</plugin> \n" + "</plugins> \n";
  }
  
  private boolean parseResponse(String paramString)
  {
    try
    {
      XMLParser localXMLParser = new XMLParser();
      boolean bool1 = localXMLParser.getValue((Element)localXMLParser.getDomElement(paramString).getElementsByTagName("plugin").item(0), "errorCode").equals("0");
      boolean bool2 = false;
      if (bool1) {
        bool2 = true;
      }
      return bool2;
    }
    catch (Exception localException)
    {
      SDKLogUtils.errorLog("SetDataStoreOnLink", "Exception in parsing the response:", localException);
    }
    return false;
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
    SDKLogUtils.infoLog("SetDataStoreOnLink", "requestComplete status: " + paramBoolean);
    if (paramBoolean) {
      try
      {
        String str = new String(paramArrayOfByte, "UTF-8");
        SDKLogUtils.infoLog("SetDataStoreOnLink", " :: response is:: " + str);
        if (parseResponse(str))
        {
          this.callback.onSuccess("Success in setting the emergency contacts");
          return;
        }
        this.callback.onError();
        return;
      }
      catch (Exception localException)
      {
        SDKLogUtils.errorLog("SetDataStoreOnLink", "Exception occured in Cloud request for Sensor Event History", localException);
        this.callback.onError();
        return;
      }
    }
    this.callback.onError();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestSetDataStoreOnLink.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */