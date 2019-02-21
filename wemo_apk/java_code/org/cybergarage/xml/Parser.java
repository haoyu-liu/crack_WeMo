package org.cybergarage.xml;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import org.cybergarage.http.HTTPRequest;
import org.cybergarage.http.HTTPResponse;

public abstract class Parser
{
  public Node parse(File paramFile)
    throws ParserException
  {
    try
    {
      FileInputStream localFileInputStream = new FileInputStream(paramFile);
      Node localNode = parse(localFileInputStream);
      localFileInputStream.close();
      return localNode;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
    return null;
  }
  
  public abstract Node parse(InputStream paramInputStream)
    throws ParserException;
  
  public Node parse(String paramString)
    throws ParserException
  {
    try
    {
      Node localNode = parse(new ByteArrayInputStream(paramString.getBytes()));
      return localNode;
    }
    catch (Exception localException)
    {
      throw new ParserException(localException);
    }
  }
  
  public Node parse(URL paramURL)
    throws ParserException
  {
    String str1 = paramURL.getHost();
    int i = paramURL.getPort();
    if (i == -1) {
      i = 80;
    }
    String str2 = paramURL.getPath();
    try
    {
      HttpURLConnection localHttpURLConnection = (HttpURLConnection)paramURL.openConnection();
      localHttpURLConnection.setRequestMethod("GET");
      localHttpURLConnection.setRequestProperty("Content-Length", "0");
      if (str1 != null) {
        localHttpURLConnection.setRequestProperty("HOST", str1);
      }
      InputStream localInputStream = localHttpURLConnection.getInputStream();
      Node localNode = parse(localInputStream);
      localInputStream.close();
      localHttpURLConnection.disconnect();
      return localNode;
    }
    catch (Exception localException)
    {
      HTTPRequest localHTTPRequest = new HTTPRequest();
      localHTTPRequest.setMethod("GET");
      localHTTPRequest.setURI(str2);
      HTTPResponse localHTTPResponse = localHTTPRequest.post(str1, i);
      if (!localHTTPResponse.isSuccessful()) {
        throw new ParserException("HTTP comunication failed: no answer from peer.Unable to retrive resoure -> " + paramURL.toString());
      }
      return parse(new ByteArrayInputStream(new String(localHTTPResponse.getContent()).getBytes()));
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/xml/Parser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */