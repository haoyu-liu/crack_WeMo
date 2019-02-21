.class public Lorg/cybergarage/http/HTTPServer;
.super Ljava/lang/Object;
.source "HTTPServer.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field public static final DEFAULT_PORT:I = 0x50

.field public static final DEFAULT_TIMEOUT:I = 0x1770

.field public static final NAME:Ljava/lang/String; = "CyberHTTP"

.field public static final VERSION:Ljava/lang/String; = "1.0"


# instance fields
.field private bindAddr:Ljava/net/InetAddress;

.field private bindPort:I

.field private httpRequestListenerList:Lorg/cybergarage/util/ListenerList;

.field private httpServerThread:Ljava/lang/Thread;

.field private serverSock:Ljava/net/ServerSocket;

.field protected timeout:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    iput-object v1, p0, Lorg/cybergarage/http/HTTPServer;->serverSock:Ljava/net/ServerSocket;

    .line 83
    iput-object v1, p0, Lorg/cybergarage/http/HTTPServer;->bindAddr:Ljava/net/InetAddress;

    .line 84
    const/4 v0, 0x0

    iput v0, p0, Lorg/cybergarage/http/HTTPServer;->bindPort:I

    .line 89
    const/16 v0, 0x1770

    iput v0, p0, Lorg/cybergarage/http/HTTPServer;->timeout:I

    .line 197
    new-instance v0, Lorg/cybergarage/util/ListenerList;

    invoke-direct {v0}, Lorg/cybergarage/util/ListenerList;-><init>()V

    iput-object v0, p0, Lorg/cybergarage/http/HTTPServer;->httpRequestListenerList:Lorg/cybergarage/util/ListenerList;

    .line 222
    iput-object v1, p0, Lorg/cybergarage/http/HTTPServer;->httpServerThread:Ljava/lang/Thread;

    .line 74
    iput-object v1, p0, Lorg/cybergarage/http/HTTPServer;->serverSock:Ljava/net/ServerSocket;

    .line 76
    return-void
.end method

.method public static getName()Ljava/lang/String;
    .locals 4

    .prologue
    .line 63
    const-string v2, "os.name"

    invoke-static {v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 64
    .local v0, "osName":Ljava/lang/String;
    const-string v2, "os.version"

    invoke-static {v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 65
    .local v1, "osVer":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "CyberHTTP"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "1.0"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method


# virtual methods
.method public accept()Ljava/net/Socket;
    .locals 4

    .prologue
    const/4 v2, 0x0

    .line 176
    iget-object v3, p0, Lorg/cybergarage/http/HTTPServer;->serverSock:Ljava/net/ServerSocket;

    if-nez v3, :cond_0

    move-object v1, v2

    .line 184
    :goto_0
    return-object v1

    .line 179
    :cond_0
    :try_start_0
    iget-object v3, p0, Lorg/cybergarage/http/HTTPServer;->serverSock:Ljava/net/ServerSocket;

    invoke-virtual {v3}, Ljava/net/ServerSocket;->accept()Ljava/net/Socket;

    move-result-object v1

    .line 180
    .local v1, "sock":Ljava/net/Socket;
    invoke-virtual {p0}, Lorg/cybergarage/http/HTTPServer;->getTimeout()I

    move-result v3

    invoke-virtual {v1, v3}, Ljava/net/Socket;->setSoTimeout(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 183
    .end local v1    # "sock":Ljava/net/Socket;
    :catch_0
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    move-object v1, v2

    .line 184
    goto :goto_0
.end method

.method public addRequestListener(Lorg/cybergarage/http/HTTPRequestListener;)V
    .locals 1
    .param p1, "listener"    # Lorg/cybergarage/http/HTTPRequestListener;

    .prologue
    .line 201
    iget-object v0, p0, Lorg/cybergarage/http/HTTPServer;->httpRequestListenerList:Lorg/cybergarage/util/ListenerList;

    invoke-virtual {v0, p1}, Lorg/cybergarage/util/ListenerList;->add(Ljava/lang/Object;)Z

    .line 202
    return-void
.end method

.method public close()Z
    .locals 4

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 159
    iget-object v3, p0, Lorg/cybergarage/http/HTTPServer;->serverSock:Ljava/net/ServerSocket;

    if-nez v3, :cond_0

    .line 171
    :goto_0
    return v1

    .line 162
    :cond_0
    :try_start_0
    iget-object v3, p0, Lorg/cybergarage/http/HTTPServer;->serverSock:Ljava/net/ServerSocket;

    invoke-virtual {v3}, Ljava/net/ServerSocket;->close()V

    .line 163
    const/4 v3, 0x0

    iput-object v3, p0, Lorg/cybergarage/http/HTTPServer;->serverSock:Ljava/net/ServerSocket;

    .line 164
    const/4 v3, 0x0

    iput-object v3, p0, Lorg/cybergarage/http/HTTPServer;->bindAddr:Ljava/net/InetAddress;

    .line 165
    const/4 v3, 0x0

    iput v3, p0, Lorg/cybergarage/http/HTTPServer;->bindPort:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 167
    :catch_0
    move-exception v0

    .line 168
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {v0}, Lorg/cybergarage/util/Debug;->warning(Ljava/lang/Exception;)V

    move v1, v2

    .line 169
    goto :goto_0
.end method

.method public getBindAddress()Ljava/lang/String;
    .locals 1

    .prologue
    .line 98
    iget-object v0, p0, Lorg/cybergarage/http/HTTPServer;->bindAddr:Ljava/net/InetAddress;

    if-nez v0, :cond_0

    .line 99
    const-string v0, ""

    .line 100
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/cybergarage/http/HTTPServer;->bindAddr:Ljava/net/InetAddress;

    invoke-virtual {v0}, Ljava/net/InetAddress;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getBindPort()I
    .locals 1

    .prologue
    .line 105
    iget v0, p0, Lorg/cybergarage/http/HTTPServer;->bindPort:I

    return v0
.end method

.method public getServerSock()Ljava/net/ServerSocket;
    .locals 1

    .prologue
    .line 93
    iget-object v0, p0, Lorg/cybergarage/http/HTTPServer;->serverSock:Ljava/net/ServerSocket;

    return-object v0
.end method

.method public declared-synchronized getTimeout()I
    .locals 1

    .prologue
    .line 119
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lorg/cybergarage/http/HTTPServer;->timeout:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public isOpened()Z
    .locals 1

    .prologue
    .line 190
    iget-object v0, p0, Lorg/cybergarage/http/HTTPServer;->serverSock:Ljava/net/ServerSocket;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public open(Ljava/lang/String;I)Z
    .locals 7
    .param p1, "addr"    # Ljava/lang/String;
    .param p2, "port"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 144
    iget-object v3, p0, Lorg/cybergarage/http/HTTPServer;->serverSock:Ljava/net/ServerSocket;

    if-eqz v3, :cond_0

    .line 154
    :goto_0
    return v1

    .line 147
    :cond_0
    :try_start_0
    invoke-static {p1}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v3

    iput-object v3, p0, Lorg/cybergarage/http/HTTPServer;->bindAddr:Ljava/net/InetAddress;

    .line 148
    iput p2, p0, Lorg/cybergarage/http/HTTPServer;->bindPort:I

    .line 149
    new-instance v3, Ljava/net/ServerSocket;

    iget v4, p0, Lorg/cybergarage/http/HTTPServer;->bindPort:I

    const/4 v5, 0x0

    iget-object v6, p0, Lorg/cybergarage/http/HTTPServer;->bindAddr:Ljava/net/InetAddress;

    invoke-direct {v3, v4, v5, v6}, Ljava/net/ServerSocket;-><init>(IILjava/net/InetAddress;)V

    iput-object v3, p0, Lorg/cybergarage/http/HTTPServer;->serverSock:Ljava/net/ServerSocket;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 151
    :catch_0
    move-exception v0

    .local v0, "e":Ljava/io/IOException;
    move v1, v2

    .line 152
    goto :goto_0
.end method

.method public open(Ljava/net/InetAddress;I)Z
    .locals 7
    .param p1, "addr"    # Ljava/net/InetAddress;
    .param p2, "port"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 132
    iget-object v3, p0, Lorg/cybergarage/http/HTTPServer;->serverSock:Ljava/net/ServerSocket;

    if-eqz v3, :cond_0

    .line 139
    :goto_0
    return v1

    .line 135
    :cond_0
    :try_start_0
    new-instance v3, Ljava/net/ServerSocket;

    iget v4, p0, Lorg/cybergarage/http/HTTPServer;->bindPort:I

    const/4 v5, 0x0

    iget-object v6, p0, Lorg/cybergarage/http/HTTPServer;->bindAddr:Ljava/net/InetAddress;

    invoke-direct {v3, v4, v5, v6}, Ljava/net/ServerSocket;-><init>(IILjava/net/InetAddress;)V

    iput-object v3, p0, Lorg/cybergarage/http/HTTPServer;->serverSock:Ljava/net/ServerSocket;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 136
    :catch_0
    move-exception v0

    .local v0, "e":Ljava/io/IOException;
    move v1, v2

    .line 137
    goto :goto_0
.end method

.method public performRequestListener(Lorg/cybergarage/http/HTTPRequest;)V
    .locals 4
    .param p1, "httpReq"    # Lorg/cybergarage/http/HTTPRequest;

    .prologue
    .line 211
    iget-object v3, p0, Lorg/cybergarage/http/HTTPServer;->httpRequestListenerList:Lorg/cybergarage/util/ListenerList;

    invoke-virtual {v3}, Lorg/cybergarage/util/ListenerList;->size()I

    move-result v1

    .line 212
    .local v1, "listenerSize":I
    const/4 v2, 0x0

    .local v2, "n":I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 213
    iget-object v3, p0, Lorg/cybergarage/http/HTTPServer;->httpRequestListenerList:Lorg/cybergarage/util/ListenerList;

    invoke-virtual {v3, v2}, Lorg/cybergarage/util/ListenerList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/cybergarage/http/HTTPRequestListener;

    .line 214
    .local v0, "listener":Lorg/cybergarage/http/HTTPRequestListener;
    invoke-interface {v0, p1}, Lorg/cybergarage/http/HTTPRequestListener;->httpRequestRecieved(Lorg/cybergarage/http/HTTPRequest;)V

    .line 212
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 216
    .end local v0    # "listener":Lorg/cybergarage/http/HTTPRequestListener;
    :cond_0
    return-void
.end method

.method public removeRequestListener(Lorg/cybergarage/http/HTTPRequestListener;)V
    .locals 1
    .param p1, "listener"    # Lorg/cybergarage/http/HTTPRequestListener;

    .prologue
    .line 206
    iget-object v0, p0, Lorg/cybergarage/http/HTTPServer;->httpRequestListenerList:Lorg/cybergarage/util/ListenerList;

    invoke-virtual {v0, p1}, Lorg/cybergarage/util/ListenerList;->remove(Ljava/lang/Object;)Z

    .line 207
    return-void
.end method

.method public run()V
    .locals 6

    .prologue
    .line 226
    invoke-virtual {p0}, Lorg/cybergarage/http/HTTPServer;->isOpened()Z

    move-result v4

    if-nez v4, :cond_1

    .line 248
    :cond_0
    :goto_0
    return-void

    .line 229
    :cond_1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    .line 231
    .local v3, "thisThread":Ljava/lang/Thread;
    :goto_1
    iget-object v4, p0, Lorg/cybergarage/http/HTTPServer;->httpServerThread:Ljava/lang/Thread;

    if-ne v4, v3, :cond_0

    .line 232
    invoke-static {}, Ljava/lang/Thread;->yield()V

    .line 235
    :try_start_0
    const-string v4, "accept ..."

    invoke-static {v4}, Lorg/cybergarage/util/Debug;->message(Ljava/lang/String;)V

    .line 236
    invoke-virtual {p0}, Lorg/cybergarage/http/HTTPServer;->accept()Ljava/net/Socket;

    move-result-object v2

    .line 237
    .local v2, "sock":Ljava/net/Socket;
    if-eqz v2, :cond_2

    .line 238
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "sock = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Ljava/net/Socket;->getRemoteSocketAddress()Ljava/net/SocketAddress;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lorg/cybergarage/util/Debug;->message(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 244
    :cond_2
    new-instance v1, Lorg/cybergarage/http/HTTPServerThread;

    invoke-direct {v1, p0, v2}, Lorg/cybergarage/http/HTTPServerThread;-><init>(Lorg/cybergarage/http/HTTPServer;Ljava/net/Socket;)V

    .line 245
    .local v1, "httpServThread":Lorg/cybergarage/http/HTTPServerThread;
    invoke-virtual {v1}, Lorg/cybergarage/http/HTTPServerThread;->start()V

    .line 246
    const-string v4, "httpServThread ..."

    invoke-static {v4}, Lorg/cybergarage/util/Debug;->message(Ljava/lang/String;)V

    goto :goto_1

    .line 240
    .end local v1    # "httpServThread":Lorg/cybergarage/http/HTTPServerThread;
    .end local v2    # "sock":Ljava/net/Socket;
    :catch_0
    move-exception v0

    .line 241
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {v0}, Lorg/cybergarage/util/Debug;->warning(Ljava/lang/Exception;)V

    goto :goto_0
.end method

.method public declared-synchronized setTimeout(I)V
    .locals 1
    .param p1, "timeout"    # I

    .prologue
    .line 128
    monitor-enter p0

    :try_start_0
    iput p1, p0, Lorg/cybergarage/http/HTTPServer;->timeout:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 129
    monitor-exit p0

    return-void

    .line 128
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public start()Z
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 251
    new-instance v1, Ljava/lang/StringBuffer;

    const-string v2, "Cyber.HTTPServer/"

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 252
    .local v1, "name":Ljava/lang/StringBuffer;
    iget-object v2, p0, Lorg/cybergarage/http/HTTPServer;->bindAddr:Ljava/net/InetAddress;

    invoke-virtual {v2}, Ljava/net/InetAddress;->toString()Ljava/lang/String;

    move-result-object v0

    .line 254
    .local v0, "bindAddressStr":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v0, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 255
    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 256
    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 257
    iget v2, p0, Lorg/cybergarage/http/HTTPServer;->bindPort:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 259
    new-instance v2, Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, p0, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    iput-object v2, p0, Lorg/cybergarage/http/HTTPServer;->httpServerThread:Ljava/lang/Thread;

    .line 261
    const-string v2, "Discovery"

    const-string v3, "inside start new thread"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 262
    iget-object v2, p0, Lorg/cybergarage/http/HTTPServer;->httpServerThread:Ljava/lang/Thread;

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 263
    const-string v2, "Discovery"

    const-string v3, "inside start new thread start"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 264
    return v4
.end method

.method public stop()Z
    .locals 1

    .prologue
    .line 269
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/cybergarage/http/HTTPServer;->httpServerThread:Ljava/lang/Thread;

    .line 270
    const/4 v0, 0x1

    return v0
.end method
