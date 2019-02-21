package com.belkin.cloud;

import android.content.ContentResolver;
import android.content.Context;
import android.content.res.AssetManager;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.net.Uri;
import android.util.Base64;
import android.util.Log;
import com.belkin.cloud.utils.HTTPUtils;
import com.belkin.utils.LogUtils;
import com.belkin.utils.UploadFileUtil;
import com.belkin.wemo.cache.utils.Constants;
import com.belkin.wemo.storage.FileStorage;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintStream;
import java.net.URI;
import java.net.URL;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CodingErrorAction;
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
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.scheme.Scheme;
import org.apache.http.conn.scheme.SchemeRegistry;
import org.apache.http.conn.ssl.SSLSocketFactory;
import org.apache.http.conn.ssl.X509HostnameVerifier;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.conn.SingleClientConnManager;

public class CloudServices
{
  public static final String TAG = "CloudServices";
  private static final String URL_GET_ICON = "https://api.xbcs.net:8443/apis/http/plugin/ext/deviceIcon/";
  private static final String URL_INSIGHT_PARAMS = "https://api.xbcs.net:8443/apis/http/plugin/insight/message/";
  private static final String URL_SET_ICON = "https://api.xbcs.net:8443/apis/http/plugin/ext/deviceIcon/";
  private static CloudServices mCloudServicesInstance = null;
  private static String urlRulesTng = "/apis/http/plugin/message/";
  private static String urlSerializationTracking = "/apis/http/device/retailerFilter";
  private HttpClient mClient = null;
  private Context mContext;
  
  public CloudServices(Context paramContext)
  {
    this.mContext = paramContext;
  }
  
  private String buildCloudUrl(String paramString)
  {
    return "https://api.xbcs.net:8443" + paramString;
  }
  
  private HttpPost buildPost(String paramString1, String paramString2)
  {
    HttpPost localHttpPost = new HttpPost(paramString1);
    localHttpPost.setHeader("Authorization", paramString2);
    localHttpPost.setHeader("Content-Type", "application/xml");
    return localHttpPost;
  }
  
  private void ensureClient()
  {
    if (this.mClient == null) {
      this.mClient = HTTPUtils.getCloudNewHttpClient(this.mContext);
    }
  }
  
  private String generateResetRequestNameIconRules(String paramString1, String paramString2)
  {
    return "<plugins><plugin><recipientId>" + paramString2 + "</recipientId>" + "<macAddress>" + paramString1 + "</macAddress>" + "<content>" + "<![CDATA[<resetNameRulesData><plugin><macAddress>" + paramString1 + "</macAddress><resetType>1</resetType></plugin></resetNameRulesData>]]>" + "</content>" + "</plugin></plugins>";
  }
  
  private String generateXMLRequest(String paramString1, String paramString2, String paramString3)
  {
    String str1 = paramString1.replace("<!", "&lt;!").replace("]>", "]&gt;");
    String str2 = "<plugins><plugin><recipientId>" + paramString2 + "</recipientId>" + "<macAddress>" + paramString3 + "</macAddress>" + "<content>" + "<![CDATA[ " + "<pluginId>" + paramString2 + "</pluginId>" + "<macAddress>" + paramString3 + "</macAddress>" + "<status>0</status>" + str1 + "]]>" + "</content>" + "</plugin></plugins>";
    Log.v("REMOTE", "REQUEST: " + str2);
    return str2;
  }
  
  private String generateXMLSerTrackingRequest(String paramString1, String paramString2, String paramString3)
  {
    String str = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" + paramString1;
    Log.v("REMOTE", "REQUEST: " + str);
    return str;
  }
  
  public static CloudServices getInstance(Context paramContext)
  {
    try
    {
      if (mCloudServicesInstance == null) {
        mCloudServicesInstance = new CloudServices(paramContext);
      }
      CloudServices localCloudServices = mCloudServicesInstance;
      return localCloudServices;
    }
    finally {}
  }
  
