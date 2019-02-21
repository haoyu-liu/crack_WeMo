package com.belkin.wemo.push.cmd;

import android.content.Context;
import com.belkin.wemo.exception.InvalidArgumentsException;
import com.belkin.wemo.push.cmd.listener.RegisterWithPushCloudListener;
import com.belkin.wemo.push.cmd.listener.RegisterWithWeMoCloudListener;
import com.belkin.wemo.push.cmd.listener.UnregisterFromPushCloudListener;
import com.belkin.wemo.push.cmd.listener.UnregisterFromWeMoCloudListener;

public abstract interface IPushNotificationHandler
{
  public abstract void registerWithPushServer(Context paramContext, RegisterWithPushCloudListener paramRegisterWithPushCloudListener)
    throws InvalidArgumentsException;
  
  public abstract void registerWithWeMoCloud(Context paramContext, String paramString, RegisterWithWeMoCloudListener paramRegisterWithWeMoCloudListener)
    throws InvalidArgumentsException;
  
  public abstract void unregisterFromPushServer(Context paramContext, UnregisterFromPushCloudListener paramUnregisterFromPushCloudListener)
    throws InvalidArgumentsException;
  
  public abstract void unregisterFromWeMoCloud(Context paramContext, String paramString, UnregisterFromWeMoCloudListener paramUnregisterFromWeMoCloudListener)
    throws InvalidArgumentsException;
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/push/cmd/IPushNotificationHandler.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */