package com.belkin.widgets;

import android.app.IntentService;
import android.content.Context;
import android.content.Intent;
import android.os.Handler;
import android.os.Looper;
import com.belkin.controller.WidgetController;
import com.belkin.controller.WidgetGetDeviceCallback;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.cache.data.DeviceInformation;

public class StateUpdatingIntentService
  extends IntentService
{
  private static final Handler HANDLER = new Handler(Looper.getMainLooper());
  private static final long STATE_CHANGE_TIMEOUT_MS = 5000L;
  private static final String TAG = StateUpdatingIntentService.class.getSimpleName();
  
  public StateUpdatingIntentService()
  {
    super(StateUpdatingIntentService.class.getSimpleName());
  }
  
  public static Intent getIntent(Context paramContext, int paramInt)
  {
    Intent localIntent = new Intent(paramContext, StateUpdatingIntentService.class);
    localIntent.putExtra("appWidgetId", paramInt);
    return localIntent;
  }
  
  protected void onHandleIntent(Intent paramIntent)
  {
    final int i = paramIntent.getIntExtra("appWidgetId", 0);
    LogUtils.debugLog(TAG, "onHandleIntent - widgetId: " + i);
    if (i == 0)
    {
      LogUtils.errorLog(TAG, "Invalid widget id");
      return;
    }
    WidgetUtil.sendWidgetBroadcast(this, "stateUpdating", i);
    final WidgetData localWidgetData = WidgetUtil.getWidgetDataFromId(this, i);
    if (localWidgetData != null)
    {
      final WidgetController localWidgetController = WidgetController.getInstance(this);
      WidgetUtil.getDeviceInformation(localWidgetController, localWidgetData, new WidgetGetDeviceCallback()
      {
        public void onDeviceOffline(DeviceInformation paramAnonymousDeviceInformation)
        {
          LogUtils.debugLog(StateUpdatingIntentService.TAG, "Device's inActive state: " + paramAnonymousDeviceInformation.getInActive());
          onDeviceUnavailable();
        }
        
        public void onDeviceOnline(DeviceInformation paramAnonymousDeviceInformation)
        {
          int i = paramAnonymousDeviceInformation.getState();
          String str1 = StateUpdatingIntentService.TAG;
          Object[] arrayOfObject1 = new Object[2];
          arrayOfObject1[0] = Integer.valueOf(i);
          arrayOfObject1[1] = Integer.valueOf(localWidgetData.getState());
          LogUtils.debugLog(str1, String.format("DeviceInformation, WidgetData state: %d, %d", arrayOfObject1));
          if ((i == localWidgetData.getState()) || (localWidgetData.getState() == 3))
          {
            if (i == 0) {}
            for (int j = 1;; j = 0)
            {
              localWidgetData.setState(j);
              WidgetStateChangedTask localWidgetStateChangedTask = new WidgetStateChangedTask(StateUpdatingIntentService.this, localWidgetController, i, localWidgetData);
              localWidgetController.addStateChangedListener(localWidgetStateChangedTask);
              WidgetUtil.setDeviceOrGroupState(localWidgetController, localWidgetData, paramAnonymousDeviceInformation, j);
              WidgetUtil.storeWidgetData(StateUpdatingIntentService.this, i, localWidgetData);
              localWidgetStateChangedTask.postDelayed(StateUpdatingIntentService.HANDLER, 5000L);
              return;
            }
          }
          String str2 = StateUpdatingIntentService.TAG;
          Object[] arrayOfObject2 = new Object[2];
          arrayOfObject2[0] = Integer.valueOf(i);
          arrayOfObject2[1] = Integer.valueOf(localWidgetData.getState());
          LogUtils.debugLog(str2, String.format("Widget is out of sync; DeviceInformation, WidgetData state: %d, %d", arrayOfObject2));
          localWidgetData.setState(i);
          WidgetUtil.storeWidgetData(StateUpdatingIntentService.this, i, localWidgetData);
          WidgetUtil.sendWidgetBroadcast(StateUpdatingIntentService.this, "refreshState", i);
        }
        
        public void onDeviceUnavailable()
        {
          LogUtils.debugLog(StateUpdatingIntentService.TAG, "Device is inActive or can't be retrieved");
          WidgetUtil.sendWidgetBroadcast(StateUpdatingIntentService.this, "refreshState", i);
        }
      });
      return;
    }
    LogUtils.errorLog(TAG, "No device info stored for widget: " + i);
    WidgetUtil.sendWidgetBroadcast(this, "refreshState", i);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/widgets/StateUpdatingIntentService.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */