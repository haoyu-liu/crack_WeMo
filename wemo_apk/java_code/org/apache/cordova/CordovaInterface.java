package org.apache.cordova;

import android.app.Activity;
import android.content.Intent;
import java.util.concurrent.ExecutorService;

public abstract interface CordovaInterface
{
  public abstract Activity getActivity();
  
  public abstract ExecutorService getThreadPool();
  
  public abstract boolean hasPermission(String paramString);
  
  public abstract Object onMessage(String paramString, Object paramObject);
  
  public abstract void requestPermission(CordovaPlugin paramCordovaPlugin, int paramInt, String paramString);
  
  public abstract void requestPermissions(CordovaPlugin paramCordovaPlugin, int paramInt, String[] paramArrayOfString);
  
  public abstract void setActivityResultCallback(CordovaPlugin paramCordovaPlugin);
  
  public abstract void startActivityForResult(CordovaPlugin paramCordovaPlugin, Intent paramIntent, int paramInt);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/cordova/CordovaInterface.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */