package com.belkin.wemo.cache.cloud;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;
import android.os.Build.VERSION;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Executor;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

public class CloudRequestGetLEDGroupIcon
  implements CloudRequestInterface
{
  private static final String KEY_UPLOAD_ID_TAG = "uploadId";
  private static final String KEY_UPLOAD_TAG = "upload";
  private static final String KEY_URL_TAG = "url";
  private final String TAG = "SDK_CloudRequestGetLEDGroupIcon";
  private int TIMEOUT = 60000;
  private final int TIMEOUT_LIMIT = 240000;
  private final String URL = CloudConstants.CLOUD_URL + "/apis/http/lswf/uploads/";
  private String cloudURL;
  private DeviceListManager mDevListMan;
  private String mDeviceID;
  private List<String> udnList;
  
  public CloudRequestGetLEDGroupIcon(DeviceListManager paramDeviceListManager, List<String> paramList, String paramString1, String paramString2)
  {
    this.mDevListMan = paramDeviceListManager;
    this.cloudURL = (this.URL + paramString1);
    this.udnList = paramList;
    this.mDeviceID = paramString2;
  }
  
  private boolean parseResponse(String paramString)
  {
    for (;;)
    {
      int i;
      try
      {
        XMLParser localXMLParser = new XMLParser();
        NodeList localNodeList = localXMLParser.getDomElement(paramString).getElementsByTagName("upload");
        i = 0;
        if (i < localNodeList.getLength())
        {
          Element localElement = (Element)localNodeList.item(i);
          String str1 = localXMLParser.getValue(localElement, "uploadId");
          String str2 = localXMLParser.getValue(localElement, "url");
          SDKLogUtils.infoLog("SDK_CloudRequestGetLEDGroupIcon", "LED ICONINFO: uploadID: " + str1 + " url: " + str2 + " ;udnList: " + this.udnList.toString());
          if ((str1 == null) || (str1.isEmpty()) || (str2 == null) || (str2.isEmpty())) {
            break label271;
          }
          if (Build.VERSION.SDK_INT >= 11)
          {
            IconDownloader localIconDownloader1 = new IconDownloader(null);
            Executor localExecutor = AsyncTask.THREAD_POOL_EXECUTOR;
            Object[] arrayOfObject1 = new Object[3];
            arrayOfObject1[0] = str2;
            arrayOfObject1[1] = this.mDeviceID;
            arrayOfObject1[2] = str1;
            localIconDownloader1.executeOnExecutor(localExecutor, arrayOfObject1);
          }
          else
          {
            IconDownloader localIconDownloader2 = new IconDownloader(null);
            Object[] arrayOfObject2 = new Object[3];
            arrayOfObject2[0] = str2;
            arrayOfObject2[1] = this.mDeviceID;
            arrayOfObject2[2] = str1;
            localIconDownloader2.execute(arrayOfObject2);
          }
        }
      }
      catch (Exception localException)
      {
        SDKLogUtils.errorLog("SDK_CloudRequestGetLEDGroupIcon", "Exception while getting LED icon", localException);
        return false;
      }
      return true;
      label271:
      i++;
    }
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
    //   4: new 123	java/lang/String
    //   7: dup
    //   8: aload_3
    //   9: ldc -80
    //   11: invokespecial 179	java/lang/String:<init>	([BLjava/lang/String;)V
    //   14: astore 4
    //   16: ldc 61
    //   18: new 41	java/lang/StringBuilder
    //   21: dup
    //   22: invokespecial 42	java/lang/StringBuilder:<init>	()V
    //   25: ldc -75
    //   27: invokevirtual 51	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   30: aload 4
    //   32: invokevirtual 51	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   35: invokevirtual 57	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   38: invokestatic 121	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   41: aload_0
    //   42: aload 4
    //   44: invokespecial 183	com/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon:parseResponse	(Ljava/lang/String;)Z
    //   47: pop
    //   48: return
    //   49: astore 5
    //   51: ldc 61
    //   53: ldc -71
    //   55: aload 5
    //   57: invokestatic 157	com/belkin/wemo/cache/utils/SDKLogUtils:errorLog	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V
    //   60: return
    //   61: astore 5
    //   63: goto -12 -> 51
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	66	0	this	CloudRequestGetLEDGroupIcon
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
  
  private class IconDownloader
    extends AsyncTask<Object, Void, Void>
  {
    private IconDownloader() {}
    
    protected Void doInBackground(Object... paramVarArgs)
    {
      try
      {
        URL localURL = new URL((String)paramVarArgs[0]);
        String str1 = (String)paramVarArgs[1];
        String str2 = (String)paramVarArgs[2];
        SDKLogUtils.infoLog("SDK_CloudRequestGetLEDGroupIcon", "LED ICONINFO: ledDeviceID: " + str1);
        HttpURLConnection localHttpURLConnection = (HttpURLConnection)localURL.openConnection();
        localHttpURLConnection.setRequestMethod("GET");
        if (localURL.getHost() != null) {
          localHttpURLConnection.setRequestProperty("HOST", localURL.getHost());
        }
        Bitmap localBitmap = BitmapFactory.decodeStream(localHttpURLConnection.getInputStream());
        SDKLogUtils.infoLog("SDK_CloudRequestGetLEDGroupIcon", "LED ICONINFO: bitmap: " + localBitmap + " :ledDeviceID: " + str1 + " :udnList: " + CloudRequestGetLEDGroupIcon.this.udnList);
        CloudRequestGetLEDGroupIcon.this.mDevListMan.updateGroupLedIconFile(DeviceListManager.saveRemoteIconToStorage(localBitmap, str1, str2), str2, CloudRequestGetLEDGroupIcon.this.udnList);
      }
      catch (Exception localException)
      {
        for (;;)
        {
          SDKLogUtils.errorLog("SDK_CloudRequestGetLEDGroupIcon", "Downloading the Group logo is unsuccessful", localException);
        }
      }
      return null;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */