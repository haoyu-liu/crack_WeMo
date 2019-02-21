package com.belkin.wemo.push.cmd.impl;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import com.amazon.device.messaging.ADM;
import com.amazon.device.messaging.ADMMessageHandlerBase;
import com.amazon.device.messaging.ADMMessageReceiver;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.exception.InvalidArgumentsException;
import com.belkin.wemo.push.adm.ADMMD5ChecksumCalculator;
import com.belkin.wemo.push.cloud.WeMoCloudPushMessagingUtility;
import com.belkin.wemo.push.cmd.IPushNotificationHandler;
import com.belkin.wemo.push.cmd.listener.RegisterWithPushCloudListener;
import com.belkin.wemo.push.cmd.listener.RegisterWithWeMoCloudListener;
import com.belkin.wemo.push.cmd.listener.UnregisterFromPushCloudListener;
import com.belkin.wemo.push.cmd.listener.UnregisterFromWeMoCloudListener;
import com.belkin.wemo.push.error.PushNotificationError;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class KindlePushNotificationHandler
  extends ADMMessageHandlerBase
  implements IPushNotificationHandler
{
  public static final String TAG = "KindlePushNotificationHandler";
  private static RegisterWithPushCloudListener registerWithPushCloudListener;
  private static UnregisterFromPushCloudListener unregisterFromPushCloudListener;
  
  public KindlePushNotificationHandler()
  {
    super(KindlePushNotificationHandler.class.getName());
  }
  
  public KindlePushNotificationHandler(String paramString)
  {
    super(paramString);
  }
  
  private void verifyMD5Checksum(Bundle paramBundle)
  {
    Set localSet = paramBundle.keySet();
    HashMap localHashMap = new HashMap();
    Iterator localIterator = localSet.iterator();
    while (localIterator.hasNext())
    {
      String str3 = (String)localIterator.next();
      if ((!str3.equals("adm_message_md5")) && (!str3.equals("collapse_key"))) {
        localHashMap.put(str3, paramBundle.getString(str3));
      }
    }
    String str1 = new ADMMD5ChecksumCalculator().calculateChecksum(localHashMap);
    LogUtils.infoLog("KindlePushNotificationHandler", "ADMMessageHandler:onMessage App md5: " + str1);
    String str2 = paramBundle.getString("adm_message_md5");
    LogUtils.infoLog("KindlePushNotificationHandler", "ADMMessageHandler:onMessage ADM md5: " + str2);
    if (!str2.trim().equals(str1.trim())) {
      LogUtils.infoLog("KindlePushNotificationHandler", "ADMMessageHandler:onMessage MD5 checksum verification failure. Message received with errors");
    }
  }
  
  protected void onMessage(Intent paramIntent)
  {
    LogUtils.infoLog("KindlePushNotificationHandler", "Push Notification: Push Notification received from ADM Server.");
    Bundle localBundle = paramIntent.getExtras();
    verifyMD5Checksum(localBundle);
    String str1 = localBundle.getString("message");
    String str2 = localBundle.getString("timeStamp");
    if ((str1 == null) || (str2 == null)) {
      LogUtils.infoLog("KindlePushNotificationHandler", "Push Notification: OnMessage(): Unable to extract message data.Make sure that msgKey and timeKey values match data elements of your JSON message");
    }
    LogUtils.infoLog("KindlePushNotificationHandler", "Push Notification: Message contained in intent: " + str1);
    Intent localIntent = new Intent("com.belkin.wemo.intent.ACTION_ADM_MESSAGE_RECEIVED");
    localIntent.putExtra("message", str1);
    localIntent.putExtra("com.belkin.android.adm.ON_MESSAGE", str2);
    sendBroadcast(localIntent);
  }
  
  protected void onRegistered(String paramString)
  {
    LogUtils.infoLog("KindlePushNotificationHandler", "Push Notification: ADM Registration Success. Registration ID: " + paramString);
    registerWithPushCloudListener.onRegisteredWithPush(paramString);
    registerWithPushCloudListener = null;
  }
  
  protected void onRegistrationError(String paramString)
  {
    LogUtils.errorLog("KindlePushNotificationHandler", "Push Notification: ADM Registration Error - " + paramString);
    if (registerWithPushCloudListener != null) {}
    registerWithPushCloudListener.onRegistrationFailed(new PushNotificationError(-100, paramString));
    registerWithPushCloudListener = null;
  }
  
  protected void onUnregistered(String paramString)
  {
    LogUtils.infoLog("KindlePushNotificationHandler", "Push Notification: ADM unregister success fo registration ID: " + paramString);
    unregisterFromPushCloudListener.onUnregisteredFromPushCloud(paramString);
    unregisterFromPushCloudListener = null;
  }
  
  public void registerWithPushServer(Context paramContext, RegisterWithPushCloudListener paramRegisterWithPushCloudListener)
    throws InvalidArgumentsException
  {
    if (paramContext == null)
    {
      LogUtils.infoLog("KindlePushNotificationHandler", "Push Notification: Registering with ADM - Context is null!");
      throw new InvalidArgumentsException("Context in NULL!");
    }
    if (paramRegisterWithPushCloudListener == null)
    {
      LogUtils.infoLog("KindlePushNotificationHandler", "Push Notification: Registration Error - RegisterWithPushCloudListener instance is invalid!");
      throw new InvalidArgumentsException("RegisterWithPushCloudListener instance is invalid");
    }
    registerWithPushCloudListener = paramRegisterWithPushCloudListener;
    LogUtils.infoLog("KindlePushNotificationHandler", "Push Notification: Registering with ADM (Kindle)");
    ADM localADM = new ADM(paramContext);
    if (localADM.isSupported())
    {
      String str = localADM.getRegistrationId();
      if (TextUtils.isEmpty(str))
      {
        LogUtils.infoLog("KindlePushNotificationHandler", "Push Notification: Start register as registeration ID is NULL.");
        localADM.startRegister();
        return;
      }
      registerWithPushCloudListener.onAlreadyRegisteredWithPush(str);
      registerWithPushCloudListener = null;
      return;
    }
    LogUtils.infoLog("KindlePushNotificationHandler", "Push Notification: Registration Error - ADM is NOT supported!");
    registerWithPushCloudListener.onRegistrationFailed(new PushNotificationError());
    registerWithPushCloudListener = null;
  }
  
  public void registerWithWeMoCloud(Context paramContext, String paramString, RegisterWithWeMoCloudListener paramRegisterWithWeMoCloudListener)
    throws InvalidArgumentsException
  {
    WeMoCloudPushMessagingUtility.sendPushRegistrationIdToWeMoCloud(paramContext, paramString, paramRegisterWithWeMoCloudListener);
  }
  
  public void unregisterFromPushServer(Context paramContext, UnregisterFromPushCloudListener paramUnregisterFromPushCloudListener)
    throws InvalidArgumentsException
  {
    if (paramContext == null)
    {
      LogUtils.infoLog("KindlePushNotificationHandler", "Push Notification: Unregistering from ADM - Context is null!");
      throw new InvalidArgumentsException("Context in NULL!");
    }
    if (paramUnregisterFromPushCloudListener == null)
    {
      LogUtils.infoLog("KindlePushNotificationHandler", "Push Notification: Unregister Error - UnregisterFromPushCloudListener instance is invalid!");
      throw new InvalidArgumentsException("RegisterWithPushCloudListener instance is invalid");
    }
    unregisterFromPushCloudListener = paramUnregisterFromPushCloudListener;
    LogUtils.infoLog("KindlePushNotificationHandler", "Push Notification: unregistering from ADM (Kindle)");
    ADM localADM = new ADM(paramContext);
    if (localADM.isSupported())
    {
      localADM.startUnregister();
      return;
    }
    LogUtils.infoLog("KindlePushNotificationHandler", "Push Notification: Unregister Error - ADM is NOT supported!");
    unregisterFromPushCloudListener.onUnregisterFailed(new PushNotificationError());
    unregisterFromPushCloudListener = null;
  }
  
  public void unregisterFromWeMoCloud(Context paramContext, String paramString, UnregisterFromWeMoCloudListener paramUnregisterFromWeMoCloudListener)
    throws InvalidArgumentsException
  {
    WeMoCloudPushMessagingUtility.unregisterAppFromWeMoCloudForPush(paramContext, paramString, paramUnregisterFromWeMoCloudListener);
  }
  
  public static class MessageAlertReceiver
    extends ADMMessageReceiver
  {
    public MessageAlertReceiver()
    {
      super();
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/push/cmd/impl/KindlePushNotificationHandler.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */