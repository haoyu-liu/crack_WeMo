package com.belkin.wemo.push.cloud.runnable;

import android.content.Context;
import android.text.TextUtils;
import android.util.Base64;
import com.belkin.cloud.utils.HTTPUtils;
import com.belkin.utils.LogUtils;
import com.belkin.utils.WiFiSecurityUtil;
import com.belkin.wemo.cache.utils.SharePreferences;
import com.belkin.wemo.push.error.PushNotificationError;
import com.belkin.wemo.runnable.WeMoRunnable;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;

public abstract class WeMoCloudPushAbstractRunnable
  extends WeMoRunnable
{
  private Context context;
  protected String registrationId;
  
  public WeMoCloudPushAbstractRunnable(Context paramContext, String paramString)
  {
    this.context = paramContext;
    this.registrationId = paramString;
  }
  
  private String getAuthHeader()
    throws NoSuchAlgorithmException, InvalidKeyException
  {
    SharePreferences localSharePreferences = new SharePreferences(this.context);
    WiFiSecurityUtil localWiFiSecurityUtil = new WiFiSecurityUtil();
    String str1 = new String();
    long l = 200L + System.currentTimeMillis() / 1000L;
    String str2 = localWiFiSecurityUtil.getDeviceID(this.context);
    String str3 = str2 + "\n" + "\n" + l;
    String str4 = localSharePreferences.getPrivateKey();
    String str5 = localSharePreferences.getHomeId();
    LogUtils.infoLog(this.TAG, "Push Notification: UniqueID = " + str2 + ", Private Key = " + str4 + ", HomeID = " + str5);
    if (!TextUtils.isEmpty(str4))
    {
      Mac localMac = Mac.getInstance("HmacSHA1");
      localMac.init(new SecretKeySpec(str4.getBytes(), localMac.getAlgorithm()));
      String str6 = new String(Base64.encode(localMac.doFinal(str3.getBytes()), 0)).trim();
      str1 = "SDU " + str2 + ":" + str6 + ":" + l;
    }
    LogUtils.infoLog(this.TAG, "Push Notification: WeMo Cloud Push Sync: Authorization header: " + str1);
    return str1;
  }
  
  private StringEntity getRequestStringEntity()
    throws UnsupportedEncodingException
  {
    String str = getJSONBody();
    StringEntity localStringEntity = new StringEntity(str);
    LogUtils.infoLog(this.TAG, "Push Notification: wemo cloud push sync JSON body: " + str);
    return localStringEntity;
  }
  
  private void sendHttpRequest(String paramString1, StringEntity paramStringEntity, String paramString2)
    throws ClientProtocolException, IOException
  {
    if (TextUtils.isEmpty(paramString2))
    {
      LogUtils.errorLog(this.TAG, "Push Notification: WeMo Cloud Push Sync: Generated Authorization header is empty.");
      onError(new PushNotificationError(-100, "Error during register/unregister Push Notification!"));
      return;
    }
    HttpClient localHttpClient = HTTPUtils.getCloudNewHttpClient(this.context);
    LogUtils.infoLog(this.TAG, "Push Notification: WeMo Cloud Push Sync: Sending request to cloud");
    HttpPost localHttpPost = new HttpPost(paramString1);
    localHttpPost.addHeader("accept", "application/json");
    localHttpPost.addHeader("Content-Type", "application/json");
    localHttpPost.addHeader("X-TransId", "PNApp");
    localHttpPost.addHeader("Authorization", paramString2);
    localHttpPost.setEntity(paramStringEntity);
    HttpResponse localHttpResponse = localHttpClient.execute(localHttpPost);
    int i = localHttpResponse.getStatusLine().getStatusCode();
    LogUtils.infoLog(this.TAG, "Push Notification: WeMo Cloud Push Sync: Cloud response for request: " + i);
    if (i == 200)
    {
      onSuccess(this.registrationId);
      return;
    }
    LogUtils.errorLog(this.TAG, "Push Notification: WeMo Cloud Push Sync: Cloud response FAILED");
    onError(new PushNotificationError(i, localHttpResponse.getStatusLine().getReasonPhrase()));
  }
  
  protected abstract String getJSONBody();
  
  protected abstract String getRequestURL();
  
  protected abstract void onError(PushNotificationError paramPushNotificationError);
  
  protected abstract void onSuccess(String paramString);
  
  public void run()
  {
    LogUtils.infoLog(this.TAG, "Push Notification: Sync with Wemo cloud. URL: https://api.xbcs.net:8443/apis/http/plugin/push/register");
    try
    {
      sendHttpRequest(getRequestURL(), getRequestStringEntity(), getAuthHeader());
      return;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      LogUtils.errorLog(this.TAG, "Push Notification: UnsupportedEncodingException while syncing with WeMo Cloud. ", localUnsupportedEncodingException);
      onError(new PushNotificationError(-100, localUnsupportedEncodingException.getMessage()));
      return;
    }
    catch (InvalidKeyException localInvalidKeyException)
    {
      LogUtils.errorLog(this.TAG, "Push Notification: InvalidKeyException while syncing with WeMo Cloud. ", localInvalidKeyException);
      onError(new PushNotificationError(-100, localInvalidKeyException.getMessage()));
      return;
    }
    catch (NoSuchAlgorithmException localNoSuchAlgorithmException)
    {
      LogUtils.errorLog(this.TAG, "Push Notification: NoSuchAlgorithmException while syncing with WeMo Cloud. ", localNoSuchAlgorithmException);
      onError(new PushNotificationError(-100, localNoSuchAlgorithmException.getMessage()));
      return;
    }
    catch (ClientProtocolException localClientProtocolException)
    {
      LogUtils.errorLog(this.TAG, "Push Notification: ClientProtocolException while syncing with WeMo Cloud. ", localClientProtocolException);
      onError(new PushNotificationError(-100, localClientProtocolException.getMessage()));
      return;
    }
    catch (IOException localIOException)
    {
      LogUtils.errorLog(this.TAG, "Push Notification: IOException while syncing with WeMo Cloud. ", localIOException);
      onError(new PushNotificationError(-100, localIOException.getMessage()));
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/push/cloud/runnable/WeMoCloudPushAbstractRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */