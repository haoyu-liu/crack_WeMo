package net.lingala.zip4j.util;

import java.io.DataInput;
import java.io.IOException;
import net.lingala.zip4j.exception.ZipException;

public class Raw
{
  public static byte bitArrayToByte(int[] paramArrayOfInt)
    throws ZipException
  {
    if (paramArrayOfInt == null) {
      throw new ZipException("bit array is null, cannot calculate byte from bits");
    }
    if (paramArrayOfInt.length != 8) {
      throw new ZipException("invalid bit array length, cannot calculate byte");
    }
    if (!checkBits(paramArrayOfInt)) {
      throw new ZipException("invalid bits provided, bits contain other values than 0 or 1");
    }
    int i = 0;
    for (int j = 0;; j++)
    {
      if (j >= paramArrayOfInt.length) {
        return (byte)i;
      }
      i = (int)(i + Math.pow(2.0D, j) * paramArrayOfInt[j]);
    }
  }
  
  private static boolean checkBits(int[] paramArrayOfInt)
  {
    for (int i = 0;; i++)
    {
      if (i >= paramArrayOfInt.length) {
        return true;
      }
      if ((paramArrayOfInt[i] != 0) && (paramArrayOfInt[i] != 1)) {
        return false;
      }
    }
  }
  
  public static byte[] convertCharArrayToByteArray(char[] paramArrayOfChar)
  {
    if (paramArrayOfChar == null) {
      throw new NullPointerException();
    }
    byte[] arrayOfByte = new byte[paramArrayOfChar.length];
    for (int i = 0;; i++)
    {
      if (i >= paramArrayOfChar.length) {
        return arrayOfByte;
      }
      arrayOfByte[i] = ((byte)paramArrayOfChar[i]);
    }
  }
  
  public static void prepareBuffAESIVBytes(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    paramArrayOfByte[0] = ((byte)paramInt1);
    paramArrayOfByte[1] = ((byte)(paramInt1 >> 8));
    paramArrayOfByte[2] = ((byte)(paramInt1 >> 16));
    paramArrayOfByte[3] = ((byte)(paramInt1 >> 24));
    paramArrayOfByte[4] = 0;
    paramArrayOfByte[5] = 0;
    paramArrayOfByte[6] = 0;
    paramArrayOfByte[7] = 0;
    paramArrayOfByte[8] = 0;
    paramArrayOfByte[9] = 0;
    paramArrayOfByte[10] = 0;
    paramArrayOfByte[11] = 0;
    paramArrayOfByte[12] = 0;
    paramArrayOfByte[13] = 0;
    paramArrayOfByte[14] = 0;
    paramArrayOfByte[15] = 0;
  }
  
  public static int readIntLittleEndian(byte[] paramArrayOfByte, int paramInt)
  {
    return 0xFF & paramArrayOfByte[paramInt] | (0xFF & paramArrayOfByte[(paramInt + 1)]) << 8 | (0xFF & paramArrayOfByte[(paramInt + 2)] | (0xFF & paramArrayOfByte[(paramInt + 3)]) << 8) << 16;
  }
  
  public static int readLeInt(DataInput paramDataInput, byte[] paramArrayOfByte)
    throws ZipException
  {
    try
    {
      paramDataInput.readFully(paramArrayOfByte, 0, 4);
      return 0xFF & paramArrayOfByte[0] | (0xFF & paramArrayOfByte[1]) << 8 | (0xFF & paramArrayOfByte[2] | (0xFF & paramArrayOfByte[3]) << 8) << 16;
    }
    catch (IOException localIOException)
    {
      throw new ZipException(localIOException);
    }
  }
  
  public static long readLongLittleEndian(byte[] paramArrayOfByte, int paramInt)
  {
    return (((((((0L | 0xFF & paramArrayOfByte[(paramInt + 7)]) << 8 | 0xFF & paramArrayOfByte[(paramInt + 6)]) << 8 | 0xFF & paramArrayOfByte[(paramInt + 5)]) << 8 | 0xFF & paramArrayOfByte[(paramInt + 4)]) << 8 | 0xFF & paramArrayOfByte[(paramInt + 3)]) << 8 | 0xFF & paramArrayOfByte[(paramInt + 2)]) << 8 | 0xFF & paramArrayOfByte[(paramInt + 1)]) << 8 | 0xFF & paramArrayOfByte[paramInt];
  }
  
  public static final short readShortBigEndian(byte[] paramArrayOfByte, int paramInt)
  {
    return (short)((short)((short)(0x0 | 0xFF & paramArrayOfByte[paramInt]) << 8) | 0xFF & paramArrayOfByte[(paramInt + 1)]);
  }
  
  public static int readShortLittleEndian(byte[] paramArrayOfByte, int paramInt)
  {
    return 0xFF & paramArrayOfByte[paramInt] | (0xFF & paramArrayOfByte[(paramInt + 1)]) << 8;
  }
  
  public static byte[] toByteArray(int paramInt)
  {
    byte[] arrayOfByte = new byte[4];
    arrayOfByte[0] = ((byte)paramInt);
    arrayOfByte[1] = ((byte)(paramInt >> 8));
    arrayOfByte[2] = ((byte)(paramInt >> 16));
    arrayOfByte[3] = ((byte)(paramInt >> 24));
    return arrayOfByte;
  }
  
  public static byte[] toByteArray(int paramInt1, int paramInt2)
  {
    byte[] arrayOfByte1 = new byte[paramInt2];
    byte[] arrayOfByte2 = toByteArray(paramInt1);
    for (int i = 0;; i++)
    {
      if ((i >= arrayOfByte2.length) || (i >= paramInt2)) {
        return arrayOfByte1;
      }
      arrayOfByte1[i] = arrayOfByte2[i];
    }
  }
  
  public static final void writeIntLittleEndian(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    paramArrayOfByte[(paramInt1 + 3)] = ((byte)(paramInt2 >>> 24));
    paramArrayOfByte[(paramInt1 + 2)] = ((byte)(paramInt2 >>> 16));
    paramArrayOfByte[(paramInt1 + 1)] = ((byte)(paramInt2 >>> 8));
    paramArrayOfByte[paramInt1] = ((byte)(paramInt2 & 0xFF));
  }
  
  public static void writeLongLittleEndian(byte[] paramArrayOfByte, int paramInt, long paramLong)
  {
    paramArrayOfByte[(paramInt + 7)] = ((byte)(int)(paramLong >>> 56));
    paramArrayOfByte[(paramInt + 6)] = ((byte)(int)(paramLong >>> 48));
    paramArrayOfByte[(paramInt + 5)] = ((byte)(int)(paramLong >>> 40));
    paramArrayOfByte[(paramInt + 4)] = ((byte)(int)(paramLong >>> 32));
    paramArrayOfByte[(paramInt + 3)] = ((byte)(int)(paramLong >>> 24));
    paramArrayOfByte[(paramInt + 2)] = ((byte)(int)(paramLong >>> 16));
    paramArrayOfByte[(paramInt + 1)] = ((byte)(int)(paramLong >>> 8));
    paramArrayOfByte[paramInt] = ((byte)(int)(0xFF & paramLong));
  }
  
  public static final void writeShortLittleEndian(byte[] paramArrayOfByte, int paramInt, short paramShort)
  {
    paramArrayOfByte[(paramInt + 1)] = ((byte)(paramShort >>> 8));
    paramArrayOfByte[paramInt] = ((byte)(paramShort & 0xFF));
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/net/lingala/zip4j/util/Raw.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */