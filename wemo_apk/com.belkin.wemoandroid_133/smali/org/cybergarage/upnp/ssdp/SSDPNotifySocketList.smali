.class public Lorg/cybergarage/upnp/ssdp/SSDPNotifySocketList;
.super Ljava/util/Vector;
.source "SSDPNotifySocketList.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private binds:[Ljava/net/InetAddress;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 32
    const-class v0, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocketList;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocketList;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/util/Vector;-><init>()V

    .line 33
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocketList;->binds:[Ljava/net/InetAddress;

    .line 36
    return-void
.end method

.method public constructor <init>([Ljava/net/InetAddress;)V
    .locals 1
    .param p1, "binds"    # [Ljava/net/InetAddress;

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/util/Vector;-><init>()V

    .line 33
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocketList;->binds:[Ljava/net/InetAddress;

    .line 44
    iput-object p1, p0, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocketList;->binds:[Ljava/net/InetAddress;

    .line 45
    return-void
.end method


# virtual methods
.method public close()V
    .locals 3

    .prologue
    .line 110
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocketList;->size()I

    move-result v1

    .line 111
    .local v1, "nSockets":I
    const/4 v0, 0x0

    .local v0, "n":I
    :goto_0
    if-ge v0, v1, :cond_1

    .line 112
    invoke-virtual {p0, v0}, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocketList;->getSSDPNotifySocket(I)Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;

    move-result-object v2

    .line 113
    .local v2, "sock":Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;
    if-eqz v2, :cond_0

    .line 114
    invoke-virtual {v2}, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;->close()Z

    .line 111
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 117
    .end local v2    # "sock":Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;
    :cond_1
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocketList;->clear()V

    .line 118
    return-void
.end method

.method public getSSDPNotifySocket(I)Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;
    .locals 5
    .param p1, "n"    # I

    .prologue
    .line 53
    sget-object v3, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocketList;->TAG:Ljava/lang/String;

    const-string v4, "getSSDPNotifySocket called-- "

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    const/4 v2, 0x0

    .line 56
    .local v2, "ssdpNotifySocket":Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocketList;->get(I)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;

    move-object v2, v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 60
    :goto_0
    return-object v2

    .line 57
    :catch_0
    move-exception v1

    .line 58
    .local v1, "e":Ljava/lang/Exception;
    sget-object v3, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocketList;->TAG:Ljava/lang/String;

    const-string v4, "Exception: "

    invoke-static {v3, v4, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0
.end method

.method public open()Z
    .locals 7

    .prologue
    .line 84
    iget-object v1, p0, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocketList;->binds:[Ljava/net/InetAddress;

    .line 86
    .local v1, "binds":[Ljava/net/InetAddress;
    if-eqz v1, :cond_0

    .line 87
    array-length v6, v1

    new-array v0, v6, [Ljava/lang/String;

    .line 88
    .local v0, "bindAddresses":[Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v6, v1

    if-ge v2, v6, :cond_1

    .line 89
    aget-object v6, v1, v2

    invoke-virtual {v6}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v0, v2

    .line 88
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 92
    .end local v0    # "bindAddresses":[Ljava/lang/String;
    .end local v2    # "i":I
    :cond_0
    invoke-static {}, Lorg/cybergarage/net/HostInterface;->getNHostAddresses()I

    move-result v4

    .line 93
    .local v4, "nHostAddrs":I
    new-array v0, v4, [Ljava/lang/String;

    .line 94
    .restart local v0    # "bindAddresses":[Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, "n":I
    :goto_1
    if-ge v3, v4, :cond_1

    .line 95
    invoke-static {v3}, Lorg/cybergarage/net/HostInterface;->getHostAddress(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v0, v3

    .line 94
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 99
    .end local v3    # "n":I
    .end local v4    # "nHostAddrs":I
    :cond_1
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_2
    array-length v6, v0

    if-ge v2, v6, :cond_3

    .line 100
    aget-object v6, v0, v2

    if-eqz v6, :cond_2

    .line 101
    new-instance v5, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;

    aget-object v6, v0, v2

    invoke-direct {v5, v6}, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;-><init>(Ljava/lang/String;)V

    .line 102
    .local v5, "ssdpNotifySocket":Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;
    invoke-virtual {p0, v5}, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocketList;->add(Ljava/lang/Object;)Z

    .line 99
    .end local v5    # "ssdpNotifySocket":Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 105
    :cond_3
    const/4 v6, 0x1

    return v6
.end method

.method public setControlPoint(Lorg/cybergarage/upnp/ControlPoint;)V
    .locals 3
    .param p1, "ctrlPoint"    # Lorg/cybergarage/upnp/ControlPoint;

    .prologue
    .line 69
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocketList;->size()I

    move-result v1

    .line 70
    .local v1, "nSockets":I
    const/4 v0, 0x0

    .local v0, "n":I
    :goto_0
    if-ge v0, v1, :cond_1

    .line 71
    invoke-virtual {p0, v0}, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocketList;->getSSDPNotifySocket(I)Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;

    move-result-object v2

    .line 72
    .local v2, "sock":Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;
    if-eqz v2, :cond_0

    .line 73
    invoke-virtual {v2, p1}, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;->setControlPoint(Lorg/cybergarage/upnp/ControlPoint;)V

    .line 70
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 76
    .end local v2    # "sock":Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;
    :cond_1
    return-void
.end method

.method public start()V
    .locals 3

    .prologue
    .line 126
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocketList;->size()I

    move-result v1

    .line 127
    .local v1, "nSockets":I
    const/4 v0, 0x0

    .local v0, "n":I
    :goto_0
    if-ge v0, v1, :cond_1

    .line 128
    invoke-virtual {p0, v0}, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocketList;->getSSDPNotifySocket(I)Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;

    move-result-object v2

    .line 129
    .local v2, "sock":Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;
    if-eqz v2, :cond_0

    .line 130
    invoke-virtual {v2}, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;->start()V

    .line 127
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 133
    .end local v2    # "sock":Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;
    :cond_1
    return-void
.end method

.method public stop()V
    .locals 3

    .prologue
    .line 137
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocketList;->size()I

    move-result v1

    .line 138
    .local v1, "nSockets":I
    const/4 v0, 0x0

    .local v0, "n":I
    :goto_0
    if-ge v0, v1, :cond_1

    .line 139
    invoke-virtual {p0, v0}, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocketList;->getSSDPNotifySocket(I)Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;

    move-result-object v2

    .line 140
    .local v2, "sock":Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;
    if-eqz v2, :cond_0

    .line 141
    invoke-virtual {v2}, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;->stop()V

    .line 138
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 144
    .end local v2    # "sock":Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;
    :cond_1
    return-void
.end method
