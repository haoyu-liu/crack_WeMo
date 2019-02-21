package org.cybergarage.http;

import java.io.InputStream;
import java.io.PrintStream;
import java.net.Socket;
import java.util.StringTokenizer;

public class HTTPRequest
  extends HTTPPacket
{
  public static final int CONNECT_TIMEOUT = 30000;
  public static final int READ_TIMEOUT = 180000;
  private HTTPSocket httpSocket = null;
  private String method = null;
  private Socket postSocket = null;
  private String requestHost = "";
  private int requestPort = -1;
  private String uri = null;
  
  public HTTPRequest()
  {
    setVersion("1.0");
  }
  
  public HTTPRequest(InputStream paramInputStream)
  {
    super(paramInputStream);
  }
  
  public HTTPRequest(HTTPSocket paramHTTPSocket)
  {
    this(paramHTTPSocket.getInputStream());
    setSocket(paramHTTPSocket);
  }
  
  public String getFirstLineString()
  {
    return getMethod() + " " + getURI() + " " + getHTTPVersion() + "\r\n";
  }
  
  public String getHTTPVersion()
  {
    if (hasFirstLine() == true) {
      return getFirstLineToken(2);
    }
    return "HTTP/" + super.getVersion();
  }
  
  public String getHeader()
  {
    StringBuffer localStringBuffer = new StringBuffer();
    localStringBuffer.append(getFirstLineString());
    localStringBuffer.append(getHeaderString());
    return localStringBuffer.toString();
  }
  
  public String getLocalAddress()
  {
    return getSocket().getLocalAddress();
  }
  
  public int getLocalPort()
  {
    return getSocket().getLocalPort();
  }
  
  public String getMethod()
  {
    if (this.method != null) {
      return this.method;
    }
    return getFirstLineToken(0);
  }
  
  public ParameterList getParameterList()
  {
    ParameterList localParameterList = new ParameterList();
    String str1 = getURI();
    if (str1 == null) {}
    int i;
    do
    {
      return localParameterList;
      i = str1.indexOf('?');
    } while (i < 0);
    label30:
    String str2;
    int k;
    int m;
    if (i > 0)
    {
      int j = str1.indexOf('=', i + 1);
      str2 = str1.substring(i + 1, j);
      k = str1.indexOf('&', j + 1);
      m = j + 1;
      if (k <= 0) {
        break label111;
      }
    }
    label111:
    for (int n = k;; n = str1.length())
    {
      localParameterList.add(new Parameter(str2, str1.substring(m, n)));
      i = k;
      break label30;
      break;
    }
  }
  
  public String getParameterValue(String paramString)
  {
    return getParameterList().getValue(paramString);
  }
  
  public String getRequestHost()
  {
    return this.requestHost;
  }
  
  public int getRequestPort()
  {
    return this.requestPort;
  }
  
  public HTTPSocket getSocket()
  {
    return this.httpSocket;
  }
  
  public String getURI()
  {
    if (this.uri != null) {
      return this.uri;
    }
    return getFirstLineToken(1);
  }
  
  public boolean isGetRequest()
  {
    return isMethod("GET");
  }
  
  public boolean isHeadRequest()
  {
    return isMethod("HEAD");
  }
  
  public boolean isKeepAlive()
  {
    if (isCloseConnection() == true) {}
    for (;;)
    {
      return false;
      if (isKeepAliveConnection() == true) {
        return true;
      }
      if (getHTTPVersion().indexOf("1.0") > 0) {}
      for (int i = 1; i != 1; i = 0) {
        return true;
      }
    }
  }
  
  public boolean isMethod(String paramString)
  {
    String str = getMethod();
    if (str == null) {
      return false;
    }
    return str.equalsIgnoreCase(paramString);
  }
  
  public boolean isNotifyRequest()
  {
    return isMethod("NOTIFY");
  }
  
  public boolean isPostRequest()
  {
    return isMethod("POST");
  }
  
  public boolean isSOAPAction()
  {
    return hasHeader("SOAPACTION");
  }
  
  public boolean isSubscribeRequest()
  {
    return isMethod("SUBSCRIBE");
  }
  
  public boolean isUnsubscribeRequest()
  {
    return isMethod("UNSUBSCRIBE");
  }
  
  public boolean parseRequestLine(String paramString)
  {
    StringTokenizer localStringTokenizer = new StringTokenizer(paramString, " ");
    if (!localStringTokenizer.hasMoreTokens()) {}
    do
    {
      do
      {
        return false;
        setMethod(localStringTokenizer.nextToken());
      } while (!localStringTokenizer.hasMoreTokens());
      setURI(localStringTokenizer.nextToken());
    } while (!localStringTokenizer.hasMoreTokens());
    setVersion(localStringTokenizer.nextToken());
    return true;
  }
  
  public HTTPResponse post(String paramString, int paramInt)
  {
    return post(paramString, paramInt, false);
  }
  
  public HTTPResponse post(String paramString, int paramInt1, int paramInt2, int paramInt3)
  {
    return post(paramString, paramInt1, false, paramInt2, paramInt3);
  }
  
  public HTTPResponse post(String paramString, int paramInt, boolean paramBoolean)
  {
    return post(paramString, paramInt, paramBoolean, 180000, 30000);
  }
  
  /* Error */
  public HTTPResponse post(String paramString, int paramInt1, boolean paramBoolean, int paramInt2, int paramInt3)
  {
    // Byte code:
    //   0: new 231	org/cybergarage/http/HTTPResponse
    //   3: dup
    //   4: invokespecial 232	org/cybergarage/http/HTTPResponse:<init>	()V
    //   7: astore 6
    //   9: aload_0
    //   10: aload_1
    //   11: invokevirtual 235	org/cybergarage/http/HTTPRequest:setHost	(Ljava/lang/String;)V
    //   14: iload_3
    //   15: iconst_1
    //   16: if_icmpne +279 -> 295
    //   19: ldc -19
    //   21: astore 7
    //   23: aload_0
    //   24: aload 7
    //   26: invokevirtual 240	org/cybergarage/http/HTTPRequest:setConnection	(Ljava/lang/String;)V
    //   29: aload_0
    //   30: invokevirtual 242	org/cybergarage/http/HTTPRequest:isHeadRequest	()Z
    //   33: istore 8
    //   35: aconst_null
    //   36: astore 9
    //   38: aconst_null
    //   39: astore 10
    //   41: aload_0
    //   42: getfield 24	org/cybergarage/http/HTTPRequest:postSocket	Ljava/net/Socket;
    //   45: astore 27
    //   47: aconst_null
    //   48: astore 10
    //   50: aconst_null
    //   51: astore 9
    //   53: aload 27
    //   55: ifnonnull +41 -> 96
    //   58: aload_0
    //   59: new 244	java/net/Socket
    //   62: dup
    //   63: invokespecial 245	java/net/Socket:<init>	()V
    //   66: putfield 24	org/cybergarage/http/HTTPRequest:postSocket	Ljava/net/Socket;
    //   69: aload_0
    //   70: getfield 24	org/cybergarage/http/HTTPRequest:postSocket	Ljava/net/Socket;
    //   73: new 247	java/net/InetSocketAddress
    //   76: dup
    //   77: aload_1
    //   78: iload_2
    //   79: invokespecial 250	java/net/InetSocketAddress:<init>	(Ljava/lang/String;I)V
    //   82: iload 5
    //   84: invokevirtual 254	java/net/Socket:connect	(Ljava/net/SocketAddress;I)V
    //   87: aload_0
    //   88: getfield 24	org/cybergarage/http/HTTPRequest:postSocket	Ljava/net/Socket;
    //   91: iload 4
    //   93: invokevirtual 258	java/net/Socket:setSoTimeout	(I)V
    //   96: aload_0
    //   97: getfield 24	org/cybergarage/http/HTTPRequest:postSocket	Ljava/net/Socket;
    //   100: invokevirtual 262	java/net/Socket:getOutputStream	()Ljava/io/OutputStream;
    //   103: astore 9
    //   105: new 264	java/io/PrintStream
    //   108: dup
    //   109: aload 9
    //   111: invokespecial 267	java/io/PrintStream:<init>	(Ljava/io/OutputStream;)V
    //   114: astore 28
    //   116: aload 28
    //   118: aload_0
    //   119: invokevirtual 269	org/cybergarage/http/HTTPRequest:getHeader	()Ljava/lang/String;
    //   122: invokevirtual 272	java/io/PrintStream:print	(Ljava/lang/String;)V
    //   125: aload 28
    //   127: ldc 78
    //   129: invokevirtual 272	java/io/PrintStream:print	(Ljava/lang/String;)V
    //   132: aload_0
    //   133: invokevirtual 275	org/cybergarage/http/HTTPRequest:isChunked	()Z
    //   136: istore 29
    //   138: aload_0
    //   139: invokevirtual 278	org/cybergarage/http/HTTPRequest:getContentString	()Ljava/lang/String;
    //   142: astore 30
    //   144: iconst_0
    //   145: istore 31
    //   147: aconst_null
    //   148: astore 10
    //   150: aload 30
    //   152: ifnull +10 -> 162
    //   155: aload 30
    //   157: invokevirtual 148	java/lang/String:length	()I
    //   160: istore 31
    //   162: iload 31
    //   164: ifle +47 -> 211
    //   167: iload 29
    //   169: iconst_1
    //   170: if_icmpne +21 -> 191
    //   173: aload 28
    //   175: iload 31
    //   177: i2l
    //   178: invokestatic 284	java/lang/Long:toHexString	(J)Ljava/lang/String;
    //   181: invokevirtual 272	java/io/PrintStream:print	(Ljava/lang/String;)V
    //   184: aload 28
    //   186: ldc 78
    //   188: invokevirtual 272	java/io/PrintStream:print	(Ljava/lang/String;)V
    //   191: aload 28
    //   193: aload 30
    //   195: invokevirtual 272	java/io/PrintStream:print	(Ljava/lang/String;)V
    //   198: iload 29
    //   200: iconst_1
    //   201: if_icmpne +10 -> 211
    //   204: aload 28
    //   206: ldc 78
    //   208: invokevirtual 272	java/io/PrintStream:print	(Ljava/lang/String;)V
    //   211: iload 29
    //   213: iconst_1
    //   214: if_icmpne +18 -> 232
    //   217: aload 28
    //   219: ldc_w 286
    //   222: invokevirtual 272	java/io/PrintStream:print	(Ljava/lang/String;)V
    //   225: aload 28
    //   227: ldc 78
    //   229: invokevirtual 272	java/io/PrintStream:print	(Ljava/lang/String;)V
    //   232: aload 28
    //   234: invokevirtual 289	java/io/PrintStream:flush	()V
    //   237: aload_0
    //   238: getfield 24	org/cybergarage/http/HTTPRequest:postSocket	Ljava/net/Socket;
    //   241: invokevirtual 290	java/net/Socket:getInputStream	()Ljava/io/InputStream;
    //   244: astore 10
    //   246: aload 6
    //   248: aload 10
    //   250: iload 8
    //   252: invokevirtual 294	org/cybergarage/http/HTTPResponse:set	(Ljava/io/InputStream;Z)Z
    //   255: pop
    //   256: iload_3
    //   257: ifne +35 -> 292
    //   260: aload 10
    //   262: invokevirtual 299	java/io/InputStream:close	()V
    //   265: aload 10
    //   267: ifnull +8 -> 275
    //   270: aload 9
    //   272: invokevirtual 302	java/io/OutputStream:close	()V
    //   275: aload 9
    //   277: ifnull +10 -> 287
    //   280: aload_0
    //   281: getfield 24	org/cybergarage/http/HTTPRequest:postSocket	Ljava/net/Socket;
    //   284: invokevirtual 303	java/net/Socket:close	()V
    //   287: aload_0
    //   288: aconst_null
    //   289: putfield 24	org/cybergarage/http/HTTPRequest:postSocket	Ljava/net/Socket;
    //   292: aload 6
    //   294: areturn
    //   295: ldc_w 304
    //   298: astore 7
    //   300: goto -277 -> 23
    //   303: astore 23
    //   305: aload 6
    //   307: sipush 500
    //   310: invokevirtual 307	org/cybergarage/http/HTTPResponse:setStatusCode	(I)V
    //   313: aload 23
    //   315: invokestatic 313	org/cybergarage/util/Debug:warning	(Ljava/lang/Exception;)V
    //   318: iload_3
    //   319: ifne -27 -> 292
    //   322: aload 10
    //   324: invokevirtual 299	java/io/InputStream:close	()V
    //   327: aload 10
    //   329: ifnull +8 -> 337
    //   332: aload 9
    //   334: invokevirtual 302	java/io/OutputStream:close	()V
    //   337: aload 9
    //   339: ifnull +10 -> 349
    //   342: aload_0
    //   343: getfield 24	org/cybergarage/http/HTTPRequest:postSocket	Ljava/net/Socket;
    //   346: invokevirtual 303	java/net/Socket:close	()V
    //   349: aload_0
    //   350: aconst_null
    //   351: putfield 24	org/cybergarage/http/HTTPRequest:postSocket	Ljava/net/Socket;
    //   354: aload 6
    //   356: areturn
    //   357: astore 19
    //   359: aload 6
    //   361: sipush 500
    //   364: invokevirtual 307	org/cybergarage/http/HTTPResponse:setStatusCode	(I)V
    //   367: aload 19
    //   369: invokestatic 313	org/cybergarage/util/Debug:warning	(Ljava/lang/Exception;)V
    //   372: iload_3
    //   373: ifne -81 -> 292
    //   376: aload 10
    //   378: invokevirtual 299	java/io/InputStream:close	()V
    //   381: aload 10
    //   383: ifnull +8 -> 391
    //   386: aload 9
    //   388: invokevirtual 302	java/io/OutputStream:close	()V
    //   391: aload 9
    //   393: ifnull +10 -> 403
    //   396: aload_0
    //   397: getfield 24	org/cybergarage/http/HTTPRequest:postSocket	Ljava/net/Socket;
    //   400: invokevirtual 303	java/net/Socket:close	()V
    //   403: aload_0
    //   404: aconst_null
    //   405: putfield 24	org/cybergarage/http/HTTPRequest:postSocket	Ljava/net/Socket;
    //   408: aload 6
    //   410: areturn
    //   411: astore 15
    //   413: aload 6
    //   415: sipush 500
    //   418: invokevirtual 307	org/cybergarage/http/HTTPResponse:setStatusCode	(I)V
    //   421: aload 15
    //   423: invokestatic 313	org/cybergarage/util/Debug:warning	(Ljava/lang/Exception;)V
    //   426: iload_3
    //   427: ifne -135 -> 292
    //   430: aload 10
    //   432: invokevirtual 299	java/io/InputStream:close	()V
    //   435: aload 10
    //   437: ifnull +8 -> 445
    //   440: aload 9
    //   442: invokevirtual 302	java/io/OutputStream:close	()V
    //   445: aload 9
    //   447: ifnull +10 -> 457
    //   450: aload_0
    //   451: getfield 24	org/cybergarage/http/HTTPRequest:postSocket	Ljava/net/Socket;
    //   454: invokevirtual 303	java/net/Socket:close	()V
    //   457: aload_0
    //   458: aconst_null
    //   459: putfield 24	org/cybergarage/http/HTTPRequest:postSocket	Ljava/net/Socket;
    //   462: aload 6
    //   464: areturn
    //   465: astore 11
    //   467: iload_3
    //   468: ifne +35 -> 503
    //   471: aload 10
    //   473: invokevirtual 299	java/io/InputStream:close	()V
    //   476: aload 10
    //   478: ifnull +8 -> 486
    //   481: aload 9
    //   483: invokevirtual 302	java/io/OutputStream:close	()V
    //   486: aload 9
    //   488: ifnull +10 -> 498
    //   491: aload_0
    //   492: getfield 24	org/cybergarage/http/HTTPRequest:postSocket	Ljava/net/Socket;
    //   495: invokevirtual 303	java/net/Socket:close	()V
    //   498: aload_0
    //   499: aconst_null
    //   500: putfield 24	org/cybergarage/http/HTTPRequest:postSocket	Ljava/net/Socket;
    //   503: aload 11
    //   505: athrow
    //   506: astore 33
    //   508: goto -243 -> 265
    //   511: astore 35
    //   513: goto -238 -> 275
    //   516: astore 24
    //   518: goto -191 -> 327
    //   521: astore 26
    //   523: goto -186 -> 337
    //   526: astore 20
    //   528: goto -147 -> 381
    //   531: astore 22
    //   533: goto -142 -> 391
    //   536: astore 16
    //   538: goto -103 -> 435
    //   541: astore 18
    //   543: goto -98 -> 445
    //   546: astore 12
    //   548: goto -72 -> 476
    //   551: astore 14
    //   553: goto -67 -> 486
    //   556: astore 13
    //   558: goto -60 -> 498
    //   561: astore 17
    //   563: goto -106 -> 457
    //   566: astore 21
    //   568: goto -165 -> 403
    //   571: astore 25
    //   573: goto -224 -> 349
    //   576: astore 34
    //   578: goto -291 -> 287
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	581	0	this	HTTPRequest
    //   0	581	1	paramString	String
    //   0	581	2	paramInt1	int
    //   0	581	3	paramBoolean	boolean
    //   0	581	4	paramInt2	int
    //   0	581	5	paramInt3	int
    //   7	456	6	localHTTPResponse	HTTPResponse
    //   21	278	7	str1	String
    //   33	218	8	bool1	boolean
    //   36	451	9	localOutputStream	java.io.OutputStream
    //   39	438	10	localInputStream	InputStream
    //   465	39	11	localObject	Object
    //   546	1	12	localException1	Exception
    //   556	1	13	localException2	Exception
    //   551	1	14	localException3	Exception
    //   411	11	15	localException4	Exception
    //   536	1	16	localException5	Exception
    //   561	1	17	localException6	Exception
    //   541	1	18	localException7	Exception
    //   357	11	19	localIOException	java.io.IOException
    //   526	1	20	localException8	Exception
    //   566	1	21	localException9	Exception
    //   531	1	22	localException10	Exception
    //   303	11	23	localSocketException	java.net.SocketException
    //   516	1	24	localException11	Exception
    //   571	1	25	localException12	Exception
    //   521	1	26	localException13	Exception
    //   45	9	27	localSocket	Socket
    //   114	119	28	localPrintStream	PrintStream
    //   136	79	29	bool2	boolean
    //   142	52	30	str2	String
    //   145	31	31	i	int
    //   506	1	33	localException14	Exception
    //   576	1	34	localException15	Exception
    //   511	1	35	localException16	Exception
    // Exception table:
    //   from	to	target	type
    //   41	47	303	java/net/SocketException
    //   58	96	303	java/net/SocketException
    //   96	144	303	java/net/SocketException
    //   155	162	303	java/net/SocketException
    //   173	191	303	java/net/SocketException
    //   191	198	303	java/net/SocketException
    //   204	211	303	java/net/SocketException
    //   217	232	303	java/net/SocketException
    //   232	256	303	java/net/SocketException
    //   41	47	357	java/io/IOException
    //   58	96	357	java/io/IOException
    //   96	144	357	java/io/IOException
    //   155	162	357	java/io/IOException
    //   173	191	357	java/io/IOException
    //   191	198	357	java/io/IOException
    //   204	211	357	java/io/IOException
    //   217	232	357	java/io/IOException
    //   232	256	357	java/io/IOException
    //   41	47	411	java/lang/Exception
    //   58	96	411	java/lang/Exception
    //   96	144	411	java/lang/Exception
    //   155	162	411	java/lang/Exception
    //   173	191	411	java/lang/Exception
    //   191	198	411	java/lang/Exception
    //   204	211	411	java/lang/Exception
    //   217	232	411	java/lang/Exception
    //   232	256	411	java/lang/Exception
    //   41	47	465	finally
    //   58	96	465	finally
    //   96	144	465	finally
    //   155	162	465	finally
    //   173	191	465	finally
    //   191	198	465	finally
    //   204	211	465	finally
    //   217	232	465	finally
    //   232	256	465	finally
    //   305	318	465	finally
    //   359	372	465	finally
    //   413	426	465	finally
    //   260	265	506	java/lang/Exception
    //   270	275	511	java/lang/Exception
    //   322	327	516	java/lang/Exception
    //   332	337	521	java/lang/Exception
    //   376	381	526	java/lang/Exception
    //   386	391	531	java/lang/Exception
    //   430	435	536	java/lang/Exception
    //   440	445	541	java/lang/Exception
    //   471	476	546	java/lang/Exception
    //   481	486	551	java/lang/Exception
    //   491	498	556	java/lang/Exception
    //   450	457	561	java/lang/Exception
    //   396	403	566	java/lang/Exception
    //   342	349	571	java/lang/Exception
    //   280	287	576	java/lang/Exception
  }
  
  public boolean post(HTTPResponse paramHTTPResponse)
  {
    HTTPSocket localHTTPSocket = getSocket();
    long l1 = 0L;
    long l2 = paramHTTPResponse.getContentLength();
    if (hasContentRange() == true)
    {
      long l3 = getContentRangeFirstPosition();
      long l4 = getContentRangeLastPosition();
      if (l4 <= 0L) {
        l4 = l2 - 1L;
      }
      if ((l3 > l2) || (l4 > l2)) {
        return returnResponse(416);
      }
      paramHTTPResponse.setContentRange(l3, l4, l2);
      paramHTTPResponse.setStatusCode(206);
      l1 = l3;
      l2 = 1L + (l4 - l3);
    }
    boolean bool = isHeadRequest();
    return localHTTPSocket.post(paramHTTPResponse, l1, l2, bool);
  }
  
  public void print()
  {
    System.out.println(toString());
  }
  
  public boolean read()
  {
    return super.read(getSocket());
  }
  
  public boolean returnBadRequest()
  {
    return returnResponse(400);
  }
  
  public boolean returnOK()
  {
    return returnResponse(200);
  }
  
  public boolean returnResponse(int paramInt)
  {
    HTTPResponse localHTTPResponse = new HTTPResponse();
    localHTTPResponse.setStatusCode(paramInt);
    localHTTPResponse.setContentLength(0L);
    return post(localHTTPResponse);
  }
  
  public void set(HTTPRequest paramHTTPRequest)
  {
    set(paramHTTPRequest);
    setSocket(paramHTTPRequest.getSocket());
  }
  
  public void setMethod(String paramString)
  {
    this.method = paramString;
  }
  
  public void setRequestHost(String paramString)
  {
    this.requestHost = paramString;
  }
  
  public void setRequestPort(int paramInt)
  {
    this.requestPort = paramInt;
  }
  
  public void setSocket(HTTPSocket paramHTTPSocket)
  {
    this.httpSocket = paramHTTPSocket;
  }
  
  public void setURI(String paramString)
  {
    setURI(paramString, false);
  }
  
  public void setURI(String paramString, boolean paramBoolean)
  {
    this.uri = paramString;
    if (!paramBoolean) {
      return;
    }
    this.uri = HTTP.toRelativeURL(this.uri);
  }
  
  public String toString()
  {
    StringBuffer localStringBuffer = new StringBuffer();
    localStringBuffer.append(getHeader());
    localStringBuffer.append("\r\n");
    localStringBuffer.append(getContentString());
    return localStringBuffer.toString();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/http/HTTPRequest.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */