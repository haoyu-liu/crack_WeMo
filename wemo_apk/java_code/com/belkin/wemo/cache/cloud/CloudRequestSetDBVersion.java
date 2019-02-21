package com.belkin.wemo.cache.cloud;

import android.content.Context;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.cache.utils.SharePreferences;
import java.io.UnsupportedEncodingException;
import java.util.Map;

public class CloudRequestSetDBVersion
  implements CloudRequestInterface
{
  private final String TAG = "SDK_CloudRequestSetDBVersion";
  private int TIMEOUT = 30000;
  private final int TIMEOUT_LIMIT = 45000;
  private final String URL = CloudConstants.CLOUD_URL + "/apis/http/plugin/message/";
  private int dbVersion;
  Context mContext;
  SharePreferences mSharePreferences;
  private String mac;
  private String pluginID;
  
  public CloudRequestSetDBVersion(Context paramContext, String paramString1, String paramString2, int paramInt)
  {
    this.pluginID = paramString1;
    this.mac = paramString2;
    this.dbVersion = paramInt;
    this.mContext = paramContext;
    this.mSharePreferences = new SharePreferences(paramContext);
  }
  
  public Map<String, String> getAdditionalHeaders()
  {
    return null;
  }
  
  public String getBody()
  {
    return "<plugins>                                       \n<plugin>                                        \n    <recipientId>" + this.pluginID + "</recipientId>                    \n" + "    <macAddress>" + this.mac + "</macAddress>                       \n" + "    <content>                                  \n" + "        <![CDATA[ <setDbVersion>\n" + "                        <plugin>                                     \n" + "                            <pluginId>" + this.pluginID + "</pluginId>       \n" + "                            <macAddress>" + this.mac + "</macAddress>         \n" + "                            <dbVersion>" + this.dbVersion + "</dbVersion>               \n" + "                        </plugin>                    \n" + "                  </setDbVersion> ]]>            \n" + "    </content>    \n" + "</plugin>         \n" + "</plugins>";
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
    return 45000;
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
    SDKLogUtils.infoLog("SDK_CloudRequestSetDBVersion", "success: " + paramBoolean);
    if (paramBoolean) {}
    try
    {
      String str = new String(paramArrayOfByte, "UTF-8");
      SDKLogUtils.infoLog("SDK_CloudRequestSetDBVersion", "response:::" + str);
      this.mSharePreferences.setDBVersion("" + this.dbVersion);
      return;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      localUnsupportedEncodingException.printStackTrace();
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestSetDBVersion.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */