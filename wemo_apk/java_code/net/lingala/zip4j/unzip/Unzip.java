package net.lingala.zip4j.unzip;

import java.io.File;
import java.util.ArrayList;
import net.lingala.zip4j.exception.ZipException;
import net.lingala.zip4j.io.ZipInputStream;
import net.lingala.zip4j.model.CentralDirectory;
import net.lingala.zip4j.model.FileHeader;
import net.lingala.zip4j.model.UnzipParameters;
import net.lingala.zip4j.model.Zip64ExtendedInfo;
import net.lingala.zip4j.model.ZipModel;
import net.lingala.zip4j.progress.ProgressMonitor;
import net.lingala.zip4j.util.InternalZipConstants;
import net.lingala.zip4j.util.Zip4jUtil;

public class Unzip
{
  private ZipModel zipModel;
  
  public Unzip(ZipModel paramZipModel)
    throws ZipException
  {
    if (paramZipModel == null) {
      throw new ZipException("ZipModel is null");
    }
    this.zipModel = paramZipModel;
  }
  
  private long calculateTotalWork(ArrayList paramArrayList)
    throws ZipException
  {
    if (paramArrayList == null) {
      throw new ZipException("fileHeaders is null, cannot calculate total work");
    }
    long l = 0L;
    int i = 0;
    if (i >= paramArrayList.size()) {
      return l;
    }
    FileHeader localFileHeader = (FileHeader)paramArrayList.get(i);
    if ((localFileHeader.getZip64ExtendedInfo() != null) && (localFileHeader.getZip64ExtendedInfo().getUnCompressedSize() > 0L)) {}
    for (l += localFileHeader.getZip64ExtendedInfo().getCompressedSize();; l += localFileHeader.getCompressedSize())
    {
      i++;
      break;
    }
  }
  
  private void checkOutputDirectoryStructure(FileHeader paramFileHeader, String paramString1, String paramString2)
    throws ZipException
  {
    if ((paramFileHeader == null) || (!Zip4jUtil.isStringNotNullAndNotEmpty(paramString1))) {
      throw new ZipException("Cannot check output directory structure...one of the parameters was null");
    }
    String str1 = paramFileHeader.getFileName();
    if (Zip4jUtil.isStringNotNullAndNotEmpty(paramString2)) {
      str1 = paramString2;
    }
    if (!Zip4jUtil.isStringNotNullAndNotEmpty(str1)) {}
    for (;;)
    {
      return;
      String str2 = paramString1 + str1;
      try
      {
        File localFile = new File(new File(str2).getParent());
        if (localFile.exists()) {
          continue;
        }
        localFile.mkdirs();
        return;
      }
      catch (Exception localException)
      {
        throw new ZipException(localException);
      }
    }
  }
  
  private void initExtractAll(ArrayList paramArrayList, UnzipParameters paramUnzipParameters, ProgressMonitor paramProgressMonitor, String paramString)
    throws ZipException
  {
    for (int i = 0;; i++)
    {
      if (i >= paramArrayList.size()) {
        return;
      }
      initExtractFile((FileHeader)paramArrayList.get(i), paramString, paramUnzipParameters, null, paramProgressMonitor);
      if (paramProgressMonitor.isCancelAllTasks())
      {
        paramProgressMonitor.setResult(3);
        paramProgressMonitor.setState(0);
        return;
      }
    }
  }
  
  private void initExtractFile(FileHeader paramFileHeader, String paramString1, UnzipParameters paramUnzipParameters, String paramString2, ProgressMonitor paramProgressMonitor)
    throws ZipException
  {
    if (paramFileHeader == null) {
      throw new ZipException("fileHeader is null");
    }
    try
    {
      paramProgressMonitor.setFileName(paramFileHeader.getFileName());
      if (!paramString1.endsWith(InternalZipConstants.FILE_SEPARATOR)) {
        paramString1 = paramString1 + InternalZipConstants.FILE_SEPARATOR;
      }
      boolean bool = paramFileHeader.isDirectory();
      if (bool) {
        try
        {
          String str = paramFileHeader.getFileName();
          if (!Zip4jUtil.isStringNotNullAndNotEmpty(str)) {
            return;
          }
          File localFile = new File(paramString1 + str);
          if (!localFile.exists())
          {
            localFile.mkdirs();
            return;
          }
        }
        catch (Exception localException3)
        {
          paramProgressMonitor.endProgressMonitorError(localException3);
          throw new ZipException(localException3);
        }
      }
      UnzipEngine localUnzipEngine;
      return;
    }
    catch (ZipException localZipException)
    {
      paramProgressMonitor.endProgressMonitorError(localZipException);
      throw localZipException;
      checkOutputDirectoryStructure(paramFileHeader, paramString1, paramString2);
      localUnzipEngine = new UnzipEngine(this.zipModel, paramFileHeader);
      try
      {
        localUnzipEngine.unzipFile(paramProgressMonitor, paramString1, paramString2, paramUnzipParameters);
        return;
      }
      catch (Exception localException2)
      {
        paramProgressMonitor.endProgressMonitorError(localException2);
        throw new ZipException(localException2);
      }
    }
    catch (Exception localException1)
    {
      paramProgressMonitor.endProgressMonitorError(localException1);
      throw new ZipException(localException1);
    }
  }
  
  public void extractAll(UnzipParameters paramUnzipParameters, String paramString, ProgressMonitor paramProgressMonitor, boolean paramBoolean)
    throws ZipException
  {
    CentralDirectory localCentralDirectory = this.zipModel.getCentralDirectory();
    if ((localCentralDirectory == null) || (localCentralDirectory.getFileHeaders() == null)) {
      throw new ZipException("invalid central directory in zipModel");
    }
    ArrayList localArrayList = localCentralDirectory.getFileHeaders();
    paramProgressMonitor.setCurrentOperation(1);
    paramProgressMonitor.setTotalWork(calculateTotalWork(localArrayList));
    paramProgressMonitor.setState(1);
    if (paramBoolean)
    {
      new Unzip.1(this, "Zip4j", localArrayList, paramUnzipParameters, paramProgressMonitor, paramString).start();
      return;
    }
    initExtractAll(localArrayList, paramUnzipParameters, paramProgressMonitor, paramString);
  }
  
  public void extractFile(FileHeader paramFileHeader, String paramString1, UnzipParameters paramUnzipParameters, String paramString2, ProgressMonitor paramProgressMonitor, boolean paramBoolean)
    throws ZipException
  {
    if (paramFileHeader == null) {
      throw new ZipException("fileHeader is null");
    }
    paramProgressMonitor.setCurrentOperation(1);
    paramProgressMonitor.setTotalWork(paramFileHeader.getCompressedSize());
    paramProgressMonitor.setState(1);
    paramProgressMonitor.setPercentDone(0);
    paramProgressMonitor.setFileName(paramFileHeader.getFileName());
    if (paramBoolean)
    {
      new Unzip.2(this, "Zip4j", paramFileHeader, paramString1, paramUnzipParameters, paramString2, paramProgressMonitor).start();
      return;
    }
    initExtractFile(paramFileHeader, paramString1, paramUnzipParameters, paramString2, paramProgressMonitor);
    paramProgressMonitor.endProgressMonitorSuccess();
  }
  
  public ZipInputStream getInputStream(FileHeader paramFileHeader)
    throws ZipException
  {
    return new UnzipEngine(this.zipModel, paramFileHeader).getInputStream();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/net/lingala/zip4j/unzip/Unzip.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */