package com.belkin.wemo.cache.cloud;

import com.belkin.wemo.cache.cloud.data.RMPluginWeeklyCalendarData;
import com.belkin.wemo.cache.cloud.listener.OnRequestCompleteListener;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class RMCloudRequestUpdateWeeklyCalendar
  implements CloudRequestInterface
{
  private final String TAG = RMCloudRequestUpdateWeeklyCalendar.class.getSimpleName();
  private int TIMEOUT = 30000;
  private final int TIMEOUT_LIMIT = 45000;
  private final String URL = CloudConstants.CLOUD_URL + "/apis/http/plugin/message/";
  private OnRequestCompleteListener onRequestCompleteListener;
  private List<RMPluginWeeklyCalendarData> pluginWeeklyCalendarDataList;
  
  public RMCloudRequestUpdateWeeklyCalendar(List<RMPluginWeeklyCalendarData> paramList, OnRequestCompleteListener paramOnRequestCompleteListener)
  {
    this.pluginWeeklyCalendarDataList = paramList;
    this.onRequestCompleteListener = paramOnRequestCompleteListener;
  }
  
  private String getPluginWeeklyCalendarString(RMPluginWeeklyCalendarData paramRMPluginWeeklyCalendarData)
  {
    return "<plugin><recipientId>" + paramRMPluginWeeklyCalendarData.getPluginId() + "</recipientId>" + "<macAddress>" + paramRMPluginWeeklyCalendarData.getMac() + "</macAddress>" + "<content>" + "<![CDATA[ <updateweeklycalendar>" + paramRMPluginWeeklyCalendarData.assembleWeeklyCalendarData() + "</updateweeklycalendar> ]]>" + "</content>" + "</plugin>";
  }
  
  public Map<String, String> getAdditionalHeaders()
  {
    return null;
  }
  
  public String getBody()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    Iterator localIterator = this.pluginWeeklyCalendarDataList.iterator();
    while (localIterator.hasNext()) {
      localStringBuilder.append(getPluginWeeklyCalendarString((RMPluginWeeklyCalendarData)localIterator.next()));
    }
    return "<plugins>" + localStringBuilder.toString() + "</plugins>";
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
    if (this.onRequestCompleteListener != null) {
      this.onRequestCompleteListener.onRequestComplete(paramBoolean, paramInt, paramArrayOfByte);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/RMCloudRequestUpdateWeeklyCalendar.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */