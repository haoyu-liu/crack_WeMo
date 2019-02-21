package net.lingala.zip4j.crypto;

import java.util.Random;
import net.lingala.zip4j.crypto.engine.ZipCryptoEngine;
import net.lingala.zip4j.exception.ZipException;

public class StandardEncrypter
  implements IEncrypter
{
  private byte[] headerBytes;
  private ZipCryptoEngine zipCryptoEngine;
  
  public StandardEncrypter(char[] paramArrayOfChar, int paramInt)
    throws ZipException
  {
    if ((paramArrayOfChar == null) || (paramArrayOfChar.length <= 0)) {
      throw new ZipException("input password is null or empty in standard encrpyter constructor");
    }
    this.zipCryptoEngine = new ZipCryptoEngine();
    this.headerBytes = new byte[12];
    init(paramArrayOfChar, paramInt);
  }
  
  private void init(char[] paramArrayOfChar, int paramInt)
    throws ZipException
  {
    if ((paramArrayOfChar == null) || (paramArrayOfChar.length <= 0)) {
      throw new ZipException("input password is null or empty, cannot initialize standard encrypter");
    }
    this.zipCryptoEngine.initKeys(paramArrayOfChar);
    this.headerBytes = generateRandomBytes(12);
    this.zipCryptoEngine.initKeys(paramArrayOfChar);
    this.headerBytes[11] = ((byte)(paramInt >>> 24));
    this.headerBytes[10] = ((byte)(paramInt >>> 16));
    if (this.headerBytes.length < 12) {
      throw new ZipException("invalid header bytes generated, cannot perform standard encryption");
    }
    encryptData(this.headerBytes);
  }
  
  protected byte encryptByte(byte paramByte)
  {
    byte b = (byte)(paramByte ^ 0xFF & this.zipCryptoEngine.decryptByte());
    this.zipCryptoEngine.updateKeys(paramByte);
    return b;
  }
  
  public int encryptData(byte[] paramArrayOfByte)
    throws ZipException
  {
    if (paramArrayOfByte == null) {
      throw new NullPointerException();
    }
    return encryptData(paramArrayOfByte, 0, paramArrayOfByte.length);
  }
  
  public int encryptData(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws ZipException
  {
    if (paramInt2 < 0) {
      throw new ZipException("invalid length specified to decrpyt data");
    }
    int i = paramInt1;
    for (;;)
    {
      if (i >= paramInt1 + paramInt2) {
        return paramInt2;
      }
      try
      {
        paramArrayOfByte[i] = encryptByte(paramArrayOfByte[i]);
        i++;
      }
      catch (Exception localException)
      {
        throw new ZipException(localException);
      }
    }
  }
  
  protected byte[] generateRandomBytes(int paramInt)
    throws ZipException
  {
    if (paramInt <= 0) {
      throw new ZipException("size is either 0 or less than 0, cannot generate header for standard encryptor");
    }
    byte[] arrayOfByte = new byte[paramInt];
    Random localRandom = new Random();
    for (int i = 0;; i++)
    {
      if (i >= arrayOfByte.length) {
        return arrayOfByte;
      }
      arrayOfByte[i] = encryptByte((byte)localRandom.nextInt(256));
    }
  }
  
  public byte[] getHeaderBytes()
  {
    return this.headerBytes;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/net/lingala/zip4j/crypto/StandardEncrypter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */