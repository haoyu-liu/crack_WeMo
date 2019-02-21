.class public Lcom/belkin/wemo/upnp/parser/GetExtMetaInfoResponseParser;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "GetExtMetaInfoResponseParser.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private extMetaInfoXMLTag:Z

.field private metaInfoObj:Lcom/belkin/wemo/upnp/response/ExtMetaInfo;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 17
    const-class v0, Lcom/belkin/wemo/upnp/parser/GetExtMetaInfoResponseParser;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/upnp/parser/GetExtMetaInfoResponseParser;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public characters([CII)V
    .locals 5
    .param p1, "ch"    # [C
    .param p2, "start"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 56
    iget-boolean v2, p0, Lcom/belkin/wemo/upnp/parser/GetExtMetaInfoResponseParser;->extMetaInfoXMLTag:Z

    if-eqz v2, :cond_1

    .line 57
    invoke-static {p1}, Ljava/lang/String;->valueOf([C)Ljava/lang/String;

    move-result-object v2

    const-string v3, "\\|"

    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 58
    .local v1, "values":[Ljava/lang/String;
    array-length v2, v1

    if-lez v2, :cond_0

    array-length v2, v1

    const/4 v3, 0x6

    if-lt v2, v3, :cond_0

    .line 59
    const/4 v2, 0x5

    aget-object v0, v1, v2

    .line 60
    .local v0, "fwStatus":Ljava/lang/String;
    iget-object v2, p0, Lcom/belkin/wemo/upnp/parser/GetExtMetaInfoResponseParser;->metaInfoObj:Lcom/belkin/wemo/upnp/response/ExtMetaInfo;

    invoke-virtual {v2, v0}, Lcom/belkin/wemo/upnp/response/ExtMetaInfo;->setFwStatus(Ljava/lang/String;)V

    .line 61
    sget-object v2, Lcom/belkin/wemo/upnp/parser/GetExtMetaInfoResponseParser;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Firmware Status: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    .end local v0    # "fwStatus":Ljava/lang/String;
    :cond_0
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/belkin/wemo/upnp/parser/GetExtMetaInfoResponseParser;->extMetaInfoXMLTag:Z

    .line 65
    .end local v1    # "values":[Ljava/lang/String;
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
    .line 71
    const-string v0, "ExtMetaInfo"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 72
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/belkin/wemo/upnp/parser/GetExtMetaInfoResponseParser;->extMetaInfoXMLTag:Z

    .line 74
    :cond_0
    return-void
.end method

.method public parseResponse(Ljava/lang/String;)Lcom/belkin/wemo/upnp/response/ExtMetaInfo;
    .locals 4
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 27
    const-string v1, "&lt;"

    const-string v2, "<"

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 28
    const-string v1, "&gt;"

    const-string v2, ">"

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 29
    sget-object v1, Lcom/belkin/wemo/upnp/parser/GetExtMetaInfoResponseParser;->TAG:Ljava/lang/String;

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

    .line 31
    new-instance v1, Lcom/belkin/wemo/upnp/response/ExtMetaInfo;

    invoke-direct {v1}, Lcom/belkin/wemo/upnp/response/ExtMetaInfo;-><init>()V

    iput-object v1, p0, Lcom/belkin/wemo/upnp/parser/GetExtMetaInfoResponseParser;->metaInfoObj:Lcom/belkin/wemo/upnp/response/ExtMetaInfo;

    .line 33
    if-eqz p1, :cond_0

    .line 34
    :try_start_0
    invoke-static {p1, p0}, Landroid/util/Xml;->parse(Ljava/lang/String;Lorg/xml/sax/ContentHandler;)V
    :try_end_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/belkin/wemo/upnp/parser/GetExtMetaInfoResponseParser;->metaInfoObj:Lcom/belkin/wemo/upnp/response/ExtMetaInfo;

    return-object v1

    .line 37
    :catch_0
    move-exception v0

    .line 38
    .local v0, "e":Lorg/xml/sax/SAXException;
    sget-object v1, Lcom/belkin/wemo/upnp/parser/GetExtMetaInfoResponseParser;->TAG:Ljava/lang/String;

    const-string v2, "SAXException while parsing ExtMetaInfo uPnP response: "

    invoke-static {v1, v2, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

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
    .line 47
    const-string v0, "ExtMetaInfo"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 48
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/belkin/wemo/upnp/parser/GetExtMetaInfoResponseParser;->extMetaInfoXMLTag:Z

    .line 50
    :cond_0
    return-void
.end method
