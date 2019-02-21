package com.belkin.wemo.cache.cloud;

import android.content.Context;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.BlobStorageParser;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.util.Iterator;
import java.util.Map;
import org.json.JSONObject;

public class CloudRequestGetSetBlobStorage
  implements CloudRequestInterface
{
  public static final String URL = CloudConstants.CLOUD_URL + "/apis/http/plugin/message";
  private final String TAG = "CloudRequestGetSetBlobStorage";
  private final int TIMEOUT = 6000;
  private final int TIMEOUT_LIMIT = 45000;
  private final String XML_CLOSE_TAG_ATTRIBUTELIST = "";
  private final String XML_TAG_ATTRIBUTELIST_END = "\">";
  private final String XML_TAG_ATTRIBUTELIST_START = "<attributeLists action = \"";
  private String mBlobOpType;
  private Context mContext;
  private DeviceListManager mDLM;
  private JSONObject mData;
  private String mMac;
  private String mPluginId;
  private String mUdn;
  
  public CloudRequestGetSetBlobStorage(DeviceListManager paramDeviceListManager, Context paramContext, String paramString1, String paramString2, String paramString3, String paramString4, JSONObject paramJSONObject)
  {
    this.mDLM = paramDeviceListManager;
    this.mContext = paramContext;
    this.mUdn = paramString1;
    this.mPluginId = paramString2;
    this.mMac = paramString3;
    this.mBlobOpType = paramString4;
    this.mData = paramJSONObject;
  }
  
  public Map<String, String> getAdditionalHeaders()
  {
    return null;
  }
  
  public String getBody()
  {
    Object localObject = "";
    String str1 = "<plugins><plugin><recipientId>" + this.mPluginId + "</recipientId>" + "<macAddress>" + this.mMac + "</macAddress>";
    String str2 = "<plugin><pluginID>" + this.mPluginId + "</pluginID>" + "<macAddress>" + this.mMac + "</macAddress>";
    String str3;
    String str4;
    if (this.mBlobOpType.equals("getBlobStorage"))
    {
      str3 = "<content><![CDATA[<getBlobStorage>";
      str4 = "<attributeLists action = \"getBlobStorage\">";
    }
    for (String str5 = "</getBlobStorage>]]></content>";; str5 = "</getBlobStorage>]]></content>")
    {
      try
      {
        String str12 = "<attribute><name>FilterType</name><value>" + this.mData.getString("FilterType") + "</value>" + "</attribute>" + "" + "</plugin>";
        localObject = str12;
      }
      catch (Exception localException)
      {
        for (;;)
        {
          String str6;
          String str7;
          String str8;
          String str9;
          String str10;
          String str11;
          SDKLogUtils.errorLog("CloudRequestGetSetBlobStorage", "Exception in getBody", localException);
        }
      }
      str6 = str1 + str3;
      str7 = str6 + str2;
      str8 = str7 + str4;
      str9 = str8 + (String)localObject;
      str10 = str9 + str5;
      str11 = str10 + "</plugin></plugins>";
      SDKLogUtils.infoLog("CloudRequestGetSetBlobStorage", "Final plugin XML:" + str11);
      return str11;
      str3 = "<content><![CDATA[<setBlobStorage>";
      str4 = "<attributeLists action = \"setBlobStorage\">";
    }
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
    return 6000;
  }
  
  public int getTimeoutLimit()
  {
    return 45000;
  }
  
  public String getURL()
  {
    return URL;
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
    if (paramBoolean) {
      localObject = "";
    }
    try
    {
      str1 = new String(paramArrayOfByte, "UTF-8");
      try
      {
        localDeviceInformation = this.mDLM.getDevice(this.mUdn);
        localJSONObject1 = localDeviceInformation.getAttributeList();
        SDKLogUtils.infoLog("CloudRequestGetSetBlobStorage", "response: " + str1);
        if (!BlobStorageParser.parseSetResponse(str1)) {
          break label168;
        }
        JSONObject localJSONObject2 = BlobStorageParser.parseGetResponse(str1);
        Iterator localIterator = localJSONObject2.keys();
        while (localIterator.hasNext())
        {
          String str2 = (String)localIterator.next();
          localJSONObject1.put(str2, localJSONObject2.getJSONObject(str2));
        }
        SDKLogUtils.errorLog("CloudRequestGetSetBlobStorage", "Exception in requestComplete e:", localException1);
      }
      catch (Exception localException1)
      {
        localObject = str1;
      }
    }
    catch (Exception localException2)
    {
      for (;;)
      {
        String str1;
        DeviceInformation localDeviceInformation;
        JSONObject localJSONObject1;
        DeviceListManager localDeviceListManager4;
        DeviceListManager localDeviceListManager3;
        DeviceListManager localDeviceListManager2;
        DeviceListManager localDeviceListManager1;
        continue;
        localObject = str1;
      }
    }
    SDKLogUtils.infoLog("CloudRequestGetSetBlobStorage", "Blob storage cloud response" + (String)localObject);
    return;
    label168:
    localDeviceInformation.setAttributeList(localJSONObject1);
    this.mDLM.setDeviceInformationToDevicesArray(localDeviceInformation, false);
    if (this.mBlobOpType.equals("getBlobStorage"))
    {
      localDeviceListManager4 = this.mDLM;
      localDeviceListManager4.sendNotification("get_blob_storage", "true", this.mUdn);
    }
    else
    {
      localDeviceListManager3 = this.mDLM;
      localDeviceListManager3.sendNotification("set_blob_storage", "true", this.mUdn);
      break label318;
      if (this.mBlobOpType.equals("getBlobStorage"))
      {
        localDeviceListManager2 = this.mDLM;
        localDeviceListManager2.sendNotification("get_blob_storage", "false", this.mUdn);
        return;
      }
      localDeviceListManager1 = this.mDLM;
      localDeviceListManager1.sendNotification("set_blob_storage", "false", this.mUdn);
      return;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestGetSetBlobStorage.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */