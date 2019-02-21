package com.belkin.wemo.cache.cloud;

import com.belkin.wemo.cache.cloud.listener.OnRequestCompleteListener;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class RMCloudRequestSetDBVersion
  implements CloudRequestInterface
{
  private static final String TAG = RMCloudRequestSetDBVersion.class.getSimpleName();
  private int TIMEOUT = 30000;
  private final int TIMEOUT_LIMIT = 45000;
  private final String URL = CloudConstants.CLOUD_URL + "/apis/http/plugin/message/";
  private int dbVersion;
  private OnRequestCompleteListener onRequestCompleteListener;
  private HashMap<String, String> pluginIDToMacHashMap;
  
  public RMCloudRequestSetDBVersion(HashMap<String, String> paramHashMap, int paramInt, OnRequestCompleteListener paramOnRequestCompleteListener)
  {
    this.dbVersion = paramInt;
    this.pluginIDToMacHashMap = paramHashMap;
    this.onRequestCompleteListener = paramOnRequestCompleteListener;
  }
  
  private String getPluginTag(String paramString1, String paramString2)
  {
    return "<plugin><recipientId>" + paramString1 + "</recipientId>" + "<macAddress>" + paramString2 + "</macAddress>" + "<content>" + "<![CDATA[ <setDbVersion>" + "<plugin>" + "<pluginId>" + paramString1 + "</pluginId>" + "<macAddress>" + paramString2 + "</macAddress>" + "<dbVersion>" + this.dbVersion + "</dbVersion>" + "</plugin>" + "</setDbVersion> ]]>" + "</content>" + "</plugin>";
  }
  
  public Map<String, String> getAdditionalHeaders()
  {
    return null;
  }
  
  public String getBody()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    Iterator localIterator = this.pluginIDToMacHashMap.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      localStringBuilder.append(getPluginTag((String)localEntry.getKey(), (String)localEntry.getValue()));
    }
    return "<plugins>" + localStringBuilder.toString() + "</plugins>";
  }
  
  public byte[] getFileByteArray()
  {
    return null;
  }
  
  public OnRequestCompleteListener getOnRequestCompleteListener()
  {
    return this.onRequestCompleteListener;
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
    if (this.onRequestCompleteListener != null) {
      this.onRequestCompleteListener.onRequestComplete(paramBoolean, paramInt, paramArrayOfByte);
    }
  }
  
  public void setOnRequestCompleteListener(OnRequestCompleteListener paramOnRequestCompleteListener)
  {
    this.onRequestCompleteListener = paramOnRequestCompleteListener;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/RMCloudRequestSetDBVersion.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */