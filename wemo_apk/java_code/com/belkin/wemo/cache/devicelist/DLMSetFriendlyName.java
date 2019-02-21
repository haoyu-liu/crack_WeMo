package com.belkin.wemo.cache.devicelist;

import android.os.AsyncTask;
import android.text.TextUtils;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.utils.GetCreateGroupResponseParser;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import org.cybergarage.upnp.Action;
import org.cybergarage.upnp.ControlPoint;
import org.cybergarage.upnp.Device;
import org.cybergarage.upnp.DeviceList;
import org.json.JSONArray;
import org.json.JSONObject;

public class DLMSetFriendlyName
  extends AsyncTask<Object, Void, Boolean>
{
  private static final String TAG = "DLMSetFriendlyName";
  private DeviceListManager mDLM;
  private DeviceInformation mDeviceInfo;
  private String notifType = null;
  private JSONObject propertyList = null;
  
  public DLMSetFriendlyName(DeviceListManager paramDeviceListManager, String... paramVarArgs)
  {
    this.mDLM = paramDeviceListManager;
    if ((paramVarArgs != null) && (paramVarArgs.length > 0)) {
      this.notifType = paramVarArgs[0];
    }
  }
  
  protected Boolean doInBackground(Object... paramVarArgs)
  {
    Object localObject = Boolean.valueOf(false);
    String str1 = "-1";
    try
    {
      str1 = (String)paramVarArgs[0];
      this.propertyList = ((JSONObject)paramVarArgs[1]);
      localDeviceInformation = this.mDLM.getDevice(str1);
      if ((localDeviceInformation == null) || (this.propertyList == null)) {
        break label453;
      }
      localControlPoint = this.mDLM.getUpnpControl();
      str2 = this.propertyList.getString("friendlyName");
      if (!this.mDLM.isZigbee(str1)) {
        break label552;
      }
      str3 = "";
      if (localControlPoint == null) {
        break label208;
      }
      i = 0;
    }
    catch (Exception localException)
    {
      for (;;)
      {
        DeviceInformation localDeviceInformation;
        ControlPoint localControlPoint;
        String str2;
        String str3;
        int i;
        label208:
        Action localAction1;
        String str4;
        JSONArray localJSONArray;
        Boolean localBoolean1;
        label453:
        label519:
        label552:
        SDKLogUtils.errorLog("DLMSetFriendlyName", "Error setting friendlyName Zigbee" + localException);
        continue;
        i++;
      }
    }
    if (i < localControlPoint.getDeviceList().size())
    {
      if (localControlPoint.getDeviceList().getDevice(i).getUDN().contains("Bridge")) {
        str3 = localControlPoint.getDeviceList().getDevice(i).getUDN();
      }
    }
    else
    {
      SDKLogUtils.debugLog("DLMSetFriendlyName", "bridge udn if:---" + localControlPoint.getDeviceList().size() + "--" + str3);
      SDKLogUtils.debugLog("DLMSetFriendlyName", "deviceInformation: " + localDeviceInformation);
      if (str3 != null)
      {
        localAction1 = localControlPoint.getDevice(str3).getAction("SetDeviceName");
        SDKLogUtils.infoLog("DLMSetFriendlyName", "udn sent to setArgument: " + str1);
        this.mDLM.setArgument(localAction1, UpnpConstants.ARGS_LED_FRIENDLY_NAME, new String[] { str1, str2 });
        str4 = localAction1.postControlAction();
        SDKLogUtils.debugLog("DLMSetFriendlyName", "set friendly name: " + str4);
        if (str4 == null) {
          break label519;
        }
        localJSONArray = new GetCreateGroupResponseParser().parseCreateGroupResponse(str4);
        SDKLogUtils.infoLog("DLMSetFriendlyName", "jsonStatus :" + localJSONArray + "jsonStatus.getJSONObject(0).getString(\"GetFriendlyNameResponse\") :" + localJSONArray.getJSONObject(0).getString("GetFriendlyNameResponse"));
        if ((localJSONArray.getJSONObject(0) != null) && (localJSONArray.getJSONObject(0).has("GetFriendlyNameResponse")) && (localJSONArray.getJSONObject(0).get("GetFriendlyNameResponse").equals("1")))
        {
          SDKLogUtils.infoLog("DLMSetFriendlyName", "Updating friendly name in cache for udn:" + str1);
          localDeviceInformation.setFriendlyName(str2);
          localBoolean1 = Boolean.valueOf(true);
          localObject = localBoolean1;
        }
      }
      for (;;)
      {
        if (((Boolean)localObject).booleanValue() == true) {
          this.mDLM.updateDeviceCacheInDeviceList(this.mDeviceInfo, Boolean.valueOf(false));
        }
        if (!TextUtils.isEmpty(this.notifType)) {
          this.mDLM.sendNotification(this.notifType, localObject + "", str1);
        }
        return (Boolean)localObject;
        SDKLogUtils.errorLog("DLMSetFriendlyName", "Error setting friendlyName Zigbee, response: " + str4);
        localObject = Boolean.valueOf(false);
        continue;
        Action localAction2 = localControlPoint.getDevice(str1).getAction("ChangeFriendlyName");
        this.mDLM.setArgument(localAction2, UpnpConstants.SET_FRIENDLY_NAME_ARGS_KEYS, new String[] { str2 });
        String str5 = localAction2.postControlAction();
        SDKLogUtils.infoLog("DLMSetFriendlyName", "non-zigbee action response: " + str5);
        if (str5 != null)
        {
          SDKLogUtils.infoLog("DLMSetFriendlyName", "success from non-zigbee device response:" + str5);
          localDeviceInformation.setFriendlyName(str2);
          localObject = Boolean.valueOf(true);
        }
        else
        {
          SDKLogUtils.errorLog("DLMSetFriendlyName", "Error setting friendlyName non-Zigbee, response: " + str5);
          Boolean localBoolean2 = Boolean.valueOf(false);
          localObject = localBoolean2;
        }
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/devicelist/DLMSetFriendlyName.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */