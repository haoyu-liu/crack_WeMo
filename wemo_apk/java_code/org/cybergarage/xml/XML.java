package org.cybergarage.xml;

public class XML
{
  public static final String CHARSET_UTF8 = "utf-8";
  public static final String CONTENT_TYPE = "text/xml; charset=\"utf-8\"";
  
  public static final String escapeXMLChars(String paramString)
  {
    return escapeXMLChars(paramString, true);
  }
  
  private static final String escapeXMLChars(String paramString, boolean paramBoolean)
  {
    if (paramString == null) {
      paramString = null;
    }
    StringBuffer localStringBuffer;
    int i;
    char[] arrayOfChar;
    int j;
    do
    {
      return paramString;
      localStringBuffer = new StringBuffer();
      i = paramString.length();
      arrayOfChar = new char[i];
      paramString.getChars(0, i, arrayOfChar, 0);
      j = 0;
      String str = null;
      int k = 0;
      if (k < i)
      {
        switch (arrayOfChar[k])
        {
        }
        for (;;)
        {
          if (str != null)
          {
            localStringBuffer.append(arrayOfChar, j, k - j);
            localStringBuffer.append(str);
            j = k + 1;
            str = null;
          }
          k++;
          break;
          str = "&amp;";
          continue;
          str = "&lt;";
          continue;
          str = "&gt;";
          continue;
          if (paramBoolean) {
            str = "&apos;";
          } else if (paramBoolean) {
            str = "&quot;";
          }
        }
      }
    } while (j == 0);
    localStringBuffer.append(arrayOfChar, j, i - j);
    return localStringBuffer.toString();
  }
  
  public static final String unescapeXMLChars(String paramString)
  {
    if (paramString == null) {
      return null;
    }
    return paramString.replace("&amp;", "&").replace("&lt;", "<").replace("&gt;", ">").replace("&apos;", "'").replace("&quot;", "\"");
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/xml/XML.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */