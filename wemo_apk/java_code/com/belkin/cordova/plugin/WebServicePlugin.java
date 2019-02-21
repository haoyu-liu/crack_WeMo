package com.belkin.cordova.plugin;

import android.content.Context;
import android.util.Base64;
import com.belkin.utils.WiFiSecurityUtil;
import com.belkin.wemo.cache.utils.SharePreferences;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.json.JSONArray;
import org.json.JSONException;

public class WebServicePlugin
  extends CordovaPlugin
{
  public static final String TAG = "WebServicePlugin";
  private final long lExpirationDuration = 200L;
  private long lExpirationTime = 0L;
  private Context mContext;
  private SharePreferences mSharePreference;
  private WiFiSecurityUtil mWiFiSecurityUtil;
  private String strAuthorizationHeader = "";
  private String strBaseString = "";
  private String strHomeID = "";
  private String strPrivateKey = "";
  private String strReUnionKey = "";
  private String strSignature = "";
  private String strUniqueID = "";
  
  private JSONArray generateAuthCode(boolean paramBoolean)
    throws JSONException
  {
    JSONArray localJSONArray = new JSONArray();
    this.strAuthorizationHeader = null;
    this.lExpirationTime = (200L + System.currentTimeMillis() / 1000L);
    this.strUniqueID = this.mWiFiSecurityUtil.getDeviceID(this.mContext);
    this.strBaseString = (this.strUniqueID + "\n" + "\n" + this.lExpirationTime);
    this.strPrivateKey = this.mSharePreference.getPrivateKey();
    this.strReUnionKey = this.mSharePreference.getReUnionKey();
    this.strHomeID = this.mSharePreference.getHomeId();
    this.strSignature = null;
    String str;
    if (paramBoolean) {
      str = this.strReUnionKey;
    }
    for (;;)
    {
      if (str != null) {}
      try
      {
        Mac localMac = Mac.getInstance("HmacSHA1");
        localMac.init(new SecretKeySpec(str.getBytes(), localMac.getAlgorithm()));
        this.strSignature = new String(Base64.encode(localMac.doFinal(this.strBaseString.getBytes()), 0)).trim();
        this.strAuthorizationHeader = ("SDU " + this.strUniqueID + ":" + this.strSignature + ":" + this.lExpirationTime);
        localJSONArray.put(this.strAuthorizationHeader);
        localJSONArray.put(this.strHomeID);
        localJSONArray.put(str);
        return localJSONArray;
        str = this.strPrivateKey;
      }
      catch (Exception localException)
      {
        for (;;)
        {
          localException.printStackTrace();
        }
      }
    }
  }
  
  public boolean execute(String paramString, JSONArray paramJSONArray, CallbackContext paramCallbackContext)
    throws JSONException
  {
    if (paramString.equals("getAuthCode"))
    {
      this.mContext = this.cordova.getActivity();
      this.mSharePreference = new SharePreferences(this.mContext);
      this.mWiFiSecurityUtil = new WiFiSecurityUtil();
      boolean bool1 = false;
      if (paramJSONArray != null)
      {
        int i = paramJSONArray.length();
        bool1 = false;
        if (i > 0)
        {
          boolean bool2 = paramJSONArray.get(0).equals("F");
          bool1 = false;
          if (bool2) {
            bool1 = true;
          }
        }
      }
      if ((this.mSharePreference.isRemoteEnabled()) || (bool1))
      {
        paramCallbackContext.success(generateAuthCode(bool1));
        return true;
      }
      paramCallbackContext.error(1);
      return true;
    }
    return false;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/cordova/plugin/WebServicePlugin.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */