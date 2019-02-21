package com.belkin.widgets;

import android.appwidget.AppWidgetManager;
import android.appwidget.AppWidgetProviderInfo;
import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.res.AssetManager;
import android.graphics.drawable.Drawable;
import android.support.v4.content.LocalBroadcastManager;
import android.text.TextUtils;
import com.belkin.controller.WidgetController;
import com.belkin.controller.WidgetGetDeviceCallback;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.utils.IsDevice;
import com.belkin.wemo.cache.utils.SharePreferences;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class WidgetUtil
{
  private static final String TAG = WidgetUtil.class.getSimpleName();
  
  public static void addWidgetIdToMapping(Context paramContext, String paramString, int paramInt)
  {
    SharePreferences localSharePreferences = new SharePreferences(paramContext);
    Object localObject = localSharePreferences.getWidgetIdSet(paramString);
    if (localObject == null) {
      localObject = new HashSet();
    }
    ((Set)localObject).add(String.valueOf(paramInt));
    localSharePreferences.storeWidgetIdSet(paramString, (Set)localObject);
  }
  
  private static Intent buildWidgetProviderIntent(String paramString, int paramInt)
  {
    Intent localIntent = new Intent();
    localIntent.setAction(paramString);
    localIntent.putExtra("appWidgetId", paramInt);
    return localIntent;
  }
  
  private static IntentFilter buildWidgetProviderIntentFilter()
  {
    IntentFilter localIntentFilter = new IntentFilter("stateUpdating");
    localIntentFilter.addAction("refreshState");
    localIntentFilter.addAction("automaticUpdate");
    return localIntentFilter;
  }
  
  public static List<String> convertIntArrayToStringList(int[] paramArrayOfInt)
  {
    ArrayList localArrayList = new ArrayList();
    int i = paramArrayOfInt.length;
    for (int j = 0; j < i; j++) {
      localArrayList.add(String.valueOf(paramArrayOfInt[j]));
    }
    return localArrayList;
  }
  
  public static List<DeviceInformation> generateGroupedDeviceList(List<DeviceInformation> paramList)
  {
    if ((paramList != null) && (paramList.size() > 0))
    {
      HashMap localHashMap = new HashMap();
      Iterator localIterator = paramList.iterator();
      while (localIterator.hasNext())
      {
        DeviceInformation localDeviceInformation = (DeviceInformation)localIterator.next();
        if (IsDevice.Bridge(localDeviceInformation.getUDN())) {
          LogUtils.debugLog(TAG, "Discovered device ignored since it is an LED bridge: " + localDeviceInformation.toString());
        } else if (TextUtils.isEmpty(localDeviceInformation.getGroupID())) {
          localHashMap.put(localDeviceInformation.getUDN(), localDeviceInformation);
        } else {
          localHashMap.put(localDeviceInformation.getGroupID(), localDeviceInformation);
        }
      }
      paramList = new ArrayList(localHashMap.values());
    }
    return paramList;
  }
  
  public static Drawable getDefaultDeviceIcon(Context paramContext, DeviceInformation paramDeviceInformation)
  {
    String str;
    if (IsDevice.WeMoSwitch(paramDeviceInformation.getUDN())) {
      str = "www/img/new_icons/" + "WeMo_Switch_Old_@3x.png";
    }
    for (;;)
    {
      try
      {
        Drawable localDrawable = Drawable.createFromStream(paramContext.getAssets().open(str), null);
        return localDrawable;
      }
      catch (IOException localIOException)
      {
        LogUtils.errorLog(TAG, "IOException while attempting to load default icon from assets: ", localIOException);
      }
      if ((IsDevice.LightSocket(paramDeviceInformation.getUDN())) || (IsDevice.Dimmer(paramDeviceInformation.getUDN()))) {
        str = "www/img/new_icons/" + "WeMo_LightSwitch_@3x.png";
      } else if (IsDevice.Insight(paramDeviceInformation.getUDN())) {
        str = "www/img/new_icons/" + "WeMo_Insight_Switch_@3x.png";
      } else if (IsDevice.NonSmartMaker(paramDeviceInformation.getUDN())) {
        str = "www/img/new_icons/" + "WeMo_Maker_@3x.png";
      } else if (IsDevice.Crockpot(paramDeviceInformation.getUDN())) {
        str = "www/img/new_icons/" + "CrockPot_SlowCooker_@3x.png";
      } else if (IsDevice.Heater(paramDeviceInformation.getUDN())) {
        str = "www/img/new_icons/" + "HolmesBionaire_Heater_@3x.png";
      } else if (IsDevice.Humidifier(paramDeviceInformation.getUDN())) {
        str = "www/img/new_icons/" + "Holmes_Console_Humidifier_@3x.png";
      } else if (IsDevice.AirPurifier(paramDeviceInformation.getUDN())) {
        str = "www/img/new_icons/" + "HolmesBionaire_AirPurifier_@3x.png";
      } else if (IsDevice.CoffeeMaker(paramDeviceInformation.getUDN())) {
        str = "www/img/new_icons/" + "MrCoffee_Machine_@3x.png";
      } else if (IsDevice.NetCam(paramDeviceInformation.getUDN())) {
        str = "www/img/ic_netcam_HD.png";
      } else if (IsDevice.MotionSensor(paramDeviceInformation.getUDN())) {
        str = "www/img/new_icons/" + "WeMo_Motion_@3x.png";
      } else if (IsDevice.NestThermostat(paramDeviceInformation.getUDN())) {
        str = "www/img/new_icons/" + "Nest_@3x.png";
      } else {
        str = "www/img/new_icons/" + "WeMo_LightBulb_@3x.png";
      }
    }
    return null;
  }
  
  public static DeviceInformation getDeviceInformation(WidgetController paramWidgetController, WidgetData paramWidgetData)
  {
    if (paramWidgetData.isGroup()) {
      return paramWidgetController.getDeviceFromGroup(paramWidgetData.getId());
    }
    return paramWidgetController.getDevice(paramWidgetData.getId());
  }
  
  public static void getDeviceInformation(WidgetController paramWidgetController, WidgetData paramWidgetData, WidgetGetDeviceCallback paramWidgetGetDeviceCallback)
  {
    if (paramWidgetData.isGroup())
    {
      paramWidgetController.getDeviceFromGroup(paramWidgetData.getId(), paramWidgetGetDeviceCallback);
      return;
    }
    paramWidgetController.getDevice(paramWidgetData.getId(), paramWidgetGetDeviceCallback);
  }
  
  public static int getFirstSupportedDeviceIndex(List<DeviceInformation> paramList)
  {
    if ((paramList != null) && (paramList.size() > 0)) {
      for (int i = 0; i < paramList.size(); i++)
      {
        DeviceInformation localDeviceInformation = (DeviceInformation)paramList.get(i);
        if ((localDeviceInformation != null) && (supportsWidgets(localDeviceInformation))) {
          return i;
        }
      }
    }
    return -1;
  }
  
  public static String getLightLevelString(WidgetData paramWidgetData)
  {
    if ((paramWidgetData == null) || (paramWidgetData.getLightLevel() < 0)) {
      return "";
    }
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = Integer.valueOf(paramWidgetData.getLightLevel());
    return String.format("%d%%", arrayOfObject);
  }
  
  public static Class<? extends WemoWidgetProvider> getProviderClassForWidget(Context paramContext, int paramInt)
  {
    AppWidgetManager localAppWidgetManager = AppWidgetManager.getInstance(paramContext);
    if (localAppWidgetManager.getAppWidgetInfo(paramInt) != null)
    {
      String str2 = localAppWidgetManager.getAppWidgetInfo(paramInt).provider.getClassName();
      try
      {
        Class localClass = Class.forName(str2);
        return localClass;
      }
      catch (ClassNotFoundException localClassNotFoundException)
      {
        LogUtils.errorLog(TAG, "WidgetProvider class not found: " + str2);
        return WemoOneByOneWidgetProvider.class;
      }
    }
    String str1 = TAG;
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = Integer.valueOf(paramInt);
    LogUtils.errorLog(str1, String.format("getProviderClassForWidget -- WidgetProvider class cannot be found for widgetId: %d", arrayOfObject));
    return null;
  }
  
  public static WidgetData getWidgetDataFromId(Context paramContext, int paramInt)
  {
    String str = new SharePreferences(paramContext).getWidgetData(paramInt);
    if (!TextUtils.isEmpty(str))
    {
      LogUtils.debugLog(TAG, str);
      return new WidgetData(str);
    }
    return null;
  }
  
  public static Set<String> getWidgetIdSet(Context paramContext, String paramString)
  {
    return new SharePreferences(paramContext).getWidgetIdSet(paramString);
  }
  
  public static void removeWidgetData(Context paramContext, int paramInt)
  {
    new SharePreferences(paramContext).removeWidgetData(paramInt);
  }
  
  public static void removeWidgetIdMapping(Context paramContext, String paramString, int paramInt)
  {
    SharePreferences localSharePreferences = new SharePreferences(paramContext);
    Set localSet = localSharePreferences.getWidgetIdSet(paramString);
    if (localSet != null)
    {
      localSet.remove(String.valueOf(paramInt));
      if (localSet.size() == 0) {
        localSharePreferences.removeWidgetIdSet(paramString);
      }
    }
    else
    {
      return;
    }
    localSharePreferences.storeWidgetIdSet(paramString, localSet);
  }
  
  private static void sendBroadcast(Context paramContext, BroadcastReceiver paramBroadcastReceiver, Intent paramIntent, IntentFilter paramIntentFilter)
  {
    LocalBroadcastManager localLocalBroadcastManager = LocalBroadcastManager.getInstance(paramContext);
    localLocalBroadcastManager.registerReceiver(paramBroadcastReceiver, paramIntentFilter);
    localLocalBroadcastManager.sendBroadcast(paramIntent);
    localLocalBroadcastManager.unregisterReceiver(paramBroadcastReceiver);
  }
  
  public static void sendWidgetBroadcast(Context paramContext, String paramString, int paramInt)
  {
    Class localClass = getProviderClassForWidget(paramContext, paramInt);
    if (localClass != null) {
      try
      {
        sendBroadcast(paramContext, (BroadcastReceiver)localClass.newInstance(), buildWidgetProviderIntent(paramString, paramInt), buildWidgetProviderIntentFilter());
        return;
      }
      catch (InstantiationException localInstantiationException)
      {
        String str3 = TAG;
        Object[] arrayOfObject3 = new Object[3];
        arrayOfObject3[0] = paramString;
        arrayOfObject3[1] = Integer.valueOf(paramInt);
        arrayOfObject3[2] = localClass.toString();
        LogUtils.errorLog(str3, String.format("sendWidgetBroadcast -- InstantiationException when trying to instantiate BroadcastReceiver for action, widgetId, widget provider class: %s, %d, %s", arrayOfObject3));
        return;
      }
      catch (IllegalAccessException localIllegalAccessException)
      {
        String str2 = TAG;
        Object[] arrayOfObject2 = new Object[3];
        arrayOfObject2[0] = paramString;
        arrayOfObject2[1] = Integer.valueOf(paramInt);
        arrayOfObject2[2] = localClass.toString();
        LogUtils.errorLog(str2, String.format("sendWidgetBroadcast -- IllegalAccessException when trying to instantiate BroadcastReceiver for action, widgetId, widget provider class: %s, %d, %s", arrayOfObject2));
        return;
      }
    }
    String str1 = TAG;
    Object[] arrayOfObject1 = new Object[2];
    arrayOfObject1[0] = paramString;
    arrayOfObject1[1] = Integer.valueOf(paramInt);
    LogUtils.errorLog(str1, String.format("sendWidgetBroadcast -- WidgetProvider class cannot be found for action, widgetId: %s, %d", arrayOfObject1));
  }
  
  public static void setDeviceOrGroupState(WidgetController paramWidgetController, WidgetData paramWidgetData, DeviceInformation paramDeviceInformation, int paramInt)
  {
    if (paramWidgetData.isGroup())
    {
      paramWidgetController.setGroupState(paramDeviceInformation.getGroupID(), paramDeviceInformation.getBridgeUDN(), paramInt);
      return;
    }
    paramWidgetController.setDeviceState(paramWidgetData.getId(), paramInt, paramDeviceInformation.getType(), paramDeviceInformation.getCapabilities());
  }
  
  public static void storeWidgetData(Context paramContext, int paramInt, WidgetData paramWidgetData)
  {
    new SharePreferences(paramContext).storeWidgetData(paramInt, paramWidgetData.toString());
  }
  
  public static boolean supportsWidgets(DeviceInformation paramDeviceInformation)
  {
    return (IsDevice.WeMoSwitch(paramDeviceInformation.getUDN())) || (IsDevice.Insight(paramDeviceInformation.getUDN())) || (IsDevice.LightSocket(paramDeviceInformation.getUDN())) || (IsDevice.NonSmartMaker(paramDeviceInformation.getUDN())) || (IsDevice.Dimmer(paramDeviceInformation.getUDN())) || (!TextUtils.isEmpty(paramDeviceInformation.getBridgeUDN()));
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/widgets/WidgetUtil.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */