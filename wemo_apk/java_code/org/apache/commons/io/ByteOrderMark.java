package org.apache.commons.io;

import java.io.Serializable;

public class ByteOrderMark
  implements Serializable
{
  public static final ByteOrderMark UTF_16BE = new ByteOrderMark("UTF-16BE", new int[] { 254, 255 });
  public static final ByteOrderMark UTF_16LE = new ByteOrderMark("UTF-16LE", new int[] { 255, 254 });
  public static final ByteOrderMark UTF_32BE = new ByteOrderMark("UTF-32BE", new int[] { 0, 0, 254, 255 });
  public static final ByteOrderMark UTF_32LE = new ByteOrderMark("UTF-32LE", new int[] { 255, 254, 0, 0 });
  public static final ByteOrderMark UTF_8 = new ByteOrderMark("UTF-8", new int[] { 239, 187, 191 });
  private static final long serialVersionUID = 1L;
  private final int[] bytes;
  private final String charsetName;
  
  public ByteOrderMark(String paramString, int... paramVarArgs)
  {
    if ((paramString == null) || (paramString.length() == 0)) {
      throw new IllegalArgumentException("No charsetName specified");
    }
    if ((paramVarArgs == null) || (paramVarArgs.length == 0)) {
      throw new IllegalArgumentException("No bytes specified");
    }
    this.charsetName = paramString;
    this.bytes = new int[paramVarArgs.length];
    System.arraycopy(paramVarArgs, 0, this.bytes, 0, paramVarArgs.length);
  }
  
  public boolean equals(Object paramObject)
  {
    if (!(paramObject instanceof ByteOrderMark)) {}
    ByteOrderMark localByteOrderMark;
    do
    {
      return false;
      localByteOrderMark = (ByteOrderMark)paramObject;
    } while (this.bytes.length != localByteOrderMark.length());
    for (int i = 0;; i++)
    {
      if (i >= this.bytes.length) {
        break label57;
      }
      if (this.bytes[i] != localByteOrderMark.get(i)) {
        break;
      }
    }
    label57:
    return true;
  }
  
  public int get(int paramInt)
  {
    return this.bytes[paramInt];
  }
  
  public byte[] getBytes()
  {
    byte[] arrayOfByte = new byte[this.bytes.length];
    for (int i = 0; i < this.bytes.length; i++) {
      arrayOfByte[i] = ((byte)this.bytes[i]);
    }
    return arrayOfByte;
  }
  
  public String getCharsetName()
  {
    return this.charsetName;
  }
  
  public int hashCode()
  {
    int i = getClass().hashCode();
    int[] arrayOfInt = this.bytes;
    int j = arrayOfInt.length;
    for (int k = 0; k < j; k++) {
      i += arrayOfInt[k];
    }
    return i;
  }
  
  public int length()
  {
    return this.bytes.length;
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append(getClass().getSimpleName());
    localStringBuilder.append('[');
    localStringBuilder.append(this.charsetName);
    localStringBuilder.append(": ");
    for (int i = 0; i < this.bytes.length; i++)
    {
      if (i > 0) {
        localStringBuilder.append(",");
      }
      localStringBuilder.append("0x");
      localStringBuilder.append(Integer.toHexString(0xFF & this.bytes[i]).toUpperCase());
    }
    localStringBuilder.append(']');
    return localStringBuilder.toString();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/commons/io/ByteOrderMark.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */