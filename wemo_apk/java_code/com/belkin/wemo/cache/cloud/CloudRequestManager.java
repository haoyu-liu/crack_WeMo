package com.belkin.wemo.cache.cloud;

import android.content.Context;
import android.text.TextUtils;
import com.android.volley.AuthFailureError;
import com.android.volley.DefaultRetryPolicy;
import com.android.volley.NetworkResponse;
import com.android.volley.Request;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.android.volley.RetryPolicy;
import com.android.volley.VolleyError;
import com.belkin.wemo.cache.cloud.request.ByteStreamGetRequest;
import com.belkin.wemo.cache.cloud.request.ByteStreamPostRequest;
import com.belkin.wemo.cache.cloud.request.JSONPostRequest;
import com.belkin.wemo.cache.cloud.request.MultipartFormDataPOSTRequest;
import com.belkin.wemo.cache.cloud.request.MultipartPOSTRequest;
import com.belkin.wemo.cache.cloud.request.WemoRequest;
import com.belkin.wemo.cache.cloud.request.WemoStringRequest;
import com.belkin.wemo.cache.cloud.request.XMLGetRequest;
import com.belkin.wemo.cache.cloud.request.XMLPostRequest;
import com.belkin.wemo.cache.cloud.request.XMLPutRequest;
import com.belkin.wemo.cache.cloud.request.listener.WemoRequestErrorListener;
import com.belkin.wemo.cache.cloud.request.listener.WemoRequestSuccessListener;
import com.belkin.wemo.cache.cloud.requestqueue.IRequestProcessor;
import com.belkin.wemo.cache.cloud.requestqueue.impl.RequestProcessorFactory;
import com.belkin.wemo.cache.devicelist.CloudRequestTracker;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.cache.utils.SDKNetworkUtils;
import com.belkin.wemo.runnable.WeMoRunnable;
import com.belkin.wemo.thread.WeMoThreadPoolHandler;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import org.json.JSONException;

public class CloudRequestManager
{
  public static final int DEFAULT_CLOUD_REQUEST_RETRIES = 1;
  public static final int DEFAULT_CLOUD_REQUEST_TIMEOUT_MS = 60000;
  private final String CONTENT_TYPE = "Content-Type";
  private final String TAG = "SDK_CloudRequestManager";
  private final String USER_AGENT = "User-Agent";
  private Context context;
  private HttpURLConnection httpConn;
  private SDKNetworkUtils networkUtils;
  private OutputStream outputStream;
  private List<String> response = new ArrayList();
  private int status;
  private PrintWriter writer;
  
  public CloudRequestManager(Context paramContext)
  {
    this.context = paramContext;
    this.networkUtils = new SDKNetworkUtils(paramContext);
  }
  
  private void handleUnauthorizedRequest(CloudRequestInterface paramCloudRequestInterface)
  {
    SDKLogUtils.errorLog("SDK_CloudRequestManager", "Cloud Request: " + paramCloudRequestInterface.getClass().getSimpleName() + " is NOT AUTHORISED. REQUEST CANCELLED");
    paramCloudRequestInterface.requestComplete(false, 65131, null);
  }
  
  private boolean isRequestAuthorized(String paramString)
  {
    if (!TextUtils.isEmpty(paramString)) {
      return true;
    }
    SDKLogUtils.errorLog("SDK_CloudRequestManager", "Cloud request is not authorised as Auth Header is emmpty.");
    return false;
  }
  
  private void issuePeriodicUpdateIfRequired(CloudRequestInterface paramCloudRequestInterface)
  {
    if ((!this.networkUtils.isHomeNetwork()) && (!paramCloudRequestInterface.getClass().equals(CloudRequestUpdateDeviceList.class)) && (CloudRequestTracker.instance().onRequestCompleted() == 0))
    {
      SDKLogUtils.debugLog("SDK_CloudRequestManager", "STARTING PERIODIC UPDATE");
      DeviceListManager.getInstance(this.context).startCloudPeriodicUpdate();
    }
  }
  
  private void logCloudRequest(Request<?> paramRequest)
  {
    if ((paramRequest != null) && (SDKLogUtils.isDebug()))
    {
      String str1 = paramRequest.getClass().getSimpleName();
      try
      {
        Iterator localIterator = paramRequest.getHeaders().entrySet().iterator();
        while (localIterator.hasNext())
        {
          Map.Entry localEntry = (Map.Entry)localIterator.next();
          SDKLogUtils.debugLog("SDK_CloudRequestManager", "Header KEY: " + (String)localEntry.getKey() + "; VALUE: " + (String)localEntry.getValue());
          continue;
          return;
        }
      }
      catch (AuthFailureError localAuthFailureError)
      {
        SDKLogUtils.errorLog("SDK_CloudRequestManager", "AuthFailureError while getting headers for cloud reqeust: " + str1 + " : ", localAuthFailureError);
      }
    }
    if (paramRequest.getBody() != null) {}
    for (String str2 = new String(paramRequest.getBody());; str2 = "null")
    {
      SDKLogUtils.debugLog("SDK_CloudRequestManager", "REQUEST PROPERTIES. METHOD: " + paramRequest.getMethod() + "; TIMEOUT: " + paramRequest.getRetryPolicy().getCurrentTimeout() + "; URL: " + paramRequest.getUrl() + "; BODY: " + str2);
      return;
    }
  }
  
  private void stopPeriodicUpdateIfRequired(CloudRequestInterface paramCloudRequestInterface)
  {
    if ((!this.networkUtils.isHomeNetwork()) && (!paramCloudRequestInterface.getClass().equals(CloudRequestUpdateDeviceList.class)) && (CloudRequestTracker.instance().onRequestIssued() > 0))
    {
      SDKLogUtils.debugLog("SDK_CloudRequestManager", "STOPPING PERIODIC UPDATE");
      DeviceListManager.getInstance(this.context).stopCloudPeriodicUpdate();
      RequestProcessorFactory.getRequestProcessor(this.context).cancelAll(CloudRequestUpdateDeviceList.class.getSimpleName());
    }
  }
  
  public void makeByteStreamRequest(CloudRequestInterface paramCloudRequestInterface)
  {
    String str1 = paramCloudRequestInterface.getClass().getSimpleName();
    SDKLogUtils.debugLog("SDK_CloudRequestManager", "Processing Byte Stream Cloud Request: " + str1);
    Object localObject;
    for (;;)
    {
      String str2;
      ByteStreamResponseListener localByteStreamResponseListener;
      String str3;
      byte[] arrayOfByte;
      try
      {
        str2 = new CloudAuth(this.context).generateAuthCode();
        SDKLogUtils.debugLog("SDK_CloudRequestManager", "Authorization Header: " + str2);
        int i = paramCloudRequestInterface.getRequestMethod();
        localByteStreamResponseListener = new ByteStreamResponseListener(paramCloudRequestInterface);
        str3 = paramCloudRequestInterface.getURL();
        arrayOfByte = paramCloudRequestInterface.getFileByteArray();
        localObject = null;
        switch (i)
        {
        default: 
          if (localObject == null) {
            break label332;
          }
          ((WemoRequest)localObject).setRetryPolicy(new DefaultRetryPolicy(60000, 1, 0.0F));
          Map localMap = paramCloudRequestInterface.getAdditionalHeaders();
          if (localMap == null) {
            break;
          }
          Iterator localIterator = localMap.entrySet().iterator();
          if (!localIterator.hasNext()) {
            break;
          }
          Map.Entry localEntry = (Map.Entry)localIterator.next();
          ((WemoRequest)localObject).addHeader((String)localEntry.getKey(), (String)localEntry.getValue());
          break;
        case 2: 
          localObject = new ByteStreamGetRequest(str3, localByteStreamResponseListener, localByteStreamResponseListener, str2);
        }
      }
      catch (JSONException localJSONException)
      {
        SDKLogUtils.errorLog("SDK_CloudRequestManager", "JSONException while fetching AuthCode: ", localJSONException);
        paramCloudRequestInterface.requestComplete(false, 65336, null);
        return;
      }
      continue;
      localObject = new ByteStreamPostRequest(str3, localByteStreamResponseListener, localByteStreamResponseListener, str2, arrayOfByte);
    }
    logCloudRequest((Request)localObject);
    stopPeriodicUpdateIfRequired(paramCloudRequestInterface);
    ((WemoRequest)localObject).setTag(str1);
    RequestProcessorFactory.getRequestProcessor(this.context).add((Request)localObject);
    return;
    label332:
    SDKLogUtils.errorLog("SDK_CloudRequestManager", "Volley REQUEST IS NULL for CloudRequest: " + str1);
    paramCloudRequestInterface.requestComplete(false, 65335, null);
  }
  
  public void makeMultiPartRequest(AbstractMultipartCloudRequest paramAbstractMultipartCloudRequest)
    throws IOException
  {
    String str1 = paramAbstractMultipartCloudRequest.getClass().getSimpleName();
    SDKLogUtils.debugLog("SDK_CloudRequestManager", "Processing Cloud Request: " + str1);
    for (;;)
    {
      String str2;
      CloudRequestListener localCloudRequestListener;
      String str3;
      byte[] arrayOfByte;
      try
      {
        str2 = new CloudAuth(this.context).generateAuthCode();
        SDKLogUtils.debugLog("SDK_CloudRequestManager", "Authorization Header: " + str2);
        if ((paramAbstractMultipartCloudRequest.isAuthHeaderRequired()) && (!isRequestAuthorized(str2)))
        {
          handleUnauthorizedRequest(paramAbstractMultipartCloudRequest);
          return;
        }
        localCloudRequestListener = new CloudRequestListener(paramAbstractMultipartCloudRequest);
        str3 = paramAbstractMultipartCloudRequest.getURL();
        arrayOfByte = paramAbstractMultipartCloudRequest.getFileByteArray();
        if (arrayOfByte == null) {
          break;
        }
        if (paramAbstractMultipartCloudRequest.getContentType().equals("multipart/form-data; boundary=MULTIPART-FORM-DATA-BOUNDARY"))
        {
          localObject = new MultipartFormDataPOSTRequest(str3, localCloudRequestListener, localCloudRequestListener, str2, arrayOfByte);
          SDKLogUtils.debugLog("SDK_CloudRequestManager", "IsForcedRemoteEnabled: " + SmartDiscovery.isForcedRemoteEnabled);
          if (SmartDiscovery.isForcedRemoteEnabled) {
            ((MultipartPOSTRequest)localObject).addHeader("Log-Data", "ForcedRemote-1");
          }
          if (localObject != null) {
            ((MultipartPOSTRequest)localObject).setRetryPolicy(new DefaultRetryPolicy(60000, 1, 0.0F));
          }
          logCloudRequest((Request)localObject);
          stopPeriodicUpdateIfRequired(paramAbstractMultipartCloudRequest);
          ((MultipartPOSTRequest)localObject).setTag(str1);
          RequestProcessorFactory.getRequestProcessor(this.context).add((Request)localObject);
          return;
        }
      }
      catch (JSONException localJSONException)
      {
        SDKLogUtils.errorLog("SDK_CloudRequestManager", "JSONException while fetching AuthCode: ", localJSONException);
        paramAbstractMultipartCloudRequest.requestComplete(false, 65336, null);
        return;
      }
      Object localObject = new MultipartPOSTRequest(str3, localCloudRequestListener, localCloudRequestListener, str2, arrayOfByte);
    }
    SDKLogUtils.errorLog("SDK_CloudRequestManager", "getFileByteArray returned null");
    paramAbstractMultipartCloudRequest.requestComplete(false, 65236, null);
  }
  
  public String[] makeMultiPartRequest(CloudRequestInterfaceForMultipart paramCloudRequestInterfaceForMultipart)
    throws IOException
  {
    SDKLogUtils.infoLog("SDK_CloudRequestManager", "In makeMultiPartRequest");
    this.httpConn = ((HttpURLConnection)new URL(paramCloudRequestInterfaceForMultipart.getURL()).openConnection());
    this.httpConn.setUseCaches(false);
    this.httpConn.setDoOutput(paramCloudRequestInterfaceForMultipart.getRequestMethod());
    this.httpConn.setDoInput(true);
    this.httpConn.setRequestProperty("Content-Type", "multipart/form-data; boundary=MULTIPART-FORM-DATA-BOUNDARY");
    this.httpConn.setRequestProperty("User-Agent", "WeMo_Android");
    this.outputStream = this.httpConn.getOutputStream();
    this.writer = new PrintWriter(new OutputStreamWriter(this.outputStream, "UTF-8"), true);
    this.writer.append("User-Agent: WeMo_Android").append("\r\n");
    this.writer.flush();
    for (int i = 0; i < paramCloudRequestInterfaceForMultipart.getFormKeys().length; i++)
    {
      this.writer.append("--MULTIPART-FORM-DATA-BOUNDARY").append("\r\n");
      this.writer.append("Content-Disposition: form-data; name=\"" + paramCloudRequestInterfaceForMultipart.getFormKeys()[i] + "\"").append("\r\n");
      this.writer.append("Content-Type: text/plain; charset=UTF-8").append("\r\n");
      this.writer.append("\r\n");
      this.writer.append(paramCloudRequestInterfaceForMultipart.getFormValues()[i]).append("\r\n");
      this.writer.flush();
      SDKLogUtils.infoLog("SDK_CloudRequestManager", "FormField: getFormKeys: " + paramCloudRequestInterfaceForMultipart.getFormKeys()[i] + " getFormValues: " + paramCloudRequestInterfaceForMultipart.getFormValues()[i]);
    }
    this.writer.append("\r\n").flush();
    this.writer.append("MULTIPART-FORM-DATA-BOUNDARY--").append("\r\n");
    this.writer.close();
    this.status = this.httpConn.getResponseCode();
    if (this.status == 200)
    {
      BufferedReader localBufferedReader = new BufferedReader(new InputStreamReader(this.httpConn.getInputStream()));
      for (;;)
      {
        String str1 = localBufferedReader.readLine();
        if (str1 == null) {
          break;
        }
        this.response.add(str1);
      }
      localBufferedReader.close();
      this.httpConn.disconnect();
    }
    String str2 = "";
    Iterator localIterator = this.response.iterator();
    while (localIterator.hasNext())
    {
      String str3 = (String)localIterator.next();
      str2 = str2 + str3;
    }
    SDKLogUtils.infoLog("SDK_CloudRequestManager", "status: " + this.status + " response: " + str2);
    return paramCloudRequestInterfaceForMultipart.requestComplete(this.status, str2);
  }
  
  public void makeRequest(CloudRequestInterface paramCloudRequestInterface)
  {
    String str1 = paramCloudRequestInterface.getClass().getSimpleName();
    SDKLogUtils.debugLog("SDK_CloudRequestManager", "Processing Cloud Request: " + str1);
    for (;;)
    {
      String str2;
      CloudRequestListener localCloudRequestListener;
      String str3;
      String str4;
      try
      {
        str2 = new CloudAuth(this.context).generateAuthCode();
        SDKLogUtils.debugLog("SDK_CloudRequestManager", "Authorization Header: " + str2);
        if ((paramCloudRequestInterface.isAuthHeaderRequired()) && (!isRequestAuthorized(str2)))
        {
          handleUnauthorizedRequest(paramCloudRequestInterface);
          return;
        }
        int i = paramCloudRequestInterface.getRequestMethod();
        localCloudRequestListener = new CloudRequestListener(paramCloudRequestInterface);
        str3 = paramCloudRequestInterface.getURL();
        str4 = paramCloudRequestInterface.getBody();
        localObject = null;
        switch (i)
        {
        default: 
          SDKLogUtils.debugLog("SDK_CloudRequestManager", "IsForcedRemoteEnabled: " + SmartDiscovery.isForcedRemoteEnabled);
          if (SmartDiscovery.isForcedRemoteEnabled) {
            ((WemoStringRequest)localObject).addHeader("Log-Data", "ForcedRemote-1");
          }
          if (localObject != null)
          {
            if (!paramCloudRequestInterface.getClass().equals(HTTPRequestUnicastDiscovery.class)) {
              break label470;
            }
            ((WemoStringRequest)localObject).setRetryPolicy(new DefaultRetryPolicy(5000, 0, 0.0F));
          }
          logCloudRequest((Request)localObject);
          stopPeriodicUpdateIfRequired(paramCloudRequestInterface);
          ((WemoStringRequest)localObject).setTag(str1);
          RequestProcessorFactory.getRequestProcessor(this.context).add((Request)localObject);
          return;
        }
      }
      catch (JSONException localJSONException)
      {
        SDKLogUtils.errorLog("SDK_CloudRequestManager", "JSONException while fetching AuthCode: ", localJSONException);
        paramCloudRequestInterface.requestComplete(false, 65336, null);
        return;
      }
      Object localObject = new XMLGetRequest(str3, localCloudRequestListener, localCloudRequestListener, str2);
      continue;
      byte[] arrayOfByte = paramCloudRequestInterface.getFileByteArray();
      localObject = null;
      if (arrayOfByte == null)
      {
        if (str3.contains("/apis/http/firmware/upgrades"))
        {
          localObject = new JSONPostRequest(str3, localCloudRequestListener, localCloudRequestListener, str2);
          ((WemoStringRequest)localObject).addHeader("App-Version", "Android.Latest");
          if (!paramCloudRequestInterface.isAuthHeaderRequired()) {
            ((WemoStringRequest)localObject).removeHeader("Authorization");
          }
        }
        for (;;)
        {
          ((WemoStringRequest)localObject).setStringBody(str4);
          break;
          localObject = new XMLPostRequest(str3, localCloudRequestListener, localCloudRequestListener, str2);
        }
        localObject = new XMLPostRequest(str3, localCloudRequestListener, localCloudRequestListener, str2);
        continue;
        localObject = new XMLPutRequest(str3, localCloudRequestListener, localCloudRequestListener, str2, str4);
        continue;
        label470:
        ((WemoStringRequest)localObject).setRetryPolicy(new DefaultRetryPolicy(60000, 1, 0.0F));
      }
    }
  }
  
  private class ByteStreamResponseListener
    implements WemoRequestErrorListener, WemoRequestSuccessListener<byte[]>
  {
    private CloudRequestInterface requestInterface;
    
    public ByteStreamResponseListener(CloudRequestInterface paramCloudRequestInterface)
    {
      this.requestInterface = paramCloudRequestInterface;
    }
    
    public void onErrorResponse(final VolleyError paramVolleyError)
    {
      WeMoThreadPoolHandler.getInstance().executeViaBackground(new WeMoRunnable()
      {
        public void run()
        {
          int i = -1;
          VolleyError localVolleyError = paramVolleyError;
          byte[] arrayOfByte = null;
          if (localVolleyError != null)
          {
            NetworkResponse localNetworkResponse = paramVolleyError.networkResponse;
            arrayOfByte = null;
            if (localNetworkResponse != null)
            {
              i = localNetworkResponse.statusCode;
              arrayOfByte = localNetworkResponse.data;
            }
          }
          String str = "null";
          if (arrayOfByte != null) {
            str = new String(arrayOfByte);
          }
          SDKLogUtils.errorLog(this.TAG, "Byte Stream Cloud Request FALIED: " + CloudRequestManager.ByteStreamResponseListener.this.requestInterface.getClass().getSimpleName() + "; Status: " + i + "; Response: " + str);
          CloudRequestManager.ByteStreamResponseListener.this.requestInterface.requestComplete(false, i, arrayOfByte);
          CloudRequestManager.this.issuePeriodicUpdateIfRequired(CloudRequestManager.ByteStreamResponseListener.this.requestInterface);
        }
      });
    }
    
    public void onResponse(final byte[] paramArrayOfByte, final int paramInt)
    {
      WeMoThreadPoolHandler.getInstance().executeViaBackground(new WeMoRunnable()
      {
        public void run()
        {
          SDKLogUtils.debugLog(this.TAG, "Byte Stream Cloud Request PASSED: " + CloudRequestManager.ByteStreamResponseListener.this.requestInterface.getClass().getSimpleName() + "; Status: " + paramInt + "; Response: " + paramArrayOfByte);
          CloudRequestManager.ByteStreamResponseListener.this.requestInterface.requestComplete(true, paramInt, paramArrayOfByte);
          CloudRequestManager.this.issuePeriodicUpdateIfRequired(CloudRequestManager.ByteStreamResponseListener.this.requestInterface);
        }
      });
    }
  }
  
  private class CloudRequestListener
    implements Response.Listener<String>, Response.ErrorListener
  {
    private CloudRequestInterface requestInterface;
    
    public CloudRequestListener(CloudRequestInterface paramCloudRequestInterface)
    {
      this.requestInterface = paramCloudRequestInterface;
    }
    
    public void onErrorResponse(final VolleyError paramVolleyError)
    {
      WeMoThreadPoolHandler.getInstance().executeViaBackground(new WeMoRunnable()
      {
        public void run()
        {
          int i = -1;
          VolleyError localVolleyError = paramVolleyError;
          byte[] arrayOfByte = null;
          if (localVolleyError != null)
          {
            NetworkResponse localNetworkResponse = paramVolleyError.networkResponse;
            arrayOfByte = null;
            if (localNetworkResponse != null)
            {
              i = localNetworkResponse.statusCode;
              arrayOfByte = localNetworkResponse.data;
            }
          }
          String str = "null";
          if (arrayOfByte != null) {
            str = new String(arrayOfByte);
          }
          SDKLogUtils.errorLog(this.TAG, "Cloud Request FALIED: " + CloudRequestManager.CloudRequestListener.this.requestInterface.getClass().getSimpleName() + "; Status: " + i + "; Response: " + str);
          CloudRequestManager.CloudRequestListener.this.requestInterface.requestComplete(false, i, arrayOfByte);
          CloudRequestManager.this.issuePeriodicUpdateIfRequired(CloudRequestManager.CloudRequestListener.this.requestInterface);
        }
      });
    }
    
    public void onResponse(final String paramString)
    {
      WeMoThreadPoolHandler.getInstance().executeViaBackground(new WeMoRunnable()
      {
        public void run()
        {
          SDKLogUtils.debugLog(this.TAG, "Cloud Request PASSED: " + CloudRequestManager.CloudRequestListener.this.requestInterface.getClass().getSimpleName() + "; Status: " + 200 + "; Response: " + paramString);
          if (paramString == null) {}
          for (byte[] arrayOfByte = null;; arrayOfByte = paramString.getBytes())
          {
            CloudRequestManager.CloudRequestListener.this.requestInterface.requestComplete(true, 200, arrayOfByte);
            CloudRequestManager.this.issuePeriodicUpdateIfRequired(CloudRequestManager.CloudRequestListener.this.requestInterface);
            return;
          }
        }
      });
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestManager.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */