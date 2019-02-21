.class public Lcom/belkin/wemo/upnp/parser/GetMetaInfoResponseParser;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "GetMetaInfoResponseParser.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private fwVersion:Ljava/lang/String;

.field private metaInfo:Z

.field private metaInfoObj:Lcom/belkin/wemo/upnp/response/MetaInfo;

.field private ssid:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 16
    const-class v0, Lcom/belkin/wemo/upnp/parser/GetMetaInfoResponseParser;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/upnp/parser/GetMetaInfoResponseParser;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 12
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 15
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/belkin/wemo/upnp/parser/GetMetaInfoResponseParser;->metaInfo:Z

    return-void
.end method


# virtual methods
.method public characters([CII)V
    .locals 4
    .param p1, "ch"    # [C
    .param p2, "start"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x4

    .line 64
    iget-boolean v1, p0, Lcom/belkin/wemo/upnp/parser/GetMetaInfoResponseParser;->metaInfo:Z

    if-eqz v1, :cond_1

    .line 66
    invoke-static {p1}, Ljava/lang/String;->valueOf([C)Ljava/lang/String;

    move-result-object v1

    const-string v2, "\\|"

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 67
    .local v0, "values":[Ljava/lang/String;
    array-length v1, v0

    if-le v1, v3, :cond_0

    .line 68
    const/4 v1, 0x3

    aget-object v1, v0, v1

    iput-object v1, p0, Lcom/belkin/wemo/upnp/parser/GetMetaInfoResponseParser;->fwVersion:Ljava/lang/String;

    .line 69
    iget-object v1, p0, Lcom/belkin/wemo/upnp/parser/GetMetaInfoResponseParser;->metaInfoObj:Lcom/belkin/wemo/upnp/response/MetaInfo;

    iget-object v2, p0, Lcom/belkin/wemo/upnp/parser/GetMetaInfoResponseParser;->fwVersion:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/belkin/wemo/upnp/response/MetaInfo;->setFirmwareVersion(Ljava/lang/String;)V

    .line 71
    aget-object v1, v0, v3

    iput-object v1, p0, Lcom/belkin/wemo/upnp/parser/GetMetaInfoResponseParser;->ssid:Ljava/lang/String;

    .line 72
    iget-object v1, p0, Lcom/belkin/wemo/upnp/parser/GetMetaInfoResponseParser;->metaInfoObj:Lcom/belkin/wemo/upnp/response/MetaInfo;

    iget-object v2, p0, Lcom/belkin/wemo/upnp/parser/GetMetaInfoResponseParser;->ssid:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/belkin/wemo/upnp/response/MetaInfo;->setSSID(Ljava/lang/String;)V

    .line 74
    sget-object v1, Lcom/belkin/wemo/upnp/parser/GetMetaInfoResponseParser;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ssid: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/wemo/upnp/parser/GetMetaInfoResponseParser;->ssid:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; firmware version: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/wemo/upnp/parser/GetMetaInfoResponseParser;->fwVersion:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    :cond_0
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/belkin/wemo/upnp/parser/GetMetaInfoResponseParser;->metaInfo:Z

    .line 78
    .end local v0    # "values":[Ljava/lang/String;
    :cond_1
    return-void
.end method

.method public endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 85
    const-string v0, "MetaInfo"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 87
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/belkin/wemo/upnp/parser/GetMetaInfoResponseParser;->metaInfo:Z

    .line 89
    :cond_0
    return-void
.end method

.method public parseResponse(Ljava/lang/String;)Lcom/belkin/wemo/upnp/response/MetaInfo;
    .locals 4
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 29
    const-string v1, "&lt;"

    const-string v2, "<"

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 30
    const-string v1, "&gt;"

    const-string v2, ">"

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 31
    sget-object v1, Lcom/belkin/wemo/upnp/parser/GetMetaInfoResponseParser;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "response str: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    new-instance v1, Lcom/belkin/wemo/upnp/response/MetaInfo;

    invoke-direct {v1}, Lcom/belkin/wemo/upnp/response/MetaInfo;-><init>()V

    iput-object v1, p0, Lcom/belkin/wemo/upnp/parser/GetMetaInfoResponseParser;->metaInfoObj:Lcom/belkin/wemo/upnp/response/MetaInfo;

    .line 36
    if-eqz p1, :cond_0

    .line 38
    :try_start_0
    invoke-static {p1, p0}, Landroid/util/Xml;->parse(Ljava/lang/String;Lorg/xml/sax/ContentHandler;)V
    :try_end_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_0

    .line 45
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/belkin/wemo/upnp/parser/GetMetaInfoResponseParser;->metaInfoObj:Lcom/belkin/wemo/upnp/response/MetaInfo;

    return-object v1

    .line 41
    :catch_0
    move-exception v0

    .line 43
    .local v0, "e":Lorg/xml/sax/SAXException;
    sget-object v1, Lcom/belkin/wemo/upnp/parser/GetMetaInfoResponseParser;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Exception: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .locals 1
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;
    .param p4, "attributes"    # Lorg/xml/sax/Attributes;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 53
    const-string v0, "MetaInfo"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 55
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/belkin/wemo/upnp/parser/GetMetaInfoResponseParser;->metaInfo:Z

    .line 57
    :cond_0
    return-void
.end method
