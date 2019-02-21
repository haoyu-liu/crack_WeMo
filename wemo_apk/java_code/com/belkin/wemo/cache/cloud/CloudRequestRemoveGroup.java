package com.belkin.wemo.cache.cloud;

import android.content.Context;
import com.belkin.wemo.cache.CacheManager;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.data.DevicesArray;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;

public class CloudRequestRemoveGroup
  implements CloudRequestInterface
{
  private static final String KEY_STATUS = "status";
  private final String TAG = "SDK_CloudRequestRemoveGroup";
  private int TIMEOUT = 30000;
  private final int TIMEOUT_LIMIT = 4;
  private final String URL = CloudConstants.CLOUD_URL + "/apis/http/device/groups/";
  private String bridgeUDN;
  private String cloudURL = "";
  private final String endURL = "?remoteSync=true";
  private String groupId;
  private CacheManager mCacheManager;
  private DeviceListManager mDevMgr;
  private DevicesArray mDevicesArray;
  
  public CloudRequestRemoveGroup(Context paramContext, String paramString1, String paramString2)
  {
    this.mDevMgr = DeviceListManager.getInstance(paramContext);
    this.groupId = paramString2;
    this.bridgeUDN = paramString1;
    this.mCacheManager = CacheManager.getInstance(paramContext);
    this.mDevicesArray = DevicesArray.getInstance();
    CloudAuth localCloudAuth = new CloudAuth(paramContext);
    this.cloudURL = (this.URL + localCloudAuth.getHomeID());
  }
  
  public Map<String, String> getAdditionalHeaders()
  {
    return null;
  }
  
  public String getBody()
  {
    return "" + "<group>  <content>" + "<![CDATA[<DeleteGroup>" + "  <referenceId>" + this.groupId + "</referenceId>" + "</DeleteGroup>]]>" + " </content>" + "  </group>";
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
    return 4;
  }
  
  public String getURL()
  {
    return this.cloudURL + "/" + this.groupId + "?remoteSync=true";
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
    SDKLogUtils.infoLog("remove device group: ", "success: " + paramBoolean);
    if (paramBoolean)
    {
      try
      {
        SDKLogUtils.infoLog("SDK_CloudRequestRemoveGroup", new String(paramArrayOfByte, "UTF-8"));
        SDKLogUtils.infoLog("SDK_CloudRequestRemoveGroup", "Request complete: ");
        ArrayList localArrayList = this.mCacheManager.getDevicesForGroup(this.groupId);
        SDKLogUtils.infoLog("SDK_CloudRequestRemoveGroup", "removing devices:" + localArrayList.size());
        Iterator localIterator = localArrayList.iterator();
        while (localIterator.hasNext())
        {
          DeviceInformation localDeviceInformation = (DeviceInformation)localIterator.next();
          localDeviceInformation.setGroupID("");
          localDeviceInformation.setGroupName("");
          this.mDevicesArray.addOrUpdateDeviceInformation(localDeviceInformation);
          this.mCacheManager.updateDB(localDeviceInformation, false, false, true);
          SDKLogUtils.infoLog("SDK_CloudRequestRemoveGroup", "updated cache and db for :" + localDeviceInformation.getUDN());
        }
        this.mDevMgr.sendNotification("set_state", Boolean.toString(paramBoolean), this.bridgeUDN);
      }
      catch (UnsupportedEncodingException localUnsupportedEncodingException)
      {
        localUnsupportedEncodingException.printStackTrace();
        this.mDevMgr.sendNotification("set_state", Boolean.toString(paramBoolean), this.bridgeUDN);
        return;
      }
      return;
    }
    this.mDevMgr.sendNotification("set_state", Boolean.toString(paramBoolean), this.bridgeUDN);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestRemoveGroup.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */