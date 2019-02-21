package android.support.v4.media.session;

import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.content.pm.ServiceInfo;
import android.view.KeyEvent;
import java.util.List;

public class MediaButtonReceiver
  extends BroadcastReceiver
{
  public static KeyEvent handleIntent(MediaSessionCompat paramMediaSessionCompat, Intent paramIntent)
  {
    if ((paramMediaSessionCompat == null) || (paramIntent == null) || (!"android.intent.action.MEDIA_BUTTON".equals(paramIntent.getAction())) || (!paramIntent.hasExtra("android.intent.extra.KEY_EVENT"))) {
      return null;
    }
    KeyEvent localKeyEvent = (KeyEvent)paramIntent.getParcelableExtra("android.intent.extra.KEY_EVENT");
    paramMediaSessionCompat.getController().dispatchMediaButtonEvent(localKeyEvent);
    return localKeyEvent;
  }
  
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    Intent localIntent = new Intent("android.intent.action.MEDIA_BUTTON");
    localIntent.setPackage(paramContext.getPackageName());
    PackageManager localPackageManager = paramContext.getPackageManager();
    List localList = localPackageManager.queryIntentServices(localIntent, 0);
    if (localList.isEmpty())
    {
      localIntent.setAction("android.media.browse.MediaBrowserService");
      localList = localPackageManager.queryIntentServices(localIntent, 0);
    }
    if (localList.isEmpty()) {
      throw new IllegalStateException("Could not find any Service that handles android.intent.action.MEDIA_BUTTON or a media browser service implementation");
    }
    if (localList.size() != 1) {
      throw new IllegalStateException("Expected 1 Service that handles " + localIntent.getAction() + ", found " + localList.size());
    }
    ResolveInfo localResolveInfo = (ResolveInfo)localList.get(0);
    paramIntent.setComponent(new ComponentName(localResolveInfo.serviceInfo.packageName, localResolveInfo.serviceInfo.name));
    paramContext.startService(paramIntent);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/android/support/v4/media/session/MediaButtonReceiver.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */