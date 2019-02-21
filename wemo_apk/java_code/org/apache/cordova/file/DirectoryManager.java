package org.apache.cordova.file;

import android.os.Environment;
import android.os.StatFs;
import com.belkin.utils.RuleUtility;
import java.io.File;

public class DirectoryManager
{
  private static final String LOG_TAG = "DirectoryManager";
  
  private static File constructFilePaths(String paramString1, String paramString2)
  {
    if (paramString2.startsWith(paramString1)) {
      return new File(paramString2);
    }
    return new File(paramString1 + "/" + paramString2);
  }
  
  private static long freeSpaceCalculation(String paramString)
  {
    StatFs localStatFs = new StatFs(paramString);
    return localStatFs.getBlockSize() * localStatFs.getAvailableBlocks() / 1024L;
  }
  
  public static long getFreeDiskSpace(boolean paramBoolean)
  {
    if (Environment.getExternalStorageState().equals("mounted")) {}
    for (long l = freeSpaceCalculation(RuleUtility.getStoragePath().getPath());; l = freeSpaceCalculation("/"))
    {
      return l;
      if (!paramBoolean) {
        break;
      }
    }
    return -1L;
  }
  
  public static boolean testFileExists(String paramString)
  {
    if ((testSaveLocationExists()) && (!paramString.equals(""))) {
      return constructFilePaths(RuleUtility.getStoragePath().toString(), paramString).exists();
    }
    return false;
  }
  
  public static boolean testSaveLocationExists()
  {
    return Environment.getExternalStorageState().equals("mounted");
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/cordova/file/DirectoryManager.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */