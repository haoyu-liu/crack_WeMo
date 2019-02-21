package net.lingala.zip4j.io;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.zip.Deflater;
import net.lingala.zip4j.exception.ZipException;
import net.lingala.zip4j.model.ZipModel;
import net.lingala.zip4j.model.ZipParameters;

public class DeflaterOutputStream
  extends CipherOutputStream
{
  private byte[] buff = new byte['က'];
  protected Deflater deflater = new Deflater();
  private boolean firstBytesRead = false;
  
  public DeflaterOutputStream(OutputStream paramOutputStream, ZipModel paramZipModel)
  {
    super(paramOutputStream, paramZipModel);
  }
  
  private void deflate()
    throws IOException
  {
    int i = this.deflater.deflate(this.buff, 0, this.buff.length);
    if (i > 0)
    {
      if (!this.deflater.finished()) {
        break label54;
      }
      if (i != 4) {}
    }
    else
    {
      return;
    }
    if (i < 4)
    {
      decrementCompressedFileSize(4 - i);
      return;
    }
    i -= 4;
    label54:
    if (!this.firstBytesRead)
    {
      super.write(this.buff, 2, i - 2);
      this.firstBytesRead = true;
      return;
    }
    super.write(this.buff, 0, i);
  }
  
  public void closeEntry()
    throws IOException, ZipException
  {
    if (this.zipParameters.getCompressionMethod() == 8) {
      if (!this.deflater.finished()) {
        this.deflater.finish();
      }
    }
    for (;;)
    {
      if (this.deflater.finished())
      {
        this.firstBytesRead = false;
        super.closeEntry();
        return;
      }
      deflate();
    }
  }
  
  public void finish()
    throws IOException, ZipException
  {
    super.finish();
  }
  
  public void putNextEntry(File paramFile, ZipParameters paramZipParameters)
    throws ZipException
  {
    super.putNextEntry(paramFile, paramZipParameters);
    if (paramZipParameters.getCompressionMethod() == 8)
    {
      this.deflater.reset();
      if (((paramZipParameters.getCompressionLevel() < 0) || (paramZipParameters.getCompressionLevel() > 9)) && (paramZipParameters.getCompressionLevel() != -1)) {
        throw new ZipException("invalid compression level for deflater. compression level should be in the range of 0-9");
      }
      this.deflater.setLevel(paramZipParameters.getCompressionLevel());
    }
  }
  
  public void write(int paramInt)
    throws IOException
  {
    byte[] arrayOfByte = new byte[1];
    arrayOfByte[0] = ((byte)paramInt);
    write(arrayOfByte, 0, 1);
  }
  
  public void write(byte[] paramArrayOfByte)
    throws IOException
  {
    write(paramArrayOfByte, 0, paramArrayOfByte.length);
  }
  
  public void write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    if (this.zipParameters.getCompressionMethod() != 8) {
      super.write(paramArrayOfByte, paramInt1, paramInt2);
    }
    for (;;)
    {
      return;
      this.deflater.setInput(paramArrayOfByte, paramInt1, paramInt2);
      while (!this.deflater.needsInput()) {
        deflate();
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/net/lingala/zip4j/io/DeflaterOutputStream.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */