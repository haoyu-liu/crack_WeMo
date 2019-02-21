package net.lingala.zip4j.crypto.engine;

public class ZipCryptoEngine
{
  private static final int[] CRC_TABLE = new int['Ā'];
  private final int[] keys = new int[3];
  
  static
  {
    int j;
    int k;
    for (int i = 0;; i++)
    {
      if (i >= 256) {
        return;
      }
      j = i;
      k = 0;
      if (k < 8) {
        break;
      }
      CRC_TABLE[i] = j;
    }
    if ((j & 0x1) == 1) {
      j = 0xEDB88320 ^ j >>> 1;
    }
    for (;;)
    {
      k++;
      break;
      j >>>= 1;
    }
  }
  
  private int crc32(int paramInt, byte paramByte)
  {
    return paramInt >>> 8 ^ CRC_TABLE[(0xFF & (paramInt ^ paramByte))];
  }
  
  public byte decryptByte()
  {
    int i = 0x2 | this.keys[2];
    return (byte)(i * (i ^ 0x1) >>> 8);
  }
  
  public void initKeys(char[] paramArrayOfChar)
  {
    this.keys[0] = 305419896;
    this.keys[1] = 591751049;
    this.keys[2] = 878082192;
    for (int i = 0;; i++)
    {
      if (i >= paramArrayOfChar.length) {
        return;
      }
      updateKeys((byte)(0xFF & paramArrayOfChar[i]));
    }
  }
  
  public void updateKeys(byte paramByte)
  {
    this.keys[0] = crc32(this.keys[0], paramByte);
    int[] arrayOfInt = this.keys;
    arrayOfInt[1] += (0xFF & this.keys[0]);
    this.keys[1] = (1 + 134775813 * this.keys[1]);
    this.keys[2] = crc32(this.keys[2], (byte)(this.keys[1] >> 24));
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/net/lingala/zip4j/crypto/engine/ZipCryptoEngine.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */