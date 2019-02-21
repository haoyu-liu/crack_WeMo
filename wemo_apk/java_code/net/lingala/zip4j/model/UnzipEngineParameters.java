package net.lingala.zip4j.model;

import java.io.FileOutputStream;
import net.lingala.zip4j.crypto.IDecrypter;
import net.lingala.zip4j.unzip.UnzipEngine;

public class UnzipEngineParameters
{
  private FileHeader fileHeader;
  private IDecrypter iDecryptor;
  private LocalFileHeader localFileHeader;
  private FileOutputStream outputStream;
  private UnzipEngine unzipEngine;
  private ZipModel zipModel;
  
  public FileHeader getFileHeader()
  {
    return this.fileHeader;
  }
  
  public IDecrypter getIDecryptor()
  {
    return this.iDecryptor;
  }
  
  public LocalFileHeader getLocalFileHeader()
  {
    return this.localFileHeader;
  }
  
  public FileOutputStream getOutputStream()
  {
    return this.outputStream;
  }
  
  public UnzipEngine getUnzipEngine()
  {
    return this.unzipEngine;
  }
  
  public ZipModel getZipModel()
  {
    return this.zipModel;
  }
  
  public void setFileHeader(FileHeader paramFileHeader)
  {
    this.fileHeader = paramFileHeader;
  }
  
  public void setIDecryptor(IDecrypter paramIDecrypter)
  {
    this.iDecryptor = paramIDecrypter;
  }
  
  public void setLocalFileHeader(LocalFileHeader paramLocalFileHeader)
  {
    this.localFileHeader = paramLocalFileHeader;
  }
  
  public void setOutputStream(FileOutputStream paramFileOutputStream)
  {
    this.outputStream = paramFileOutputStream;
  }
  
  public void setUnzipEngine(UnzipEngine paramUnzipEngine)
  {
    this.unzipEngine = paramUnzipEngine;
  }
  
  public void setZipModel(ZipModel paramZipModel)
  {
    this.zipModel = paramZipModel;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/net/lingala/zip4j/model/UnzipEngineParameters.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */