package com.loopj.android.http;

import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.io.IOException;
import java.net.Socket;
import java.security.KeyManagementException;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.UnrecoverableKeyException;
import java.security.cert.CertificateException;
import java.security.cert.CertificateExpiredException;
import java.security.cert.CertificateNotYetValidException;
import java.security.cert.X509Certificate;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import org.apache.http.HttpVersion;
import org.apache.http.conn.scheme.PlainSocketFactory;
import org.apache.http.conn.scheme.Scheme;
import org.apache.http.conn.scheme.SchemeRegistry;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.conn.tsccm.ThreadSafeClientConnManager;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpProtocolParams;

public class MySSLSocketFactory
  extends org.apache.http.conn.ssl.SSLSocketFactory
{
  private static final String TAG = MySSLSocketFactory.class.getSimpleName();
  SSLContext sslContext = SSLContext.getInstance("TLS");
  
  public MySSLSocketFactory(KeyStore paramKeyStore)
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
          SDKLogUtils.errorLog(MySSLSocketFactory.TAG, "CertificateExpiredException");
          throw new CertificateException("CertificateExpiredException");
        }
        catch (CertificateNotYetValidException localCertificateNotYetValidException)
        {
          SDKLogUtils.errorLog(MySSLSocketFactory.TAG, "CertificateNotYetValidException");
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
  
  public static org.apache.http.conn.ssl.SSLSocketFactory getFixedSocketFactory()
  {
    try
    {
      MySSLSocketFactory localMySSLSocketFactory = new MySSLSocketFactory(getKeystore());
      localMySSLSocketFactory.setHostnameVerifier(org.apache.http.conn.ssl.SSLSocketFactory.ALLOW_ALL_HOSTNAME_VERIFIER);
      return localMySSLSocketFactory;
    }
    catch (Throwable localThrowable)
    {
      localThrowable.printStackTrace();
    }
    return org.apache.http.conn.ssl.SSLSocketFactory.getSocketFactory();
  }
  
  public static KeyStore getKeystore()
  {
    KeyStore localKeyStore = null;
    try
    {
      localKeyStore = KeyStore.getInstance(KeyStore.getDefaultType());
      localKeyStore.load(null, null);
      return localKeyStore;
    }
    catch (Throwable localThrowable)
    {
      localThrowable.printStackTrace();
    }
    return localKeyStore;
  }
  
  /* Error */
  public static KeyStore getKeystoreOfCA(java.io.InputStream paramInputStream)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore_1
    //   2: ldc 97
    //   4: invokestatic 102	java/security/cert/CertificateFactory:getInstance	(Ljava/lang/String;)Ljava/security/cert/CertificateFactory;
    //   7: astore 10
    //   9: new 104	java/io/BufferedInputStream
    //   12: dup
    //   13: aload_0
    //   14: invokespecial 107	java/io/BufferedInputStream:<init>	(Ljava/io/InputStream;)V
    //   17: astore 11
    //   19: aload 10
    //   21: aload 11
    //   23: invokevirtual 111	java/security/cert/CertificateFactory:generateCertificate	(Ljava/io/InputStream;)Ljava/security/cert/Certificate;
    //   26: astore 12
    //   28: aload 12
    //   30: astore 5
    //   32: aload 11
    //   34: ifnull +8 -> 42
    //   37: aload 11
    //   39: invokevirtual 116	java/io/InputStream:close	()V
    //   42: invokestatic 80	java/security/KeyStore:getDefaultType	()Ljava/lang/String;
    //   45: astore 7
    //   47: aconst_null
    //   48: astore 8
    //   50: aload 7
    //   52: invokestatic 83	java/security/KeyStore:getInstance	(Ljava/lang/String;)Ljava/security/KeyStore;
    //   55: astore 8
    //   57: aload 8
    //   59: aconst_null
    //   60: aconst_null
    //   61: invokevirtual 87	java/security/KeyStore:load	(Ljava/io/InputStream;[C)V
    //   64: aload 8
    //   66: ldc 118
    //   68: aload 5
    //   70: invokevirtual 122	java/security/KeyStore:setCertificateEntry	(Ljava/lang/String;Ljava/security/cert/Certificate;)V
    //   73: aload 8
    //   75: areturn
    //   76: astore 13
    //   78: aload 13
    //   80: invokevirtual 123	java/io/IOException:printStackTrace	()V
    //   83: goto -41 -> 42
    //   86: astore 4
    //   88: aload 4
    //   90: invokevirtual 124	java/security/cert/CertificateException:printStackTrace	()V
    //   93: aconst_null
    //   94: astore 5
    //   96: aload_1
    //   97: ifnull -55 -> 42
    //   100: aload_1
    //   101: invokevirtual 116	java/io/InputStream:close	()V
    //   104: aconst_null
    //   105: astore 5
    //   107: goto -65 -> 42
    //   110: astore 6
    //   112: aload 6
    //   114: invokevirtual 123	java/io/IOException:printStackTrace	()V
    //   117: aconst_null
    //   118: astore 5
    //   120: goto -78 -> 42
    //   123: astore_2
    //   124: aload_1
    //   125: ifnull +7 -> 132
    //   128: aload_1
    //   129: invokevirtual 116	java/io/InputStream:close	()V
    //   132: aload_2
    //   133: athrow
    //   134: astore_3
    //   135: aload_3
    //   136: invokevirtual 123	java/io/IOException:printStackTrace	()V
    //   139: goto -7 -> 132
    //   142: astore 9
    //   144: aload 9
    //   146: invokevirtual 125	java/lang/Exception:printStackTrace	()V
    //   149: aload 8
    //   151: areturn
    //   152: astore_2
    //   153: aload 11
    //   155: astore_1
    //   156: goto -32 -> 124
    //   159: astore 4
    //   161: aload 11
    //   163: astore_1
    //   164: goto -76 -> 88
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	167	0	paramInputStream	java.io.InputStream
    //   1	163	1	localObject1	Object
    //   123	10	2	localObject2	Object
    //   152	1	2	localObject3	Object
    //   134	2	3	localIOException1	IOException
    //   86	3	4	localCertificateException1	CertificateException
    //   159	1	4	localCertificateException2	CertificateException
    //   30	89	5	localCertificate1	java.security.cert.Certificate
    //   110	3	6	localIOException2	IOException
    //   45	6	7	str	String
    //   48	102	8	localKeyStore	KeyStore
    //   142	3	9	localException	Exception
    //   7	13	10	localCertificateFactory	java.security.cert.CertificateFactory
    //   17	145	11	localBufferedInputStream	java.io.BufferedInputStream
    //   26	3	12	localCertificate2	java.security.cert.Certificate
    //   76	3	13	localIOException3	IOException
    // Exception table:
    //   from	to	target	type
    //   37	42	76	java/io/IOException
    //   2	19	86	java/security/cert/CertificateException
    //   100	104	110	java/io/IOException
    //   2	19	123	finally
    //   88	93	123	finally
    //   128	132	134	java/io/IOException
    //   50	73	142	java/lang/Exception
    //   19	28	152	finally
    //   19	28	159	java/security/cert/CertificateException
  }
  
  public static DefaultHttpClient getNewHttpClient(KeyStore paramKeyStore)
  {
    try
    {
      MySSLSocketFactory localMySSLSocketFactory = new MySSLSocketFactory(paramKeyStore);
      SchemeRegistry localSchemeRegistry = new SchemeRegistry();
      localSchemeRegistry.register(new Scheme("http", PlainSocketFactory.getSocketFactory(), 80));
      localSchemeRegistry.register(new Scheme("https", localMySSLSocketFactory, 443));
      BasicHttpParams localBasicHttpParams = new BasicHttpParams();
      HttpProtocolParams.setVersion(localBasicHttpParams, HttpVersion.HTTP_1_1);
      HttpProtocolParams.setContentCharset(localBasicHttpParams, "UTF-8");
      DefaultHttpClient localDefaultHttpClient = new DefaultHttpClient(new ThreadSafeClientConnManager(localBasicHttpParams, localSchemeRegistry), localBasicHttpParams);
      return localDefaultHttpClient;
    }
    catch (Exception localException) {}
    return new DefaultHttpClient();
  }
  
  public Socket createSocket()
    throws IOException
  {
    return this.sslContext.getSocketFactory().createSocket();
  }
  
  public Socket createSocket(Socket paramSocket, String paramString, int paramInt, boolean paramBoolean)
    throws IOException
  {
    return this.sslContext.getSocketFactory().createSocket(paramSocket, paramString, paramInt, paramBoolean);
  }
  
  public void fixHttpsURLConnection()
  {
    HttpsURLConnection.setDefaultSSLSocketFactory(this.sslContext.getSocketFactory());
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/loopj/android/http/MySSLSocketFactory.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */