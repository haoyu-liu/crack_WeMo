package com.belkin.wemo.cache.devicelist.runnable;

import android.content.Context;
import com.belkin.wemo.cache.CacheManager;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.data.DevicesArray;
import com.belkin.wemo.cache.devicelist.DLMGetActionResult;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.devicelist.UpnpConstants;
import com.belkin.wemo.cache.utils.GetCreateGroupResponseParser;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.runnable.WeMoRunnable;
import org.cybergarage.upnp.Action;
import org.cybergarage.upnp.ControlPoint;
import org.cybergarage.upnp.Device;
import org.cybergarage.upnp.DeviceList;
import org.json.JSONArray;
import org.json.JSONObject;

public class SetDevicePropertiesRunnable
  extends WeMoRunnable
{
  private Context context;
  private DeviceListManager devListManager;
  private JSONObject deviceInfoList = null;
  private Boolean isZigbee = Boolean.valueOf(false);
  private DeviceInformation mDeviceInfo;
  private JSONObject propertyList = null;
  private String udn;
  
  public SetDevicePropertiesRunnable(Context paramContext, String paramString, JSONObject paramJSONObject1, JSONObject paramJSONObject2)
  {
    this.devListManager = DeviceListManager.getInstance(paramContext);
    this.context = paramContext;
    this.propertyList = paramJSONObject1;
    this.deviceInfoList = paramJSONObject2;
    this.udn = paramString;
  }
  
  public void run()
  {
    Object localObject = Boolean.valueOf(false);
    this.mDeviceInfo = DevicesArray.getInstance(this.context).getDeviceInformation(this.udn);
    if ((this.mDeviceInfo != null) && (this.propertyList != null) && (this.deviceInfoList != null)) {
      if (!this.mDeviceInfo.getBridgeUDN().isEmpty()) {
        this.isZigbee = Boolean.valueOf(true);
      }
    }
    for (;;)
    {
      int i;
      try
      {
        ControlPoint localControlPoint = this.devListManager.getUpnpControl();
        str1 = this.propertyList.getString("friendlyName");
        if (!this.isZigbee.booleanValue()) {
          continue;
        }
        String str2 = "";
        if (localControlPoint != null)
        {
          i = 0;
          if (i < localControlPoint.getDeviceList().size())
          {
            if (!localControlPoint.getDeviceList().getDevice(i).getUDN().contains("Bridge")) {
              break label720;
            }
            str2 = localControlPoint.getDeviceList().getDevice(i).getUDN();
            break label720;
          }
          SDKLogUtils.debugLog(this.TAG, "bridge udn if:---" + localControlPoint.getDeviceList().size() + "--" + str2);
          SDKLogUtils.debugLog(this.TAG, "deviceInformation: " + this.mDeviceInfo);
        }
        if (str2 != null)
        {
          Action localAction = localControlPoint.getDevice(str2).getAction("SetDeviceName");
          SDKLogUtils.infoLog(this.TAG, "udn sent to setArgument: " + this.udn);
          DeviceListManager localDeviceListManager2 = this.devListManager;
          String[] arrayOfString1 = UpnpConstants.ARGS_LED_FRIENDLY_NAME;
          String[] arrayOfString2 = new String[2];
          arrayOfString2[0] = this.udn;
          arrayOfString2[1] = str1;
          localDeviceListManager2.setArgument(localAction, arrayOfString1, arrayOfString2);
          str3 = localAction.postControlAction();
          SDKLogUtils.debugLog(this.TAG, "set friendly name: " + str3);
          if (str3 == null) {
            continue;
          }
          JSONArray localJSONArray = new GetCreateGroupResponseParser().parseCreateGroupResponse(str3);
          SDKLogUtils.infoLog(this.TAG, "jsonStatus :" + localJSONArray + "jsonStatus.getJSONObject(0).getString(\"GetFriendlyNameResponse\") :" + localJSONArray.getJSONObject(0).getString("GetFriendlyNameResponse"));
          if ((localJSONArray.getJSONObject(0) != null) && (localJSONArray.getJSONObject(0).has("GetFriendlyNameResponse")) && (localJSONArray.getJSONObject(0).get("GetFriendlyNameResponse").equals("1")))
          {
            SDKLogUtils.infoLog(this.TAG, "Updating friendly name in cache for udn:" + this.udn);
            this.mDeviceInfo.setFriendlyName(str1);
            Boolean localBoolean = Boolean.valueOf(true);
            localObject = localBoolean;
          }
        }
      }
      catch (Exception localException)
      {
        String str1;
        String str3;
        DeviceListManager localDeviceListManager1;
        DLMGetActionResult localDLMGetActionResult;
        Object[] arrayOfObject;
        SDKLogUtils.errorLog(this.TAG, "Error setting friendlyName Zigbee", localException);
        continue;
      }
      if (((Boolean)localObject).booleanValue() == true)
      {
        DevicesArray.getInstance(this.context).updateDeviceCache(this.mDeviceInfo, false);
        CacheManager.getInstance(this.context).updateDB(this.mDeviceInfo, false, false, true);
      }
      localDeviceListManager1 = this.devListManager;
      localDeviceListManager1.sendNotification("set_properties", Boolean.toString(((Boolean)localObject).booleanValue()), this.mDeviceInfo.getUDN());
      return;
      SDKLogUtils.errorLog(this.TAG, "Error setting friendlyName Zigbee, response: " + str3);
      localObject = Boolean.valueOf(false);
      continue;
      localDLMGetActionResult = new DLMGetActionResult(this.devListManager);
      arrayOfObject = new Object[4];
      arrayOfObject[0] = this.udn;
      arrayOfObject[1] = "ChangeFriendlyName";
      arrayOfObject[2] = UpnpConstants.SET_FRIENDLY_NAME_ARGS_KEYS;
      arrayOfObject[3] = { str1 };
      localObject = localDLMGetActionResult.doInBackground(arrayOfObject);
      if (((Boolean)localObject).booleanValue())
      {
        this.mDeviceInfo.setFriendlyName(str1);
        continue;
        localObject = Boolean.valueOf(false);
        continue;
        label720:
        i++;
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/devicelist/runnable/SetDevicePropertiesRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */