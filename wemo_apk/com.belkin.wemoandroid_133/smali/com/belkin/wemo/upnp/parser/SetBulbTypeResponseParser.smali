.class public Lcom/belkin/wemo/upnp/parser/SetBulbTypeResponseParser;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "SetBulbTypeResponseParser.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private isMaxLevel:Z

.field private isMinLevel:Z

.field private isTurnOnLevel:Z

.field private setBulbTypeResponse:Lcom/belkin/wemo/upnp/response/SetBulbTypeResponse;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 21
    const-class v0, Lcom/belkin/wemo/upnp/parser/SetBulbTypeResponseParser;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/upnp/parser/SetBulbTypeResponseParser;->TAG:Ljava/lang/String;

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
    const/4 v3, 0x0

    .line 66
    sget-object v0, Lcom/belkin/wemo/upnp/parser/SetBulbTypeResponseParser;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "characters: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p1}, Ljava/lang/String;->valueOf([C)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; start: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; length: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    iget-boolean v0, p0, Lcom/belkin/wemo/upnp/parser/SetBulbTypeResponseParser;->isMinLevel:Z

    if-eqz v0, :cond_1

    .line 69
    iget-object v0, p0, Lcom/belkin/wemo/upnp/parser/SetBulbTypeResponseParser;->setBulbTypeResponse:Lcom/belkin/wemo/upnp/response/SetBulbTypeResponse;

    invoke-static {p1, p2, p3}, Ljava/lang/String;->copyValueOf([CII)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/upnp/response/SetBulbTypeResponse;->setMinLevel(Ljava/lang/String;)V

    .line 70
    iput-boolean v3, p0, Lcom/belkin/wemo/upnp/parser/SetBulbTypeResponseParser;->isMinLevel:Z

    .line 78
    :cond_0
    :goto_0
    return-void

    .line 71
    :cond_1
    iget-boolean v0, p0, Lcom/belkin/wemo/upnp/parser/SetBulbTypeResponseParser;->isMaxLevel:Z

    if-eqz v0, :cond_2

    .line 72
    iget-object v0, p0, Lcom/belkin/wemo/upnp/parser/SetBulbTypeResponseParser;->setBulbTypeResponse:Lcom/belkin/wemo/upnp/response/SetBulbTypeResponse;

    invoke-static {p1, p2, p3}, Ljava/lang/String;->copyValueOf([CII)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/upnp/response/SetBulbTypeResponse;->setMaxLevel(Ljava/lang/String;)V

    .line 73
    iput-boolean v3, p0, Lcom/belkin/wemo/upnp/parser/SetBulbTypeResponseParser;->isMaxLevel:Z

    goto :goto_0

    .line 74
    :cond_2
    iget-boolean v0, p0, Lcom/belkin/wemo/upnp/parser/SetBulbTypeResponseParser;->isTurnOnLevel:Z

    if-eqz v0, :cond_0

    .line 75
    iget-object v0, p0, Lcom/belkin/wemo/upnp/parser/SetBulbTypeResponseParser;->setBulbTypeResponse:Lcom/belkin/wemo/upnp/response/SetBulbTypeResponse;

    invoke-static {p1, p2, p3}, Ljava/lang/String;->copyValueOf([CII)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/upnp/response/SetBulbTypeResponse;->setTurnOnLevel(Ljava/lang/String;)V

    .line 76
    iput-boolean v3, p0, Lcom/belkin/wemo/upnp/parser/SetBulbTypeResponseParser;->isTurnOnLevel:Z

    goto :goto_0
.end method

.method public endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 85
    sget-object v0, Lcom/belkin/wemo/upnp/parser/SetBulbTypeResponseParser;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "endElement: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    const-string v0, "maxLevel"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 88
    iput-boolean v3, p0, Lcom/belkin/wemo/upnp/parser/SetBulbTypeResponseParser;->isMaxLevel:Z

    .line 94
    :cond_0
    :goto_0
    return-void

    .line 89
    :cond_1
    const-string v0, "minLevel"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 90
    iput-boolean v3, p0, Lcom/belkin/wemo/upnp/parser/SetBulbTypeResponseParser;->isMinLevel:Z

    goto :goto_0

    .line 91
    :cond_2
    const-string v0, "turnOnLevel"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 92
    iput-boolean v3, p0, Lcom/belkin/wemo/upnp/parser/SetBulbTypeResponseParser;->isTurnOnLevel:Z

    goto :goto_0
.end method

.method public parseResponse(Ljava/lang/String;)Lcom/belkin/wemo/upnp/response/SetBulbTypeResponse;
    .locals 4
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 30
    const-string v1, "&lt;"

    const-string v2, "<"

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 31
    const-string v1, "&gt;"

    const-string v2, ">"

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 32
    sget-object v1, Lcom/belkin/wemo/upnp/parser/SetBulbTypeResponseParser;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "parseResponse: response str = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    new-instance v1, Lcom/belkin/wemo/upnp/response/SetBulbTypeResponse;

    invoke-direct {v1}, Lcom/belkin/wemo/upnp/response/SetBulbTypeResponse;-><init>()V

    iput-object v1, p0, Lcom/belkin/wemo/upnp/parser/SetBulbTypeResponseParser;->setBulbTypeResponse:Lcom/belkin/wemo/upnp/response/SetBulbTypeResponse;

    .line 36
    if-eqz p1, :cond_0

    .line 37
    :try_start_0
    invoke-static {p1, p0}, Landroid/util/Xml;->parse(Ljava/lang/String;Lorg/xml/sax/ContentHandler;)V
    :try_end_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_0

    .line 43
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/belkin/wemo/upnp/parser/SetBulbTypeResponseParser;->setBulbTypeResponse:Lcom/belkin/wemo/upnp/response/SetBulbTypeResponse;

    return-object v1

    .line 40
    :catch_0
    move-exception v0

    .line 41
    .local v0, "e":Lorg/xml/sax/SAXException;
    sget-object v1, Lcom/belkin/wemo/upnp/parser/SetBulbTypeResponseParser;->TAG:Ljava/lang/String;

    const-string v2, "SAXException while parsing SetBulbType Response: "

    invoke-static {v1, v2, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0
.end method

.method public startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .locals 4
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
    const/4 v3, 0x1

    .line 51
    sget-object v0, Lcom/belkin/wemo/upnp/parser/SetBulbTypeResponseParser;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "startElement: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    const-string v0, "maxLevel"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 54
    iput-boolean v3, p0, Lcom/belkin/wemo/upnp/parser/SetBulbTypeResponseParser;->isMaxLevel:Z

    .line 60
    :cond_0
    :goto_0
    return-void

    .line 55
    :cond_1
    const-string v0, "minLevel"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 56
    iput-boolean v3, p0, Lcom/belkin/wemo/upnp/parser/SetBulbTypeResponseParser;->isMinLevel:Z

    goto :goto_0

    .line 57
    :cond_2
    const-string v0, "turnOnLevel"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 58
    iput-boolean v3, p0, Lcom/belkin/wemo/upnp/parser/SetBulbTypeResponseParser;->isTurnOnLevel:Z

    goto :goto_0
.end method
