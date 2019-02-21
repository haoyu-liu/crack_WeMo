package net.lingala.zip4j.util;

import net.lingala.zip4j.exception.ZipException;
import net.lingala.zip4j.model.FileHeader;
import net.lingala.zip4j.model.ZipModel;
import net.lingala.zip4j.progress.ProgressMonitor;

class ArchiveMaintainer$1
  extends Thread
{
  final ArchiveMaintainer this$0;
  private final FileHeader val$fileHeader;
  private final ProgressMonitor val$progressMonitor;
  private final ZipModel val$zipModel;
  
  ArchiveMaintainer$1(ArchiveMaintainer paramArchiveMaintainer, String paramString, ZipModel paramZipModel, FileHeader paramFileHeader, ProgressMonitor paramProgressMonitor)
  {
    super(paramString);
    this.this$0 = paramArchiveMaintainer;
    this.val$zipModel = paramZipModel;
    this.val$fileHeader = paramFileHeader;
    this.val$progressMonitor = paramProgressMonitor;
  }
  
  public void run()
  {
    try
    {
      this.this$0.initRemoveZipFile(this.val$zipModel, this.val$fileHeader, this.val$progressMonitor);
      this.val$progressMonitor.endProgressMonitorSuccess();
      return;
    }
    catch (ZipException localZipException) {}
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/net/lingala/zip4j/util/ArchiveMaintainer$1.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */