package com.belkin.wemo.storage;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.AssetManager;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.net.Uri;
import android.os.Environment;
import android.text.TextUtils;
import com.belkin.wemo.WeMo;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.cache.utils.SDKNetworkUtils;
import java.io.BufferedInputStream;
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
import java.util.Random;
import org.cybergarage.upnp.ssdp.SSDPPacket;

public class FileStorage
{
  public static String CACHE_FOLDER;
  public static String FILE_FOLDER;
  public static String LOGO_FOLDER;
  public static String PACKET_FOLDER;
  private static String TAG = FileStorage.class.getSimpleName();
  public static String TEMP_ICON_FOLDER;
  private static DBStorage mDBStorage = null;
  private static FileStorage mStorage = null;
  private Context mContext;
  private boolean reload = false;
  
  private FileStorage(Context paramContext)
  {
    this.mContext = paramContext;
    String str1 = "";
    paramContext.getFilesDir().toString();
    if (SDKLogUtils.isDebug()) {}
    for (String str2 = paramContext.getExternalFilesDir("Wemo").toString();; str2 = paramContext.getFilesDir().toString())
    {
      if (Environment.getExternalStorageState().equals("mounted")) {
        str1 = paramContext.getExternalFilesDir(null).toString();
      }
      FILE_FOLDER = str2 + "/files/";
      PACKET_FOLDER = str2 + "/packets/";
      LOGO_FOLDER = str2 + "/logo/";
      CACHE_FOLDER = str2 + "/cache/";
      TEMP_ICON_FOLDER = str1 + "/temp_icon/";
      new File(FILE_FOLDER).mkdirs();
      new File(PACKET_FOLDER).mkdirs();
      new File(LOGO_FOLDER).mkdirs();
      new File(CACHE_FOLDER).mkdirs();
      new File(TEMP_ICON_FOLDER).mkdirs();
      return;
    }
  }
  
  private void clear(File paramFile)
  {
    if (paramFile.isDirectory())
    {
      File[] arrayOfFile = paramFile.listFiles();
      int i = arrayOfFile.length;
      for (int j = 0; j < i; j++) {
        clear(arrayOfFile[j]);
      }
    }
    paramFile.delete();
  }
  
  private void deleteIcon(String paramString)
  {
    SDKLogUtils.debugLog(TAG, "Deleting Icon for MAC: " + paramString);
    File[] arrayOfFile = new File(LOGO_FOLDER).listFiles();
    if (arrayOfFile != null)
    {
      int i = arrayOfFile.length;
      for (int j = 0; j < i; j++)
      {
        File localFile = arrayOfFile[j];
        if (localFile.getName().contains(paramString)) {
          localFile.delete();
        }
      }
    }
  }
  
  public static boolean doesCustomIconExistAtLocation(String paramString)
  {
    boolean bool1 = TextUtils.isEmpty(paramString);
    boolean bool2 = false;
    if (!bool1)
    {
      boolean bool3 = new File(paramString).exists();
      bool2 = false;
      if (bool3) {
        bool2 = true;
      }
    }
    return bool2;
  }
  
  public static FileStorage getInstance(Context paramContext)
  {
    if (paramContext != null) {}
    try
    {
      mDBStorage = DBStorage.getInstance(paramContext);
      if (mStorage == null) {
        mStorage = new FileStorage(paramContext);
      }
      FileStorage localFileStorage = mStorage;
      return localFileStorage;
    }
    finally {}
  }
  
  private int getMaxIconVersion(File paramFile, String paramString)
  {
    int i = 0;
    File[] arrayOfFile = paramFile.listFiles();
    int j = arrayOfFile.length;
    int k = 0;
    while (k < j)
    {
      String str1 = arrayOfFile[k].getName();
      if (str1.indexOf(paramString) != -1) {}
      try
      {
        String str2 = str1.substring(0, str1.indexOf(" "));
        if (str2 != null)
        {
          int m = Integer.parseInt(str2.trim());
          if (m > i) {
            i = m;
          }
        }
        k++;
      }
      catch (Exception localException)
      {
        for (;;) {}
      }
    }
    return i;
  }
  
  public static File getStoragePath()
  {
    Context localContext = WeMo.INSTANCE.getContext();
    if (SDKLogUtils.isDebug()) {
      return localContext.getExternalFilesDir("Wemo");
    }
    return localContext.getFilesDir();
  }
  
  @TargetApi(21)
  private File saveFile(String paramString1, String paramString2, URL paramURL)
  {
    for (;;)
    {
      try
      {
        localFile1 = new File(paramString1, paramString2);
        try
        {
          SDKLogUtils.debugLog(TAG, "save method");
          localURLConnection = paramURL.openConnection();
          if ((paramURL.getHost() != null) && ((localURLConnection instanceof HttpURLConnection)))
          {
            ((HttpURLConnection)localURLConnection).setRequestMethod("GET");
            localURLConnection.setRequestProperty("Content-Length", "0");
            localURLConnection.setRequestProperty("HOST", paramURL.getHost());
          }
          SDKLogUtils.debugLog(TAG, "save method2");
          byte[] arrayOfByte = new byte['Ѐ'];
          if (!paramURL.toString().startsWith("file:///android_asset/")) {
            continue;
          }
          String str = paramURL.getPath().substring(15);
          localInputStream = this.mContext.getAssets().open(str);
          SDKLogUtils.debugLog(TAG, "save method3");
          if (localInputStream == null) {
            continue;
          }
          localFileOutputStream = new FileOutputStream(localFile1);
          int i = localInputStream.read(arrayOfByte);
          if (i == -1) {
            continue;
          }
          localFileOutputStream.write(arrayOfByte, 0, i);
          continue;
          SDKLogUtils.errorLog(TAG, "Download file error ", localIOException1);
        }
        catch (IOException localIOException1)
        {
          localFile2 = localFile1;
        }
      }
      catch (IOException localIOException2)
      {
        File localFile1;
        URLConnection localURLConnection;
        InputStream localInputStream;
        FileOutputStream localFileOutputStream;
        File localFile2 = null;
        continue;
      }
      return localFile2;
      localInputStream = localURLConnection.getInputStream();
    }
    localInputStream.close();
    localFileOutputStream.close();
    if ((localURLConnection instanceof HttpURLConnection)) {
      ((HttpURLConnection)localURLConnection).disconnect();
    }
    return localFile1;
  }
  
  private File saveIconInMemory(String paramString1, String paramString2, InputStream paramInputStream)
  {
    File localFile;
    try
    {
      localFile = new File(paramString1, paramString2);
      FileOutputStream localFileOutputStream = new FileOutputStream(localFile);
      byte[] arrayOfByte = new byte['Ѐ'];
      for (;;)
      {
        int i = paramInputStream.read(arrayOfByte);
        if (i <= 0) {
          break;
        }
        localFileOutputStream.write(arrayOfByte, 0, i);
      }
      localFileOutputStream.close();
    }
    catch (Exception localException)
    {
      SDKLogUtils.errorLog(TAG, "Exception: createFileFromInputStream--> ", localException);
      return null;
    }
    paramInputStream.close();
    return localFile;
  }
  
  public void clear(String paramString)
  {
    File localFile = new File(paramString);
    if (localFile.exists()) {
      clear(localFile);
    }
  }
  
  public void clearAll()
  {
    clear(getStoragePath() + "/Android/data/com.belkin.wemo.storage/");
  }
  
  public void emptyTempIconFolder()
  {
    SDKLogUtils.debugLog(TAG, "Deleting all files inside " + TEMP_ICON_FOLDER);
    File[] arrayOfFile = new File(TEMP_ICON_FOLDER).listFiles();
    int i = arrayOfFile.length;
    for (int j = 0; j < i; j++) {
      arrayOfFile[j].delete();
    }
  }
  
  public String getDefaultIconFileUrl(String paramString)
  {
    int i = getMaxIconVersion(new File(LOGO_FOLDER), paramString);
    String str = i + " " + paramString + " icon.jpg";
    File localFile = new File(LOGO_FOLDER, str);
    if (!localFile.exists()) {
      return "";
    }
    return localFile.getAbsolutePath();
  }
  
  public File getDescriptionFile(URL paramURL, String paramString)
  {
    SDKLogUtils.debugLog(TAG, "getDescriptionFile " + paramURL.toString() + " " + paramString.toString());
    String str = paramString + " " + Uri.parse(paramURL.getPath()).getLastPathSegment();
    File localFile = new File(FILE_FOLDER, str);
    SDKNetworkUtils localSDKNetworkUtils = new SDKNetworkUtils(this.mContext);
    SDKLogUtils.infoLog(TAG, "getDescriptionFile file: " + localFile.getAbsolutePath() + " reload: " + this.reload + " :: filename::" + str);
    if ((!localFile.exists()) || (paramString.equals("")) || (this.reload) || (localSDKNetworkUtils.isPluginConnected()))
    {
      SDKLogUtils.verboseLog("FileStorage", "getDescriptionFile fileName: " + str + " reload: " + this.reload);
      localFile = saveFile(FILE_FOLDER, str, paramURL);
    }
    if (mDBStorage != null) {
      mDBStorage.putData(localFile.getAbsolutePath());
    }
    return localFile;
  }
  
  public String getDeviceCache()
  {
    String str1 = "";
    FileInputStream localFileInputStream;
    BufferedReader localBufferedReader;
    StringBuilder localStringBuilder;
    try
    {
      File localFile = new File(CACHE_FOLDER, "cache");
      if (localFile.exists())
      {
        localFileInputStream = new FileInputStream(localFile);
        localBufferedReader = new BufferedReader(new InputStreamReader(localFileInputStream));
        localStringBuilder = new StringBuilder();
        for (;;)
        {
          String str2 = localBufferedReader.readLine();
          if (str2 == null) {
            break;
          }
          localStringBuilder.append(str2);
        }
      }
      return str1;
    }
    catch (IOException localIOException)
    {
      SDKLogUtils.errorLog(TAG, "Read cache error ", localIOException);
    }
    str1 = localStringBuilder.toString();
    localBufferedReader.close();
    localFileInputStream.close();
    return str1;
  }
  
  public File getEditedIconFile()
  {
    String str = "icon_" + getRandomNumber() + "_TEMP.jpg";
    return new File(TEMP_ICON_FOLDER, str);
  }
  
  public File getIconFile(URL paramURL, String paramString1, String paramString2)
  {
    String str = "icon_" + paramString2 + "_" + paramString1 + "_" + getRandomNumber() + ".jpg";
    new File(LOGO_FOLDER, str);
    deleteIcon(paramString2);
    File localFile = saveFile(LOGO_FOLDER, str, paramURL);
    if (mDBStorage != null) {
      mDBStorage.putData(localFile.getAbsolutePath());
    }
    SDKLogUtils.debugLog(TAG, "ICON Location in phone: getIconFile(): " + str + "; ID/UDN: " + paramString2 + "; Version: " + paramString1);
    return localFile;
  }
  
  public String getIconFileUrl(String paramString1, String paramString2)
  {
    String str = paramString1 + " " + paramString2 + " icon.jpg";
    File localFile = new File(LOGO_FOLDER, str);
    if (!localFile.exists()) {
      return "";
    }
    return localFile.getAbsolutePath();
  }
  
  public long getRandomNumber()
  {
    long l = Math.abs(new Random().nextLong());
    SDKLogUtils.debugLog(TAG, "Random number used for next icon: " + l);
    return l;
  }
  
  public SSDPPacket getSSDPPacket(String paramString)
  {
    File localFile = new File(PACKET_FOLDER, paramString);
    if (localFile.exists())
    {
      int i = (int)localFile.length();
      byte[] arrayOfByte = new byte[i];
      try
      {
        BufferedInputStream localBufferedInputStream = new BufferedInputStream(new FileInputStream(localFile));
        localBufferedInputStream.read(arrayOfByte, 0, i);
        localBufferedInputStream.close();
        SSDPPacket localSSDPPacket = new SSDPPacket(arrayOfByte, i);
        return localSSDPPacket;
      }
      catch (IOException localIOException)
      {
        SDKLogUtils.errorLog(TAG, "Read packet error ", localIOException);
      }
    }
    return null;
  }
  
  public String[] getSSDPPacketNames()
  {
    return new File(PACKET_FOLDER).list();
  }
  
  public String[] getSSDPPacketParameters(String paramString)
  {
    return paramString.split(" ");
  }
  
  public boolean isReload()
  {
    return this.reload;
  }
  
  public void saveDeviceCache(String paramString)
  {
    try
    {
      FileOutputStream localFileOutputStream = new FileOutputStream(new File(CACHE_FOLDER, "cache"));
      ByteArrayInputStream localByteArrayInputStream = new ByteArrayInputStream(paramString.getBytes());
      byte[] arrayOfByte = new byte['Ѐ'];
      for (;;)
      {
        int i = localByteArrayInputStream.read(arrayOfByte);
        if (i == -1) {
          break;
        }
        localFileOutputStream.write(arrayOfByte, 0, i);
      }
      return;
    }
    catch (FileNotFoundException localFileNotFoundException)
    {
      SDKLogUtils.errorLog(TAG, "Save cache error ", localFileNotFoundException);
      return;
      localByteArrayInputStream.close();
      localFileOutputStream.close();
      return;
    }
    catch (IOException localIOException)
    {
      SDKLogUtils.errorLog(TAG, "Save cache error ", localIOException);
    }
  }
  
  public File saveIconFile(String paramString1, String paramString2, String paramString3)
  {
    localObject = null;
    try
    {
      URL localURL = new URL(paramString1);
      String str = paramString2 + " " + paramString3 + " " + Uri.parse(localURL.getPath()).getLastPathSegment();
      localFile1 = new File(LOGO_FOLDER, str);
      File localFile2;
      localException1.printStackTrace();
    }
    catch (Exception localException1)
    {
      try
      {
        if (localFile1.exists()) {
          localFile1.delete();
        }
        localFile2 = saveFile(LOGO_FOLDER, str, localURL);
        localObject = localFile2;
        if (mDBStorage != null) {
          mDBStorage.putData(((File)localObject).getAbsolutePath());
        }
        return (File)localObject;
      }
      catch (Exception localException2)
      {
        for (;;)
        {
          File localFile1;
          localObject = localFile1;
        }
      }
      localException1 = localException1;
    }
    return (File)localObject;
  }
  
  public void saveSSDPPacket(SSDPPacket paramSSDPPacket, String paramString1, String paramString2, String paramString3)
  {
    String str = paramString2 + " " + paramString1 + " " + paramString3;
    File localFile = new File(PACKET_FOLDER, str);
    if ((!localFile.exists()) && (!paramString2.equals("")) && (!paramString1.equals(""))) {}
    try
    {
      FileOutputStream localFileOutputStream = new FileOutputStream(localFile);
      localFileOutputStream.write(paramSSDPPacket.packetBytes);
      localFileOutputStream.close();
      return;
    }
    catch (IOException localIOException)
    {
      SDKLogUtils.errorLog(TAG, "Download file error ", localIOException);
    }
  }
  
  public void setReload(boolean paramBoolean)
  {
    this.reload = paramBoolean;
  }
  
  public File storeDefaultIcon(URL paramURL, String paramString1, String paramString2)
  {
    localObject = null;
    try
    {
      localInputStream = this.mContext.getAssets().open("www/img/belkin_maker_small.png");
      str = paramString1 + " " + paramString2 + " " + Uri.parse(paramURL.getPath()).getLastPathSegment();
      localFile1 = new File(LOGO_FOLDER, str);
    }
    catch (Exception localException1)
    {
      InputStream localInputStream;
      String str;
      File localFile2;
      label109:
      SDKLogUtils.errorLog(TAG, "Exception: ", localException1);
      return (File)localObject;
    }
    try
    {
      if ((localFile1.exists()) && (!paramString1.equals(""))) {
        break label154;
      }
      localFile2 = saveIconInMemory(LOGO_FOLDER, str, localInputStream);
      localObject = localFile2;
    }
    catch (Exception localException2)
    {
      localObject = localFile1;
      break label131;
      localObject = localFile1;
      break label109;
    }
    if (mDBStorage != null) {
      mDBStorage.putData(((File)localObject).getAbsolutePath());
    }
    return (File)localObject;
  }
  
  public String storeEditedIcon(Bitmap paramBitmap)
  {
    File localFile = getEditedIconFile();
    try
    {
      FileOutputStream localFileOutputStream = new FileOutputStream(localFile);
      paramBitmap.compress(Bitmap.CompressFormat.PNG, 90, localFileOutputStream);
      SDKLogUtils.debugLog(TAG, "ICON Location in phone: storeEditedIcon(): " + localFile.getName());
      String str = localFile.getAbsolutePath();
      return str;
    }
    catch (Exception localException1) {}
    try
    {
      SDKLogUtils.errorLog(TAG, "Exception: createFileFromInputStream ", localException1);
      return "";
    }
    catch (Exception localException2)
    {
      for (;;)
      {
        SDKLogUtils.errorLog(TAG, "storeIcon Exception: ", localException2);
      }
    }
  }
  
  public String storeIcon(byte[] paramArrayOfByte, String paramString1, String paramString2)
  {
    try
    {
      String str1 = paramString1 + " " + paramString2 + " icon.jpg";
      localFile = new File(LOGO_FOLDER, str1);
      if (localFile.exists())
      {
        boolean bool = paramString1.equals("");
        if (!bool) {
          break label134;
        }
      }
      try
      {
        FileOutputStream localFileOutputStream = new FileOutputStream(localFile);
        localFileOutputStream.write(paramArrayOfByte, 0, paramArrayOfByte.length);
        localFileOutputStream.close();
        String str2 = localFile.getAbsolutePath();
        return str2;
      }
      catch (Exception localException2)
      {
        SDKLogUtils.errorLog(TAG, "Exception: createFileFromInputStream--> ", localException2);
        if (mDBStorage != null) {
          mDBStorage.putData(localFile.getAbsolutePath());
        }
      }
    }
    catch (Exception localException1)
    {
      for (;;)
      {
        File localFile;
        label134:
        String str3;
        SDKLogUtils.errorLog(TAG, "storeIcon Exception: ", localException1);
      }
    }
    return "";
    str3 = localFile.getAbsolutePath();
    return str3;
  }
  
  public String storeRemoteIcon(Bitmap paramBitmap, String paramString1, String paramString2)
  {
    String str1 = paramString1 + "_" + "icon" + "_" + paramString2 + "_" + getRandomNumber() + ".jpg";
    File localFile = new File(LOGO_FOLDER, str1);
    try
    {
      deleteIcon(paramString1);
      try
      {
        FileOutputStream localFileOutputStream = new FileOutputStream(localFile);
        paramBitmap.compress(Bitmap.CompressFormat.PNG, 90, localFileOutputStream);
        SDKLogUtils.debugLog(TAG, "ICON Location in phone: storeRemoteIcon(): " + str1 + "; ID/UDN: " + paramString1 + "; Version: " + paramString2);
        String str2 = localFile.getAbsolutePath();
        return str2;
      }
      catch (Exception localException2)
      {
        SDKLogUtils.errorLog(TAG, "Exception: createFileFromInputStream ", localException2);
      }
    }
    catch (Exception localException1)
    {
      for (;;)
      {
        SDKLogUtils.errorLog(TAG, "storeIcon Exception: ", localException1);
      }
    }
    return "";
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/storage/FileStorage.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */