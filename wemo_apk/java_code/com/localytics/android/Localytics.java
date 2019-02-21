package com.localytics.android;

import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.location.Location;
import android.support.v4.app.FragmentActivity;
import android.util.Log;
import java.util.Date;
import java.util.Map;

public class Localytics
{
  public static void addAnalyticsListener(AnalyticsListener paramAnalyticsListener)
  {
    LocalyticsManager.getInstance().addAnalyticsListener(paramAnalyticsListener);
  }
  
  public static void addMessagingListener(MessagingListener paramMessagingListener)
  {
    LocalyticsManager.getInstance().addMessagingListener(paramMessagingListener);
  }
  
  public static void addProfileAttributesToSet(String paramString, long[] paramArrayOfLong)
  {
    addProfileAttributesToSet(paramString, paramArrayOfLong, ProfileScope.APPLICATION);
  }
  
  public static void addProfileAttributesToSet(String paramString, long[] paramArrayOfLong, ProfileScope paramProfileScope)
  {
    LocalyticsManager.getInstance().addProfileAttributesToSet(paramString, paramArrayOfLong, paramProfileScope);
  }
  
  public static void addProfileAttributesToSet(String paramString, String[] paramArrayOfString)
  {
    addProfileAttributesToSet(paramString, paramArrayOfString, ProfileScope.APPLICATION);
  }
  
  public static void addProfileAttributesToSet(String paramString, String[] paramArrayOfString, ProfileScope paramProfileScope)
  {
    LocalyticsManager.getInstance().addProfileAttributesToSet(paramString, paramArrayOfString, paramProfileScope);
  }
  
  public static void addProfileAttributesToSet(String paramString, Date[] paramArrayOfDate)
  {
    addProfileAttributesToSet(paramString, paramArrayOfDate, ProfileScope.APPLICATION);
  }
  
  public static void addProfileAttributesToSet(String paramString, Date[] paramArrayOfDate, ProfileScope paramProfileScope)
  {
    LocalyticsManager.getInstance().addProfileAttributesToSet(paramString, paramArrayOfDate, paramProfileScope);
  }
  
  public static void clearInAppMessageDisplayActivity()
  {
    LocalyticsManager.getInstance().clearInAppMessageDisplayActivity();
  }
  
  public static void closeSession()
  {
    LocalyticsManager.getInstance().closeSession();
  }
  
  static void decrementActivityCounter()
  {
    LocalyticsManager.getInstance().decrementActivityCounter();
  }
  
  public static void decrementProfileAttribute(String paramString, long paramLong)
  {
    decrementProfileAttribute(paramString, paramLong, ProfileScope.APPLICATION);
  }
  
  public static void decrementProfileAttribute(String paramString, long paramLong, ProfileScope paramProfileScope)
  {
    LocalyticsManager.getInstance().incrementProfileAttribute(paramString, -1L * paramLong, paramProfileScope);
  }
  
  public static void deleteProfileAttribute(String paramString)
  {
    deleteProfileAttribute(paramString, ProfileScope.APPLICATION);
  }
  
  public static void deleteProfileAttribute(String paramString, ProfileScope paramProfileScope)
  {
    LocalyticsManager.getInstance().deleteProfileAttribute(paramString, paramProfileScope);
  }
  
  public static void dismissCurrentInAppMessage()
  {
    LocalyticsManager.getInstance().dismissCurrentInAppMessage();
  }
  
  public static String getAnalyticsHost()
  {
    return Constants.ANALYTICS_HOST;
  }
  
  public static String getAppKey()
  {
    return LocalyticsManager.getInstance().getAppKey();
  }
  
  public static String getCustomDimension(int paramInt)
  {
    return LocalyticsManager.getInstance().getCustomDimension(paramInt);
  }
  
  public static String getCustomerId()
  {
    return getIdentifier("customer_id");
  }
  
  public static String getIdentifier(String paramString)
  {
    return LocalyticsManager.getInstance().getIdentifier(paramString);
  }
  
  public static InAppMessageDismissButtonLocation getInAppMessageDismissButtonLocation()
  {
    return LocalyticsManager.getInstance().getInAppMessageDismissButtonLocation();
  }
  
  public static String getInstallId()
  {
    return LocalyticsManager.getInstance().getInstallationId();
  }
  
  public static String getLibraryVersion()
  {
    return "androida_3.4.0";
  }
  
  public static String getMessagingHost()
  {
    return Constants.MARKETING_HOST;
  }
  
  public static String getProfilesHost()
  {
    return Constants.PROFILES_HOST;
  }
  
  public static String getPushRegistrationId()
  {
    return LocalyticsManager.getInstance().getPushRegistrationId();
  }
  
  public static long getSessionTimeoutInterval()
  {
    return Constants.SESSION_EXPIRATION / 1000L;
  }
  
  static void handleNotificationReceived(Intent paramIntent)
  {
    LocalyticsManager.getInstance().handleNotificationReceived(paramIntent);
  }
  
  public static void handlePushNotificationOpened(Intent paramIntent)
  {
    LocalyticsManager.getInstance().handlePushNotificationOpened(paramIntent);
  }
  
  static void handleRegistration(Intent paramIntent)
  {
    LocalyticsManager.getInstance().handleRegistration(paramIntent);
  }
  
  public static void handleTestMode(Intent paramIntent)
  {
    LocalyticsManager.getInstance().handleTestMode(paramIntent);
  }
  
  static void incrementActivityCounter()
  {
    LocalyticsManager.getInstance().incrementActivityCounter();
  }
  
  public static void incrementProfileAttribute(String paramString, long paramLong)
  {
    incrementProfileAttribute(paramString, paramLong, ProfileScope.APPLICATION);
  }
  
  public static void incrementProfileAttribute(String paramString, long paramLong, ProfileScope paramProfileScope)
  {
    LocalyticsManager.getInstance().incrementProfileAttribute(paramString, paramLong, paramProfileScope);
  }
  
  public static void integrate(Context paramContext)
  {
    integrate(paramContext, null);
  }
  
  public static void integrate(Context paramContext, String paramString)
  {
    if (paramContext == null) {
      throw new IllegalArgumentException("context cannot be null");
    }
    LocalyticsManager.getInstance().integrate(paramContext, paramString);
  }
  
  static boolean isAppInForeground()
  {
    return LocalyticsManager.getInstance().isAppInForeground();
  }
  
  static boolean isAutoIntegrate()
  {
    return LocalyticsManager.getInstance().isAutoIntegrate();
  }
  
  public static boolean isLoggingEnabled()
  {
    return Constants.IS_LOGGING_ENABLED;
  }
  
  public static boolean isOptedOut()
  {
    return LocalyticsManager.getInstance().isOptedOut();
  }
  
  public static boolean isPushDisabled()
  {
    return LocalyticsManager.getInstance().isPushDisabled();
  }
  
  public static boolean isTestModeEnabled()
  {
    return LocalyticsManager.getInstance().isTestModeEnabled();
  }
  
  public static void openSession()
  {
    LocalyticsManager.getInstance().openSession();
  }
  
  public static void registerPush(String paramString)
  {
    LocalyticsManager.getInstance().registerPush(paramString);
  }
  
  static void registerPush(String paramString, long paramLong)
  {
    LocalyticsManager.getInstance().registerPush(paramString, paramLong);
  }
  
  public static void removeAnalyticsListener(AnalyticsListener paramAnalyticsListener)
  {
    LocalyticsManager.getInstance().removeAnalyticsListener(paramAnalyticsListener);
  }
  
  public static void removeMessagingListener(MessagingListener paramMessagingListener)
  {
    LocalyticsManager.getInstance().removeMessagingListener(paramMessagingListener);
  }
  
  public static void removeProfileAttributesFromSet(String paramString, long[] paramArrayOfLong)
  {
    removeProfileAttributesFromSet(paramString, paramArrayOfLong, ProfileScope.APPLICATION);
  }
  
  public static void removeProfileAttributesFromSet(String paramString, long[] paramArrayOfLong, ProfileScope paramProfileScope)
  {
    LocalyticsManager.getInstance().removeProfileAttributesFromSet(paramString, paramArrayOfLong, paramProfileScope);
  }
  
  public static void removeProfileAttributesFromSet(String paramString, String[] paramArrayOfString)
  {
    removeProfileAttributesFromSet(paramString, paramArrayOfString, ProfileScope.APPLICATION);
  }
  
  public static void removeProfileAttributesFromSet(String paramString, String[] paramArrayOfString, ProfileScope paramProfileScope)
  {
    LocalyticsManager.getInstance().removeProfileAttributesFromSet(paramString, paramArrayOfString, paramProfileScope);
  }
  
  public static void removeProfileAttributesFromSet(String paramString, Date[] paramArrayOfDate)
  {
    removeProfileAttributesFromSet(paramString, paramArrayOfDate, ProfileScope.APPLICATION);
  }
  
  public static void removeProfileAttributesFromSet(String paramString, Date[] paramArrayOfDate, ProfileScope paramProfileScope)
  {
    LocalyticsManager.getInstance().removeProfileAttributesFromSet(paramString, paramArrayOfDate, paramProfileScope);
  }
  
  public static void setAnalyticsHost(String paramString)
  {
    Constants.ANALYTICS_HOST = paramString;
  }
  
  public static void setCustomDimension(int paramInt, String paramString)
  {
    LocalyticsManager.getInstance().setCustomDimension(paramInt, paramString);
  }
  
  public static void setCustomerEmail(String paramString)
  {
    setSpecialCustomerIdentifierAndAttribute("email", paramString);
  }
  
  public static void setCustomerFirstName(String paramString)
  {
    setSpecialCustomerIdentifierAndAttribute("first_name", paramString);
  }
  
  public static void setCustomerFullName(String paramString)
  {
    setSpecialCustomerIdentifierAndAttribute("full_name", paramString);
  }
  
  public static void setCustomerId(String paramString)
  {
    setIdentifier("customer_id", paramString);
  }
  
  public static void setCustomerLastName(String paramString)
  {
    setSpecialCustomerIdentifierAndAttribute("last_name", paramString);
  }
  
  public static void setIdentifier(String paramString1, String paramString2)
  {
    LocalyticsManager.getInstance().setIdentifier(paramString1, paramString2);
  }
  
  public static void setInAppMessageDismissButtonImage(Resources paramResources, int paramInt)
  {
    LocalyticsManager.getInstance().setInAppMessageDismissButtonImage(paramResources, paramInt);
  }
  
  public static void setInAppMessageDismissButtonImage(Resources paramResources, Bitmap paramBitmap)
  {
    LocalyticsManager.getInstance().setInAppMessageDismissButtonImage(paramResources, paramBitmap);
  }
  
  public static void setInAppMessageDismissButtonLocation(InAppMessageDismissButtonLocation paramInAppMessageDismissButtonLocation)
  {
    LocalyticsManager.getInstance().setInAppMessageDismissButtonLocation(paramInAppMessageDismissButtonLocation);
  }
  
  public static void setInAppMessageDisplayActivity(FragmentActivity paramFragmentActivity)
  {
    LocalyticsManager.getInstance().setInAppMessageDisplayActivity(paramFragmentActivity);
  }
  
  static void setIsAutoIntegrate(boolean paramBoolean)
  {
    LocalyticsManager.getInstance().setIsAutoIntegrate(paramBoolean);
  }
  
  public static void setLocation(Location paramLocation)
  {
    LocalyticsManager.getInstance().setLocation(paramLocation);
  }
  
  public static void setLoggingEnabled(boolean paramBoolean)
  {
    Constants.IS_LOGGING_ENABLED = paramBoolean;
  }
  
  public static void setMessagingHost(String paramString)
  {
    Constants.MARKETING_HOST = paramString;
  }
  
  public static void setOptedOut(boolean paramBoolean)
  {
    LocalyticsManager.getInstance().setOptedOut(paramBoolean);
  }
  
  public static void setProfileAttribute(String paramString, long paramLong)
  {
    setProfileAttribute(paramString, paramLong, ProfileScope.APPLICATION);
  }
  
  public static void setProfileAttribute(String paramString, long paramLong, ProfileScope paramProfileScope)
  {
    LocalyticsManager.getInstance().setProfileAttribute(paramString, paramLong, paramProfileScope);
  }
  
  public static void setProfileAttribute(String paramString1, String paramString2)
  {
    setProfileAttribute(paramString1, paramString2, ProfileScope.APPLICATION);
  }
  
  public static void setProfileAttribute(String paramString1, String paramString2, ProfileScope paramProfileScope)
  {
    LocalyticsManager.getInstance().setProfileAttribute(paramString1, paramString2, paramProfileScope);
  }
  
  public static void setProfileAttribute(String paramString, Date paramDate)
  {
    setProfileAttribute(paramString, paramDate, ProfileScope.APPLICATION);
  }
  
  public static void setProfileAttribute(String paramString, Date paramDate, ProfileScope paramProfileScope)
  {
    LocalyticsManager.getInstance().setProfileAttribute(paramString, paramDate, paramProfileScope);
  }
  
  public static void setProfileAttribute(String paramString, long[] paramArrayOfLong)
  {
    setProfileAttribute(paramString, paramArrayOfLong, ProfileScope.APPLICATION);
  }
  
  public static void setProfileAttribute(String paramString, long[] paramArrayOfLong, ProfileScope paramProfileScope)
  {
    LocalyticsManager.getInstance().setProfileAttribute(paramString, paramArrayOfLong, paramProfileScope);
  }
  
  public static void setProfileAttribute(String paramString, String[] paramArrayOfString)
  {
    setProfileAttribute(paramString, paramArrayOfString, ProfileScope.APPLICATION);
  }
  
  public static void setProfileAttribute(String paramString, String[] paramArrayOfString, ProfileScope paramProfileScope)
  {
    LocalyticsManager.getInstance().setProfileAttribute(paramString, paramArrayOfString, paramProfileScope);
  }
  
  public static void setProfileAttribute(String paramString, Date[] paramArrayOfDate)
  {
    setProfileAttribute(paramString, paramArrayOfDate, ProfileScope.APPLICATION);
  }
  
  public static void setProfileAttribute(String paramString, Date[] paramArrayOfDate, ProfileScope paramProfileScope)
  {
    LocalyticsManager.getInstance().setProfileAttribute(paramString, paramArrayOfDate, paramProfileScope);
  }
  
  public static void setProfilesHost(String paramString)
  {
    Constants.PROFILES_HOST = paramString;
  }
  
  public static void setPushDisabled(boolean paramBoolean)
  {
    LocalyticsManager.getInstance().setPushDisabled(paramBoolean);
  }
  
  public static void setPushRegistrationId(String paramString)
  {
    LocalyticsManager.getInstance().setPushRegistrationId(paramString);
  }
  
  public static void setSessionTimeoutInterval(long paramLong)
  {
    Constants.SESSION_EXPIRATION = 1000L * paramLong;
  }
  
  private static void setSpecialCustomerIdentifierAndAttribute(String paramString1, String paramString2)
  {
    setProfileAttribute("$" + paramString1, paramString2, ProfileScope.ORGANIZATION);
    setIdentifier(paramString1, paramString2);
  }
  
  public static void setTestModeEnabled(boolean paramBoolean)
  {
    LocalyticsManager.getInstance().setTestModeEnabled(paramBoolean);
  }
  
  public static void tagEvent(String paramString)
  {
    tagEvent(paramString, null, 0L);
  }
  
  public static void tagEvent(String paramString, Map<String, String> paramMap)
  {
    tagEvent(paramString, paramMap, 0L);
  }
  
  public static void tagEvent(String paramString, Map<String, String> paramMap, long paramLong)
  {
    LocalyticsManager.getInstance().tagEvent(paramString, paramMap, paramLong);
  }
  
  public static void tagScreen(String paramString)
  {
    LocalyticsManager.getInstance().tagScreen(paramString);
  }
  
  public static void triggerInAppMessage(String paramString)
  {
    triggerInAppMessage(paramString, null);
  }
  
  public static void triggerInAppMessage(String paramString, Map<String, String> paramMap)
  {
    LocalyticsManager.getInstance().triggerInAppMessage(paramString, paramMap, false);
  }
  
  public static void upload()
  {
    LocalyticsManager.getInstance().upload();
  }
  
  public static enum InAppMessageDismissButtonLocation
  {
    static
    {
      InAppMessageDismissButtonLocation[] arrayOfInAppMessageDismissButtonLocation = new InAppMessageDismissButtonLocation[2];
      arrayOfInAppMessageDismissButtonLocation[0] = LEFT;
      arrayOfInAppMessageDismissButtonLocation[1] = RIGHT;
      $VALUES = arrayOfInAppMessageDismissButtonLocation;
    }
    
    private InAppMessageDismissButtonLocation() {}
  }
  
  static final class Log
  {
    static int d(String paramString)
    {
      if (Constants.IS_LOGGING_ENABLED) {
        return Log.d("Localytics", paramString);
      }
      return -1;
    }
    
    static int d(String paramString, Throwable paramThrowable)
    {
      if (Constants.IS_LOGGING_ENABLED) {
        return Log.d("Localytics", paramString, paramThrowable);
      }
      return -1;
    }
    
    static int e(String paramString)
    {
      if (Constants.IS_LOGGING_ENABLED) {
        return Log.e("Localytics", paramString);
      }
      return -1;
    }
    
    static int e(String paramString, Throwable paramThrowable)
    {
      if (Constants.IS_LOGGING_ENABLED) {
        return Log.e("Localytics", paramString, paramThrowable);
      }
      return -1;
    }
    
    static int i(String paramString)
    {
      if (Constants.IS_LOGGING_ENABLED) {
        return Log.i("Localytics", paramString);
      }
      return -1;
    }
    
    static int i(String paramString, Throwable paramThrowable)
    {
      if (Constants.IS_LOGGING_ENABLED) {
        return Log.i("Localytics", paramString, paramThrowable);
      }
      return -1;
    }
    
    static int v(String paramString)
    {
      if (Constants.IS_LOGGING_ENABLED) {
        return Log.v("Localytics", paramString);
      }
      return -1;
    }
    
    static int v(String paramString, Throwable paramThrowable)
    {
      if (Constants.IS_LOGGING_ENABLED) {
        return Log.v("Localytics", paramString, paramThrowable);
      }
      return -1;
    }
    
    static int w(String paramString)
    {
      if (Constants.IS_LOGGING_ENABLED) {
        return Log.w("Localytics", paramString);
      }
      return -1;
    }
    
    static int w(String paramString, Throwable paramThrowable)
    {
      if (Constants.IS_LOGGING_ENABLED) {
        return Log.w("Localytics", paramString, paramThrowable);
      }
      return -1;
    }
    
    static int w(Throwable paramThrowable)
    {
      if (Constants.IS_LOGGING_ENABLED) {
        return Log.w("Localytics", paramThrowable);
      }
      return -1;
    }
    
    static int wtf(String paramString)
    {
      if (Constants.IS_LOGGING_ENABLED) {
        return Log.wtf("Localytics", paramString);
      }
      return -1;
    }
    
    static int wtf(String paramString, Throwable paramThrowable)
    {
      if (Constants.IS_LOGGING_ENABLED) {
        return Log.wtf("Localytics", paramString, paramThrowable);
      }
      return -1;
    }
    
    static int wtf(Throwable paramThrowable)
    {
      if (Constants.IS_LOGGING_ENABLED) {
        return Log.wtf("Localytics", paramThrowable);
      }
      return -1;
    }
  }
  
  public static enum ProfileScope
  {
    private final String scope;
    
    static
    {
      APPLICATION = new ProfileScope("APPLICATION", 1, "app");
      ProfileScope[] arrayOfProfileScope = new ProfileScope[2];
      arrayOfProfileScope[0] = ORGANIZATION;
      arrayOfProfileScope[1] = APPLICATION;
      $VALUES = arrayOfProfileScope;
    }
    
    private ProfileScope(String paramString)
    {
      this.scope = paramString;
    }
    
    public String getScope()
    {
      return this.scope;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/localytics/android/Localytics.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */