package com.belkin.wemo.cache.cloud;

import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.BitmapFactory;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import java.io.ByteArrayOutputStream;
import java.util.Map;

public class CloudRequestGetIcon
  implements CloudRequestInterface
{
  private int TIMEOUT = 60000;
  private final int TIMEOUT_LIMIT = 240000;
  private final String URL = CloudConstants.CLOUD_URL + "/apis/http/plugin/ext/deviceIcon/";
  private String cloudURL;
  private DeviceInformation devInfo;
  private DeviceListManager mDevMgr;
  
  public CloudRequestGetIcon(DeviceListManager paramDeviceListManager, DeviceInformation paramDeviceInformation)
  {
    this.mDevMgr = paramDeviceListManager;
    this.devInfo = paramDeviceInformation;
    this.cloudURL = (this.URL + this.devInfo.getMAC());
  }
  
  public Map<String, String> getAdditionalHeaders()
  {
    return null;
  }
  
  public String getBody()
  {
    return "";
  }
  
  public byte[] getFileByteArray()
  {
    return null;
  }
  
  public int getRequestMethod()
  {
    return 2;
  }
  
  public int getTimeout()
  {
    return this.TIMEOUT;
  }
  
  public int getTimeoutLimit()
  {
    return 240000;
  }
  
  public String getURL()
  {
    return this.cloudURL;
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
    if (paramBoolean)
    {
      Bitmap localBitmap = BitmapFactory.decodeByteArray(paramArrayOfByte, 0, paramArrayOfByte.length);
      if (localBitmap != null)
      {
        ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
        localBitmap.compress(Bitmap.CompressFormat.JPEG, 100, localByteArrayOutputStream);
        if (this.mDevMgr != null) {
          this.mDevMgr.updateRemoteIconFile(this.devInfo, localBitmap, this.devInfo.getIconVersion());
        }
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestGetIcon.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */