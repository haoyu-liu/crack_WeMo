package org.apache.http.message;

import org.apache.http.Header;
import org.apache.http.ProtocolVersion;
import org.apache.http.RequestLine;
import org.apache.http.StatusLine;
import org.apache.http.util.CharArrayBuffer;

@Deprecated
public class BasicLineFormatter
  implements LineFormatter
{
  public static final BasicLineFormatter DEFAULT = null;
  
  public BasicLineFormatter()
  {
    throw new RuntimeException("Stub!");
  }
  
  public static final String formatHeader(Header paramHeader, LineFormatter paramLineFormatter)
  {
    throw new RuntimeException("Stub!");
  }
  
  public static final String formatProtocolVersion(ProtocolVersion paramProtocolVersion, LineFormatter paramLineFormatter)
  {
    throw new RuntimeException("Stub!");
  }
  
  public static final String formatRequestLine(RequestLine paramRequestLine, LineFormatter paramLineFormatter)
  {
    throw new RuntimeException("Stub!");
  }
  
  public static final String formatStatusLine(StatusLine paramStatusLine, LineFormatter paramLineFormatter)
  {
    throw new RuntimeException("Stub!");
  }
  
  public CharArrayBuffer appendProtocolVersion(CharArrayBuffer paramCharArrayBuffer, ProtocolVersion paramProtocolVersion)
  {
    throw new RuntimeException("Stub!");
  }
  
  protected void doFormatHeader(CharArrayBuffer paramCharArrayBuffer, Header paramHeader)
  {
    throw new RuntimeException("Stub!");
  }
  
  protected void doFormatRequestLine(CharArrayBuffer paramCharArrayBuffer, RequestLine paramRequestLine)
  {
    throw new RuntimeException("Stub!");
  }
  
  protected void doFormatStatusLine(CharArrayBuffer paramCharArrayBuffer, StatusLine paramStatusLine)
  {
    throw new RuntimeException("Stub!");
  }
  
  protected int estimateProtocolVersionLen(ProtocolVersion paramProtocolVersion)
  {
    throw new RuntimeException("Stub!");
  }
  
  public CharArrayBuffer formatHeader(CharArrayBuffer paramCharArrayBuffer, Header paramHeader)
  {
    throw new RuntimeException("Stub!");
  }
  
  public CharArrayBuffer formatRequestLine(CharArrayBuffer paramCharArrayBuffer, RequestLine paramRequestLine)
  {
    throw new RuntimeException("Stub!");
  }
  
  public CharArrayBuffer formatStatusLine(CharArrayBuffer paramCharArrayBuffer, StatusLine paramStatusLine)
  {
    throw new RuntimeException("Stub!");
  }
  
  protected CharArrayBuffer initBuffer(CharArrayBuffer paramCharArrayBuffer)
  {
    throw new RuntimeException("Stub!");
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/http/message/BasicLineFormatter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */