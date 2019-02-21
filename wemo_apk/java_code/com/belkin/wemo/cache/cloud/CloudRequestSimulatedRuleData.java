package com.belkin.wemo.cache.cloud;

import android.content.Context;
import android.text.TextUtils;
import com.belkin.wemo.cache.cloud.listener.OnRequestCompleteListener;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import java.util.Map;

public class CloudRequestSimulatedRuleData
  implements CloudRequestInterface
{
  private int TIMEOUT = 30000;
  private final int TIMEOUT_LIMIT = 45000;
  private final String URL = CloudConstants.CLOUD_URL + "/apis/http/plugin/message/";
  private Context context;
  private OnRequestCompleteListener onRequestCompleteListener;
  private String simulatedRuleDataXML;
  private String[] udnList;
  
  public CloudRequestSimulatedRuleData(Context paramContext, String[] paramArrayOfString, OnRequestCompleteListener paramOnRequestCompleteListener)
  {
    this.udnList = paramArrayOfString;
    this.onRequestCompleteListener = paramOnRequestCompleteListener;
    this.context = paramContext;
  }
  
  private void buildSimulatedRuleDataXML()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    for (int i = 0; i < this.udnList.length; i++)
    {
      String str = this.udnList[i];
      if (!TextUtils.isEmpty(str)) {
        localStringBuilder.append("<Device><UDN>" + str + "</UDN>" + "<index>" + i + "</index></Device>");
      }
    }
    this.simulatedRuleDataXML = ("<SimulatedRuleData>" + localStringBuilder.toString() + "</SimulatedRuleData>");
  }
  
  private String getPluginTag(String paramString1, String paramString2)
  {
    return "<plugin><recipientId>" + paramString1 + "</recipientId>" + "<macAddress>" + paramString2 + "</macAddress>" + "<content>" + "<![CDATA[" + this.simulatedRuleDataXML + "]]>" + "</content>" + "</plugin>";
  }
  
  public Map<String, String> getAdditionalHeaders()
  {
    return null;
  }
  
  public String getBody()
  {
    buildSimulatedRuleDataXML();
    StringBuilder localStringBuilder = new StringBuilder();
    for (int i = 0; i < this.udnList.length; i++)
    {
      String str = this.udnList[i];
      DeviceInformation localDeviceInformation = DeviceListManager.getInstance(this.context).getDevice(str);
      if (localDeviceInformation != null) {
        localStringBuilder.append(getPluginTag(localDeviceInformation.getPluginID(), localDeviceInformation.getMAC()));
      }
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


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestSimulatedRuleData.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */