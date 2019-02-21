.class public Lcom/belkin/wemo/upnp/parser/InsightBinaryStateResponseParser;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "InsightBinaryStateResponseParser.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private binaryState:Z

.field private brightness:Z

.field private fader:Z

.field private insightBinaryState:Ljava/lang/String;

.field private insightBinaryStateObj:Lcom/belkin/wemo/upnp/response/InsightBinaryState;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 23
    const-class v0, Lcom/belkin/wemo/upnp/parser/InsightBinaryStateResponseParser;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/upnp/parser/InsightBinaryStateResponseParser;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 16
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 19
    iput-boolean v0, p0, Lcom/belkin/wemo/upnp/parser/InsightBinaryStateResponseParser;->binaryState:Z

    .line 20
    iput-boolean v0, p0, Lcom/belkin/wemo/upnp/parser/InsightBinaryStateResponseParser;->brightness:Z

    .line 21
    iput-boolean v0, p0, Lcom/belkin/wemo/upnp/parser/InsightBinaryStateResponseParser;->fader:Z

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
    const/4 v4, 0x0

    .line 74
    sget-object v1, Lcom/belkin/wemo/upnp/parser/InsightBinaryStateResponseParser;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Tag response: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p1}, Ljava/lang/String;->valueOf([C)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    iget-boolean v1, p0, Lcom/belkin/wemo/upnp/parser/InsightBinaryStateResponseParser;->binaryState:Z

    if-eqz v1, :cond_2

    .line 78
    invoke-static {p1}, Ljava/lang/String;->valueOf([C)Ljava/lang/String;

    move-result-object v1

    const-string v2, "\\|"

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 79
    .local v0, "values":[Ljava/lang/String;
    array-length v1, v0

    if-lez v1, :cond_0

    .line 80
    aget-object v1, v0, v4

    iput-object v1, p0, Lcom/belkin/wemo/upnp/parser/InsightBinaryStateResponseParser;->insightBinaryState:Ljava/lang/String;

    .line 81
    iget-object v1, p0, Lcom/belkin/wemo/upnp/parser/InsightBinaryStateResponseParser;->insightBinaryStateObj:Lcom/belkin/wemo/upnp/response/InsightBinaryState;

    iget-object v2, p0, Lcom/belkin/wemo/upnp/parser/InsightBinaryStateResponseParser;->insightBinaryState:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/belkin/wemo/upnp/response/InsightBinaryState;->setBinaryState(Ljava/lang/String;)V

    .line 82
    sget-object v1, Lcom/belkin/wemo/upnp/parser/InsightBinaryStateResponseParser;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " binary state: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/wemo/upnp/parser/InsightBinaryStateResponseParser;->insightBinaryState:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    :cond_0
    iput-boolean v4, p0, Lcom/belkin/wemo/upnp/parser/InsightBinaryStateResponseParser;->binaryState:Z

    .line 97
    .end local v0    # "values":[Ljava/lang/String;
    :cond_1
    :goto_0
    return-void

    .line 86
    :cond_2
    iget-boolean v1, p0, Lcom/belkin/wemo/upnp/parser/InsightBinaryStateResponseParser;->brightness:Z

    if-eqz v1, :cond_3

    .line 88
    iget-object v1, p0, Lcom/belkin/wemo/upnp/parser/InsightBinaryStateResponseParser;->insightBinaryStateObj:Lcom/belkin/wemo/upnp/response/InsightBinaryState;

    invoke-static {p1}, Ljava/lang/String;->valueOf([C)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/belkin/wemo/upnp/response/InsightBinaryState;->setBrightness(Ljava/lang/String;)V

    .line 89
    iput-boolean v4, p0, Lcom/belkin/wemo/upnp/parser/InsightBinaryStateResponseParser;->brightness:Z

    goto :goto_0

    .line 91
    :cond_3
    iget-boolean v1, p0, Lcom/belkin/wemo/upnp/parser/InsightBinaryStateResponseParser;->fader:Z

    if-eqz v1, :cond_1

    .line 93
    iget-object v1, p0, Lcom/belkin/wemo/upnp/parser/InsightBinaryStateResponseParser;->insightBinaryStateObj:Lcom/belkin/wemo/upnp/response/InsightBinaryState;

    invoke-static {p1}, Ljava/lang/String;->valueOf([C)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/belkin/wemo/upnp/response/InsightBinaryState;->setFader(Ljava/lang/String;)V

    .line 94
    iput-boolean v4, p0, Lcom/belkin/wemo/upnp/parser/InsightBinaryStateResponseParser;->fader:Z

    goto :goto_0
.end method

.method public endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 104
    const-string v0, "BinaryState"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 106
    iput-boolean v1, p0, Lcom/belkin/wemo/upnp/parser/InsightBinaryStateResponseParser;->binaryState:Z

    .line 112
    :cond_0
    :goto_0
    return-void

    .line 107
    :cond_1
    const-string v0, "Brightness"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 108
    iput-boolean v1, p0, Lcom/belkin/wemo/upnp/parser/InsightBinaryStateResponseParser;->brightness:Z

    goto :goto_0

    .line 109
    :cond_2
    const-string v0, "Fader"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 110
    iput-boolean v1, p0, Lcom/belkin/wemo/upnp/parser/InsightBinaryStateResponseParser;->fader:Z

    goto :goto_0
.end method

.method public parseResponse(Ljava/lang/String;)Lcom/belkin/wemo/upnp/response/InsightBinaryState;
    .locals 4
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 35
    const-string v1, "&lt;"

    const-string v2, "<"

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 36
    const-string v1, "&gt;"

    const-string v2, ">"

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 37
    sget-object v1, Lcom/belkin/wemo/upnp/parser/InsightBinaryStateResponseParser;->TAG:Ljava/lang/String;

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

    .line 39
    new-instance v1, Lcom/belkin/wemo/upnp/response/InsightBinaryState;

    invoke-direct {v1}, Lcom/belkin/wemo/upnp/response/InsightBinaryState;-><init>()V

    iput-object v1, p0, Lcom/belkin/wemo/upnp/parser/InsightBinaryStateResponseParser;->insightBinaryStateObj:Lcom/belkin/wemo/upnp/response/InsightBinaryState;

    .line 42
    if-eqz p1, :cond_0

    .line 44
    :try_start_0
    invoke-static {p1, p0}, Landroid/util/Xml;->parse(Ljava/lang/String;Lorg/xml/sax/ContentHandler;)V
    :try_end_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/belkin/wemo/upnp/parser/InsightBinaryStateResponseParser;->insightBinaryStateObj:Lcom/belkin/wemo/upnp/response/InsightBinaryState;

    return-object v1

    .line 47
    :catch_0
    move-exception v0

    .line 49
    .local v0, "e":Lorg/xml/sax/SAXException;
    sget-object v1, Lcom/belkin/wemo/upnp/parser/InsightBinaryStateResponseParser;->TAG:Ljava/lang/String;

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
    .locals 2
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
    const/4 v1, 0x1

    .line 59
    const-string v0, "BinaryState"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 61
    iput-boolean v1, p0, Lcom/belkin/wemo/upnp/parser/InsightBinaryStateResponseParser;->binaryState:Z

    .line 67
    :cond_0
    :goto_0
    return-void

    .line 62
    :cond_1
    const-string v0, "Brightness"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 63
    iput-boolean v1, p0, Lcom/belkin/wemo/upnp/parser/InsightBinaryStateResponseParser;->brightness:Z

    goto :goto_0

    .line 64
    :cond_2
    const-string v0, "Fader"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 65
    iput-boolean v1, p0, Lcom/belkin/wemo/upnp/parser/InsightBinaryStateResponseParser;->fader:Z

    goto :goto_0
.end method
