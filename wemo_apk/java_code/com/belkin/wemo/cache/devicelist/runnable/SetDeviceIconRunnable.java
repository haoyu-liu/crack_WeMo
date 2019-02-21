package com.belkin.wemo.cache.devicelist.runnable;

import android.content.Context;
import android.text.TextUtils;
import com.belkin.wemo.cache.CacheManager;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.data.DevicesArray;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.cache.utils.UploadFileUtil;
import com.belkin.wemo.runnable.WeMoRunnable;

public class SetDeviceIconRunnable
  extends WeMoRunnable
{
  private Context context;
  private DeviceListManager devListManager;
  private String iconLocation;
  private String udn;
  private String url;
  
  public SetDeviceIconRunnable(Context paramContext, String paramString1, String paramString2, String paramString3)
  {
    this.devListManager = DeviceListManager.getInstance(paramContext);
    this.context = paramContext;
    this.udn = paramString1;
    this.url = paramString2;
    this.iconLocation = paramString3;
  }
  
  public void run()
  {
    try
    {
      DeviceInformation localDeviceInformation = DevicesArray.getInstance(this.context).getDeviceInformation(this.udn);
      if (localDeviceInformation != null)
      {
        UploadFileUtil.uploadFileToDevice(this.url, UploadFileUtil.readFile(this.iconLocation), 15000);
        String str = localDeviceInformation.getIconVersion();
        boolean bool1 = TextUtils.isEmpty(str);
        bool2 = false;
        if (!bool1)
        {
          localDeviceInformation.setIconVersion(String.valueOf(1 + Integer.valueOf(str).intValue()));
          localDeviceInformation.setIcon(this.iconLocation);
          DevicesArray.getInstance(this.context).addOrUpdateDeviceInformation(localDeviceInformation);
          CacheManager.getInstance(this.context).updateDB(localDeviceInformation, false, false, true);
        }
      }
      for (boolean bool2 = true;; bool2 = false)
      {
        this.devListManager.sendNotification("update", String.valueOf(bool2), this.udn);
        return;
        SDKLogUtils.errorLog(this.TAG, "SetDeviceIconRunnable: FAILED to change state as DeviceInfo Object is NULL.");
      }
      return;
    }
    catch (NumberFormatException localNumberFormatException)
    {
      SDKLogUtils.errorLog(this.TAG, "SetDeviceIconRunnable: Number format exception.");
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/devicelist/runnable/SetDeviceIconRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */