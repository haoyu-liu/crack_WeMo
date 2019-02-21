.class public Lcom/belkin/wemo/upnp/parser/RMGetRulesResponseParser;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "RMGetRulesResponseParser.java"


# static fields
.field private static TAG:Ljava/lang/String;


# instance fields
.field private jsonRule:Lorg/json/JSONObject;

.field private jsonRuleList:Lorg/json/JSONObject;

.field private tmpValue:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 16
    const-string v0, "GetRulesResponseParser"

    sput-object v0, Lcom/belkin/wemo/upnp/parser/RMGetRulesResponseParser;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 14
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 15
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/upnp/parser/RMGetRulesResponseParser;->tmpValue:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public characters([CII)V
    .locals 2
    .param p1, "ch"    # [C
    .param p2, "start"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 61
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/belkin/wemo/upnp/parser/RMGetRulesResponseParser;->tmpValue:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/upnp/parser/RMGetRulesResponseParser;->tmpValue:Ljava/lang/String;

    .line 63
    return-void
.end method

.method public endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "elementName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 69
    :try_start_0
    const-string v1, "ruleList"

    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 70
    iget-object v1, p0, Lcom/belkin/wemo/upnp/parser/RMGetRulesResponseParser;->tmpValue:Ljava/lang/String;

    const-string v2, "&lt;"

    const-string v3, "<"

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/upnp/parser/RMGetRulesResponseParser;->tmpValue:Ljava/lang/String;

    .line 71
    iget-object v1, p0, Lcom/belkin/wemo/upnp/parser/RMGetRulesResponseParser;->tmpValue:Ljava/lang/String;

    const-string v2, "&gt;"

    const-string v3, ">"

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/upnp/parser/RMGetRulesResponseParser;->tmpValue:Ljava/lang/String;

    .line 72
    iget-object v1, p0, Lcom/belkin/wemo/upnp/parser/RMGetRulesResponseParser;->jsonRuleList:Lorg/json/JSONObject;

    iget-object v2, p0, Lcom/belkin/wemo/upnp/parser/RMGetRulesResponseParser;->tmpValue:Ljava/lang/String;

    invoke-virtual {v1, p3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 73
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/upnp/parser/RMGetRulesResponseParser;->tmpValue:Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 78
    :cond_0
    :goto_0
    return-void

    .line 75
    :catch_0
    move-exception v0

    .line 76
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method

.method public parseGetRulesResponse(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 4
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 31
    sget-object v1, Lcom/belkin/wemo/upnp/parser/RMGetRulesResponseParser;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "GetRulesResponse : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    iput-object v1, p0, Lcom/belkin/wemo/upnp/parser/RMGetRulesResponseParser;->jsonRuleList:Lorg/json/JSONObject;

    .line 36
    if-eqz p1, :cond_0

    .line 38
    :try_start_0
    invoke-static {p1, p0}, Landroid/util/Xml;->parse(Ljava/lang/String;Lorg/xml/sax/ContentHandler;)V
    :try_end_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_0

    .line 46
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/belkin/wemo/upnp/parser/RMGetRulesResponseParser;->jsonRuleList:Lorg/json/JSONObject;

    return-object v1

    .line 41
    :catch_0
    move-exception v0

    .line 43
    .local v0, "e":Lorg/xml/sax/SAXException;
    invoke-virtual {v0}, Lorg/xml/sax/SAXException;->printStackTrace()V

    goto :goto_0
.end method

.method public startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .locals 1
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "elementName"    # Ljava/lang/String;
    .param p4, "attributes"    # Lorg/xml/sax/Attributes;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 52
    const-string v0, "ruleList"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 53
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/upnp/parser/RMGetRulesResponseParser;->jsonRule:Lorg/json/JSONObject;

    .line 56
    :cond_0
    return-void
.end method
