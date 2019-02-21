package com.belkin.wemo.cache.cloud;

import com.belkin.wemo.cache.cloud.listener.OnRequestCompleteListener;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.devicelist.CloudCacheUnicastDeviceDiscovery;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.devicelist.UnicastDeviceDiscovery;
import com.belkin.wemo.cache.devicelist.listener.UnicastListener;
import com.belkin.wemo.cache.remoteaccess.RemoteAccessManager;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.cache.utils.SDKNetworkUtils;
import com.belkin.wemo.cache.utils.SharePreferences;
import com.belkin.wemo.cache.utils.WemoUtils;
import com.belkin.wemo.runnable.DeviceUnicastRunnable;
import com.belkin.wemo.thread.WeMoThreadPoolHandler;
import java.io.UnsupportedEncodingException;
import java.util.Map;
import org.cybergarage.upnp.ControlPoint;
import org.cybergarage.upnp.Device;
import org.cybergarage.upnp.ssdp.SSDPPacket;
import org.cybergarage.xml.Node;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

public class SmartDiscovery
  implements OnRequestCompleteListener, UnicastListener
{
  private static final int CLOUD_CACHE_BLOCK_DURING_FW_UPGRADE = 600000;
  private static final String KEY_IP_ADDRESS_TAG = "ipAddress";
  private static final String KEY_PEERLOCAL_ADDRESS_TAG = "peerLocalAddress";
  private static final String KEY_PORT_TAG = "port";
  private static final String KEY_UDN_TAG = "udn";
  private static final String TAG = SmartDiscovery.class.getSimpleName();
  public static boolean isForcedRemoteEnabled;
  private boolean cachedDeviceListLoaded;
  private boolean cloudCacheCalledSuccessfully;
  private CloudRequestManager cloudRequestManager;
  private int deviceCount;
  private DeviceListManager deviceListManager;
  private int deviceUnicastFailedCount;
  private boolean didUnicastFailForAnyDevice;
  private SDKNetworkUtils mNetworkUtils;
  private boolean msearchFailed;
  private RemoteAccessManager remoteAccessManager;
  
  public SmartDiscovery(DeviceListManager paramDeviceListManager, RemoteAccessManager paramRemoteAccessManager, SDKNetworkUtils paramSDKNetworkUtils, CloudRequestManager paramCloudRequestManager)
  {
    this.deviceListManager = paramDeviceListManager;
    this.remoteAccessManager = paramRemoteAccessManager;
    this.mNetworkUtils = paramSDKNetworkUtils;
    this.cloudRequestManager = paramCloudRequestManager;
  }
  
  private boolean isCloudCacheAPIAllowed()
  {
    boolean bool1 = true;
    if (!this.deviceListManager.getFWUpdateInProgressDataMap().isEmpty()) {}
    for (boolean bool2 = true;; bool2 = false)
    {
      long l1 = System.currentTimeMillis();
      long l2 = this.deviceListManager.mSharePreference.getTimeStamp();
      SDKLogUtils.infoLog(TAG, "CloudCache: isFWUpgradeInProgress: " + bool2 + "; currentTimeInMS: " + l1 + "; timeWhenFWUpgradeStarted: " + l2);
      if ((bool2) && (l1 - l2 < 600000L)) {
        bool1 = false;
      }
      return bool1;
    }
  }
  
  private void parseResponse(String paramString)
  {
    XMLParser localXMLParser = new XMLParser();
    NodeList localNodeList = localXMLParser.getDomElement(paramString).getElementsByTagName("peerLocalAddress");
    this.deviceCount = localNodeList.getLength();
    int i = 0;
    if (i < this.deviceCount)
    {
      Element localElement = (Element)localNodeList.item(i);
      String str1 = localXMLParser.getValue(localElement, "udn");
      int j = Integer.parseInt(localXMLParser.getValue(localElement, "port"));
      String str2 = localXMLParser.getValue(localElement, "ipAddress");
      DeviceInformation localDeviceInformation = (DeviceInformation)this.deviceListManager.getDeviceInformationList().get(str1);
      String str3 = "http://" + str2 + ":" + j + "/setup.xml";
      if (localDeviceInformation != null)
      {
        Device localDevice = localDeviceInformation.getDevice();
        boolean bool = localDeviceInformation.getIsDiscovered();
        SDKLogUtils.infoLog(TAG, "CloudCache: Device from cache.db: " + localDeviceInformation.getUDN() + "; isDiscovered: " + bool);
        if ((localDevice != null) && (bool))
        {
          Node localNode = localDevice.getRootNode().getNode("URLBase");
          if (localNode != null)
          {
            String str4 = localDevice.getIPAddress();
            int k = localDevice.getPort();
            SDKLogUtils.infoLog(TAG, "CloudCache: deviceIP: " + str4 + "; devicePort: " + k + "; CloudDeviceIP: " + str2 + "; CloudDevicePort: " + j);
            if ((!str4.equalsIgnoreCase(str2)) || (k != j))
            {
              localNode.setValue(str3);
              new UnicastDeviceDiscovery(localDeviceInformation, this.deviceListManager).runUnicastDiscovery(this);
            }
          }
        }
      }
      for (;;)
      {
        i++;
        break;
        WeMoThreadPoolHandler.executeInBackground(new DeviceUnicastRunnable(str2, j, str1, this, new CloudCacheUnicastDeviceDiscovery()));
        continue;
        WeMoThreadPoolHandler.executeInBackground(new DeviceUnicastRunnable(str2, j, str1, this, new CloudCacheUnicastDeviceDiscovery()));
      }
    }
  }
  
  /* Error */
  private void requestCachedDevices()
  {
    // Byte code:
    //   0: iconst_1
    //   1: istore_1
    //   2: aload_0
    //   3: monitorenter
    //   4: getstatic 51	com/belkin/wemo/cache/cloud/SmartDiscovery:TAG	Ljava/lang/String;
    //   7: new 93	java/lang/StringBuilder
    //   10: dup
    //   11: invokespecial 94	java/lang/StringBuilder:<init>	()V
    //   14: ldc -1
    //   16: invokevirtual 100	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   19: invokestatic 260	com/belkin/wemo/cache/utils/NetworkMode:isLocal	()Z
    //   22: invokevirtual 103	java/lang/StringBuilder:append	(Z)Ljava/lang/StringBuilder;
    //   25: invokevirtual 113	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   28: invokestatic 119	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   31: invokestatic 260	com/belkin/wemo/cache/utils/NetworkMode:isLocal	()Z
    //   34: ifeq +166 -> 200
    //   37: aload_0
    //   38: invokespecial 262	com/belkin/wemo/cache/cloud/SmartDiscovery:isCloudCacheAPIAllowed	()Z
    //   41: ifeq +159 -> 200
    //   44: aload_0
    //   45: getfield 57	com/belkin/wemo/cache/cloud/SmartDiscovery:deviceListManager	Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    //   48: invokevirtual 266	com/belkin/wemo/cache/devicelist/DeviceListManager:getDeviceInformation	()Ljava/util/ArrayList;
    //   51: invokevirtual 269	java/util/ArrayList:isEmpty	()Z
    //   54: ifne +149 -> 203
    //   57: getstatic 51	com/belkin/wemo/cache/cloud/SmartDiscovery:TAG	Ljava/lang/String;
    //   60: new 93	java/lang/StringBuilder
    //   63: dup
    //   64: invokespecial 94	java/lang/StringBuilder:<init>	()V
    //   67: ldc_w 271
    //   70: invokevirtual 100	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   73: aload_0
    //   74: invokevirtual 274	com/belkin/wemo/cache/cloud/SmartDiscovery:didMsearchFailed	()Z
    //   77: invokevirtual 103	java/lang/StringBuilder:append	(Z)Ljava/lang/StringBuilder;
    //   80: ldc_w 276
    //   83: invokevirtual 100	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   86: iload_1
    //   87: invokevirtual 103	java/lang/StringBuilder:append	(Z)Ljava/lang/StringBuilder;
    //   90: ldc_w 278
    //   93: invokevirtual 100	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   96: aload_0
    //   97: invokevirtual 280	com/belkin/wemo/cache/cloud/SmartDiscovery:didUnicastFailForAnyDevice	()Z
    //   100: invokevirtual 103	java/lang/StringBuilder:append	(Z)Ljava/lang/StringBuilder;
    //   103: ldc_w 282
    //   106: invokevirtual 100	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   109: aload_0
    //   110: invokevirtual 285	com/belkin/wemo/cache/cloud/SmartDiscovery:didCachedDeviceListLoaded	()Z
    //   113: invokevirtual 103	java/lang/StringBuilder:append	(Z)Ljava/lang/StringBuilder;
    //   116: invokevirtual 113	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   119: invokestatic 119	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   122: aload_0
    //   123: invokevirtual 285	com/belkin/wemo/cache/cloud/SmartDiscovery:didCachedDeviceListLoaded	()Z
    //   126: ifeq +74 -> 200
    //   129: aload_0
    //   130: invokevirtual 274	com/belkin/wemo/cache/cloud/SmartDiscovery:didMsearchFailed	()Z
    //   133: ifeq +67 -> 200
    //   136: iload_1
    //   137: ifeq +14 -> 151
    //   140: iload_1
    //   141: ifeq +59 -> 200
    //   144: aload_0
    //   145: invokevirtual 280	com/belkin/wemo/cache/cloud/SmartDiscovery:didUnicastFailForAnyDevice	()Z
    //   148: ifeq +52 -> 200
    //   151: aload_0
    //   152: invokevirtual 288	com/belkin/wemo/cache/cloud/SmartDiscovery:isCloudCacheCalledSuccessfully	()Z
    //   155: ifne +45 -> 200
    //   158: aload_0
    //   159: iconst_1
    //   160: invokevirtual 292	com/belkin/wemo/cache/cloud/SmartDiscovery:setCloudCacheCalledSuccessfully	(Z)V
    //   163: new 294	com/belkin/wemo/cache/cloud/CloudRequestGetDeviceFromCloud
    //   166: dup
    //   167: aload_0
    //   168: getfield 59	com/belkin/wemo/cache/cloud/SmartDiscovery:remoteAccessManager	Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;
    //   171: aload_0
    //   172: getfield 61	com/belkin/wemo/cache/cloud/SmartDiscovery:mNetworkUtils	Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;
    //   175: invokevirtual 299	com/belkin/wemo/cache/utils/SDKNetworkUtils:getArpMac	()Ljava/lang/String;
    //   178: aload_0
    //   179: invokespecial 302	com/belkin/wemo/cache/cloud/CloudRequestGetDeviceFromCloud:<init>	(Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;Ljava/lang/String;Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;)V
    //   182: astore_3
    //   183: getstatic 51	com/belkin/wemo/cache/cloud/SmartDiscovery:TAG	Ljava/lang/String;
    //   186: ldc_w 304
    //   189: invokestatic 119	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   192: aload_0
    //   193: getfield 63	com/belkin/wemo/cache/cloud/SmartDiscovery:cloudRequestManager	Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    //   196: aload_3
    //   197: invokevirtual 310	com/belkin/wemo/cache/cloud/CloudRequestManager:makeRequest	(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V
    //   200: aload_0
    //   201: monitorexit
    //   202: return
    //   203: iconst_0
    //   204: istore_1
    //   205: goto -148 -> 57
    //   208: astore_2
    //   209: aload_0
    //   210: monitorexit
    //   211: aload_2
    //   212: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	213	0	this	SmartDiscovery
    //   1	204	1	bool	boolean
    //   208	4	2	localObject	Object
    //   182	15	3	localCloudRequestGetDeviceFromCloud	CloudRequestGetDeviceFromCloud
    // Exception table:
    //   from	to	target	type
    //   4	57	208	finally
    //   57	136	208	finally
    //   144	151	208	finally
    //   151	200	208	finally
  }
  
  public boolean didCachedDeviceListLoaded()
  {
    try
    {
      boolean bool = this.cachedDeviceListLoaded;
      return bool;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public boolean didMsearchFailed()
  {
    try
    {
      boolean bool = this.msearchFailed;
      return bool;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public boolean didUnicastFailForAnyDevice()
  {
    try
    {
      boolean bool = this.didUnicastFailForAnyDevice;
      return bool;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public int getDeviceUnicastFailedCount()
  {
    return this.deviceUnicastFailedCount;
  }
  
  public boolean isCloudCacheCalledSuccessfully()
  {
    return this.cloudCacheCalledSuccessfully;
  }
  
  public boolean isForcedRemoteEnabled()
  {
    return isForcedRemoteEnabled;
  }
  
  public void onCachedDeviceLoaded()
  {
    setDeviceUnicastFailedCount(0);
    SDKLogUtils.infoLog(TAG, "CloudCache: Cached Device Loaded Successfully: ");
    setCachedDeviceListLoaded(true);
    requestCachedDevices();
  }
  
  public void onDeviceDiscovered(String paramString1, int paramInt, String paramString2)
  {
    SDKLogUtils.infoLog(TAG, "CloudCache: Device Reachable via Unicast: " + paramString2 + ";\n Feed SSDP packet to MSearch receiver/server at ControlPoint.");
    SSDPPacket localSSDPPacket = WemoUtils.createSSDPPacket(paramString1, paramInt, paramString2);
    this.deviceListManager.getUpnpControl().searchResponseReceived(localSSDPPacket, true, false);
  }
  
  public void onDeviceNotDiscovered(String paramString1, int paramInt, String paramString2)
  {
    SDKLogUtils.errorLog(TAG, "CloudCache: Device Not Reachable via Unicast: " + paramString2);
    this.deviceUnicastFailedCount = (1 + this.deviceUnicastFailedCount);
    SDKLogUtils.errorLog(TAG, "CloudCache: Device Not Reachable via Unicast: " + paramString2 + " :deviceUnicastFailedCount: " + this.deviceUnicastFailedCount + " :deviceCount: " + this.deviceCount);
    boolean bool = this.remoteAccessManager.isRemoteEnabled();
    if (bool)
    {
      SDKLogUtils.infoLog(TAG, "Is Remote enabled: " + bool);
      if (this.deviceCount == this.deviceUnicastFailedCount) {
        this.deviceListManager.enableForcedRemote();
      }
    }
  }
  
  public void onDeviceUnicastFailed(String paramString)
  {
    setDeviceUnicastFailedCount(0);
    SDKLogUtils.infoLog(TAG, "CloudCache: Device Unicast Failed: " + paramString);
    setUnicastFailedForAnyDevice(true);
    requestCachedDevices();
  }
  
  public void onMSearchFailed()
  {
    setDeviceUnicastFailedCount(0);
    SDKLogUtils.infoLog(TAG, "CloudCache: on MSearch Failed: ");
    setMsearchFailed(true);
    requestCachedDevices();
  }
  
  public void onRequestComplete(boolean paramBoolean, int paramInt, byte[] paramArrayOfByte)
  {
    if (paramBoolean)
    {
      if (paramArrayOfByte != null) {}
      try
      {
        String str = new String(paramArrayOfByte, "UTF-8");
        SDKLogUtils.infoLog(TAG, "Cloud Cache response: " + str);
        parseResponse(str);
        return;
      }
      catch (UnsupportedEncodingException localUnsupportedEncodingException)
      {
        SDKLogUtils.errorLog(TAG, "CloudCache: UnsupportedEncodingException while encoding DeviceDiscoveryCloudCache cloud response: ", localUnsupportedEncodingException);
        return;
      }
      catch (NumberFormatException localNumberFormatException)
      {
        SDKLogUtils.errorLog(TAG, "CloudCache: UnsupportedEncodingException for cloud cached received from cloud: ", localNumberFormatException);
        return;
      }
    }
    SDKLogUtils.errorLog(TAG, "CloudCache: Error received while fetching devices from cloud: ; STATUS CODE: " + paramInt);
  }
  
  public void setCachedDeviceListLoaded(boolean paramBoolean)
  {
    try
    {
      this.cachedDeviceListLoaded = paramBoolean;
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public void setCloudCacheCalledSuccessfully(boolean paramBoolean)
  {
    this.cloudCacheCalledSuccessfully = paramBoolean;
  }
  
  public void setDeviceUnicastFailedCount(int paramInt)
  {
    this.deviceUnicastFailedCount = paramInt;
  }
  
  public void setForcedRemoteEnabled(boolean paramBoolean)
  {
    isForcedRemoteEnabled = paramBoolean;
  }
  
  public void setMsearchFailed(boolean paramBoolean)
  {
    try
    {
      this.msearchFailed = paramBoolean;
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public void setUnicastFailedForAnyDevice(boolean paramBoolean)
  {
    try
    {
      this.didUnicastFailForAnyDevice = paramBoolean;
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/SmartDiscovery.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */