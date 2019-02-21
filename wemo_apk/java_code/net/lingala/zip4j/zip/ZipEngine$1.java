package net.lingala.zip4j.zip;

import java.util.ArrayList;
import net.lingala.zip4j.exception.ZipException;
import net.lingala.zip4j.model.ZipParameters;
import net.lingala.zip4j.progress.ProgressMonitor;

class ZipEngine$1
  extends Thread
{
  final ZipEngine this$0;
  private final ArrayList val$fileList;
  private final ZipParameters val$parameters;
  private final ProgressMonitor val$progressMonitor;
  
  ZipEngine$1(ZipEngine paramZipEngine, String paramString, ArrayList paramArrayList, ZipParameters paramZipParameters, ProgressMonitor paramProgressMonitor)
  {
    super(paramString);
    this.this$0 = paramZipEngine;
    this.val$fileList = paramArrayList;
    this.val$parameters = paramZipParameters;
    this.val$progressMonitor = paramProgressMonitor;
  }
  
  public void run()
  {
    try
    {
      ZipEngine.access$0(this.this$0, this.val$fileList, this.val$parameters, this.val$progressMonitor);
      return;
    }
    catch (ZipException localZipException) {}
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/net/lingala/zip4j/zip/ZipEngine$1.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */