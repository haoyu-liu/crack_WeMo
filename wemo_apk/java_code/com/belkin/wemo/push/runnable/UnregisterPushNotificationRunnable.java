package com.belkin.wemo.push.runnable;

import android.content.Context;
import com.belkin.wemo.exception.InvalidArgumentsException;
import com.belkin.wemo.push.callback.PushNotificationErrorCallback;
import com.belkin.wemo.push.callback.UnregisterPushSuccessCallback;
import com.belkin.wemo.push.cloud.WeMoCloudPushMessagingUtility;
import com.belkin.wemo.push.cmd.IPushNotificationHandler;
import com.belkin.wemo.push.cmd.impl.PushNotificationCmdFactory;
import com.belkin.wemo.push.cmd.listener.UnregisterFromPushCloudListener;
import com.belkin.wemo.push.cmd.listener.UnregisterFromWeMoCloudListener;
import com.belkin.wemo.push.error.PushNotificationError;
import java.util.concurrent.CountDownLatch;

public class UnregisterPushNotificationRunnable
  extends AbstractPushNotificationRunnable
{
  private String registrationId;
  private UnregisterPushSuccessCallback successCallback;
  
  public UnregisterPushNotificationRunnable(UnregisterPushSuccessCallback paramUnregisterPushSuccessCallback, PushNotificationErrorCallback paramPushNotificationErrorCallback, Context paramContext)
  {
    super(paramPushNotificationErrorCallback, paramContext);
    this.successCallback = paramUnregisterPushSuccessCallback;
  }
  
  protected void syncWithPushCloud()
    throws InvalidArgumentsException
  {
    PushNotificationCmdFactory.instance().unregisterFromPushServer(this.context, new UnregisterFromPushCloudCallback(null));
  }
  
  protected void syncWithWeMoCloud()
    throws InvalidArgumentsException
  {
    WeMoCloudPushMessagingUtility.unregisterAppFromWeMoCloudForPush(this.context, this.registrationId, new UnregisterOnWeMoCloudCallback(null));
  }
  
  private class UnregisterFromPushCloudCallback
    implements UnregisterFromPushCloudListener
  {
    private UnregisterFromPushCloudCallback() {}
    
    public void onUnregisterFailed(PushNotificationError paramPushNotificationError)
    {
      if (UnregisterPushNotificationRunnable.this.errorCallback != null) {
        UnregisterPushNotificationRunnable.this.errorCallback.onError(paramPushNotificationError);
      }
    }
    
    public void onUnregisteredFromPushCloud(String paramString)
    {
      UnregisterPushNotificationRunnable.access$202(UnregisterPushNotificationRunnable.this, paramString);
      UnregisterPushNotificationRunnable.this.pushNotificationLatch.countDown();
    }
  }
  
  private class UnregisterOnWeMoCloudCallback
    implements UnregisterFromWeMoCloudListener
  {
    private UnregisterOnWeMoCloudCallback() {}
    
    public void onUnregisterFailed(PushNotificationError paramPushNotificationError)
    {
      if (UnregisterPushNotificationRunnable.this.errorCallback != null) {
        UnregisterPushNotificationRunnable.this.errorCallback.onError(paramPushNotificationError);
      }
    }
    
    public void onUnregisteredFromWeMoCloud(String paramString)
    {
      if (UnregisterPushNotificationRunnable.this.successCallback != null) {
        UnregisterPushNotificationRunnable.this.successCallback.onSuccess();
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */