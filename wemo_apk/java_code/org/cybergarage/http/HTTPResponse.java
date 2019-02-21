package org.cybergarage.http;

import java.io.InputStream;
import java.io.PrintStream;

public class HTTPResponse
  extends HTTPPacket
{
  private int statusCode = 0;
  
  public HTTPResponse()
  {
    setVersion("1.1");
    setContentType("text/html; charset=\"utf-8\"");
    setServer(HTTPServer.getName());
    setContent("");
  }
  
  public HTTPResponse(InputStream paramInputStream)
  {
    super(paramInputStream);
  }
  
  public HTTPResponse(HTTPResponse paramHTTPResponse)
  {
    set(paramHTTPResponse);
  }
  
  public HTTPResponse(HTTPSocket paramHTTPSocket)
  {
    this(paramHTTPSocket.getInputStream());
  }
  
  public String getHeader()
  {
    StringBuffer localStringBuffer = new StringBuffer();
    localStringBuffer.append(getStatusLineString());
    localStringBuffer.append(getHeaderString());
    return localStringBuffer.toString();
  }
  
  public int getStatusCode()
  {
    if (this.statusCode != 0) {
      return this.statusCode;
    }
    return new HTTPStatus(getFirstLine()).getStatusCode();
  }
  
  public String getStatusLineString()
  {
    return "HTTP/" + getVersion() + " " + getStatusCode() + " " + HTTPStatus.code2String(this.statusCode) + "\r\n";
  }
  
  public boolean isSuccessful()
  {
    return HTTPStatus.isSuccessful(getStatusCode());
  }
  
  public void print()
  {
    System.out.println(toString());
  }
  
  public void setStatusCode(int paramInt)
  {
    this.statusCode = paramInt;
  }
  
  public String toString()
  {
    StringBuffer localStringBuffer = new StringBuffer();
    localStringBuffer.append(getStatusLineString());
    localStringBuffer.append(getHeaderString());
    localStringBuffer.append("\r\n");
    localStringBuffer.append(getContentString());
    return localStringBuffer.toString();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/http/HTTPResponse.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */