package com.belkin.cloud.utils;

import android.content.Context;
import android.content.res.AssetManager;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.cache.utils.Constants;
import java.security.KeyStore;
import org.apache.http.HttpVersion;
import org.apache.http.client.HttpClient;
import org.apache.http.conn.scheme.PlainSocketFactory;
import org.apache.http.conn.scheme.Scheme;
import org.apache.http.conn.scheme.SchemeRegistry;
import org.apache.http.conn.ssl.SSLSocketFactory;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.conn.tsccm.ThreadSafeClientConnManager;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpProtocolParams;

public class HTTPUtils
{
  public static final String STR_HTTP = "http";
  public static final String STR_HTTPS = "https";
  public static final String TAG = "HTTPUtils";
  
  private static HttpClient getCertUnSecureHttpClient(Context paramContext)
  {
    try
    {
      LogUtils.verboseLog("HTTPUtils", "getCertUnSecureHttpClient");
      KeyStore localKeyStore = KeyStore.getInstance(KeyStore.getDefaultType());
      localKeyStore.load(null, null);
      EasySSLSocketFactory localEasySSLSocketFactory = new EasySSLSocketFactory(localKeyStore);
      if (Constants.isStaging()) {
        localEasySSLSocketFactory.setHostnameVerifier(SSLSocketFactory.ALLOW_ALL_HOSTNAME_VERIFIER);
      }
      BasicHttpParams localBasicHttpParams = new BasicHttpParams();
      HttpProtocolParams.setVersion(localBasicHttpParams, HttpVersion.HTTP_1_1);
      HttpProtocolParams.setContentCharset(localBasicHttpParams, "UTF-8");
      SchemeRegistry localSchemeRegistry = new SchemeRegistry();
      localSchemeRegistry.register(new Scheme("http", PlainSocketFactory.getSocketFactory(), 80));
      localSchemeRegistry.register(new Scheme("https", localEasySSLSocketFactory, 443));
      DefaultHttpClient localDefaultHttpClient = new DefaultHttpClient(new ThreadSafeClientConnManager(localBasicHttpParams, localSchemeRegistry), localBasicHttpParams);
      return localDefaultHttpClient;
    }
    catch (Exception localException)
    {
      LogUtils.errorLog("HTTPUtils", "Exception in getCertUnSecureHttpClient()", localException);
    }
    return new DefaultHttpClient();
  }
  
  private static HttpClient getCloudCertSecureHttpClient(Context paramContext)
  {
    try
    {
      KeyStore localKeyStore = KeyStore.getInstance(Constants.KEY_STORE_TYPE);
      EasySSLSocketFactory localEasySSLSocketFactory;
      if ("https://api.xbcs.net:8443" == "https://api.xbcs.net:8443")
      {
        localKeyStore.load(paramContext.getAssets().open(Constants.KEY_FILE_PRODUCTION), Constants.KEY_FILE_PRODUCTION_PASSWD.toCharArray());
        localEasySSLSocketFactory = new EasySSLSocketFactory(localKeyStore);
      }
      for (;;)
      {
        LogUtils.verboseLog("HTTPUtils", "getCloudCertSecureHttpClient: " + localEasySSLSocketFactory.getHostnameVerifier());
        BasicHttpParams localBasicHttpParams = new BasicHttpParams();
        HttpProtocolParams.setVersion(localBasicHttpParams, HttpVersion.HTTP_1_1);
        HttpProtocolParams.setContentCharset(localBasicHttpParams, "UTF-8");
        HttpConnectionParams.setConnectionTimeout(localBasicHttpParams, 10000);
        HttpConnectionParams.setSoTimeout(localBasicHttpParams, 120000);
        HttpConnectionParams.setSocketBufferSize(localBasicHttpParams, 8192);
        SchemeRegistry localSchemeRegistry = new SchemeRegistry();
        localSchemeRegistry.register(new Scheme("http", PlainSocketFactory.getSocketFactory(), 80));
        localSchemeRegistry.register(new Scheme("https", localEasySSLSocketFactory, 443));
        localSchemeRegistry.register(new Scheme("https", localEasySSLSocketFactory, 8443));
        return new DefaultHttpClient(new ThreadSafeClientConnManager(localBasicHttpParams, localSchemeRegistry), localBasicHttpParams);
        if ("https://api.xbcs.net:8443" == "https://bcsstag.lswf.net:8443")
        {
          localKeyStore.load(paramContext.getAssets().open(Constants.KEY_FILE_STAGING), Constants.KEY_FILE_STAGING_PASSWD.toCharArray());
          localEasySSLSocketFactory = new EasySSLSocketFactory(localKeyStore);
        }
        else
        {
          localKeyStore.load(paramContext.getAssets().open(Constants.KEY_FILE_MINICLOUD), Constants.KEY_FILE_MCLOUD_PASSWD.toCharArray());
          localEasySSLSocketFactory = new EasySSLSocketFactory(localKeyStore);
        }
      }
      return new DefaultHttpClient();
    }
    catch (Exception localException)
    {
      LogUtils.errorLog("HTTPUtils", "Exception in getCloudCertSecureHttpClient()", localException);
    }
  }
  
  public static HttpClient getCloudNewHttpClient(Context paramContext)
  {
    if (Constants.IS_CERT_VALIDATE_REQUIRED) {
      return getCloudCertSecureHttpClient(paramContext);
    }
    return getCertUnSecureHttpClient(paramContext);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/cloud/utils/HTTPUtils.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */