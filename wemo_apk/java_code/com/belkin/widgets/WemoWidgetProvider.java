package com.belkin.widgets;

import android.appwidget.AppWidgetProvider;
import android.content.Context;
import com.belkin.wemo.cache.data.DeviceInformation;

public abstract class WemoWidgetProvider
  extends AppWidgetProvider
{
  public abstract void initializeWidgetView(Context paramContext, int paramInt, DeviceInformation paramDeviceInformation);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/widgets/WemoWidgetProvider.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */