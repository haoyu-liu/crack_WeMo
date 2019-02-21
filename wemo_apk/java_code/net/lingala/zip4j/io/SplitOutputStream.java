package net.lingala.zip4j.io;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import net.lingala.zip4j.exception.ZipException;
import net.lingala.zip4j.util.Raw;
import net.lingala.zip4j.util.Zip4jUtil;

public class SplitOutputStream
  extends OutputStream
{
  private long bytesWrittenForThisPart;
  private int currSplitFileCounter;
  private File outFile;
  private RandomAccessFile raf;
  private long splitLength;
  private File zipFile;
  
  public SplitOutputStream(File paramFile)
    throws FileNotFoundException, ZipException
  {
    this(paramFile, -1L);
  }
  
  public SplitOutputStream(File paramFile, long paramLong)
    throws FileNotFoundException, ZipException
  {
    if ((paramLong >= 0L) && (paramLong < 65536L)) {
      throw new ZipException("split length less than minimum allowed split length of 65536 Bytes");
    }
    this.raf = new RandomAccessFile(paramFile, "rw");
    this.splitLength = paramLong;
    this.outFile = paramFile;
    this.zipFile = paramFile;
    this.currSplitFileCounter = 0;
    this.bytesWrittenForThisPart = 0L;
  }
  
  public SplitOutputStream(String paramString)
    throws FileNotFoundException, ZipException
  {}
  
  public SplitOutputStream(String paramString, long paramLong)
    throws FileNotFoundException, ZipException
  {}
  
  private boolean isHeaderData(byte[] paramArrayOfByte)
  {
    if ((paramArrayOfByte == null) || (paramArrayOfByte.length < 4)) {}
    for (;;)
    {
      return false;
      int i = Raw.readIntLittleEndian(paramArrayOfByte, 0);
      long[] arrayOfLong = Zip4jUtil.getAllHeaderSignatures();
      if ((arrayOfLong != null) && (arrayOfLong.length > 0)) {
        for (int j = 0; j < arrayOfLong.length; j++) {
          if ((arrayOfLong[j] != 134695760L) && (arrayOfLong[j] == i)) {
            return true;
          }
        }
      }
    }
  }
  
  private void startNextSplitFile()
    throws IOException
  {
    String str2;
    File localFile;
    for (;;)
    {
      String str1;
      try
      {
        str1 = Zip4jUtil.getZipFileNameWithoutExt(this.outFile.getName());
        str2 = this.zipFile.getAbsolutePath();
        if (this.outFile.getParent() == null)
        {
          str3 = "";
          if (this.currSplitFileCounter >= 9) {
            break label178;
          }
          localFile = new File(str3 + str1 + ".z0" + (1 + this.currSplitFileCounter));
          this.raf.close();
          if (!localFile.exists()) {
            break;
          }
          throw new IOException("split file: " + localFile.getName() + " already exists in the current directory, cannot rename this file");
        }
      }
      catch (ZipException localZipException)
      {
        throw new IOException(localZipException.getMessage());
      }
      String str3 = this.outFile.getParent() + System.getProperty("file.separator");
      continue;
      label178:
      localFile = new File(str3 + str1 + ".z" + (1 + this.currSplitFileCounter));
    }
    if (!this.zipFile.renameTo(localFile)) {
      throw new IOException("cannot rename newly created split file");
    }
    this.zipFile = new File(str2);
    this.raf = new RandomAccessFile(this.zipFile, "rw");
    this.currSplitFileCounter = (1 + this.currSplitFileCounter);
  }
  
  public boolean checkBuffSizeAndStartNextSplitFile(int paramInt)
    throws ZipException
  {
    if (paramInt < 0) {
      throw new ZipException("negative buffersize for checkBuffSizeAndStartNextSplitFile");
    }
    if (!isBuffSizeFitForCurrSplitFile(paramInt)) {
      try
      {
        startNextSplitFile();
        this.bytesWrittenForThisPart = 0L;
        return true;
      }
      catch (IOException localIOException)
      {
        throw new ZipException(localIOException);
      }
    }
    return false;
  }
  
  public void close()
    throws IOException
  {
    if (this.raf != null) {
      this.raf.close();
    }
  }
  
  public void flush()
    throws IOException
  {}
  
  public int getCurrSplitFileCounter()
  {
    return this.currSplitFileCounter;
  }
  
  public long getFilePointer()
    throws IOException
  {
    return this.raf.getFilePointer();
  }
  
  public long getSplitLength()
  {
    return this.splitLength;
  }
  
  public boolean isBuffSizeFitForCurrSplitFile(int paramInt)
    throws ZipException
  {
    if (paramInt < 0) {
      throw new ZipException("negative buffersize for isBuffSizeFitForCurrSplitFile");
    }
    return (this.splitLength < 65536L) || (this.bytesWrittenForThisPart + paramInt <= this.splitLength);
  }
  
  public boolean isSplitZipFile()
  {
    return this.splitLength != -1L;
  }
  
  public void seek(long paramLong)
    throws IOException
  {
    this.raf.seek(paramLong);
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
    if (paramInt2 <= 0) {
      return;
    }
    if (this.splitLength != -1L)
    {
      if (this.splitLength < 65536L) {
        throw new IOException("split length less than minimum allowed split length of 65536 Bytes");
      }
      if (this.bytesWrittenForThisPart >= this.splitLength)
      {
        startNextSplitFile();
        this.raf.write(paramArrayOfByte, paramInt1, paramInt2);
        this.bytesWrittenForThisPart = paramInt2;
        return;
      }
      if (this.bytesWrittenForThisPart + paramInt2 > this.splitLength)
      {
        if (isHeaderData(paramArrayOfByte))
        {
          startNextSplitFile();
          this.raf.write(paramArrayOfByte, paramInt1, paramInt2);
          this.bytesWrittenForThisPart = paramInt2;
          return;
        }
        this.raf.write(paramArrayOfByte, paramInt1, (int)(this.splitLength - this.bytesWrittenForThisPart));
        startNextSplitFile();
        this.raf.write(paramArrayOfByte, paramInt1 + (int)(this.splitLength - this.bytesWrittenForThisPart), (int)(paramInt2 - (this.splitLength - this.bytesWrittenForThisPart)));
        this.bytesWrittenForThisPart = (paramInt2 - (this.splitLength - this.bytesWrittenForThisPart));
        return;
      }
      this.raf.write(paramArrayOfByte, paramInt1, paramInt2);
      this.bytesWrittenForThisPart += paramInt2;
      return;
    }
    this.raf.write(paramArrayOfByte, paramInt1, paramInt2);
    this.bytesWrittenForThisPart += paramInt2;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/net/lingala/zip4j/io/SplitOutputStream.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */