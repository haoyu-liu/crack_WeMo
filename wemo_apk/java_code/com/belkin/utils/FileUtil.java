package com.belkin.utils;

import java.io.File;

public class FileUtil
{
  static boolean isEmptyDirectory(String paramString)
  {
    File[] arrayOfFile = new File(paramString).listFiles();
    if (arrayOfFile == null) {}
    while (arrayOfFile.length == 0) {
      return false;
    }
    return true;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/utils/FileUtil.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */