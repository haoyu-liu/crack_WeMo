package com.belkin.wemo.cache.cloud;

import android.content.Context;
import com.belkin.wemo.cache.CacheManager;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.data.DevicesArray;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.cache.utils.UploadFileUtil;
import java.io.UnsupportedEncodingException;
import java.util.Map;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

public class CloudRequestSetDeviceIcon
  extends AbstractMultipartCloudRequest
{
  private static final String KEY_ICON_VERSION_TAG = "iconVersion";
  private static final String KEY_PLUGIN_TAG = "plugin";
  private final String TAG = CloudRequestSetDeviceIcon.class.getSimpleName();
  private int TIMEOUT = 60000;
  private final int TIMEOUT_LIMIT = 60000;
  private final String URL = CloudConstants.CLOUD_URL + "/apis/http/plugin/ext/deviceIcon/";
  private String cloudURL;
  private Context context;
  private String iconLocation;
  private String iconVersionFromCloud;
  private String udn;
  
  public CloudRequestSetDeviceIcon(Context paramContext, String paramString1, String paramString2, String paramString3)
  {
    this.context = paramContext.getApplicationContext();
    this.udn = paramString1;
    this.iconLocation = paramString3;
    this.cloudURL = (this.URL + paramString2);
  }
  
  private boolean parseResponse(String paramString)
  {
    try
    {
      XMLParser localXMLParser = new XMLParser();
      this.iconVersionFromCloud = localXMLParser.getValue((Element)localXMLParser.getDomElement(paramString).getElementsByTagName("plugin").item(0), "iconVersion");
      return true;
    }
    catch (Exception localException)
    {
      SDKLogUtils.errorLog(this.TAG, "Exception while parsing xml response for set icon: ", localException);
    }
    return false;
  }
  
  public Map<String, String> getAdditionalHeaders()
  {
    return null;
  }
  
  public String getBody()
  {
    return "";
  }
  
  public String getContentType()
  {
    return "multipart/form-data";
  }
  
  public byte[] getFileByteArray()
  {
    return UploadFileUtil.readFile(this.iconLocation);
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
    return 60000;
  }
  
  public String getURL()
  {
    return this.cloudURL;
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
    DeviceListManager localDeviceListManager = DeviceListManager.getInstance(this.context);
    if (paramBoolean)
    {
      boolean bool;
      try
      {
        bool = parseResponse(new String(paramArrayOfByte, "UTF-8"));
        if (bool)
        {
          DeviceInformation localDeviceInformation = (DeviceInformation)localDeviceListManager.getDeviceInformationList().get(this.udn);
          if (localDeviceInformation != null)
          {
            localDeviceInformation.setIconVersion(this.iconVersionFromCloud);
            localDeviceInformation.setIcon(this.iconLocation);
            DevicesArray.getInstance(this.context).addOrUpdateDeviceInformation(localDeviceInformation);
            CacheManager.getInstance(this.context).updateDB(localDeviceInformation, false, false, true);
            if (getOnCloudRequestCompletedListener() != null) {
              getOnCloudRequestCompletedListener().onSuccess();
            }
            localDeviceListManager.sendNotification("update", String.valueOf(paramBoolean), this.udn);
            return;
          }
          if (getOnCloudRequestCompletedListener() != null) {
            getOnCloudRequestCompletedListener().onError("DeviceInformation is null for udn of " + this.udn);
          }
          localDeviceListManager.sendNotification("update", String.valueOf(paramBoolean), this.udn);
          return;
        }
      }
      catch (UnsupportedEncodingException localUnsupportedEncodingException)
      {
        SDKLogUtils.errorLog(this.TAG, "UnsupportedEncodingException while parsing cloud response: ", localUnsupportedEncodingException);
        if (getOnCloudRequestCompletedListener() != null) {
          getOnCloudRequestCompletedListener().onError(localUnsupportedEncodingException.toString());
        }
        localDeviceListManager.sendNotification("update", String.valueOf(paramBoolean), this.udn);
        return;
      }
      if (getOnCloudRequestCompletedListener() != null) {
        getOnCloudRequestCompletedListener().onError(String.valueOf(bool));
      }
      localDeviceListManager.sendNotification("update", String.valueOf(paramBoolean), this.udn);
      return;
    }
    if (getOnCloudRequestCompletedListener() != null) {
      getOnCloudRequestCompletedListener().onError(String.valueOf(paramBoolean));
    }
    localDeviceListManager.sendNotification("update", String.valueOf(paramBoolean), this.udn);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestSetDeviceIcon.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */