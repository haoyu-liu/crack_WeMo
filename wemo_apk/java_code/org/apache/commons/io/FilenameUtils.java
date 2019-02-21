package org.apache.commons.io;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.Stack;

public class FilenameUtils
{
  public static final char EXTENSION_SEPARATOR = '.';
  public static final String EXTENSION_SEPARATOR_STR = Character.toString('.');
  private static final char OTHER_SEPARATOR = '\\';
  private static final char SYSTEM_SEPARATOR = File.separatorChar;
  private static final char UNIX_SEPARATOR = '/';
  private static final char WINDOWS_SEPARATOR = '\\';
  
  static
  {
    if (isSystemWindows())
    {
      OTHER_SEPARATOR = '/';
      return;
    }
  }
  
  public static String concat(String paramString1, String paramString2)
  {
    int i = getPrefixLength(paramString2);
    if (i < 0) {}
    do
    {
      return null;
      if (i > 0) {
        return normalize(paramString2);
      }
    } while (paramString1 == null);
    int j = paramString1.length();
    if (j == 0) {
      return normalize(paramString2);
    }
    if (isSeparator(paramString1.charAt(j - 1))) {
      return normalize(paramString1 + paramString2);
    }
    return normalize(paramString1 + '/' + paramString2);
  }
  
  public static boolean directoryContains(String paramString1, String paramString2)
    throws IOException
  {
    if (paramString1 == null) {
      throw new IllegalArgumentException("Directory must not be null");
    }
    if (paramString2 == null) {}
    while (IOCase.SYSTEM.checkEquals(paramString1, paramString2)) {
      return false;
    }
    return IOCase.SYSTEM.checkStartsWith(paramString2, paramString1);
  }
  
  private static String doGetFullPath(String paramString, boolean paramBoolean)
  {
    if (paramString == null) {
      paramString = null;
    }
    int i;
    do
    {
      return paramString;
      i = getPrefixLength(paramString);
      if (i < 0) {
        return null;
      }
      if (i < paramString.length()) {
        break;
      }
    } while (!paramBoolean);
    return getPrefix(paramString);
    int j = indexOfLastSeparator(paramString);
    if (j < 0) {
      return paramString.substring(0, i);
    }
    if (paramBoolean) {}
    for (int k = 1;; k = 0)
    {
      int m = j + k;
      if (m == 0) {
        m++;
      }
      return paramString.substring(0, m);
    }
  }
  
  private static String doGetPath(String paramString, int paramInt)
  {
    if (paramString == null) {}
    int i;
    do
    {
      return null;
      i = getPrefixLength(paramString);
    } while (i < 0);
    int j = indexOfLastSeparator(paramString);
    int k = j + paramInt;
    if ((i >= paramString.length()) || (j < 0) || (i >= k)) {
      return "";
    }
    return paramString.substring(i, k);
  }
  
  private static String doNormalize(String paramString, char paramChar, boolean paramBoolean)
  {
    if (paramString == null) {
      paramString = null;
    }
    int i;
    do
    {
      return paramString;
      i = paramString.length();
    } while (i == 0);
    int j = getPrefixLength(paramString);
    if (j < 0) {
      return null;
    }
    char[] arrayOfChar = new char[i + 2];
    paramString.getChars(0, paramString.length(), arrayOfChar, 0);
    if (paramChar == SYSTEM_SEPARATOR) {}
    for (int k = OTHER_SEPARATOR;; k = SYSTEM_SEPARATOR) {
      for (int m = 0; m < arrayOfChar.length; m++) {
        if (arrayOfChar[m] == k) {
          arrayOfChar[m] = paramChar;
        }
      }
    }
    int n = 1;
    if (arrayOfChar[(i - 1)] != paramChar)
    {
      int i5 = i + 1;
      arrayOfChar[i] = paramChar;
      n = 0;
      i = i5;
    }
    for (int i1 = j + 1; i1 < i; i1++) {
      if ((arrayOfChar[i1] == paramChar) && (arrayOfChar[(i1 - 1)] == paramChar))
      {
        System.arraycopy(arrayOfChar, i1, arrayOfChar, i1 - 1, i - i1);
        i--;
        i1--;
      }
    }
    for (int i2 = j + 1; i2 < i; i2++) {
      if ((arrayOfChar[i2] == paramChar) && (arrayOfChar[(i2 - 1)] == '.') && ((i2 == j + 1) || (arrayOfChar[(i2 - 2)] == paramChar)))
      {
        if (i2 == i - 1) {
          n = 1;
        }
        System.arraycopy(arrayOfChar, i2 + 1, arrayOfChar, i2 - 1, i - i2);
        i -= 2;
        i2--;
      }
    }
    int i3 = j + 2;
    if (i3 < i)
    {
      int i4;
      if ((arrayOfChar[i3] == paramChar) && (arrayOfChar[(i3 - 1)] == '.') && (arrayOfChar[(i3 - 2)] == '.') && ((i3 == j + 2) || (arrayOfChar[(i3 - 3)] == paramChar)))
      {
        if (i3 == j + 2) {
          return null;
        }
        if (i3 == i - 1) {
          n = 1;
        }
        i4 = i3 - 4;
        label380:
        if (i4 < j) {
          break label441;
        }
        if (arrayOfChar[i4] != paramChar) {
          break label435;
        }
        System.arraycopy(arrayOfChar, i3 + 1, arrayOfChar, i4 + 1, i - i3);
        i -= i3 - i4;
      }
      for (i3 = i4 + 1;; i3 = j + 1)
      {
        i3++;
        break;
        label435:
        i4--;
        break label380;
        label441:
        System.arraycopy(arrayOfChar, i3 + 1, arrayOfChar, j, i - i3);
        i -= i3 + 1 - j;
      }
    }
    if (i <= 0) {
      return "";
    }
    if (i <= j) {
      return new String(arrayOfChar, 0, i);
    }
    if ((n != 0) && (paramBoolean)) {
      return new String(arrayOfChar, 0, i);
    }
    return new String(arrayOfChar, 0, i - 1);
  }
  
  public static boolean equals(String paramString1, String paramString2)
  {
    return equals(paramString1, paramString2, false, IOCase.SENSITIVE);
  }
  
  public static boolean equals(String paramString1, String paramString2, boolean paramBoolean, IOCase paramIOCase)
  {
    if ((paramString1 == null) || (paramString2 == null)) {
      return (paramString1 == null) && (paramString2 == null);
    }
    if (paramBoolean)
    {
      paramString1 = normalize(paramString1);
      paramString2 = normalize(paramString2);
      if ((paramString1 == null) || (paramString2 == null)) {
        throw new NullPointerException("Error normalizing one or both of the file names");
      }
    }
    if (paramIOCase == null) {
      paramIOCase = IOCase.SENSITIVE;
    }
    return paramIOCase.checkEquals(paramString1, paramString2);
  }
  
  public static boolean equalsNormalized(String paramString1, String paramString2)
  {
    return equals(paramString1, paramString2, true, IOCase.SENSITIVE);
  }
  
  public static boolean equalsNormalizedOnSystem(String paramString1, String paramString2)
  {
    return equals(paramString1, paramString2, true, IOCase.SYSTEM);
  }
  
  public static boolean equalsOnSystem(String paramString1, String paramString2)
  {
    return equals(paramString1, paramString2, false, IOCase.SYSTEM);
  }
  
  public static String getBaseName(String paramString)
  {
    return removeExtension(getName(paramString));
  }
  
  public static String getExtension(String paramString)
  {
    if (paramString == null) {
      return null;
    }
    int i = indexOfExtension(paramString);
    if (i == -1) {
      return "";
    }
    return paramString.substring(i + 1);
  }
  
  public static String getFullPath(String paramString)
  {
    return doGetFullPath(paramString, true);
  }
  
  public static String getFullPathNoEndSeparator(String paramString)
  {
    return doGetFullPath(paramString, false);
  }
  
  public static String getName(String paramString)
  {
    if (paramString == null) {
      return null;
    }
    return paramString.substring(1 + indexOfLastSeparator(paramString));
  }
  
  public static String getPath(String paramString)
  {
    return doGetPath(paramString, 1);
  }
  
  public static String getPathNoEndSeparator(String paramString)
  {
    return doGetPath(paramString, 0);
  }
  
  public static String getPrefix(String paramString)
  {
    if (paramString == null) {}
    int i;
    do
    {
      return null;
      i = getPrefixLength(paramString);
    } while (i < 0);
    if (i > paramString.length()) {
      return paramString + '/';
    }
    return paramString.substring(0, i);
  }
  
  public static int getPrefixLength(String paramString)
  {
    int i = 1;
    if (paramString == null) {
      i = -1;
    }
    char c1;
    do
    {
      int j;
      do
      {
        return i;
        j = paramString.length();
        if (j == 0) {
          return 0;
        }
        c1 = paramString.charAt(0);
        if (c1 == ':') {
          return -1;
        }
        if (j != i) {
          break;
        }
        if (c1 == '~') {
          return 2;
        }
      } while (isSeparator(c1));
      return 0;
      if (c1 == '~')
      {
        int i1 = paramString.indexOf('/', i);
        int i2 = paramString.indexOf('\\', i);
        if ((i1 == -1) && (i2 == -1)) {
          return j + 1;
        }
        if (i1 == -1) {
          i1 = i2;
        }
        if (i2 == -1) {
          i2 = i1;
        }
        return 1 + Math.min(i1, i2);
      }
      char c2 = paramString.charAt(i);
      if (c2 == ':')
      {
        int n = Character.toUpperCase(c1);
        if ((n >= 65) && (n <= 90))
        {
          if ((j == 2) || (!isSeparator(paramString.charAt(2)))) {
            return 2;
          }
          return 3;
        }
        return -1;
      }
      if ((isSeparator(c1)) && (isSeparator(c2)))
      {
        int k = paramString.indexOf('/', 2);
        int m = paramString.indexOf('\\', 2);
        if (((k == -1) && (m == -1)) || (k == 2) || (m == 2)) {
          return -1;
        }
        if (k == -1) {
          k = m;
        }
        if (m == -1) {
          m = k;
        }
        return 1 + Math.min(k, m);
      }
    } while (isSeparator(c1));
    return 0;
  }
  
  public static int indexOfExtension(String paramString)
  {
    if (paramString == null) {
      return -1;
    }
    int i = paramString.lastIndexOf('.');
    if (indexOfLastSeparator(paramString) > i) {
      i = -1;
    }
    return i;
  }
  
  public static int indexOfLastSeparator(String paramString)
  {
    if (paramString == null) {
      return -1;
    }
    return Math.max(paramString.lastIndexOf('/'), paramString.lastIndexOf('\\'));
  }
  
  public static boolean isExtension(String paramString1, String paramString2)
  {
    if (paramString1 == null) {}
    do
    {
      return false;
      if ((paramString2 != null) && (paramString2.length() != 0)) {
        break;
      }
    } while (indexOfExtension(paramString1) != -1);
    return true;
    return getExtension(paramString1).equals(paramString2);
  }
  
  public static boolean isExtension(String paramString, Collection<String> paramCollection)
  {
    boolean bool = true;
    if (paramString == null) {}
    String str;
    Iterator localIterator;
    do
    {
      while (!localIterator.hasNext())
      {
        return false;
        if ((paramCollection == null) || (paramCollection.isEmpty()))
        {
          if (indexOfExtension(paramString) == -1) {}
          for (;;)
          {
            return bool;
            bool = false;
          }
        }
        str = getExtension(paramString);
        localIterator = paramCollection.iterator();
      }
    } while (!str.equals((String)localIterator.next()));
    return bool;
  }
  
  public static boolean isExtension(String paramString, String[] paramArrayOfString)
  {
    boolean bool = true;
    if (paramString == null) {}
    for (;;)
    {
      return false;
      if ((paramArrayOfString == null) || (paramArrayOfString.length == 0))
      {
        if (indexOfExtension(paramString) == -1) {}
        for (;;)
        {
          return bool;
          bool = false;
        }
      }
      String str = getExtension(paramString);
      int i = paramArrayOfString.length;
      for (int j = 0; j < i; j++) {
        if (str.equals(paramArrayOfString[j])) {
          return bool;
        }
      }
    }
  }
  
  private static boolean isSeparator(char paramChar)
  {
    return (paramChar == '/') || (paramChar == '\\');
  }
  
  static boolean isSystemWindows()
  {
    return SYSTEM_SEPARATOR == '\\';
  }
  
  public static String normalize(String paramString)
  {
    return doNormalize(paramString, SYSTEM_SEPARATOR, true);
  }
  
  public static String normalize(String paramString, boolean paramBoolean)
  {
    if (paramBoolean) {}
    for (char c = '/';; c = '\\') {
      return doNormalize(paramString, c, true);
    }
  }
  
  public static String normalizeNoEndSeparator(String paramString)
  {
    return doNormalize(paramString, SYSTEM_SEPARATOR, false);
  }
  
  public static String normalizeNoEndSeparator(String paramString, boolean paramBoolean)
  {
    if (paramBoolean) {}
    for (char c = '/';; c = '\\') {
      return doNormalize(paramString, c, false);
    }
  }
  
  public static String removeExtension(String paramString)
  {
    if (paramString == null) {
      paramString = null;
    }
    int i;
    do
    {
      return paramString;
      i = indexOfExtension(paramString);
    } while (i == -1);
    return paramString.substring(0, i);
  }
  
  public static String separatorsToSystem(String paramString)
  {
    if (paramString == null) {
      return null;
    }
    if (isSystemWindows()) {
      return separatorsToWindows(paramString);
    }
    return separatorsToUnix(paramString);
  }
  
  public static String separatorsToUnix(String paramString)
  {
    if ((paramString == null) || (paramString.indexOf('\\') == -1)) {
      return paramString;
    }
    return paramString.replace('\\', '/');
  }
  
  public static String separatorsToWindows(String paramString)
  {
    if ((paramString == null) || (paramString.indexOf('/') == -1)) {
      return paramString;
    }
    return paramString.replace('/', '\\');
  }
  
  static String[] splitOnTokens(String paramString)
  {
    if ((paramString.indexOf('?') == -1) && (paramString.indexOf('*') == -1)) {
      return new String[] { paramString };
    }
    char[] arrayOfChar = paramString.toCharArray();
    ArrayList localArrayList = new ArrayList();
    StringBuilder localStringBuilder = new StringBuilder();
    int i = 0;
    if (i < arrayOfChar.length)
    {
      if ((arrayOfChar[i] == '?') || (arrayOfChar[i] == '*'))
      {
        if (localStringBuilder.length() != 0)
        {
          localArrayList.add(localStringBuilder.toString());
          localStringBuilder.setLength(0);
        }
        if (arrayOfChar[i] == '?') {
          localArrayList.add("?");
        }
      }
      for (;;)
      {
        i++;
        break;
        if ((localArrayList.isEmpty()) || ((i > 0) && (!((String)localArrayList.get(-1 + localArrayList.size())).equals("*"))))
        {
          localArrayList.add("*");
          continue;
          localStringBuilder.append(arrayOfChar[i]);
        }
      }
    }
    if (localStringBuilder.length() != 0) {
      localArrayList.add(localStringBuilder.toString());
    }
    return (String[])localArrayList.toArray(new String[localArrayList.size()]);
  }
  
  public static boolean wildcardMatch(String paramString1, String paramString2)
  {
    return wildcardMatch(paramString1, paramString2, IOCase.SENSITIVE);
  }
  
  public static boolean wildcardMatch(String paramString1, String paramString2, IOCase paramIOCase)
  {
    if ((paramString1 == null) && (paramString2 == null)) {}
    label141:
    label150:
    label184:
    label280:
    for (;;)
    {
      return true;
      if ((paramString1 == null) || (paramString2 == null)) {
        return false;
      }
      if (paramIOCase == null) {
        paramIOCase = IOCase.SENSITIVE;
      }
      String[] arrayOfString = splitOnTokens(paramString2);
      int i = 0;
      int j = 0;
      int k = 0;
      Stack localStack = new Stack();
      if (localStack.size() > 0)
      {
        int[] arrayOfInt = (int[])localStack.pop();
        k = arrayOfInt[0];
        j = arrayOfInt[1];
        i = 1;
      }
      if (k < arrayOfString.length)
      {
        if (!arrayOfString[k].equals("?")) {
          break label150;
        }
        j++;
        if (j <= paramString1.length()) {
          break label141;
        }
      }
      for (;;)
      {
        if ((k == arrayOfString.length) && (j == paramString1.length())) {
          break label280;
        }
        if (localStack.size() > 0) {
          break;
        }
        return false;
        i = 0;
        for (;;)
        {
          k++;
          break;
          if (!arrayOfString[k].equals("*")) {
            break label184;
          }
          i = 1;
          if (k == -1 + arrayOfString.length) {
            j = paramString1.length();
          }
        }
        if (i != 0)
        {
          j = paramIOCase.checkIndexOf(paramString1, j, arrayOfString[k]);
          if (j == -1) {
            continue;
          }
          m = paramIOCase.checkIndexOf(paramString1, j + 1, arrayOfString[k]);
          if (m >= 0) {
            localStack.push(new int[] { k, m });
          }
        }
        while (paramIOCase.checkRegionMatches(paramString1, j, arrayOfString[k]))
        {
          int m;
          j += arrayOfString[k].length();
          i = 0;
          break;
        }
      }
    }
  }
  
  public static boolean wildcardMatchOnSystem(String paramString1, String paramString2)
  {
    return wildcardMatch(paramString1, paramString2, IOCase.SYSTEM);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/commons/io/FilenameUtils.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */