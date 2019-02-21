package com.belkin.wemo.cache.zigbee.impl;

import android.text.TextUtils;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.devicelist.LEDStatusTracker;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.cache.zigbee.GetEndDeviceListResponse;
import com.belkin.wemo.cache.zigbee.IFetchZigBeeDevicesCallback;
import com.belkin.wemo.cache.zigbee.IZigBeeDevices;
import com.belkin.wemo.cache.zigbee.ZigBeeCapabilities;
import com.belkin.wemo.cache.zigbee.ZigBeeGetDeviceListStatusResponse;
import com.belkin.wemo.cache.zigbee.ZigBeeGetDeviceStatus;
import com.belkin.wemo.controlaction.ControlActionHandler;
import com.belkin.wemo.controlaction.callback.ControlActionErrorCallback;
import com.belkin.wemo.controlaction.callback.ControlActionSuccessCallback;
import com.belkin.wemo.error.WeMoError;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import org.cybergarage.upnp.Action;
import org.cybergarage.upnp.ControlPoint;
import org.cybergarage.upnp.Device;

public class ZigBeeDevicesWithoutStatusImpl
  implements IZigBeeDevices
{
  public static final String TAG = ZigBeeDevicesWithoutStatusImpl.class.getSimpleName();
  private String bridgeUDN;
  private DeviceListManager deviceListManager;
  
  public ZigBeeDevicesWithoutStatusImpl(String paramString, DeviceListManager paramDeviceListManager)
  {
    this.deviceListManager = paramDeviceListManager;
    this.bridgeUDN = paramString;
  }
  
  private void getLEDDeviceStatus(String paramString1, String paramString2, Map<String, DeviceInformation> paramMap)
  {
    ArrayList localArrayList = new ZigBeeGetDeviceStatus(this.deviceListManager).getZigBeeDevicesFromBridge(paramString1, paramString2);
    if (localArrayList.size() > 0)
    {
      Iterator localIterator = localArrayList.iterator();
      while (localIterator.hasNext())
      {
        ZigBeeGetDeviceListStatusResponse localZigBeeGetDeviceListStatusResponse = (ZigBeeGetDeviceListStatusResponse)localIterator.next();
        if (localZigBeeGetDeviceListStatusResponse != null)
        {
          DeviceInformation localDeviceInformation = (DeviceInformation)paramMap.get(localZigBeeGetDeviceListStatusResponse.getDeviceIDLED());
          SDKLogUtils.infoLog(TAG, "Discovery Zigbee: zbResp.getDeviceIDLED(): " + localZigBeeGetDeviceListStatusResponse.getDeviceIDLED());
          if (localDeviceInformation != null)
          {
            localDeviceInformation.setStatusTS(localZigBeeGetDeviceListStatusResponse.getLastEventTimeStamp());
            SDKLogUtils.infoLog(TAG, " Discovery Zigbee: LED ID: " + localDeviceInformation.getUDN() + "; isAvailable: " + localZigBeeGetDeviceListStatusResponse.isAvailable());
            localDeviceInformation.setState(Integer.valueOf(ZigBeeCapabilities.getCapabilitiesValue(localZigBeeGetDeviceListStatusResponse.getCapabilityid(), localZigBeeGetDeviceListStatusResponse.getCapabilityvalue(), "10006")).intValue());
            localDeviceInformation.setCapabilities(ZigBeeCapabilities.capabilitiesToJSON(localZigBeeGetDeviceListStatusResponse.getCapabilityid(), localZigBeeGetDeviceListStatusResponse.getCapabilityvalue(), DeviceListManager.capabalityProfileList));
            localDeviceInformation.setBridgeUDN(paramString1);
            if (localZigBeeGetDeviceListStatusResponse.isAvailable())
            {
              localDeviceInformation.setInActive(0);
              localDeviceInformation.setIsDiscovered(true);
            }
            else
            {
              SDKLogUtils.infoLog("ZigbeeScan", " Discovery Zigbee: device is not available & not added to devicelist:" + localDeviceInformation.getUDN());
              localDeviceInformation.setInActive(1);
              localDeviceInformation.setIsDiscovered(false);
              LEDStatusTracker.incrementOfflineLEDCount();
            }
          }
        }
      }
    }
  }
  
  public void fetchZigBeeDevices(IFetchZigBeeDevicesCallback paramIFetchZigBeeDevicesCallback)
  {
    if (((this.bridgeUDN == null) || (this.bridgeUDN.isEmpty()) || (this.deviceListManager == null)) && (paramIFetchZigBeeDevicesCallback != null)) {
      paramIFetchZigBeeDevicesCallback.onZigBeeDevicesFetchError(new WeMoError(501, "ZigBee Devices could not be fetched."));
    }
    Device localDevice = this.deviceListManager.getUpnpControl().getDevice(this.bridgeUDN);
    if (localDevice != null)
    {
      Action localAction = localDevice.getAction("GetEndDevices");
      HashMap localHashMap = new HashMap();
      localHashMap.put(com.belkin.wemo.cache.devicelist.UpnpConstants.GET_END_DEVICES_ARGS[0], this.bridgeUDN);
      localHashMap.put(com.belkin.wemo.cache.devicelist.UpnpConstants.GET_END_DEVICES_ARGS[1], String.valueOf(getEndList.PAIRED_LIST));
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
      SDKLogUtils.errorLog(ZigBeeDevicesWithoutStatusImpl.TAG, "Discovery Zigbee: Exception while fetching ZigBee Devices: ", paramException);
      if (this.callback != null) {
        this.callback.onZigBeeDevicesFetchError(new WeMoError(501, paramException.getMessage()));
      }
    }
    
    public void onActionSuccess(String paramString)
    {
      if ((!TextUtils.isEmpty(paramString)) && (!paramString.equals("app_error")))
      {
        SDKLogUtils.infoLog(ZigBeeDevicesWithoutStatusImpl.TAG, "Discovery Zigbee: in getZigBeeDevices response: " + paramString);
        HashMap localHashMap = new GetEndDeviceListResponse().parseGetEndDeviceList(paramString, ZigBeeDevicesWithoutStatusImpl.this.deviceListManager.getDevice(this.udn));
        StringBuilder localStringBuilder = new StringBuilder("");
        Iterator localIterator1 = localHashMap.keySet().iterator();
        while (localIterator1.hasNext()) {
          localStringBuilder = localStringBuilder.append((String)localIterator1.next()).append(",");
        }
        if (localStringBuilder.length() > 0)
        {
          localStringBuilder.deleteCharAt(-1 + localStringBuilder.length());
          SDKLogUtils.debugLog(ZigBeeDevicesWithoutStatusImpl.TAG, "Discovery Zigbee: ZB Device Count after GetEndDevice call: " + localHashMap.size());
          ZigBeeDevicesWithoutStatusImpl.this.getLEDDeviceStatus(this.udn, localStringBuilder.toString(), localHashMap);
        }
        if (this.callback == null) {
          break label316;
        }
        if (SDKLogUtils.isDebug())
        {
          SDKLogUtils.debugLog(ZigBeeDevicesWithoutStatusImpl.TAG, "Discovery Zigbee: Final Status of ALL Zigbee Devices. Count: " + localHashMap.size());
          localIterator2 = localHashMap.entrySet().iterator();
          while (localIterator2.hasNext())
          {
            localEntry = (Map.Entry)localIterator2.next();
            SDKLogUtils.debugLog(ZigBeeDevicesWithoutStatusImpl.TAG, "Discovery Zigbee: Zigbee Device Final Status: " + ((DeviceInformation)localEntry.getValue()).toString());
          }
        }
        this.callback.onZigBeeDevicesFetched(localHashMap);
      }
      label316:
      while (this.callback == null)
      {
        Iterator localIterator2;
        Map.Entry localEntry;
        return;
      }
      this.callback.onZigBeeDevicesFetchError(new WeMoError(501, "ZigBee Devices could not be fetched."));
    }
  }
  
  private static enum getEndList
  {
    static
    {
      ALL_LIST = new getEndList("ALL_LIST", 1);
      PAIRED_LIST = new getEndList("PAIRED_LIST", 2);
      UNPAIRED_LIST = new getEndList("UNPAIRED_LIST", 3);
      getEndList[] arrayOfgetEndList = new getEndList[4];
      arrayOfgetEndList[0] = SCAN_LIST;
      arrayOfgetEndList[1] = ALL_LIST;
      arrayOfgetEndList[2] = PAIRED_LIST;
      arrayOfgetEndList[3] = UNPAIRED_LIST;
      $VALUES = arrayOfgetEndList;
    }
    
    private getEndList() {}
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */