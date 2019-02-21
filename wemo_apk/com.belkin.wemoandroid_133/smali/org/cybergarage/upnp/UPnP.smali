.class public Lorg/cybergarage/upnp/UPnP;
.super Ljava/lang/Object;
.source "UPnP.java"


# static fields
.field public static final DEFAULT_EXPIRED_DEVICE_EXTRA_TIME:I = 0x3c

.field public static final DEFAULT_TTL:I = 0x4

.field public static final INMPR03:Ljava/lang/String; = "INMPR03"

.field public static final INMPR03_DISCOVERY_OVER_WIRELESS_COUNT:I = 0x4

.field public static final INMPR03_VERSION:Ljava/lang/String; = "1.0"

.field public static final NAME:Ljava/lang/String; = "CyberLinkJava"

.field public static final SERVER_RETRY_COUNT:I = 0x64

.field public static final USE_IPV6_ADMINISTRATIVE_SCOPE:I = 0x5

.field public static final USE_IPV6_GLOBAL_SCOPE:I = 0x7

.field public static final USE_IPV6_LINK_LOCAL_SCOPE:I = 0x3

.field public static final USE_IPV6_SITE_LOCAL_SCOPE:I = 0x6

.field public static final USE_IPV6_SUBNET_SCOPE:I = 0x4

.field public static final USE_LOOPBACK_ADDR:I = 0x2

.field public static final USE_ONLY_IPV4_ADDR:I = 0x9

.field public static final USE_ONLY_IPV6_ADDR:I = 0x1

.field public static final USE_SSDP_SEARCHRESPONSE_MULTIPLE_INTERFACES:I = 0x8

.field public static final VERSION:Ljava/lang/String; = "1.8"

.field public static final XML_CLASS_PROPERTTY:Ljava/lang/String; = "cyberlink.upnp.xml.parser"

.field public static final XML_DECLARATION:Ljava/lang/String; = "<?xml version=\"1.0\" encoding=\"utf-8\"?>"

.field private static timeToLive:I

.field private static xmlParser:Lorg/cybergarage/xml/Parser;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x4

    .line 257
    sput v0, Lorg/cybergarage/upnp/UPnP;->timeToLive:I

    .line 286
    invoke-static {v0}, Lorg/cybergarage/upnp/UPnP;->setTimeToLive(I)V

    .line 293
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final createUUID()Ljava/lang/String;
    .locals 14

    .prologue
    const-wide/32 v12, 0xffff

    const v11, 0xffff

    const/16 v10, 0x20

    .line 184
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 185
    .local v0, "time1":J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    long-to-double v4, v4

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v6

    mul-double/2addr v4, v6

    double-to-long v2, v4

    .line 186
    .local v2, "time2":J
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    and-long v6, v0, v12

    long-to-int v5, v6

    invoke-static {v5}, Lorg/cybergarage/upnp/UPnP;->toUUID(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "-"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    shr-long v6, v0, v10

    const-wide/32 v8, 0xa000

    or-long/2addr v6, v8

    long-to-int v5, v6

    and-int/2addr v5, v11

    invoke-static {v5}, Lorg/cybergarage/upnp/UPnP;->toUUID(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "-"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    and-long v6, v2, v12

    long-to-int v5, v6

    invoke-static {v5}, Lorg/cybergarage/upnp/UPnP;->toUUID(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "-"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    shr-long v6, v2, v10

    const-wide/32 v8, 0xe000

    or-long/2addr v6, v8

    long-to-int v5, v6

    and-int/2addr v5, v11

    invoke-static {v5}, Lorg/cybergarage/upnp/UPnP;->toUUID(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method public static final getServerName()Ljava/lang/String;
    .locals 4

    .prologue
    .line 56
    const-string v2, "os.name"

    invoke-static {v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 57
    .local v0, "osName":Ljava/lang/String;
    const-string v2, "os.version"

    invoke-static {v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 58
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

    const-string v3, " UPnP/1.0 "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "CyberLinkJava"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "1.8"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static final getTimeToLive()I
    .locals 1

    .prologue
    .line 266
    sget v0, Lorg/cybergarage/upnp/UPnP;->timeToLive:I

    return v0
.end method

.method public static final getXMLParser()Lorg/cybergarage/xml/Parser;
    .locals 2

    .prologue
    .line 207
    sget-object v0, Lorg/cybergarage/upnp/UPnP;->xmlParser:Lorg/cybergarage/xml/Parser;

    if-nez v0, :cond_1

    .line 208
    invoke-static {}, Lorg/cybergarage/upnp/UPnP;->loadDefaultXMLParser()Lorg/cybergarage/xml/Parser;

    move-result-object v0

    sput-object v0, Lorg/cybergarage/upnp/UPnP;->xmlParser:Lorg/cybergarage/xml/Parser;

    .line 209
    sget-object v0, Lorg/cybergarage/upnp/UPnP;->xmlParser:Lorg/cybergarage/xml/Parser;

    if-nez v0, :cond_0

    .line 210
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "No XML parser defined. And unable to laod any. \nTry to invoke UPnP.setXMLParser before UPnP.getXMLParser"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 212
    :cond_0
    sget-object v0, Lorg/cybergarage/upnp/UPnP;->xmlParser:Lorg/cybergarage/xml/Parser;

    invoke-static {v0}, Lorg/cybergarage/soap/SOAP;->setXMLParser(Lorg/cybergarage/xml/Parser;)V

    .line 214
    :cond_1
    sget-object v0, Lorg/cybergarage/upnp/UPnP;->xmlParser:Lorg/cybergarage/xml/Parser;

    return-object v0
.end method

.method public static final initialize()V
    .locals 0

    .prologue
    .line 298
    return-void
.end method

.method public static final isEnabled(I)Z
    .locals 1
    .param p0, "value"    # I

    .prologue
    .line 150
    sparse-switch p0, :sswitch_data_0

    .line 164
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 153
    :sswitch_0
    sget-boolean v0, Lorg/cybergarage/net/HostInterface;->USE_ONLY_IPV6_ADDR:Z

    goto :goto_0

    .line 157
    :sswitch_1
    sget-boolean v0, Lorg/cybergarage/net/HostInterface;->USE_ONLY_IPV4_ADDR:Z

    goto :goto_0

    .line 161
    :sswitch_2
    sget-boolean v0, Lorg/cybergarage/net/HostInterface;->USE_LOOPBACK_ADDR:Z

    goto :goto_0

    .line 150
    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_0
        0x2 -> :sswitch_2
        0x9 -> :sswitch_1
    .end sparse-switch
.end method

.method private static loadDefaultXMLParser()Lorg/cybergarage/xml/Parser;
    .locals 6

    .prologue
    .line 228
    const/4 v2, 0x0

    .line 230
    .local v2, "parser":Lorg/cybergarage/xml/Parser;
    const/4 v4, 0x5

    new-array v3, v4, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "cyberlink.upnp.xml.parser"

    invoke-static {v5}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    const-string v5, "org.cybergarage.xml.parser.XmlPullParser"

    aput-object v5, v3, v4

    const/4 v4, 0x2

    const-string v5, "org.cybergarage.xml.parser.JaxpParser"

    aput-object v5, v3, v4

    const/4 v4, 0x3

    const-string v5, "org.cybergarage.xml.parser.kXML2Parser"

    aput-object v5, v3, v4

    const/4 v4, 0x4

    const-string v5, "org.cybergarage.xml.parser.XercesParser"

    aput-object v5, v3, v4

    .line 238
    .local v3, "parserClass":[Ljava/lang/String;
    const/4 v1, 0x0

    .end local v2    # "parser":Lorg/cybergarage/xml/Parser;
    .local v1, "i":I
    :goto_0
    array-length v4, v3

    if-ge v1, v4, :cond_1

    .line 239
    aget-object v4, v3, v1

    if-nez v4, :cond_0

    .line 238
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 242
    :cond_0
    :try_start_0
    aget-object v4, v3, v1

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/cybergarage/xml/Parser;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 248
    :goto_2
    return-object v2

    .line 244
    :catch_0
    move-exception v0

    .line 245
    .local v0, "e":Ljava/lang/Throwable;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unable to load "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    aget-object v5, v3, v1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " as XMLParser due to "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lorg/cybergarage/util/Debug;->warning(Ljava/lang/String;)V

    goto :goto_1

    .line 248
    .end local v0    # "e":Ljava/lang/Throwable;
    :cond_1
    const/4 v2, 0x0

    goto :goto_2
.end method

.method public static final setDisable(I)V
    .locals 1
    .param p0, "value"    # I

    .prologue
    const/4 v0, 0x0

    .line 129
    sparse-switch p0, :sswitch_data_0

    .line 146
    :goto_0
    return-void

    .line 132
    :sswitch_0
    sput-boolean v0, Lorg/cybergarage/net/HostInterface;->USE_ONLY_IPV6_ADDR:Z

    goto :goto_0

    .line 137
    :sswitch_1
    sput-boolean v0, Lorg/cybergarage/net/HostInterface;->USE_ONLY_IPV4_ADDR:Z

    goto :goto_0

    .line 142
    :sswitch_2
    sput-boolean v0, Lorg/cybergarage/net/HostInterface;->USE_LOOPBACK_ADDR:Z

    goto :goto_0

    .line 129
    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_0
        0x2 -> :sswitch_2
        0x9 -> :sswitch_1
    .end sparse-switch
.end method

.method public static final setEnable(I)V
    .locals 1
    .param p0, "value"    # I

    .prologue
    const/4 v0, 0x1

    .line 83
    packed-switch p0, :pswitch_data_0

    .line 125
    :goto_0
    :pswitch_0
    return-void

    .line 86
    :pswitch_1
    sput-boolean v0, Lorg/cybergarage/net/HostInterface;->USE_ONLY_IPV6_ADDR:Z

    goto :goto_0

    .line 91
    :pswitch_2
    sput-boolean v0, Lorg/cybergarage/net/HostInterface;->USE_ONLY_IPV4_ADDR:Z

    goto :goto_0

    .line 96
    :pswitch_3
    sput-boolean v0, Lorg/cybergarage/net/HostInterface;->USE_LOOPBACK_ADDR:Z

    goto :goto_0

    .line 101
    :pswitch_4
    const-string v0, "FF02::C"

    invoke-static {v0}, Lorg/cybergarage/upnp/ssdp/SSDP;->setIPv6Address(Ljava/lang/String;)V

    goto :goto_0

    .line 106
    :pswitch_5
    const-string v0, "FF03::C"

    invoke-static {v0}, Lorg/cybergarage/upnp/ssdp/SSDP;->setIPv6Address(Ljava/lang/String;)V

    goto :goto_0

    .line 111
    :pswitch_6
    const-string v0, "FF04::C"

    invoke-static {v0}, Lorg/cybergarage/upnp/ssdp/SSDP;->setIPv6Address(Ljava/lang/String;)V

    goto :goto_0

    .line 116
    :pswitch_7
    const-string v0, "FF05::C"

    invoke-static {v0}, Lorg/cybergarage/upnp/ssdp/SSDP;->setIPv6Address(Ljava/lang/String;)V

    goto :goto_0

    .line 121
    :pswitch_8
    const-string v0, "FF0E::C"

    invoke-static {v0}, Lorg/cybergarage/upnp/ssdp/SSDP;->setIPv6Address(Ljava/lang/String;)V

    goto :goto_0

    .line 83
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public static final setTimeToLive(I)V
    .locals 0
    .param p0, "value"    # I

    .prologue
    .line 261
    sput p0, Lorg/cybergarage/upnp/UPnP;->timeToLive:I

    .line 262
    return-void
.end method

.method public static final setXMLParser(Lorg/cybergarage/xml/Parser;)V
    .locals 0
    .param p0, "parser"    # Lorg/cybergarage/xml/Parser;

    .prologue
    .line 201
    sput-object p0, Lorg/cybergarage/upnp/UPnP;->xmlParser:Lorg/cybergarage/xml/Parser;

    .line 202
    invoke-static {p0}, Lorg/cybergarage/soap/SOAP;->setXMLParser(Lorg/cybergarage/xml/Parser;)V

    .line 203
    return-void
.end method

.method private static final toUUID(I)Ljava/lang/String;
    .locals 6
    .param p0, "seed"    # I

    .prologue
    .line 173
    const v4, 0xffff

    and-int/2addr v4, p0

    const/16 v5, 0x10

    invoke-static {v4, v5}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    move-result-object v0

    .line 174
    .local v0, "id":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    .line 175
    .local v1, "idLen":I
    const-string v3, ""

    .line 176
    .local v3, "uuid":Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "n":I
    :goto_0
    rsub-int/lit8 v4, v1, 0x4

    if-ge v2, v4, :cond_0

    .line 177
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "0"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 176
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 178
    :cond_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 179
    return-object v3
.end method