  private String getResponseString(HttpResponse paramHttpResponse)
  {
    InputStream localInputStream = null;
    for (;;)
    {
      try
      {
        localInputStream = paramHttpResponse.getEntity().getContent();
        localByteArrayOutputStream = new ByteArrayOutputStream();
        try
        {
          byte[] arrayOfByte = new byte['Ѐ'];
          int i = localInputStream.read(arrayOfByte);
          if (i == -1) {
            continue;
          }
          localByteArrayOutputStream.write(arrayOfByte, 0, i);
          continue;
          str = null;
        }
        catch (Exception localException2) {}
      }
      catch (Exception localException1)
      {
        ByteArrayOutputStream localByteArrayOutputStream;
        String str;
        continue;
      }
      if (localInputStream != null) {}
      try
      {
        localInputStream.close();
        return str;
      }
      catch (IOException localIOException)
      {
        CharsetDecoder localCharsetDecoder;
        return str;
      }
      localCharsetDecoder = Charset.forName("UTF-8").newDecoder();
      localCharsetDecoder.onMalformedInput(CodingErrorAction.IGNORE);
      localCharsetDecoder.onUnmappableCharacter(CodingErrorAction.IGNORE);
      str = localCharsetDecoder.decode(ByteBuffer.wrap(localByteArrayOutputStream.toByteArray())).toString().replace("\r", "").replace("\n", "").replace("&lt;", "<").replace("&gt;", ">");
      localByteArrayOutputStream.close();
    }
  }
  
  private TrustManager[] get_trust_mgr()
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
          LogUtils.errorLog("CloudServices", "CertificateExpiredException");
          throw new CertificateException("CertificateExpiredException");
        }
        catch (CertificateNotYetValidException localCertificateNotYetValidException)
        {
          LogUtils.errorLog("CloudServices", "CertificateNotYetValidException");
          throw new CertificateException("CertificateNotYetValidException");
        }
      }
      
      public X509Certificate[] getAcceptedIssuers()
      {
        return null;
      }
    };
    return arrayOfTrustManager;
  }
  
  /* Error */
  private int makeRequest(String paramString1, String paramString2, String paramString3)
  {
    // Byte code:
    //   0: aload_3
    //   1: iconst_2
    //   2: invokevirtual 253	java/lang/String:substring	(I)Ljava/lang/String;
    //   5: astore 5
    //   7: new 255	java/net/URL
    //   10: dup
    //   11: aload_1
    //   12: invokespecial 256	java/net/URL:<init>	(Ljava/lang/String;)V
    //   15: astore 6
    //   17: ldc_w 258
    //   20: invokestatic 263	javax/net/ssl/SSLContext:getInstance	(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;
    //   23: astore 7
    //   25: aload 7
    //   27: aconst_null
    //   28: aconst_null
    //   29: new 265	java/security/SecureRandom
    //   32: dup
    //   33: invokespecial 266	java/security/SecureRandom:<init>	()V
    //   36: invokevirtual 270	javax/net/ssl/SSLContext:init	([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V
    //   39: aload 6
    //   41: invokevirtual 274	java/net/URL:openConnection	()Ljava/net/URLConnection;
    //   44: checkcast 276	javax/net/ssl/HttpsURLConnection
    //   47: astore 8
    //   49: aload 8
    //   51: aload 7
    //   53: invokevirtual 280	javax/net/ssl/SSLContext:getSocketFactory	()Ljavax/net/ssl/SSLSocketFactory;
    //   56: invokevirtual 284	javax/net/ssl/HttpsURLConnection:setSSLSocketFactory	(Ljavax/net/ssl/SSLSocketFactory;)V
    //   59: aload 8
    //   61: ldc_w 286
    //   64: ldc 75
    //   66: invokevirtual 289	javax/net/ssl/HttpsURLConnection:setRequestProperty	(Ljava/lang/String;Ljava/lang/String;)V
    //   69: aload 8
    //   71: ldc 67
    //   73: aload 5
    //   75: invokevirtual 289	javax/net/ssl/HttpsURLConnection:setRequestProperty	(Ljava/lang/String;Ljava/lang/String;)V
    //   78: aload 8
    //   80: iconst_1
    //   81: invokevirtual 293	javax/net/ssl/HttpsURLConnection:setDoOutput	(Z)V
    //   84: aload 8
    //   86: iconst_0
    //   87: invokevirtual 297	javax/net/ssl/HttpsURLConnection:setChunkedStreamingMode	(I)V
    //   90: aload 8
    //   92: ldc_w 299
    //   95: invokevirtual 302	javax/net/ssl/HttpsURLConnection:setRequestMethod	(Ljava/lang/String;)V
    //   98: aload 8
    //   100: invokevirtual 306	javax/net/ssl/HttpsURLConnection:getOutputStream	()Ljava/io/OutputStream;
    //   103: astore 9
    //   105: aload 9
    //   107: aload_2
    //   108: invokevirtual 309	java/lang/String:getBytes	()[B
    //   111: invokevirtual 314	java/io/OutputStream:write	([B)V
    //   114: aload 9
    //   116: invokevirtual 317	java/io/OutputStream:flush	()V
    //   119: aload 9
    //   121: invokevirtual 318	java/io/OutputStream:close	()V
    //   124: aload 8
    //   126: invokevirtual 322	javax/net/ssl/HttpsURLConnection:getResponseCode	()I
    //   129: istore 10
    //   131: iload 10
    //   133: ireturn
    //   134: astore 4
    //   136: aload 4
    //   138: invokevirtual 325	java/lang/Exception:printStackTrace	()V
    //   141: iconst_0
    //   142: ireturn
    //   143: astore 4
    //   145: goto -9 -> 136
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	148	0	this	CloudServices
    //   0	148	1	paramString1	String
    //   0	148	2	paramString2	String
    //   0	148	3	paramString3	String
    //   134	3	4	localException1	Exception
    //   143	1	4	localException2	Exception
    //   5	69	5	str	String
    //   15	25	6	localURL	URL
    //   23	29	7	localSSLContext	SSLContext
    //   47	78	8	localHttpsURLConnection	HttpsURLConnection
    //   103	17	9	localOutputStream	OutputStream
    //   129	3	10	i	int
    // Exception table:
    //   from	to	target	type
    //   0	17	134	java/lang/Exception
    //   17	131	143	java/lang/Exception
  }
  
  public String getDeviceIconBase64(String paramString1, String paramString2)
  {
    localObject1 = "";
    localHttpsURLConnection = null;
    try
    {
      URL localURL = new URL("https://api.xbcs.net:8443/apis/http/plugin/ext/deviceIcon/" + paramString1);
      SSLContext localSSLContext = SSLContext.getInstance("TLS");
      localSSLContext.init(null, get_trust_mgr(), new SecureRandom());
      HttpsURLConnection.setDefaultSSLSocketFactory(localSSLContext.getSocketFactory());
      final String str1 = localURL.getHost();
      localHttpsURLConnection = (HttpsURLConnection)localURL.openConnection();
      localHttpsURLConnection.setRequestMethod("GET");
      localHttpsURLConnection.setHostnameVerifier(new HostnameVerifier()
      {
        public boolean verify(String paramAnonymousString, SSLSession paramAnonymousSSLSession)
        {
          return paramAnonymousString.equals(str1);
        }
      });
      localHttpsURLConnection.setRequestProperty("Content-type", "application/xml");
      localHttpsURLConnection.setRequestProperty("Authorization", paramString2);
      localHttpsURLConnection.setDoOutput(true);
      if (localHttpsURLConnection.getResponseCode() == 200)
      {
        byte[] arrayOfByte = new byte[localHttpsURLConnection.getContentLength()];
        BufferedInputStream localBufferedInputStream = new BufferedInputStream(localHttpsURLConnection.getInputStream());
        for (int i = 0;; i++)
        {
          int j = localBufferedInputStream.read();
          if (j == -1) {
            break;
          }
          arrayOfByte[i] = ((byte)j);
        }
        localBufferedInputStream.close();
        String str2 = Base64.encodeToString(arrayOfByte, 2);
        localObject1 = str2;
      }
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
      return (String)localObject1;
    }
    finally
    {
      if (localHttpsURLConnection == null) {
        break label254;
      }
      localHttpsURLConnection.disconnect();
    }
    return (String)localObject1;
  }
  
  public String getDeviceIconFromCloudURL(String paramString1, String paramString2, String paramString3, String paramString4)
  {
    String str = "";
    try
    {
      DefaultHttpClient localDefaultHttpClient1 = new DefaultHttpClient();
      SchemeRegistry localSchemeRegistry = new SchemeRegistry();
      SSLSocketFactory localSSLSocketFactory = SSLSocketFactory.getSocketFactory();
      if (Constants.isStaging())
      {
        X509HostnameVerifier localX509HostnameVerifier = SSLSocketFactory.ALLOW_ALL_HOSTNAME_VERIFIER;
        localSSLSocketFactory.setHostnameVerifier((X509HostnameVerifier)localX509HostnameVerifier);
        HttpsURLConnection.setDefaultHostnameVerifier(localX509HostnameVerifier);
      }
      Scheme localScheme = new Scheme("https", localSSLSocketFactory, 8443);
      localSchemeRegistry.register(localScheme);
      DefaultHttpClient localDefaultHttpClient2 = new DefaultHttpClient(new SingleClientConnManager(localDefaultHttpClient1.getParams(), localSchemeRegistry), localDefaultHttpClient1.getParams());
      HttpGet localHttpGet = new HttpGet();
      localHttpGet.setURI(new URI("https://api.xbcs.net:8443/apis/http/plugin/ext/deviceIcon/" + paramString1));
      localHttpGet.addHeader("content-type", "application/xml");
      localHttpGet.addHeader("Authorization", paramString4);
      localHttpGet.addHeader("Accept", "application/xml");
      HttpResponse localHttpResponse = localDefaultHttpClient2.execute(localHttpGet);
      int i = (int)localHttpResponse.getEntity().getContentLength();
      int j = localHttpResponse.getStatusLine().getStatusCode();
      System.out.println("ACTION_GET_ICON_FROM_CLOUD contentLen:: " + i + " mac: " + paramString1 + " status:" + j);
      if (j == 200)
      {
        byte[] arrayOfByte1 = new byte[i];
        BufferedInputStream localBufferedInputStream = new BufferedInputStream(localHttpResponse.getEntity().getContent());
        for (int k = 0;; k++)
        {
          int m = localBufferedInputStream.read();
          if (m == -1) {
            break;
          }
          arrayOfByte1[k] = ((byte)m);
        }
        localBufferedInputStream.close();
        byte[] arrayOfByte2 = new byte[k];
        System.arraycopy(arrayOfByte1, 0, arrayOfByte2, 0, k);
        System.out.println("dataBuf1 length:: " + arrayOfByte2.length + " j: " + k);
        str = FileStorage.getInstance(this.mContext).storeIcon(arrayOfByte1, paramString2, paramString3);
        Log.v("CloudServices", "ACTION_GET_ICON_FROM_CLOUD: " + paramString1 + " status: " + j + " result: " + str);
      }
      return str;
    }
    catch (Exception localException)
    {
      localException = localException;
      Log.e("CloudServices", "ACTION_GET_ICON_FROM_CLOUD exception: " + localException.getMessage() + " mac: " + paramString1);
      localException.printStackTrace();
      return str;
    }
    finally {}
  }
  
  public String getSerializationTracking(String paramString1, String paramString2, String paramString3, String paramString4, String paramString5)
  {
    if (paramString5.equals("")) {}
    for (String str = buildCloudUrl(urlSerializationTracking);; str = paramString5) {
      return sendRequestGeneric(paramString1, paramString2, paramString3, paramString4, str);
    }
  }
  
  public boolean putDeviceIcon(String paramString1, String paramString2, String paramString3)
  {
    BitmapFactory.Options localOptions = new BitmapFactory.Options();
    localOptions.inSampleSize = 1;
    localOptions.inDither = false;
    OutputStream localOutputStream = null;
    HttpsURLConnection localHttpsURLConnection = null;
    String str1 = paramString3.substring(2);
    for (;;)
    {
      try
      {
        Bitmap localBitmap;
        BufferedOutputStream localBufferedOutputStream;
        int i;
        BufferedReader localBufferedReader;
        String str2;
        if (paramString2.toString().startsWith("file:///android_asset/"))
        {
          localBitmap = BitmapFactory.decodeStream(this.mContext.getAssets().open(paramString2.toString().replace("file:///android_asset/", "")), null, localOptions);
          URL localURL = new URL("https://api.xbcs.net:8443/apis/http/plugin/ext/deviceIcon/" + paramString1);
          SSLContext localSSLContext = SSLContext.getInstance("TLS");
          localSSLContext.init(null, null, new SecureRandom());
          localHttpsURLConnection = (HttpsURLConnection)localURL.openConnection();
          localHttpsURLConnection.setSSLSocketFactory(localSSLContext.getSocketFactory());
          localHttpsURLConnection.setRequestProperty("Authorization", str1);
          localHttpsURLConnection.setRequestProperty("Connection", "Keep-Alive");
          localHttpsURLConnection.setRequestProperty("Content-Type", "multipart/form-data;boundary=" + "=======djfsdfjscvjsdvjsd2367213======");
          localHttpsURLConnection.setDoOutput(true);
          localHttpsURLConnection.setChunkedStreamingMode(0);
          localHttpsURLConnection.setRequestMethod("POST");
          localOutputStream = localHttpsURLConnection.getOutputStream();
          localBufferedOutputStream = new BufferedOutputStream(localOutputStream);
          localBufferedOutputStream.write(UploadFileUtil.getByteArray(localBitmap));
          i = localHttpsURLConnection.getResponseCode();
          if (i != 200) {
            continue;
          }
          localBufferedReader = new BufferedReader(new InputStreamReader(localHttpsURLConnection.getInputStream()));
          str2 = "";
          String str3 = localBufferedReader.readLine();
          if (str3 != null)
          {
            str2 = str2 + str3;
            continue;
          }
        }
        else
        {
          localBitmap = BitmapFactory.decodeStream(this.mContext.getContentResolver().openInputStream(Uri.parse(paramString2)), null, localOptions);
          continue;
        }
        localBufferedReader.close();
        Log.v("CloudServices", "ACTION_SET_ICON_TO_CLOUD: XML RESULT " + str2 + " code: " + i);
        localBufferedOutputStream.flush();
        localOutputStream.flush();
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
        if (localHttpsURLConnection == null) {
          continue;
        }
        localHttpsURLConnection.disconnect();
        if (localOutputStream == null) {
          continue;
        }
        try
        {
          localOutputStream.close();
          return false;
        }
        catch (IOException localIOException2)
        {
          localIOException2.printStackTrace();
          return false;
        }
      }
      finally
      {
        if (localHttpsURLConnection == null) {
          continue;
        }
        localHttpsURLConnection.disconnect();
        if (localOutputStream == null) {
          break label490;
        }
      }
      try
      {
        localOutputStream.close();
        return false;
      }
      catch (IOException localIOException3)
      {
        localIOException3.printStackTrace();
        return false;
      }
    }
    try
    {
      localOutputStream.close();
      label490:
      throw ((Throwable)localObject);
    }
    catch (IOException localIOException1)
    {
      for (;;)
      {
        localIOException1.printStackTrace();
      }
    }
  }
  
  public boolean resetNameIconRules(String paramString1, String paramString2, String paramString3)
  {
    return makeRequest("https://api.xbcs.net:8443/apis/http/plugin/insight/message/", generateResetRequestNameIconRules(paramString1, paramString2), paramString3) == 200;
  }
  
  public String sendRequest(String paramString1, String paramString2, String paramString3, String paramString4)
  {
    return sendRequestGeneric(paramString1, paramString2, paramString3, paramString4, buildCloudUrl(urlRulesTng));
  }
  
  /* Error */
  public String sendRequestGeneric(String paramString1, String paramString2, String paramString3, String paramString4, String paramString5)
  {
    // Byte code:
    //   0: ldc -29
    //   2: astore 6
    //   4: aconst_null
    //   5: astore 7
    //   7: aload_0
    //   8: invokespecial 619	com/belkin/cloud/CloudServices:ensureClient	()V
    //   11: ldc -29
    //   13: astore 13
    //   15: aload 5
    //   17: getstatic 35	com/belkin/cloud/CloudServices:urlSerializationTracking	Ljava/lang/String;
    //   20: invokevirtual 623	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   23: istore 14
    //   25: aconst_null
    //   26: astore 7
    //   28: iload 14
    //   30: ifeq +105 -> 135
    //   33: aload_0
    //   34: aload_1
    //   35: aload_3
    //   36: aload 4
    //   38: invokespecial 625	com/belkin/cloud/CloudServices:generateXMLSerTrackingRequest	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    //   41: astore 13
    //   43: aload_0
    //   44: aload 5
    //   46: aload_2
    //   47: invokespecial 627	com/belkin/cloud/CloudServices:buildPost	(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/client/methods/HttpPost;
    //   50: astore 15
    //   52: aload 15
    //   54: new 629	org/apache/http/entity/StringEntity
    //   57: dup
    //   58: aload 13
    //   60: ldc -75
    //   62: invokespecial 631	org/apache/http/entity/StringEntity:<init>	(Ljava/lang/String;Ljava/lang/String;)V
    //   65: invokevirtual 635	org/apache/http/client/methods/HttpPost:setEntity	(Lorg/apache/http/HttpEntity;)V
    //   68: aload_0
    //   69: getfield 41	com/belkin/cloud/CloudServices:mClient	Lorg/apache/http/client/HttpClient;
    //   72: aload 15
    //   74: invokeinterface 636 2 0
    //   79: astore 7
    //   81: aload 7
    //   83: invokeinterface 452 1 0
    //   88: invokeinterface 457 1 0
    //   93: sipush 200
    //   96: if_icmpne +74 -> 170
    //   99: aload_0
    //   100: aload 7
    //   102: invokespecial 638	com/belkin/cloud/CloudServices:getResponseString	(Lorg/apache/http/HttpResponse;)Ljava/lang/String;
    //   105: astore 17
    //   107: aload 17
    //   109: astore 6
    //   111: aload 7
    //   113: ifnull +15 -> 128
    //   116: aload 7
    //   118: invokeinterface 157 1 0
    //   123: invokeinterface 641 1 0
    //   128: aload 6
    //   130: astore 12
    //   132: aload 12
    //   134: areturn
    //   135: aload 5
    //   137: getstatic 31	com/belkin/cloud/CloudServices:urlRulesTng	Ljava/lang/String;
    //   140: invokevirtual 623	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   143: istore 19
    //   145: aconst_null
    //   146: astore 7
    //   148: iload 19
    //   150: ifeq -107 -> 43
    //   153: aload_0
    //   154: aload_1
    //   155: aload_3
    //   156: aload 4
    //   158: invokespecial 643	com/belkin/cloud/CloudServices:generateXMLRequest	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    //   161: astore 20
    //   163: aload 20
    //   165: astore 13
    //   167: goto -124 -> 43
    //   170: aconst_null
    //   171: astore 12
    //   173: aload 7
    //   175: ifnull -43 -> 132
    //   178: aload 7
    //   180: invokeinterface 157 1 0
    //   185: invokeinterface 641 1 0
    //   190: aconst_null
    //   191: areturn
    //   192: astore 16
    //   194: aconst_null
    //   195: areturn
    //   196: astore 10
    //   198: aload 10
    //   200: invokevirtual 325	java/lang/Exception:printStackTrace	()V
    //   203: aload 7
    //   205: ifnull -77 -> 128
    //   208: aload 7
    //   210: invokeinterface 157 1 0
    //   215: invokeinterface 641 1 0
    //   220: goto -92 -> 128
    //   223: astore 11
    //   225: goto -97 -> 128
    //   228: astore 8
    //   230: aload 7
    //   232: ifnull +15 -> 247
    //   235: aload 7
    //   237: invokeinterface 157 1 0
    //   242: invokeinterface 641 1 0
    //   247: aload 8
    //   249: athrow
    //   250: astore 9
    //   252: goto -5 -> 247
    //   255: astore 18
    //   257: goto -129 -> 128
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	260	0	this	CloudServices
    //   0	260	1	paramString1	String
    //   0	260	2	paramString2	String
    //   0	260	3	paramString3	String
    //   0	260	4	paramString4	String
    //   0	260	5	paramString5	String
    //   2	127	6	localObject1	Object
    //   5	231	7	localHttpResponse	HttpResponse
    //   228	20	8	localObject2	Object
    //   250	1	9	localIOException1	IOException
    //   196	3	10	localException	Exception
    //   223	1	11	localIOException2	IOException
    //   130	42	12	localObject3	Object
    //   13	153	13	localObject4	Object
    //   23	6	14	bool1	boolean
    //   50	23	15	localHttpPost	HttpPost
    //   192	1	16	localIOException3	IOException
    //   105	3	17	str1	String
    //   255	1	18	localIOException4	IOException
    //   143	6	19	bool2	boolean
    //   161	3	20	str2	String
    // Exception table:
    //   from	to	target	type
    //   178	190	192	java/io/IOException
    //   7	11	196	java/lang/Exception
    //   15	25	196	java/lang/Exception
    //   33	43	196	java/lang/Exception
    //   43	107	196	java/lang/Exception
    //   135	145	196	java/lang/Exception
    //   153	163	196	java/lang/Exception
    //   208	220	223	java/io/IOException
    //   7	11	228	finally
    //   15	25	228	finally
    //   33	43	228	finally
    //   43	107	228	finally
    //   135	145	228	finally
    //   153	163	228	finally
    //   198	203	228	finally
    //   235	247	250	java/io/IOException
    //   116	128	255	java/io/IOException
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/cloud/CloudServices.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */