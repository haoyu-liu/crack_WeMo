package com.belkin.wemo.cache.devicelist.runnable;

import android.text.TextUtils;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.devicelist.UpnpConstants;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.runnable.WeMoRunnable;
import java.io.File;
import java.util.concurrent.CountDownLatch;
import org.cybergarage.upnp.Action;
import org.cybergarage.upnp.ControlPoint;
import org.cybergarage.upnp.Device;
import org.json.JSONArray;
import org.json.JSONObject;

public class ResetFNIconRulesRunnable
  extends WeMoRunnable
{
  private static final String TAG = "ResetFNIconRulesRunnable";
  private JSONObject deviceInformation;
  private CountDownLatch latch;
  private DeviceListManager mDeviceListManager;
  private JSONObject stateData;
  private String udn;
  
  public ResetFNIconRulesRunnable(DeviceListManager paramDeviceListManager, CountDownLatch paramCountDownLatch, String paramString, JSONObject paramJSONObject1, JSONObject paramJSONObject2)
  {
    this.mDeviceListManager = paramDeviceListManager;
    this.latch = paramCountDownLatch;
    this.udn = paramString;
    this.deviceInformation = paramJSONObject1;
    this.stateData = paramJSONObject2;
  }
  
  public void run()
  {
    Boolean localBoolean = Boolean.valueOf(false);
    for (;;)
    {
      try
      {
        localControlPoint = this.mDeviceListManager.getUpnpControl();
        DeviceInformation localDeviceInformation = this.mDeviceListManager.getDeviceFromDBByUDN(this.udn, false, false, true);
        if (localDeviceInformation == null) {
          continue;
        }
        SDKLogUtils.infoLog("ResetFNIconRulesRunnable", "dev: " + localDeviceInformation);
        str1 = this.stateData.getString("friendlyName");
        SDKLogUtils.infoLog("ResetFNIconRulesRunnable", "Reset in local for udn: " + this.udn);
        if (!this.mDeviceListManager.isZigbee(this.udn)) {
          continue;
        }
        JSONArray localJSONArray1 = new JSONArray();
        localJSONArray1.put(this.udn);
        localJSONArray1.put(str1);
        JSONArray localJSONArray2 = this.mDeviceListManager.setLedFriendlyName(localJSONArray1);
        SDKLogUtils.infoLog("ResetFNIconRulesRunnable", "jsonStatus :" + localJSONArray2.toString());
        if ((localJSONArray2.length() != 0) && (localJSONArray2.getJSONObject(0) != null) && (localJSONArray2.getJSONObject(0).has("GetFriendlyNameResponse")) && (localJSONArray2.getJSONObject(0).getString("GetFriendlyNameResponse").equals("1")))
        {
          File localFile = new File(localDeviceInformation.getIcon());
          if (localFile.exists()) {
            localFile.delete();
          }
          localDeviceInformation.setFriendlyName(str1);
          this.mDeviceListManager.setDeviceProperties(this.udn, this.deviceInformation, this.stateData);
          localDeviceInformation.setIcon("");
          localDeviceInformation.setIconVersion("");
          this.mDeviceListManager.updateDeviceCacheInDeviceList(localDeviceInformation, Boolean.valueOf(false));
          SDKLogUtils.infoLog("ResetFNIconRulesRunnable", "successful resetFNIconRules udn:" + this.udn + ", baseReset:" + str1);
          localBoolean = Boolean.valueOf(true);
        }
        SDKLogUtils.debugLog("ResetFNIconRulesRunnable", "resetFNIconRules: After FN change during reset. IP: " + localDeviceInformation.getIP() + "; Port: " + localDeviceInformation.getPort());
        if (localBoolean.booleanValue())
        {
          localDeviceInformation.setFriendlyName(str1);
          localDeviceInformation.setIcon("");
          localDeviceInformation.setIconVersion("");
          localDeviceInformation.setIsDiscovered(true);
          localDeviceInformation.setInActive(0);
          this.mDeviceListManager.updateDeviceCache(localDeviceInformation);
        }
      }
      catch (Exception localException)
      {
        ControlPoint localControlPoint;
        String str1;
        Device localDevice;
        Action localAction1;
        String str2;
        Action localAction2;
        String str3;
        SDKLogUtils.errorLog("ResetFNIconRulesRunnable", "Exception in resetFNIconRules:", localException);
        continue;
      }
      if (this.latch != null) {
        this.latch.countDown();
      }
      return;
      localDevice = localControlPoint.getDevice(this.udn);
      localAction1 = localDevice.getAction("ReSetup");
      localAction1.setArgumentValue("Reset", "1");
      str2 = localAction1.postControlAction();
      SDKLogUtils.infoLog("ResetFNIconRulesRunnable", "clearNameIconRule response: " + str2);
      localAction2 = localDevice.getAction("ChangeFriendlyName");
      localAction2.setArgumentValue("FriendlyName", str1);
      str3 = localAction2.postControlAction();
      SDKLogUtils.debugLog("ResetFNIconRulesRunnable", "resetFNIconRules: Friendly Name set to default in FW. Response: " + str3);
      if ((!TextUtils.isEmpty(str2)) && (!str2.contains(UpnpConstants.ERROR)) && (!TextUtils.isEmpty(str3)) && (!str3.contains(UpnpConstants.ERROR)))
      {
        localBoolean = Boolean.valueOf(true);
        continue;
        SDKLogUtils.errorLog("ResetFNIconRulesRunnable", "NO device found in cache.db with UDN: " + this.udn);
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/devicelist/runnable/ResetFNIconRulesRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */