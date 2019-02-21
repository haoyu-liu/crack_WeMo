.class public Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList;
.super Ljava/util/Vector;
.source "SSDPSearchResponseSocketList.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private binds:[Ljava/net/InetAddress;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 35
    const-class v0, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/util/Vector;-><init>()V

    .line 37
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList;->binds:[Ljava/net/InetAddress;

    .line 40
    return-void
.end method

.method public constructor <init>([Ljava/net/InetAddress;)V
    .locals 1
    .param p1, "binds"    # [Ljava/net/InetAddress;

    .prologue
    .line 45
    invoke-direct {p0}, Ljava/util/Vector;-><init>()V

    .line 37
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList;->binds:[Ljava/net/InetAddress;

    .line 46
    iput-object p1, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList;->binds:[Ljava/net/InetAddress;

    .line 47
    return-void
.end method


# virtual methods
.method public close()V
    .locals 6

    .prologue
    .line 121
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList;->size()I

    move-result v2

    .line 123
    .local v2, "nSockets":I
    const/4 v1, 0x0

    .local v1, "n":I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 124
    :try_start_0
    invoke-virtual {p0, v1}, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList;->getSSDPSearchResponseSocket(I)Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;

    move-result-object v3

    .line 125
    .local v3, "sock":Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;
    invoke-virtual {v3}, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;->close()Z
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 123
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 127
    .end local v3    # "sock":Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;
    :catch_0
    move-exception v0

    .line 128
    .local v0, "e":Ljava/lang/ArrayIndexOutOfBoundsException;
    sget-object v4, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList;->TAG:Ljava/lang/String;

    const-string v5, "Exception: "

    invoke-static {v4, v5, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 130
    .end local v0    # "e":Ljava/lang/ArrayIndexOutOfBoundsException;
    :cond_0
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList;->clear()V

    .line 131
    return-void
.end method

.method public getSSDPSearchResponseSocket(I)Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;
    .locals 1
    .param p1, "n"    # I

    .prologue
    .line 77
    invoke-virtual {p0, p1}, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;

    return-object v0
.end method

.method public open()Z
    .locals 1

    .prologue
    .line 116
    const/16 v0, 0x76c

    invoke-virtual {p0, v0}, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList;->open(I)Z

    move-result v0

    return v0
.end method

.method public open(I)Z
    .locals 9
    .param p1, "port"    # I

    .prologue
    .line 86
    iget-object v1, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList;->binds:[Ljava/net/InetAddress;

    .line 88
    .local v1, "binds":[Ljava/net/InetAddress;
    if-eqz v1, :cond_0

    .line 89
    array-length v8, v1

    new-array v0, v8, [Ljava/lang/String;

    .line 90
    .local v0, "bindAddresses":[Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v8, v1

    if-ge v3, v8, :cond_1

    .line 91
    aget-object v8, v1, v3

    invoke-virtual {v8}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v0, v3

    .line 90
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 94
    .end local v0    # "bindAddresses":[Ljava/lang/String;
    .end local v3    # "i":I
    :cond_0
    invoke-static {}, Lorg/cybergarage/net/HostInterface;->getNHostAddresses()I

    move-result v6

    .line 95
    .local v6, "nHostAddrs":I
    new-array v0, v6, [Ljava/lang/String;

    .line 96
    .restart local v0    # "bindAddresses":[Ljava/lang/String;
    const/4 v5, 0x0

    .local v5, "n":I
    :goto_1
    if-ge v5, v6, :cond_1

    .line 97
    invoke-static {v5}, Lorg/cybergarage/net/HostInterface;->getHostAddress(I)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v0, v5

    .line 96
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 101
    .end local v5    # "n":I
    .end local v6    # "nHostAddrs":I
    :cond_1
    const/4 v4, 0x0

    .local v4, "j":I
    :goto_2
    :try_start_0
    array-length v8, v0

    if-ge v4, v8, :cond_2

    .line 102
    new-instance v7, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;

    aget-object v8, v0, v4

    invoke-direct {v7, v8, p1}, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;-><init>(Ljava/lang/String;I)V

    .line 103
    .local v7, "socket":Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;
    invoke-virtual {p0, v7}, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 101
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 105
    .end local v7    # "socket":Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;
    :catch_0
    move-exception v2

    .line 106
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList;->stop()V

    .line 107
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList;->close()V

    .line 108
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList;->clear()V

    .line 109
    const/4 v8, 0x0

    .line 111
    .end local v2    # "e":Ljava/lang/Exception;
    :goto_3
    return v8

    :cond_2
    const/4 v8, 0x1

    goto :goto_3
.end method

.method public post(Lorg/cybergarage/upnp/ssdp/SSDPSearchRequest;)Z
    .locals 10
    .param p1, "req"    # Lorg/cybergarage/upnp/ssdp/SSDPSearchRequest;

    .prologue
    .line 169
    const/4 v4, 0x1

    .line 170
    .local v4, "ret":Z
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList;->size()I

    move-result v3

    .line 172
    .local v3, "nSockets":I
    :try_start_0
    sget-object v7, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "post() Number of Sockets: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 173
    const/4 v2, 0x0

    .local v2, "n":I
    :goto_0
    if-ge v2, v3, :cond_2

    .line 174
    invoke-virtual {p0, v2}, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList;->getSSDPSearchResponseSocket(I)Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;

    move-result-object v5

    .line 175
    .local v5, "sock":Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;
    invoke-virtual {v5}, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;->getLocalAddress()Ljava/lang/String;

    move-result-object v0

    .line 176
    .local v0, "bindAddr":Ljava/lang/String;
    invoke-virtual {p1, v0}, Lorg/cybergarage/upnp/ssdp/SSDPSearchRequest;->setLocalAddress(Ljava/lang/String;)V

    .line 177
    const-string v6, "239.255.255.250"

    .line 178
    .local v6, "ssdpAddr":Ljava/lang/String;
    invoke-static {v0}, Lorg/cybergarage/net/HostInterface;->isIPv6Address(Ljava/lang/String;)Z

    move-result v7

    const/4 v8, 0x1

    if-ne v7, v8, :cond_0

    .line 179
    invoke-static {}, Lorg/cybergarage/upnp/ssdp/SSDP;->getIPv6Address()Ljava/lang/String;

    move-result-object v6

    .line 181
    :cond_0
    const/16 v7, 0x76c

    invoke-virtual {v5, v6, v7, p1}, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;->post(Ljava/lang/String;ILorg/cybergarage/upnp/ssdp/SSDPSearchRequest;)Z
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v7

    if-nez v7, :cond_1

    .line 182
    const/4 v4, 0x0

    .line 173
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 185
    .end local v0    # "bindAddr":Ljava/lang/String;
    .end local v2    # "n":I
    .end local v5    # "sock":Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;
    .end local v6    # "ssdpAddr":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 186
    .local v1, "e":Ljava/lang/ArrayIndexOutOfBoundsException;
    sget-object v7, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList;->TAG:Ljava/lang/String;

    const-string v8, "Exception: "

    invoke-static {v7, v8, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 188
    .end local v1    # "e":Ljava/lang/ArrayIndexOutOfBoundsException;
    :cond_2
    return v4
.end method

.method public setControlPoint(Lorg/cybergarage/upnp/ControlPoint;)V
    .locals 6
    .param p1, "ctrlPoint"    # Lorg/cybergarage/upnp/ControlPoint;

    .prologue
    .line 60
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList;->size()I

    move-result v2

    .line 62
    .local v2, "nSockets":I
    const/4 v1, 0x0

    .local v1, "n":I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 63
    :try_start_0
    invoke-virtual {p0, v1}, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList;->getSSDPSearchResponseSocket(I)Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;

    move-result-object v3

    .line 64
    .local v3, "sock":Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;
    invoke-virtual {v3, p1}, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;->setControlPoint(Lorg/cybergarage/upnp/ControlPoint;)V
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 66
    .end local v3    # "sock":Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;
    :catch_0
    move-exception v0

    .line 67
    .local v0, "e":Ljava/lang/ArrayIndexOutOfBoundsException;
    sget-object v4, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList;->TAG:Ljava/lang/String;

    const-string v5, "Exception: "

    invoke-static {v4, v5, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 69
    .end local v0    # "e":Ljava/lang/ArrayIndexOutOfBoundsException;
    :cond_0
    return-void
.end method

.method public start()V
    .locals 6

    .prologue
    .line 139
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList;->size()I

    move-result v2

    .line 141
    .local v2, "nSockets":I
    const/4 v1, 0x0

    .local v1, "n":I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 142
    :try_start_0
    invoke-virtual {p0, v1}, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList;->getSSDPSearchResponseSocket(I)Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;

    move-result-object v3

    .line 143
    .local v3, "sock":Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;
    invoke-virtual {v3}, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;->start()V
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 141
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 145
    .end local v3    # "sock":Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;
    :catch_0
    move-exception v0

    .line 146
    .local v0, "e":Ljava/lang/ArrayIndexOutOfBoundsException;
    sget-object v4, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList;->TAG:Ljava/lang/String;

    const-string v5, "Exception: "

    invoke-static {v4, v5, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 148
    .end local v0    # "e":Ljava/lang/ArrayIndexOutOfBoundsException;
    :cond_0
    return-void
.end method

.method public stop()V
    .locals 6

    .prologue
    .line 152
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList;->size()I

    move-result v2

    .line 154
    .local v2, "nSockets":I
    const/4 v1, 0x0

    .local v1, "n":I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 155
    :try_start_0
    invoke-virtual {p0, v1}, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList;->getSSDPSearchResponseSocket(I)Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;

    move-result-object v3

    .line 156
    .local v3, "sock":Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;
    invoke-virtual {v3}, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;->stop()V
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 154
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 158
    .end local v3    # "sock":Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;
    :catch_0
    move-exception v0

    .line 159
    .local v0, "e":Ljava/lang/ArrayIndexOutOfBoundsException;
    sget-object v4, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList;->TAG:Ljava/lang/String;

    const-string v5, "Exception: "

    invoke-static {v4, v5, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 161
    .end local v0    # "e":Ljava/lang/ArrayIndexOutOfBoundsException;
    :cond_0
    return-void
.end method
