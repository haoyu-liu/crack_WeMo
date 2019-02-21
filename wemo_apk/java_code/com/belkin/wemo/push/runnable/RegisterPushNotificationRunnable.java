package com.belkin.wemo.push.runnable;

import android.content.Context;
import com.belkin.wemo.exception.InvalidArgumentsException;
import com.belkin.wemo.push.callback.PushNotificationErrorCallback;
import com.belkin.wemo.push.callback.RegisterPushSuccessCallback;
import com.belkin.wemo.push.cloud.WeMoCloudPushMessagingUtility;
import com.belkin.wemo.push.cmd.IPushNotificationHandler;
import com.belkin.wemo.push.cmd.impl.PushNotificationCmdFactory;
import com.belkin.wemo.push.cmd.listener.RegisterWithPushCloudListener;
import com.belkin.wemo.push.cmd.listener.RegisterWithWeMoCloudListener;
import com.belkin.wemo.push.error.PushNotificationError;
import java.util.concurrent.CountDownLatch;

public class RegisterPushNotificationRunnable
  extends AbstractPushNotificationRunnable
{
  public static final int PUSH_REGISTRATON_TIMEOUT = 10000;
  public static final int REGISTER_PUSH_STEP = 1;
  private String registrationId;
  private RegisterPushSuccessCallback successCallback;
  
  public RegisterPushNotificationRunnable(PushNotificationErrorCallback paramPushNotificationErrorCallback, RegisterPushSuccessCallback paramRegisterPushSuccessCallback, Context paramContext)
  {
    super(paramPushNotificationErrorCallback, paramContext);
    this.successCallback = paramRegisterPushSuccessCallback;
  }
  
  protected void syncWithPushCloud()
    throws InvalidArgumentsException
  {
    PushNotificationCmdFactory.instance().registerWithPushServer(this.context, new RegisterOnPushCloudCallback(null));
  }
  
  protected void syncWithWeMoCloud()
    throws InvalidArgumentsException
  {
    WeMoCloudPushMessagingUtility.sendPushRegistrationIdToWeMoCloud(this.context, this.registrationId, new RegisterOnWeMoCloudCallback(null));
  }
  
  private class RegisterOnPushCloudCallback
    implements RegisterWithPushCloudListener
  {
    private RegisterOnPushCloudCallback() {}
    
    public void onAlreadyRegisteredWithPush(String paramString)
    {
      RegisterPushNotificationRunnable.access$202(RegisterPushNotificationRunnable.this, paramString);
      RegisterPushNotificationRunnable.this.pushNotificationLatch.countDown();
    }
    
    public void onRegisteredWithPush(String paramString)
    {
      RegisterPushNotificationRunnable.access$202(RegisterPushNotificationRunnable.this, paramString);
      RegisterPushNotificationRunnable.this.pushNotificationLatch.countDown();
    }
    
    public void onRegistrationFailed(PushNotificationError paramPushNotificationError)
    {
      if (RegisterPushNotificationRunnable.this.errorCallback != null) {
        RegisterPushNotificationRunnable.this.errorCallback.onError(paramPushNotificationError);
      }
    }
  }
  
  private class RegisterOnWeMoCloudCallback
    implements RegisterWithWeMoCloudListener
  {
    private RegisterOnWeMoCloudCallback() {}
    
    public void onRegisteredWithCloud(String paramString)
    {
      if (RegisterPushNotificationRunnable.this.successCallback != null) {
        RegisterPushNotificationRunnable.this.successCallback.onSuccess();
      }
    }
    
    public void onRegistrationFailed(PushNotificationError paramPushNotificationError)
    {
      if (RegisterPushNotificationRunnable.this.errorCallback != null) {
        RegisterPushNotificationRunnable.this.errorCallback.onError(paramPushNotificationError);
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/push/runnable/RegisterPushNotificationRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */