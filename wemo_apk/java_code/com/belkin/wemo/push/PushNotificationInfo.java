package com.belkin.wemo.push;

import com.belkin.utils.LogUtils;

public class PushNotificationInfo
{
  private static final String TAG = PushNotificationInfo.class.getSimpleName();
  private String eventCode;
  private String friendlyName;
  private boolean isAlertDialogRequired = true;
  private String mac;
  private String pushNotificationMsg = "";
  
  public String getEventCode()
  {
    if (this.eventCode == null) {
      this.eventCode = "";
    }
    return this.eventCode;
  }
  
  public String getFriendlyName()
  {
    LogUtils.debugLog(TAG, "Push Notification: Get Friendly Name: " + this.friendlyName);
    return this.friendlyName;
  }
  
  public String getMac()
  {
    if (this.mac == null) {
      this.mac = "";
    }
    return this.mac;
  }
  
  public String getPushNotificationMsg()
  {
    return this.pushNotificationMsg;
  }
  
  public boolean isAlertDialogRequired()
  {
    return this.isAlertDialogRequired;
  }
  
  public void setAlertDialogRequired(boolean paramBoolean)
  {
    this.isAlertDialogRequired = paramBoolean;
  }
  
  public void setEventCode(String paramString)
  {
    this.eventCode = paramString;
  }
  
  public void setFriendlyName(String paramString)
  {
    LogUtils.debugLog(TAG, "Push Notification: Set Friendly Name To: " + paramString);
    this.friendlyName = paramString;
  }
  
  public void setMac(String paramString)
  {
    this.mac = paramString;
  }
  
  public void setPushNotificationMsg(String paramString)
  {
    this.pushNotificationMsg = paramString;
  }
  
  public String toString()
  {
    return super.toString() + "; pushNotificationMsg: " + this.pushNotificationMsg + "; isAlertDialogRequired: " + this.isAlertDialogRequired + "; eventCode: " + this.eventCode;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/push/PushNotificationInfo.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */