package com.belkin.wemo.cache.zigbee.impl;

import android.text.TextUtils;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.devicelist.LEDStatusTracker;
import com.belkin.wemo.cache.devicelist.UpnpConstants;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.cache.zigbee.GetEndDeviceListResponse;
import com.belkin.wemo.cache.zigbee.IFetchZigBeeDevicesCallback;
import com.belkin.wemo.cache.zigbee.IZigBeeDevices;
import com.belkin.wemo.cache.zigbee.ZigBeeCapabilities;
import com.belkin.wemo.controlaction.ControlActionHandler;
import com.belkin.wemo.controlaction.callback.ControlActionErrorCallback;
import com.belkin.wemo.controlaction.callback.ControlActionSuccessCallback;
import com.belkin.wemo.error.WeMoError;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import org.cybergarage.upnp.Action;
import org.cybergarage.upnp.ControlPoint;
import org.cybergarage.upnp.Device;

public class ZigBeeDevicesWithStatusImpl
  implements IZigBeeDevices
{
  private static final String TAG = ZigBeeDevicesWithStatusImpl.class.getSimpleName();
  private String bridgeUDN;
  private DeviceListManager deviceListManager;
  
  public ZigBeeDevicesWithStatusImpl(String paramString, DeviceListManager paramDeviceListManager)
  {
    this.deviceListManager = paramDeviceListManager;
    this.bridgeUDN = paramString;
  }
  
  public void fetchZigBeeDevices(IFetchZigBeeDevicesCallback paramIFetchZigBeeDevicesCallback)
  {
    if (((this.bridgeUDN == null) || (this.bridgeUDN.isEmpty()) || (this.deviceListManager == null)) && (paramIFetchZigBeeDevicesCallback != null)) {
      paramIFetchZigBeeDevicesCallback.onZigBeeDevicesFetchError(new WeMoError(501, "ZigBee Devices could not be fetched."));
    }
    Device localDevice = this.deviceListManager.getUpnpControl().getDevice(this.bridgeUDN);
    if (localDevice != null)
    {
      SDKLogUtils.infoLog(TAG, "Discovery Zigbee: Control Point Device for Bridge. IP: " + localDevice.getIPAddress());
      Action localAction = localDevice.getAction("GetEndDevicesWithStatus");
      HashMap localHashMap = new HashMap();
      localHashMap.put(UpnpConstants.GET_END_DEVICES_WITH_STATUS_ARGS, this.bridgeUDN);
      PostActionCallback localPostActionCallback = new PostActionCallback(localDevice.getUDN(), paramIFetchZigBeeDevicesCallback);
      ControlActionHandler.newInstance().postControlAction(localAction, 15000, 4000, localPostActionCallback, localPostActionCallback, localHashMap);
    }
  }
  
  private class PostActionCallback
    implements ControlActionErrorCallback, ControlActionSuccessCallback
  {
    private IFetchZigBeeDevicesCallback callback;
    private String udn;
    
    public PostActionCallback(String paramString, IFetchZigBeeDevicesCallback paramIFetchZigBeeDevicesCallback)
    {
      this.udn = paramString;
      this.callback = paramIFetchZigBeeDevicesCallback;
    }
    
    public void onActionError(Exception paramException)
    {
      SDKLogUtils.errorLog(ZigBeeDevicesWithStatusImpl.TAG, "Discovery Zigbee: Exception while fetching ZigBee Devices: ", paramException);
      if (this.callback != null) {
        this.callback.onZigBeeDevicesFetchError(new WeMoError(501, paramException.getMessage()));
      }
    }
    
    public void onActionSuccess(String paramString)
    {
      SDKLogUtils.infoLog(ZigBeeDevicesWithStatusImpl.TAG, "Discovery Zigbee: in getZigBeeDevices response: " + paramString);
      if ((!TextUtils.isEmpty(paramString)) && (!paramString.equals("app_error")))
      {
        HashMap localHashMap = new GetEndDeviceListResponse().parseGetEndDeviceListWithStatus(paramString, ZigBeeDevicesWithStatusImpl.this.deviceListManager.getDevice(this.udn));
        Iterator localIterator = localHashMap.keySet().iterator();
        while (localIterator.hasNext())
        {
          String str = (String)localIterator.next();
          if (((DeviceInformation)localHashMap.get(str)).getDeviceIdAvailablity().equalsIgnoreCase("YES"))
          {
            ((DeviceInformation)localHashMap.get(str)).setState(Integer.valueOf(ZigBeeCapabilities.getCapabilitiesValue(((DeviceInformation)localHashMap.get(str)).getCapabilityID(), ((DeviceInformation)localHashMap.get(str)).getCapabilityvalue(), "10006")).intValue());
            ((DeviceInformation)localHashMap.get(str)).setInActive(0);
            ((DeviceInformation)localHashMap.get(str)).setIsDiscovered(true);
            ((DeviceInformation)localHashMap.get(str)).setCapabilities(ZigBeeCapabilities.capabilitiesToJSON(((DeviceInformation)localHashMap.get(str)).getCapabilityID(), ((DeviceInformation)localHashMap.get(str)).getCapabilityvalue(), DeviceListManager.capabalityProfileList));
            ((DeviceInformation)localHashMap.get(str)).setBridgeUDN(this.udn);
          }
          else
          {
            SDKLogUtils.infoLog(ZigBeeDevicesWithStatusImpl.TAG, "Discovery Zigbee: device is not available & not added to devicelist:" + ((DeviceInformation)localHashMap.get(str)).getUDN());
            ((DeviceInformation)localHashMap.get(str)).setInActive(1);
            ((DeviceInformation)localHashMap.get(str)).setIsDiscovered(false);
            LEDStatusTracker.incrementOfflineLEDCount();
          }
        }
        if (this.callback == null) {
          break label365;
        }
        this.callback.onZigBeeDevicesFetched(localHashMap);
      }
      label365:
      while (this.callback == null) {
        return;
      }
      this.callback.onZigBeeDevicesFetchError(new WeMoError(501, "ZigBee Devices could not be fetched."));
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithStatusImpl.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */