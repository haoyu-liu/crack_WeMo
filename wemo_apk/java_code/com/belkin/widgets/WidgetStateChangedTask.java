package com.belkin.widgets;

import android.content.Context;
import android.os.Handler;
import com.belkin.controller.WidgetController;
import com.belkin.controller.WidgetStateChangedListener;

class WidgetStateChangedTask
  implements Runnable, WidgetStateChangedListener, Comparable
{
  private Context context;
  private WidgetController controller;
  private Handler handler;
  private WidgetData widgetData;
  private int widgetId;
  
  public WidgetStateChangedTask(Context paramContext, WidgetController paramWidgetController, int paramInt, WidgetData paramWidgetData)
  {
    this.widgetId = paramInt;
    this.controller = paramWidgetController;
    this.context = paramContext.getApplicationContext();
    this.widgetData = paramWidgetData;
  }
  
  public boolean appliesToDevice(String paramString)
  {
    return this.widgetData.getId().equals(paramString);
  }
  
  public int compareTo(Object paramObject)
  {
    return this.widgetId - ((WidgetStateChangedTask)paramObject).getWidgetId();
  }
  
  public void deviceStateChanged(Context paramContext, String paramString, boolean paramBoolean)
  {
    if (paramBoolean)
    {
      run();
      if (this.handler != null) {
        this.handler.removeCallbacks(this);
      }
    }
  }
  
  public int getState()
  {
    return this.widgetData.getState();
  }
  
  public int getWidgetId()
  {
    return this.widgetId;
  }
  
  public void postDelayed(Handler paramHandler, long paramLong)
  {
    this.handler = paramHandler;
    paramHandler.removeCallbacks(this);
    paramHandler.postDelayed(this, paramLong);
  }
  
  public void run()
  {
    this.controller.removeStateChangedListener(this);
    WidgetUtil.sendWidgetBroadcast(this.context, "refreshState", this.widgetId);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/widgets/WidgetStateChangedTask.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */