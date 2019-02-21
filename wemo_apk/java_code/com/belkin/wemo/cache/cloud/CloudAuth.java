package com.belkin.wemo.cache.cloud;

import android.content.Context;
import android.util.Base64;
import com.belkin.wemo.cache.utils.SharePreferences;
import com.belkin.wemo.cache.utils.WiFiSecurityUtil;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import org.json.JSONException;

public class CloudAuth
{
  private static final String TAG = "SDK_CloudAuth";
  private final long lExpirationDuration = 200L;
  private Context mContext;
  private SharePreferences mSharePreference;
  private WiFiSecurityUtil mWiFiSecurityUtil;
  
  public CloudAuth(Context paramContext)
  {
    this.mContext = paramContext;
    this.mSharePreference = new SharePreferences(this.mContext);
    this.mWiFiSecurityUtil = new WiFiSecurityUtil();
  }
  
  public String generateAuthCode()
    throws JSONException
  {
    long l = 200L + System.currentTimeMillis() / 1000L;
    String str1 = this.mWiFiSecurityUtil.getDeviceID(this.mContext);
    String str2 = str1 + "\n" + "\n" + l;
    String str3 = this.mSharePreference.getPrivateKey();
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
  
  public String getHomeID()
  {
    String str = this.mSharePreference.getCurrentLocationHomeId();
    if ((str == null) || (str.length() == 0)) {
      str = this.mSharePreference.getHomeId();
    }
    return str;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudAuth.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */