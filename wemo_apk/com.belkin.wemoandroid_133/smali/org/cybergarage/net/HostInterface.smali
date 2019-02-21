.class public Lorg/cybergarage/net/HostInterface;
.super Ljava/lang/Object;
.source "HostInterface.java"


# static fields
.field public static final IPV4_BITMASK:I = 0x1

.field public static final IPV6_BITMASK:I = 0x10

.field public static final LOCAL_BITMASK:I = 0x100

.field public static USE_LOOPBACK_ADDR:Z

.field public static USE_ONLY_IPV4_ADDR:Z

.field public static USE_ONLY_IPV6_ADDR:Z

.field private static ifAddress:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 45
    sput-boolean v1, Lorg/cybergarage/net/HostInterface;->USE_LOOPBACK_ADDR:Z

    .line 49
    const/4 v0, 0x1

    sput-boolean v0, Lorg/cybergarage/net/HostInterface;->USE_ONLY_IPV4_ADDR:Z

    .line 50
    sput-boolean v1, Lorg/cybergarage/net/HostInterface;->USE_ONLY_IPV6_ADDR:Z

    .line 56
    const-string v0, ""

    sput-object v0, Lorg/cybergarage/net/HostInterface;->ifAddress:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final getHostAddress(I)Ljava/lang/String;
    .locals 8
    .param p0, "n"    # I

    .prologue
    .line 179
    invoke-static {}, Lorg/cybergarage/net/HostInterface;->hasAssignedInterface()Z

    move-result v6

    const/4 v7, 0x1

    if-ne v6, v7, :cond_0

    .line 180
    invoke-static {}, Lorg/cybergarage/net/HostInterface;->getInterface()Ljava/lang/String;

    move-result-object v2

    .line 204
    :goto_0
    return-object v2

    .line 182
    :cond_0
    const/4 v3, 0x0

    .line 184
    .local v3, "hostAddrCnt":I
    :try_start_0
    invoke-static {}, Ljava/net/NetworkInterface;->getNetworkInterfaces()Ljava/util/Enumeration;

    move-result-object v5

    .line 185
    .local v5, "nis":Ljava/util/Enumeration;
    :cond_1
    invoke-interface {v5}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v6

    if-eqz v6, :cond_4

    .line 186
    invoke-interface {v5}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/net/NetworkInterface;

    .line 187
    .local v4, "ni":Ljava/net/NetworkInterface;
    invoke-virtual {v4}, Ljava/net/NetworkInterface;->getInetAddresses()Ljava/util/Enumeration;

    move-result-object v1

    .line 188
    .local v1, "addrs":Ljava/util/Enumeration;
    :cond_2
    :goto_1
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 189
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/InetAddress;

    .line 190
    .local v0, "addr":Ljava/net/InetAddress;
    invoke-static {v0}, Lorg/cybergarage/net/HostInterface;->isUsableAddress(Ljava/net/InetAddress;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 192
    if-ge v3, p0, :cond_3

    .line 193
    add-int/lit8 v3, v3, 0x1

    .line 194
    goto :goto_1

    .line 196
    :cond_3
    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 199
    .local v2, "host":Ljava/lang/String;
    goto :goto_0

    .line 203
    .end local v0    # "addr":Ljava/net/InetAddress;
    .end local v1    # "addrs":Ljava/util/Enumeration;
    .end local v2    # "host":Ljava/lang/String;
    .end local v4    # "ni":Ljava/net/NetworkInterface;
    .end local v5    # "nis":Ljava/util/Enumeration;
    :catch_0
    move-exception v6

    .line 204
    :cond_4
    const-string v2, ""

    goto :goto_0
.end method

.method public static final getHostURL(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "host"    # Ljava/lang/String;
    .param p1, "port"    # I
    .param p2, "uri"    # Ljava/lang/String;

    .prologue
    .line 293
    move-object v0, p0

    .line 294
    .local v0, "hostAddr":Ljava/lang/String;
    invoke-static {p0}, Lorg/cybergarage/net/HostInterface;->isIPv6Address(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 295
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 296
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "http://"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static final getIPv4Address()Ljava/lang/String;
    .locals 5

    .prologue
    .line 267
    invoke-static {}, Lorg/cybergarage/net/HostInterface;->getNHostAddresses()I

    move-result v1

    .line 268
    .local v1, "addrCnt":I
    const/4 v2, 0x0

    .local v2, "n":I
    :goto_0
    if-ge v2, v1, :cond_1

    .line 269
    invoke-static {v2}, Lorg/cybergarage/net/HostInterface;->getHostAddress(I)Ljava/lang/String;

    move-result-object v0

    .line 270
    .local v0, "addr":Ljava/lang/String;
    invoke-static {v0}, Lorg/cybergarage/net/HostInterface;->isIPv4Address(Ljava/lang/String;)Z

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 273
    .end local v0    # "addr":Ljava/lang/String;
    :goto_1
    return-object v0

    .line 268
    .restart local v0    # "addr":Ljava/lang/String;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 273
    .end local v0    # "addr":Ljava/lang/String;
    :cond_1
    const-string v0, ""

    goto :goto_1
.end method

.method public static final getIPv6Address()Ljava/lang/String;
    .locals 5

    .prologue
    .line 278
    invoke-static {}, Lorg/cybergarage/net/HostInterface;->getNHostAddresses()I

    move-result v1

    .line 279
    .local v1, "addrCnt":I
    const/4 v2, 0x0

    .local v2, "n":I
    :goto_0
    if-ge v2, v1, :cond_1

    .line 280
    invoke-static {v2}, Lorg/cybergarage/net/HostInterface;->getHostAddress(I)Ljava/lang/String;

    move-result-object v0

    .line 281
    .local v0, "addr":Ljava/lang/String;
    invoke-static {v0}, Lorg/cybergarage/net/HostInterface;->isIPv6Address(Ljava/lang/String;)Z

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 284
    .end local v0    # "addr":Ljava/lang/String;
    :goto_1
    return-object v0

    .line 279
    .restart local v0    # "addr":Ljava/lang/String;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 284
    .end local v0    # "addr":Ljava/lang/String;
    :cond_1
    const-string v0, ""

    goto :goto_1
.end method

.method public static final getInetAddress(I[Ljava/lang/String;)[Ljava/net/InetAddress;
    .locals 9
    .param p0, "ipfilter"    # I
    .param p1, "interfaces"    # [Ljava/lang/String;

    .prologue
    .line 136
    if-eqz p1, :cond_5

    .line 137
    new-instance v5, Ljava/util/Vector;

    invoke-direct {v5}, Ljava/util/Vector;-><init>()V

    .line 138
    .local v5, "iflist":Ljava/util/Vector;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    array-length v8, p1

    if-ge v4, v8, :cond_1

    .line 141
    :try_start_0
    aget-object v8, p1, v4

    invoke-static {v8}, Ljava/net/NetworkInterface;->getByName(Ljava/lang/String;)Ljava/net/NetworkInterface;
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    .line 145
    .local v6, "ni":Ljava/net/NetworkInterface;
    if-eqz v6, :cond_0

    invoke-virtual {v5, v6}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 138
    .end local v6    # "ni":Ljava/net/NetworkInterface;
    :cond_0
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 142
    :catch_0
    move-exception v3

    .line 143
    .local v3, "e":Ljava/net/SocketException;
    goto :goto_1

    .line 148
    .end local v3    # "e":Ljava/net/SocketException;
    :cond_1
    invoke-virtual {v5}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v7

    .line 156
    .end local v4    # "i":I
    .end local v5    # "iflist":Ljava/util/Vector;
    .local v7, "nis":Ljava/util/Enumeration;
    :goto_2
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 157
    .local v1, "addresses":Ljava/util/ArrayList;
    :cond_2
    invoke-interface {v7}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v8

    if-eqz v8, :cond_7

    .line 158
    invoke-interface {v7}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/net/NetworkInterface;

    .line 159
    .restart local v6    # "ni":Ljava/net/NetworkInterface;
    invoke-virtual {v6}, Ljava/net/NetworkInterface;->getInetAddresses()Ljava/util/Enumeration;

    move-result-object v2

    .line 160
    .local v2, "addrs":Ljava/util/Enumeration;
    :cond_3
    :goto_3
    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v8

    if-eqz v8, :cond_2

    .line 161
    invoke-interface {v2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/InetAddress;

    .line 162
    .local v0, "addr":Ljava/net/InetAddress;
    and-int/lit16 v8, p0, 0x100

    if-nez v8, :cond_4

    invoke-virtual {v0}, Ljava/net/InetAddress;->isLoopbackAddress()Z

    move-result v8

    if-nez v8, :cond_3

    .line 165
    :cond_4
    and-int/lit8 v8, p0, 0x1

    if-eqz v8, :cond_6

    instance-of v8, v0, Ljava/net/Inet4Address;

    if-eqz v8, :cond_6

    .line 166
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 151
    .end local v0    # "addr":Ljava/net/InetAddress;
    .end local v1    # "addresses":Ljava/util/ArrayList;
    .end local v2    # "addrs":Ljava/util/Enumeration;
    .end local v6    # "ni":Ljava/net/NetworkInterface;
    .end local v7    # "nis":Ljava/util/Enumeration;
    :cond_5
    :try_start_1
    invoke-static {}, Ljava/net/NetworkInterface;->getNetworkInterfaces()Ljava/util/Enumeration;
    :try_end_1
    .catch Ljava/net/SocketException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v7

    .restart local v7    # "nis":Ljava/util/Enumeration;
    goto :goto_2

    .line 152
    .end local v7    # "nis":Ljava/util/Enumeration;
    :catch_1
    move-exception v3

    .line 153
    .restart local v3    # "e":Ljava/net/SocketException;
    const/4 v8, 0x0

    .line 172
    .end local v3    # "e":Ljava/net/SocketException;
    :goto_4
    return-object v8

    .line 167
    .restart local v0    # "addr":Ljava/net/InetAddress;
    .restart local v1    # "addresses":Ljava/util/ArrayList;
    .restart local v2    # "addrs":Ljava/util/Enumeration;
    .restart local v6    # "ni":Ljava/net/NetworkInterface;
    .restart local v7    # "nis":Ljava/util/Enumeration;
    :cond_6
    and-int/lit8 v8, p0, 0x10

    if-eqz v8, :cond_3

    instance-of v8, v0, Ljava/net/InetAddress;

    if-eqz v8, :cond_3

    .line 168
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 172
    .end local v0    # "addr":Ljava/net/InetAddress;
    .end local v2    # "addrs":Ljava/util/Enumeration;
    .end local v6    # "ni":Ljava/net/NetworkInterface;
    :cond_7
    const/4 v8, 0x0

    new-array v8, v8, [Ljava/net/InetAddress;

    invoke-virtual {v1, v8}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [Ljava/net/InetAddress;

    check-cast v8, [Ljava/net/InetAddress;

    goto :goto_4
.end method

.method public static final getInterface()Ljava/lang/String;
    .locals 1

    .prologue
    .line 68
    sget-object v0, Lorg/cybergarage/net/HostInterface;->ifAddress:Ljava/lang/String;

    return-object v0
.end method

.method public static final getNHostAddresses()I
    .locals 7

    .prologue
    const/4 v3, 0x1

    .line 102
    invoke-static {}, Lorg/cybergarage/net/HostInterface;->hasAssignedInterface()Z

    move-result v6

    if-ne v6, v3, :cond_1

    .line 122
    .local v3, "nHostAddrs":I
    :cond_0
    :goto_0
    return v3

    .line 105
    .end local v3    # "nHostAddrs":I
    :cond_1
    const/4 v3, 0x0

    .line 107
    .restart local v3    # "nHostAddrs":I
    :try_start_0
    invoke-static {}, Ljava/net/NetworkInterface;->getNetworkInterfaces()Ljava/util/Enumeration;

    move-result-object v5

    .line 108
    .local v5, "nis":Ljava/util/Enumeration;
    :cond_2
    invoke-interface {v5}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 109
    invoke-interface {v5}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/net/NetworkInterface;

    .line 110
    .local v4, "ni":Ljava/net/NetworkInterface;
    invoke-virtual {v4}, Ljava/net/NetworkInterface;->getInetAddresses()Ljava/util/Enumeration;

    move-result-object v1

    .line 111
    .local v1, "addrs":Ljava/util/Enumeration;
    :cond_3
    :goto_1
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 112
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/InetAddress;

    .line 113
    .local v0, "addr":Ljava/net/InetAddress;
    invoke-static {v0}, Lorg/cybergarage/net/HostInterface;->isUsableAddress(Ljava/net/InetAddress;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v6

    if-eqz v6, :cond_3

    .line 115
    add-int/lit8 v3, v3, 0x1

    .line 116
    goto :goto_1

    .line 119
    .end local v0    # "addr":Ljava/net/InetAddress;
    .end local v1    # "addrs":Ljava/util/Enumeration;
    .end local v4    # "ni":Ljava/net/NetworkInterface;
    .end local v5    # "nis":Ljava/util/Enumeration;
    :catch_0
    move-exception v2

    .line 120
    .local v2, "e":Ljava/lang/Exception;
    invoke-static {v2}, Lorg/cybergarage/util/Debug;->warning(Ljava/lang/Exception;)V

    goto :goto_0
.end method

.method private static final hasAssignedInterface()Z
    .locals 1

    .prologue
    .line 73
    sget-object v0, Lorg/cybergarage/net/HostInterface;->ifAddress:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static final hasIPv4Addresses()Z
    .locals 5

    .prologue
    const/4 v3, 0x1

    .line 241
    invoke-static {}, Lorg/cybergarage/net/HostInterface;->getNHostAddresses()I

    move-result v1

    .line 242
    .local v1, "addrCnt":I
    const/4 v2, 0x0

    .local v2, "n":I
    :goto_0
    if-ge v2, v1, :cond_1

    .line 243
    invoke-static {v2}, Lorg/cybergarage/net/HostInterface;->getHostAddress(I)Ljava/lang/String;

    move-result-object v0

    .line 244
    .local v0, "addr":Ljava/lang/String;
    invoke-static {v0}, Lorg/cybergarage/net/HostInterface;->isIPv4Address(Ljava/lang/String;)Z

    move-result v4

    if-ne v4, v3, :cond_0

    .line 247
    .end local v0    # "addr":Ljava/lang/String;
    :goto_1
    return v3

    .line 242
    .restart local v0    # "addr":Ljava/lang/String;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 247
    .end local v0    # "addr":Ljava/lang/String;
    :cond_1
    const/4 v3, 0x0

    goto :goto_1
.end method

.method public static final hasIPv6Addresses()Z
    .locals 5

    .prologue
    const/4 v3, 0x1

    .line 252
    invoke-static {}, Lorg/cybergarage/net/HostInterface;->getNHostAddresses()I

    move-result v1

    .line 253
    .local v1, "addrCnt":I
    const/4 v2, 0x0

    .local v2, "n":I
    :goto_0
    if-ge v2, v1, :cond_1

    .line 254
    invoke-static {v2}, Lorg/cybergarage/net/HostInterface;->getHostAddress(I)Ljava/lang/String;

    move-result-object v0

    .line 255
    .local v0, "addr":Ljava/lang/String;
    invoke-static {v0}, Lorg/cybergarage/net/HostInterface;->isIPv6Address(Ljava/lang/String;)Z

    move-result v4

    if-ne v4, v3, :cond_0

    .line 258
    .end local v0    # "addr":Ljava/lang/String;
    :goto_1
    return v3

    .line 253
    .restart local v0    # "addr":Ljava/lang/String;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 258
    .end local v0    # "addr":Ljava/lang/String;
    :cond_1
    const/4 v3, 0x0

    goto :goto_1
.end method

.method public static final isIPv4Address(Ljava/lang/String;)Z
    .locals 3
    .param p0, "host"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 226
    :try_start_0
    invoke-static {p0}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v0

    .line 227
    .local v0, "addr":Ljava/net/InetAddress;
    instance-of v2, v0, Ljava/net/Inet4Address;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v2, :cond_0

    .line 228
    const/4 v1, 0x1

    .line 232
    .end local v0    # "addr":Ljava/net/InetAddress;
    :cond_0
    :goto_0
    return v1

    .line 231
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public static final isIPv6Address(Ljava/lang/String;)Z
    .locals 3
    .param p0, "host"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 214
    :try_start_0
    invoke-static {p0}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v0

    .line 215
    .local v0, "addr":Ljava/net/InetAddress;
    instance-of v2, v0, Ljava/net/Inet6Address;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v2, :cond_0

    .line 216
    const/4 v1, 0x1

    .line 220
    .end local v0    # "addr":Ljava/net/InetAddress;
    :cond_0
    :goto_0
    return v1

    .line 219
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method private static final isUsableAddress(Ljava/net/InetAddress;)Z
    .locals 3
    .param p0, "addr"    # Ljava/net/InetAddress;

    .prologue
    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 84
    sget-boolean v2, Lorg/cybergarage/net/HostInterface;->USE_LOOPBACK_ADDR:Z

    if-nez v2, :cond_1

    .line 85
    invoke-virtual {p0}, Ljava/net/InetAddress;->isLoopbackAddress()Z

    move-result v2

    if-ne v2, v1, :cond_1

    .line 96
    :cond_0
    :goto_0
    return v0

    .line 88
    :cond_1
    sget-boolean v2, Lorg/cybergarage/net/HostInterface;->USE_ONLY_IPV4_ADDR:Z

    if-ne v2, v1, :cond_2

    .line 89
    instance-of v2, p0, Ljava/net/Inet6Address;

    if-nez v2, :cond_0

    .line 92
    :cond_2
    sget-boolean v2, Lorg/cybergarage/net/HostInterface;->USE_ONLY_IPV6_ADDR:Z

    if-ne v2, v1, :cond_3

    .line 93
    instance-of v2, p0, Ljava/net/Inet4Address;

    if-nez v2, :cond_0

    :cond_3
    move v0, v1

    .line 96
    goto :goto_0
.end method

.method public static final setInterface(Ljava/lang/String;)V
    .locals 0
    .param p0, "ifaddr"    # Ljava/lang/String;

    .prologue
    .line 63
    sput-object p0, Lorg/cybergarage/net/HostInterface;->ifAddress:Ljava/lang/String;

    .line 64
    return-void
.end method
