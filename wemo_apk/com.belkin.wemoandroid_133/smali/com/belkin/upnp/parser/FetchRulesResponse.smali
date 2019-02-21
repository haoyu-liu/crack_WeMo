.class public Lcom/belkin/upnp/parser/FetchRulesResponse;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "FetchRulesResponse.java"


# static fields
.field public static final TAG:Ljava/lang/String; = "FetchRulesResponse"


# instance fields
.field errorCode:Z

.field jsonObject:Lorg/json/JSONObject;

.field ruleDbPath:Z

.field ruleDbVersion:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 58
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 61
    iput-boolean v0, p0, Lcom/belkin/upnp/parser/FetchRulesResponse;->ruleDbPath:Z

    .line 62
    iput-boolean v0, p0, Lcom/belkin/upnp/parser/FetchRulesResponse;->ruleDbVersion:Z

    .line 63
    iput-boolean v0, p0, Lcom/belkin/upnp/parser/FetchRulesResponse;->errorCode:Z

    .line 65
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/belkin/upnp/parser/FetchRulesResponse;->jsonObject:Lorg/json/JSONObject;

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
    .line 119
    :try_start_0
    iget-boolean v1, p0, Lcom/belkin/upnp/parser/FetchRulesResponse;->ruleDbPath:Z

    if-eqz v1, :cond_1

    .line 121
    iget-object v1, p0, Lcom/belkin/upnp/parser/FetchRulesResponse;->jsonObject:Lorg/json/JSONObject;

    const-string v2, "ruleDbPath"

    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 122
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/belkin/upnp/parser/FetchRulesResponse;->ruleDbPath:Z

    .line 138
    :cond_0
    :goto_0
    return-void

    .line 124
    :cond_1
    iget-boolean v1, p0, Lcom/belkin/upnp/parser/FetchRulesResponse;->ruleDbVersion:Z

    if-eqz v1, :cond_2

    .line 126
    iget-object v1, p0, Lcom/belkin/upnp/parser/FetchRulesResponse;->jsonObject:Lorg/json/JSONObject;

    const-string v2, "ruleDbVersion"

    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 127
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/belkin/upnp/parser/FetchRulesResponse;->ruleDbVersion:Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 134
    :catch_0
    move-exception v0

    .line 135
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    .line 129
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_2
    :try_start_1
    iget-boolean v1, p0, Lcom/belkin/upnp/parser/FetchRulesResponse;->errorCode:Z

    if-eqz v1, :cond_0

    .line 131
    iget-object v1, p0, Lcom/belkin/upnp/parser/FetchRulesResponse;->jsonObject:Lorg/json/JSONObject;

    const-string v2, "errorCode"

    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 132
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/belkin/upnp/parser/FetchRulesResponse;->errorCode:Z
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

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

    .line 145
    const-string v0, "ruleDbPath"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 147
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/FetchRulesResponse;->ruleDbPath:Z

    .line 157
    :cond_0
    :goto_0
    return-void

    .line 149
    :cond_1
    const-string v0, "ruleDbVersion"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 151
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/FetchRulesResponse;->ruleDbVersion:Z

    goto :goto_0

    .line 153
    :cond_2
    const-string v0, "errorCode"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 155
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/FetchRulesResponse;->errorCode:Z

    goto :goto_0
.end method

.method public parseResponse(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 4
    .param p1, "parcel"    # Ljava/lang/Object;
    .param p2, "str"    # Ljava/lang/String;

    .prologue
    .line 75
    const-string v1, "&lt;"

    const-string v2, "<"

    invoke-virtual {p2, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 76
    const-string v1, "&gt;"

    const-string v2, ">"

    invoke-virtual {p2, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 77
    const-string v1, "FetchRulesResponse"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "response str: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    check-cast p1, Lorg/json/JSONObject;

    .end local p1    # "parcel":Ljava/lang/Object;
    iput-object p1, p0, Lcom/belkin/upnp/parser/FetchRulesResponse;->jsonObject:Lorg/json/JSONObject;

    .line 81
    if-eqz p2, :cond_0

    .line 83
    :try_start_0
    invoke-static {p2, p0}, Landroid/util/Xml;->parse(Ljava/lang/String;Lorg/xml/sax/ContentHandler;)V
    :try_end_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_0

    .line 90
    :cond_0
    :goto_0
    const-string v1, "FetchRulesResponse"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "jsonObject: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/upnp/parser/FetchRulesResponse;->jsonObject:Lorg/json/JSONObject;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    return-void

    .line 86
    :catch_0
    move-exception v0

    .line 88
    .local v0, "e":Lorg/xml/sax/SAXException;
    invoke-virtual {v0}, Lorg/xml/sax/SAXException;->printStackTrace()V

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

    .line 98
    const-string v0, "ruleDbPath"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 100
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/FetchRulesResponse;->ruleDbPath:Z

    .line 110
    :cond_0
    :goto_0
    return-void

    .line 102
    :cond_1
    const-string v0, "ruleDbVersion"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 104
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/FetchRulesResponse;->ruleDbVersion:Z

    goto :goto_0

    .line 106
    :cond_2
    const-string v0, "errorCode"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 108
    iput-boolean v1, p0, Lcom/belkin/upnp/parser/FetchRulesResponse;->errorCode:Z

    goto :goto_0
.end method
