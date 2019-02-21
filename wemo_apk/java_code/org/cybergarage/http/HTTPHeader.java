package org.cybergarage.http;

import java.io.IOException;
import java.io.LineNumberReader;
import java.io.StringReader;
import org.cybergarage.util.Debug;

public class HTTPHeader
{
  private static int MAX_LENGTH = 1024;
  private String name;
  private String value;
  
  public HTTPHeader(String paramString)
  {
    setName("");
    setValue("");
    if (paramString == null) {}
    int i;
    do
    {
      return;
      i = paramString.indexOf(':');
    } while (i < 0);
    String str1 = new String(paramString.getBytes(), 0, i);
    String str2 = new String(paramString.getBytes(), i + 1, -1 + (paramString.length() - i));
    setName(str1.trim());
    setValue(str2.trim());
  }
  
  public HTTPHeader(String paramString1, String paramString2)
  {
    setName(paramString1);
    setValue(paramString2);
  }
  
  public static final int getIntegerValue(String paramString1, String paramString2)
  {
    try
    {
      int i = Integer.parseInt(getValue(paramString1, paramString2));
      return i;
    }
    catch (Exception localException) {}
    return 0;
  }
  
  public static final int getIntegerValue(byte[] paramArrayOfByte, String paramString)
  {
    try
    {
      int i = Integer.parseInt(getValue(paramArrayOfByte, paramString));
      return i;
    }
    catch (Exception localException) {}
    return 0;
  }
  
  public static final String getValue(LineNumberReader paramLineNumberReader, String paramString)
  {
    String str1 = paramString.toUpperCase();
    try
    {
      String str2 = paramLineNumberReader.readLine();
      while ((str2 != null) && (str2.length() > 0))
      {
        HTTPHeader localHTTPHeader = new HTTPHeader(str2);
        if (!localHTTPHeader.hasName())
        {
          str2 = paramLineNumberReader.readLine();
        }
        else if (!localHTTPHeader.getName().toUpperCase().equals(str1))
        {
          str2 = paramLineNumberReader.readLine();
        }
        else
        {
          String str3 = localHTTPHeader.getValue();
          return str3;
        }
      }
    }
    catch (IOException localIOException)
    {
      Debug.warning(localIOException);
      return "";
    }
    return "";
  }
  
  public static final String getValue(String paramString1, String paramString2)
  {
    if (paramString1 != null) {}
    try
    {
      if (paramString1.length() > 0) {
        return getValue(new LineNumberReader(new StringReader(paramString1), Math.min(paramString1.length(), MAX_LENGTH)), paramString2);
      }
      return "";
    }
    catch (Exception localException) {}
    return "";
  }
  
  public static final String getValue(byte[] paramArrayOfByte, String paramString)
  {
    return getValue(new String(paramArrayOfByte), paramString);
  }
  
  public String getName()
  {
    return this.name;
  }
  
  public String getValue()
  {
    return this.value;
  }
  
  public boolean hasName()
  {
    return (this.name != null) && (this.name.length() > 0);
  }
  
  public void setName(String paramString)
  {
    this.name = paramString;
  }
  
  public void setValue(String paramString)
  {
    this.value = paramString;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/http/HTTPHeader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */