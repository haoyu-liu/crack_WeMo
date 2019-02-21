package com.belkin.wemo.cache.devicelist;

import com.belkin.wemo.cache.utils.SDKLogUtils;

public class LEDStatusTracker
{
  private static final String TAG = LEDStatusTracker.class.getSimpleName();
  private static int offlineLEDCount;
  
  public static void incrementOfflineLEDCount()
  {
    try
    {
      offlineLEDCount = 1 + offlineLEDCount;
      SDKLogUtils.debugLog(TAG, "LED Status Tracking: Offline LED Count INCREMENTED. New Count: " + offlineLEDCount);
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public static boolean isAnyLEDOffline()
  {
    try
    {
      int i = offlineLEDCount;
      boolean bool = false;
      if (i > 0) {
        bool = true;
      }
      SDKLogUtils.debugLog(TAG, "LED Status Tracking: Is Any LED Offline = " + bool + "; Offline count: " + offlineLEDCount);
      return bool;
    }
    finally {}
  }
  
  public static void resetOfflineLEDCount()
  {
    try
    {
      offlineLEDCount = 0;
      SDKLogUtils.debugLog(TAG, "LED Status Tracking: Offline LED Count RESET.");
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/devicelist/LEDStatusTracker.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */