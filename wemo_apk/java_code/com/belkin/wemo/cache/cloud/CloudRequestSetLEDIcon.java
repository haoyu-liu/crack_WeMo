package com.belkin.wemo.cache.cloud;

import android.content.Context;
import android.net.Uri;
import com.belkin.wemo.cache.CacheManager;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.data.DevicesArray;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.cache.utils.UploadFileUtil;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Map;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

public class CloudRequestSetLEDIcon
  extends AbstractMultipartCloudRequest
{
  private static final String KEY_UPLOAD_ID_TAG = "uploadId";
  private static final String KEY_UPLOAD_TAG = "upload";
  protected final String QUERY_KEY = "?uploadType=";
  private final String TAG = CloudRequestSetLEDIcon.class.getSimpleName();
  private int TIMEOUT = 60000;
  private final int TIMEOUT_LIMIT = 60000;
  private final String URL = CloudConstants.CLOUD_URL + "/apis/http/lswf/uploads/";
  private byte[] body;
  private String cloudURL;
  protected Context context;
  protected String iconLocation;
  protected String udn;
  protected String uploadIdFromCloud;
  
  public CloudRequestSetLEDIcon(Context paramContext, String paramString1, String paramString2)
  {
    this.context = paramContext.getApplicationContext();
    this.udn = paramString1;
    this.iconLocation = paramString2;
    this.cloudURL = (this.URL + paramString1 + getURLSuffix());
    this.body = buildBody();
  }
  
  private byte[] buildBody()
  {
    ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
    DataOutputStream localDataOutputStream = new DataOutputStream(localByteArrayOutputStream);
    try
    {
      localDataOutputStream.writeBytes("--MULTIPART-FORM-DATA-BOUNDARY\r\n");
      localDataOutputStream.writeBytes("Content-Disposition: form-data; name=\"uploaded_icon\"; filename=\"" + Uri.parse(this.iconLocation).getLastPathSegment() + "\"" + "\r\n");
      localDataOutputStream.writeBytes("Content-Type: image/jpeg\r\n");
      localDataOutputStream.writeBytes("\r\n");
      ByteArrayInputStream localByteArrayInputStream = new ByteArrayInputStream(UploadFileUtil.readFile(this.iconLocation));
      int i = Math.min(localByteArrayInputStream.available(), 1048576);
      byte[] arrayOfByte = new byte[i];
      for (int j = localByteArrayInputStream.read(arrayOfByte, 0, i); j > 0; j = localByteArrayInputStream.read(arrayOfByte, 0, i))
      {
        localDataOutputStream.write(arrayOfByte, 0, i);
        i = Math.min(localByteArrayInputStream.available(), 1048576);
      }
      localDataOutputStream.writeBytes("\r\n");
      localDataOutputStream.writeBytes("--MULTIPART-FORM-DATA-BOUNDARY--\r\n");
    }
    catch (IOException localIOException)
    {
      for (;;)
      {
        localIOException.printStackTrace();
      }
    }
    return localByteArrayOutputStream.toByteArray();
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
    return "multipart/form-data; boundary=MULTIPART-FORM-DATA-BOUNDARY";
  }
  
  public byte[] getFileByteArray()
  {
    return this.body;
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
  
  protected String getURLSuffix()
  {
    return "?uploadType=WEMO_DEVICE_ICON";
  }
  
  public String getUploadFileName()
  {
    return null;
  }
  
  public boolean isAuthHeaderRequired()
  {
    return true;
  }
  
  protected boolean parseResponse(String paramString)
  {
    try
    {
      XMLParser localXMLParser = new XMLParser();
      this.uploadIdFromCloud = localXMLParser.getValue((Element)localXMLParser.getDomElement(paramString).getElementsByTagName("upload").item(0), "uploadId");
      return true;
    }
    catch (Exception localException)
    {
      SDKLogUtils.errorLog(this.TAG, "Exception while parsing xml response for set icon: ", localException);
    }
    return false;
  }
  
  public void requestComplete(boolean paramBoolean, int paramInt, byte[] paramArrayOfByte)
  {
    DeviceListManager localDeviceListManager = DeviceListManager.getInstance(this.context);
    SDKLogUtils.debugLog(this.TAG, "requestComplete with success: " + paramBoolean + " statusCode: " + paramInt + " response: " + new String(paramArrayOfByte));
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
            localDeviceInformation.setIconVersion(this.uploadIdFromCloud);
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


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */