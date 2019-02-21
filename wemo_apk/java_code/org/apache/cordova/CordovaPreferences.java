package org.apache.cordova;

import android.os.Bundle;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

public class CordovaPreferences
{
  private Bundle preferencesBundleExtras;
  private HashMap<String, String> prefs = new HashMap(20);
  
  public boolean contains(String paramString)
  {
    return getString(paramString, null) != null;
  }
  
  public Map<String, String> getAll()
  {
    return this.prefs;
  }
  
  public boolean getBoolean(String paramString, boolean paramBoolean)
  {
    String str1 = paramString.toLowerCase(Locale.ENGLISH);
    String str2 = (String)this.prefs.get(str1);
    if (str2 != null) {
      paramBoolean = Boolean.parseBoolean(str2);
    }
    return paramBoolean;
  }
  
  public double getDouble(String paramString, double paramDouble)
  {
    String str1 = paramString.toLowerCase(Locale.ENGLISH);
    String str2 = (String)this.prefs.get(str1);
    if (str2 != null) {
      paramDouble = Double.valueOf(str2).doubleValue();
    }
    return paramDouble;
  }
  
  public int getInteger(String paramString, int paramInt)
  {
    String str1 = paramString.toLowerCase(Locale.ENGLISH);
    String str2 = (String)this.prefs.get(str1);
    if (str2 != null) {
      paramInt = (int)Long.decode(str2).longValue();
    }
    return paramInt;
  }
  
  public String getString(String paramString1, String paramString2)
  {
    String str1 = paramString1.toLowerCase(Locale.ENGLISH);
    String str2 = (String)this.prefs.get(str1);
    if (str2 != null) {
      return str2;
    }
    return paramString2;
  }
  
  public void set(String paramString, double paramDouble)
  {
    set(paramString, "" + paramDouble);
  }
  
  public void set(String paramString, int paramInt)
  {
    set(paramString, "" + paramInt);
  }
  
  public void set(String paramString1, String paramString2)
  {
    this.prefs.put(paramString1.toLowerCase(Locale.ENGLISH), paramString2);
  }
  
  public void set(String paramString, boolean paramBoolean)
  {
    set(paramString, "" + paramBoolean);
  }
  
  public void setPreferencesBundle(Bundle paramBundle)
  {
    this.preferencesBundleExtras = paramBundle;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/cordova/CordovaPreferences.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */