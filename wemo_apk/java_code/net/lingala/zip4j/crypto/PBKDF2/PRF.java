package net.lingala.zip4j.crypto.PBKDF2;

abstract interface PRF
{
  public abstract byte[] doFinal(byte[] paramArrayOfByte);
  
  public abstract int getHLen();
  
  public abstract void init(byte[] paramArrayOfByte);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/net/lingala/zip4j/crypto/PBKDF2/PRF.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */