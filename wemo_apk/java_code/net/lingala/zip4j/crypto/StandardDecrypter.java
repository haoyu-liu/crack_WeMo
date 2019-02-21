package net.lingala.zip4j.crypto;

import net.lingala.zip4j.crypto.engine.ZipCryptoEngine;
import net.lingala.zip4j.exception.ZipException;
import net.lingala.zip4j.model.FileHeader;

public class StandardDecrypter
  implements IDecrypter
{
  private byte[] crc = new byte[4];
  private FileHeader fileHeader;
  private ZipCryptoEngine zipCryptoEngine;
  
  public StandardDecrypter(FileHeader paramFileHeader, byte[] paramArrayOfByte)
    throws ZipException
  {
    if (paramFileHeader == null) {
      throw new ZipException("one of more of the input parameters were null in StandardDecryptor");
    }
    this.fileHeader = paramFileHeader;
    this.zipCryptoEngine = new ZipCryptoEngine();
    init(paramArrayOfByte);
  }
  
  public int decryptData(byte[] paramArrayOfByte)
    throws ZipException
  {
    return decryptData(paramArrayOfByte, 0, paramArrayOfByte.length);
  }
  
  public int decryptData(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws ZipException
  {
    if ((paramInt1 < 0) || (paramInt2 < 0)) {
      throw new ZipException("one of the input parameters were null in standard decrpyt data");
    }
    int i = paramInt1;
    for (;;)
    {
      if (i >= paramInt1 + paramInt2) {
        return paramInt2;
      }
      try
      {
        int j = 0xFF & (0xFF & paramArrayOfByte[i] ^ this.zipCryptoEngine.decryptByte());
        this.zipCryptoEngine.updateKeys((byte)j);
        paramArrayOfByte[i] = ((byte)j);
        i++;
      }
      catch (Exception localException)
      {
        throw new ZipException(localException);
      }
    }
  }
  
  public void init(byte[] paramArrayOfByte)
    throws ZipException
  {
    byte[] arrayOfByte = this.fileHeader.getCrcBuff();
    this.crc[3] = ((byte)(0xFF & arrayOfByte[3]));
    this.crc[2] = ((byte)(0xFF & arrayOfByte[3] >> 8));
    this.crc[1] = ((byte)(0xFF & arrayOfByte[3] >> 16));
    this.crc[0] = ((byte)(0xFF & arrayOfByte[3] >> 24));
    if ((this.crc[2] > 0) || (this.crc[1] > 0) || (this.crc[0] > 0)) {
      throw new IllegalStateException("Invalid CRC in File Header");
    }
    if ((this.fileHeader.getPassword() == null) || (this.fileHeader.getPassword().length <= 0)) {
      throw new ZipException("Wrong password!", 5);
    }
    this.zipCryptoEngine.initKeys(this.fileHeader.getPassword());
    int j;
    do
    {
      try
      {
        i = paramArrayOfByte[0];
        j = 0;
      }
      catch (Exception localException)
      {
        int i;
        throw new ZipException(localException);
      }
      this.zipCryptoEngine.updateKeys((byte)(i ^ this.zipCryptoEngine.decryptByte()));
      if (j + 1 != 12) {
        i = paramArrayOfByte[(j + 1)];
      }
      j++;
    } while (j < 12);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/net/lingala/zip4j/crypto/StandardDecrypter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */