package com.belkin.wemo.cache.cloud;

import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.callback.SetAndGetActionCallBack;
import java.util.Map;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

public class CloudRequestGetDataStoreOnLink
  implements CloudRequestInterface
{
  private static final String DATASTORE_TAG = "dataStore";
  private static final String NAME_TAG = "name";
  private static final String VALUE_TAG = "value";
  private final String TAG = "GetDataStoreOnLink";
  private int TIMEOUT = 30000;
  private final int TIMEOUT_LIMIT = 30000;
  private final String URL = CloudConstants.CLOUD_URL + "/apis/http/plugin/message/";
  private SetAndGetActionCallBack callback = null;
  private String mac = "";
  private String pluginID = "";
  
  public CloudRequestGetDataStoreOnLink(SetAndGetActionCallBack paramSetAndGetActionCallBack, String paramString1, String paramString2, String paramString3)
  {
    this.pluginID = paramString2;
    this.mac = paramString3;
    this.callback = paramSetAndGetActionCallBack;
  }
  
  private String buildXMLRequest()
  {
    return "<plugins> \n<plugin> \n<recipientId>" + this.pluginID + "</recipientId> \n" + "<macAddress>" + this.mac + "</macAddress> \n" + "<content><![CDATA[<pluginId>" + this.pluginID + "</pluginId> \n" + "<macAddress>" + this.mac + "</macAddress> \n" + "<status></status> \n" + "<dataStores action=\"GetDataStores\">\n" + "<dataStore> \n" + "<name>EmergencyContacts</name> \n" + "</dataStore> \n" + "</dataStores>]]></content> \n" + "</plugin> \n" + "</plugins> \n";
  }
  
  private String parseResponse(String paramString)
  {
    String str = "";
    XMLParser localXMLParser = new XMLParser();
    NodeList localNodeList = localXMLParser.getDomElement(paramString).getElementsByTagName("dataStore");
    if (localNodeList != null) {}
    for (int i = 0;; i++) {
      if (i < localNodeList.getLength())
      {
        Element localElement = (Element)localNodeList.item(i);
        if (localXMLParser.getValue(localElement, "name").equals("EmergencyContacts")) {
          str = localXMLParser.getValue(localElement, "value");
        }
      }
      else
      {
        SDKLogUtils.infoLog("GetDataStoreOnLink", "parseResponse:: " + str);
        return str;
      }
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
    SDKLogUtils.infoLog("GetDataStoreOnLink", "requestComplete status: " + paramBoolean);
    if (paramBoolean) {
      try
      {
        String str1 = new String(paramArrayOfByte, "UTF-8");
        SDKLogUtils.infoLog("GetDataStoreOnLink", " :: response is:: " + str1);
        String str2 = parseResponse(str1);
        this.callback.onSuccess(str2);
        return;
      }
      catch (Exception localException)
      {
        SDKLogUtils.errorLog("GetDataStoreOnLink", "Exception occured in Cloud request for Sensor Event History", localException);
        this.callback.onError();
        return;
      }
    }
    this.callback.onError();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestGetDataStoreOnLink.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */