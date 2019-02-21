package com.localytics.android;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.location.Location;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.FragmentActivity;
import android.text.TextUtils;
import android.util.TypedValue;
import java.net.Proxy;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CountDownLatch;

 enum LocalyticsManager
  implements LocalyticsDao
{
  private static int mActivityCounter = 0;
  private static boolean mIsAutoIntegrate = false;
  private String mApiKey;
  private Context mAppContext;
  private String mCustomerId;
  private HandlerWrapper mHandlerWrapper;
  private CountDownLatch mInitiatedLatch = new CountDownLatch(1);
  private String mInstallationId;
  private Proxy proxy;
  
  static
  {
    LocalyticsManager[] arrayOfLocalyticsManager = new LocalyticsManager[1];
    arrayOfLocalyticsManager[0] = INSTANCE;
    $VALUES = arrayOfLocalyticsManager;
  }
  
  private LocalyticsManager() {}
  
  private boolean classInManifest(@Nullable ActivityInfo[] paramArrayOfActivityInfo, @NonNull String paramString)
  {
    if (paramArrayOfActivityInfo != null)
    {
      int i = paramArrayOfActivityInfo.length;
      for (int j = 0; j < i; j++) {
        if (paramArrayOfActivityInfo[j].name.equalsIgnoreCase(paramString)) {
          return true;
        }
      }
    }
    return false;
  }
  
  private HandlerThread getHandlerThread(String paramString)
  {
    HandlerThread localHandlerThread = new HandlerThread(paramString, 10);
    localHandlerThread.start();
    return localHandlerThread;
  }
  
  static LocalyticsManager getInstance()
  {
    return INSTANCE;
  }
  
  private Bitmap scaleDownBitmap(Bitmap paramBitmap, float paramFloat)
  {
    int i = Math.max(paramBitmap.getWidth(), paramBitmap.getHeight());
    float f = paramBitmap.getWidth() / paramBitmap.getHeight();
    if (i > paramFloat)
    {
      if (paramBitmap.getWidth() >= paramBitmap.getHeight()) {}
      for (Bitmap localBitmap = Bitmap.createScaledBitmap(paramBitmap, (int)paramFloat, (int)(0.5F + paramFloat / f), true);; localBitmap = Bitmap.createScaledBitmap(paramBitmap, (int)(0.5F + paramFloat * f), (int)paramFloat, true))
      {
        if (localBitmap == null) {
          Localytics.Log.w("Cannot scale down the new dismiss button image.");
        }
        return localBitmap;
      }
    }
    return paramBitmap;
  }
  
  private void setSpecialCustomerIdentifierAndAttribute(String paramString1, String paramString2)
  {
    setProfileAttribute("$" + paramString1, paramString2, Localytics.ProfileScope.ORGANIZATION);
    setIdentifier(paramString1, paramString2);
  }
  
  static Object throwOrLogError(Class paramClass, String paramString)
  {
    return throwOrLogError(paramClass, paramString, null);
  }
  
  static Object throwOrLogError(Class paramClass, String paramString, Exception paramException)
  {
    return null;
  }
  
  public void addAnalyticsListener(AnalyticsListener paramAnalyticsListener)
  {
    getAnalyticsHandler().addListener(paramAnalyticsListener);
  }
  
  public void addMessagingListener(MessagingListener paramMessagingListener)
  {
    getMarketingHandler().addListener(paramMessagingListener);
  }
  
  public void addProfileAttributesToSet(String paramString, long[] paramArrayOfLong)
  {
    addProfileAttributesToSet(paramString, paramArrayOfLong, Localytics.ProfileScope.APPLICATION);
  }
  
  public void addProfileAttributesToSet(String paramString, long[] paramArrayOfLong, Localytics.ProfileScope paramProfileScope)
  {
    getProfileHandler().addProfileAttributesToSet(paramString, paramArrayOfLong, paramProfileScope.getScope());
  }
  
  public void addProfileAttributesToSet(String paramString, String[] paramArrayOfString)
  {
    addProfileAttributesToSet(paramString, paramArrayOfString, Localytics.ProfileScope.APPLICATION);
  }
  
  public void addProfileAttributesToSet(String paramString, String[] paramArrayOfString, Localytics.ProfileScope paramProfileScope)
  {
    getProfileHandler().addProfileAttributesToSet(paramString, paramArrayOfString, paramProfileScope.getScope());
  }
  
  public void addProfileAttributesToSet(String paramString, Date[] paramArrayOfDate)
  {
    addProfileAttributesToSet(paramString, paramArrayOfDate, Localytics.ProfileScope.APPLICATION);
  }
  
  public void addProfileAttributesToSet(String paramString, Date[] paramArrayOfDate, Localytics.ProfileScope paramProfileScope)
  {
    getProfileHandler().addProfileAttributesToSet(paramString, paramArrayOfDate, paramProfileScope.getScope());
  }
  
  public void clearInAppMessageDisplayActivity()
  {
    getMarketingHandler().setFragmentManager(null);
  }
  
  public void closeSession()
  {
    getAnalyticsHandler().closeSession();
  }
  
  void decrementActivityCounter()
  {
    mActivityCounter = -1 + mActivityCounter;
  }
  
  public void decrementProfileAttribute(String paramString, long paramLong)
  {
    decrementProfileAttribute(paramString, paramLong, Localytics.ProfileScope.APPLICATION);
  }
  
  public void decrementProfileAttribute(String paramString, long paramLong, Localytics.ProfileScope paramProfileScope)
  {
    getProfileHandler().incrementProfileAttribute(paramString, -1L * paramLong, paramProfileScope.getScope());
  }
  
  public void deleteProfileAttribute(String paramString)
  {
    deleteProfileAttribute(paramString, Localytics.ProfileScope.APPLICATION);
  }
  
  public void deleteProfileAttribute(String paramString, Localytics.ProfileScope paramProfileScope)
  {
    getProfileHandler().deleteProfileAttribute(paramString, paramProfileScope.getScope());
  }
  
  public void dismissCurrentInAppMessage()
  {
    Runnable local1 = new Runnable()
    {
      public void run()
      {
        LocalyticsManager.this.getMarketingHandler().dismissCurrentInAppMessage();
      }
    };
    if (Looper.myLooper() == Looper.getMainLooper())
    {
      local1.run();
      return;
    }
    new Handler(Looper.getMainLooper()).post(local1);
  }
  
  AnalyticsHandler getAnalyticsHandler()
  {
    if (this.mHandlerWrapper == null) {
      throw new LocalyticsNotInitializedException(null);
    }
    return this.mHandlerWrapper.analyticsHandler;
  }
  
  public String getApiKey()
  {
    return this.mApiKey;
  }
  
  public Context getAppContext()
  {
    return this.mAppContext;
  }
  
  public String getAppKey()
  {
    return DatapointHelper.getLocalyticsAppKeyOrNull(this.mAppContext);
  }
  
  public Calendar getCalendar()
  {
    return Calendar.getInstance();
  }
  
  public long getCurrentTimeMillis()
  {
    return System.currentTimeMillis();
  }
  
  public String getCustomDimension(int paramInt)
  {
    return getAnalyticsHandler().getCustomDimension(paramInt);
  }
  
  public String getCustomerId()
  {
    return getIdentifier("customer_id");
  }
  
  public String getCustomerIdInMemory()
  {
    return getCustomerIdInMemory(false);
  }
  
  public String getCustomerIdInMemory(boolean paramBoolean)
  {
    if (!paramBoolean) {}
    try
    {
      this.mInitiatedLatch.await();
      try
      {
        String str = this.mCustomerId;
        return str;
      }
      finally {}
    }
    catch (Exception localException)
    {
      for (;;) {}
    }
  }
  
  public CountDownLatch getCustomerIdInitiatedLatch()
  {
    return this.mInitiatedLatch;
  }
  
  public String getIdentifier(String paramString)
  {
    return getAnalyticsHandler().getIdentifier(paramString);
  }
  
  public Map<String, String> getIdentifiers()
  {
    return getAnalyticsHandler().getIdentifiers();
  }
  
  public Localytics.InAppMessageDismissButtonLocation getInAppMessageDismissButtonLocation()
  {
    return getMarketingHandler().getInAppDismissButtonLocation();
  }
  
  public String getInstallationId()
  {
    if (!TextUtils.isEmpty(this.mInstallationId)) {
      return this.mInstallationId;
    }
    throw new RuntimeException("No installation id!");
  }
  
  MarketingHandler getMarketingHandler()
  {
    if (this.mHandlerWrapper == null) {
      throw new LocalyticsNotInitializedException(null);
    }
    return this.mHandlerWrapper.marketingHandler;
  }
  
  ProfileHandler getProfileHandler()
  {
    if (this.mHandlerWrapper == null) {
      throw new LocalyticsNotInitializedException(null);
    }
    return this.mHandlerWrapper.profileHandler;
  }
  
  public Proxy getProxy()
  {
    return this.proxy;
  }
  
  public String getPushRegistrationId()
  {
    return getAnalyticsHandler().getPushRegistrationID();
  }
  
  public String getTimeStringForSQLite()
  {
    return "now";
  }
  
  public void handleNotificationReceived(Intent paramIntent)
  {
    getMarketingHandler().handleNotificationReceived(paramIntent);
  }
  
  public void handlePushNotificationOpened(Intent paramIntent)
  {
    getMarketingHandler().handlePushNotificationOpened(paramIntent);
  }
  
  public void handleRegistration(Intent paramIntent)
  {
    getAnalyticsHandler().handleRegistration(paramIntent);
  }
  
  public void handleTestMode(Intent paramIntent)
  {
    getMarketingHandler().handleTestModeIntent(paramIntent);
  }
  
  void incrementActivityCounter()
  {
    mActivityCounter = 1 + mActivityCounter;
  }
  
  public void incrementProfileAttribute(String paramString, long paramLong)
  {
    incrementProfileAttribute(paramString, paramLong, Localytics.ProfileScope.APPLICATION);
  }
  
  public void incrementProfileAttribute(String paramString, long paramLong, Localytics.ProfileScope paramProfileScope)
  {
    getProfileHandler().incrementProfileAttribute(paramString, paramLong, paramProfileScope.getScope());
  }
  
  public void integrate(@NonNull Context paramContext, @Nullable String paramString)
  {
    try
    {
      HandlerWrapper localHandlerWrapper = this.mHandlerWrapper;
      if (localHandlerWrapper != null) {
        return;
      }
      if (("com.localytics.android".equals(paramContext.getPackageName())) && (!paramContext.getClass().getName().equals("android.test.IsolatedContext")) && (!paramContext.getClass().getName().equals("android.test.RenamingDelegatingContext")))
      {
        Object[] arrayOfObject = new Object[1];
        arrayOfObject[0] = paramContext.getPackageName();
        throw new IllegalArgumentException(String.format("context.getPackageName() returned %s", arrayOfObject));
      }
    }
    finally {}
    boolean bool = paramContext.getClass().getName().equals("android.test.RenamingDelegatingContext");
    if ((!bool) && ((paramContext instanceof Activity))) {
      throw new IllegalStateException("Activity context use is not supported. You must call integrate() or registerActivityLifecycleCallbacks() from your Application class (see integration guide). If migrating from 3.0, see https://support.localytics.com/Android_SDK_Migration_3.0_to_3.x");
    }
    for (;;)
    {
      label134:
      this.mAppContext = paramContext;
      this.mApiKey = paramString;
      if (TextUtils.isEmpty(this.mApiKey)) {
        this.mApiKey = DatapointHelper.getLocalyticsAppKeyOrNull(this.mAppContext);
      }
      if (TextUtils.isEmpty(this.mApiKey)) {
        throw new IllegalArgumentException("App key must be declared in a meta data tag in AndroidManifest.xml or passed into integrate(final Context context, final String localyticsKey) or new LocalyticsActivityLifecycleCallbacks(final Context context, final String localyticsKey) (see integration guide).");
      }
      do
      {
        Context localContext = paramContext.getApplicationContext();
        paramContext = localContext;
        break label134;
        try
        {
          PackageInfo localPackageInfo = this.mAppContext.getPackageManager().getPackageInfo(this.mAppContext.getPackageName(), 3);
          if ((classInManifest(localPackageInfo.receivers, PushReceiver.class.getName())) && (!classInManifest(localPackageInfo.activities, PushTrackingActivity.class.getName()))) {
            throw new IllegalStateException("PushTrackingActivity must be declared in AndroidManifest.xml (see integration guide). If migrating from 3.0, see https://support.localytics.com/Android_SDK_Migration_3.0_to_3.x");
          }
        }
        catch (PackageManager.NameNotFoundException localNameNotFoundException)
        {
          Localytics.Log.w(localNameNotFoundException);
          AnalyticsHandler localAnalyticsHandler = new AnalyticsHandler(this, getHandlerThread(AnalyticsHandler.class.getSimpleName()).getLooper());
          MarketingHandler localMarketingHandler = new MarketingHandler(this, getHandlerThread(MarketingHandler.class.getSimpleName()).getLooper(), this.mAppContext);
          this.mHandlerWrapper = new HandlerWrapper(localAnalyticsHandler, localMarketingHandler, new ProfileHandler(this, getHandlerThread(ProfileHandler.class.getSimpleName()).getLooper()), null);
          localAnalyticsHandler.addListener(localMarketingHandler);
        }
        break;
      } while (!bool);
    }
  }
  
  public boolean isAppInForeground()
  {
    return mActivityCounter > 0;
  }
  
  public boolean isAutoIntegrate()
  {
    return mIsAutoIntegrate;
  }
  
  public boolean isOptedOut()
  {
    return getAnalyticsHandler().isOptedOut();
  }
  
  public boolean isPushDisabled()
  {
    return getAnalyticsHandler().isPushDisabled();
  }
  
  public boolean isTestModeEnabled()
  {
    return Constants.isTestModeEnabled();
  }
  
  public void openSession()
  {
    getAnalyticsHandler().openSession();
  }
  
  public void registerPush(String paramString)
  {
    registerPush(paramString, 0L);
  }
  
  public void registerPush(String paramString, long paramLong)
  {
    getAnalyticsHandler().registerPush(paramString, paramLong);
  }
  
  public void removeAnalyticsListener(AnalyticsListener paramAnalyticsListener)
  {
    getAnalyticsHandler().removeListener(paramAnalyticsListener);
  }
  
  public void removeMessagingListener(MessagingListener paramMessagingListener)
  {
    getMarketingHandler().removeListener(paramMessagingListener);
  }
  
  public void removeProfileAttributesFromSet(String paramString, long[] paramArrayOfLong)
  {
    removeProfileAttributesFromSet(paramString, paramArrayOfLong, Localytics.ProfileScope.APPLICATION);
  }
  
  public void removeProfileAttributesFromSet(String paramString, long[] paramArrayOfLong, Localytics.ProfileScope paramProfileScope)
  {
    getProfileHandler().removeProfileAttributesFromSet(paramString, paramArrayOfLong, paramProfileScope.getScope());
  }
  
  public void removeProfileAttributesFromSet(String paramString, String[] paramArrayOfString)
  {
    removeProfileAttributesFromSet(paramString, paramArrayOfString, Localytics.ProfileScope.APPLICATION);
  }
  
  public void removeProfileAttributesFromSet(String paramString, String[] paramArrayOfString, Localytics.ProfileScope paramProfileScope)
  {
    getProfileHandler().removeProfileAttributesFromSet(paramString, paramArrayOfString, paramProfileScope.getScope());
  }
  
  public void removeProfileAttributesFromSet(String paramString, Date[] paramArrayOfDate)
  {
    removeProfileAttributesFromSet(paramString, paramArrayOfDate, Localytics.ProfileScope.APPLICATION);
  }
  
  public void removeProfileAttributesFromSet(String paramString, Date[] paramArrayOfDate, Localytics.ProfileScope paramProfileScope)
  {
    getProfileHandler().removeProfileAttributesFromSet(paramString, paramArrayOfDate, paramProfileScope.getScope());
  }
  
  public void setCustomDimension(int paramInt, String paramString)
  {
    getAnalyticsHandler().setCustomDimension(paramInt, paramString);
  }
  
  public void setCustomerEmail(String paramString)
  {
    setSpecialCustomerIdentifierAndAttribute("email", paramString);
  }
  
  public void setCustomerFirstName(String paramString)
  {
    setSpecialCustomerIdentifierAndAttribute("first_name", paramString);
  }
  
  public void setCustomerFullName(String paramString)
  {
    setSpecialCustomerIdentifierAndAttribute("full_name", paramString);
  }
  
  public void setCustomerId(String paramString)
  {
    setIdentifier("customer_id", paramString);
  }
  
  public void setCustomerIdInMemory(String paramString)
  {
    try
    {
      if (TextUtils.isEmpty(paramString)) {
        paramString = this.mInstallationId;
      }
      this.mCustomerId = paramString;
      return;
    }
    finally {}
  }
  
  public void setCustomerLastName(String paramString)
  {
    setSpecialCustomerIdentifierAndAttribute("last_name", paramString);
  }
  
  public void setIdentifier(String paramString1, String paramString2)
  {
    if ("customer_id".equals(paramString1)) {
      setCustomerIdInMemory(paramString2);
    }
    getAnalyticsHandler().setIdentifier(paramString1, paramString2);
  }
  
  public void setInAppMessageDismissButtonImage(Resources paramResources, int paramInt)
  {
    BitmapFactory.Options localOptions = new BitmapFactory.Options();
    localOptions.inPurgeable = true;
    localOptions.inPreferredConfig = Bitmap.Config.ARGB_8888;
    Bitmap localBitmap1 = BitmapFactory.decodeResource(paramResources, paramInt, localOptions);
    if (localBitmap1 == null)
    {
      Localytics.Log.w("Cannot load the new dismiss button image. Is the resource id corrected?");
      getMarketingHandler().setDismissButtonImage(null);
      return;
    }
    Bitmap localBitmap2 = scaleDownBitmap(localBitmap1, TypedValue.applyDimension(1, 40.0F, paramResources.getDisplayMetrics()));
    if (localBitmap2 != localBitmap1) {
      localBitmap1.recycle();
    }
    getMarketingHandler().setDismissButtonImage(localBitmap2);
  }
  
  public void setInAppMessageDismissButtonImage(Resources paramResources, Bitmap paramBitmap)
  {
    Bitmap localBitmap = null;
    if (paramBitmap != null)
    {
      localBitmap = scaleDownBitmap(paramBitmap, TypedValue.applyDimension(1, 40.0F, paramResources.getDisplayMetrics()));
      if (localBitmap == paramBitmap) {
        localBitmap = paramBitmap.copy(Bitmap.Config.ARGB_8888, false);
      }
    }
    getMarketingHandler().setDismissButtonImage(localBitmap);
  }
  
  public void setInAppMessageDismissButtonLocation(Localytics.InAppMessageDismissButtonLocation paramInAppMessageDismissButtonLocation)
  {
    getMarketingHandler().setInAppDismissButtonLocation(paramInAppMessageDismissButtonLocation);
  }
  
  public void setInAppMessageDisplayActivity(FragmentActivity paramFragmentActivity)
  {
    if (paramFragmentActivity == null) {
      throw new IllegalArgumentException("attached activity cannot be null");
    }
    getMarketingHandler().setFragmentManager(paramFragmentActivity.getSupportFragmentManager());
    if (isTestModeEnabled()) {
      getMarketingHandler().showMarketingTest();
    }
  }
  
  public void setInstallationId(String paramString)
  {
    this.mInstallationId = paramString;
  }
  
  void setIsAutoIntegrate(boolean paramBoolean)
  {
    mIsAutoIntegrate = paramBoolean;
  }
  
  public void setLocation(Location paramLocation)
  {
    getAnalyticsHandler().setLocation(paramLocation);
  }
  
  public void setOptedOut(boolean paramBoolean)
  {
    getAnalyticsHandler().setOptedOut(paramBoolean);
  }
  
  public void setProfileAttribute(String paramString, long paramLong)
  {
    setProfileAttribute(paramString, paramLong, Localytics.ProfileScope.APPLICATION);
  }
  
  public void setProfileAttribute(String paramString, long paramLong, Localytics.ProfileScope paramProfileScope)
  {
    getProfileHandler().setProfileAttribute(paramString, paramLong, paramProfileScope.getScope());
  }
  
  public void setProfileAttribute(String paramString1, String paramString2)
  {
    setProfileAttribute(paramString1, paramString2, Localytics.ProfileScope.APPLICATION);
  }
  
  public void setProfileAttribute(String paramString1, String paramString2, Localytics.ProfileScope paramProfileScope)
  {
    getProfileHandler().setProfileAttribute(paramString1, paramString2, paramProfileScope.getScope());
  }
  
  public void setProfileAttribute(String paramString, Date paramDate)
  {
    setProfileAttribute(paramString, paramDate, Localytics.ProfileScope.APPLICATION);
  }
  
  public void setProfileAttribute(String paramString, Date paramDate, Localytics.ProfileScope paramProfileScope)
  {
    getProfileHandler().setProfileAttribute(paramString, paramDate, paramProfileScope.getScope());
  }
  
  public void setProfileAttribute(String paramString, long[] paramArrayOfLong)
  {
    setProfileAttribute(paramString, paramArrayOfLong, Localytics.ProfileScope.APPLICATION);
  }
  
  public void setProfileAttribute(String paramString, long[] paramArrayOfLong, Localytics.ProfileScope paramProfileScope)
  {
    getProfileHandler().setProfileAttribute(paramString, paramArrayOfLong, paramProfileScope.getScope());
  }
  
  public void setProfileAttribute(String paramString, String[] paramArrayOfString)
  {
    setProfileAttribute(paramString, paramArrayOfString, Localytics.ProfileScope.APPLICATION);
  }
  
  public void setProfileAttribute(String paramString, String[] paramArrayOfString, Localytics.ProfileScope paramProfileScope)
  {
    getProfileHandler().setProfileAttribute(paramString, paramArrayOfString, paramProfileScope.getScope());
  }
  
  public void setProfileAttribute(String paramString, Date[] paramArrayOfDate)
  {
    setProfileAttribute(paramString, paramArrayOfDate, Localytics.ProfileScope.APPLICATION);
  }
  
  public void setProfileAttribute(String paramString, Date[] paramArrayOfDate, Localytics.ProfileScope paramProfileScope)
  {
    getProfileHandler().setProfileAttribute(paramString, paramArrayOfDate, paramProfileScope.getScope());
  }
  
  public void setProxy(Proxy paramProxy)
  {
    this.proxy = paramProxy;
  }
  
  public void setPushDisabled(boolean paramBoolean)
  {
    getAnalyticsHandler().setPushDisabled(paramBoolean);
  }
  
  public void setPushRegistrationId(String paramString)
  {
    getAnalyticsHandler().setPushRegistrationId(paramString);
  }
  
  public void setReferrerId(String paramString)
  {
    getAnalyticsHandler().setReferrerId(paramString);
  }
  
  public void setScreenFlow(List<String> paramList)
  {
    getAnalyticsHandler().setScreenFlow(paramList);
  }
  
  public void setTestModeEnabled(boolean paramBoolean)
  {
    if (Constants.isTestModeEnabled() != paramBoolean)
    {
      Constants.setTestModeEnabled(paramBoolean);
      if (paramBoolean) {
        getMarketingHandler().showMarketingTest();
      }
    }
  }
  
  public void tagEvent(String paramString)
  {
    tagEvent(paramString, null, 0L);
  }
  
  public void tagEvent(String paramString, Map<String, String> paramMap)
  {
    tagEvent(paramString, paramMap, 0L);
  }
  
  public void tagEvent(String paramString, Map<String, String> paramMap, long paramLong)
  {
    getAnalyticsHandler().tagEvent(paramString, paramMap, paramLong);
  }
  
  public void tagScreen(String paramString)
  {
    getAnalyticsHandler().tagScreen(paramString);
  }
  
  public void triggerInAppMessage(String paramString)
  {
    triggerInAppMessage(paramString, null);
  }
  
  public void triggerInAppMessage(String paramString, Map<String, String> paramMap)
  {
    triggerInAppMessage(paramString, paramMap, false);
  }
  
  public void triggerInAppMessage(String paramString, Map<String, String> paramMap, boolean paramBoolean)
  {
    getMarketingHandler().displayMarketingMessage(paramString, paramMap, paramBoolean);
  }
  
  public void upload()
  {
    if (!TextUtils.isEmpty(this.mApiKey))
    {
      String str = getCustomerIdInMemory();
      getProfileHandler().upload(str);
      getAnalyticsHandler().upload(str);
    }
  }
  
  private final class HandlerWrapper
  {
    AnalyticsHandler analyticsHandler;
    MarketingHandler marketingHandler;
    ProfileHandler profileHandler;
    
    private HandlerWrapper(AnalyticsHandler paramAnalyticsHandler, MarketingHandler paramMarketingHandler, ProfileHandler paramProfileHandler)
    {
      this.analyticsHandler = paramAnalyticsHandler;
      this.marketingHandler = paramMarketingHandler;
      this.profileHandler = paramProfileHandler;
    }
  }
  
  public static final class LocalyticsNotInitializedException
    extends RuntimeException
  {
    private LocalyticsNotInitializedException()
    {
      super();
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/localytics/android/LocalyticsManager.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */