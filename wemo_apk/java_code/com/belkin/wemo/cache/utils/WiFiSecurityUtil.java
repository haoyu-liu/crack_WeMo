package com.belkin.wemo.cache.utils;

import android.content.Context;
import android.net.wifi.ScanResult;
import android.net.wifi.WifiConfiguration;
import android.net.wifi.WifiManager;
import android.os.Build;
import android.provider.Settings.Secure;
import android.util.Base64;
import com.belkin.wemo.PermissionController;
import java.io.PrintStream;
import java.util.Arrays;
import java.util.BitSet;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;
import javax.crypto.Cipher;
import javax.crypto.Mac;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;

public class WiFiSecurityUtil
{
  public static final int MIN_LENGTH_UNIQUE_ID = 13;
  public static final String TAG = "WiFiSecurityUtil";
  private int CHANNEL_NUMBER = -1;
  private final String PBEWithMD5And128BitAES = "PBEWithMD5And128BitAES-CBC-OpenSSL";
  private PermissionController mpermissionController;
  private String password = "";
  private String type = "";
  private String username = "";
  
  private String generatePrivateKey(String[] paramArrayOfString)
  {
    String str = null;
    if (paramArrayOfString != null) {
      str = paramArrayOfString[0].substring(0, 6) + paramArrayOfString[1] + paramArrayOfString[0].substring(6, 13);
    }
    return str;
  }
  
  private static long numbGen()
  {
    long l;
    do
    {
      l = (1000000.0D * (1.0E8D * Math.random()));
    } while (String.valueOf(l).length() != 13);
    return l;
  }
  
  private String padString(String paramString, int paramInt, char paramChar)
  {
    if ((paramString != null) && (paramString.length() < paramInt))
    {
      char[] arrayOfChar = new char[paramInt - paramString.length()];
      Arrays.fill(arrayOfChar, paramChar);
      return new String(arrayOfChar) + paramString;
    }
    return paramString;
  }
  
  public boolean addNewWiFiSetting(Context paramContext)
  {
    WifiConfiguration localWifiConfiguration = new WifiConfiguration();
    localWifiConfiguration.SSID = "\"".concat(this.username).concat("\"");
    localWifiConfiguration.status = 1;
    localWifiConfiguration.hiddenSSID = true;
    localWifiConfiguration.priority = 40;
    if (this.type.equalsIgnoreCase("OPEN"))
    {
      localWifiConfiguration.allowedKeyManagement.set(0);
      localWifiConfiguration.allowedProtocols.set(1);
      localWifiConfiguration.allowedProtocols.set(0);
      localWifiConfiguration.allowedAuthAlgorithms.clear();
      localWifiConfiguration.allowedPairwiseCiphers.set(2);
      localWifiConfiguration.allowedPairwiseCiphers.set(1);
      localWifiConfiguration.allowedGroupCiphers.set(0);
      localWifiConfiguration.allowedGroupCiphers.set(1);
      localWifiConfiguration.allowedGroupCiphers.set(3);
      localWifiConfiguration.allowedGroupCiphers.set(2);
    }
    for (;;)
    {
      WifiManager localWifiManager = (WifiManager)paramContext.getSystemService("wifi");
      int i = localWifiManager.addNetwork(localWifiConfiguration);
      Iterator localIterator = localWifiManager.getScanResults().iterator();
      while (localIterator.hasNext())
      {
        ScanResult localScanResult = (ScanResult)localIterator.next();
        if (localScanResult.SSID.equalsIgnoreCase(this.username))
        {
          this.CHANNEL_NUMBER = (1 + (63124 + localScanResult.frequency) / 5);
          if (this.CHANNEL_NUMBER >= 15) {
            this.CHANNEL_NUMBER = 14;
          }
        }
      }
      if (i == -1) {
        break;
      }
      return true;
      if (this.type.equalsIgnoreCase("WEP"))
      {
        localWifiConfiguration.allowedKeyManagement.set(0);
        localWifiConfiguration.allowedProtocols.set(1);
        localWifiConfiguration.allowedProtocols.set(0);
        localWifiConfiguration.allowedAuthAlgorithms.set(0);
        localWifiConfiguration.allowedAuthAlgorithms.set(1);
        localWifiConfiguration.allowedPairwiseCiphers.set(2);
        localWifiConfiguration.allowedPairwiseCiphers.set(1);
        localWifiConfiguration.allowedGroupCiphers.set(0);
        localWifiConfiguration.allowedGroupCiphers.set(1);
        localWifiConfiguration.wepKeys[0] = "\"".concat(this.password).concat("\"");
        localWifiConfiguration.wepTxKeyIndex = 0;
      }
      else if (this.type.contains("WPA/WPA2 PSK"))
      {
        localWifiConfiguration.allowedProtocols.set(1);
        localWifiConfiguration.allowedProtocols.set(0);
        localWifiConfiguration.allowedKeyManagement.set(1);
        localWifiConfiguration.allowedPairwiseCiphers.set(2);
        localWifiConfiguration.allowedPairwiseCiphers.set(1);
        localWifiConfiguration.allowedGroupCiphers.set(0);
        localWifiConfiguration.allowedGroupCiphers.set(1);
        localWifiConfiguration.allowedGroupCiphers.set(3);
        localWifiConfiguration.allowedGroupCiphers.set(2);
        localWifiConfiguration.preSharedKey = "\"".concat(this.password).concat("\"");
      }
      else
      {
        localWifiConfiguration.allowedProtocols.set(1);
        localWifiConfiguration.allowedProtocols.set(0);
        localWifiConfiguration.allowedKeyManagement.set(1);
        localWifiConfiguration.allowedPairwiseCiphers.set(2);
        localWifiConfiguration.allowedPairwiseCiphers.set(1);
        localWifiConfiguration.allowedGroupCiphers.set(0);
        localWifiConfiguration.allowedGroupCiphers.set(1);
        localWifiConfiguration.allowedGroupCiphers.set(3);
        localWifiConfiguration.allowedGroupCiphers.set(2);
        localWifiConfiguration.preSharedKey = "\"".concat(this.password).concat("\"");
      }
    }
    return false;
  }
  
  public String decrypt(String paramString, Context paramContext)
  {
    String[] arrayOfString = new String[2];
    arrayOfString[0] = getDeviceID(paramContext);
    arrayOfString[1] = getDeviceID(paramContext);
    String str1 = generatePrivateKey(arrayOfString);
    if (str1 == null) {
      return null;
    }
    byte[] arrayOfByte1 = new byte[8];
    byte[] arrayOfByte2 = new byte[16];
    byte[] arrayOfByte3 = Base64.decode(paramString, 0);
    try
    {
      SecretKeyFactory localSecretKeyFactory = SecretKeyFactory.getInstance("PBEWithMD5And128BitAES-CBC-OpenSSL");
      System.arraycopy(str1.substring(0, 8).getBytes(), 0, arrayOfByte1, 0, 8);
      System.arraycopy(str1.substring(0, 16).getBytes(), 0, arrayOfByte2, 0, 16);
      PBEKeySpec localPBEKeySpec = new PBEKeySpec(str1.toCharArray(), arrayOfByte1, 1, 128);
      SecretKeySpec localSecretKeySpec = new SecretKeySpec(localSecretKeyFactory.generateSecret(localPBEKeySpec).getEncoded(), "AES");
      Cipher localCipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
      IvParameterSpec localIvParameterSpec = new IvParameterSpec(arrayOfByte2);
      localCipher.init(2, localSecretKeySpec, localIvParameterSpec);
      String str2 = new String(localCipher.doFinal(arrayOfByte3));
      return str2;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
    return null;
  }
  
  public String encrypt(String paramString, Context paramContext, int paramInt, String[] paramArrayOfString)
  {
    String str2;
    String str3;
    if (paramInt == 0)
    {
      str2 = generatePrivateKey(paramArrayOfString);
      System.out.println("keydata is : " + str2);
      if (str2 != null) {
        break label80;
      }
      str3 = null;
    }
    label80:
    do
    {
      return str3;
      String str1 = getDeviceID(paramContext);
      str2 = generatePrivateKey(new String[] { str1, str1 });
      break;
      byte[] arrayOfByte1 = new byte[8];
      byte[] arrayOfByte2 = new byte[16];
      try
      {
        SecretKeyFactory localSecretKeyFactory = SecretKeyFactory.getInstance("PBEWithMD5And128BitAES-CBC-OpenSSL");
        System.arraycopy(str2.substring(0, 8).getBytes(), 0, arrayOfByte1, 0, 8);
        System.arraycopy(str2.substring(0, 16).getBytes(), 0, arrayOfByte2, 0, 16);
        PBEKeySpec localPBEKeySpec = new PBEKeySpec(str2.toCharArray(), arrayOfByte1, 1, 128);
        SecretKeySpec localSecretKeySpec = new SecretKeySpec(localSecretKeyFactory.generateSecret(localPBEKeySpec).getEncoded(), "AES");
        Cipher localCipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
        IvParameterSpec localIvParameterSpec = new IvParameterSpec(arrayOfByte2);
        localCipher.init(1, localSecretKeySpec, localIvParameterSpec);
        byte[] arrayOfByte4 = localCipher.doFinal(paramString.getBytes());
        arrayOfByte3 = arrayOfByte4;
      }
      catch (Exception localException)
      {
        for (;;)
        {
          String str4;
          localException.printStackTrace();
          byte[] arrayOfByte3 = null;
        }
      }
      str3 = Base64.encodeToString(arrayOfByte3, 0);
    } while (paramInt != 0);
    str4 = str3 + Integer.toHexString(str3.length());
    if (paramString.length() <= 15) {
      str4 = str4 + "0";
    }
    return str4 + Integer.toHexString(paramString.length());
  }
  
  public String generateAuthCode(Context paramContext)
  {
    Object localObject = "";
    SharePreferences localSharePreferences = new SharePreferences(paramContext);
    long l = 200L + System.currentTimeMillis() / 1000L;
    String str1 = getDeviceID(paramContext);
    String str2 = str1 + "\n" + "\n" + l;
    String str3 = localSharePreferences.getPrivateKey();
    if (str3 != null) {}
    try
    {
      Mac localMac = Mac.getInstance("HmacSHA1");
      localMac.init(new SecretKeySpec(str3.getBytes(), localMac.getAlgorithm()));
      String str4 = new String(Base64.encode(localMac.doFinal(str2.getBytes()), 0)).trim();
      String str5 = "\n SDU " + str1 + ":" + str4 + ":" + l;
      localObject = str5;
      return (String)localObject;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
    return (String)localObject;
  }
  
  public String getDeviceID(Context paramContext)
  {
    SharePreferences localSharePreferences = new SharePreferences(paramContext);
    String str = null;
    try
    {
      str = localSharePreferences.getUniqueID();
      if (str == null)
      {
        str = Settings.Secure.getString(paramContext.getContentResolver(), "android_id");
        SDKLogUtils.infoLog("WiFiSecurityUtil", "Android_id as UniqueID: " + str);
        if (str == null) {
          str = Build.SERIAL;
        }
        if ((str != null) && (str.length() < 13)) {
          str = padString(str, 13, '0');
        }
        if (str == null) {
          str = String.valueOf(numbGen());
        }
        if (str == null)
        {
          str = UUID.randomUUID().toString();
          SDKLogUtils.infoLog("WiFiSecurityUtil", "UUID  as uniqueID: " + str);
        }
        localSharePreferences.setUniqueID(str);
      }
      return str;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
    return str;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/utils/WiFiSecurityUtil.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */