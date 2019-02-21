.class public Lorg/cybergarage/http/HTTPRequest;
.super Lorg/cybergarage/http/HTTPPacket;
.source "HTTPRequest.java"


# static fields
.field public static final CONNECT_TIMEOUT:I = 0x7530

.field public static final READ_TIMEOUT:I = 0x2bf20


# instance fields
.field private httpSocket:Lorg/cybergarage/http/HTTPSocket;

.field private method:Ljava/lang/String;

.field private postSocket:Ljava/net/Socket;

.field private requestHost:Ljava/lang/String;

.field private requestPort:I

.field private uri:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 89
    invoke-direct {p0}, Lorg/cybergarage/http/HTTPPacket;-><init>()V

    .line 83
    iput-object v1, p0, Lorg/cybergarage/http/HTTPRequest;->postSocket:Ljava/net/Socket;

    .line 108
    iput-object v1, p0, Lorg/cybergarage/http/HTTPRequest;->method:Ljava/lang/String;

    .line 164
    iput-object v1, p0, Lorg/cybergarage/http/HTTPRequest;->uri:Ljava/lang/String;

    .line 232
    const-string v0, ""

    iput-object v0, p0, Lorg/cybergarage/http/HTTPRequest;->requestHost:Ljava/lang/String;

    .line 244
    const/4 v0, -0x1

    iput v0, p0, Lorg/cybergarage/http/HTTPRequest;->requestPort:I

    .line 260
    iput-object v1, p0, Lorg/cybergarage/http/HTTPRequest;->httpSocket:Lorg/cybergarage/http/HTTPSocket;

    .line 90
    const-string v0, "1.0"

    invoke-virtual {p0, v0}, Lorg/cybergarage/http/HTTPRequest;->setVersion(Ljava/lang/String;)V

    .line 91
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 2
    .param p1, "in"    # Ljava/io/InputStream;

    .prologue
    const/4 v1, 0x0

    .line 95
    invoke-direct {p0, p1}, Lorg/cybergarage/http/HTTPPacket;-><init>(Ljava/io/InputStream;)V

    .line 83
    iput-object v1, p0, Lorg/cybergarage/http/HTTPRequest;->postSocket:Ljava/net/Socket;

    .line 108
    iput-object v1, p0, Lorg/cybergarage/http/HTTPRequest;->method:Ljava/lang/String;

    .line 164
    iput-object v1, p0, Lorg/cybergarage/http/HTTPRequest;->uri:Ljava/lang/String;

    .line 232
    const-string v0, ""

    iput-object v0, p0, Lorg/cybergarage/http/HTTPRequest;->requestHost:Ljava/lang/String;

    .line 244
    const/4 v0, -0x1

    iput v0, p0, Lorg/cybergarage/http/HTTPRequest;->requestPort:I

    .line 260
    iput-object v1, p0, Lorg/cybergarage/http/HTTPRequest;->httpSocket:Lorg/cybergarage/http/HTTPSocket;

    .line 96
    return-void
.end method

.method public constructor <init>(Lorg/cybergarage/http/HTTPSocket;)V
    .locals 1
    .param p1, "httpSock"    # Lorg/cybergarage/http/HTTPSocket;

    .prologue
    .line 100
    invoke-virtual {p1}, Lorg/cybergarage/http/HTTPSocket;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/cybergarage/http/HTTPRequest;-><init>(Ljava/io/InputStream;)V

    .line 101
    invoke-virtual {p0, p1}, Lorg/cybergarage/http/HTTPRequest;->setSocket(Lorg/cybergarage/http/HTTPSocket;)V

    .line 102
    return-void
.end method


# virtual methods
.method public getFirstLineString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 318
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/cybergarage/http/HTTPRequest;->getMethod()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/cybergarage/http/HTTPRequest;->getURI()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/cybergarage/http/HTTPRequest;->getHTTPVersion()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\r\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getHTTPVersion()Ljava/lang/String;
    .locals 2

    .prologue
    .line 311
    invoke-virtual {p0}, Lorg/cybergarage/http/HTTPRequest;->hasFirstLine()Z

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 312
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lorg/cybergarage/http/HTTPRequest;->getFirstLineToken(I)Ljava/lang/String;

    move-result-object v0

    .line 313
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "HTTP/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-super {p0}, Lorg/cybergarage/http/HTTPPacket;->getVersion()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getHeader()Ljava/lang/String;
    .locals 3

    .prologue
    .line 327
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 329
    .local v1, "str":Ljava/lang/StringBuffer;
    invoke-virtual {p0}, Lorg/cybergarage/http/HTTPRequest;->getFirstLineString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 331
    invoke-virtual {p0}, Lorg/cybergarage/http/HTTPRequest;->getHeaderString()Ljava/lang/String;

    move-result-object v0

    .line 332
    .local v0, "headerString":Ljava/lang/String;
    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 334
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public getLocalAddress()Ljava/lang/String;
    .locals 1

    .prologue
    .line 278
    invoke-virtual {p0}, Lorg/cybergarage/http/HTTPRequest;->getSocket()Lorg/cybergarage/http/HTTPSocket;

    move-result-object v0

    invoke-virtual {v0}, Lorg/cybergarage/http/HTTPSocket;->getLocalAddress()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLocalPort()I
    .locals 1

    .prologue
    .line 283
    invoke-virtual {p0}, Lorg/cybergarage/http/HTTPRequest;->getSocket()Lorg/cybergarage/http/HTTPSocket;

    move-result-object v0

    invoke-virtual {v0}, Lorg/cybergarage/http/HTTPSocket;->getLocalPort()I

    move-result v0

    return v0
.end method

.method public getMethod()Ljava/lang/String;
    .locals 1

    .prologue
    .line 117
    iget-object v0, p0, Lorg/cybergarage/http/HTTPRequest;->method:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 118
    iget-object v0, p0, Lorg/cybergarage/http/HTTPRequest;->method:Ljava/lang/String;

    .line 119
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/cybergarage/http/HTTPRequest;->getFirstLineToken(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getParameterList()Lorg/cybergarage/http/ParameterList;
    .locals 10

    .prologue
    .line 194
    new-instance v5, Lorg/cybergarage/http/ParameterList;

    invoke-direct {v5}, Lorg/cybergarage/http/ParameterList;-><init>()V

    .line 195
    .local v5, "paramList":Lorg/cybergarage/http/ParameterList;
    invoke-virtual {p0}, Lorg/cybergarage/http/HTTPRequest;->getURI()Ljava/lang/String;

    move-result-object v6

    .line 196
    .local v6, "uri":Ljava/lang/String;
    if-nez v6, :cond_1

    .line 210
    :cond_0
    return-object v5

    .line 198
    :cond_1
    const/16 v8, 0x3f

    invoke-virtual {v6, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    .line 199
    .local v4, "paramIdx":I
    if-ltz v4, :cond_0

    .line 201
    :goto_0
    if-lez v4, :cond_0

    .line 202
    const/16 v8, 0x3d

    add-int/lit8 v9, v4, 0x1

    invoke-virtual {v6, v8, v9}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    .line 203
    .local v0, "eqIdx":I
    add-int/lit8 v8, v4, 0x1

    invoke-virtual {v6, v8, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 204
    .local v1, "name":Ljava/lang/String;
    const/16 v8, 0x26

    add-int/lit8 v9, v0, 0x1

    invoke-virtual {v6, v8, v9}, Ljava/lang/String;->indexOf(II)I

    move-result v2

    .line 205
    .local v2, "nextParamIdx":I
    add-int/lit8 v9, v0, 0x1

    if-lez v2, :cond_2

    move v8, v2

    :goto_1
    invoke-virtual {v6, v9, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    .line 206
    .local v7, "value":Ljava/lang/String;
    new-instance v3, Lorg/cybergarage/http/Parameter;

    invoke-direct {v3, v1, v7}, Lorg/cybergarage/http/Parameter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 207
    .local v3, "param":Lorg/cybergarage/http/Parameter;
    invoke-virtual {v5, v3}, Lorg/cybergarage/http/ParameterList;->add(Ljava/lang/Object;)Z

    .line 208
    move v4, v2

    .line 209
    goto :goto_0

    .line 205
    .end local v3    # "param":Lorg/cybergarage/http/Parameter;
    .end local v7    # "value":Ljava/lang/String;
    :cond_2
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v8

    goto :goto_1
.end method

.method public getParameterValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 215
    invoke-virtual {p0}, Lorg/cybergarage/http/HTTPRequest;->getParameterList()Lorg/cybergarage/http/ParameterList;

    move-result-object v0

    .line 216
    .local v0, "paramList":Lorg/cybergarage/http/ParameterList;
    invoke-virtual {v0, p1}, Lorg/cybergarage/http/ParameterList;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getRequestHost()Ljava/lang/String;
    .locals 1

    .prologue
    .line 241
    iget-object v0, p0, Lorg/cybergarage/http/HTTPRequest;->requestHost:Ljava/lang/String;

    return-object v0
.end method

.method public getRequestPort()I
    .locals 1

    .prologue
    .line 253
    iget v0, p0, Lorg/cybergarage/http/HTTPRequest;->requestPort:I

    return v0
.end method

.method public getSocket()Lorg/cybergarage/http/HTTPSocket;
    .locals 1

    .prologue
    .line 269
    iget-object v0, p0, Lorg/cybergarage/http/HTTPRequest;->httpSocket:Lorg/cybergarage/http/HTTPSocket;

    return-object v0
.end method

.method public getURI()Ljava/lang/String;
    .locals 1

    .prologue
    .line 182
    iget-object v0, p0, Lorg/cybergarage/http/HTTPRequest;->uri:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 183
    iget-object v0, p0, Lorg/cybergarage/http/HTTPRequest;->uri:Ljava/lang/String;

    .line 184
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/cybergarage/http/HTTPRequest;->getFirstLineToken(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public isGetRequest()Z
    .locals 1

    .prologue
    .line 132
    const-string v0, "GET"

    invoke-virtual {p0, v0}, Lorg/cybergarage/http/HTTPRequest;->isMethod(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isHeadRequest()Z
    .locals 1

    .prologue
    .line 142
    const-string v0, "HEAD"

    invoke-virtual {p0, v0}, Lorg/cybergarage/http/HTTPRequest;->isMethod(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isKeepAlive()Z
    .locals 5

    .prologue
    const/4 v2, 0x0

    const/4 v3, 0x1

    .line 343
    invoke-virtual {p0}, Lorg/cybergarage/http/HTTPRequest;->isCloseConnection()Z

    move-result v4

    if-ne v4, v3, :cond_1

    .line 351
    :cond_0
    :goto_0
    return v2

    .line 345
    :cond_1
    invoke-virtual {p0}, Lorg/cybergarage/http/HTTPRequest;->isKeepAliveConnection()Z

    move-result v4

    if-ne v4, v3, :cond_2

    move v2, v3

    .line 346
    goto :goto_0

    .line 347
    :cond_2
    invoke-virtual {p0}, Lorg/cybergarage/http/HTTPRequest;->getHTTPVersion()Ljava/lang/String;

    move-result-object v0

    .line 348
    .local v0, "httpVer":Ljava/lang/String;
    const-string v4, "1.0"

    invoke-virtual {v0, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    if-lez v4, :cond_3

    move v1, v3

    .line 349
    .local v1, "isHTTP10":Z
    :goto_1
    if-eq v1, v3, :cond_0

    move v2, v3

    .line 351
    goto :goto_0

    .end local v1    # "isHTTP10":Z
    :cond_3
    move v1, v2

    .line 348
    goto :goto_1
.end method

.method public isMethod(Ljava/lang/String;)Z
    .locals 2
    .param p1, "method"    # Ljava/lang/String;

    .prologue
    .line 124
    invoke-virtual {p0}, Lorg/cybergarage/http/HTTPRequest;->getMethod()Ljava/lang/String;

    move-result-object v0

    .line 125
    .local v0, "headerMethod":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 126
    const/4 v1, 0x0

    .line 127
    :goto_0
    return v1

    :cond_0
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    goto :goto_0
.end method

.method public isNotifyRequest()Z
    .locals 1

    .prologue
    .line 157
    const-string v0, "NOTIFY"

    invoke-virtual {p0, v0}, Lorg/cybergarage/http/HTTPRequest;->isMethod(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isPostRequest()Z
    .locals 1

    .prologue
    .line 137
    const-string v0, "POST"

    invoke-virtual {p0, v0}, Lorg/cybergarage/http/HTTPRequest;->isMethod(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isSOAPAction()Z
    .locals 1

    .prologue
    .line 225
    const-string v0, "SOAPACTION"

    invoke-virtual {p0, v0}, Lorg/cybergarage/http/HTTPRequest;->hasHeader(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isSubscribeRequest()Z
    .locals 1

    .prologue
    .line 147
    const-string v0, "SUBSCRIBE"

    invoke-virtual {p0, v0}, Lorg/cybergarage/http/HTTPRequest;->isMethod(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isUnsubscribeRequest()Z
    .locals 1

    .prologue
    .line 152
    const-string v0, "UNSUBSCRIBE"

    invoke-virtual {p0, v0}, Lorg/cybergarage/http/HTTPRequest;->isMethod(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public parseRequestLine(Ljava/lang/String;)Z
    .locals 3
    .param p1, "lineStr"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 292
    new-instance v0, Ljava/util/StringTokenizer;

    const-string v2, " "

    invoke-direct {v0, p1, v2}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 293
    .local v0, "st":Ljava/util/StringTokenizer;
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v2

    if-nez v2, :cond_1

    .line 302
    :cond_0
    :goto_0
    return v1

    .line 295
    :cond_1
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/cybergarage/http/HTTPRequest;->setMethod(Ljava/lang/String;)V

    .line 296
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 298
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/cybergarage/http/HTTPRequest;->setURI(Ljava/lang/String;)V

    .line 299
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 301
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/cybergarage/http/HTTPRequest;->setVersion(Ljava/lang/String;)V

    .line 302
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public post(Ljava/lang/String;I)Lorg/cybergarage/http/HTTPResponse;
    .locals 1
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I

    .prologue
    .line 490
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/cybergarage/http/HTTPRequest;->post(Ljava/lang/String;IZ)Lorg/cybergarage/http/HTTPResponse;

    move-result-object v0

    return-object v0
.end method

.method public post(Ljava/lang/String;III)Lorg/cybergarage/http/HTTPResponse;
    .locals 6
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "soTimeout"    # I
    .param p4, "connetTimeout"    # I

    .prologue
    .line 400
    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v4, p3

    move v5, p4

    invoke-virtual/range {v0 .. v5}, Lorg/cybergarage/http/HTTPRequest;->post(Ljava/lang/String;IZII)Lorg/cybergarage/http/HTTPResponse;

    move-result-object v0

    return-object v0
.end method

.method public post(Ljava/lang/String;IZ)Lorg/cybergarage/http/HTTPResponse;
    .locals 6
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "isKeepAlive"    # Z

    .prologue
    .line 396
    const v4, 0x2bf20

    const/16 v5, 0x7530

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    invoke-virtual/range {v0 .. v5}, Lorg/cybergarage/http/HTTPRequest;->post(Ljava/lang/String;IZII)Lorg/cybergarage/http/HTTPResponse;

    move-result-object v0

    return-object v0
.end method

.method public post(Ljava/lang/String;IZII)Lorg/cybergarage/http/HTTPResponse;
    .locals 14
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "isKeepAlive"    # Z
    .param p4, "soTimeout"    # I
    .param p5, "connetTimeout"    # I

    .prologue
    .line 405
    new-instance v6, Lorg/cybergarage/http/HTTPResponse;

    invoke-direct {v6}, Lorg/cybergarage/http/HTTPResponse;-><init>()V

    .line 407
    .local v6, "httpRes":Lorg/cybergarage/http/HTTPResponse;
    invoke-virtual {p0, p1}, Lorg/cybergarage/http/HTTPRequest;->setHost(Ljava/lang/String;)V

    .line 409
    const/4 v12, 0x1

    move/from16 v0, p3

    if-ne v0, v12, :cond_8

    const-string v12, "Keep-Alive"

    :goto_0
    invoke-virtual {p0, v12}, Lorg/cybergarage/http/HTTPRequest;->setConnection(Ljava/lang/String;)V

    .line 411
    invoke-virtual {p0}, Lorg/cybergarage/http/HTTPRequest;->isHeadRequest()Z

    move-result v9

    .line 413
    .local v9, "isHeaderRequest":Z
    const/4 v10, 0x0

    .line 414
    .local v10, "out":Ljava/io/OutputStream;
    const/4 v7, 0x0

    .line 417
    .local v7, "in":Ljava/io/InputStream;
    :try_start_0
    iget-object v12, p0, Lorg/cybergarage/http/HTTPRequest;->postSocket:Ljava/net/Socket;

    if-nez v12, :cond_0

    .line 419
    new-instance v12, Ljava/net/Socket;

    invoke-direct {v12}, Ljava/net/Socket;-><init>()V

    iput-object v12, p0, Lorg/cybergarage/http/HTTPRequest;->postSocket:Ljava/net/Socket;

    .line 420
    iget-object v12, p0, Lorg/cybergarage/http/HTTPRequest;->postSocket:Ljava/net/Socket;

    new-instance v13, Ljava/net/InetSocketAddress;

    move/from16 v0, p2

    invoke-direct {v13, p1, v0}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    move/from16 v0, p5

    invoke-virtual {v12, v13, v0}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V

    .line 421
    iget-object v12, p0, Lorg/cybergarage/http/HTTPRequest;->postSocket:Ljava/net/Socket;

    move/from16 v0, p4

    invoke-virtual {v12, v0}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 424
    :cond_0
    iget-object v12, p0, Lorg/cybergarage/http/HTTPRequest;->postSocket:Ljava/net/Socket;

    invoke-virtual {v12}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v10

    .line 425
    new-instance v11, Ljava/io/PrintStream;

    invoke-direct {v11, v10}, Ljava/io/PrintStream;-><init>(Ljava/io/OutputStream;)V

    .line 426
    .local v11, "pout":Ljava/io/PrintStream;
    invoke-virtual {p0}, Lorg/cybergarage/http/HTTPRequest;->getHeader()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 427
    const-string v12, "\r\n"

    invoke-virtual {v11, v12}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 429
    invoke-virtual {p0}, Lorg/cybergarage/http/HTTPRequest;->isChunked()Z

    move-result v8

    .line 431
    .local v8, "isChunkedRequest":Z
    invoke-virtual {p0}, Lorg/cybergarage/http/HTTPRequest;->getContentString()Ljava/lang/String;

    move-result-object v3

    .line 432
    .local v3, "content":Ljava/lang/String;
    const/4 v4, 0x0

    .line 433
    .local v4, "contentLength":I
    if-eqz v3, :cond_1

    .line 434
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    .line 436
    :cond_1
    if-lez v4, :cond_3

    .line 437
    const/4 v12, 0x1

    if-ne v8, v12, :cond_2

    .line 439
    int-to-long v12, v4

    invoke-static {v12, v13}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    move-result-object v2

    .line 440
    .local v2, "chunSizeBuf":Ljava/lang/String;
    invoke-virtual {v11, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 441
    const-string v12, "\r\n"

    invoke-virtual {v11, v12}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 443
    .end local v2    # "chunSizeBuf":Ljava/lang/String;
    :cond_2
    invoke-virtual {v11, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 444
    const/4 v12, 0x1

    if-ne v8, v12, :cond_3

    .line 445
    const-string v12, "\r\n"

    invoke-virtual {v11, v12}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 448
    :cond_3
    const/4 v12, 0x1

    if-ne v8, v12, :cond_4

    .line 449
    const-string v12, "0"

    invoke-virtual {v11, v12}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 450
    const-string v12, "\r\n"

    invoke-virtual {v11, v12}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 453
    :cond_4
    invoke-virtual {v11}, Ljava/io/PrintStream;->flush()V

    .line 454
    iget-object v12, p0, Lorg/cybergarage/http/HTTPRequest;->postSocket:Ljava/net/Socket;

    invoke-virtual {v12}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v7

    .line 455
    invoke-virtual {v6, v7, v9}, Lorg/cybergarage/http/HTTPResponse;->set(Ljava/io/InputStream;Z)Z
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 470
    if-nez p3, :cond_7

    .line 472
    :try_start_1
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3

    .line 474
    :goto_1
    if-eqz v7, :cond_5

    .line 476
    :try_start_2
    invoke-virtual {v10}, Ljava/io/OutputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_4

    .line 478
    :cond_5
    :goto_2
    if-eqz v10, :cond_6

    .line 480
    :try_start_3
    iget-object v12, p0, Lorg/cybergarage/http/HTTPRequest;->postSocket:Ljava/net/Socket;

    invoke-virtual {v12}, Ljava/net/Socket;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_11

    .line 482
    :cond_6
    :goto_3
    const/4 v12, 0x0

    iput-object v12, p0, Lorg/cybergarage/http/HTTPRequest;->postSocket:Ljava/net/Socket;

    .line 486
    .end local v3    # "content":Ljava/lang/String;
    .end local v4    # "contentLength":I
    .end local v8    # "isChunkedRequest":Z
    .end local v11    # "pout":Ljava/io/PrintStream;
    :cond_7
    :goto_4
    return-object v6

    .line 409
    .end local v7    # "in":Ljava/io/InputStream;
    .end local v9    # "isHeaderRequest":Z
    .end local v10    # "out":Ljava/io/OutputStream;
    :cond_8
    const-string v12, "close"

    goto/16 :goto_0

    .line 456
    .restart local v7    # "in":Ljava/io/InputStream;
    .restart local v9    # "isHeaderRequest":Z
    .restart local v10    # "out":Ljava/io/OutputStream;
    :catch_0
    move-exception v5

    .line 457
    .local v5, "e":Ljava/net/SocketException;
    const/16 v12, 0x1f4

    :try_start_4
    invoke-virtual {v6, v12}, Lorg/cybergarage/http/HTTPResponse;->setStatusCode(I)V

    .line 458
    invoke-static {v5}, Lorg/cybergarage/util/Debug;->warning(Ljava/lang/Exception;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 470
    if-nez p3, :cond_7

    .line 472
    :try_start_5
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_5

    .line 474
    :goto_5
    if-eqz v7, :cond_9

    .line 476
    :try_start_6
    invoke-virtual {v10}, Ljava/io/OutputStream;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_6

    .line 478
    :cond_9
    :goto_6
    if-eqz v10, :cond_a

    .line 480
    :try_start_7
    iget-object v12, p0, Lorg/cybergarage/http/HTTPRequest;->postSocket:Ljava/net/Socket;

    invoke-virtual {v12}, Ljava/net/Socket;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_10

    .line 482
    :cond_a
    :goto_7
    const/4 v12, 0x0

    iput-object v12, p0, Lorg/cybergarage/http/HTTPRequest;->postSocket:Ljava/net/Socket;

    goto :goto_4

    .line 459
    .end local v5    # "e":Ljava/net/SocketException;
    :catch_1
    move-exception v5

    .line 462
    .local v5, "e":Ljava/io/IOException;
    const/16 v12, 0x1f4

    :try_start_8
    invoke-virtual {v6, v12}, Lorg/cybergarage/http/HTTPResponse;->setStatusCode(I)V

    .line 463
    invoke-static {v5}, Lorg/cybergarage/util/Debug;->warning(Ljava/lang/Exception;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 470
    if-nez p3, :cond_7

    .line 472
    :try_start_9
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_7

    .line 474
    :goto_8
    if-eqz v7, :cond_b

    .line 476
    :try_start_a
    invoke-virtual {v10}, Ljava/io/OutputStream;->close()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_8

    .line 478
    :cond_b
    :goto_9
    if-eqz v10, :cond_c

    .line 480
    :try_start_b
    iget-object v12, p0, Lorg/cybergarage/http/HTTPRequest;->postSocket:Ljava/net/Socket;

    invoke-virtual {v12}, Ljava/net/Socket;->close()V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_f

    .line 482
    :cond_c
    :goto_a
    const/4 v12, 0x0

    iput-object v12, p0, Lorg/cybergarage/http/HTTPRequest;->postSocket:Ljava/net/Socket;

    goto :goto_4

    .line 465
    .end local v5    # "e":Ljava/io/IOException;
    :catch_2
    move-exception v5

    .line 466
    .local v5, "e":Ljava/lang/Exception;
    const/16 v12, 0x1f4

    :try_start_c
    invoke-virtual {v6, v12}, Lorg/cybergarage/http/HTTPResponse;->setStatusCode(I)V

    .line 467
    invoke-static {v5}, Lorg/cybergarage/util/Debug;->warning(Ljava/lang/Exception;)V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    .line 470
    if-nez p3, :cond_7

    .line 472
    :try_start_d
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_9

    .line 474
    :goto_b
    if-eqz v7, :cond_d

    .line 476
    :try_start_e
    invoke-virtual {v10}, Ljava/io/OutputStream;->close()V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_a

    .line 478
    :cond_d
    :goto_c
    if-eqz v10, :cond_e

    .line 480
    :try_start_f
    iget-object v12, p0, Lorg/cybergarage/http/HTTPRequest;->postSocket:Ljava/net/Socket;

    invoke-virtual {v12}, Ljava/net/Socket;->close()V
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_e

    .line 482
    :cond_e
    :goto_d
    const/4 v12, 0x0

    iput-object v12, p0, Lorg/cybergarage/http/HTTPRequest;->postSocket:Ljava/net/Socket;

    goto :goto_4

    .line 470
    .end local v5    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v12

    if-nez p3, :cond_11

    .line 472
    :try_start_10
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_b

    .line 474
    :goto_e
    if-eqz v7, :cond_f

    .line 476
    :try_start_11
    invoke-virtual {v10}, Ljava/io/OutputStream;->close()V
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_c

    .line 478
    :cond_f
    :goto_f
    if-eqz v10, :cond_10

    .line 480
    :try_start_12
    iget-object v13, p0, Lorg/cybergarage/http/HTTPRequest;->postSocket:Ljava/net/Socket;

    invoke-virtual {v13}, Ljava/net/Socket;->close()V
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_12} :catch_d

    .line 482
    :cond_10
    :goto_10
    const/4 v13, 0x0

    iput-object v13, p0, Lorg/cybergarage/http/HTTPRequest;->postSocket:Ljava/net/Socket;

    :cond_11
    throw v12

    .line 473
    .restart local v3    # "content":Ljava/lang/String;
    .restart local v4    # "contentLength":I
    .restart local v8    # "isChunkedRequest":Z
    .restart local v11    # "pout":Ljava/io/PrintStream;
    :catch_3
    move-exception v12

    goto/16 :goto_1

    .line 477
    :catch_4
    move-exception v12

    goto/16 :goto_2

    .line 473
    .end local v3    # "content":Ljava/lang/String;
    .end local v4    # "contentLength":I
    .end local v8    # "isChunkedRequest":Z
    .end local v11    # "pout":Ljava/io/PrintStream;
    .local v5, "e":Ljava/net/SocketException;
    :catch_5
    move-exception v12

    goto :goto_5

    .line 477
    :catch_6
    move-exception v12

    goto :goto_6

    .line 473
    .local v5, "e":Ljava/io/IOException;
    :catch_7
    move-exception v12

    goto :goto_8

    .line 477
    :catch_8
    move-exception v12

    goto :goto_9

    .line 473
    .local v5, "e":Ljava/lang/Exception;
    :catch_9
    move-exception v12

    goto :goto_b

    .line 477
    :catch_a
    move-exception v12

    goto :goto_c

    .line 473
    .end local v5    # "e":Ljava/lang/Exception;
    :catch_b
    move-exception v13

    goto :goto_e

    .line 477
    :catch_c
    move-exception v13

    goto :goto_f

    .line 481
    :catch_d
    move-exception v13

    goto :goto_10

    .restart local v5    # "e":Ljava/lang/Exception;
    :catch_e
    move-exception v12

    goto :goto_d

    .local v5, "e":Ljava/io/IOException;
    :catch_f
    move-exception v12

    goto :goto_a

    .local v5, "e":Ljava/net/SocketException;
    :catch_10
    move-exception v12

    goto :goto_7

    .end local v5    # "e":Ljava/net/SocketException;
    .restart local v3    # "content":Ljava/lang/String;
    .restart local v4    # "contentLength":I
    .restart local v8    # "isChunkedRequest":Z
    .restart local v11    # "pout":Ljava/io/PrintStream;
    :catch_11
    move-exception v12

    goto/16 :goto_3
.end method

.method public post(Lorg/cybergarage/http/HTTPResponse;)Z
    .locals 17
    .param p1, "httpRes"    # Lorg/cybergarage/http/HTTPResponse;

    .prologue
    .line 369
    invoke-virtual/range {p0 .. p0}, Lorg/cybergarage/http/HTTPRequest;->getSocket()Lorg/cybergarage/http/HTTPSocket;

    move-result-object v10

    .line 370
    .local v10, "httpSock":Lorg/cybergarage/http/HTTPSocket;
    const-wide/16 v12, 0x0

    .line 371
    .local v12, "offset":J
    invoke-virtual/range {p1 .. p1}, Lorg/cybergarage/http/HTTPResponse;->getContentLength()J

    move-result-wide v8

    .line 372
    .local v8, "length":J
    invoke-virtual/range {p0 .. p0}, Lorg/cybergarage/http/HTTPRequest;->hasContentRange()Z

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_3

    .line 373
    invoke-virtual/range {p0 .. p0}, Lorg/cybergarage/http/HTTPRequest;->getContentRangeFirstPosition()J

    move-result-wide v4

    .line 374
    .local v4, "firstPos":J
    invoke-virtual/range {p0 .. p0}, Lorg/cybergarage/http/HTTPRequest;->getContentRangeLastPosition()J

    move-result-wide v6

    .line 377
    .local v6, "lastPos":J
    const-wide/16 v2, 0x0

    cmp-long v2, v6, v2

    if-gtz v2, :cond_0

    .line 378
    const-wide/16 v2, 0x1

    sub-long v6, v8, v2

    .line 379
    :cond_0
    cmp-long v2, v4, v8

    if-gtz v2, :cond_1

    cmp-long v2, v6, v8

    if-lez v2, :cond_2

    .line 380
    :cond_1
    const/16 v2, 0x1a0

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/cybergarage/http/HTTPRequest;->returnResponse(I)Z

    move-result v2

    .line 387
    .end local v4    # "firstPos":J
    .end local v6    # "lastPos":J
    :goto_0
    return v2

    .restart local v4    # "firstPos":J
    .restart local v6    # "lastPos":J
    :cond_2
    move-object/from16 v3, p1

    .line 381
    invoke-virtual/range {v3 .. v9}, Lorg/cybergarage/http/HTTPResponse;->setContentRange(JJJ)V

    .line 382
    const/16 v2, 0xce

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Lorg/cybergarage/http/HTTPResponse;->setStatusCode(I)V

    .line 384
    move-wide v12, v4

    .line 385
    sub-long v2, v6, v4

    const-wide/16 v14, 0x1

    add-long v8, v2, v14

    .line 387
    .end local v4    # "firstPos":J
    .end local v6    # "lastPos":J
    :cond_3
    invoke-virtual/range {p0 .. p0}, Lorg/cybergarage/http/HTTPRequest;->isHeadRequest()Z

    move-result v16

    move-object/from16 v11, p1

    move-wide v14, v8

    invoke-virtual/range {v10 .. v16}, Lorg/cybergarage/http/HTTPSocket;->post(Lorg/cybergarage/http/HTTPResponse;JJZ)Z

    move-result v2

    goto :goto_0
.end method

.method public print()V
    .locals 2

    .prologue
    .line 550
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {p0}, Lorg/cybergarage/http/HTTPRequest;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 551
    return-void
.end method

.method public read()Z
    .locals 1

    .prologue
    .line 360
    invoke-virtual {p0}, Lorg/cybergarage/http/HTTPRequest;->getSocket()Lorg/cybergarage/http/HTTPSocket;

    move-result-object v0

    invoke-super {p0, v0}, Lorg/cybergarage/http/HTTPPacket;->read(Lorg/cybergarage/http/HTTPSocket;)Z

    move-result v0

    return v0
.end method

.method public returnBadRequest()Z
    .locals 1

    .prologue
    .line 530
    const/16 v0, 0x190

    invoke-virtual {p0, v0}, Lorg/cybergarage/http/HTTPRequest;->returnResponse(I)Z

    move-result v0

    return v0
.end method

.method public returnOK()Z
    .locals 1

    .prologue
    .line 525
    const/16 v0, 0xc8

    invoke-virtual {p0, v0}, Lorg/cybergarage/http/HTTPRequest;->returnResponse(I)Z

    move-result v0

    return v0
.end method

.method public returnResponse(I)Z
    .locals 4
    .param p1, "statusCode"    # I

    .prologue
    .line 517
    new-instance v0, Lorg/cybergarage/http/HTTPResponse;

    invoke-direct {v0}, Lorg/cybergarage/http/HTTPResponse;-><init>()V

    .line 518
    .local v0, "httpRes":Lorg/cybergarage/http/HTTPResponse;
    invoke-virtual {v0, p1}, Lorg/cybergarage/http/HTTPResponse;->setStatusCode(I)V

    .line 519
    const-wide/16 v2, 0x0

    invoke-virtual {v0, v2, v3}, Lorg/cybergarage/http/HTTPResponse;->setContentLength(J)V

    .line 520
    invoke-virtual {p0, v0}, Lorg/cybergarage/http/HTTPRequest;->post(Lorg/cybergarage/http/HTTPResponse;)Z

    move-result v1

    return v1
.end method

.method public set(Lorg/cybergarage/http/HTTPRequest;)V
    .locals 1
    .param p1, "httpReq"    # Lorg/cybergarage/http/HTTPRequest;

    .prologue
    .line 507
    invoke-virtual {p0, p1}, Lorg/cybergarage/http/HTTPRequest;->set(Lorg/cybergarage/http/HTTPPacket;)V

    .line 508
    invoke-virtual {p1}, Lorg/cybergarage/http/HTTPRequest;->getSocket()Lorg/cybergarage/http/HTTPSocket;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/cybergarage/http/HTTPRequest;->setSocket(Lorg/cybergarage/http/HTTPSocket;)V

    .line 509
    return-void
.end method

.method public setMethod(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 112
    iput-object p1, p0, Lorg/cybergarage/http/HTTPRequest;->method:Ljava/lang/String;

    .line 113
    return-void
.end method

.method public setRequestHost(Ljava/lang/String;)V
    .locals 0
    .param p1, "host"    # Ljava/lang/String;

    .prologue
    .line 236
    iput-object p1, p0, Lorg/cybergarage/http/HTTPRequest;->requestHost:Ljava/lang/String;

    .line 237
    return-void
.end method

.method public setRequestPort(I)V
    .locals 0
    .param p1, "host"    # I

    .prologue
    .line 248
    iput p1, p0, Lorg/cybergarage/http/HTTPRequest;->requestPort:I

    .line 249
    return-void
.end method

.method public setSocket(Lorg/cybergarage/http/HTTPSocket;)V
    .locals 0
    .param p1, "value"    # Lorg/cybergarage/http/HTTPSocket;

    .prologue
    .line 264
    iput-object p1, p0, Lorg/cybergarage/http/HTTPRequest;->httpSocket:Lorg/cybergarage/http/HTTPSocket;

    .line 265
    return-void
.end method

.method public setURI(Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 177
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/cybergarage/http/HTTPRequest;->setURI(Ljava/lang/String;Z)V

    .line 178
    return-void
.end method

.method public setURI(Ljava/lang/String;Z)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "isCheckRelativeURL"    # Z

    .prologue
    .line 168
    iput-object p1, p0, Lorg/cybergarage/http/HTTPRequest;->uri:Ljava/lang/String;

    .line 169
    if-nez p2, :cond_0

    .line 173
    :goto_0
    return-void

    .line 172
    :cond_0
    iget-object v0, p0, Lorg/cybergarage/http/HTTPRequest;->uri:Ljava/lang/String;

    invoke-static {v0}, Lorg/cybergarage/http/HTTP;->toRelativeURL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/cybergarage/http/HTTPRequest;->uri:Ljava/lang/String;

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 539
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 541
    .local v0, "str":Ljava/lang/StringBuffer;
    invoke-virtual {p0}, Lorg/cybergarage/http/HTTPRequest;->getHeader()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 542
    const-string v1, "\r\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 543
    invoke-virtual {p0}, Lorg/cybergarage/http/HTTPRequest;->getContentString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 545
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
