package com.belkin.remoteservice;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.os.AsyncTask;
import android.os.StrictMode;
import android.os.StrictMode.ThreadPolicy.Builder;
import com.belkin.utils.RuleUtility;
import com.belkin.utils.UploadFileUtil;
import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintStream;
import java.security.KeyManagementException;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.UnrecoverableKeyException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.HttpVersion;
import org.apache.http.StatusLine;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.ClientConnectionManager;
import org.apache.http.conn.params.ConnPerRouteBean;
import org.apache.http.conn.scheme.PlainSocketFactory;
import org.apache.http.conn.scheme.Scheme;
import org.apache.http.conn.scheme.SchemeRegistry;
import org.apache.http.entity.ByteArrayEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.conn.tsccm.ThreadSafeClientConnManager;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;
import org.apache.http.params.HttpProtocolParams;
import org.apache.http.util.ByteArrayBuffer;

public class RestfulWebservice
  extends AsyncTask<Void, Void, HttpResponseObject>
{
  private static Object objRequest = null;
  private String[] filesToBeZipped = new String[1];
  private HttpResponseObject httpResponseObj = new HttpResponseObject();
  private Context mContext;
  private int nRequestId = 0;
  private HttpGet objHttpGet = null;
  private HttpPost objHttpPost = null;
  private HttpResponseObject objHttpResponseObject = null;
  private INetworkObserver objINetworkObserver = null;
  private String pragmaUserVersion = "";
  private String[] reqParams;
  private RuleUtility ruleUtility;
  private String strBaseURL = "https://api.xbcs.net:8443/apis/http/plugin/";
  private String strBaseURLIcon = "https://api.xbcs.net:8443/apis/http/lswf/uploads/";
  private String strGetDBFile = "dbfile/";
  private String strSendFile = "sendfile/";
  private String strZippedDBFilePath = "";
  private UploadFileUtil uploadFileUtil;
  
  public RestfulWebservice(String[] paramArrayOfString, Context paramContext)
  {
    this.mContext = paramContext;
    this.reqParams = new String[paramArrayOfString.length];
    this.reqParams = paramArrayOfString;
    this.uploadFileUtil = new UploadFileUtil();
    this.ruleUtility = new RuleUtility(paramContext);
  }
  
  private HttpGet createGetDBFileRequest(String[] paramArrayOfString)
  {
    HttpGet localHttpGet = null;
    if (paramArrayOfString != null)
    {
      localHttpGet = new HttpGet(this.strBaseURL + this.strGetDBFile + paramArrayOfString[2]);
      localHttpGet.setHeader("Authorization", paramArrayOfString[1]);
    }
    return localHttpGet;
  }
  
  private HttpPost createIconSendFileRequest(String[] paramArrayOfString, Vector<?> paramVector)
  {
    HttpPost localHttpPost = new HttpPost(this.strBaseURLIcon + paramArrayOfString[4] + "?uploadType=" + paramArrayOfString[5]);
    localHttpPost.setHeader("Authorization", paramArrayOfString[1]);
    localHttpPost.setHeader("Accept", "application/json");
    localHttpPost.setHeader("Content-Type", "multipart/form-data;boundary=" + "----------------------------d27b405c366a");
    if ((paramVector != null) && (paramVector.size() > 0))
    {
      Object localObject = paramVector.get(0);
      if ((localObject instanceof byte[]))
      {
        byte[] arrayOfByte = (byte[])localObject;
        String str1 = "--" + "----------------------------d27b405c366a" + "\r\n";
        String str2 = "Content-Disposition:form-data;name=" + paramArrayOfString[6] + ";filename=" + paramArrayOfString[6] + "." + paramArrayOfString[7] + "\r\n";
        String str3 = "Content-Type:image/jpeg" + "\r\n";
        String str4 = "Content-Transfer-Encoding: binary" + "\r\n" + "\r\n";
        String str5 = "\r\n" + "--" + "----------------------------d27b405c366a" + "--" + "\r\n";
        ByteArrayBuffer localByteArrayBuffer = new ByteArrayBuffer(arrayOfByte.length);
        localByteArrayBuffer.append(str1.getBytes(), 0, str1.getBytes().length);
        localByteArrayBuffer.append(str2.getBytes(), 0, str2.getBytes().length);
        localByteArrayBuffer.append(str3.getBytes(), 0, str3.getBytes().length);
        localByteArrayBuffer.append(str4.getBytes(), 0, str4.getBytes().length);
        localByteArrayBuffer.append(arrayOfByte, 0, arrayOfByte.length);
        localByteArrayBuffer.append(str5.getBytes(), 0, str5.getBytes().length);
        localHttpPost.setEntity(new ByteArrayEntity((byte[])localByteArrayBuffer.toByteArray()));
      }
    }
    return localHttpPost;
  }
  
  private HttpPost createSendFileRequest(String[] paramArrayOfString, Vector<?> paramVector)
  {
    HttpPost localHttpPost = new HttpPost(this.strBaseURL + this.strSendFile + paramArrayOfString[2]);
    localHttpPost.setHeader("Authorization", paramArrayOfString[1]);
    localHttpPost.setHeader("Content-Type", "multipart/form-data;boundary=" + "=======djfsdfjscvjsdvjsd2367213======");
    if ((paramVector != null) && (paramVector.size() > 0))
    {
      Object localObject = paramVector.get(0);
      if ((localObject instanceof byte[]))
      {
        byte[] arrayOfByte = (byte[])localObject;
        String str1 = "--" + "=======djfsdfjscvjsdvjsd2367213======" + "\r\n";
        String str2 = "Content-Disposition:form-data;name=filedata;filename=rules.db" + "\r\n";
        String str3 = "Content-Type:application/octet-stream" + "\r\n" + "\r\n";
        String str4 = "\r\n" + "--" + "=======djfsdfjscvjsdvjsd2367213======" + "--" + "\r\n";
        ByteArrayBuffer localByteArrayBuffer = new ByteArrayBuffer(arrayOfByte.length);
        localByteArrayBuffer.append(str1.getBytes(), 0, str1.getBytes().length);
        localByteArrayBuffer.append(str2.getBytes(), 0, str2.getBytes().length);
        localByteArrayBuffer.append(str3.getBytes(), 0, str3.getBytes().length);
        localByteArrayBuffer.append(arrayOfByte, 0, arrayOfByte.length);
        localByteArrayBuffer.append(str4.getBytes(), 0, str4.getBytes().length);
        localHttpPost.setEntity(new ByteArrayEntity((byte[])localByteArrayBuffer.toByteArray()));
      }
    }
    return localHttpPost;
  }
  
  public static byte[] readData(InputStream paramInputStream)
  {
    ByteArrayBuffer localByteArrayBuffer;
    try
    {
      BufferedInputStream localBufferedInputStream = new BufferedInputStream(paramInputStream);
      localByteArrayBuffer = new ByteArrayBuffer(50);
      for (;;)
      {
        int i = localBufferedInputStream.read();
        if (i == -1) {
          break;
        }
        localByteArrayBuffer.append((byte)i);
      }
      localBufferedInputStream.close();
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
      return null;
    }
    paramInputStream.close();
    byte[] arrayOfByte = localByteArrayBuffer.toByteArray();
    return arrayOfByte;
  }
  
  private void setHttpObj(HttpResponseObject paramHttpResponseObject)
  {
    this.httpResponseObj = paramHttpResponseObject;
  }
  
  protected HttpResponseObject doInBackground(Void... paramVarArgs)
  {
    SchemeRegistry localSchemeRegistry = new SchemeRegistry();
    localSchemeRegistry.register(new Scheme("http", PlainSocketFactory.getSocketFactory(), 80));
    try
    {
      localSchemeRegistry.register(new Scheme("https", new SSLSocketFactoryImpl(null), 443));
      new ArrayList();
      StrictMode.setThreadPolicy(new StrictMode.ThreadPolicy.Builder().permitAll().build());
      BasicHttpParams localBasicHttpParams = new BasicHttpParams();
      localBasicHttpParams.setParameter("http.conn-manager.max-total", Integer.valueOf(30));
      localBasicHttpParams.setParameter("http.conn-manager.max-per-route", new ConnPerRouteBean(30));
      localBasicHttpParams.setParameter("http.protocol.expect-continue", Boolean.valueOf(false));
      HttpConnectionParams.setConnectionTimeout(localBasicHttpParams, 100000);
      HttpConnectionParams.setSoTimeout(localBasicHttpParams, 100000);
      if ((Integer.parseInt(this.reqParams[0]) == 5008) || (Integer.parseInt(this.reqParams[0]) == 5023)) {
        HttpProtocolParams.setContentCharset(localBasicHttpParams, "UTF-8");
      }
      HttpProtocolParams.setVersion(localBasicHttpParams, HttpVersion.HTTP_1_1);
      if (Integer.parseInt(this.reqParams[0]) == 5008)
      {
        RuleUtility localRuleUtility = this.ruleUtility;
        StringBuilder localStringBuilder = new StringBuilder();
        localRuleUtility.copyDataBase(RuleUtility.getLocalDBPath() + "pluginrules2.db", RuleUtility.getStoragePath() + "/" + "temppluginRules.db", "false");
        this.filesToBeZipped[0] = (RuleUtility.getStoragePath() + "/" + "temppluginRules.db");
        this.strZippedDBFilePath = this.ruleUtility.createLocalZippedDBFilePath();
        byte[] arrayOfByte4 = UploadFileUtil.readFile(this.strZippedDBFilePath);
        Vector localVector2 = new Vector();
        localVector2.add(arrayOfByte4);
        this.objHttpPost = createSendFileRequest(this.reqParams, localVector2);
        localThreadSafeClientConnManager = new ThreadSafeClientConnManager(localBasicHttpParams, localSchemeRegistry);
        localDefaultHttpClient = new DefaultHttpClient(localThreadSafeClientConnManager, localBasicHttpParams);
      }
      try
      {
        if (this.objHttpPost == null) {
          break label663;
        }
        localHttpResponse = localDefaultHttpClient.execute(this.objHttpPost);
        if (Integer.parseInt(this.reqParams[0]) == 5023) {
          break label691;
        }
        byte[] arrayOfByte3 = readData(localHttpResponse.getEntity().getContent());
        if (Integer.parseInt(this.reqParams[0]) == 5007) {
          this.pragmaUserVersion = this.uploadFileUtil.writeFile(arrayOfByte3, this.mContext);
        }
        this.httpResponseObj.setResponseCode(localHttpResponse.getStatusLine().getStatusCode());
        this.httpResponseObj.setPragmaVersion(this.pragmaUserVersion);
      }
      catch (ClientProtocolException localClientProtocolException)
      {
        for (;;)
        {
          HttpResponse localHttpResponse;
          byte[] arrayOfByte1;
          Vector localVector1;
          HttpGet localHttpGet;
          byte[] arrayOfByte2;
          new HashMap().put("WebServiceError", "ClientProtocolException in sendSecure");
          localDefaultHttpClient.getConnectionManager().shutdown();
          localThreadSafeClientConnManager.shutdown();
        }
      }
      catch (IOException localIOException)
      {
        for (;;)
        {
          this.pragmaUserVersion = this.ruleUtility.getPragmaVersion();
          this.httpResponseObj.setPragmaVersion(this.pragmaUserVersion);
          new HashMap().put("WebServiceError", "IOException in sendSecure ");
          localDefaultHttpClient.getConnectionManager().shutdown();
          localThreadSafeClientConnManager.shutdown();
        }
      }
      catch (Exception localException)
      {
        for (;;)
        {
          new HashMap().put("WebServiceError", "ServerAdressException in sendSecure ");
          localDefaultHttpClient.getConnectionManager().shutdown();
          localThreadSafeClientConnManager.shutdown();
        }
      }
      finally
      {
        localDefaultHttpClient.getConnectionManager().shutdown();
        localThreadSafeClientConnManager.shutdown();
      }
      return this.httpResponseObj;
    }
    catch (KeyManagementException localKeyManagementException)
    {
      for (;;)
      {
        localKeyManagementException.printStackTrace();
      }
    }
    catch (UnrecoverableKeyException localUnrecoverableKeyException)
    {
      for (;;)
      {
        localUnrecoverableKeyException.printStackTrace();
      }
    }
    catch (NoSuchAlgorithmException localNoSuchAlgorithmException)
    {
      for (;;)
      {
        localNoSuchAlgorithmException.printStackTrace();
      }
    }
    catch (KeyStoreException localKeyStoreException)
    {
      for (;;)
      {
        localKeyStoreException.printStackTrace();
        continue;
        if (Integer.parseInt(this.reqParams[0]) == 5007)
        {
          this.objHttpGet = createGetDBFileRequest(this.reqParams);
        }
        else if (Integer.parseInt(this.reqParams[0]) == 5023)
        {
          arrayOfByte1 = iconConvertion(this.reqParams[3]);
          localVector1 = new Vector();
          localVector1.add(arrayOfByte1);
          this.objHttpPost = createIconSendFileRequest(this.reqParams, localVector1);
          continue;
          label663:
          localHttpGet = this.objHttpGet;
          localHttpResponse = null;
          if (localHttpGet != null)
          {
            localHttpResponse = localDefaultHttpClient.execute(this.objHttpGet);
            continue;
            label691:
            this.httpResponseObj.setResponseCode(localHttpResponse.getStatusLine().getStatusCode());
            arrayOfByte2 = readData(localHttpResponse.getEntity().getContent());
            this.httpResponseObj.setDataReceived(arrayOfByte2);
          }
        }
      }
    }
  }
  
  public HttpResponseObject getHttpObj()
  {
    return this.httpResponseObj;
  }
  
  public byte[] iconConvertion(String paramString)
  {
    BitmapFactory.Options localOptions = new BitmapFactory.Options();
    localOptions.inSampleSize = 1;
    localOptions.inDither = false;
    String[] arrayOfString = paramString.split("/");
    String str1 = arrayOfString[(-1 + arrayOfString.length)];
    String str2 = "/storage/sdcard0/Android/data/com.belkin.wemoandroid/cache/" + str1;
    System.out.println("PATH*******" + str2);
    Bitmap localBitmap = BitmapFactory.decodeFile(str2, localOptions);
    if (localBitmap != null) {
      return UploadFileUtil.getByteArray(localBitmap);
    }
    return null;
  }
  
  protected void onPostExecute(HttpResponseObject paramHttpResponseObject)
  {
    super.onPostExecute(paramHttpResponseObject);
    setHttpObj(paramHttpResponseObject);
  }
  
  protected void onPreExecute()
  {
    super.onPreExecute();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/remoteservice/RestfulWebservice.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */