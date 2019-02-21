package com.belkin.wemo.cache.utils;

public class XmlUtils
{
  private static final String TAG_BINARY_STATE_C = "</binaryState>";
  private static final String TAG_BINARY_STATE_O = "<binaryState>";
  private static final String TAG_FRIENDLY_NAME_C = "</friendlyName>";
  private static final String TAG_FRIENDLY_NAME_O = "<friendlyName>";
  
  public static String getBinaryState(String paramString)
  {
    Object localObject = "";
    if (paramString != null) {}
    try
    {
      if (paramString.length() > 0)
      {
        String str = paramString.substring(paramString.indexOf("<binaryState>") + "<binaryState>".length(), paramString.indexOf("</binaryState>"));
        localObject = str;
      }
      return (String)localObject;
    }
    catch (Exception localException) {}
    return (String)localObject;
  }
  
  public static String getFriendlyName(String paramString)
  {
    Object localObject = "";
    if (paramString != null) {}
    try
    {
      if (paramString.length() > 0)
      {
        String str = paramString.substring(paramString.indexOf("<friendlyName>") + "<friendlyName>".length(), paramString.indexOf("</friendlyName>"));
        localObject = str;
      }
      return (String)localObject;
    }
    catch (Exception localException) {}
    return (String)localObject;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/utils/XmlUtils.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */