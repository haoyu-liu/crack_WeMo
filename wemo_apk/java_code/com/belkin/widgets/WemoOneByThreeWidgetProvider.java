package com.belkin.widgets;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.widget.RemoteViews;
import com.belkin.activity.MainActivity;

public class WemoOneByThreeWidgetProvider
  extends WemoOneByOneWidgetProvider
{
  protected PendingIntent generateLauncherIntent(Context paramContext)
  {
    Intent localIntent = new Intent("android.intent.action.MAIN");
    localIntent.addCategory("android.intent.category.LAUNCHER");
    localIntent.setClass(paramContext, MainActivity.class);
    localIntent.setFlags(268435456);
    return PendingIntent.getActivity(paramContext, 0, localIntent, 134217728);
  }
  
  protected RemoteViews generateRemoteView(Context paramContext, int paramInt, String paramString, boolean paramBoolean, WidgetData paramWidgetData)
  {
    RemoteViews localRemoteViews = new RemoteViews(paramContext.getPackageName(), 2130903047);
    localRemoteViews.setOnClickPendingIntent(2131296280, generateLauncherIntent(paramContext));
    localRemoteViews.setTextViewText(2131296274, paramString);
    localRemoteViews.setTextViewText(2131296278, WidgetUtil.getLightLevelString(paramWidgetData));
    localRemoteViews.setImageViewResource(2131296275, paramInt);
    if (paramBoolean) {}
    for (int i = 0;; i = 8)
    {
      localRemoteViews.setViewVisibility(2131296276, i);
      return localRemoteViews;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/widgets/WemoOneByThreeWidgetProvider.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */