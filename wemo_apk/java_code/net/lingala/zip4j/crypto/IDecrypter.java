package net.lingala.zip4j.crypto;

import net.lingala.zip4j.exception.ZipException;

public abstract interface IDecrypter
{
  public abstract int decryptData(byte[] paramArrayOfByte)
    throws ZipException;
  
  public abstract int decryptData(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws ZipException;
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/net/lingala/zip4j/crypto/IDecrypter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */