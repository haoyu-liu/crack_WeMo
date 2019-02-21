package org.cybergarage.http;

import java.net.InetAddress;
import java.util.Vector;
import org.cybergarage.net.HostInterface;

public class HTTPServerList
  extends Vector
{
  private InetAddress[] binds = null;
  private int port = 4004;
  
  public HTTPServerList() {}
  
  public HTTPServerList(InetAddress[] paramArrayOfInetAddress, int paramInt)
  {
    this.binds = paramArrayOfInetAddress;
    this.port = paramInt;
  }
  
  public void addRequestListener(HTTPRequestListener paramHTTPRequestListener)
  {
    int i = size();
    for (int j = 0; j < i; j++) {
      getHTTPServer(j).addRequestListener(paramHTTPRequestListener);
    }
  }
  
  public void close()
  {
    int i = size();
    for (int j = 0; j < i; j++) {
      getHTTPServer(j).close();
    }
  }
  
  public HTTPServer getHTTPServer(int paramInt)
  {
    return (HTTPServer)get(paramInt);
  }
  
  public int open()
  {
    InetAddress[] arrayOfInetAddress = this.binds;
    if (arrayOfInetAddress != null)
    {
      arrayOfString = new String[arrayOfInetAddress.length];
      for (int n = 0; n < arrayOfInetAddress.length; n++) {
        arrayOfString[n] = arrayOfInetAddress[n].getHostAddress();
      }
    }
    int i = HostInterface.getNHostAddresses();
    String[] arrayOfString = new String[i];
    for (int j = 0; j < i; j++) {
      arrayOfString[j] = HostInterface.getHostAddress(j);
    }
    int k = 0;
    int m = 0;
    if (m < arrayOfString.length)
    {
      HTTPServer localHTTPServer = new HTTPServer();
      if ((arrayOfString[m] == null) || (!localHTTPServer.open(arrayOfString[m], this.port)))
      {
        close();
        clear();
      }
      for (;;)
      {
        m++;
        break;
        add(localHTTPServer);
        k++;
      }
    }
    return k;
  }
  
  public boolean open(int paramInt)
  {
    this.port = paramInt;
    return open() != 0;
  }
  
  public void start()
  {
    int i = size();
    for (int j = 0; j < i; j++) {
      getHTTPServer(j).start();
    }
  }
  
  public void stop()
  {
    int i = size();
    for (int j = 0; j < i; j++) {
      getHTTPServer(j).stop();
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/http/HTTPServerList.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */