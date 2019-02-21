.class public Lcom/belkin/wemo/localsdk/parser/SetAttributeResponseParser;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "SetAttributeResponseParser.java"


# instance fields
.field private isSuccess:Z

.field private tmpValue:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 8
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 11
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/belkin/wemo/localsdk/parser/SetAttributeResponseParser;->isSuccess:Z

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
    .line 30
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    iput-object v0, p0, Lcom/belkin/wemo/localsdk/parser/SetAttributeResponseParser;->tmpValue:Ljava/lang/String;

    .line 32
    return-void
.end method

.method public endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "elementName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 37
    const-string v0, "attributeList"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 38
    iget-object v0, p0, Lcom/belkin/wemo/localsdk/parser/SetAttributeResponseParser;->tmpValue:Ljava/lang/String;

    const-string v1, "0"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 39
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/belkin/wemo/localsdk/parser/SetAttributeResponseParser;->isSuccess:Z

    .line 45
    :cond_0
    :goto_0
    return-void

    .line 41
    :cond_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/belkin/wemo/localsdk/parser/SetAttributeResponseParser;->isSuccess:Z

    goto :goto_0
.end method

.method public parseSetAttributeRespone(Ljava/lang/String;)Z
    .locals 2
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 16
    if-eqz p1, :cond_0

    .line 18
    :try_start_0
    invoke-static {p1, p0}, Landroid/util/Xml;->parse(Ljava/lang/String;Lorg/xml/sax/ContentHandler;)V
    :try_end_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_0

    .line 25
    :cond_0
    :goto_0
    iget-boolean v1, p0, Lcom/belkin/wemo/localsdk/parser/SetAttributeResponseParser;->isSuccess:Z

    return v1

    .line 21
    :catch_0
    move-exception v0

    .line 23
    .local v0, "e":Lorg/xml/sax/SAXException;
    invoke-virtual {v0}, Lorg/xml/sax/SAXException;->printStackTrace()V

    goto :goto_0
.end method
