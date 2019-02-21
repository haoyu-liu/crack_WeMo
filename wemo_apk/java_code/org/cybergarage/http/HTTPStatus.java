package org.cybergarage.http;

import java.util.StringTokenizer;
import org.cybergarage.util.Debug;

public class HTTPStatus
{
  public static final int BAD_REQUEST = 400;
  public static final int CONTINUE = 100;
  public static final int INTERNAL_SERVER_ERROR = 500;
  public static final int INVALID_RANGE = 416;
  public static final int NOT_FOUND = 404;
  public static final int OK = 200;
  public static final int PARTIAL_CONTENT = 206;
  public static final int PRECONDITION_FAILED = 412;
  private String reasonPhrase = "";
  private int statusCode = 0;
  private String version = "";
  
  public HTTPStatus()
  {
    setVersion("");
    setStatusCode(0);
    setReasonPhrase("");
  }
  
  public HTTPStatus(String paramString)
  {
    set(paramString);
  }
  
  public HTTPStatus(String paramString1, int paramInt, String paramString2)
  {
    setVersion(paramString1);
    setStatusCode(paramInt);
    setReasonPhrase(paramString2);
  }
  
  public static final String code2String(int paramInt)
  {
    switch (paramInt)
    {
    default: 
      return "";
    case 100: 
      return "Continue";
    case 200: 
      return "OK";
    case 206: 
      return "Partial Content";
    case 400: 
      return "Bad Request";
    case 404: 
      return "Not Found";
    case 412: 
      return "Precondition Failed";
    case 416: 
      return "Invalid Range";
    }
    return "Internal Server Error";
  }
  
  public static final boolean isSuccessful(int paramInt)
  {
    return (200 <= paramInt) && (paramInt < 300);
  }
  
  public String getReasonPhrase()
  {
    return this.reasonPhrase;
  }
  
  public int getStatusCode()
  {
    return this.statusCode;
  }
  
  public String getVersion()
  {
    return this.version;
  }
  
  public boolean isSuccessful()
  {
    return isSuccessful(getStatusCode());
  }
  
  public void set(String paramString)
  {
    if (paramString == null)
    {
      setVersion("1.1");
      setStatusCode(500);
      setReasonPhrase(code2String(500));
    }
    for (;;)
    {
      return;
      try
      {
        localStringTokenizer = new StringTokenizer(paramString, " ");
        if (localStringTokenizer.hasMoreTokens())
        {
          setVersion(localStringTokenizer.nextToken().trim());
          if (localStringTokenizer.hasMoreTokens()) {
            str1 = localStringTokenizer.nextToken();
          }
        }
      }
      catch (Exception localException1)
      {
        StringTokenizer localStringTokenizer;
        String str1;
        int j;
        label81:
        String str2;
        Debug.warning(localException1);
        return;
      }
    }
    try
    {
      j = Integer.parseInt(str1);
      i = j;
    }
    catch (Exception localException2)
    {
      i = 0;
      break label81;
    }
    setStatusCode(i);
    for (str2 = ""; localStringTokenizer.hasMoreTokens() == true; str2 = str2 + localStringTokenizer.nextToken()) {
      if (str2.length() >= 0) {
        str2 = str2 + " ";
      }
    }
    setReasonPhrase(str2.trim());
  }
  
  public void setReasonPhrase(String paramString)
  {
    this.reasonPhrase = paramString;
  }
  
  public void setStatusCode(int paramInt)
  {
    this.statusCode = paramInt;
  }
  
  public void setVersion(String paramString)
  {
    this.version = paramString;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/http/HTTPStatus.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */