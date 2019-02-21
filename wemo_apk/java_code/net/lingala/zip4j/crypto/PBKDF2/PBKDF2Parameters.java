package net.lingala.zip4j.crypto.PBKDF2;

public class PBKDF2Parameters
{
  protected byte[] derivedKey;
  protected String hashAlgorithm;
  protected String hashCharset;
  protected int iterationCount;
  protected byte[] salt;
  
  public PBKDF2Parameters()
  {
    this.hashAlgorithm = null;
    this.hashCharset = "UTF-8";
    this.salt = null;
    this.iterationCount = 1000;
    this.derivedKey = null;
  }
  
  public PBKDF2Parameters(String paramString1, String paramString2, byte[] paramArrayOfByte, int paramInt)
  {
    this.hashAlgorithm = paramString1;
    this.hashCharset = paramString2;
    this.salt = paramArrayOfByte;
    this.iterationCount = paramInt;
    this.derivedKey = null;
  }
  
  public PBKDF2Parameters(String paramString1, String paramString2, byte[] paramArrayOfByte1, int paramInt, byte[] paramArrayOfByte2)
  {
    this.hashAlgorithm = paramString1;
    this.hashCharset = paramString2;
    this.salt = paramArrayOfByte1;
    this.iterationCount = paramInt;
    this.derivedKey = paramArrayOfByte2;
  }
  
  public byte[] getDerivedKey()
  {
    return this.derivedKey;
  }
  
  public String getHashAlgorithm()
  {
    return this.hashAlgorithm;
  }
  
  public String getHashCharset()
  {
    return this.hashCharset;
  }
  
  public int getIterationCount()
  {
    return this.iterationCount;
  }
  
  public byte[] getSalt()
  {
    return this.salt;
  }
  
  public void setDerivedKey(byte[] paramArrayOfByte)
  {
    this.derivedKey = paramArrayOfByte;
  }
  
  public void setHashAlgorithm(String paramString)
  {
    this.hashAlgorithm = paramString;
  }
  
  public void setHashCharset(String paramString)
  {
    this.hashCharset = paramString;
  }
  
  public void setIterationCount(int paramInt)
  {
    this.iterationCount = paramInt;
  }
  
  public void setSalt(byte[] paramArrayOfByte)
  {
    this.salt = paramArrayOfByte;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/net/lingala/zip4j/crypto/PBKDF2/PBKDF2Parameters.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */