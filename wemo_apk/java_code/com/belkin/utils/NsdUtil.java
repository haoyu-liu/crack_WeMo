package com.belkin.utils;

import android.content.Context;
import android.net.nsd.NsdManager;
import android.net.nsd.NsdManager.DiscoveryListener;
import android.net.nsd.NsdManager.RegistrationListener;
import android.net.nsd.NsdManager.ResolveListener;
import android.net.nsd.NsdServiceInfo;
import com.belkin.wemo.cache.utils.SharePreferences;
import java.net.InetAddress;
import org.apache.cordova.CallbackContext;

public class NsdUtil
{
  public static final String SERVICE_TYPE = "_hap._tcp.";
  public static final String TAG = "NsdUtil";
  String hostAdress = null;
  Context mContext;
  NsdManager.DiscoveryListener mDiscoveryListener;
  NsdManager mNsdManager;
  NsdManager.RegistrationListener mRegistrationListener;
  NsdManager.ResolveListener mResolveListener;
  NsdServiceInfo mService;
  public String mServiceName = "F7C064";
  public String mServiceNameBridge = "Wemo Bridge";
  private SharePreferences mSharePreference;
  
  public NsdUtil(Context paramContext)
  {
    this.mContext = paramContext;
    this.mNsdManager = ((NsdManager)paramContext.getSystemService("servicediscovery"));
    this.mSharePreference = new SharePreferences(this.mContext);
  }
  
  private void initializeResolveListener()
  {
    this.mResolveListener = new NsdManager.ResolveListener()
    {
      public void onResolveFailed(NsdServiceInfo paramAnonymousNsdServiceInfo, int paramAnonymousInt)
      {
        LogUtils.errorLog("NsdUtil", "Resolve failed" + paramAnonymousInt);
      }
      
      public void onServiceResolved(NsdServiceInfo paramAnonymousNsdServiceInfo)
      {
        LogUtils.errorLog("NsdUtil", "Resolve Succeeded. " + paramAnonymousNsdServiceInfo);
        if (paramAnonymousNsdServiceInfo.getServiceName().equals(NsdUtil.this.mServiceName))
        {
          LogUtils.debugLog("NsdUtil", "Same IP.");
          return;
        }
        NsdUtil.this.mService = paramAnonymousNsdServiceInfo;
        int i = NsdUtil.this.mService.getPort();
        InetAddress localInetAddress = NsdUtil.this.mService.getHost();
        NsdUtil.this.hostAdress = localInetAddress.toString();
        LogUtils.debugLog("NsdUtil", "port: " + i + "host: " + localInetAddress + "ipAdress: " + NsdUtil.this.hostAdress.substring(1));
        NsdUtil.this.mSharePreference.saveWemoBridgeIpAdress(NsdUtil.this.hostAdress.substring(1));
      }
    };
  }
  
  public void discoverServices()
  {
    this.mNsdManager.discoverServices("_hap._tcp.", 1, this.mDiscoveryListener);
  }
  
  public NsdServiceInfo getChosenServiceInfo()
  {
    return this.mService;
  }
  
  public void initializeDiscoveryListener(final CallbackContext paramCallbackContext)
  {
    this.mDiscoveryListener = new NsdManager.DiscoveryListener()
    {
      public void onDiscoveryStarted(String paramAnonymousString)
      {
        LogUtils.debugLog("NsdUtil", "Service discovery started");
      }
      
      public void onDiscoveryStopped(String paramAnonymousString)
      {
        LogUtils.infoLog("NsdUtil", "Discovery stopped: " + paramAnonymousString);
      }
      
      public void onServiceFound(NsdServiceInfo paramAnonymousNsdServiceInfo)
      {
        LogUtils.debugLog("NsdUtil", "Service discovery success" + paramAnonymousNsdServiceInfo);
        String str = paramAnonymousNsdServiceInfo.getServiceName();
        int i = paramAnonymousNsdServiceInfo.getPort();
        InetAddress localInetAddress = paramAnonymousNsdServiceInfo.getHost();
        LogUtils.debugLog("NsdUtil", "port: :" + i + "host: " + localInetAddress);
        if (!paramAnonymousNsdServiceInfo.getServiceType().equals("_hap._tcp.")) {
          LogUtils.debugLog("NsdUtil", "Unknown Service Type: " + paramAnonymousNsdServiceInfo.getServiceType());
        }
        do
        {
          return;
          if ((str.contains(NsdUtil.this.mServiceName)) || (str.contains(NsdUtil.this.mServiceNameBridge)))
          {
            LogUtils.debugLog("NsdUtil", "Bridge Discovered: " + NsdUtil.this.mServiceName);
            NsdUtil.this.mNsdManager.resolveService(paramAnonymousNsdServiceInfo, NsdUtil.this.mResolveListener);
            if (paramCallbackContext != null) {
              paramCallbackContext.success();
            }
            NsdUtil.this.stopDiscovery();
            return;
          }
        } while (!paramAnonymousNsdServiceInfo.getServiceName().contains(NsdUtil.this.mServiceName));
        NsdUtil.this.mNsdManager.resolveService(paramAnonymousNsdServiceInfo, NsdUtil.this.mResolveListener);
      }
      
      public void onServiceLost(NsdServiceInfo paramAnonymousNsdServiceInfo)
      {
        LogUtils.errorLog("NsdUtil", "service lost" + paramAnonymousNsdServiceInfo);
        if (NsdUtil.this.mService == paramAnonymousNsdServiceInfo) {
          NsdUtil.this.mService = null;
        }
      }
      
      public void onStartDiscoveryFailed(String paramAnonymousString, int paramAnonymousInt)
      {
        LogUtils.errorLog("NsdUtil", "Discovery failed: Error code:" + paramAnonymousInt);
      }
      
      public void onStopDiscoveryFailed(String paramAnonymousString, int paramAnonymousInt)
      {
        LogUtils.errorLog("NsdUtil", "Discovery failed: Error code:" + paramAnonymousInt);
      }
    };
  }
  
  public void initializeNsd(CallbackContext paramCallbackContext)
  {
    initializeResolveListener();
    initializeDiscoveryListener(paramCallbackContext);
  }
  
  public void registerService(int paramInt)
  {
    NsdServiceInfo localNsdServiceInfo = new NsdServiceInfo();
    localNsdServiceInfo.setPort(paramInt);
    localNsdServiceInfo.setServiceName(this.mServiceNameBridge);
    localNsdServiceInfo.setServiceType("_hap._tcp.");
    this.mNsdManager.registerService(localNsdServiceInfo, 1, this.mRegistrationListener);
  }
  
  public void stopDiscovery()
  {
    if (this.mDiscoveryListener != null) {
      this.mNsdManager.stopServiceDiscovery(this.mDiscoveryListener);
    }
  }
  
  public void tearDown()
  {
    this.mNsdManager.unregisterService(this.mRegistrationListener);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/utils/NsdUtil.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */