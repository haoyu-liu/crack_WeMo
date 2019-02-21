package org.cybergarage.util;

public final class StringUtil
{
  public static final int findFirstNotOf(String paramString1, String paramString2)
  {
    return findOf(paramString1, paramString2, 0, -1 + paramString1.length(), 1, false);
  }
  
  public static final int findFirstOf(String paramString1, String paramString2)
  {
    return findOf(paramString1, paramString2, 0, -1 + paramString1.length(), 1, true);
  }
  
  public static final int findLastNotOf(String paramString1, String paramString2)
  {
    return findOf(paramString1, paramString2, -1 + paramString1.length(), 0, -1, false);
  }
  
  public static final int findLastOf(String paramString1, String paramString2)
  {
    return findOf(paramString1, paramString2, -1 + paramString1.length(), 0, -1, true);
  }
  
  public static final int findOf(String paramString1, String paramString2, int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean)
  {
    if (paramInt3 == 0)
    {
      j = -1;
      return j;
    }
    int i = paramString2.length();
    int j = paramInt1;
    for (;;)
    {
      if (paramInt3 > 0)
      {
        if (paramInt2 >= j) {}
      }
      else {
        while (j < paramInt2) {
          return -1;
        }
      }
      int k = paramString1.charAt(j);
      int m = 0;
      int n = 0;
      if (n < i)
      {
        int i1 = paramString2.charAt(n);
        if (paramBoolean == true) {
          if (k == i1) {
            break;
          }
        }
        do
        {
          n++;
          break;
          if (k != i1) {
            m++;
          }
        } while (m != i);
        return j;
      }
      j += paramInt3;
    }
  }
  
  public static final boolean hasData(String paramString)
  {
    if (paramString == null) {}
    while (paramString.length() <= 0) {
      return false;
    }
    return true;
  }
  
  public static final int toInteger(String paramString)
  {
    try
    {
      int i = Integer.parseInt(paramString);
      return i;
    }
    catch (Exception localException)
    {
      Debug.warning(localException);
    }
    return 0;
  }
  
  public static final long toLong(String paramString)
  {
    try
    {
      long l = Long.parseLong(paramString);
      return l;
    }
    catch (Exception localException)
    {
      Debug.warning(localException);
    }
    return 0L;
  }
  
  public static final String trim(String paramString1, String paramString2)
  {
    int i = findFirstNotOf(paramString1, paramString2);
    if (i < 0) {
      return paramString1;
    }
    String str = paramString1.substring(i, paramString1.length());
    int j = findLastNotOf(str, paramString2);
    if (j < 0) {
      return str;
    }
    return str.substring(0, j + 1);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/util/StringUtil.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */