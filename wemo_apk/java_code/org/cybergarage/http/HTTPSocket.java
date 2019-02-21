package org.cybergarage.http;

import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.Socket;
import java.util.Calendar;

public class HTTPSocket
{
  private InputStream sockIn = null;
  private OutputStream sockOut = null;
  private Socket socket = null;
  
  public HTTPSocket(Socket paramSocket)
  {
    setSocket(paramSocket);
    open();
  }
  
  public HTTPSocket(HTTPSocket paramHTTPSocket)
  {
    setSocket(paramHTTPSocket.getSocket());
    setInputStream(paramHTTPSocket.getInputStream());
    setOutputStream(paramHTTPSocket.getOutputStream());
  }
  
  private OutputStream getOutputStream()
  {
    return this.sockOut;
  }
  
  private boolean post(HTTPResponse paramHTTPResponse, InputStream paramInputStream, long paramLong1, long paramLong2, boolean paramBoolean)
  {
    paramHTTPResponse.setDate(Calendar.getInstance());
    OutputStream localOutputStream = getOutputStream();
    for (;;)
    {
      int i;
      long l1;
      long l2;
      int j;
      try
      {
        paramHTTPResponse.setContentLength(paramLong2);
        localOutputStream.write(paramHTTPResponse.getHeader().getBytes());
        localOutputStream.write("\r\n".getBytes());
        if (paramBoolean == true)
        {
          localOutputStream.flush();
          return true;
        }
        boolean bool = paramHTTPResponse.isChunked();
        if (0L < paramLong1) {
          paramInputStream.skip(paramLong1);
        }
        i = HTTP.getChunkSize();
        byte[] arrayOfByte = new byte[i];
        l1 = 0L;
        if (i >= paramLong2) {
          break label264;
        }
        l2 = i;
        j = paramInputStream.read(arrayOfByte, 0, (int)l2);
        if ((j > 0) && (l1 < paramLong2))
        {
          if (bool == true)
          {
            localOutputStream.write(Long.toHexString(j).getBytes());
            localOutputStream.write("\r\n".getBytes());
          }
          localOutputStream.write(arrayOfByte, 0, j);
          if (bool == true)
          {
            localOutputStream.write("\r\n".getBytes());
            break label236;
            Object localObject;
            j = paramInputStream.read(arrayOfByte, 0, (int)localObject);
          }
        }
        else
        {
          if (bool == true)
          {
            localOutputStream.write("0".getBytes());
            localOutputStream.write("\r\n".getBytes());
          }
          localOutputStream.flush();
          return true;
        }
      }
      catch (Exception localException)
      {
        return false;
      }
      label236:
      l1 += j;
      long l3;
      if (i < paramLong2 - l1)
      {
        l3 = i;
        continue;
        label264:
        l2 = paramLong2;
      }
      else
      {
        l3 = paramLong2 - l1;
      }
    }
  }
  
  private boolean post(HTTPResponse paramHTTPResponse, byte[] paramArrayOfByte, long paramLong1, long paramLong2, boolean paramBoolean)
  {
    paramHTTPResponse.setDate(Calendar.getInstance());
    OutputStream localOutputStream = getOutputStream();
    try
    {
      paramHTTPResponse.setContentLength(paramLong2);
      localOutputStream.write(paramHTTPResponse.getHeader().getBytes());
      localOutputStream.write("\r\n".getBytes());
      if (paramBoolean == true)
      {
        localOutputStream.flush();
        return true;
      }
      boolean bool = paramHTTPResponse.isChunked();
      if (bool == true)
      {
        localOutputStream.write(Long.toHexString(paramLong2).getBytes());
        localOutputStream.write("\r\n".getBytes());
      }
      localOutputStream.write(paramArrayOfByte, (int)paramLong1, (int)paramLong2);
      if (bool == true)
      {
        localOutputStream.write("\r\n".getBytes());
        localOutputStream.write("0".getBytes());
        localOutputStream.write("\r\n".getBytes());
      }
      localOutputStream.flush();
      return true;
    }
    catch (Exception localException) {}
    return false;
  }
  
  private void setInputStream(InputStream paramInputStream)
  {
    this.sockIn = paramInputStream;
  }
  
  private void setOutputStream(OutputStream paramOutputStream)
  {
    this.sockOut = paramOutputStream;
  }
  
  private void setSocket(Socket paramSocket)
  {
    this.socket = paramSocket;
  }
  
  public boolean close()
  {
    try
    {
      if (this.sockIn != null) {
        this.sockIn.close();
      }
      if (this.sockOut != null) {
        this.sockOut.close();
      }
      getSocket().close();
      return true;
    }
    catch (Exception localException) {}
    return false;
  }
  
  public void finalize()
  {
    close();
  }
  
  public InputStream getInputStream()
  {
    return this.sockIn;
  }
  
  public String getLocalAddress()
  {
    return getSocket().getLocalAddress().getHostAddress();
  }
  
  public int getLocalPort()
  {
    return getSocket().getLocalPort();
  }
  
  public Socket getSocket()
  {
    return this.socket;
  }
  
  public boolean open()
  {
    Socket localSocket = getSocket();
    try
    {
      this.sockIn = localSocket.getInputStream();
      this.sockOut = localSocket.getOutputStream();
      return true;
    }
    catch (Exception localException) {}
    return false;
  }
  
  public boolean post(HTTPResponse paramHTTPResponse, long paramLong1, long paramLong2, boolean paramBoolean)
  {
    if (paramHTTPResponse.hasContentInputStream() == true) {
      return post(paramHTTPResponse, paramHTTPResponse.getContentInputStream(), paramLong1, paramLong2, paramBoolean);
    }
    return post(paramHTTPResponse, paramHTTPResponse.getContent(), paramLong1, paramLong2, paramBoolean);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/http/HTTPSocket.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */