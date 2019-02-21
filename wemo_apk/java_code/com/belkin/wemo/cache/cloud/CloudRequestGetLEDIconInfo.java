package com.belkin.wemo.cache.cloud;

import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.util.Map;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

public class CloudRequestGetLEDIconInfo
  implements CloudRequestInterface
{
  private static final String KEY_REFERENCE_ID_TAG = "referenceId";
  private static final String KEY_UPLOAD_ID_TAG = "uploadId";
  private static final String KEY_UPLOAD_TAG = "upload";
  private final String TAG = "SDK_CloudRequestGetLEDIconInfo";
  private int TIMEOUT = 60000;
  private final int TIMEOUT_LIMIT = 240000;
  private final String URL = CloudConstants.CLOUD_URL + "/apis/http/device/homeUploads/";
  private String cloudURL;
  private DeviceListManager mDevListMan;
  
  public CloudRequestGetLEDIconInfo(DeviceListManager paramDeviceListManager, String paramString)
  {
    this.mDevListMan = paramDeviceListManager;
    this.cloudURL = (this.URL + paramString);
  }
  
  private boolean parseResponse(String paramString)
  {
    XMLParser localXMLParser = new XMLParser();
    NodeList localNodeList = localXMLParser.getDomElement(paramString).getElementsByTagName("upload");
    int i = localNodeList.getLength();
    SDKLogUtils.infoLog("SDK_CloudRequestGetLEDIconInfo", "LED ICONINFO: uploadIDs count: " + i);
    for (int j = 0; j < i; j++)
    {
      Element localElement = (Element)localNodeList.item(j);
      String str1 = localXMLParser.getValue(localElement, "uploadId");
      String str2 = localXMLParser.getValue(localElement, "referenceId");
      SDKLogUtils.infoLog("SDK_CloudRequestGetLEDIconInfo", "LED ICONINFO: uploadID: " + str1 + " referenceID: " + str2);
      if ((str1 != null) && (!str1.isEmpty()) && (str2 != null) && (!str2.isEmpty())) {
        this.mDevListMan.getLEDDeviceIcon(str2, str1);
      }
    }
    return true;
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
    return 240000;
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
  
  /* Error */
  public void requestComplete(boolean paramBoolean, int paramInt, byte[] paramArrayOfByte)
  {
    // Byte code:
    //   0: iload_1
    //   1: ifeq +47 -> 48
    //   4: new 111	java/lang/String
    //   7: dup
    //   8: aload_3
    //   9: ldc -117
    //   11: invokespecial 142	java/lang/String:<init>	([BLjava/lang/String;)V
    //   14: astore 4
    //   16: ldc 57
    //   18: new 37	java/lang/StringBuilder
    //   21: dup
    //   22: invokespecial 38	java/lang/StringBuilder:<init>	()V
    //   25: ldc -112
    //   27: invokevirtual 47	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   30: aload 4
    //   32: invokevirtual 47	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   35: invokevirtual 53	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   38: invokestatic 95	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   41: aload_0
    //   42: aload 4
    //   44: invokespecial 146	com/belkin/wemo/cache/cloud/CloudRequestGetLEDIconInfo:parseResponse	(Ljava/lang/String;)Z
    //   47: pop
    //   48: return
    //   49: astore 5
    //   51: ldc 57
    //   53: ldc -108
    //   55: aload 5
    //   57: invokestatic 152	com/belkin/wemo/cache/utils/SDKLogUtils:errorLog	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V
    //   60: return
    //   61: astore 5
    //   63: goto -12 -> 51
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	66	0	this	CloudRequestGetLEDIconInfo
    //   0	66	1	paramBoolean	boolean
    //   0	66	2	paramInt	int
    //   0	66	3	paramArrayOfByte	byte[]
    //   14	29	4	str	String
    //   49	7	5	localUnsupportedEncodingException1	java.io.UnsupportedEncodingException
    //   61	1	5	localUnsupportedEncodingException2	java.io.UnsupportedEncodingException
    // Exception table:
    //   from	to	target	type
    //   4	16	49	java/io/UnsupportedEncodingException
    //   16	48	61	java/io/UnsupportedEncodingException
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestGetLEDIconInfo.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */