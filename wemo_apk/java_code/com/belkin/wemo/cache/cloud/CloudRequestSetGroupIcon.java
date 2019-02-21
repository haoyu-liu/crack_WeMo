package com.belkin.wemo.cache.cloud;

import android.content.Context;
import com.belkin.wemo.cache.data.DevicesArray;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.io.UnsupportedEncodingException;
import java.util.List;

public class CloudRequestSetGroupIcon
  extends CloudRequestSetLEDIcon
{
  private final String TAG = CloudRequestSetGroupIcon.class.getSimpleName();
  
  public CloudRequestSetGroupIcon(Context paramContext, String paramString1, String paramString2)
  {
    super(paramContext, paramString1, paramString2);
  }
  
  protected String getURLSuffix()
  {
    return "?uploadType=WEMO_GROUP_ICON";
  }
  
  public void requestComplete(boolean paramBoolean, int paramInt, byte[] paramArrayOfByte)
  {
    DeviceListManager localDeviceListManager = DeviceListManager.getInstance(this.context);
    SDKLogUtils.debugLog(this.TAG, "requestComplete with success: " + paramBoolean + " statusCode: " + paramInt + " response: " + new String(paramArrayOfByte));
    if (paramBoolean) {
      try
      {
        boolean bool = parseResponse(new String(paramArrayOfByte, "UTF-8"));
        if (bool)
        {
          List localList = DevicesArray.getInstance(this.context).getDevicesInGroup(this.udn);
          localDeviceListManager.updateGroupLedIconFile(this.iconLocation, this.uploadIdFromCloud, localList);
          if (getOnCloudRequestCompletedListener() != null) {
            getOnCloudRequestCompletedListener().onSuccess();
          }
          localDeviceListManager.sendNotification("update", String.valueOf(paramBoolean), this.udn);
          return;
        }
        if (getOnCloudRequestCompletedListener() != null) {
          getOnCloudRequestCompletedListener().onError(String.valueOf(bool));
        }
        localDeviceListManager.sendNotification("update", String.valueOf(paramBoolean), this.udn);
        return;
      }
      catch (UnsupportedEncodingException localUnsupportedEncodingException)
      {
        SDKLogUtils.errorLog(this.TAG, "UnsupportedEncodingException while parsing cloud response: ", localUnsupportedEncodingException);
        if (getOnCloudRequestCompletedListener() != null) {
          getOnCloudRequestCompletedListener().onError(localUnsupportedEncodingException.toString());
        }
        localDeviceListManager.sendNotification("update", String.valueOf(paramBoolean), this.udn);
        return;
      }
    }
    if (getOnCloudRequestCompletedListener() != null) {
      getOnCloudRequestCompletedListener().onError(String.valueOf(paramBoolean));
    }
    localDeviceListManager.sendNotification("update", String.valueOf(paramBoolean), this.udn);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestSetGroupIcon.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */