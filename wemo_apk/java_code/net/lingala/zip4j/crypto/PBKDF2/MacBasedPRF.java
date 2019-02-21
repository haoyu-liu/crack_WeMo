package net.lingala.zip4j.crypto.PBKDF2;

import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

public class MacBasedPRF
  implements PRF
{
  protected int hLen;
  protected Mac mac;
  protected String macAlgorithm;
  
  public MacBasedPRF(String paramString)
  {
    this.macAlgorithm = paramString;
    try
    {
      this.mac = Mac.getInstance(paramString);
      this.hLen = this.mac.getMacLength();
      return;
    }
    catch (NoSuchAlgorithmException localNoSuchAlgorithmException)
    {
      throw new RuntimeException(localNoSuchAlgorithmException);
    }
  }
  
  public MacBasedPRF(String paramString1, String paramString2)
  {
    this.macAlgorithm = paramString1;
    try
    {
      this.mac = Mac.getInstance(paramString1, paramString2);
      this.hLen = this.mac.getMacLength();
      return;
    }
    catch (NoSuchAlgorithmException localNoSuchAlgorithmException)
    {
      throw new RuntimeException(localNoSuchAlgorithmException);
    }
    catch (NoSuchProviderException localNoSuchProviderException)
    {
      throw new RuntimeException(localNoSuchProviderException);
    }
  }
  
  public byte[] doFinal()
  {
    return this.mac.doFinal();
  }
  
  public byte[] doFinal(byte[] paramArrayOfByte)
  {
    return this.mac.doFinal(paramArrayOfByte);
  }
  
  public int getHLen()
  {
    return this.hLen;
  }
  
  public void init(byte[] paramArrayOfByte)
  {
    try
    {
      this.mac.init(new SecretKeySpec(paramArrayOfByte, this.macAlgorithm));
      return;
    }
    catch (InvalidKeyException localInvalidKeyException)
    {
      throw new RuntimeException(localInvalidKeyException);
    }
  }
  
  public void update(byte[] paramArrayOfByte)
  {
    try
    {
      this.mac.update(paramArrayOfByte);
      return;
    }
    catch (IllegalStateException localIllegalStateException)
    {
      throw new RuntimeException(localIllegalStateException);
    }
  }
  
  public void update(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    try
    {
      this.mac.update(paramArrayOfByte, paramInt1, paramInt2);
      return;
    }
    catch (IllegalStateException localIllegalStateException)
    {
      throw new RuntimeException(localIllegalStateException);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/net/lingala/zip4j/crypto/PBKDF2/MacBasedPRF.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */