.class public Lorg/cybergarage/http/HTTPSocket;
.super Ljava/lang/Object;
.source "HTTPSocket.java"


# instance fields
.field private sockIn:Ljava/io/InputStream;

.field private sockOut:Ljava/io/OutputStream;

.field private socket:Ljava/net/Socket;


# direct methods
.method public constructor <init>(Ljava/net/Socket;)V
    .locals 1
    .param p1, "socket"    # Ljava/net/Socket;

    .prologue
    const/4 v0, 0x0

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    iput-object v0, p0, Lorg/cybergarage/http/HTTPSocket;->socket:Ljava/net/Socket;

    .line 93
    iput-object v0, p0, Lorg/cybergarage/http/HTTPSocket;->sockIn:Ljava/io/InputStream;

    .line 94
    iput-object v0, p0, Lorg/cybergarage/http/HTTPSocket;->sockOut:Ljava/io/OutputStream;

    .line 43
    invoke-direct {p0, p1}, Lorg/cybergarage/http/HTTPSocket;->setSocket(Ljava/net/Socket;)V

    .line 44
    invoke-virtual {p0}, Lorg/cybergarage/http/HTTPSocket;->open()Z

    .line 45
    return-void
.end method

.method public constructor <init>(Lorg/cybergarage/http/HTTPSocket;)V
    .locals 1
    .param p1, "socket"    # Lorg/cybergarage/http/HTTPSocket;

    .prologue
    const/4 v0, 0x0

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    iput-object v0, p0, Lorg/cybergarage/http/HTTPSocket;->socket:Ljava/net/Socket;

    .line 93
    iput-object v0, p0, Lorg/cybergarage/http/HTTPSocket;->sockIn:Ljava/io/InputStream;

    .line 94
    iput-object v0, p0, Lorg/cybergarage/http/HTTPSocket;->sockOut:Ljava/io/OutputStream;

    .line 49
    invoke-virtual {p1}, Lorg/cybergarage/http/HTTPSocket;->getSocket()Ljava/net/Socket;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/cybergarage/http/HTTPSocket;->setSocket(Ljava/net/Socket;)V

    .line 50
    invoke-virtual {p1}, Lorg/cybergarage/http/HTTPSocket;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/cybergarage/http/HTTPSocket;->setInputStream(Ljava/io/InputStream;)V

    .line 51
    invoke-direct {p1}, Lorg/cybergarage/http/HTTPSocket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/cybergarage/http/HTTPSocket;->setOutputStream(Ljava/io/OutputStream;)V

    .line 52
    return-void
.end method

.method private getOutputStream()Ljava/io/OutputStream;
    .locals 1

    .prologue
    .line 113
    iget-object v0, p0, Lorg/cybergarage/http/HTTPSocket;->sockOut:Ljava/io/OutputStream;

    return-object v0
.end method

.method private post(Lorg/cybergarage/http/HTTPResponse;Ljava/io/InputStream;JJZ)Z
    .locals 21
    .param p1, "httpRes"    # Lorg/cybergarage/http/HTTPResponse;
    .param p2, "in"    # Ljava/io/InputStream;
    .param p3, "contentOffset"    # J
    .param p5, "contentLength"    # J
    .param p7, "isOnlyHeader"    # Z

    .prologue
    .line 201
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v13

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Lorg/cybergarage/http/HTTPResponse;->setDate(Ljava/util/Calendar;)V

    .line 203
    invoke-direct/range {p0 .. p0}, Lorg/cybergarage/http/HTTPSocket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v8

    .line 206
    .local v8, "out":Ljava/io/OutputStream;
    :try_start_0
    move-object/from16 v0, p1

    move-wide/from16 v1, p5

    invoke-virtual {v0, v1, v2}, Lorg/cybergarage/http/HTTPResponse;->setContentLength(J)V

    .line 208
    invoke-virtual/range {p1 .. p1}, Lorg/cybergarage/http/HTTPResponse;->getHeader()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/String;->getBytes()[B

    move-result-object v13

    invoke-virtual {v8, v13}, Ljava/io/OutputStream;->write([B)V

    .line 209
    const-string v13, "\r\n"

    invoke-virtual {v13}, Ljava/lang/String;->getBytes()[B

    move-result-object v13

    invoke-virtual {v8, v13}, Ljava/io/OutputStream;->write([B)V

    .line 211
    const/4 v13, 0x1

    move/from16 v0, p7

    if-ne v0, v13, :cond_0

    .line 212
    invoke-virtual {v8}, Ljava/io/OutputStream;->flush()V

    .line 213
    const/4 v13, 0x1

    .line 253
    :goto_0
    return v13

    .line 216
    :cond_0
    invoke-virtual/range {p1 .. p1}, Lorg/cybergarage/http/HTTPResponse;->isChunked()Z

    move-result v7

    .line 218
    .local v7, "isChunkedResponse":Z
    const-wide/16 v16, 0x0

    cmp-long v13, v16, p3

    if-gez v13, :cond_1

    .line 219
    invoke-virtual/range {p2 .. p4}, Ljava/io/InputStream;->skip(J)J

    .line 221
    :cond_1
    invoke-static {}, Lorg/cybergarage/http/HTTP;->getChunkSize()I

    move-result v5

    .line 222
    .local v5, "chunkSize":I
    new-array v9, v5, [B

    .line 223
    .local v9, "readBuf":[B
    const-wide/16 v10, 0x0

    .line 224
    .local v10, "readCnt":J
    int-to-long v0, v5

    move-wide/from16 v16, v0

    cmp-long v13, v16, p5

    if-gez v13, :cond_4

    int-to-long v14, v5

    .line 225
    .local v14, "readSize":J
    :goto_1
    const/4 v13, 0x0

    long-to-int v0, v14

    move/from16 v16, v0

    move-object/from16 v0, p2

    move/from16 v1, v16

    invoke-virtual {v0, v9, v13, v1}, Ljava/io/InputStream;->read([BII)I

    move-result v12

    .line 226
    .local v12, "readLen":I
    :goto_2
    if-lez v12, :cond_6

    cmp-long v13, v10, p5

    if-gez v13, :cond_6

    .line 227
    const/4 v13, 0x1

    if-ne v7, v13, :cond_2

    .line 229
    int-to-long v0, v12

    move-wide/from16 v16, v0

    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    move-result-object v4

    .line 230
    .local v4, "chunSizeBuf":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->getBytes()[B

    move-result-object v13

    invoke-virtual {v8, v13}, Ljava/io/OutputStream;->write([B)V

    .line 231
    const-string v13, "\r\n"

    invoke-virtual {v13}, Ljava/lang/String;->getBytes()[B

    move-result-object v13

    invoke-virtual {v8, v13}, Ljava/io/OutputStream;->write([B)V

    .line 233
    .end local v4    # "chunSizeBuf":Ljava/lang/String;
    :cond_2
    const/4 v13, 0x0

    invoke-virtual {v8, v9, v13, v12}, Ljava/io/OutputStream;->write([BII)V

    .line 234
    const/4 v13, 0x1

    if-ne v7, v13, :cond_3

    .line 235
    const-string v13, "\r\n"

    invoke-virtual {v13}, Ljava/lang/String;->getBytes()[B

    move-result-object v13

    invoke-virtual {v8, v13}, Ljava/io/OutputStream;->write([B)V

    .line 236
    :cond_3
    int-to-long v0, v12

    move-wide/from16 v16, v0

    add-long v10, v10, v16

    .line 237
    int-to-long v0, v5

    move-wide/from16 v16, v0

    sub-long v18, p5, v10

    cmp-long v13, v16, v18

    if-gez v13, :cond_5

    int-to-long v14, v5

    .line 238
    :goto_3
    const/4 v13, 0x0

    long-to-int v0, v14

    move/from16 v16, v0

    move-object/from16 v0, p2

    move/from16 v1, v16

    invoke-virtual {v0, v9, v13, v1}, Ljava/io/InputStream;->read([BII)I

    move-result v12

    goto :goto_2

    .end local v12    # "readLen":I
    .end local v14    # "readSize":J
    :cond_4
    move-wide/from16 v14, p5

    .line 224
    goto :goto_1

    .line 237
    .restart local v12    # "readLen":I
    .restart local v14    # "readSize":J
    :cond_5
    sub-long v14, p5, v10

    goto :goto_3

    .line 241
    :cond_6
    const/4 v13, 0x1

    if-ne v7, v13, :cond_7

    .line 242
    const-string v13, "0"

    invoke-virtual {v13}, Ljava/lang/String;->getBytes()[B

    move-result-object v13

    invoke-virtual {v8, v13}, Ljava/io/OutputStream;->write([B)V

    .line 243
    const-string v13, "\r\n"

    invoke-virtual {v13}, Ljava/lang/String;->getBytes()[B

    move-result-object v13

    invoke-virtual {v8, v13}, Ljava/io/OutputStream;->write([B)V

    .line 246
    :cond_7
    invoke-virtual {v8}, Ljava/io/OutputStream;->flush()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 253
    const/4 v13, 0x1

    goto/16 :goto_0

    .line 248
    .end local v5    # "chunkSize":I
    .end local v7    # "isChunkedResponse":Z
    .end local v9    # "readBuf":[B
    .end local v10    # "readCnt":J
    .end local v12    # "readLen":I
    .end local v14    # "readSize":J
    :catch_0
    move-exception v6

    .line 250
    .local v6, "e":Ljava/lang/Exception;
    const/4 v13, 0x0

    goto/16 :goto_0
.end method

.method private post(Lorg/cybergarage/http/HTTPResponse;[BJJZ)Z
    .locals 7
    .param p1, "httpRes"    # Lorg/cybergarage/http/HTTPResponse;
    .param p2, "content"    # [B
    .param p3, "contentOffset"    # J
    .param p5, "contentLength"    # J
    .param p7, "isOnlyHeader"    # Z

    .prologue
    const/4 v4, 0x1

    .line 157
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v5

    invoke-virtual {p1, v5}, Lorg/cybergarage/http/HTTPResponse;->setDate(Ljava/util/Calendar;)V

    .line 159
    invoke-direct {p0}, Lorg/cybergarage/http/HTTPSocket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v3

    .line 162
    .local v3, "out":Ljava/io/OutputStream;
    :try_start_0
    invoke-virtual {p1, p5, p6}, Lorg/cybergarage/http/HTTPResponse;->setContentLength(J)V

    .line 164
    invoke-virtual {p1}, Lorg/cybergarage/http/HTTPResponse;->getHeader()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/io/OutputStream;->write([B)V

    .line 165
    const-string v5, "\r\n"

    invoke-virtual {v5}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/io/OutputStream;->write([B)V

    .line 166
    if-ne p7, v4, :cond_0

    .line 167
    invoke-virtual {v3}, Ljava/io/OutputStream;->flush()V

    .line 195
    :goto_0
    return v4

    .line 171
    :cond_0
    invoke-virtual {p1}, Lorg/cybergarage/http/HTTPResponse;->isChunked()Z

    move-result v2

    .line 173
    .local v2, "isChunkedResponse":Z
    if-ne v2, v4, :cond_1

    .line 175
    invoke-static {p5, p6}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    move-result-object v0

    .line 176
    .local v0, "chunSizeBuf":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/io/OutputStream;->write([B)V

    .line 177
    const-string v5, "\r\n"

    invoke-virtual {v5}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/io/OutputStream;->write([B)V

    .line 180
    .end local v0    # "chunSizeBuf":Ljava/lang/String;
    :cond_1
    long-to-int v5, p3

    long-to-int v6, p5

    invoke-virtual {v3, p2, v5, v6}, Ljava/io/OutputStream;->write([BII)V

    .line 182
    if-ne v2, v4, :cond_2

    .line 183
    const-string v5, "\r\n"

    invoke-virtual {v5}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/io/OutputStream;->write([B)V

    .line 184
    const-string v5, "0"

    invoke-virtual {v5}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/io/OutputStream;->write([B)V

    .line 185
    const-string v5, "\r\n"

    invoke-virtual {v5}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/io/OutputStream;->write([B)V

    .line 188
    :cond_2
    invoke-virtual {v3}, Ljava/io/OutputStream;->flush()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 190
    .end local v2    # "isChunkedResponse":Z
    :catch_0
    move-exception v1

    .line 192
    .local v1, "e":Ljava/lang/Exception;
    const/4 v4, 0x0

    goto :goto_0
.end method

.method private setInputStream(Ljava/io/InputStream;)V
    .locals 0
    .param p1, "in"    # Ljava/io/InputStream;

    .prologue
    .line 98
    iput-object p1, p0, Lorg/cybergarage/http/HTTPSocket;->sockIn:Ljava/io/InputStream;

    .line 99
    return-void
.end method

.method private setOutputStream(Ljava/io/OutputStream;)V
    .locals 0
    .param p1, "out"    # Ljava/io/OutputStream;

    .prologue
    .line 108
    iput-object p1, p0, Lorg/cybergarage/http/HTTPSocket;->sockOut:Ljava/io/OutputStream;

    .line 109
    return-void
.end method

.method private setSocket(Ljava/net/Socket;)V
    .locals 0
    .param p1, "socket"    # Ljava/net/Socket;

    .prologue
    .line 67
    iput-object p1, p0, Lorg/cybergarage/http/HTTPSocket;->socket:Ljava/net/Socket;

    .line 68
    return-void
.end method


# virtual methods
.method public close()Z
    .locals 2

    .prologue
    .line 137
    :try_start_0
    iget-object v1, p0, Lorg/cybergarage/http/HTTPSocket;->sockIn:Ljava/io/InputStream;

    if-eqz v1, :cond_0

    .line 138
    iget-object v1, p0, Lorg/cybergarage/http/HTTPSocket;->sockIn:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 139
    :cond_0
    iget-object v1, p0, Lorg/cybergarage/http/HTTPSocket;->sockOut:Ljava/io/OutputStream;

    if-eqz v1, :cond_1

    .line 140
    iget-object v1, p0, Lorg/cybergarage/http/HTTPSocket;->sockOut:Ljava/io/OutputStream;

    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    .line 141
    :cond_1
    invoke-virtual {p0}, Lorg/cybergarage/http/HTTPSocket;->getSocket()Ljava/net/Socket;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/Socket;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 147
    const/4 v1, 0x1

    :goto_0
    return v1

    .line 143
    :catch_0
    move-exception v0

    .line 145
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public finalize()V
    .locals 0

    .prologue
    .line 56
    invoke-virtual {p0}, Lorg/cybergarage/http/HTTPSocket;->close()Z

    .line 57
    return-void
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 1

    .prologue
    .line 103
    iget-object v0, p0, Lorg/cybergarage/http/HTTPSocket;->sockIn:Ljava/io/InputStream;

    return-object v0
.end method

.method public getLocalAddress()Ljava/lang/String;
    .locals 1

    .prologue
    .line 81
    invoke-virtual {p0}, Lorg/cybergarage/http/HTTPSocket;->getSocket()Ljava/net/Socket;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/Socket;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLocalPort()I
    .locals 1

    .prologue
    .line 86
    invoke-virtual {p0}, Lorg/cybergarage/http/HTTPSocket;->getSocket()Ljava/net/Socket;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/Socket;->getLocalPort()I

    move-result v0

    return v0
.end method

.method public getSocket()Ljava/net/Socket;
    .locals 1

    .prologue
    .line 72
    iget-object v0, p0, Lorg/cybergarage/http/HTTPSocket;->socket:Ljava/net/Socket;

    return-object v0
.end method

.method public open()Z
    .locals 3

    .prologue
    .line 122
    invoke-virtual {p0}, Lorg/cybergarage/http/HTTPSocket;->getSocket()Ljava/net/Socket;

    move-result-object v1

    .line 124
    .local v1, "sock":Ljava/net/Socket;
    :try_start_0
    invoke-virtual {v1}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    iput-object v2, p0, Lorg/cybergarage/http/HTTPSocket;->sockIn:Ljava/io/InputStream;

    .line 125
    invoke-virtual {v1}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v2

    iput-object v2, p0, Lorg/cybergarage/http/HTTPSocket;->sockOut:Ljava/io/OutputStream;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 131
    const/4 v2, 0x1

    :goto_0
    return v2

    .line 127
    :catch_0
    move-exception v0

    .line 129
    .local v0, "e":Ljava/lang/Exception;
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public post(Lorg/cybergarage/http/HTTPResponse;JJZ)Z
    .locals 10
    .param p1, "httpRes"    # Lorg/cybergarage/http/HTTPResponse;
    .param p2, "contentOffset"    # J
    .param p4, "contentLength"    # J
    .param p6, "isOnlyHeader"    # Z

    .prologue
    .line 259
    invoke-virtual {p1}, Lorg/cybergarage/http/HTTPResponse;->hasContentInputStream()Z

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 260
    invoke-virtual {p1}, Lorg/cybergarage/http/HTTPResponse;->getContentInputStream()Ljava/io/InputStream;

    move-result-object v3

    move-object v1, p0

    move-object v2, p1

    move-wide v4, p2

    move-wide v6, p4

    move/from16 v8, p6

    invoke-direct/range {v1 .. v8}, Lorg/cybergarage/http/HTTPSocket;->post(Lorg/cybergarage/http/HTTPResponse;Ljava/io/InputStream;JJZ)Z

    move-result v0

    .line 261
    :goto_0
    return v0

    :cond_0
    invoke-virtual {p1}, Lorg/cybergarage/http/HTTPResponse;->getContent()[B

    move-result-object v3

    move-object v1, p0

    move-object v2, p1

    move-wide v4, p2

    move-wide v6, p4

    move/from16 v8, p6

    invoke-direct/range {v1 .. v8}, Lorg/cybergarage/http/HTTPSocket;->post(Lorg/cybergarage/http/HTTPResponse;[BJJZ)Z

    move-result v0

    goto :goto_0
.end method
