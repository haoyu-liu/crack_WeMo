package net.lingala.zip4j.crypto.PBKDF2;

import net.lingala.zip4j.util.Raw;

public class PBKDF2Engine
{
  protected PBKDF2Parameters parameters;
  protected PRF prf;
  
  public PBKDF2Engine()
  {
    this.parameters = null;
    this.prf = null;
  }
  
  public PBKDF2Engine(PBKDF2Parameters paramPBKDF2Parameters)
  {
    this.parameters = paramPBKDF2Parameters;
    this.prf = null;
  }
  
  public PBKDF2Engine(PBKDF2Parameters paramPBKDF2Parameters, PRF paramPRF)
  {
    this.parameters = paramPBKDF2Parameters;
    this.prf = paramPRF;
  }
  
  protected void INT(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    paramArrayOfByte[(paramInt1 + 0)] = ((byte)(paramInt2 / 16777216));
    paramArrayOfByte[(paramInt1 + 1)] = ((byte)(paramInt2 / 65536));
    paramArrayOfByte[(paramInt1 + 2)] = ((byte)(paramInt2 / 256));
    paramArrayOfByte[(paramInt1 + 3)] = ((byte)paramInt2);
  }
  
  protected byte[] PBKDF2(PRF paramPRF, byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    if (paramArrayOfByte == null) {
      paramArrayOfByte = new byte[0];
    }
    int i = paramPRF.getHLen();
    int j = ceil(paramInt2, i);
    int k = paramInt2 - i * (j - 1);
    byte[] arrayOfByte1 = new byte[j * i];
    int m = 0;
    for (int n = 1;; n++)
    {
      if (n > j)
      {
        if (k >= i) {
          break;
        }
        byte[] arrayOfByte2 = new byte[paramInt2];
        System.arraycopy(arrayOfByte1, 0, arrayOfByte2, 0, paramInt2);
        return arrayOfByte2;
      }
      _F(arrayOfByte1, m, paramPRF, paramArrayOfByte, paramInt1, n);
      m += i;
    }
    return arrayOfByte1;
  }
  
  protected void _F(byte[] paramArrayOfByte1, int paramInt1, PRF paramPRF, byte[] paramArrayOfByte2, int paramInt2, int paramInt3)
  {
    int i = paramPRF.getHLen();
    byte[] arrayOfByte1 = new byte[i];
    byte[] arrayOfByte2 = new byte[4 + paramArrayOfByte2.length];
    System.arraycopy(paramArrayOfByte2, 0, arrayOfByte2, 0, paramArrayOfByte2.length);
    INT(arrayOfByte2, paramArrayOfByte2.length, paramInt3);
    for (int j = 0;; j++)
    {
      if (j >= paramInt2)
      {
        System.arraycopy(arrayOfByte1, 0, paramArrayOfByte1, paramInt1, i);
        return;
      }
      arrayOfByte2 = paramPRF.doFinal(arrayOfByte2);
      xor(arrayOfByte1, arrayOfByte2);
    }
  }
  
  protected void assertPRF(byte[] paramArrayOfByte)
  {
    if (this.prf == null) {
      this.prf = new MacBasedPRF(this.parameters.getHashAlgorithm());
    }
    this.prf.init(paramArrayOfByte);
  }
  
  protected int ceil(int paramInt1, int paramInt2)
  {
    int i = paramInt1 % paramInt2;
    int j = 0;
    if (i > 0) {
      j = 1;
    }
    return j + paramInt1 / paramInt2;
  }
  
  public byte[] deriveKey(char[] paramArrayOfChar)
  {
    return deriveKey(paramArrayOfChar, 0);
  }
  
  public byte[] deriveKey(char[] paramArrayOfChar, int paramInt)
  {
    ((byte[])null);
    ((byte[])null);
    if (paramArrayOfChar == null) {
      throw new NullPointerException();
    }
    assertPRF(Raw.convertCharArrayToByteArray(paramArrayOfChar));
    if (paramInt == 0) {
      paramInt = this.prf.getHLen();
    }
    return PBKDF2(this.prf, this.parameters.getSalt(), this.parameters.getIterationCount(), paramInt);
  }
  
  public PBKDF2Parameters getParameters()
  {
    return this.parameters;
  }
  
  public PRF getPseudoRandomFunction()
  {
    return this.prf;
  }
  
  public void setParameters(PBKDF2Parameters paramPBKDF2Parameters)
  {
    this.parameters = paramPBKDF2Parameters;
  }
  
  public void setPseudoRandomFunction(PRF paramPRF)
  {
    this.prf = paramPRF;
  }
  
  public boolean verifyKey(char[] paramArrayOfChar)
  {
    byte[] arrayOfByte1 = getParameters().getDerivedKey();
    if ((arrayOfByte1 == null) || (arrayOfByte1.length == 0)) {}
    byte[] arrayOfByte2;
    do
    {
      return false;
      arrayOfByte2 = deriveKey(paramArrayOfChar, arrayOfByte1.length);
    } while ((arrayOfByte2 == null) || (arrayOfByte2.length != arrayOfByte1.length));
    for (int i = 0;; i++)
    {
      if (i >= arrayOfByte2.length) {
        return true;
      }
      if (arrayOfByte2[i] != arrayOfByte1[i]) {
        break;
      }
    }
  }
  
  protected void xor(byte[] paramArrayOfByte1, byte[] paramArrayOfByte2)
  {
    for (int i = 0;; i++)
    {
      if (i >= paramArrayOfByte1.length) {
        return;
      }
      paramArrayOfByte1[i] = ((byte)(paramArrayOfByte1[i] ^ paramArrayOfByte2[i]));
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/net/lingala/zip4j/crypto/PBKDF2/PBKDF2Engine.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */