package com.belkin.wemo.cache.utils;

public class NetworkMode
{
  private static final String TAG = NetworkMode.class.getSimpleName();
  private static String appNetworkType = "Home";
  private static boolean isLocal = true;
  
  public static String getAppNetworkType()
  {
    SDKLogUtils.debugLog(TAG, "Get App Network Type" + appNetworkType);
    return appNetworkType;
  }
  
  public static boolean isLocal()
  {
    SDKLogUtils.debugLog(TAG, "Network Mode isLocal: " + isLocal);
    return isLocal;
  }
  
  public static void setAppNetworkType(String paramString)
  {
    SDKLogUtils.debugLog(TAG, "Set App Network Type" + paramString);
    appNetworkType = paramString;
  }
  
  public static void setLocal(boolean paramBoolean)
  {
    SDKLogUtils.debugLog(TAG, "Setting Network Mode: isLocal = " + paramBoolean);
    isLocal = paramBoolean;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/utils/NetworkMode.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */