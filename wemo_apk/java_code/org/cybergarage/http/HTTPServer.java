package org.cybergarage.http;

import android.util.Log;
import java.io.IOException;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import org.cybergarage.util.Debug;
import org.cybergarage.util.ListenerList;

public class HTTPServer
  implements Runnable
{
  public static final int DEFAULT_PORT = 80;
  public static final int DEFAULT_TIMEOUT = 6000;
  public static final String NAME = "CyberHTTP";
  public static final String VERSION = "1.0";
  private InetAddress bindAddr = null;
  private int bindPort = 0;
  private ListenerList httpRequestListenerList = new ListenerList();
  private Thread httpServerThread = null;
  private ServerSocket serverSock = null;
  protected int timeout = 6000;
  
  public static String getName()
  {
    String str1 = System.getProperty("os.name");
    String str2 = System.getProperty("os.version");
    return str1 + "/" + str2 + " " + "CyberHTTP" + "/" + "1.0";
  }
  
  public Socket accept()
  {
    if (this.serverSock == null) {
      return null;
    }
    try
    {
      Socket localSocket = this.serverSock.accept();
      localSocket.setSoTimeout(getTimeout());
      return localSocket;
    }
    catch (Exception localException) {}
    return null;
  }
  
  public void addRequestListener(HTTPRequestListener paramHTTPRequestListener)
  {
    this.httpRequestListenerList.add(paramHTTPRequestListener);
  }
  
  public boolean close()
  {
    if (this.serverSock == null) {
      return true;
    }
    try
    {
      this.serverSock.close();
      this.serverSock = null;
      this.bindAddr = null;
      this.bindPort = 0;
      return true;
    }
    catch (Exception localException)
    {
      Debug.warning(localException);
    }
    return false;
  }
  
  public String getBindAddress()
  {
    if (this.bindAddr == null) {
      return "";
    }
    return this.bindAddr.toString();
  }
  
  public int getBindPort()
  {
    return this.bindPort;
  }
  
  public ServerSocket getServerSock()
  {
    return this.serverSock;
  }
  
  public int getTimeout()
  {
    try
    {
      int i = this.timeout;
      return i;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public boolean isOpened()
  {
    return this.serverSock != null;
  }
  
  public boolean open(String paramString, int paramInt)
  {
    if (this.serverSock != null) {
      return true;
    }
    try
    {
      this.bindAddr = InetAddress.getByName(paramString);
      this.bindPort = paramInt;
      this.serverSock = new ServerSocket(this.bindPort, 0, this.bindAddr);
      return true;
    }
    catch (IOException localIOException) {}
    return false;
  }
  
  public boolean open(InetAddress paramInetAddress, int paramInt)
  {
    if (this.serverSock != null) {
      return true;
    }
    try
    {
      this.serverSock = new ServerSocket(this.bindPort, 0, this.bindAddr);
      return true;
    }
    catch (IOException localIOException) {}
    return false;
  }
  
  public void performRequestListener(HTTPRequest paramHTTPRequest)
  {
    int i = this.httpRequestListenerList.size();
    for (int j = 0; j < i; j++) {
      ((HTTPRequestListener)this.httpRequestListenerList.get(j)).httpRequestRecieved(paramHTTPRequest);
    }
  }
  
  public void removeRequestListener(HTTPRequestListener paramHTTPRequestListener)
  {
    this.httpRequestListenerList.remove(paramHTTPRequestListener);
  }
  
  public void run()
  {
    if (!isOpened()) {
      return;
    }
    Thread localThread = Thread.currentThread();
    while (this.httpServerThread == localThread)
    {
      Thread.yield();
      try
      {
        Debug.message("accept ...");
        Socket localSocket = accept();
        if (localSocket != null) {
          Debug.message("sock = " + localSocket.getRemoteSocketAddress());
        }
        new HTTPServerThread(this, localSocket).start();
        Debug.message("httpServThread ...");
      }
      catch (Exception localException)
      {
        Debug.warning(localException);
      }
    }
  }
  
  public void setTimeout(int paramInt)
  {
    try
    {
      this.timeout = paramInt;
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public boolean start()
  {
    StringBuffer localStringBuffer = new StringBuffer("Cyber.HTTPServer/");
    String str = this.bindAddr.toString();
    localStringBuffer.append(str.substring(1, -1 + str.length()));
    localStringBuffer.append(str);
    localStringBuffer.append(":");
    localStringBuffer.append(this.bindPort);
    this.httpServerThread = new Thread(this, localStringBuffer.toString());
    Log.e("Discovery", "inside start new thread");
    this.httpServerThread.start();
    Log.e("Discovery", "inside start new thread start");
    return true;
  }
  
  public boolean stop()
  {
    this.httpServerThread = null;
    return true;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/http/HTTPServer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */