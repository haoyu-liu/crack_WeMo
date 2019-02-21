package com.belkin.wemo.push.runnable;

import android.content.Context;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.exception.InvalidArgumentsException;
import com.belkin.wemo.push.callback.PushNotificationErrorCallback;
import com.belkin.wemo.push.error.PushNotificationError;
import com.belkin.wemo.runnable.WeMoRunnable;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

public abstract class AbstractPushNotificationRunnable
  extends WeMoRunnable
{
  public static final int PUSH_REGISTRATON_TIMEOUT = 10000;
  public static final int REGISTER_PUSH_STEP = 1;
  protected Context context;
  protected PushNotificationErrorCallback errorCallback;
  protected CountDownLatch pushNotificationLatch;
  
  public AbstractPushNotificationRunnable(PushNotificationErrorCallback paramPushNotificationErrorCallback, Context paramContext)
  {
    this.errorCallback = paramPushNotificationErrorCallback;
    this.context = paramContext;
    this.pushNotificationLatch = new CountDownLatch(1);
  }
  
  public void run()
  {
    try
    {
      syncWithPushCloud();
      if (this.pushNotificationLatch.await(10000L, TimeUnit.MILLISECONDS))
      {
        syncWithWeMoCloud();
        this.pushNotificationLatch.await(10000L, TimeUnit.MILLISECONDS);
        return;
      }
      LogUtils.errorLog(this.TAG, "Push Notification: Timeout while trying to sync with Push Server");
      if (this.errorCallback != null)
      {
        this.errorCallback.onError(new PushNotificationError(-100, "Error during register/unregister Push Notification!"));
        return;
      }
    }
    catch (InvalidArgumentsException localInvalidArgumentsException)
    {
      LogUtils.errorLog(this.TAG, "Push Notification: InvalidArgumentsException during register/un-register. ", localInvalidArgumentsException);
      if (this.errorCallback != null)
      {
        this.errorCallback.onError(new PushNotificationError(-100, localInvalidArgumentsException.getMessage()));
        return;
      }
    }
    catch (InterruptedException localInterruptedException)
    {
      LogUtils.errorLog(this.TAG, "Push Notification: InterruptedException during push register/un-register. ", localInterruptedException);
      if (this.errorCallback != null) {
        this.errorCallback.onError(new PushNotificationError(-100, localInterruptedException.getMessage()));
      }
    }
  }
  
  protected abstract void syncWithPushCloud()
    throws InvalidArgumentsException;
  
  protected abstract void syncWithWeMoCloud()
    throws InvalidArgumentsException;
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/push/runnable/AbstractPushNotificationRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */