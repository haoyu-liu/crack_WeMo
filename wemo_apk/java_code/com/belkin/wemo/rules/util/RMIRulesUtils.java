package com.belkin.wemo.rules.util;

import com.belkin.wemo.cache.cloud.CloudRequestManager;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.exception.InvalidArgumentsException;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.util.List;

public abstract interface RMIRulesUtils
{
  public static final String DEVICE_TYPE_AIR_PURIFIER = "airpurifier";
  public static final String DEVICE_TYPE_COFFEE_MAKER = "coffeemaker";
  public static final String DEVICE_TYPE_CROCKPOT = "crockpot";
  public static final String DEVICE_TYPE_HEATER = "heater";
  public static final String DEVICE_TYPE_HUMIDIFIER = "humidifier";
  
  public abstract void copyRulesDB(String paramString1, String paramString2)
    throws FileNotFoundException, IOException;
  
  public abstract void createZipFileInApp(String paramString1, String paramString2)
    throws IOException;
  
  public abstract boolean deleteRulesDBFileInApp();
  
  public abstract boolean doesRulesDBFileExist();
  
  public abstract void download(InputStream paramInputStream, OutputStream paramOutputStream)
    throws IOException;
  
  public abstract void downloadFromUrl(String paramString1, String paramString2)
    throws IOException;
  
  public abstract void downloadFromUrl(byte[] paramArrayOfByte, String paramString)
    throws IOException;
  
  public abstract CloudRequestManager getCloudRequestManager();
  
  public abstract String getDBFilePathWithNameInApp();
  
  public abstract DeviceInformation getDeviceInformationByUDNFromMemory(String paramString);
  
  public abstract String getFileInBase64Encoding(String paramString)
    throws InvalidArgumentsException;
  
  public abstract int getFileSizeInByte(String paramString);
  
  public abstract int getFirmwareVersionRevisionNumber(String paramString);
  
  public abstract List<DeviceInformation> getOnlineDeviceInformationList();
  
  public abstract String getRulesDBName();
  
  public abstract String getRulesDBPath();
  
  public abstract String getRulesDBPathInDevice(String paramString);
  
  public abstract String getRulesDBVerion();
  
  public abstract String getZippedDBFilePathWithNameInApp();
  
  public abstract boolean isFetchStoreRulesSupportedInDevice(DeviceInformation paramDeviceInformation);
  
  public abstract boolean isFetchStoreRulesSupportedInLocalDev(DeviceInformation paramDeviceInformation);
  
  public abstract boolean isFetchStoreRulesSupportedInRemoteDev(DeviceInformation paramDeviceInformation);
  
  public abstract boolean isLongPressRuleSupported(DeviceInformation paramDeviceInformation);
  
  public abstract boolean isSmartDevice(String paramString);
  
  public abstract byte[] readFile(String paramString);
  
  public abstract void setRulesDBVersion(String paramString);
  
  public abstract void writeDBToDevice(String paramString1, String paramString2, int paramInt)
    throws IOException;
  
  public abstract void writeDataToURL(URL paramURL, byte[] paramArrayOfByte, int paramInt)
    throws IOException;
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/util/RMIRulesUtils.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */