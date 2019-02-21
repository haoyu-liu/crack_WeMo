package net.lingala.zip4j.unzip;

import java.io.File;
import net.lingala.zip4j.exception.ZipException;
import net.lingala.zip4j.model.FileHeader;
import net.lingala.zip4j.model.UnzipParameters;
import net.lingala.zip4j.util.Zip4jUtil;

public class UnzipUtil
{
  public static void applyFileAttributes(FileHeader paramFileHeader, File paramFile)
    throws ZipException
  {
    applyFileAttributes(paramFileHeader, paramFile, null);
  }
  
  public static void applyFileAttributes(FileHeader paramFileHeader, File paramFile, UnzipParameters paramUnzipParameters)
    throws ZipException
  {
    if (paramFileHeader == null) {
      throw new ZipException("cannot set file properties: file header is null");
    }
    if (paramFile == null) {
      throw new ZipException("cannot set file properties: output file is null");
    }
    if (!Zip4jUtil.checkFileExists(paramFile)) {
      throw new ZipException("cannot set file properties: file doesnot exist");
    }
    if ((paramUnzipParameters == null) || (!paramUnzipParameters.isIgnoreDateTimeAttributes())) {
      setFileLastModifiedTime(paramFileHeader, paramFile);
    }
    if (paramUnzipParameters == null)
    {
      setFileAttributes(paramFileHeader, paramFile, true, true, true, true);
      return;
    }
    if (paramUnzipParameters.isIgnoreAllFileAttributes())
    {
      setFileAttributes(paramFileHeader, paramFile, false, false, false, false);
      return;
    }
    boolean bool1;
    boolean bool2;
    label111:
    boolean bool3;
    if (paramUnzipParameters.isIgnoreReadOnlyFileAttribute())
    {
      bool1 = false;
      if (!paramUnzipParameters.isIgnoreHiddenFileAttribute()) {
        break label149;
      }
      bool2 = false;
      if (!paramUnzipParameters.isIgnoreArchiveFileAttribute()) {
        break label155;
      }
      bool3 = false;
      label121:
      if (!paramUnzipParameters.isIgnoreSystemFileAttribute()) {
        break label161;
      }
    }
    label149:
    label155:
    label161:
    for (boolean bool4 = false;; bool4 = true)
    {
      setFileAttributes(paramFileHeader, paramFile, bool1, bool2, bool3, bool4);
      return;
      bool1 = true;
      break;
      bool2 = true;
      break label111;
      bool3 = true;
      break label121;
    }
  }
  
  private static void setFileAttributes(FileHeader paramFileHeader, File paramFile, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3, boolean paramBoolean4)
    throws ZipException
  {
    if (paramFileHeader == null) {
      throw new ZipException("invalid file header. cannot set file attributes");
    }
    byte[] arrayOfByte = paramFileHeader.getExternalFileAttr();
    if (arrayOfByte == null) {}
    do
    {
      do
      {
        do
        {
          do
          {
            do
            {
              do
              {
                do
                {
                  do
                  {
                    return;
                    switch (arrayOfByte[0])
                    {
                    default: 
                      return;
                    }
                  } while (!paramBoolean1);
                  Zip4jUtil.setFileReadOnly(paramFile);
                  return;
                } while (!paramBoolean2);
                Zip4jUtil.setFileHidden(paramFile);
                return;
              } while (!paramBoolean3);
              Zip4jUtil.setFileArchive(paramFile);
              return;
              if (paramBoolean1) {
                Zip4jUtil.setFileReadOnly(paramFile);
              }
            } while (!paramBoolean2);
            Zip4jUtil.setFileHidden(paramFile);
            return;
            if (paramBoolean3) {
              Zip4jUtil.setFileArchive(paramFile);
            }
          } while (!paramBoolean1);
          Zip4jUtil.setFileReadOnly(paramFile);
          return;
          if (paramBoolean3) {
            Zip4jUtil.setFileArchive(paramFile);
          }
        } while (!paramBoolean2);
        Zip4jUtil.setFileHidden(paramFile);
        return;
        if (paramBoolean3) {
          Zip4jUtil.setFileArchive(paramFile);
        }
        if (paramBoolean1) {
          Zip4jUtil.setFileReadOnly(paramFile);
        }
      } while (!paramBoolean2);
      Zip4jUtil.setFileHidden(paramFile);
      return;
      if (paramBoolean1) {
        Zip4jUtil.setFileReadOnly(paramFile);
      }
      if (paramBoolean2) {
        Zip4jUtil.setFileHidden(paramFile);
      }
    } while (!paramBoolean4);
    Zip4jUtil.setFileSystemMode(paramFile);
  }
  
  private static void setFileLastModifiedTime(FileHeader paramFileHeader, File paramFile)
    throws ZipException
  {
    if (paramFileHeader.getLastModFileTime() <= 0) {}
    while (!paramFile.exists()) {
      return;
    }
    paramFile.setLastModified(Zip4jUtil.dosToJavaTme(paramFileHeader.getLastModFileTime()));
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/net/lingala/zip4j/unzip/UnzipUtil.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */