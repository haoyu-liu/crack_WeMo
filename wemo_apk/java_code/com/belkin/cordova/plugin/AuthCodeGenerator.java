package com.belkin.cordova.plugin;

import android.content.Context;
import android.util.Base64;
import android.util.Log;
import com.belkin.utils.WiFiSecurityUtil;
import com.belkin.wemo.cache.utils.SharePreferences;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

public class AuthCodeGenerator
{
  public static final String TAG = "AuthCodeGenerator";
  private final long lExpirationDuration = 200L;
  private Context mContext;
  private SharePreferences mSharePreference;
  private WiFiSecurityUtil mWiFiSecurityUtil;
  
  public AuthCodeGenerator(Context paramContext)
  {
    this.mContext = paramContext;
    this.mSharePreference = new SharePreferences(this.mContext);
    this.mWiFiSecurityUtil = new WiFiSecurityUtil();
  }
  
  public String getCode()
  {
    long l = 200L + System.currentTimeMillis() / 1000L;
    String str1 = this.mWiFiSecurityUtil.getDeviceID(this.mContext);
    String str2 = str1 + "\n" + "\n" + l;
    String str3 = this.mSharePreference.getPrivateKey();
    Log.i("AuthCodeGenerator", "strUniqueID" + str1);
    Log.i("AuthCodeGenerator", "private key: " + str3);
    Object localObject = null;
    if (str3 != null) {}
    try
    {
      Mac localMac = Mac.getInstance("HmacSHA1");
      localMac.init(new SecretKeySpec(str3.getBytes(), localMac.getAlgorithm()));
      String str4 = new String(Base64.encode(localMac.doFinal(str2.getBytes()), 0)).trim();
      String str5 = "SDU " + str1 + ":" + str4 + ":" + l;
      localObject = str5;
      return (String)localObject;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
    return null;
  }
  
  public String getHomeId()
  {
    return this.mSharePreference.getHomeId();
  }
  
  public boolean isRemoteEnabled()
  {
    return this.mSharePreference.isRemoteEnabled();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/cordova/plugin/AuthCodeGenerator.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */