package com.belkin.wemo.push.adm;

import android.util.Base64;
import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.util.Comparator;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.SortedMap;
import java.util.TreeMap;

public class ADMMD5ChecksumCalculator
{
  private static final String ALGORITHM = "MD5";
  private static final String ENCODING = "UTF-8";
  
  /* Error */
  private byte[] getMd5Bytes(String paramString)
  {
    // Byte code:
    //   0: aload_1
    //   1: ldc 11
    //   3: invokevirtual 26	java/lang/String:getBytes	(Ljava/lang/String;)[B
    //   6: astore_3
    //   7: ldc 8
    //   9: invokestatic 32	java/security/MessageDigest:getInstance	(Ljava/lang/String;)Ljava/security/MessageDigest;
    //   12: astore 5
    //   14: aload 5
    //   16: aload_3
    //   17: invokevirtual 36	java/security/MessageDigest:update	([B)V
    //   20: aload 5
    //   22: invokevirtual 40	java/security/MessageDigest:digest	()[B
    //   25: areturn
    //   26: astore_2
    //   27: new 42	java/lang/RuntimeException
    //   30: dup
    //   31: ldc 44
    //   33: aload_2
    //   34: invokespecial 47	java/lang/RuntimeException:<init>	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   37: athrow
    //   38: astore 4
    //   40: new 42	java/lang/RuntimeException
    //   43: dup
    //   44: ldc 49
    //   46: aload 4
    //   48: invokespecial 47	java/lang/RuntimeException:<init>	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   51: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	52	0	this	ADMMD5ChecksumCalculator
    //   0	52	1	paramString	String
    //   26	8	2	localUnsupportedEncodingException	UnsupportedEncodingException
    //   6	11	3	arrayOfByte	byte[]
    //   38	9	4	localNoSuchAlgorithmException	java.security.NoSuchAlgorithmException
    //   12	9	5	localMessageDigest	java.security.MessageDigest
    // Exception table:
    //   from	to	target	type
    //   0	7	26	java/io/UnsupportedEncodingException
    //   7	14	38	java/security/NoSuchAlgorithmException
  }
  
  private String getSerializedMap(Map<String, String> paramMap)
  {
    TreeMap localTreeMap = new TreeMap(new UTF8CodeUnitStringComparator(null));
    localTreeMap.putAll(paramMap);
    StringBuilder localStringBuilder = new StringBuilder();
    int i = 1;
    Iterator localIterator = localTreeMap.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      Object[] arrayOfObject = new Object[2];
      arrayOfObject[0] = localEntry.getKey();
      arrayOfObject[1] = localEntry.getValue();
      localStringBuilder.append(String.format("%s:%s", arrayOfObject));
      int j = i + 1;
      if (i < localTreeMap.size()) {
        localStringBuilder.append(",");
      }
      i = j;
    }
    return localStringBuilder.toString();
  }
  
  public String calculateChecksum(Map<String, String> paramMap)
  {
    return new String(Base64.encode(getMd5Bytes(getSerializedMap(paramMap)), 0));
  }
  
  private class UTF8CodeUnitStringComparator
    implements Comparator<String>, Serializable
  {
    private static final long serialVersionUID = -7754286112568656554L;
    
    private UTF8CodeUnitStringComparator() {}
    
    public int compare(String paramString1, String paramString2)
    {
      for (;;)
      {
        int j;
        try
        {
          byte[] arrayOfByte1 = paramString1.getBytes("UTF-8");
          byte[] arrayOfByte2 = paramString2.getBytes("UTF-8");
          int i = Math.min(arrayOfByte1.length, arrayOfByte2.length);
          j = 0;
          if (j < i)
          {
            int k = 0xFF & arrayOfByte1[j];
            int m = 0xFF & arrayOfByte2[j];
            if (k != m) {
              return k - m;
            }
          }
          else
          {
            int n = arrayOfByte1.length;
            int i1 = arrayOfByte2.length;
            return n - i1;
          }
        }
        catch (UnsupportedEncodingException localUnsupportedEncodingException)
        {
          throw new RuntimeException("UTF-8 not supported!", localUnsupportedEncodingException);
        }
        j++;
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/push/adm/ADMMD5ChecksumCalculator.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */