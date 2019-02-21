package com.belkin.utils;

import android.content.Context;
import android.net.wifi.ScanResult;
import android.net.wifi.SupplicantState;
import android.net.wifi.WifiConfiguration;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import java.util.BitSet;
import java.util.List;

public class WifiUtil
{
  public static final int SECURITY_TYPE_EAP = 3;
  public static final int SECURITY_TYPE_NONE = 0;
  public static final int SECURITY_TYPE_PSK = 4;
  public static final int SECURITY_TYPE_WEP = 1;
  public static final int SECURITY_TYPE_WPA = 5;
  public static final int SECURITY_TYPE_WPS = 2;
  private final String FAIL = "Fail";
  private final String OPEN = "Open";
  private final String SECURED = "Secured";
  private final String SUCCESS = "Success";
  private Context mContext;
  private WifiManager mWifiManager;
  
  public WifiUtil(Context paramContext)
  {
    this.mContext = paramContext;
  }
  
  private int getSecurityType(String paramString)
  {
    int i;
    if (paramString.contains("WEP")) {
      i = 1;
    }
    boolean bool;
    do
    {
      return i;
      if (paramString.contains("PSK")) {
        return 4;
      }
      if (paramString.contains("EAP")) {
        return 3;
      }
      bool = paramString.contains("WPA");
      i = 0;
    } while (!bool);
    return 5;
  }
  
  private WifiConfiguration initConfiguration(String[] paramArrayOfString)
  {
    WifiConfiguration localWifiConfiguration = new WifiConfiguration();
    int i = getSecurityType(paramArrayOfString[1]);
    localWifiConfiguration.SSID = ("\"" + paramArrayOfString[0] + "\"");
    switch (i)
    {
    case 2: 
    default: 
      return localWifiConfiguration;
    case 0: 
      localWifiConfiguration.allowedKeyManagement.set(0);
      return localWifiConfiguration;
    case 1: 
      localWifiConfiguration.allowedKeyManagement.set(0);
      localWifiConfiguration.allowedAuthAlgorithms.set(0);
      localWifiConfiguration.allowedAuthAlgorithms.set(1);
      int j = paramArrayOfString[2].length();
      String str2 = paramArrayOfString[2];
      if (((j == 10) || (j == 26) || (j == 58)) && (str2.matches("[0-9A-Fa-f]*")))
      {
        localWifiConfiguration.wepKeys[0] = str2;
        return localWifiConfiguration;
      }
      localWifiConfiguration.wepKeys[0] = ('"' + str2 + '"');
      return localWifiConfiguration;
    case 4: 
      localWifiConfiguration.allowedKeyManagement.set(1);
      String str1 = paramArrayOfString[2];
      if (str1.matches("[0-9A-Fa-f]{64}"))
      {
        localWifiConfiguration.preSharedKey = str1;
        return localWifiConfiguration;
      }
      localWifiConfiguration.preSharedKey = ('"' + str1 + '"');
      return localWifiConfiguration;
    case 3: 
      localWifiConfiguration.allowedKeyManagement.set(2);
      localWifiConfiguration.allowedKeyManagement.set(3);
      localWifiConfiguration.wepKeys[0] = paramArrayOfString[2];
      return localWifiConfiguration;
    }
    localWifiConfiguration.allowedKeyManagement.set(1);
    localWifiConfiguration.allowedAuthAlgorithms.set(0);
    localWifiConfiguration.preSharedKey = paramArrayOfString[2];
    return localWifiConfiguration;
  }
  
  public List<ScanResult> checkAllWifiConnection()
  {
    this.mWifiManager = ((WifiManager)this.mContext.getSystemService("wifi"));
    this.mWifiManager.startScan();
    return this.mWifiManager.getScanResults();
  }
  
  public boolean checkConnectionStatus()
  {
    return this.mWifiManager.getConnectionInfo() == null;
  }
  
  public boolean checkWifiState()
  {
    this.mWifiManager = ((WifiManager)this.mContext.getSystemService("wifi"));
    return this.mWifiManager.isWifiEnabled();
  }
  
  public boolean connectWiFiNetwork(String[] paramArrayOfString)
  {
    WifiConfiguration localWifiConfiguration = initConfiguration(paramArrayOfString);
    localWifiConfiguration.status = 2;
    this.mWifiManager = ((WifiManager)this.mContext.getSystemService("wifi"));
    List localList = this.mWifiManager.getConfiguredNetworks();
    int i;
    if (localList != null)
    {
      int j = localList.size();
      if (j != 0)
      {
        for (int k = 0; k < j; k++) {
          if (localWifiConfiguration.SSID.equalsIgnoreCase(((WifiConfiguration)localList.get(k)).SSID))
          {
            int m = ((WifiConfiguration)localList.get(k)).networkId;
            this.mWifiManager.enableNetwork(m, true);
            this.mWifiManager.saveConfiguration();
            return this.mWifiManager.reconnect();
          }
        }
        i = this.mWifiManager.addNetwork(localWifiConfiguration);
      }
    }
    for (;;)
    {
      this.mWifiManager.enableNetwork(i, true);
      this.mWifiManager.saveConfiguration();
      if (!this.mWifiManager.reconnect()) {
        break;
      }
      return true;
      i = this.mWifiManager.addNetwork(localWifiConfiguration);
      continue;
      i = this.mWifiManager.addNetwork(localWifiConfiguration);
    }
    return false;
  }
  
  public String getConnectedWifiNetwork()
  {
    this.mWifiManager = ((WifiManager)this.mContext.getSystemService("wifi"));
    WifiManager localWifiManager = this.mWifiManager;
    String str = null;
    if (localWifiManager != null) {
      str = this.mWifiManager.getConnectionInfo().getSSID();
    }
    return str;
  }
  
  public String ifWifiConnected()
  {
    this.mWifiManager = ((WifiManager)this.mContext.getSystemService("wifi"));
    if (this.mWifiManager.getConnectionInfo().getSupplicantState().equals(SupplicantState.COMPLETED)) {
      return "Success";
    }
    return "Fail";
  }
  
  public String isSecureNetwork(String paramString)
  {
    if (getSecurityType(paramString) == 0) {
      return "Open";
    }
    return "Secured";
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/utils/WifiUtil.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */