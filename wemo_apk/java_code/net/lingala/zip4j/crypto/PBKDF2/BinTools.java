package net.lingala.zip4j.crypto.PBKDF2;

class BinTools
{
  public static final String hex = "0123456789ABCDEF";
  
  public static String bin2hex(byte[] paramArrayOfByte)
  {
    if (paramArrayOfByte == null) {
      return "";
    }
    StringBuffer localStringBuffer = new StringBuffer(2 * paramArrayOfByte.length);
    for (int i = 0;; i++)
    {
      if (i >= paramArrayOfByte.length) {
        return localStringBuffer.toString();
      }
      int j = (256 + paramArrayOfByte[i]) % 256;
      localStringBuffer.append("0123456789ABCDEF".charAt(0xF & j / 16));
      localStringBuffer.append("0123456789ABCDEF".charAt(0xF & j % 16));
    }
  }
  
  public static int hex2bin(char paramChar)
  {
    if ((paramChar >= '0') && (paramChar <= '9')) {
      return paramChar - '0';
    }
    if ((paramChar >= 'A') && (paramChar <= 'F')) {
      return 10 + (paramChar - 'A');
    }
    if ((paramChar >= 'a') && (paramChar <= 'f')) {
      return 10 + (paramChar - 'a');
    }
    throw new IllegalArgumentException("Input string may only contain hex digits, but found '" + paramChar + "'");
  }
  
  public static byte[] hex2bin(String paramString)
  {
    String str = paramString;
    byte[] arrayOfByte;
    int i;
    if (paramString == null)
    {
      str = "";
      arrayOfByte = new byte[str.length() / 2];
      i = 0;
    }
    for (int j = 0;; j++)
    {
      if (i >= str.length())
      {
        return arrayOfByte;
        if (paramString.length() % 2 == 0) {
          break;
        }
        str = "0" + paramString;
        break;
      }
      int k = i + 1;
      char c1 = str.charAt(i);
      i = k + 1;
      char c2 = str.charAt(k);
      arrayOfByte[j] = ((byte)(16 * hex2bin(c1) + hex2bin(c2)));
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/net/lingala/zip4j/crypto/PBKDF2/BinTools.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */