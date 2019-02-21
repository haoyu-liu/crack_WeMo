package net.lingala.zip4j.unzip;

import java.util.ArrayList;
import net.lingala.zip4j.exception.ZipException;
import net.lingala.zip4j.model.UnzipParameters;
import net.lingala.zip4j.progress.ProgressMonitor;

class Unzip$1
  extends Thread
{
  final Unzip this$0;
  private final ArrayList val$fileHeaders;
  private final String val$outPath;
  private final ProgressMonitor val$progressMonitor;
  private final UnzipParameters val$unzipParameters;
  
  Unzip$1(Unzip paramUnzip, String paramString1, ArrayList paramArrayList, UnzipParameters paramUnzipParameters, ProgressMonitor paramProgressMonitor, String paramString2)
  {
    super(paramString1);
    this.this$0 = paramUnzip;
    this.val$fileHeaders = paramArrayList;
    this.val$unzipParameters = paramUnzipParameters;
    this.val$progressMonitor = paramProgressMonitor;
    this.val$outPath = paramString2;
  }
  
  public void run()
  {
    try
    {
      Unzip.access$0(this.this$0, this.val$fileHeaders, this.val$unzipParameters, this.val$progressMonitor, this.val$outPath);
      this.val$progressMonitor.endProgressMonitorSuccess();
      return;
    }
    catch (ZipException localZipException) {}
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/net/lingala/zip4j/unzip/Unzip$1.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */