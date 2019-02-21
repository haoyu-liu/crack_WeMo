package com.belkin.wemo.cache.zigbee;

import android.text.TextUtils;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.util.LinkedHashMap;
import org.json.JSONObject;

public class ZigBeeCapabilities
{
  public static String capabilitiesToJSON(String paramString1, String paramString2, LinkedHashMap<String, String> paramLinkedHashMap)
  {
    String[] arrayOfString1 = paramString1.split(",");
    String[] arrayOfString2 = paramString2.split(",");
    if (paramLinkedHashMap == null) {
      return "";
    }
    JSONObject localJSONObject = new JSONObject();
    int i = 0;
    for (;;)
    {
      int k;
      try
      {
        int j = arrayOfString1.length;
        k = 0;
        if (k < j)
        {
          String str1 = arrayOfString1[k];
          if ((arrayOfString2.length <= i) || (arrayOfString2[i] == null)) {
            break label165;
          }
          String str2 = "";
          if (!arrayOfString2[i].isEmpty()) {
            str2 = arrayOfString2[i];
          }
          String str3 = (String)paramLinkedHashMap.get(str1);
          if (!TextUtils.isEmpty(str3)) {
            localJSONObject.put(str3, str2);
          } else {
            SDKLogUtils.infoLog("ZigbeeScan", "name empty for capability:" + str1);
          }
        }
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
      }
      return localJSONObject.toString();
      label165:
      i++;
      k++;
    }
  }
  
  public static String getCapabilitiesValue(String paramString1, String paramString2, String paramString3)
  {
    String[] arrayOfString1 = paramString1.split(",");
    String[] arrayOfString2 = paramString2.split(",");
    int i = 0;
    int j = arrayOfString1.length;
    for (int k = 0; k < j; k++)
    {
      if ((arrayOfString1[k].equals(paramString3)) && (arrayOfString2.length > i) && (arrayOfString2[i] != null))
      {
        if (arrayOfString2[i].isEmpty()) {
          return "0";
        }
        return arrayOfString2[i];
      }
      i++;
    }
    return "0";
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/zigbee/ZigBeeCapabilities.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */