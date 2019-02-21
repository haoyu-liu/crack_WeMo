package com.belkin.cloud.utils;

import com.belkin.utils.LogUtils;
import java.io.IOException;
import java.net.Socket;
import java.net.UnknownHostException;
import java.security.KeyManagementException;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.UnrecoverableKeyException;
import java.security.cert.CertificateException;
import java.security.cert.CertificateExpiredException;
import java.security.cert.CertificateNotYetValidException;
import java.security.cert.X509Certificate;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

public class EasySSLSocketFactory
  extends org.apache.http.conn.ssl.SSLSocketFactory
{
  private static final String TAG = EasySSLSocketFactory.class.getSimpleName();
  SSLContext sslContext = SSLContext.getInstance("TLS");
  
  public EasySSLSocketFactory(KeyStore paramKeyStore)
    throws NoSuchAlgorithmException, KeyManagementException, KeyStoreException, UnrecoverableKeyException
  {
    super(paramKeyStore);
    X509TrustManager local1 = new X509TrustManager()
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
          LogUtils.errorLog(EasySSLSocketFactory.TAG, "CertificateExpiredException");
          throw new CertificateException("CertificateExpiredException");
        }
        catch (CertificateNotYetValidException localCertificateNotYetValidException)
        {
          LogUtils.errorLog(EasySSLSocketFactory.TAG, "CertificateNotYetValidException");
          throw new CertificateException("CertificateNotYetValidException");
        }
      }
      
      public X509Certificate[] getAcceptedIssuers()
      {
        return null;
      }
    };
    this.sslContext.init(null, new TrustManager[] { local1 }, null);
  }
  
  public Socket createSocket()
    throws IOException
  {
    return this.sslContext.getSocketFactory().createSocket();
  }
  
  public Socket createSocket(Socket paramSocket, String paramString, int paramInt, boolean paramBoolean)
    throws IOException, UnknownHostException
  {
    return this.sslContext.getSocketFactory().createSocket(paramSocket, paramString, paramInt, paramBoolean);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/cloud/utils/EasySSLSocketFactory.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */