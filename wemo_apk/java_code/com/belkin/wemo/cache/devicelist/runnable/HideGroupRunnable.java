package com.belkin.wemo.cache.devicelist.runnable;

import android.content.Context;
import com.belkin.wemo.cache.CacheManager;
import com.belkin.wemo.cache.cloud.CloudRequestHideDevice;
import com.belkin.wemo.cache.cloud.CloudRequestManager;
import com.belkin.wemo.cache.data.DevicesArray;
import com.belkin.wemo.cache.devicelist.callback.HideGroupErrorCallback;
import com.belkin.wemo.cache.devicelist.callback.HideGroupSuccessCallback;
import com.belkin.wemo.cache.utils.MoreUtil;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.error.WeMoError;
import com.belkin.wemo.runnable.WeMoRunnable;
import java.util.Iterator;
import java.util.List;

public class HideGroupRunnable
  extends WeMoRunnable
{
  private Context context;
  private HideGroupErrorCallback errorCallback;
  private String groupId;
  private HideGroupSuccessCallback successCallback;
  
  public HideGroupRunnable(HideGroupSuccessCallback paramHideGroupSuccessCallback, HideGroupErrorCallback paramHideGroupErrorCallback, Context paramContext, String paramString)
  {
    this.successCallback = paramHideGroupSuccessCallback;
    this.errorCallback = paramHideGroupErrorCallback;
    this.context = paramContext;
    this.groupId = paramString;
  }
  
  public void run()
  {
    if (this.context != null)
    {
      int i = CacheManager.getInstance(this.context).deleteDevicesInGroup(this.groupId);
      List localList = DevicesArray.getInstance(this.context).deleteDevicesInGroup(this.groupId);
      if (i == localList.size())
      {
        Iterator localIterator = localList.iterator();
        while (localIterator.hasNext())
        {
          String str = (String)localIterator.next();
          new CloudRequestManager(this.context).makeRequest(new CloudRequestHideDevice(this.context, str));
        }
        if (this.successCallback != null) {
          this.successCallback.onGroupHidden(this.groupId);
        }
        if (SDKLogUtils.isDebug()) {
          new MoreUtil().copyDbToDownloadDirectory("cache.db", this.context);
        }
      }
    }
    do
    {
      return;
      SDKLogUtils.errorLog(this.TAG, "DB Delete Count != Devices Array Delete Count");
      if (this.errorCallback == null) {
        break;
      }
      this.errorCallback.onHideGroupError(new WeMoError(64636, "Group could not be deleted."));
      break;
      SDKLogUtils.errorLog(this.TAG, "Context is NULL");
    } while (this.errorCallback == null);
    this.errorCallback.onHideGroupError(new WeMoError(64636, "Group could not be deleted."));
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/devicelist/runnable/HideGroupRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */