package com.belkin.wemo.cache.devicelist.runnable;

import android.content.Context;
import com.belkin.wemo.cache.cloud.CloudRequestManager;
import com.belkin.wemo.cache.cloud.CloudRequestToCollectEmailIDsOnWemoCloud;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.cache.utils.SharePreferences;
import com.belkin.wemo.runnable.WeMoRunnable;

public class CollectEmailIDToWemoCloudRequestRunnable
  extends WeMoRunnable
{
  private Context context;
  private String deviceType;
  private String emailAddress;
  private SharePreferences mSharePreference;
  
  public CollectEmailIDToWemoCloudRequestRunnable(Context paramContext, String paramString1, String paramString2, SharePreferences paramSharePreferences)
  {
    this.emailAddress = paramString1;
    this.context = paramContext;
    this.deviceType = paramString2;
    this.mSharePreference = paramSharePreferences;
  }
  
  protected String getLoggerTag()
  {
    return getClass().getSimpleName() + ":" + Thread.currentThread().getId();
  }
  
  public void run()
  {
    SDKLogUtils.infoLog(this.TAG, "Starting Collection of Email Id to Wemo Cloud-- ");
    try
    {
      CloudRequestToCollectEmailIDsOnWemoCloud localCloudRequestToCollectEmailIDsOnWemoCloud = new CloudRequestToCollectEmailIDsOnWemoCloud(this.context, this.emailAddress, this.deviceType, this.mSharePreference);
      new CloudRequestManager(this.context).makeRequest(localCloudRequestToCollectEmailIDsOnWemoCloud);
      return;
    }
    catch (Exception localException)
    {
      SDKLogUtils.errorLog(this.TAG, "Exception: ", localException);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/devicelist/runnable/CollectEmailIDToWemoCloudRequestRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */