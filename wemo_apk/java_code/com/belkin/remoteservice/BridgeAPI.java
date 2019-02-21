package com.belkin.remoteservice;

import android.content.Context;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.cache.utils.NetworkMode;
import com.belkin.wemo.cache.utils.SharePreferences;
import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class BridgeAPI
{
  private static final String TAG = BridgeAPI.class.getSimpleName();
  private String SERVICE_URL = "http://";
  private Context context;
  protected String data;
  private SharePreferences mSharePreference;
  
  public BridgeAPI(Context paramContext)
  {
    this.context = paramContext;
    this.mSharePreference = new SharePreferences(paramContext);
  }
  
  private String getIpAdress()
  {
    return this.mSharePreference.getWemoBridgeIp();
  }
  
  private boolean isLocalNetwork()
  {
    return NetworkMode.isLocal();
  }
  
  public void makeRequstToBridge(String paramString)
  {
    if ((getIpAdress() != "") && (isLocalNetwork()))
    {
      String str1 = this.SERVICE_URL + getIpAdress() + ":8888/removeDevice";
      LogUtils.debugLog(TAG, "API call to remove device with UDN: " + paramString + " url " + str1);
      for (;;)
      {
        try
        {
          URL localURL = new URL(str1);
          try
          {
            localHttpURLConnection = (HttpURLConnection)localURL.openConnection();
            localHttpURLConnection.setRequestProperty("Host", getIpAdress() + ":8888");
            localHttpURLConnection.setRequestMethod("POST");
            localHttpURLConnection.setRequestProperty("Content-Type", "application/xml");
            localHttpURLConnection.setConnectTimeout(60000);
            localHttpURLConnection.setReadTimeout(60000);
            localHttpURLConnection.addRequestProperty("UDN", paramString);
            localHttpURLConnection.setRequestProperty("Connection", "keep-alive");
            localHttpURLConnection.setRequestProperty("Proxy-Connection", "keep-alive");
            localHttpURLConnection.setRequestProperty("User-Agent", "Wemo/Brooklyn CFNetwork/889.9 Darwin/17.2.0");
            localHttpURLConnection.setRequestProperty("Accept", "application/xml");
            localHttpURLConnection.setRequestProperty("Accept-Language", "en-us");
            localHttpURLConnection.setRequestProperty("Accept-Encoding", "gzip, deflate");
            localHttpURLConnection.setRequestProperty("Content-Length", "0");
            i = localHttpURLConnection.getResponseCode();
            LogUtils.debugLog(TAG, " status : " + i);
            if (i != 200) {
              continue;
            }
            LogUtils.debugLog(TAG, "Device Removed from HomeKitBridge");
            localObject = new BufferedInputStream(localHttpURLConnection.getInputStream());
            BufferedReader localBufferedReader = new BufferedReader(new InputStreamReader((InputStream)localObject));
            String str2 = localBufferedReader.readLine();
            if (str2 == null) {
              continue;
            }
            LogUtils.debugLog(TAG, str2);
            continue;
            localException1.printStackTrace();
          }
          catch (Exception localException1) {}
        }
        catch (Exception localException2)
        {
          HttpURLConnection localHttpURLConnection;
          int i;
          Object localObject;
          BufferedInputStream localBufferedInputStream;
          continue;
        }
        LogUtils.debugLog(TAG, localException1.getMessage());
        return;
        localObject = null;
        if (i == 400)
        {
          localBufferedInputStream = new BufferedInputStream(localHttpURLConnection.getErrorStream());
          localObject = localBufferedInputStream;
        }
      }
      return;
    }
    LogUtils.debugLog(TAG, "NO BRIDGE IN NETWORK or NOT SUPPORTED DEVICE or REMOTE MODE");
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/remoteservice/BridgeAPI.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */