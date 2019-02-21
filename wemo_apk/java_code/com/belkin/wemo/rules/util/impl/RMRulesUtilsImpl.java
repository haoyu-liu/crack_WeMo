package com.belkin.wemo.rules.util.impl;

import android.content.Context;
import android.text.TextUtils;
import android.util.Base64;
import com.belkin.wemo.WeMo;
import com.belkin.wemo.cache.cloud.CloudRequestManager;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.NetworkMode;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.exception.InvalidArgumentsException;
import com.belkin.wemo.rules.util.RMIRulesUtils;
import com.belkin.wemo.rules.util.UploadFileUtil;
import com.belkin.wemo.storage.FileStorage;
import com.belkin.wemo.utils.RMRulesSharedPreferences;
import com.belkin.wemo.utils.RMZipUtility;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import org.apache.commons.io.IOUtils;
import org.apache.http.util.ByteArrayBuffer;
import org.cybergarage.upnp.Action;
import org.cybergarage.upnp.ControlPoint;
import org.cybergarage.upnp.Device;

public class RMRulesUtilsImpl
  implements RMIRulesUtils
{
  public static final String TAG = RMRulesUtilsImpl.class.getSimpleName();
  
  private boolean isFetchStoreSupportedLocal(Device paramDevice)
  {
    Action localAction1 = paramDevice.getAction("FetchRules");
    Action localAction2 = paramDevice.getAction("StoreRules");
    if ((localAction1 != null) && (localAction2 != null))
    {
      SDKLogUtils.infoLog(TAG, "Fetch & Store Support Verification (Local): WeMo device SUPPORTS fecthRules() and storeRules() API.");
      return true;
    }
    SDKLogUtils.infoLog(TAG, "Fetch & Store Support Verification (Local): WeMo device DOES NOT SUPPORT fecthRules() and storeRules() API.");
    return false;
  }
  
  public void copyRulesDB(String paramString1, String paramString2)
    throws FileNotFoundException, IOException
  {
    if (paramString1.equals("0"))
    {
      paramString1 = getDBFilePathWithNameInApp();
      if (!paramString2.equals("0")) {
        break label132;
      }
      paramString2 = getDBFilePathWithNameInApp();
    }
    for (;;)
    {
      SDKLogUtils.debugLog(TAG, "Copy rules DB FROM: " + paramString1 + "; TO: " + paramString2);
      IOUtils.copy(new FileInputStream(new File(paramString1)), new FileOutputStream(new File(paramString2)));
      return;
      if (!paramString1.equals("1")) {
        break;
      }
      paramString1 = getRulesDBPath() + "pluginrules2Copy.db";
      break;
      label132:
      if (paramString2.equals("1")) {
        paramString2 = getRulesDBPath() + "pluginrules2Copy.db";
      }
    }
  }
  
  public void createZipFileInApp(String paramString1, String paramString2)
    throws IOException
  {
    SDKLogUtils.infoLog(TAG, "Creating ZIP file. File to ZIP: " + paramString1 + "\n ZIP file to create: " + paramString2);
    RMZipUtility.zip(new String[] { paramString1 }, paramString2);
  }
  
  public boolean deleteRulesDBFileInApp()
  {
    File localFile = new File(getDBFilePathWithNameInApp());
    boolean bool1 = localFile.exists();
    boolean bool2 = false;
    if (bool1) {
      bool2 = localFile.delete();
    }
    SDKLogUtils.debugLog(TAG, "RULES.DB file delete status: " + bool2 + "; Location: " + getDBFilePathWithNameInApp());
    return bool2;
  }
  
  public boolean doesRulesDBFileExist()
  {
    return new File(getDBFilePathWithNameInApp()).exists();
  }
  
  public void download(InputStream paramInputStream, OutputStream paramOutputStream)
    throws IOException
  {
    IOUtils.copy(paramInputStream, paramOutputStream);
    paramInputStream.close();
    paramOutputStream.close();
  }
  
  public void downloadFromUrl(String paramString1, String paramString2)
    throws IOException, FileNotFoundException
  {
    InputStream localInputStream = new URL(paramString1).openConnection().getInputStream();
    SDKLogUtils.debugLog(TAG, "Downloading file from URL. URL: " + paramString1);
    String str = FileStorage.getStoragePath() + "/databases/" + "rulesDBZippedTemp";
    File localFile = new File(FileStorage.getStoragePath() + "/databases/");
    if (!localFile.exists()) {
      localFile.mkdir();
    }
    download(localInputStream, new FileOutputStream(new File(localFile, "rulesDBZippedTemp")));
    RMZipUtility.unzip(str, paramString2);
  }
  
  public void downloadFromUrl(byte[] paramArrayOfByte, String paramString)
    throws IOException
  {
    FileOutputStream localFileOutputStream = WeMo.INSTANCE.getContext().openFileOutput("rulesDBZippedTemp", 0);
    download(new ByteArrayInputStream(paramArrayOfByte), localFileOutputStream);
    RMZipUtility.unzip(WeMo.INSTANCE.getContext().getFilesDir().getAbsolutePath() + File.separator + "rulesDBZippedTemp", paramString);
  }
  
  public CloudRequestManager getCloudRequestManager()
  {
    return new CloudRequestManager(WeMo.INSTANCE.getContext());
  }
  
  public String getDBFilePathWithNameInApp()
  {
    String str = FileStorage.getStoragePath() + "/unzipped/" + "pluginrules2.db";
    File localFile = new File(FileStorage.getStoragePath() + "/unzipped/");
    if (!localFile.exists()) {
      localFile.mkdirs();
    }
    return str;
  }
  
  public DeviceInformation getDeviceInformationByUDNFromMemory(String paramString)
  {
    return DeviceListManager.getInstance(WeMo.INSTANCE.getContext()).getDeviceInformationByUDNFromMemory(paramString);
  }
  
  public String getFileInBase64Encoding(String paramString)
    throws InvalidArgumentsException
  {
    byte[] arrayOfByte = UploadFileUtil.readFile(paramString);
    if (arrayOfByte != null)
    {
      String str = new String(Base64.encode(arrayOfByte, 0)).trim().replaceAll("\n", "").replaceAll("\\n", "").replaceAll("\n\r", "");
      SDKLogUtils.infoLog(TAG, "Base 64 encoded file lenght: " + str.length());
      return "<![CDATA[" + str + "]]>";
    }
    throw new InvalidArgumentsException("Converting file to Base64 encoding: Input fule is NULL at location: " + paramString);
  }
  
  public int getFileSizeInByte(String paramString)
  {
    int i = Integer.parseInt(String.valueOf(new File(paramString).length()));
    SDKLogUtils.debugLog(TAG, "FILE = " + paramString + "; SIZE = " + i);
    return i;
  }
  
  public int getFirmwareVersionRevisionNumber(String paramString)
  {
    int i = -1;
    if (!TextUtils.isEmpty(paramString))
    {
      SDKLogUtils.infoLog(TAG, "getFirmwareVersionRevisionNumber: FW Version String = " + paramString);
      String[] arrayOfString = paramString.split("\\.");
      if (arrayOfString.length >= 2) {
        i = Integer.valueOf(arrayOfString[2]).intValue();
      }
    }
    SDKLogUtils.infoLog(TAG, "getFirmwareVersionRevisionNumber. Revision number: " + i);
    return i;
  }
  
  public List<DeviceInformation> getOnlineDeviceInformationList()
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = DeviceListManager.getInstance(WeMo.INSTANCE.getContext()).getActiveDeviceInfoList().iterator();
    while (localIterator.hasNext())
    {
      DeviceInformation localDeviceInformation = (DeviceInformation)localIterator.next();
      if (localDeviceInformation.getUDN().contains("uuid")) {
        localArrayList.add(localDeviceInformation);
      }
    }
    return localArrayList;
  }
  
  public String getRulesDBName()
  {
    return "pluginrules2.db";
  }
  
  public String getRulesDBPath()
  {
    String str = FileStorage.getStoragePath() + "/unzipped/";
    File localFile = new File(str);
    if (!localFile.exists()) {
      localFile.mkdirs();
    }
    return str;
  }
  
  public String getRulesDBPathInDevice(String paramString)
  {
    String str1 = DeviceListManager.getIPForDevice(paramString);
    int i = DeviceListManager.getPortForDevice(paramString);
    String str2 = "http://" + str1 + ":" + i + "/" + "rules.db";
    SDKLogUtils.debugLog(TAG, "Device: " + paramString + "; Rules DB Path: " + str2);
    return str2;
  }
  
  public String getRulesDBVerion()
  {
    String str = RMRulesSharedPreferences.instance().getPlainString("rules_db_version", "0");
    SDKLogUtils.debugLog(TAG, "get rules DB version: " + str);
    return str;
  }
  
  public String getZippedDBFilePathWithNameInApp()
  {
    String str = "";
    Context localContext = WeMo.INSTANCE.getContext();
    if (localContext != null) {
      str = localContext.getFilesDir().getAbsolutePath() + File.separator + "rulesDBZip.db";
    }
    return str;
  }
  
  public boolean isFetchStoreRulesSupportedInDevice(DeviceInformation paramDeviceInformation)
  {
    if (NetworkMode.isLocal())
    {
      SDKLogUtils.infoLog(TAG, "Fetch & Store Support Verification: Type - Local");
      return isFetchStoreRulesSupportedInLocalDev(paramDeviceInformation);
    }
    SDKLogUtils.infoLog(TAG, "Fetch & Store Support Verification: Type - Remote");
    return isFetchStoreRulesSupportedInRemoteDev(paramDeviceInformation);
  }
  
  public boolean isFetchStoreRulesSupportedInLocalDev(DeviceInformation paramDeviceInformation)
  {
    boolean bool = false;
    String str2;
    if (paramDeviceInformation != null)
    {
      String str1 = paramDeviceInformation.getType();
      str2 = paramDeviceInformation.getUDN();
      SDKLogUtils.infoLog(TAG, "Fetch & Store Support Verification (Local): Device type: " + str1 + ", UDN: " + str2);
      if (isSmartDevice(str1)) {
        SDKLogUtils.infoLog(TAG, "Fetch & Store Support Verification (Local): WeMo device with device type: " + str1 + " is a SMART DEVICE.");
      }
    }
    for (;;)
    {
      SDKLogUtils.infoLog(TAG, "Fetch & Store Support Verification (Local): isSupported = " + bool);
      return bool;
      Device localDevice1 = paramDeviceInformation.getDevice();
      if (localDevice1 != null)
      {
        bool = isFetchStoreSupportedLocal(localDevice1);
      }
      else
      {
        SDKLogUtils.errorLog(TAG, "Fetch & Store Support Verification (Local): Control Point Device NOT FOUND for UDN: " + str2 + "; Trying via ControlPoint directly.");
        Device localDevice2 = DeviceListManager.getInstance(WeMo.INSTANCE.getContext()).getUpnpControl().getDevice(str2);
        if (localDevice2 != null)
        {
          paramDeviceInformation.setDevice(localDevice2, false);
          bool = isFetchStoreSupportedLocal(localDevice2);
        }
        else
        {
          SDKLogUtils.errorLog(TAG, "Fetch & Store Support Verification (Local): Device could not be found even in Control Point. UDN: ");
          bool = false;
          continue;
          SDKLogUtils.errorLog(TAG, "Fetch & Store Support Verification (Local): DeviceInformation Object is NULL: ");
          bool = false;
        }
      }
    }
  }
  
  public boolean isFetchStoreRulesSupportedInRemoteDev(DeviceInformation paramDeviceInformation)
  {
    int i = getFirmwareVersionRevisionNumber(paramDeviceInformation.getFirmwareVersion());
    boolean bool = false;
    if (i >= 8725) {
      bool = true;
    }
    SDKLogUtils.infoLog(TAG, "Fetch & Store Support Verification (Remote): isSupported = " + bool);
    return bool;
  }
  
  public boolean isLongPressRuleSupported(DeviceInformation paramDeviceInformation)
  {
    boolean bool1 = paramDeviceInformation.isAttributePresent("longPressRuleDeviceCnt");
    boolean bool2 = false;
    if (bool1) {
      bool2 = true;
    }
    return bool2;
  }
  
  public boolean isSmartDevice(String paramString)
  {
    if (!TextUtils.isEmpty(paramString))
    {
      String str = paramString.toLowerCase(Locale.getDefault());
      if ((str.contains("heater")) || (str.contains("airpurifier")) || (str.contains("humidifier")) || (str.contains("crockpot")) || (str.contains("coffeemaker"))) {
        return true;
      }
    }
    return false;
  }
  
  public byte[] readFile(String paramString)
  {
    SDKLogUtils.debugLog(TAG, "readFile: file path = " + paramString);
    ByteArrayBuffer localByteArrayBuffer;
    try
    {
      File localFile = new File(paramString);
      if ((!localFile.exists()) || (!localFile.canRead())) {
        break label144;
      }
      BufferedInputStream localBufferedInputStream = new BufferedInputStream(new FileInputStream(localFile));
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
      SDKLogUtils.errorLog(TAG, "Exception during readFile(): " + localException.getMessage());
      return null;
    }
    return localByteArrayBuffer.toByteArray();
    label144:
    SDKLogUtils.errorLog(TAG, "readFile(): File at " + paramString + " either does not exist or is not readable");
    return null;
  }
  
  public void setRulesDBVersion(String paramString)
  {
    SDKLogUtils.debugLog(TAG, "Set Rules DB Version to " + paramString);
    RMRulesSharedPreferences.instance().setPlainString("rules_db_version", paramString);
  }
  
  public void writeDBToDevice(String paramString1, String paramString2, int paramInt)
    throws IOException
  {
    writeDataToURL(new URL(paramString2), readFile(paramString1), paramInt);
  }
  
  public void writeDataToURL(URL paramURL, byte[] paramArrayOfByte, int paramInt)
    throws IOException
  {
    HttpURLConnection localHttpURLConnection = (HttpURLConnection)paramURL.openConnection();
    localHttpURLConnection.setRequestMethod("POST");
    localHttpURLConnection.setChunkedStreamingMode(0);
    localHttpURLConnection.setDoOutput(true);
    localHttpURLConnection.setReadTimeout(paramInt);
    BufferedOutputStream localBufferedOutputStream = new BufferedOutputStream(localHttpURLConnection.getOutputStream());
    localBufferedOutputStream.write(paramArrayOfByte);
    localBufferedOutputStream.flush();
    BufferedReader localBufferedReader = new BufferedReader(new InputStreamReader(localHttpURLConnection.getInputStream()));
    String str2;
    for (String str1 = "";; str1 = str1 + str2 + "\n")
    {
      str2 = localBufferedReader.readLine();
      if (str2 == null) {
        break;
      }
    }
    localBufferedOutputStream.close();
    SDKLogUtils.debugLog(TAG, "writeDataToURL: decoded string = " + str1);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/util/impl/RMRulesUtilsImpl.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */