package com.belkin.wemo.cache.devicelist;

import com.belkin.wemo.cache.devicelist.listener.UnicastListener;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.exception.InvalidArgumentsException;
import com.loopj.android.http.AsyncHttpResponseHandler;
import com.loopj.android.http.SyncHttpClient;
import org.apache.http.Header;

public class CloudCacheUnicastDeviceDiscovery
{
  private static final String TAG = CloudCacheUnicastDeviceDiscovery.class.getSimpleName();
  private static final int TIMEOUT = 10000;
  
  public void isDeviceReachable(final String paramString1, final int paramInt, final String paramString2, final UnicastListener paramUnicastListener)
    throws InvalidArgumentsException
  {
    SyncHttpClient localSyncHttpClient = new SyncHttpClient();
    localSyncHttpClient.setTimeout(10000);
    if (paramString1 != null)
    {
      String str = "http://" + paramString1 + ":" + paramInt + "/setup.xml";
      SDKLogUtils.infoLog(TAG, "Starting unicast discovery for: " + paramString2 + ":URL - " + str);
      localSyncHttpClient.get(str, new AsyncHttpResponseHandler()
      {
        public void onFailure(int paramAnonymousInt, Header[] paramAnonymousArrayOfHeader, byte[] paramAnonymousArrayOfByte, Throwable paramAnonymousThrowable)
        {
          SDKLogUtils.infoLog(CloudCacheUnicastDeviceDiscovery.TAG, "unicast discovery failed retrying:: ; statusCode- " + paramAnonymousInt);
          if (paramUnicastListener != null) {
            paramUnicastListener.onDeviceNotDiscovered(paramString1, paramInt, paramString2);
          }
        }
        
        public void onFinish()
        {
          SDKLogUtils.infoLog(CloudCacheUnicastDeviceDiscovery.TAG, "onFinish: ");
        }
        
        public void onRetry(int paramAnonymousInt)
        {
          SDKLogUtils.infoLog(CloudCacheUnicastDeviceDiscovery.TAG, "unicast discovery retrying:: No. of Retry - " + paramAnonymousInt);
        }
        
        public void onSuccess(int paramAnonymousInt, Header[] paramAnonymousArrayOfHeader, byte[] paramAnonymousArrayOfByte)
        {
          SDKLogUtils.infoLog(CloudCacheUnicastDeviceDiscovery.TAG, "unicast discovery successful:: " + paramString2 + "; statusCode- " + paramAnonymousInt);
          if (paramUnicastListener != null) {
            paramUnicastListener.onDeviceDiscovered(paramString1, paramInt, paramString2);
          }
        }
      });
      return;
    }
    throw new InvalidArgumentsException("IPAddress is null");
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/devicelist/CloudCacheUnicastDeviceDiscovery.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */