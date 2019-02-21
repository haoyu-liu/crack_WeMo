package org.cybergarage.util;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;

public final class FileUtil
{
  public static final boolean isXMLFileName(String paramString)
  {
    if (!StringUtil.hasData(paramString)) {
      return false;
    }
    return paramString.toLowerCase().endsWith("xml");
  }
  
  public static final byte[] load(File paramFile)
  {
    try
    {
      byte[] arrayOfByte = load(new FileInputStream(paramFile));
      return arrayOfByte;
    }
    catch (Exception localException)
    {
      Debug.warning(localException);
    }
    return new byte[0];
  }
  
  public static final byte[] load(FileInputStream paramFileInputStream)
  {
    byte[] arrayOfByte1 = new byte[524288];
    try
    {
      ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
      for (int i = paramFileInputStream.read(arrayOfByte1); i > 0; i = paramFileInputStream.read(arrayOfByte1)) {
        localByteArrayOutputStream.write(arrayOfByte1, 0, i);
      }
      paramFileInputStream.close();
      byte[] arrayOfByte2 = localByteArrayOutputStream.toByteArray();
      return arrayOfByte2;
    }
    catch (Exception localException)
    {
      Debug.warning(localException);
    }
    return new byte[0];
  }
  
  public static final byte[] load(String paramString)
  {
    try
    {
      byte[] arrayOfByte = load(new FileInputStream(paramString));
      return arrayOfByte;
    }
    catch (Exception localException)
    {
      Debug.warning(localException);
    }
    return new byte[0];
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/util/FileUtil.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */