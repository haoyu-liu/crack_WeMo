package com.localytics.android;

import android.content.Context;
import java.net.Proxy;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CountDownLatch;

abstract interface LocalyticsDao
{
  public abstract String getApiKey();
  
  public abstract Context getAppContext();
  
  public abstract Calendar getCalendar();
  
  public abstract long getCurrentTimeMillis();
  
  public abstract String getCustomDimension(int paramInt);
  
  public abstract String getCustomerIdInMemory();
  
  public abstract String getCustomerIdInMemory(boolean paramBoolean);
  
  public abstract CountDownLatch getCustomerIdInitiatedLatch();
  
  public abstract Map<String, String> getIdentifiers();
  
  public abstract String getInstallationId();
  
  public abstract Proxy getProxy();
  
  public abstract String getPushRegistrationId();
  
  public abstract String getTimeStringForSQLite();
  
  public abstract boolean isAppInForeground();
  
  public abstract boolean isAutoIntegrate();
  
  public abstract boolean isPushDisabled();
  
  public abstract void setCustomDimension(int paramInt, String paramString);
  
  public abstract void setCustomerIdInMemory(String paramString);
  
  public abstract void setInstallationId(String paramString);
  
  public abstract void setScreenFlow(List<String> paramList);
  
  public abstract void setTestModeEnabled(boolean paramBoolean);
  
  public abstract void tagEvent(String paramString);
  
  public abstract void tagEvent(String paramString, Map<String, String> paramMap);
  
  public abstract void tagEvent(String paramString, Map<String, String> paramMap, long paramLong);
  
  public abstract void triggerInAppMessage(String paramString);
  
  public abstract void triggerInAppMessage(String paramString, Map<String, String> paramMap);
  
  public abstract void triggerInAppMessage(String paramString, Map<String, String> paramMap, boolean paramBoolean);
  
  public abstract void upload();
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/localytics/android/LocalyticsDao.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */