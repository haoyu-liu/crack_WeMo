package com.belkin.wemo.cache.utils;

import android.util.Log;

public class SDKLogUtils
{
  private static boolean DEBUG = false;
  
  public static void debugLog(Class<?> paramClass, String paramString1, String paramString2)
  {
    if (DEBUG) {
      Log.d(paramClass.getSimpleName() + " - ThreadID: " + Thread.currentThread().getId(), paramString1 + ":" + " " + paramString2);
    }
  }
  
  public static void debugLog(String paramString1, String paramString2)
  {
    if (DEBUG) {
      Log.d(paramString1 + " - ThreadID: " + Thread.currentThread().getId(), paramString2);
    }
  }
  
  public static void errorLog(String paramString1, String paramString2)
  {
    Log.e(paramString1 + " - ThreadID: " + Thread.currentThread().getId(), paramString2);
  }
  
  public static void errorLog(String paramString1, String paramString2, Exception paramException)
  {
    Log.e(paramString1 + " - ThreadID: " + Thread.currentThread().getId(), paramString2, paramException);
  }
  
  public static void errorLog(String paramString1, String paramString2, String paramString3, Exception paramException)
  {
    Log.e(paramString1 + " - ThreadID: " + Thread.currentThread().getId(), paramString2 + ":" + " " + paramString3, paramException);
  }
  
  public static void infoLog(String paramString1, String paramString2)
  {
    if (DEBUG) {
      Log.i(paramString1 + " - ThreadID: " + Thread.currentThread().getId(), paramString2);
    }
  }
  
  public static boolean isDebug()
  {
    return DEBUG;
  }
  
  public static void verboseLog(String paramString1, String paramString2)
  {
    if (DEBUG) {
      Log.v(paramString1 + " - ThreadID: " + Thread.currentThread().getId(), paramString2);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/utils/SDKLogUtils.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */