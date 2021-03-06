.class public Lcom/belkin/upnp/parser/SetMultipleDeviceNameResponseParser;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "SetMultipleDeviceNameResponseParser.java"


# static fields
.field public static final TAG:Ljava/lang/String; = "SetMultipleDeviceNameResponseParser"


# instance fields
.field errorCodeIDs:Z

.field responseCode:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 12
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 14
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/belkin/upnp/parser/SetMultipleDeviceNameResponseParser;->errorCodeIDs:Z

    .line 16
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/belkin/upnp/parser/SetMultipleDeviceNameResponseParser;->responseCode:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public characters([CII)V
    .locals 1
    .param p1, "ch"    # [C
    .param p2, "start"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 41
    iget-boolean v0, p0, Lcom/belkin/upnp/parser/SetMultipleDeviceNameResponseParser;->errorCodeIDs:Z

    if-eqz v0, :cond_0

    .line 42
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    iput-object v0, p0, Lcom/belkin/upnp/parser/SetMultipleDeviceNameResponseParser;->responseCode:Ljava/lang/String;

    .line 44
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/belkin/upnp/parser/SetMultipleDeviceNameResponseParser;->errorCodeIDs:Z

    .line 46
    :cond_0
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
    .line 50
    const-string v0, "ErrorDeviceIDs"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 51
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/belkin/upnp/parser/SetMultipleDeviceNameResponseParser;->errorCodeIDs:Z

    .line 53
    :cond_0
    return-void
.end method

.method public parseResponse(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 19
    const-string v1, "SetMultipleDeviceNameResponseParser"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "response str: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    if-eqz p1, :cond_0

    .line 22
    :try_start_0
    invoke-static {p1, p0}, Landroid/util/Xml;->parse(Ljava/lang/String;Lorg/xml/sax/ContentHandler;)V
    :try_end_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    :cond_0
    :goto_0
    const-string v1, "SetMultipleDeviceNameResponseParser"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "responseCode: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/upnp/parser/SetMultipleDeviceNameResponseParser;->responseCode:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    iget-object v1, p0, Lcom/belkin/upnp/parser/SetMultipleDeviceNameResponseParser;->responseCode:Ljava/lang/String;

    return-object v1

    .line 24
    :catch_0
    move-exception v0

    .line 25
    .local v0, "e":Lorg/xml/sax/SAXException;
    const-string v1, "SetMultipleDeviceNameResponseParser"

    const-string v2, "SAXException in parsing set multiple device name response parser: "

    invoke-static {v1, v2, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

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
    .line 34
    const-string v0, "ErrorDeviceIDs"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 35
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/belkin/upnp/parser/SetMultipleDeviceNameResponseParser;->errorCodeIDs:Z

    .line 37
    :cond_0
    return-void
.end method
