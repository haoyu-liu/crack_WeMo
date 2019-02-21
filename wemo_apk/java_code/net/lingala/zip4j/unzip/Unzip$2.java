package net.lingala.zip4j.unzip;

import net.lingala.zip4j.exception.ZipException;
import net.lingala.zip4j.model.FileHeader;
import net.lingala.zip4j.model.UnzipParameters;
import net.lingala.zip4j.progress.ProgressMonitor;

class Unzip$2
  extends Thread
{
  final Unzip this$0;
  private final FileHeader val$fileHeader;
  private final String val$newFileName;
  private final String val$outPath;
  private final ProgressMonitor val$progressMonitor;
  private final UnzipParameters val$unzipParameters;
  
  Unzip$2(Unzip paramUnzip, String paramString1, FileHeader paramFileHeader, String paramString2, UnzipParameters paramUnzipParameters, String paramString3, ProgressMonitor paramProgressMonitor)
  {
    super(paramString1);
    this.this$0 = paramUnzip;
    this.val$fileHeader = paramFileHeader;
    this.val$outPath = paramString2;
    this.val$unzipParameters = paramUnzipParameters;
    this.val$newFileName = paramString3;
    this.val$progressMonitor = paramProgressMonitor;
  }
  
  public void run()
  {
    try
    {
      Unzip.access$1(this.this$0, this.val$fileHeader, this.val$outPath, this.val$unzipParameters, this.val$newFileName, this.val$progressMonitor);
      this.val$progressMonitor.endProgressMonitorSuccess();
      return;
    }
    catch (ZipException localZipException) {}
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/net/lingala/zip4j/unzip/Unzip$2.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */