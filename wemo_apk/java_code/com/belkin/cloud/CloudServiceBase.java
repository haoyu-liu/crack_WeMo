package com.belkin.cloud;

import android.content.Context;
import com.belkin.utils.WiFiSecurityUtil;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.URL;
import java.security.SecureRandom;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;

public class CloudServiceBase
{
  private String authHeader = this.mWiFiSecurityUtil.generateAuthCode(paramContext);
  protected String data;
  private WiFiSecurityUtil mWiFiSecurityUtil = new WiFiSecurityUtil();
  protected String result;
  protected String urlStr;
  
  public CloudServiceBase(Context paramContext) {}
  
  public Object makeRequest()
  {
    try
    {
      this.authHeader = this.authHeader.substring(2);
      URL localURL = new URL(this.urlStr);
      try
      {
        SSLContext localSSLContext = SSLContext.getInstance("TLS");
        localSSLContext.init(null, null, new SecureRandom());
        HttpsURLConnection localHttpsURLConnection = (HttpsURLConnection)localURL.openConnection();
        localHttpsURLConnection.setSSLSocketFactory(localSSLContext.getSocketFactory());
        localHttpsURLConnection.setRequestProperty("Content-type", "application/xml");
        localHttpsURLConnection.setRequestProperty("Authorization", this.authHeader);
        localHttpsURLConnection.setDoOutput(true);
        localHttpsURLConnection.setChunkedStreamingMode(0);
        localHttpsURLConnection.setRequestMethod("POST");
        OutputStream localOutputStream = localHttpsURLConnection.getOutputStream();
        localOutputStream.write(this.data.getBytes());
        localOutputStream.flush();
        localOutputStream.close();
        i = localHttpsURLConnection.getResponseCode();
        if (i != 200) {
          break label221;
        }
        localBufferedReader = new BufferedReader(new InputStreamReader(localHttpsURLConnection.getInputStream()));
        for (;;)
        {
          String str = localBufferedReader.readLine();
          if (str == null) {
            break;
          }
          this.result += str;
        }
        localException1.printStackTrace();
      }
      catch (Exception localException1) {}
    }
    catch (Exception localException2)
    {
      int i;
      BufferedReader localBufferedReader;
      label221:
      Integer localInteger;
      for (;;) {}
    }
    return Integer.valueOf(0);
    localBufferedReader.close();
    localInteger = Integer.valueOf(i);
    return localInteger;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/cloud/CloudServiceBase.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */