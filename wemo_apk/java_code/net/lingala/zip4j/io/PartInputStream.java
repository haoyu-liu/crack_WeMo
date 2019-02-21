package net.lingala.zip4j.io;

import java.io.IOException;
import java.io.RandomAccessFile;
import net.lingala.zip4j.crypto.AESDecrypter;
import net.lingala.zip4j.crypto.IDecrypter;
import net.lingala.zip4j.exception.ZipException;
import net.lingala.zip4j.model.FileHeader;
import net.lingala.zip4j.model.ZipModel;
import net.lingala.zip4j.unzip.UnzipEngine;

public class PartInputStream
  extends BaseInputStream
{
  private byte[] aesBlockByte;
  private int aesBytesReturned;
  private long bytesRead;
  private int count;
  private IDecrypter decrypter;
  private boolean isAESEncryptedFile;
  private long length;
  private byte[] oneByteBuff;
  private RandomAccessFile raf;
  private UnzipEngine unzipEngine;
  
  public PartInputStream(RandomAccessFile paramRandomAccessFile, long paramLong1, long paramLong2, UnzipEngine paramUnzipEngine)
  {
    this.oneByteBuff = new byte[bool];
    this.aesBlockByte = new byte[16];
    this.aesBytesReturned = 0;
    this.isAESEncryptedFile = false;
    this.count = -1;
    this.raf = paramRandomAccessFile;
    this.unzipEngine = paramUnzipEngine;
    this.decrypter = paramUnzipEngine.getDecrypter();
    this.bytesRead = 0L;
    this.length = paramLong2;
    if ((paramUnzipEngine.getFileHeader().isEncrypted()) && (paramUnzipEngine.getFileHeader().getEncryptionMethod() == 99)) {}
    for (;;)
    {
      this.isAESEncryptedFile = bool;
      return;
      bool = false;
    }
  }
  
  public int available()
  {
    long l = this.length - this.bytesRead;
    if (l > 2147483647L) {
      return Integer.MAX_VALUE;
    }
    return (int)l;
  }
  
  protected void checkAndReadAESMacBytes()
    throws IOException
  {
    if ((!this.isAESEncryptedFile) || (this.decrypter == null) || (!(this.decrypter instanceof AESDecrypter)) || (((AESDecrypter)this.decrypter).getStoredMac() != null)) {
      return;
    }
    byte[] arrayOfByte = new byte[10];
    int i = this.raf.read(arrayOfByte);
    if (i != 10)
    {
      if (this.unzipEngine.getZipModel().isSplitArchive())
      {
        this.raf.close();
        this.raf = this.unzipEngine.startNextSplitFile();
        (i + this.raf.read(arrayOfByte, i, 10 - i));
      }
    }
    else
    {
      ((AESDecrypter)this.unzipEngine.getDecrypter()).setStoredMac(arrayOfByte);
      return;
    }
    throw new IOException("Error occured while reading stored AES authentication bytes");
  }
  
  public void close()
    throws IOException
  {
    this.raf.close();
  }
  
  public UnzipEngine getUnzipEngine()
  {
    return this.unzipEngine;
  }
  
  public int read()
    throws IOException
  {
    if (this.bytesRead >= this.length) {}
    label79:
    do
    {
      do
      {
        return -1;
        if (!this.isAESEncryptedFile) {
          break label79;
        }
        if ((this.aesBytesReturned != 0) && (this.aesBytesReturned != 16)) {
          break;
        }
      } while (read(this.aesBlockByte) == -1);
      this.aesBytesReturned = 0;
      byte[] arrayOfByte = this.aesBlockByte;
      int i = this.aesBytesReturned;
      this.aesBytesReturned = (i + 1);
      return 0xFF & arrayOfByte[i];
    } while (read(this.oneByteBuff, 0, 1) == -1);
    return 0xFF & this.oneByteBuff[0];
  }
  
  public int read(byte[] paramArrayOfByte)
    throws IOException
  {
    return read(paramArrayOfByte, 0, paramArrayOfByte.length);
  }
  
  public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    if (paramInt2 > this.length - this.bytesRead)
    {
      paramInt2 = (int)(this.length - this.bytesRead);
      if (paramInt2 == 0)
      {
        checkAndReadAESMacBytes();
        return -1;
      }
    }
    if (((this.unzipEngine.getDecrypter() instanceof AESDecrypter)) && (this.bytesRead + paramInt2 < this.length) && (paramInt2 % 16 != 0)) {
      paramInt2 -= paramInt2 % 16;
    }
    synchronized (this.raf)
    {
      this.count = this.raf.read(paramArrayOfByte, paramInt1, paramInt2);
      if ((this.count < paramInt2) && (this.unzipEngine.getZipModel().isSplitArchive()))
      {
        this.raf.close();
        this.raf = this.unzipEngine.startNextSplitFile();
        if (this.count < 0) {
          this.count = 0;
        }
        int i = this.raf.read(paramArrayOfByte, this.count, paramInt2 - this.count);
        if (i > 0) {
          this.count = (i + this.count);
        }
      }
      if (this.count > 0) {
        if (this.decrypter == null) {}
      }
    }
  }
  
  public void seek(long paramLong)
    throws IOException
  {
    this.raf.seek(paramLong);
  }
  
  public long skip(long paramLong)
    throws IOException
  {
    if (paramLong < 0L) {
      throw new IllegalArgumentException();
    }
    if (paramLong > this.length - this.bytesRead) {
      paramLong = this.length - this.bytesRead;
    }
    this.bytesRead = (paramLong + this.bytesRead);
    return paramLong;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/net/lingala/zip4j/io/PartInputStream.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */