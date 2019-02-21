package net.lingala.zip4j.crypto;

import java.util.Random;
import net.lingala.zip4j.crypto.PBKDF2.MacBasedPRF;
import net.lingala.zip4j.crypto.PBKDF2.PBKDF2Engine;
import net.lingala.zip4j.crypto.PBKDF2.PBKDF2Parameters;
import net.lingala.zip4j.crypto.engine.AESEngine;
import net.lingala.zip4j.exception.ZipException;
import net.lingala.zip4j.util.Raw;

public class AESEncrpyter
  implements IEncrypter
{
  private int KEY_LENGTH;
  private int MAC_LENGTH;
  private final int PASSWORD_VERIFIER_LENGTH = 2;
  private int SALT_LENGTH;
  private AESEngine aesEngine;
  private byte[] aesKey;
  private byte[] counterBlock;
  private byte[] derivedPasswordVerifier;
  private boolean finished;
  private byte[] iv;
  private int keyStrength;
  private int loopCount = 0;
  private MacBasedPRF mac;
  private byte[] macKey;
  private int nonce = 1;
  private char[] password;
  private byte[] saltBytes;
  
  public AESEncrpyter(char[] paramArrayOfChar, int paramInt)
    throws ZipException
  {
    if ((paramArrayOfChar == null) || (paramArrayOfChar.length == 0)) {
      throw new ZipException("input password is empty or null in AES encrypter constructor");
    }
    if ((paramInt != 1) && (paramInt != 3)) {
      throw new ZipException("Invalid key strength in AES encrypter constructor");
    }
    this.password = paramArrayOfChar;
    this.keyStrength = paramInt;
    this.finished = false;
    this.counterBlock = new byte[16];
    this.iv = new byte[16];
    init();
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
  
  private static byte[] generateSalt(int paramInt)
    throws ZipException
  {
    if ((paramInt != 8) && (paramInt != 16)) {
      throw new ZipException("invalid salt size, cannot generate salt");
    }
    int i = 0;
    if (paramInt == 8) {
      i = 2;
    }
    if (paramInt == 16) {
      i = 4;
    }
    byte[] arrayOfByte = new byte[paramInt];
    for (int j = 0;; j++)
    {
      if (j >= i) {
        return arrayOfByte;
      }
      int k = new Random().nextInt();
      arrayOfByte[(0 + j * 4)] = ((byte)(k >> 24));
      arrayOfByte[(1 + j * 4)] = ((byte)(k >> 16));
      arrayOfByte[(2 + j * 4)] = ((byte)(k >> 8));
      arrayOfByte[(3 + j * 4)] = ((byte)k);
    }
  }
  
  private void init()
    throws ZipException
  {
    switch (this.keyStrength)
    {
    case 2: 
    default: 
      throw new ZipException("invalid aes key strength, cannot determine key sizes");
    case 1: 
      this.KEY_LENGTH = 16;
      this.MAC_LENGTH = 16;
    }
    byte[] arrayOfByte;
    for (this.SALT_LENGTH = 8;; this.SALT_LENGTH = 16)
    {
      this.saltBytes = generateSalt(this.SALT_LENGTH);
      arrayOfByte = deriveKey(this.saltBytes, this.password);
      if ((arrayOfByte != null) && (arrayOfByte.length == 2 + (this.KEY_LENGTH + this.MAC_LENGTH))) {
        break;
      }
      throw new ZipException("invalid key generated, cannot decrypt file");
      this.KEY_LENGTH = 32;
      this.MAC_LENGTH = 32;
    }
    this.aesKey = new byte[this.KEY_LENGTH];
    this.macKey = new byte[this.MAC_LENGTH];
    this.derivedPasswordVerifier = new byte[2];
    System.arraycopy(arrayOfByte, 0, this.aesKey, 0, this.KEY_LENGTH);
    System.arraycopy(arrayOfByte, this.KEY_LENGTH, this.macKey, 0, this.MAC_LENGTH);
    System.arraycopy(arrayOfByte, this.KEY_LENGTH + this.MAC_LENGTH, this.derivedPasswordVerifier, 0, 2);
    this.aesEngine = new AESEngine(this.aesKey);
    this.mac = new MacBasedPRF("HmacSHA1");
    this.mac.init(this.macKey);
  }
  
  public int encryptData(byte[] paramArrayOfByte)
    throws ZipException
  {
    if (paramArrayOfByte == null) {
      throw new ZipException("input bytes are null, cannot perform AES encrpytion");
    }
    return encryptData(paramArrayOfByte, 0, paramArrayOfByte.length);
  }
  
  public int encryptData(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws ZipException
  {
    if (this.finished) {
      throw new ZipException("AES Encrypter is in finished state (A non 16 byte block has already been passed to encrypter)");
    }
    if (paramInt2 % 16 != 0) {
      this.finished = true;
    }
    int i = paramInt1;
    if (i >= paramInt1 + paramInt2) {
      return paramInt2;
    }
    int j;
    if (i + 16 <= paramInt1 + paramInt2)
    {
      j = 16;
      label57:
      this.loopCount = j;
      Raw.prepareBuffAESIVBytes(this.iv, this.nonce, 16);
      this.aesEngine.processBlock(this.iv, this.counterBlock);
    }
    for (int k = 0;; k++)
    {
      if (k >= this.loopCount)
      {
        this.mac.update(paramArrayOfByte, i, this.loopCount);
        this.nonce = (1 + this.nonce);
        i += 16;
        break;
        j = paramInt1 + paramInt2 - i;
        break label57;
      }
      paramArrayOfByte[(i + k)] = ((byte)(paramArrayOfByte[(i + k)] ^ this.counterBlock[k]));
    }
  }
  
  public byte[] getDerivedPasswordVerifier()
  {
    return this.derivedPasswordVerifier;
  }
  
  public byte[] getFinalMac()
  {
    byte[] arrayOfByte1 = this.mac.doFinal();
    byte[] arrayOfByte2 = new byte[10];
    System.arraycopy(arrayOfByte1, 0, arrayOfByte2, 0, 10);
    return arrayOfByte2;
  }
  
  public int getPasswordVeriifierLength()
  {
    return 2;
  }
  
  public byte[] getSaltBytes()
  {
    return this.saltBytes;
  }
  
  public int getSaltLength()
  {
    return this.SALT_LENGTH;
  }
  
  public void setDerivedPasswordVerifier(byte[] paramArrayOfByte)
  {
    this.derivedPasswordVerifier = paramArrayOfByte;
  }
  
  public void setSaltBytes(byte[] paramArrayOfByte)
  {
    this.saltBytes = paramArrayOfByte;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/net/lingala/zip4j/crypto/AESEncrpyter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */