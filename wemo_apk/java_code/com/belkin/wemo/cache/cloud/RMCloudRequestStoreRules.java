package com.belkin.wemo.cache.cloud;

import com.belkin.wemo.cache.cloud.listener.OnRequestCompleteListener;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class RMCloudRequestStoreRules
  implements CloudRequestInterface
{
  private final String TAG = RMCloudRequestStoreRules.class.getSimpleName();
  private int TIMEOUT = 30000;
  private final int TIMEOUT_LIMIT = 45000;
  private final String URL = CloudConstants.CLOUD_URL + "/apis/http/plugin/message/";
  private String base64EncodedDbZip;
  private int dbVersion;
  private OnRequestCompleteListener onRequestCompleteListener;
  private List<PluginStoreRulesData> pluginStoreRulesDataList;
  
  public RMCloudRequestStoreRules(List<PluginStoreRulesData> paramList, OnRequestCompleteListener paramOnRequestCompleteListener, String paramString, int paramInt)
  {
    this.pluginStoreRulesDataList = paramList;
    this.onRequestCompleteListener = paramOnRequestCompleteListener;
    this.base64EncodedDbZip = paramString;
    this.dbVersion = paramInt;
  }
  
  private String getPluginStoreRulesString(PluginStoreRulesData paramPluginStoreRulesData)
  {
    return "<plugin><recipientId /><macAddress>" + paramPluginStoreRulesData.getMac() + "</macAddress>" + "<content>" + "<![CDATA[<ruleDbData action=\"StoreRules\">" + "<plugin>" + "<pluginId>" + paramPluginStoreRulesData.getPluginId() + "</pluginId>" + "<macAddress>" + paramPluginStoreRulesData.getMac() + "</macAddress>" + "<processDb>" + paramPluginStoreRulesData.getProcessDB() + "</processDb>" + "<ruleDbVersion>" + this.dbVersion + "</ruleDbVersion>" + "<ruleDbBody>#sharedContent</ruleDbBody></plugin>" + "</ruleDbData>]]>" + "</content>" + "</plugin>";
  }
  
  public Map<String, String> getAdditionalHeaders()
  {
    return null;
  }
  
  public String getBody()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    Iterator localIterator = this.pluginStoreRulesDataList.iterator();
    while (localIterator.hasNext()) {
      localStringBuilder.append(getPluginStoreRulesString((PluginStoreRulesData)localIterator.next()));
    }
    String str = "<plugins>" + localStringBuilder.toString() + "<sharedContent>" + this.base64EncodedDbZip + "</sharedContent></plugins>";
    SDKLogUtils.debugLog(this.TAG, "Store Rules: Remote: BODY: " + str);
    return str;
  }
  
  public byte[] getFileByteArray()
  {
    return getBody().getBytes();
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
    SDKLogUtils.infoLog(this.TAG, "URL: " + this.URL);
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
    SDKLogUtils.infoLog(this.TAG, "success: " + paramBoolean);
    if (this.onRequestCompleteListener != null) {
      this.onRequestCompleteListener.onRequestComplete(paramBoolean, paramInt, paramArrayOfByte);
    }
  }
  
  public static class PluginStoreRulesData
  {
    private String mac;
    private String pluginId;
    private String processDB;
    
    public PluginStoreRulesData(String paramString1, String paramString2, String paramString3)
    {
      this.pluginId = paramString1;
      this.mac = paramString2;
      this.processDB = paramString3;
    }
    
    public String getMac()
    {
      return this.mac;
    }
    
    public String getPluginId()
    {
      return this.pluginId;
    }
    
    public String getProcessDB()
    {
      return this.processDB;
    }
    
    public void setMac(String paramString)
    {
      this.mac = paramString;
    }
    
    public void setPluginId(String paramString)
    {
      this.pluginId = paramString;
    }
    
    public void setProcessDB(String paramString)
    {
      this.processDB = paramString;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/RMCloudRequestStoreRules.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */