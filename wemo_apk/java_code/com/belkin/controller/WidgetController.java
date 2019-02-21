package com.belkin.controller;

import android.content.Context;
import android.os.Handler;
import android.text.TextUtils;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.cache.CacheManager;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.data.DevicesArray;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.devicelist.DeviceListManager.NotificationListenerDLM;
import com.belkin.wemo.cache.utils.IsDevice;
import com.belkin.wemo.cache.utils.WemoUtils;
import com.belkin.wemo.runnable.WeMoRunnable;
import com.belkin.wemo.thread.WeMoThreadPoolHandler;
import com.belkin.widgets.WidgetUtil;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentSkipListSet;
import org.json.JSONException;
import org.json.JSONObject;

public class WidgetController
  implements DeviceListManager.NotificationListenerDLM
{
  private static final Handler HANDLER = new Handler();
  private static final String TAG = WidgetController.class.getSimpleName();
  private static final long TIMEOUT = 180000L;
  private static WidgetController widgetController;
  private CacheManager cacheManager;
  private Context context;
  private DeviceListManager deviceListManager;
  private Set<String> setOfWidgetIds;
  private Set<WidgetStateChangedListener> stateChangedListeners;
  private WeMoRunnable widgetUpdateTimeoutRunnable = new WeMoRunnable()
  {
    public void run()
    {
      LogUtils.debugLog(this.TAG, "onUpdate timeout reached; stopping device list manager");
      if (!WemoUtils.isAppInForeground()) {
        WidgetController.this.pauseDeviceListManager();
      }
      if (WidgetController.this.setOfWidgetIds != null)
      {
        Iterator localIterator = WidgetController.this.setOfWidgetIds.iterator();
        while (localIterator.hasNext())
        {
          String str = (String)localIterator.next();
          if (WidgetUtil.getProviderClassForWidget(WidgetController.this.context, Integer.valueOf(str).intValue()) != null) {
            WidgetUtil.sendWidgetBroadcast(WidgetController.this.context, "automaticUpdate", Integer.valueOf(str).intValue());
          }
        }
        WidgetController.access$002(WidgetController.this, null);
        return;
      }
      LogUtils.debugLog(this.TAG, "setDeviceListManagerTimeout - setOfWidgetIds is already null");
    }
  };
  
  private WidgetController(Context paramContext)
  {
    this.context = paramContext;
    this.deviceListManager = DeviceListManager.getInstance(paramContext);
    this.deviceListManager.addNotificationListener(this);
    this.cacheManager = CacheManager.getInstance(paramContext);
    this.stateChangedListeners = new ConcurrentSkipListSet();
  }
  
  public static WidgetController getInstance(Context paramContext)
  {
    if (widgetController == null) {
      widgetController = new WidgetController(paramContext.getApplicationContext());
    }
    return widgetController;
  }
  
  public void addStateChangedListener(WidgetStateChangedListener paramWidgetStateChangedListener)
  {
    this.stateChangedListeners.add(paramWidgetStateChangedListener);
  }
  
  public void addToWidgetIdList(int[] paramArrayOfInt)
  {
    if (this.setOfWidgetIds == null) {
      this.setOfWidgetIds = new ConcurrentSkipListSet();
    }
    this.setOfWidgetIds.addAll(WidgetUtil.convertIntArrayToStringList(paramArrayOfInt));
  }
  
  public DeviceInformation getDevice(String paramString)
  {
    DeviceInformation localDeviceInformation = this.deviceListManager.getDevice(paramString);
    if (localDeviceInformation == null) {
      localDeviceInformation = this.deviceListManager.getDeviceInformationFromDBByUDN(paramString);
    }
    return localDeviceInformation;
  }
  
  public void getDevice(final String paramString, final WidgetGetDeviceCallback paramWidgetGetDeviceCallback)
  {
    WeMoThreadPoolHandler.getInstance().executeViaBackground(new WeMoRunnable()
    {
      public void run()
      {
        DeviceInformation localDeviceInformation = WidgetController.this.deviceListManager.getDeviceForWidget(paramString);
        if (localDeviceInformation == null)
        {
          paramWidgetGetDeviceCallback.onDeviceUnavailable();
          return;
        }
        if (localDeviceInformation.getInActive() != 0)
        {
          paramWidgetGetDeviceCallback.onDeviceOffline(localDeviceInformation);
          return;
        }
        paramWidgetGetDeviceCallback.onDeviceOnline(localDeviceInformation);
      }
    });
  }
  
  public DeviceInformation getDeviceFromGroup(String paramString)
  {
    List localList = DevicesArray.getInstance(this.context).getDevicesInGroup(paramString);
    if ((localList != null) && (localList.size() > 0)) {
      return getDevice((String)localList.get(0));
    }
    return null;
  }
  
  public void getDeviceFromGroup(final String paramString, final WidgetGetDeviceCallback paramWidgetGetDeviceCallback)
  {
    WeMoThreadPoolHandler.getInstance().executeViaBackground(new WeMoRunnable()
    {
      public void run()
      {
        ArrayList localArrayList = WidgetController.this.cacheManager.getDevicesForGroup(paramString);
        DeviceInformation localDeviceInformation1 = null;
        if (localArrayList != null)
        {
          int i = localArrayList.size();
          localDeviceInformation1 = null;
          if (i > 0)
          {
            localDeviceInformation1 = (DeviceInformation)localArrayList.get(0);
            Iterator localIterator = localArrayList.iterator();
            while (localIterator.hasNext())
            {
              DeviceInformation localDeviceInformation2 = (DeviceInformation)localIterator.next();
              if ((localDeviceInformation2 != null) && (TextUtils.isEmpty(localDeviceInformation2.getCapabilities()))) {
                localDeviceInformation2.setCapabilities(WidgetController.this.deviceListManager.getDeviceCapabilities(localDeviceInformation2));
              }
            }
          }
        }
        if ((localDeviceInformation1 == null) || (WidgetController.this.deviceListManager.getDeviceForWidget(localDeviceInformation1.getBridgeUDN()) == null))
        {
          if (localDeviceInformation1 != null) {
            LogUtils.errorLog(this.TAG, "Failed to retrieve bridge device with UDN: " + localDeviceInformation1.getBridgeUDN());
          }
          paramWidgetGetDeviceCallback.onDeviceUnavailable();
          return;
        }
        paramWidgetGetDeviceCallback.onDeviceOnline(localDeviceInformation1);
      }
    });
  }
  
  public List<DeviceInformation> getDeviceList()
  {
    return WidgetUtil.generateGroupedDeviceList(this.deviceListManager.getDeviceInformationListFromDB());
  }
  
  public void onNotify(String paramString1, String paramString2, final String paramString3)
  {
    String str1;
    if (this.deviceListManager != null)
    {
      LogUtils.debugLog(TAG, "onNotify() - event: " + paramString1 + "; id: " + paramString2 + "; udn: " + paramString3 + "; size of DLM's DeviceInformation list: " + this.deviceListManager.getDeviceInformationList().size());
      if (paramString1.equals("set_state"))
      {
        final boolean bool = Boolean.parseBoolean(paramString2);
        Iterator localIterator2 = this.stateChangedListeners.iterator();
        while (localIterator2.hasNext())
        {
          final WidgetStateChangedListener localWidgetStateChangedListener = (WidgetStateChangedListener)localIterator2.next();
          if (localWidgetStateChangedListener.appliesToDevice(paramString3)) {
            getDevice(paramString3, new WidgetGetDeviceCallback()
            {
              private boolean tryGroupIfUnavailable = true;
              
              public void onDeviceOffline(DeviceInformation paramAnonymousDeviceInformation)
              {
                onDeviceOnline(paramAnonymousDeviceInformation);
              }
              
              public void onDeviceOnline(DeviceInformation paramAnonymousDeviceInformation)
              {
                String str1 = WidgetController.TAG;
                Object[] arrayOfObject1 = new Object[2];
                arrayOfObject1[0] = Integer.valueOf(localWidgetStateChangedListener.getState());
                arrayOfObject1[1] = Integer.valueOf(paramAnonymousDeviceInformation.getState());
                LogUtils.debugLog(str1, String.format("SET_STATE - expected, received: %d, %d", arrayOfObject1));
                String str2 = WidgetController.TAG;
                Object[] arrayOfObject2 = new Object[1];
                arrayOfObject2[0] = paramAnonymousDeviceInformation.getBinaryState();
                LogUtils.debugLog(str2, String.format("SET_STATE - binary_state: %s", arrayOfObject2));
                localWidgetStateChangedListener.deviceStateChanged(WidgetController.this.context, paramString3, bool);
              }
              
              public void onDeviceUnavailable()
              {
                if (this.tryGroupIfUnavailable)
                {
                  this.tryGroupIfUnavailable = false;
                  WidgetController.this.getDeviceFromGroup(paramString3, this);
                  return;
                }
                String str = WidgetController.TAG;
                Object[] arrayOfObject = new Object[1];
                arrayOfObject[0] = paramString3;
                LogUtils.errorLog(str, String.format("SET_STATE - failed to get DeviceInformation for udn/groupId: %s", arrayOfObject));
              }
            });
          }
        }
      }
      if ((paramString1.equals("update")) || ((paramString1.equals("set_widget_state")) && (this.deviceListManager != null)))
      {
        DeviceInformation localDeviceInformation = getDevice(paramString3);
        if (localDeviceInformation == null) {
          break label437;
        }
        if (TextUtils.isEmpty(localDeviceInformation.getGroupID())) {}
        Set localSet;
        for (str1 = paramString3;; str1 = localDeviceInformation.getGroupID())
        {
          localSet = WidgetUtil.getWidgetIdSet(this.context, str1);
          if (localSet == null) {
            break label409;
          }
          Iterator localIterator1 = localSet.iterator();
          while (localIterator1.hasNext())
          {
            String str2 = (String)localIterator1.next();
            if (WidgetUtil.getProviderClassForWidget(this.context, Integer.valueOf(str2).intValue()) != null) {
              WidgetUtil.sendWidgetBroadcast(this.context, "automaticUpdate", Integer.valueOf(str2).intValue());
            }
          }
        }
        if (this.setOfWidgetIds == null) {
          break label399;
        }
        this.setOfWidgetIds.removeAll(localSet);
        LogUtils.debugLog(TAG, "UPDATE_DEVICE - setOfWidgetIds size: " + this.setOfWidgetIds.size());
        if (this.setOfWidgetIds.isEmpty())
        {
          LogUtils.debugLog(TAG, "UPDATE_DEVICE - setOfWidgetIds is empty; stopping device list manager");
          HANDLER.removeCallbacks(this.widgetUpdateTimeoutRunnable);
          if (!WemoUtils.isAppInForeground()) {
            pauseDeviceListManager();
          }
          this.setOfWidgetIds = null;
        }
      }
    }
    return;
    label399:
    LogUtils.debugLog(TAG, "UPDATE_DEVICE - set of widget ids that need updating doesn't exist");
    return;
    label409:
    LogUtils.debugLog(TAG, "UPDATE_DEVICE - No widget ids found for device or group with udn/groupId: " + str1);
    return;
    label437:
    LogUtils.debugLog(TAG, "UPDATE_DEVICE - No device found with udn: " + paramString3);
  }
  
  public void pauseDeviceListManager()
  {
    if (this.deviceListManager != null) {
      this.deviceListManager.onPause();
    }
  }
  
  public void removeStateChangedListener(WidgetStateChangedListener paramWidgetStateChangedListener)
  {
    this.stateChangedListeners.remove(paramWidgetStateChangedListener);
  }
  
  public void resumeDeviceListManager()
  {
    if (this.deviceListManager == null) {
      this.deviceListManager = DeviceListManager.getInstance(this.context);
    }
    this.deviceListManager.onResume(this);
  }
  
  public void setDeviceListManagerTimeout()
  {
    HANDLER.postDelayed(this.widgetUpdateTimeoutRunnable, 180000L);
  }
  
  public void setDeviceState(String paramString1, int paramInt, String paramString2, String paramString3)
  {
    JSONObject localJSONObject1 = new JSONObject();
    for (;;)
    {
      try
      {
        if (this.deviceListManager.isZigbee(paramString1))
        {
          localJSONObject1.put("onOff", paramInt);
          JSONObject localJSONObject2 = new JSONObject(paramString3);
          if ((paramInt == 1) && (localJSONObject2 != null) && (localJSONObject2.has("levelControl"))) {
            localJSONObject1.put("levelControl", localJSONObject2.getString("levelControl"));
          }
          this.deviceListManager.setDeviceState(paramString1, localJSONObject1, paramString2);
          return;
        }
        if (IsDevice.NonSmartMaker(paramString1)) {
          localJSONObject1.put("switch", paramInt);
        } else {
          localJSONObject1.put("binaryState", paramInt);
        }
      }
      catch (JSONException localJSONException)
      {
        LogUtils.errorLog(TAG, "setDeviceState - JSONException while trying build the attributes JSONObject: ", localJSONException);
        return;
      }
    }
  }
  
  public void setGroupState(String paramString1, String paramString2, int paramInt)
  {
    JSONObject localJSONObject = new JSONObject();
    try
    {
      localJSONObject.put("onOff", paramInt);
      this.deviceListManager.setGroupState(paramString1, localJSONObject, paramString2);
      return;
    }
    catch (JSONException localJSONException)
    {
      LogUtils.errorLog(TAG, "setGroupState - JSONException while trying build the attributes JSONObject: ", localJSONException);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/controller/WidgetController.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */