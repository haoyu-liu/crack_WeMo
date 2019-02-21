package com.belkin.wemo.cache.utils;

import java.util.Locale;

public class StringUtils
{
  public static String toLowerCamelCase(String paramString)
  {
    if ((paramString == null) || (paramString.isEmpty())) {
      paramString = "";
    }
    char c1;
    char c3;
    do
    {
      return paramString;
      c1 = paramString.charAt(0);
      if (paramString.length() <= 1) {
        break;
      }
      c3 = paramString.charAt(1);
    } while (!Character.isUpperCase(c1));
    if (Character.isUpperCase(c3)) {
      return paramString.toLowerCase(Locale.getDefault());
    }
    char c4 = Character.toLowerCase(c1);
    return String.valueOf(c4) + paramString.substring(1);
    char c2 = Character.toLowerCase(c1);
    return String.valueOf(c2) + paramString.substring(1);
  }
  
  public static String toUpperCamelCase(String paramString)
  {
    if ((paramString == null) || (paramString.isEmpty())) {
      paramString = "";
    }
    char c1;
    do
    {
      return paramString;
      c1 = paramString.charAt(0);
      if (paramString.length() <= 1) {
        break;
      }
    } while (!Character.isLowerCase(c1));
    char c3 = Character.toUpperCase(c1);
    return String.valueOf(c3) + paramString.substring(1);
    char c2 = Character.toUpperCase(c1);
    return String.valueOf(c2) + paramString.substring(1);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/utils/StringUtils.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */