package net.lingala.zip4j.crypto.PBKDF2;

class PBKDF2HexFormatter
{
  public boolean fromString(PBKDF2Parameters paramPBKDF2Parameters, String paramString)
  {
    if ((paramPBKDF2Parameters == null) || (paramString == null)) {
      return true;
    }
    String[] arrayOfString = paramString.split(":");
    if ((arrayOfString == null) || (arrayOfString.length != 3)) {
      return true;
    }
    byte[] arrayOfByte1 = BinTools.hex2bin(arrayOfString[0]);
    int i = Integer.parseInt(arrayOfString[1]);
    byte[] arrayOfByte2 = BinTools.hex2bin(arrayOfString[2]);
    paramPBKDF2Parameters.setSalt(arrayOfByte1);
    paramPBKDF2Parameters.setIterationCount(i);
    paramPBKDF2Parameters.setDerivedKey(arrayOfByte2);
    return false;
  }
  
  public String toString(PBKDF2Parameters paramPBKDF2Parameters)
  {
    return BinTools.bin2hex(paramPBKDF2Parameters.getSalt()) + ":" + String.valueOf(paramPBKDF2Parameters.getIterationCount()) + ":" + BinTools.bin2hex(paramPBKDF2Parameters.getDerivedKey());
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/net/lingala/zip4j/crypto/PBKDF2/PBKDF2HexFormatter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */