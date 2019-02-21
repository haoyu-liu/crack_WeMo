package net.lingala.zip4j.io;

import java.io.IOException;
import java.io.OutputStream;
import java.util.zip.CRC32;
import net.lingala.zip4j.model.ZipModel;

public class ZipOutputStream
  extends DeflaterOutputStream
{
  public ZipOutputStream(OutputStream paramOutputStream)
  {
    this(paramOutputStream, null);
  }
  
  public ZipOutputStream(OutputStream paramOutputStream, ZipModel paramZipModel)
  {
    super(paramOutputStream, paramZipModel);
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
    this.crc.update(paramArrayOfByte, paramInt1, paramInt2);
    updateTotalBytesRead(paramInt2);
    super.write(paramArrayOfByte, paramInt1, paramInt2);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/net/lingala/zip4j/io/ZipOutputStream.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */