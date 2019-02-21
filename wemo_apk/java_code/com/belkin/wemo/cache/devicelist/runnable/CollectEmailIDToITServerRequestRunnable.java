package com.belkin.wemo.cache.devicelist.runnable;

import android.content.Context;
import com.belkin.wemo.cache.cloud.CloudRequestManager;
import com.belkin.wemo.cache.cloud.CloudRequestToCollectEmailIDToITServer;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.runnable.WeMoRunnable;

public class CollectEmailIDToITServerRequestRunnable
  extends WeMoRunnable
{
  private Context context;
  private String deviceType;
  private String emailAddress;
  
  public CollectEmailIDToITServerRequestRunnable(Context paramContext, String paramString1, String paramString2)
  {
    this.emailAddress = paramString1;
    this.context = paramContext;
    this.deviceType = paramString2;
  }
  
  protected String getLoggerTag()
  {
    return getClass().getSimpleName() + ":" + Thread.currentThread().getId();
  }
  
  public void run()
  {
    SDKLogUtils.infoLog(this.TAG, "Starting Collection of Email Id to IT Server -- ");
    try
    {
      CloudRequestToCollectEmailIDToITServer localCloudRequestToCollectEmailIDToITServer = new CloudRequestToCollectEmailIDToITServer(this.context, this.emailAddress, this.deviceType);
      new CloudRequestManager(this.context).makeRequest(localCloudRequestToCollectEmailIDToITServer);
      return;
    }
    catch (Exception localException)
    {
      SDKLogUtils.errorLog(this.TAG, "Exception: ", localException);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/devicelist/runnable/CollectEmailIDToITServerRequestRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */