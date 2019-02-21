package com.belkin.wemo.cache.cloud;

import android.content.Context;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.io.UnsupportedEncodingException;
import java.util.Map;

public class CloudRequestUpdateWeeklyCalendar
  implements CloudRequestInterface
{
  private final String TAG = "SDK_CloudRequestUpdateWeeklyCalendar";
  private int TIMEOUT = 30000;
  private final int TIMEOUT_LIMIT = 45000;
  private final String URL = CloudConstants.CLOUD_URL + "/apis/http/plugin/message/";
  Context mContext;
  private String mac;
  private String pluginID;
  
  public CloudRequestUpdateWeeklyCalendar(Context paramContext, String paramString1, String paramString2)
  {
    this.pluginID = paramString2;
    this.mac = paramString1;
    this.mContext = paramContext;
  }
  
  public Map<String, String> getAdditionalHeaders()
  {
    return null;
  }
  
  public String getBody()
  {
    return "<plugins>                                       \n<plugin>                                        \n    <recipientid>" + this.pluginID + "</recipientid>                    \n" + "    <macAddress>" + this.mac + "</macAddress>                       \n" + "    <content>                                  \n" + "        <![CDATA[ <updateweeklycalendar>\n" + "                          <mon></mon>       \n" + "                          <tues></tues>         \n" + "                          <wed></wed>                    \n" + "                          <thurs></thurs>                 \n" + "                          <fri></fri>                      \n" + "                          <sat></sat>                       \n" + "                          <sun></sun>                       \n" + "                  </updateweeklycalendar> ]]>            \n" + "    </content>    \n" + "</plugin>         \n" + "</plugins>";
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
    SDKLogUtils.infoLog("SDK_CloudRequestUpdateWeeklyCalendar", "success: " + paramBoolean);
    if (paramBoolean) {}
    try
    {
      String str = new String(paramArrayOfByte, "UTF-8");
      SDKLogUtils.infoLog("SDK_CloudRequestUpdateWeeklyCalendar", "response:::" + str);
      return;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      localUnsupportedEncodingException.printStackTrace();
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestUpdateWeeklyCalendar.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */