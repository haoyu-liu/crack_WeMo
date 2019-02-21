package net.lingala.zip4j.model;

import java.util.TimeZone;
import net.lingala.zip4j.util.InternalZipConstants;
import net.lingala.zip4j.util.Zip4jUtil;

public class ZipParameters
  implements Cloneable
{
  private int aesKeyStrength = -1;
  private int compressionLevel;
  private int compressionMethod = 8;
  private String defaultFolderPath;
  private boolean encryptFiles = false;
  private int encryptionMethod = -1;
  private String fileNameInZip;
  private boolean includeRootFolder = true;
  private boolean isSourceExternalStream;
  private char[] password;
  private boolean readHiddenFiles = true;
  private String rootFolderInZip;
  private int sourceFileCRC;
  private TimeZone timeZone = TimeZone.getDefault();
  
  public Object clone()
    throws CloneNotSupportedException
  {
    return super.clone();
  }
  
  public int getAesKeyStrength()
  {
    return this.aesKeyStrength;
  }
  
  public int getCompressionLevel()
  {
    return this.compressionLevel;
  }
  
  public int getCompressionMethod()
  {
    return this.compressionMethod;
  }
  
  public String getDefaultFolderPath()
  {
    return this.defaultFolderPath;
  }
  
  public int getEncryptionMethod()
  {
    return this.encryptionMethod;
  }
  
  public String getFileNameInZip()
  {
    return this.fileNameInZip;
  }
  
  public char[] getPassword()
  {
    return this.password;
  }
  
  public String getRootFolderInZip()
  {
    return this.rootFolderInZip;
  }
  
  public int getSourceFileCRC()
  {
    return this.sourceFileCRC;
  }
  
  public TimeZone getTimeZone()
  {
    return this.timeZone;
  }
  
  public boolean isEncryptFiles()
  {
    return this.encryptFiles;
  }
  
  public boolean isIncludeRootFolder()
  {
    return this.includeRootFolder;
  }
  
  public boolean isReadHiddenFiles()
  {
    return this.readHiddenFiles;
  }
  
  public boolean isSourceExternalStream()
  {
    return this.isSourceExternalStream;
  }
  
  public void setAesKeyStrength(int paramInt)
  {
    this.aesKeyStrength = paramInt;
  }
  
  public void setCompressionLevel(int paramInt)
  {
    this.compressionLevel = paramInt;
  }
  
  public void setCompressionMethod(int paramInt)
  {
    this.compressionMethod = paramInt;
  }
  
  public void setDefaultFolderPath(String paramString)
  {
    this.defaultFolderPath = paramString;
  }
  
  public void setEncryptFiles(boolean paramBoolean)
  {
    this.encryptFiles = paramBoolean;
  }
  
  public void setEncryptionMethod(int paramInt)
  {
    this.encryptionMethod = paramInt;
  }
  
  public void setFileNameInZip(String paramString)
  {
    this.fileNameInZip = paramString;
  }
  
  public void setIncludeRootFolder(boolean paramBoolean)
  {
    this.includeRootFolder = paramBoolean;
  }
  
  public void setPassword(String paramString)
  {
    if (paramString == null) {
      return;
    }
    setPassword(paramString.toCharArray());
  }
  
  public void setPassword(char[] paramArrayOfChar)
  {
    this.password = paramArrayOfChar;
  }
  
  public void setReadHiddenFiles(boolean paramBoolean)
  {
    this.readHiddenFiles = paramBoolean;
  }
  
  public void setRootFolderInZip(String paramString)
  {
    if (Zip4jUtil.isStringNotNullAndNotEmpty(paramString))
    {
      if ((!paramString.endsWith("\\")) && (!paramString.endsWith("/"))) {
        paramString = paramString + InternalZipConstants.FILE_SEPARATOR;
      }
      paramString = paramString.replaceAll("\\\\", "/");
    }
    this.rootFolderInZip = paramString;
  }
  
  public void setSourceExternalStream(boolean paramBoolean)
  {
    this.isSourceExternalStream = paramBoolean;
  }
  
  public void setSourceFileCRC(int paramInt)
  {
    this.sourceFileCRC = paramInt;
  }
  
  public void setTimeZone(TimeZone paramTimeZone)
  {
    this.timeZone = paramTimeZone;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/net/lingala/zip4j/model/ZipParameters.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */