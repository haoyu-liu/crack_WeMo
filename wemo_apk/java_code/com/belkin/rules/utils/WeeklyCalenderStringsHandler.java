package com.belkin.rules.utils;

import android.content.Context;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.runnable.WeMoRunnable;
import com.belkin.wemo.thread.WeMoThreadPoolHandler;
import com.belkin.wemo.utils.WeMoUtils;
import java.util.concurrent.atomic.AtomicInteger;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class WeeklyCalenderStringsHandler
{
  private static String TAG = "ScheduleStringConstructor";
  
  public static void getScheduleJSONObject(Context paramContext, String[] paramArrayOfString, AllDevicesScheduleStringSuccessCallback paramAllDevicesScheduleStringSuccessCallback, AllDevicesScheduleStringErrorCallback paramAllDevicesScheduleStringErrorCallback)
  {
    try
    {
      LogUtils.infoLog(TAG, "getScheduleJSONObject: JSON Object requested for number for devices");
      WeMoThreadPoolHandler.executeInBackground(new ScheduleJSONObjectGenerator(paramAllDevicesScheduleStringSuccessCallback, paramAllDevicesScheduleStringErrorCallback, paramArrayOfString, paramContext));
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public static void getSensorScheduleJSONObject(Context paramContext, String[] paramArrayOfString, AllDevicesScheduleStringSuccessCallback paramAllDevicesScheduleStringSuccessCallback, AllDevicesScheduleStringErrorCallback paramAllDevicesScheduleStringErrorCallback)
  {
    try
    {
      LogUtils.infoLog(TAG, "getSensorScheduleJSONObject: JSON Object requested for number for sesnor devices");
      WeMoThreadPoolHandler.executeInBackground(new SensorScheduleJSONObjectGenerator(paramAllDevicesScheduleStringSuccessCallback, paramAllDevicesScheduleStringErrorCallback, paramArrayOfString, paramContext));
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public static abstract interface AllDevicesScheduleStringErrorCallback
  {
    public abstract void onError();
  }
  
  public static abstract interface AllDevicesScheduleStringSuccessCallback
  {
    public abstract void onSuccess(JSONObject paramJSONObject);
  }
  
  private static class ScheduleJSONArrayGenerator
    extends WeMoRunnable
  {
    public static final int NUM_DAY_IN_WEEK = 7;
    protected Context context;
    private String deviceUDN;
    private WeeklyCalenderStringsHandler.ScheduleStringErrorCallback errorCallback;
    private JSONArray jsonArray = new JSONArray();
    private Object lock;
    private AtomicInteger schStringCount;
    private WeeklyCalenderStringsHandler.ScheduleStringSuccessCallback successCallback;
    
    public ScheduleJSONArrayGenerator(WeeklyCalenderStringsHandler.ScheduleStringSuccessCallback paramScheduleStringSuccessCallback, WeeklyCalenderStringsHandler.ScheduleStringErrorCallback paramScheduleStringErrorCallback, String paramString, Context paramContext)
    {
      this.deviceUDN = paramString;
      this.schStringCount = new AtomicInteger();
      this.lock = new Object();
      this.errorCallback = paramScheduleStringErrorCallback;
      this.successCallback = paramScheduleStringSuccessCallback;
      this.context = paramContext;
    }
    
    protected String getDeviceScheduleString(int paramInt, String paramString)
    {
      LogUtils.infoLog(this.TAG, "ScheduleJSONArrayGenerator: Getting schedule string for a regular device.");
      return new WeeklyCalenderStringsCreator(this.context).getScheduleString(Integer.valueOf(paramInt), paramString);
    }
    
    public void run()
    {
      final int i = 0;
      while (i < 7)
      {
        i++;
        WeMoThreadPoolHandler.executeInBackground(new Runnable()
        {
          public void run()
          {
            synchronized (WeeklyCalenderStringsHandler.ScheduleJSONArrayGenerator.this.lock)
            {
              String str = new String();
              if (!WeMoUtils.areFetchStoreAPIsSupportedInLocal(WeeklyCalenderStringsHandler.ScheduleJSONArrayGenerator.this.deviceUDN, WeeklyCalenderStringsHandler.ScheduleJSONArrayGenerator.this.context)) {
                str = WeeklyCalenderStringsHandler.ScheduleJSONArrayGenerator.this.getDeviceScheduleString(i, WeeklyCalenderStringsHandler.ScheduleJSONArrayGenerator.this.deviceUDN);
              }
              LogUtils.infoLog(WeeklyCalenderStringsHandler.ScheduleJSONArrayGenerator.this.TAG, "Schedule String for day: " + i + ", is: " + str);
              try
              {
                WeeklyCalenderStringsHandler.ScheduleJSONArrayGenerator.this.jsonArray.put(-1 + i, str);
                if ((WeeklyCalenderStringsHandler.ScheduleJSONArrayGenerator.this.schStringCount.incrementAndGet() >= 7) && (WeeklyCalenderStringsHandler.ScheduleJSONArrayGenerator.this.successCallback != null)) {
                  WeeklyCalenderStringsHandler.ScheduleJSONArrayGenerator.this.successCallback.onSuccess(WeeklyCalenderStringsHandler.ScheduleJSONArrayGenerator.this.deviceUDN, WeeklyCalenderStringsHandler.ScheduleJSONArrayGenerator.this.jsonArray);
                }
                return;
              }
              catch (JSONException localJSONException)
              {
                for (;;)
                {
                  LogUtils.errorLog(WeeklyCalenderStringsHandler.ScheduleJSONArrayGenerator.this.TAG, "JSONException while fetching Schedule String for day: " + i, localJSONException);
                }
              }
            }
          }
        });
      }
    }
  }
  
  private static class ScheduleJSONObjectGenerator
    implements Runnable, WeeklyCalenderStringsHandler.ScheduleStringErrorCallback, WeeklyCalenderStringsHandler.ScheduleStringSuccessCallback
  {
    protected Context context;
    private final int deviceUDNsCount;
    private WeeklyCalenderStringsHandler.AllDevicesScheduleStringErrorCallback errorCallback;
    private JSONObject jsonObject;
    private WeeklyCalenderStringsHandler.AllDevicesScheduleStringSuccessCallback successCallback;
    private String[] udnArray;
    private AtomicInteger udnCountAtomicInteger;
    private Object udnLock;
    
    public ScheduleJSONObjectGenerator(WeeklyCalenderStringsHandler.AllDevicesScheduleStringSuccessCallback paramAllDevicesScheduleStringSuccessCallback, WeeklyCalenderStringsHandler.AllDevicesScheduleStringErrorCallback paramAllDevicesScheduleStringErrorCallback, String[] paramArrayOfString, Context paramContext)
    {
      this.errorCallback = paramAllDevicesScheduleStringErrorCallback;
      this.successCallback = paramAllDevicesScheduleStringSuccessCallback;
      this.udnArray = paramArrayOfString;
      this.udnCountAtomicInteger = new AtomicInteger();
      if (paramArrayOfString != null) {}
      for (int i = paramArrayOfString.length;; i = 0)
      {
        this.deviceUDNsCount = i;
        this.udnLock = new Object();
        this.jsonObject = new JSONObject();
        this.context = paramContext;
        return;
      }
    }
    
    private void onCallbackReveived()
    {
      if (this.udnCountAtomicInteger.incrementAndGet() >= this.deviceUDNsCount)
      {
        LogUtils.infoLog(WeeklyCalenderStringsHandler.TAG, "ScheduleJSONObjectGenerator: ALL UDN callbacks received.");
        if (this.successCallback != null) {
          this.successCallback.onSuccess(this.jsonObject);
        }
      }
    }
    
    protected WeeklyCalenderStringsHandler.ScheduleJSONArrayGenerator getScheduleJSONArrayGenerator(String paramString)
    {
      LogUtils.infoLog(WeeklyCalenderStringsHandler.TAG, "ScheduleJSONObjectGenerator: Creating Runnable for ScheduleJSONArrayGenerator");
      return new WeeklyCalenderStringsHandler.ScheduleJSONArrayGenerator(this, this, paramString, this.context);
    }
    
    public void onError()
    {
      onCallbackReveived();
    }
    
    public void onSuccess(String paramString, JSONArray paramJSONArray)
    {
      LogUtils.infoLog(WeeklyCalenderStringsHandler.TAG, "ScheduleJSONObjectGenerator: JSON array received for UDN: " + paramString + ", JSON ARRAY: " + paramJSONArray);
      synchronized (this.udnLock)
      {
        try
        {
          this.jsonObject.put(paramString, paramJSONArray);
          onCallbackReveived();
          return;
        }
        catch (JSONException localJSONException)
        {
          for (;;)
          {
            LogUtils.errorLog(WeeklyCalenderStringsHandler.TAG, "JSONException while adding JSONArray for UDN: " + paramString + ", JSONArray: " + paramJSONArray);
          }
        }
      }
    }
    
    public void run()
    {
      for (String str : this.udnArray)
      {
        WeMoThreadPoolHandler.executeInBackground(getScheduleJSONArrayGenerator(str));
        LogUtils.infoLog(WeeklyCalenderStringsHandler.TAG, "ScheduleJSONObjectGenerator: getting JSON array for UDN: " + str);
      }
    }
  }
  
  public static abstract interface ScheduleStringErrorCallback
  {
    public abstract void onError();
  }
  
  public static abstract interface ScheduleStringSuccessCallback
  {
    public abstract void onSuccess(String paramString, JSONArray paramJSONArray);
  }
  
  private static class SensorScheduleJSONArrayGenerator
    extends WeeklyCalenderStringsHandler.ScheduleJSONArrayGenerator
  {
    public SensorScheduleJSONArrayGenerator(WeeklyCalenderStringsHandler.ScheduleStringSuccessCallback paramScheduleStringSuccessCallback, WeeklyCalenderStringsHandler.ScheduleStringErrorCallback paramScheduleStringErrorCallback, String paramString, Context paramContext)
    {
      super(paramScheduleStringErrorCallback, paramString, paramContext);
    }
    
    protected String getDeviceScheduleString(int paramInt, String paramString)
    {
      LogUtils.infoLog(this.TAG, "ScheduleJSONArrayGenerator: Getting schedule string for a SENSOR device.");
      return new WeeklyCalenderStringsCreator(this.context).getSensorScheduleString(Integer.valueOf(paramInt), paramString);
    }
  }
  
  private static class SensorScheduleJSONObjectGenerator
    extends WeeklyCalenderStringsHandler.ScheduleJSONObjectGenerator
  {
    public SensorScheduleJSONObjectGenerator(WeeklyCalenderStringsHandler.AllDevicesScheduleStringSuccessCallback paramAllDevicesScheduleStringSuccessCallback, WeeklyCalenderStringsHandler.AllDevicesScheduleStringErrorCallback paramAllDevicesScheduleStringErrorCallback, String[] paramArrayOfString, Context paramContext)
    {
      super(paramAllDevicesScheduleStringErrorCallback, paramArrayOfString, paramContext);
    }
    
    protected WeeklyCalenderStringsHandler.ScheduleJSONArrayGenerator getScheduleJSONArrayGenerator(String paramString)
    {
      LogUtils.infoLog(WeeklyCalenderStringsHandler.TAG, "SensorScheduleJSONObjectGenerator: Creating Runnable for SensorScheduleJSONArrayGenerator");
      return new WeeklyCalenderStringsHandler.SensorScheduleJSONArrayGenerator(this, this, paramString, this.context);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/rules/utils/WeeklyCalenderStringsHandler.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */