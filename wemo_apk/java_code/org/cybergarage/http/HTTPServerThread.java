package org.cybergarage.http;

import java.net.Socket;

public class HTTPServerThread
  extends Thread
{
  private HTTPServer httpServer;
  private Socket sock;
  
  public HTTPServerThread(HTTPServer paramHTTPServer, Socket paramSocket)
  {
    super("Cyber.HTTPServerThread");
    this.httpServer = paramHTTPServer;
    this.sock = paramSocket;
  }
  
  public void run()
  {
    HTTPSocket localHTTPSocket = new HTTPSocket(this.sock);
    if (!localHTTPSocket.open()) {
      return;
    }
    HTTPRequest localHTTPRequest = new HTTPRequest();
    localHTTPRequest.setSocket(localHTTPSocket);
    do
    {
      if (localHTTPRequest.read() != true) {
        break;
      }
      this.httpServer.performRequestListener(localHTTPRequest);
    } while (localHTTPRequest.isKeepAlive());
    localHTTPSocket.close();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/http/HTTPServerThread.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */