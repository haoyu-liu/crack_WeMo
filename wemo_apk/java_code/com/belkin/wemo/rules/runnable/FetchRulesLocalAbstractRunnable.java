package com.belkin.wemo.rules.runnable;

import android.content.Context;
import android.text.TextUtils;
import com.belkin.utils.LogUtils;
import com.belkin.utils.RuleUtility;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.SharePreferences;
import com.belkin.wemo.cache.utils.WemoUtils;
import com.belkin.wemo.rules.device.IDeviceRules;
import com.belkin.wemo.rules.device.callback.FetchDeviceRulesCallback;
import com.belkin.wemo.rules.device.error.RuleDeviceError;
import com.belkin.wemo.rules.device.impl.DeviceRulesFactory;
import com.belkin.wemo.utils.WeMoUtils;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import org.cybergarage.upnp.ControlPoint;
import org.cybergarage.upnp.Device;

public abstract class FetchRulesLocalAbstractRunnable
  implements Runnable, FetchDeviceRulesCallback
{
  public static final String DB_DOWNLOAD_EXCEPTION = "DB Download failed.";
  public static final String INVALID_DB_PATH_EXCEPTION = "Invalid Device DB Path";
  public static final String TAG = "FetchRulesLocalAbstractRunnable";
  protected Context context;
  private int devicesCount;
  private int devicesFetchReceivedCount;
  private CountDownLatch latestDBLatch;
  private StringBuilder latestDBPathSB;
  private int latestDBVersion;
  private StringBuilder latestDBVersionDeviceUDN;
  private Object lock;
  private ArrayList<String> lowerDBVersionDeviceUDNsList;
  
  public FetchRulesLocalAbstractRunnable(Context paramContext)
  {
    this.context = paramContext;
    this.latestDBPathSB = new StringBuilder();
    this.latestDBVersionDeviceUDN = new StringBuilder();
    this.lock = new Object();
    this.lowerDBVersionDeviceUDNsList = new ArrayList();
  }
  
  private String downloadLatestDeviceDBToApp(String paramString, RuleUtility paramRuleUtility)
  {
    String str = new String();
    if (!TextUtils.isEmpty(paramString)) {
      return paramRuleUtility.DownloadFromUrl(paramString, "pluginrulesCompressed.zip");
    }
    LogUtils.errorLog("FetchRulesLocalAbstractRunnable", "Fetch Rules: Latest Device DB Path invalid. Path: " + paramString);
    return str;
  }
  
  private void onLatestDeviceDBCalculated()
  {
    LogUtils.infoLog("FetchRulesLocalAbstractRunnable", "Fetch Rules: response received for all devices");
    RuleUtility localRuleUtility = new RuleUtility(this.context);
    String str1 = new String();
    SharePreferences localSharePreferences = new SharePreferences(this.context);
    String str2 = localSharePreferences.getDBVersion();
    LogUtils.infoLog("FetchRulesLocalAbstractRunnable", "Fetch Rules: Latest Device DB Version = " + this.latestDBVersion);
    LogUtils.infoLog("FetchRulesLocalAbstractRunnable", "Fetch Rules: DB Version In App = " + str2);
    LogUtils.infoLog("FetchRulesLocalAbstractRunnable", "Fetch Rules: Latest device DB path: " + this.latestDBPathSB);
    if (((this.latestDBVersion != 0) && (this.latestDBVersion > Integer.valueOf(str2).intValue())) || (!RuleUtility.doesRulesDBFileExist()))
    {
      String str3 = this.latestDBPathSB.toString();
      if (!TextUtils.isEmpty(str3))
      {
        LogUtils.infoLog("FetchRulesLocalAbstractRunnable", "Fetch Rules: Setting new App DB Version to " + this.latestDBVersion);
        localSharePreferences.setDBVersion(String.valueOf(this.latestDBVersion));
        str1 = downloadLatestDeviceDBToApp(str3, localRuleUtility);
        if (TextUtils.isEmpty(str1)) {
          sendError(new Exception("DB Download failed."));
        }
      }
    }
    for (;;)
    {
      sendSuccessResponse(str1, this.latestDBVersion, this.lowerDBVersionDeviceUDNsList);
      return;
      sendError(new Exception("Invalid Device DB Path"));
      continue;
      str1 = localRuleUtility.getPragmaVersion();
    }
  }
  
  private Device recreateControlPointDevice(DeviceInformation paramDeviceInformation)
  {
    LogUtils.infoLog("FetchRulesLocalAbstractRunnable", "Fetch Rules: Recreating control point device for UDN: " + paramDeviceInformation.getUDN());
    ControlPoint localControlPoint = DeviceListManager.getInstance(this.context).getUpnpControl();
    if (!paramDeviceInformation.getUDN().contains("WEMO00")) {
      localControlPoint.searchResponseReceived(WemoUtils.createSSDPPacket(paramDeviceInformation.getIP(), paramDeviceInformation.getPort(), paramDeviceInformation.getUDN()), false, true);
    }
    return localControlPoint.getDevice(paramDeviceInformation.getUDN());
  }
  
  private void waitForFetchingRulesFromDevices()
  {
    try
    {
      if (this.latestDBLatch.await(12500L, TimeUnit.MILLISECONDS)) {
        LogUtils.infoLog("FetchRulesLocalAbstractRunnable", "Fetch rules: Latch count down completed in time.");
      }
      for (;;)
      {
        onLatestDeviceDBCalculated();
        return;
        LogUtils.errorLog("FetchRulesLocalAbstractRunnable", "Fetch Rules: TIMEOUT during wait for fetch rules from all devices. Timeout duration: 12500");
      }
      return;
    }
    catch (InterruptedException localInterruptedException)
    {
      LogUtils.errorLog("FetchRulesLocalAbstractRunnable", "Exception while awaiting latch countdown: ", localInterruptedException);
      sendError(localInterruptedException);
    }
  }
  
  public void onError(RuleDeviceError paramRuleDeviceError)
  {
    synchronized (this.lock)
    {
      this.devicesFetchReceivedCount = (1 + this.devicesFetchReceivedCount);
      LogUtils.errorLog("FetchRulesLocalAbstractRunnable", "Fetch Rules: fetch ERROR for device: " + paramRuleDeviceError.getDeviceUdn() + "\n Total device fetched count yet: " + this.devicesFetchReceivedCount);
      this.latestDBLatch.countDown();
      return;
    }
  }
  
  public void onSuccess(int paramInt, String paramString1, String paramString2)
  {
    synchronized (this.lock)
    {
      if (this.latestDBVersion < paramInt)
      {
        str = this.latestDBVersionDeviceUDN.toString();
        if (!TextUtils.isEmpty(str))
        {
          this.lowerDBVersionDeviceUDNsList.add(str);
          LogUtils.infoLog("FetchRulesLocalAbstractRunnable", "Fetch Rules: Device UDN with older versions of DB to be synced: " + str + ", version: " + this.latestDBVersion);
        }
        this.latestDBVersion = paramInt;
        this.latestDBVersionDeviceUDN.replace(0, this.latestDBVersionDeviceUDN.length(), paramString2);
        this.latestDBPathSB.replace(0, this.latestDBPathSB.length(), paramString1);
      }
      while (this.latestDBVersion <= paramInt)
      {
        String str;
        this.devicesFetchReceivedCount = (1 + this.devicesFetchReceivedCount);
        LogUtils.infoLog("FetchRulesLocalAbstractRunnable", "Fetch Rules: fetch SUCCESS for device: " + paramString2 + "\n DB Version: " + paramInt + "; DB Path: " + paramString1 + "\n Total device fetched count yet: " + this.devicesFetchReceivedCount);
        this.latestDBLatch.countDown();
        return;
      }
      LogUtils.infoLog("FetchRulesLocalAbstractRunnable", "Fetch Rules: Device UDN with older versions of DB to be synced, (if required) : " + paramString2 + ", version: " + paramInt);
      this.lowerDBVersionDeviceUDNsList.add(paramString2);
    }
  }
  
  public void run()
  {
    List localList = WeMoUtils.getWiFiDeviceList(this.context);
    this.devicesCount = localList.size();
    LogUtils.infoLog("FetchRulesLocalAbstractRunnable", "Fetch Rules: Total upnp devices count = " + this.devicesCount);
    this.latestDBLatch = new CountDownLatch(this.devicesCount);
    int i = 0;
    Iterator localIterator = localList.iterator();
    if (localIterator.hasNext())
    {
      DeviceInformation localDeviceInformation = (DeviceInformation)localIterator.next();
      LogUtils.infoLog("FetchRulesLocalAbstractRunnable", "Time: Fetch Rules local runnable: Runtime IN : " + System.currentTimeMillis());
      Device localDevice1 = localDeviceInformation.getDevice();
      if (localDevice1 != null)
      {
        LogUtils.infoLog("FetchRulesLocalAbstractRunnable", "Fetch Rules: Device: " + localDevice1.getUDN() + " IS AVAILABLE");
        IDeviceRules localIDeviceRules2 = new DeviceRulesFactory().getDeviceRulesInstance(localDevice1);
        if (localIDeviceRules2 != null)
        {
          localIDeviceRules2.fetchDeviceRulesData(localDevice1, this);
          i++;
        }
      }
      for (;;)
      {
        LogUtils.infoLog("FetchRulesLocalAbstractRunnable", "Time: Fetch Rules local runnable: Runtime OUT : " + System.currentTimeMillis());
        break;
        this.devicesFetchReceivedCount = (1 + this.devicesFetchReceivedCount);
        LogUtils.debugLog("FetchRulesLocalAbstractRunnable", "Fetch Rules: Latch count down by 1 as Device NOT valid for Fetch uPnP action to be sent.");
        this.latestDBLatch.countDown();
        continue;
        Device localDevice2 = recreateControlPointDevice(localDeviceInformation);
        if (localDevice2 != null)
        {
          localDeviceInformation.setDevice(localDevice2);
          LogUtils.infoLog("FetchRulesLocalAbstractRunnable", "Fetch Rules: Device: " + localDevice2.getUDN() + " IS AVAILABLE");
          IDeviceRules localIDeviceRules1 = new DeviceRulesFactory().getDeviceRulesInstance(localDevice2);
          if (localIDeviceRules1 != null)
          {
            localIDeviceRules1.fetchDeviceRulesData(localDevice2, this);
            i++;
          }
          else
          {
            this.devicesFetchReceivedCount = (1 + this.devicesFetchReceivedCount);
            LogUtils.debugLog("FetchRulesLocalAbstractRunnable", "Fetch Rules: Latch count down by 1 as Device NOT valid for Fetch uPnP action to be sent.");
            this.latestDBLatch.countDown();
          }
        }
        else
        {
          this.devicesFetchReceivedCount = (1 + this.devicesFetchReceivedCount);
          LogUtils.debugLog("FetchRulesLocalAbstractRunnable", "Fetch Rules: Latch count down by 1 as Device is NULL so NO Fetch uPnP action sent.");
          this.latestDBLatch.countDown();
        }
      }
    }
    LogUtils.infoLog("FetchRulesLocalAbstractRunnable", "Fetch Rules: Devices to which Fetch Rules is sent = " + i);
    if (i == 0)
    {
      DeviceListManager.getInstance(this.context).recreateControlPoint(true);
      sendError(new Exception("No device is online for rules processing."));
      return;
    }
    waitForFetchingRulesFromDevices();
  }
  
  protected abstract void sendError(Exception paramException);
  
  protected abstract void sendSuccessResponse(String paramString, int paramInt, ArrayList<String> paramArrayList);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */