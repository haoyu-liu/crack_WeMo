.class public Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;
.super Lorg/cybergarage/upnp/ssdp/HTTPMUSocket;
.source "SSDPNotifySocket.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket$1;,
        Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket$NotifyResponsePacketProcessor;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private controlPoint:Lorg/cybergarage/upnp/ControlPoint;

.field private deviceNotifyThread:Ljava/lang/Thread;

.field private useIPv6Address:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 60
    const-class v0, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 4
    .param p1, "bindAddr"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 67
    invoke-direct {p0}, Lorg/cybergarage/upnp/ssdp/HTTPMUSocket;-><init>()V

    .line 82
    iput-object v2, p0, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;->controlPoint:Lorg/cybergarage/upnp/ControlPoint;

    .line 114
    iput-object v2, p0, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;->deviceNotifyThread:Ljava/lang/Thread;

    .line 68
    const-string v0, "239.255.255.250"

    .line 69
    .local v0, "addr":Ljava/lang/String;
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;->useIPv6Address:Z

    .line 70
    invoke-static {p1}, Lorg/cybergarage/net/HostInterface;->isIPv6Address(Ljava/lang/String;)Z

    move-result v1

    if-ne v1, v3, :cond_0

    .line 71
    invoke-static {}, Lorg/cybergarage/upnp/ssdp/SSDP;->getIPv6Address()Ljava/lang/String;

    move-result-object v0

    .line 72
    iput-boolean v3, p0, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;->useIPv6Address:Z

    .line 74
    :cond_0
    const/16 v1, 0x76c

    invoke-virtual {p0, v0, v1, p1}, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;->open(Ljava/lang/String;ILjava/lang/String;)Z

    .line 75
    invoke-virtual {p0, v2}, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;->setControlPoint(Lorg/cybergarage/upnp/ControlPoint;)V

    .line 76
    return-void
.end method

.method static synthetic access$100()Ljava/lang/String;
    .locals 1

    .prologue
    .line 57
    sget-object v0, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;->TAG:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public getControlPoint()Lorg/cybergarage/upnp/ControlPoint;
    .locals 1

    .prologue
    .line 91
    iget-object v0, p0, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;->controlPoint:Lorg/cybergarage/upnp/ControlPoint;

    return-object v0
.end method

.method public post(Lorg/cybergarage/upnp/ssdp/SSDPNotifyRequest;)Z
    .locals 3
    .param p1, "req"    # Lorg/cybergarage/upnp/ssdp/SSDPNotifyRequest;

    .prologue
    .line 103
    const-string v0, "239.255.255.250"

    .line 104
    .local v0, "ssdpAddr":Ljava/lang/String;
    iget-boolean v1, p0, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;->useIPv6Address:Z

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 105
    invoke-static {}, Lorg/cybergarage/upnp/ssdp/SSDP;->getIPv6Address()Ljava/lang/String;

    move-result-object v0

    .line 106
    :cond_0
    const/16 v1, 0x76c

    invoke-virtual {p1, v0, v1}, Lorg/cybergarage/upnp/ssdp/SSDPNotifyRequest;->setHost(Ljava/lang/String;I)V

    .line 107
    invoke-virtual {p0, p1}, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;->post(Lorg/cybergarage/http/HTTPRequest;)Z

    move-result v1

    return v1
.end method

.method public run()V
    .locals 13

    .prologue
    .line 119
    :try_start_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v7

    .line 121
    .local v7, "thisThread":Ljava/lang/Thread;
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;->getControlPoint()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v0

    .line 123
    .local v0, "ctrlPoint":Lorg/cybergarage/upnp/ControlPoint;
    :cond_0
    :goto_0
    iget-object v9, p0, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;->deviceNotifyThread:Ljava/lang/Thread;

    if-ne v9, v7, :cond_1

    .line 124
    invoke-static {}, Ljava/lang/Thread;->yield()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 126
    const/4 v5, 0x0

    .line 128
    .local v5, "packet":Lorg/cybergarage/upnp/ssdp/SSDPPacket;
    :try_start_1
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;->receive()Lorg/cybergarage/upnp/ssdp/SSDPPacket;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v5

    .line 133
    if-eqz v5, :cond_0

    .line 135
    :try_start_2
    new-instance v1, Ljava/lang/String;

    invoke-virtual {v5}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->getData()[B

    move-result-object v9

    invoke-direct {v1, v9}, Ljava/lang/String;-><init>([B)V

    .line 136
    .local v1, "data":Ljava/lang/String;
    const-string v9, "ssdp:discover"

    invoke-virtual {v1, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v9

    const/4 v10, -0x1

    if-ne v9, v10, :cond_0

    .line 139
    invoke-virtual {v5}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->getUSN()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lorg/cybergarage/upnp/device/USN;->getUDN(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 140
    .local v8, "udn":Ljava/lang/String;
    invoke-static {v8}, Lcom/belkin/wemo/localsdk/WeMoDevice;->isValid(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 144
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;->getMulticastInetAddress()Ljava/net/InetAddress;

    move-result-object v4

    .line 145
    .local v4, "maddr":Ljava/net/InetAddress;
    invoke-virtual {v5}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->getHostInetAddress()Ljava/net/InetAddress;

    move-result-object v6

    .line 146
    .local v6, "pmaddr":Ljava/net/InetAddress;
    invoke-virtual {v4, v6}, Ljava/net/InetAddress;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_2

    .line 147
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Invalidate Multicast Recieved from IP "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " on "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lorg/cybergarage/util/Debug;->warning(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 158
    .end local v0    # "ctrlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .end local v1    # "data":Ljava/lang/String;
    .end local v4    # "maddr":Ljava/net/InetAddress;
    .end local v5    # "packet":Lorg/cybergarage/upnp/ssdp/SSDPPacket;
    .end local v6    # "pmaddr":Ljava/net/InetAddress;
    .end local v7    # "thisThread":Ljava/lang/Thread;
    .end local v8    # "udn":Ljava/lang/String;
    :catch_0
    move-exception v3

    .line 159
    .local v3, "ex":Ljava/lang/Exception;
    sget-object v9, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;->TAG:Ljava/lang/String;

    const-string v10, "Exception: "

    invoke-static {v9, v10, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 161
    .end local v3    # "ex":Ljava/lang/Exception;
    :cond_1
    :goto_1
    return-void

    .line 129
    .restart local v0    # "ctrlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .restart local v5    # "packet":Lorg/cybergarage/upnp/ssdp/SSDPPacket;
    .restart local v7    # "thisThread":Ljava/lang/Thread;
    :catch_1
    move-exception v2

    .line 130
    .local v2, "e":Ljava/io/IOException;
    goto :goto_1

    .line 151
    .end local v2    # "e":Ljava/io/IOException;
    .restart local v1    # "data":Ljava/lang/String;
    .restart local v4    # "maddr":Ljava/net/InetAddress;
    .restart local v6    # "pmaddr":Ljava/net/InetAddress;
    .restart local v8    # "udn":Ljava/lang/String;
    :cond_2
    if-eqz v0, :cond_0

    .line 155
    :try_start_3
    new-instance v9, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket$NotifyResponsePacketProcessor;

    const/4 v10, 0x0

    invoke-direct {v9, p0, v10}, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket$NotifyResponsePacketProcessor;-><init>(Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket$1;)V

    sget-object v10, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v11, 0x1

    new-array v11, v11, [Lorg/cybergarage/upnp/ssdp/SSDPPacket;

    const/4 v12, 0x0

    aput-object v5, v11, v12

    invoke-virtual {v9, v10, v11}, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket$NotifyResponsePacketProcessor;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_0
.end method

.method public setControlPoint(Lorg/cybergarage/upnp/ControlPoint;)V
    .locals 0
    .param p1, "ctrlp"    # Lorg/cybergarage/upnp/ControlPoint;

    .prologue
    .line 86
    iput-object p1, p0, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;->controlPoint:Lorg/cybergarage/upnp/ControlPoint;

    .line 87
    return-void
.end method

.method public start()V
    .locals 5

    .prologue
    .line 187
    :try_start_0
    new-instance v2, Ljava/lang/StringBuffer;

    const-string v3, "Cyber.SSDPNotifySocket/"

    invoke-direct {v2, v3}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 188
    .local v2, "name":Ljava/lang/StringBuffer;
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;->getLocalAddress()Ljava/lang/String;

    move-result-object v1

    .line 190
    .local v1, "localAddr":Ljava/lang/String;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_0

    .line 191
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;->getLocalAddress()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const/16 v4, 0x3a

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 192
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;->getLocalPort()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, " -> "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 193
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;->getMulticastAddress()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const/16 v4, 0x3a

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 194
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;->getMulticastPort()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 196
    :cond_0
    new-instance v3, Ljava/lang/Thread;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, p0, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    iput-object v3, p0, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;->deviceNotifyThread:Ljava/lang/Thread;

    .line 197
    iget-object v3, p0, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;->deviceNotifyThread:Ljava/lang/Thread;

    invoke-virtual {v3}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 201
    .end local v1    # "localAddr":Ljava/lang/String;
    .end local v2    # "name":Ljava/lang/StringBuffer;
    :goto_0
    return-void

    .line 198
    :catch_0
    move-exception v0

    .line 199
    .local v0, "e":Ljava/lang/Exception;
    sget-object v3, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;->TAG:Ljava/lang/String;

    const-string v4, "Exception in start() method: "

    invoke-static {v3, v4, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0
.end method

.method public stop()V
    .locals 1

    .prologue
    .line 206
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;->close()Z

    .line 208
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;->deviceNotifyThread:Ljava/lang/Thread;

    .line 209
    return-void
.end method
