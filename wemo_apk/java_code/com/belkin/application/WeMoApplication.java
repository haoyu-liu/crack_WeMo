package com.belkin.application;

import android.app.Application;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.WeMo;
import com.belkin.wemo.exception.WeMoInitException;
import com.belkin.wemo.rules.RMRulesSDK;
import com.localytics.android.LocalyticsActivityLifecycleCallbacks;
import java.security.SecureRandom;
import java.security.cert.CertificateException;
import java.security.cert.CertificateExpiredException;
import java.security.cert.CertificateNotYetValidException;
import java.security.cert.X509Certificate;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

public class WeMoApplication
  extends Application
{
  public static final String WEMO_API_KEY = "dummy_api_key";
  private final String TAG = WeMoApplication.class.getSimpleName();
  
  private void trustAllCertificates()
  {
    try
    {
      TrustManager[] arrayOfTrustManager = new TrustManager[1];
      arrayOfTrustManager[0 = new X509TrustManager()
      {
        public void checkClientTrusted(X509Certificate[] paramAnonymousArrayOfX509Certificate, String paramAnonymousString)
          throws CertificateException
        {}
        
        public void checkServerTrusted(X509Certificate[] paramAnonymousArrayOfX509Certificate, String paramAnonymousString)
          throws CertificateException
        {
          try
          {
            paramAnonymousArrayOfX509Certificate[0].checkValidity();
            return;
          }
          catch (CertificateExpiredException localCertificateExpiredException)
          {
            LogUtils.errorLog(WeMoApplication.this.TAG, "CertificateExpiredException");
            throw new CertificateException("CertificateExpiredException");
          }
          catch (CertificateNotYetValidException localCertificateNotYetValidException)
          {
            LogUtils.errorLog(WeMoApplication.this.TAG, "CertificateNotYetValidException");
            throw new CertificateException("CertificateNotYetValidException");
          }
        }
        
        public X509Certificate[] getAcceptedIssuers()
        {
          return new X509Certificate[0];
        }
      };
      SSLContext localSSLContext = SSLContext.getInstance("SSL");
      localSSLContext.init(null, arrayOfTrustManager, new SecureRandom());
      HttpsURLConnection.setDefaultSSLSocketFactory(localSSLContext.getSocketFactory());
      HttpsURLConnection.setDefaultHostnameVerifier(new HostnameVerifier()
      {
        public boolean verify(String paramAnonymousString, SSLSession paramAnonymousSSLSession)
        {
          return true;
        }
      });
      return;
    }
    catch (Exception localException)
    {
      LogUtils.errorLog(this.TAG, "Exception while executing code to trust all certificates: ", localException);
    }
  }
  
  public void onCreate()
  {
    super.onCreate();
    registerActivityLifecycleCallbacks(new LocalyticsActivityLifecycleCallbacks(this));
    try
    {
      WeMo.initialize("dummy_api_key", getApplicationContext());
      RMRulesSDK.init();
      if ("https://api.xbcs.net:8443".equals("https://devtest-1373897041.us-east-1.elb.amazonaws.com:8443"))
      {
        LogUtils.errorLog(this.TAG, "TRUSTING ALL CERTIFICATES. CURRENT CLOUD: https://api.xbcs.net:8443");
        trustAllCertificates();
      }
      return;
    }
    catch (WeMoInitException localWeMoInitException)
    {
      for (;;)
      {
        LogUtils.errorLog(this.TAG, "WeMoInitException while initializing WeMoSDK: ", localWeMoInitException);
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/application/WeMoApplication.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */