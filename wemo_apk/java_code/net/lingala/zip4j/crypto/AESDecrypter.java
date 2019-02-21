package net.lingala.zip4j.crypto;

import java.util.Arrays;
import net.lingala.zip4j.crypto.PBKDF2.MacBasedPRF;
import net.lingala.zip4j.crypto.PBKDF2.PBKDF2Engine;
import net.lingala.zip4j.crypto.PBKDF2.PBKDF2Parameters;
import net.lingala.zip4j.crypto.engine.AESEngine;
import net.lingala.zip4j.exception.ZipException;
import net.lingala.zip4j.model.AESExtraDataRecord;
import net.lingala.zip4j.model.LocalFileHeader;
import net.lingala.zip4j.util.Raw;

public class AESDecrypter
  implements IDecrypter
{
  private int KEY_LENGTH;
  private int MAC_LENGTH;
  private final int PASSWORD_VERIFIER_LENGTH = 2;
  private int SALT_LENGTH;
  private AESEngine aesEngine;
  private byte[] aesKey;
  private byte[] counterBlock;
  private byte[] derivedPasswordVerifier;
  private byte[] iv;
  private LocalFileHeader localFileHeader;
  private int loopCount = 0;
  private MacBasedPRF mac;
  private byte[] macKey;
  private int nonce = 1;
  private byte[] storedMac;
  
  public AESDecrypter(LocalFileHeader paramLocalFileHeader, byte[] paramArrayOfByte1, byte[] paramArrayOfByte2)
    throws ZipException
  {
    if (paramLocalFileHeader == null) {
      throw new ZipException("one of the input parameters is null in AESDecryptor Constructor");
    }
    this.localFileHeader = paramLocalFileHeader;
    this.storedMac = null;
    this.iv = new byte[16];
    this.counterBlock = new byte[16];
    init(paramArrayOfByte1, paramArrayOfByte2);
  }
  
  private byte[] deriveKey(byte[] paramArrayOfByte, char[] paramArrayOfChar)
    throws ZipException
  {
    try
    {
      byte[] arrayOfByte = new PBKDF2Engine(new PBKDF2Parameters("HmacSHA1", "ISO-8859-1", paramArrayOfByte, 1000)).deriveKey(paramArrayOfChar, 2 + (this.KEY_LENGTH + this.MAC_LENGTH));
      return arrayOfByte;
    }
    catch (Exception localException)
    {
      throw new ZipException(localException);
    }
  }
  
  private void init(byte[] paramArrayOfByte1, byte[] paramArrayOfByte2)
    throws ZipException
  {
    if (this.localFileHeader == null) {
      throw new ZipException("invalid file header in init method of AESDecryptor");
    }
    AESExtraDataRecord localAESExtraDataRecord = this.localFileHeader.getAesExtraDataRecord();
    if (localAESExtraDataRecord == null) {
      throw new ZipException("invalid aes extra data record - in init method of AESDecryptor");
    }
    switch (localAESExtraDataRecord.getAesStrength())
    {
    default: 
      throw new ZipException("invalid aes key strength for file: " + this.localFileHeader.getFileName());
    case 1: 
      this.KEY_LENGTH = 16;
      this.MAC_LENGTH = 16;
      this.SALT_LENGTH = 8;
    }
    while ((this.localFileHeader.getPassword() == null) || (this.localFileHeader.getPassword().length <= 0))
    {
      throw new ZipException("empty or null password provided for AES Decryptor");
      this.KEY_LENGTH = 24;
      this.MAC_LENGTH = 24;
      this.SALT_LENGTH = 12;
      continue;
      this.KEY_LENGTH = 32;
      this.MAC_LENGTH = 32;
      this.SALT_LENGTH = 16;
    }
    byte[] arrayOfByte = deriveKey(paramArrayOfByte1, this.localFileHeader.getPassword());
    if ((arrayOfByte == null) || (arrayOfByte.length != 2 + (this.KEY_LENGTH + this.MAC_LENGTH))) {
      throw new ZipException("invalid derived key");
    }
    this.aesKey = new byte[this.KEY_LENGTH];
    this.macKey = new byte[this.MAC_LENGTH];
    this.derivedPasswordVerifier = new byte[2];
    System.arraycopy(arrayOfByte, 0, this.aesKey, 0, this.KEY_LENGTH);
    System.arraycopy(arrayOfByte, this.KEY_LENGTH, this.macKey, 0, this.MAC_LENGTH);
    System.arraycopy(arrayOfByte, this.KEY_LENGTH + this.MAC_LENGTH, this.derivedPasswordVerifier, 0, 2);
    if (this.derivedPasswordVerifier == null) {
      throw new ZipException("invalid derived password verifier for AES");
    }
    if (!Arrays.equals(paramArrayOfByte2, this.derivedPasswordVerifier)) {
      throw new ZipException("Wrong Password for file: " + this.localFileHeader.getFileName(), 5);
    }
    this.aesEngine = new AESEngine(this.aesKey);
    this.mac = new MacBasedPRF("HmacSHA1");
    this.mac.init(this.macKey);
  }
  
  public int decryptData(byte[] paramArrayOfByte)
    throws ZipException
  {
    return decryptData(paramArrayOfByte, 0, paramArrayOfByte.length);
  }
  
  public int decryptData(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws ZipException
  {
    if (this.aesEngine == null) {
      throw new ZipException("AES not initialized properly");
    }
    int i = paramInt1;
    if (i >= paramInt1 + paramInt2) {
      return paramInt2;
    }
    int j;
    if (i + 16 <= paramInt1 + paramInt2) {
      j = 16;
    }
    for (;;)
    {
      try
      {
        this.loopCount = j;
        this.mac.update(paramArrayOfByte, i, this.loopCount);
        Raw.prepareBuffAESIVBytes(this.iv, this.nonce, 16);
        this.aesEngine.processBlock(this.iv, this.counterBlock);
        int k = 0;
        if (k >= this.loopCount)
        {
          this.nonce = (1 + this.nonce);
          i += 16;
          break;
        }
        paramArrayOfByte[(i + k)] = ((byte)(paramArrayOfByte[(i + k)] ^ this.counterBlock[k]));
        k++;
        continue;
        j = paramInt1 + paramInt2 - i;
      }
      catch (ZipException localZipException)
      {
        throw localZipException;
      }
      catch (Exception localException)
      {
        throw new ZipException(localException);
      }
    }
  }
  
  public byte[] getCalculatedAuthenticationBytes()
  {
    return this.mac.doFinal();
  }
  
  public int getPasswordVerifierLength()
  {
    return 2;
  }
  
  public int getSaltLength()
  {
    return this.SALT_LENGTH;
  }
  
  public byte[] getStoredMac()
  {
    return this.storedMac;
  }
  
  public void setStoredMac(byte[] paramArrayOfByte)
  {
    this.storedMac = paramArrayOfByte;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/net/lingala/zip4j/crypto/AESDecrypter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */