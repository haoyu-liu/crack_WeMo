package com.belkin.widgets;

import android.app.PendingIntent;
import android.appwidget.AppWidgetManager;
import android.content.Context;
import android.content.Intent;
import android.text.TextUtils;
import android.widget.RemoteViews;
import com.belkin.controller.WidgetController;
import com.belkin.controller.WidgetGetDeviceCallback;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.cache.data.DeviceInformation;

public class WemoOneByOneWidgetProvider
  extends WemoWidgetProvider
{
  public static final String AUTOMATIC_UPDATE = "automaticUpdate";
  public static final String REFRESH_STATE = "refreshState";
  public static final String STATE_UPDATING = "stateUpdating";
  private static final String TAG = WemoOneByOneWidgetProvider.class.getSimpleName();
  
  private void drawWidget(Context paramContext, AppWidgetManager paramAppWidgetManager, int paramInt1, String paramString, int paramInt2, WidgetData paramWidgetData)
  {
    RemoteViews localRemoteViews = generateRemoteView(paramContext, paramInt2, paramString, false, paramWidgetData);
    localRemoteViews.setOnClickPendingIntent(2131296275, generateOnClickIntent(paramContext, paramInt1));
    paramAppWidgetManager.updateAppWidget(paramInt1, localRemoteViews);
  }
  
  private void handleAutomaticUpdate(Context paramContext, WidgetController paramWidgetController, int paramInt)
  {
    WidgetData localWidgetData = WidgetUtil.getWidgetDataFromId(paramContext, paramInt);
    if (localWidgetData != null)
    {
      DeviceInformation localDeviceInformation = WidgetUtil.getDeviceInformation(paramWidgetController, localWidgetData);
      if (localDeviceInformation != null)
      {
        initializeWidgetView(paramContext, paramInt, localDeviceInformation);
        WidgetUtil.storeWidgetData(paramContext, paramInt, new WidgetData(localDeviceInformation));
        return;
      }
      LogUtils.debugLog(TAG, "handleAutomaticUpdate - unable to retrieve DeviceInformation from SDK: " + localWidgetData.getId());
      initializeUnavailableView(paramContext, paramInt, localWidgetData.getName());
      return;
    }
    LogUtils.debugLog(TAG, "handleAutomaticUpdate - unable to retrieve WidgetData from SharedPreferences: " + paramInt);
    initializeUnavailableView(paramContext, paramInt, "");
  }
  
  private void handleStateUpdating(Context paramContext, int paramInt)
  {
    WidgetData localWidgetData = WidgetUtil.getWidgetDataFromId(paramContext, paramInt);
    if (localWidgetData != null)
    {
      RemoteViews localRemoteViews = generateRemoteView(paramContext, 2130837528, localWidgetData.getName(), true, localWidgetData);
      localRemoteViews.setOnClickPendingIntent(2131296275, null);
      AppWidgetManager.getInstance(paramContext).updateAppWidget(paramInt, localRemoteViews);
      return;
    }
    LogUtils.debugLog(TAG, "handleStateUpdating - unable to retrieve WidgetData from SharedPreferences: " + paramInt);
  }
  
  private int selectStateImage(int paramInt1, int paramInt2)
  {
    if ((paramInt2 == 1) || (paramInt1 == 3) || (paramInt1 == 4)) {
      return 2130837527;
    }
    if ((paramInt1 == 1) || (paramInt1 == 8)) {
      return 2130837526;
    }
    return 2130837525;
  }
  
  private void updateDeviceState(final Context paramContext, WidgetController paramWidgetController, final int paramInt)
  {
    final WidgetData localWidgetData = WidgetUtil.getWidgetDataFromId(paramContext, paramInt);
    if (localWidgetData != null)
    {
      WidgetUtil.getDeviceInformation(paramWidgetController, localWidgetData, new WidgetGetDeviceCallback()
      {
        public void onDeviceOffline(DeviceInformation paramAnonymousDeviceInformation)
        {
          onDeviceUnavailable();
        }
        
        public void onDeviceOnline(DeviceInformation paramAnonymousDeviceInformation)
        {
          WemoOneByOneWidgetProvider.this.initializeWidgetView(paramContext, paramInt, paramAnonymousDeviceInformation);
          WidgetData localWidgetData = new WidgetData(paramAnonymousDeviceInformation);
          WidgetUtil.storeWidgetData(paramContext, paramInt, localWidgetData);
        }
        
        public void onDeviceUnavailable()
        {
          WemoOneByOneWidgetProvider.this.initializeUnavailableView(paramContext, paramInt, localWidgetData.getName());
        }
      });
      return;
    }
    initializeUnavailableView(paramContext, paramInt, "");
  }
  
  protected PendingIntent generateOnClickIntent(Context paramContext, int paramInt)
  {
    return PendingIntent.getService(paramContext, paramInt, StateUpdatingIntentService.getIntent(paramContext, paramInt), 134217728);
  }
  
  protected RemoteViews generateRemoteView(Context paramContext, int paramInt, String paramString, boolean paramBoolean, WidgetData paramWidgetData)
  {
    RemoteViews localRemoteViews = new RemoteViews(paramContext.getPackageName(), 2130903046);
    localRemoteViews.setTextViewText(2131296274, paramString);
    localRemoteViews.setImageViewResource(2131296275, paramInt);
    if (paramBoolean) {}
    for (int i = 0;; i = 8)
    {
      localRemoteViews.setViewVisibility(2131296276, i);
      return localRemoteViews;
    }
  }
  
  protected void initializeUnavailableView(Context paramContext, int paramInt, String paramString)
  {
    drawWidget(paramContext, AppWidgetManager.getInstance(paramContext), paramInt, paramString, 2130837527, null);
  }
  
  public void initializeWidgetView(Context paramContext, int paramInt, DeviceInformation paramDeviceInformation)
  {
    if (TextUtils.isEmpty(paramDeviceInformation.getGroupID())) {}
    for (String str = paramDeviceInformation.getFriendlyName();; str = paramDeviceInformation.getGroupName())
    {
      int i = selectStateImage(paramDeviceInformation.getState(), paramDeviceInformation.getInActive());
      WidgetData localWidgetData = WidgetUtil.getWidgetDataFromId(paramContext, paramInt);
      drawWidget(paramContext, AppWidgetManager.getInstance(paramContext), paramInt, str, i, localWidgetData);
      return;
    }
  }
  
  public void onDeleted(Context paramContext, int[] paramArrayOfInt)
  {
    int i = paramArrayOfInt.length;
    for (int j = 0; j < i; j++)
    {
      int k = paramArrayOfInt[j];
      WidgetData localWidgetData = WidgetUtil.getWidgetDataFromId(paramContext, k);
      if (localWidgetData != null)
      {
        WidgetUtil.removeWidgetData(paramContext, k);
        WidgetUtil.removeWidgetIdMapping(paramContext, localWidgetData.getId(), k);
      }
    }
    super.onDeleted(paramContext, paramArrayOfInt);
  }
  
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    String str;
    int i;
    if ((paramIntent != null) && (paramIntent.getAction() != null))
    {
      super.onReceive(paramContext, paramIntent);
      str = paramIntent.getAction();
      i = paramIntent.getIntExtra("appWidgetId", 0);
      LogUtils.debugLog(TAG, "Intent action: " + str + "; widget_id: " + i);
      if (i != 0)
      {
        if (!str.equals("refreshState")) {
          break label92;
        }
        updateDeviceState(paramContext, WidgetController.getInstance(paramContext), i);
      }
    }
    label92:
    do
    {
      return;
      if (str.equals("stateUpdating"))
      {
        handleStateUpdating(paramContext, i);
        return;
      }
    } while (!str.equals("automaticUpdate"));
    handleAutomaticUpdate(paramContext, WidgetController.getInstance(paramContext), i);
  }
  
  public void onUpdate(Context paramContext, AppWidgetManager paramAppWidgetManager, int[] paramArrayOfInt)
  {
    int i = paramArrayOfInt.length;
    LogUtils.debugLog(TAG, "Number of widget ids: " + i);
    WidgetController localWidgetController = WidgetController.getInstance(paramContext.getApplicationContext());
    localWidgetController.addToWidgetIdList(paramArrayOfInt);
    localWidgetController.resumeDeviceListManager();
    localWidgetController.setDeviceListManagerTimeout();
    int j = paramArrayOfInt.length;
    for (int k = 0; k < j; k++)
    {
      int m = paramArrayOfInt[k];
      WidgetData localWidgetData = WidgetUtil.getWidgetDataFromId(paramContext, m);
      if (localWidgetData != null)
      {
        int n = selectStateImage(localWidgetData.getState(), 0);
        drawWidget(paramContext, paramAppWidgetManager, m, localWidgetData.getName(), n, localWidgetData);
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/widgets/WemoOneByOneWidgetProvider.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */