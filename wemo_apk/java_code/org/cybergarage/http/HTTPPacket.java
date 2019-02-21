package org.cybergarage.http;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InterruptedIOException;
import java.util.Calendar;
import java.util.StringTokenizer;
import java.util.Vector;
import org.cybergarage.net.HostInterface;
import org.cybergarage.util.Debug;
import org.cybergarage.util.StringUtil;

public class HTTPPacket
{
  private byte[] content = new byte[0];
  private InputStream contentInput = null;
  private String firstLine = "";
  private Vector<HTTPHeader> httpHeaderList = new Vector();
  private String version;
  
  public HTTPPacket()
  {
    setVersion("1.1");
    setContentInputStream(null);
  }
  
  public HTTPPacket(InputStream paramInputStream)
  {
    setVersion("1.1");
    set(paramInputStream);
    setContentInputStream(null);
  }
  
  public HTTPPacket(HTTPPacket paramHTTPPacket)
  {
    setVersion("1.1");
    set(paramHTTPPacket);
    setContentInputStream(null);
  }
  
  private String readLine(BufferedInputStream paramBufferedInputStream)
  {
    ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
    byte[] arrayOfByte = new byte[1];
    for (;;)
    {
      try
      {
        i = paramBufferedInputStream.read(arrayOfByte);
        if (i > 0)
        {
          int j = arrayOfByte[0];
          if (j != 10) {
            continue;
          }
        }
      }
      catch (IOException localIOException)
      {
        int i;
        int k;
        Debug.warning(localIOException);
        continue;
      }
      catch (InterruptedIOException localInterruptedIOException)
      {
        continue;
      }
      return localByteArrayOutputStream.toString();
      if (arrayOfByte[0] != 13) {
        localByteArrayOutputStream.write(arrayOfByte[0]);
      }
      k = paramBufferedInputStream.read(arrayOfByte);
      i = k;
    }
  }
  
  private void setFirstLine(String paramString)
  {
    this.firstLine = paramString;
  }
  
  public void addHeader(String paramString1, String paramString2)
  {
    HTTPHeader localHTTPHeader = new HTTPHeader(paramString1, paramString2);
    this.httpHeaderList.add(localHTTPHeader);
  }
  
  public void addHeader(HTTPHeader paramHTTPHeader)
  {
    this.httpHeaderList.add(paramHTTPHeader);
  }
  
  public void clearHeaders()
  {
    this.httpHeaderList.clear();
    this.httpHeaderList = new Vector();
  }
  
  public String getCacheControl()
  {
    return getHeaderValue("Cache-Control");
  }
  
  public String getCharSet()
  {
    String str1 = getContentType();
    String str3;
    if (str1 == null) {
      str3 = "";
    }
    do
    {
      return str3;
      String str2 = str1.toLowerCase();
      int i = str2.indexOf("charset");
      if (i < 0) {
        return "";
      }
      int j = 1 + (i + "charset".length());
      str3 = new String(str2.getBytes(), j, str2.length() - j);
      if (str3.length() < 0) {
        return "";
      }
      if (str3.charAt(0) == '"') {
        str3 = str3.substring(1, -1 + str3.length());
      }
      if (str3.length() < 0) {
        return "";
      }
    } while (str3.charAt(-1 + str3.length()) != '"');
    return str3.substring(0, -1 + str3.length());
  }
  
  public String getConnection()
  {
    return getHeaderValue("Connection");
  }
  
  public byte[] getContent()
  {
    return this.content;
  }
  
  public InputStream getContentInputStream()
  {
    return this.contentInput;
  }
  
  public long getContentLength()
  {
    return getLongHeaderValue("Content-Length");
  }
  
  public long[] getContentRange()
  {
    long[] arrayOfLong = new long[3];
    arrayOfLong[2] = 0L;
    arrayOfLong[1] = 0L;
    arrayOfLong[0] = 0L;
    if (!hasContentRange()) {}
    for (;;)
    {
      return arrayOfLong;
      String str1 = getHeaderValue("Content-Range");
      if (str1.length() <= 0) {
        str1 = getHeaderValue("Range");
      }
      if (str1.length() <= 0) {
        continue;
      }
      StringTokenizer localStringTokenizer = new StringTokenizer(str1, " =");
      if ((!localStringTokenizer.hasMoreTokens()) || (!localStringTokenizer.hasMoreTokens())) {
        continue;
      }
      String str2 = localStringTokenizer.nextToken(" -");
      try
      {
        arrayOfLong[0] = Long.parseLong(str2);
        if (!localStringTokenizer.hasMoreTokens()) {
          continue;
        }
        String str3 = localStringTokenizer.nextToken("-/");
        try
        {
          arrayOfLong[1] = Long.parseLong(str3);
          if (!localStringTokenizer.hasMoreTokens()) {
            continue;
          }
          String str4 = localStringTokenizer.nextToken("/");
          try
          {
            arrayOfLong[2] = Long.parseLong(str4);
            return arrayOfLong;
          }
          catch (NumberFormatException localNumberFormatException3)
          {
            return arrayOfLong;
          }
        }
        catch (NumberFormatException localNumberFormatException2)
        {
          for (;;) {}
        }
      }
      catch (NumberFormatException localNumberFormatException1)
      {
        for (;;) {}
      }
    }
  }
  
  public long getContentRangeFirstPosition()
  {
    return getContentRange()[0];
  }
  
  public long getContentRangeInstanceLength()
  {
    return getContentRange()[2];
  }
  
  public long getContentRangeLastPosition()
  {
    return getContentRange()[1];
  }
  
  public String getContentString()
  {
    String str1 = getCharSet();
    if ((str1 == null) || (str1.length() <= 0)) {
      return new String(this.content);
    }
    try
    {
      String str2 = new String(this.content, str1);
      return str2;
    }
    catch (Exception localException)
    {
      Debug.warning(localException);
    }
    return new String(this.content);
  }
  
  public String getContentType()
  {
    return getHeaderValue("Content-Type");
  }
  
  public String getDate()
  {
    return getHeaderValue("Date");
  }
  
  protected String getFirstLine()
  {
    return this.firstLine;
  }
  
  protected String getFirstLineToken(int paramInt)
  {
    StringTokenizer localStringTokenizer = new StringTokenizer(this.firstLine, " ");
    String str = "";
    for (int i = 0;; i++)
    {
      if (i <= paramInt)
      {
        if (!localStringTokenizer.hasMoreTokens()) {
          str = "";
        }
      }
      else {
        return str;
      }
      str = localStringTokenizer.nextToken();
    }
  }
  
  public HTTPHeader getHeader(int paramInt)
  {
    return (HTTPHeader)this.httpHeaderList.get(paramInt);
  }
  
  public HTTPHeader getHeader(String paramString)
  {
    int i = getNHeaders();
    for (int j = 0; j < i; j++)
    {
      HTTPHeader localHTTPHeader = getHeader(j);
      if (localHTTPHeader.getName().equalsIgnoreCase(paramString) == true) {
        return localHTTPHeader;
      }
    }
    return null;
  }
  
  public String getHeaderString()
  {
    StringBuffer localStringBuffer = new StringBuffer();
    int i = getNHeaders();
    for (int j = 0; j < i; j++)
    {
      HTTPHeader localHTTPHeader = getHeader(j);
      localStringBuffer.append(localHTTPHeader.getName() + ": " + localHTTPHeader.getValue() + "\r\n");
    }
    return localStringBuffer.toString();
  }
  
  public String getHeaderValue(String paramString)
  {
    HTTPHeader localHTTPHeader = getHeader(paramString);
    if (localHTTPHeader == null) {
      return "";
    }
    return localHTTPHeader.getValue();
  }
  
  public String getHost()
  {
    return getHeaderValue("HOST");
  }
  
  public int getIntegerHeaderValue(String paramString)
  {
    HTTPHeader localHTTPHeader = getHeader(paramString);
    if (localHTTPHeader == null) {
      return 0;
    }
    return StringUtil.toInteger(localHTTPHeader.getValue());
  }
  
  public long getLongHeaderValue(String paramString)
  {
    HTTPHeader localHTTPHeader = getHeader(paramString);
    if (localHTTPHeader == null) {
      return 0L;
    }
    return StringUtil.toLong(localHTTPHeader.getValue());
  }
  
  public int getNHeaders()
  {
    return this.httpHeaderList.size();
  }
  
  public String getServer()
  {
    return getHeaderValue("Server");
  }
  
  public String getStringHeaderValue(String paramString)
  {
    return getStringHeaderValue(paramString, "\"", "\"");
  }
  
  public String getStringHeaderValue(String paramString1, String paramString2, String paramString3)
  {
    String str = getHeaderValue(paramString1);
    if (str.startsWith(paramString2) == true) {
      str = str.substring(1, str.length());
    }
    if (str.endsWith(paramString3) == true) {
      str = str.substring(0, -1 + str.length());
    }
    return str;
  }
  
  public String getTransferEncoding()
  {
    return getHeaderValue("Transfer-Encoding");
  }
  
  public String getVersion()
  {
    return this.version;
  }
  
  public boolean hasConnection()
  {
    return hasHeader("Connection");
  }
  
  public boolean hasContent()
  {
    return this.content.length > 0;
  }
  
  public boolean hasContentInputStream()
  {
    return this.contentInput != null;
  }
  
  public boolean hasContentRange()
  {
    return (hasHeader("Content-Range")) || (hasHeader("Range"));
  }
  
  public boolean hasFirstLine()
  {
    return this.firstLine.length() > 0;
  }
  
  public boolean hasHeader(String paramString)
  {
    return getHeader(paramString) != null;
  }
  
  public boolean hasTransferEncoding()
  {
    return hasHeader("Transfer-Encoding");
  }
  
  public void init()
  {
    setFirstLine("");
    clearHeaders();
    setContent(new byte[0], false);
    setContentInputStream(null);
  }
  
  public boolean isChunked()
  {
    if (!hasTransferEncoding()) {}
    String str;
    do
    {
      return false;
      str = getTransferEncoding();
    } while (str == null);
    return str.equalsIgnoreCase("Chunked");
  }
  
  public boolean isCloseConnection()
  {
    if (!hasConnection()) {}
    String str;
    do
    {
      return false;
      str = getConnection();
    } while (str == null);
    return str.equalsIgnoreCase("close");
  }
  
  public boolean isKeepAliveConnection()
  {
    if (!hasConnection()) {}
    String str;
    do
    {
      return false;
      str = getConnection();
    } while (str == null);
    return str.equalsIgnoreCase("Keep-Alive");
  }
  
  public boolean read(HTTPSocket paramHTTPSocket)
  {
    init();
    return set(paramHTTPSocket);
  }
  
  protected void set(HTTPPacket paramHTTPPacket)
  {
    setFirstLine(paramHTTPPacket.getFirstLine());
    clearHeaders();
    int i = paramHTTPPacket.getNHeaders();
    for (int j = 0; j < i; j++) {
      addHeader(paramHTTPPacket.getHeader(j));
    }
    setContent(paramHTTPPacket.getContent());
  }
  
  protected boolean set(InputStream paramInputStream)
  {
    return set(paramInputStream, false);
  }
  
  protected boolean set(InputStream paramInputStream, boolean paramBoolean)
  {
    long l1;
    for (;;)
    {
      ByteArrayOutputStream localByteArrayOutputStream;
      try
      {
        localBufferedInputStream = new BufferedInputStream(paramInputStream);
        String str1 = readLine(localBufferedInputStream);
        if ((str1 == null) || (str1.length() <= 0)) {
          break label527;
        }
        setFirstLine(str1);
        HTTPStatus localHTTPStatus = new HTTPStatus(str1);
        if (localHTTPStatus.getStatusCode() == 100)
        {
          String str5 = readLine(localBufferedInputStream);
          if ((str5 != null) && (str5.length() > 0))
          {
            HTTPHeader localHTTPHeader2 = new HTTPHeader(str5);
            if (localHTTPHeader2.hasName() == true) {
              setHeader(localHTTPHeader2);
            }
            str5 = readLine(localBufferedInputStream);
            continue;
          }
          String str6 = readLine(localBufferedInputStream);
          if ((str6 == null) || (str6.length() <= 0)) {
            break label529;
          }
          setFirstLine(str6);
        }
        String str2 = readLine(localBufferedInputStream);
        if ((str2 != null) && (str2.length() > 0))
        {
          HTTPHeader localHTTPHeader1 = new HTTPHeader(str2);
          if (localHTTPHeader1.hasName() == true) {
            setHeader(localHTTPHeader1);
          }
          str2 = readLine(localBufferedInputStream);
          continue;
        }
        if (paramBoolean == true)
        {
          setContent("", false);
          return true;
        }
        bool = isChunked();
        l1 = 0L;
        if (bool != true) {}
      }
      catch (Exception localException1)
      {
        BufferedInputStream localBufferedInputStream;
        boolean bool;
        String str4;
        long l9;
        label289:
        label299:
        label358:
        label448:
        Debug.warning(localException1);
        return false;
      }
      try
      {
        str4 = readLine(localBufferedInputStream);
        if (str4 == null) {
          continue;
        }
        l9 = Long.parseLong(str4.trim(), 16);
        l1 = l9;
      }
      catch (Exception localException4) {}
    }
    localByteArrayOutputStream = new ByteArrayOutputStream();
    for (;;)
    {
      if (0L < l1)
      {
        int i = HTTP.getChunkSize();
        long l3;
        byte[] arrayOfByte;
        long l4;
        int j;
        if (l1 > i)
        {
          l3 = i;
          arrayOfByte = new byte[(int)l3];
          l4 = 0L;
          if (l4 < l1)
          {
            long l8 = l1 - l4;
            if (i < l8) {
              l8 = i;
            }
            j = (int)l8;
          }
        }
        try
        {
          k = localBufferedInputStream.read(arrayOfByte, 0, j);
          if (k >= 0) {
            break label448;
          }
        }
        catch (Exception localException3)
        {
          for (;;)
          {
            int k;
            Debug.warning(localException3);
          }
        }
        if (bool == true)
        {
          long l5 = 0L;
          long l6 = localBufferedInputStream.skip("\r\n".length() - l5);
          if (l6 < 0L) {}
          for (;;)
          {
            try
            {
              String str3 = readLine(localBufferedInputStream);
              long l7 = Long.parseLong(new String(str3.getBytes(), 0, -2 + str3.length()), 16);
              l1 = l7;
            }
            catch (Exception localException2)
            {
              long l2;
              l1 = 0L;
            }
            l1 = 0L;
            break;
            l2 = getContentLength();
            l1 = l2;
            break;
            l3 = l1;
            break label289;
            localByteArrayOutputStream.write(arrayOfByte, 0, k);
            l4 += k;
            break label299;
            l5 += l6;
            if (l5 < "\r\n".length()) {
              break label358;
            }
          }
        }
      }
      else
      {
        setContent(localByteArrayOutputStream.toByteArray(), false);
        return true;
        label527:
        return false;
        label529:
        return true;
        continue;
      }
      l1 = 0L;
    }
  }
  
  protected boolean set(HTTPSocket paramHTTPSocket)
  {
    return set(paramHTTPSocket.getInputStream());
  }
  
  public void setCacheControl(int paramInt)
  {
    setCacheControl("max-age", paramInt);
  }
  
  public void setCacheControl(String paramString)
  {
    setHeader("Cache-Control", paramString);
  }
  
  public void setCacheControl(String paramString, int paramInt)
  {
    setHeader("Cache-Control", paramString + "=" + Integer.toString(paramInt));
  }
  
  public void setConnection(String paramString)
  {
    setHeader("Connection", paramString);
  }
  
  public void setContent(String paramString)
  {
    setContent(paramString, true);
  }
  
  public void setContent(String paramString, boolean paramBoolean)
  {
    setContent(paramString.getBytes(), paramBoolean);
  }
  
  public void setContent(byte[] paramArrayOfByte)
  {
    setContent(paramArrayOfByte, true);
  }
  
  public void setContent(byte[] paramArrayOfByte, boolean paramBoolean)
  {
    this.content = paramArrayOfByte;
    if (paramBoolean == true) {
      setContentLength(paramArrayOfByte.length);
    }
  }
  
  public void setContentInputStream(InputStream paramInputStream)
  {
    this.contentInput = paramInputStream;
  }
  
  public void setContentLength(long paramLong)
  {
    setLongHeader("Content-Length", paramLong);
  }
  
  public void setContentRange(long paramLong1, long paramLong2, long paramLong3)
  {
    String str1 = "" + "bytes ";
    String str2 = str1 + Long.toString(paramLong1) + "-";
    String str3 = str2 + Long.toString(paramLong2) + "/";
    StringBuilder localStringBuilder = new StringBuilder().append(str3);
    if (0L < paramLong3) {}
    for (String str4 = Long.toString(paramLong3);; str4 = "*")
    {
      setHeader("Content-Range", str4);
      return;
    }
  }
  
  public void setContentType(String paramString)
  {
    setHeader("Content-Type", paramString);
  }
  
  public void setDate(Calendar paramCalendar)
  {
    setHeader("Date", new Date(paramCalendar).getDateString());
  }
  
  public void setHeader(String paramString, int paramInt)
  {
    setHeader(paramString, Integer.toString(paramInt));
  }
  
  public void setHeader(String paramString, long paramLong)
  {
    setHeader(paramString, Long.toString(paramLong));
  }
  
  public void setHeader(String paramString1, String paramString2)
  {
    HTTPHeader localHTTPHeader = getHeader(paramString1);
    if (localHTTPHeader != null)
    {
      localHTTPHeader.setValue(paramString2);
      return;
    }
    addHeader(paramString1, paramString2);
  }
  
  public void setHeader(HTTPHeader paramHTTPHeader)
  {
    setHeader(paramHTTPHeader.getName(), paramHTTPHeader.getValue());
  }
  
  public void setHost(String paramString)
  {
    String str = paramString;
    if (HostInterface.isIPv6Address(paramString) == true) {
      str = "[" + paramString + "]";
    }
    setHeader("HOST", str);
  }
  
  public void setHost(String paramString, int paramInt)
  {
    String str = paramString;
    if (HostInterface.isIPv6Address(paramString) == true) {
      str = "[" + paramString + "]";
    }
    setHeader("HOST", str + ":" + Integer.toString(paramInt));
  }
  
  public void setIntegerHeader(String paramString, int paramInt)
  {
    setHeader(paramString, Integer.toString(paramInt));
  }
  
  public void setLongHeader(String paramString, long paramLong)
  {
    setHeader(paramString, Long.toString(paramLong));
  }
  
  public void setServer(String paramString)
  {
    setHeader("Server", paramString);
  }
  
  public void setStringHeader(String paramString1, String paramString2)
  {
    setStringHeader(paramString1, paramString2, "\"", "\"");
  }
  
  public void setStringHeader(String paramString1, String paramString2, String paramString3, String paramString4)
  {
    String str = paramString2;
    if (!str.startsWith(paramString3)) {
      str = paramString3 + str;
    }
    if (!str.endsWith(paramString4)) {
      str = str + paramString4;
    }
    setHeader(paramString1, str);
  }
  
  public void setTransferEncoding(String paramString)
  {
    setHeader("Transfer-Encoding", paramString);
  }
  
  public void setVersion(String paramString)
  {
    this.version = paramString;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/http/HTTPPacket.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */