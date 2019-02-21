package net.lingala.zip4j.util;

import java.io.File;
import net.lingala.zip4j.exception.ZipException;
import net.lingala.zip4j.model.ZipModel;
import net.lingala.zip4j.progress.ProgressMonitor;

class ArchiveMaintainer$2
  extends Thread
{
  final ArchiveMaintainer this$0;
  private final File val$outputZipFile;
  private final ProgressMonitor val$progressMonitor;
  private final ZipModel val$zipModel;
  
  ArchiveMaintainer$2(ArchiveMaintainer paramArchiveMaintainer, String paramString, ZipModel paramZipModel, File paramFile, ProgressMonitor paramProgressMonitor)
  {
    super(paramString);
    this.this$0 = paramArchiveMaintainer;
    this.val$zipModel = paramZipModel;
    this.val$outputZipFile = paramFile;
    this.val$progressMonitor = paramProgressMonitor;
  }
  
  public void run()
  {
    try
    {
      ArchiveMaintainer.access$0(this.this$0, this.val$zipModel, this.val$outputZipFile, this.val$progressMonitor);
      return;
    }
    catch (ZipException localZipException) {}
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/net/lingala/zip4j/util/ArchiveMaintainer$2.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */