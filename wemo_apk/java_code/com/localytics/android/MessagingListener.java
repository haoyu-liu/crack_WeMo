package com.localytics.android;

public abstract interface MessagingListener
  extends BaseHandler.BaseListener
{
  public abstract void localyticsDidDismissInAppMessage();
  
  public abstract void localyticsDidDisplayInAppMessage();
  
  public abstract void localyticsWillDismissInAppMessage();
  
  public abstract void localyticsWillDisplayInAppMessage();
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/localytics/android/MessagingListener.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */