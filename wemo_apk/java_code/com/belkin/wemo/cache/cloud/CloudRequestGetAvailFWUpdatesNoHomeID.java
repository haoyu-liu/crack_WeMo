package com.belkin.wemo.cache.cloud;

import android.content.Context;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import org.json.JSONArray;

public class CloudRequestGetAvailFWUpdatesNoHomeID
  extends CloudRequestGetAvailableFWUpdates
{
  public CloudRequestGetAvailFWUpdatesNoHomeID(Context paramContext, JSONArray paramJSONArray)
  {
    super(paramContext, paramJSONArray, null);
  }
  
  public String getURL()
  {
    return this.URL;
  }
  
  public boolean isAuthHeaderRequired()
  {
    return false;
  }
  
  protected void onRequestFailed()
  {
    this.mDevMgr.sendNotification("available_fw_updates", "false", "");
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestGetAvailFWUpdatesNoHomeID.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */