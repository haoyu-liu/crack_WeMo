.class public Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "GetCreateGroupResponseParser.java"


# instance fields
.field ATTRIBUTE:Ljava/lang/String;

.field ATTRIBUTE_DELETERESPONSE:Ljava/lang/String;

.field ATTRIBUTE_FRIENDLYNAME:Ljava/lang/String;

.field private final TAG:Ljava/lang/String;

.field deleteGroupValue:Z

.field private jsonArray:Lorg/json/JSONArray;

.field private jsonObject:Lorg/json/JSONObject;

.field processFriendlyValue:Z

.field processValue:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 18
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 20
    const-string v0, "GetCreateGroupResponseParser"

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;->TAG:Ljava/lang/String;

    .line 21
    const-string v0, "RespCreateGroup"

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;->ATTRIBUTE:Ljava/lang/String;

    .line 22
    const-string v0, "Status"

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;->ATTRIBUTE_FRIENDLYNAME:Ljava/lang/String;

    .line 23
    const-string v0, "ResponseStatus"

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;->ATTRIBUTE_DELETERESPONSE:Ljava/lang/String;

    .line 24
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;->processValue:Z

    .line 25
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;->processFriendlyValue:Z

    .line 26
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;->deleteGroupValue:Z

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
    .line 67
    invoke-super {p0, p1, p2, p3}, Lorg/xml/sax/helpers/DefaultHandler;->characters([CII)V

    .line 68
    const-string v1, ""

    .line 69
    .local v1, "tempStr":Ljava/lang/String;
    new-instance v1, Ljava/lang/String;

    .end local v1    # "tempStr":Ljava/lang/String;
    invoke-direct {v1, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    .line 71
    .restart local v1    # "tempStr":Ljava/lang/String;
    :try_start_0
    iget-boolean v2, p0, Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;->processValue:Z

    if-eqz v2, :cond_0

    .line 72
    iget-object v2, p0, Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;->jsonObject:Lorg/json/JSONObject;

    const-string v3, "GetCreateGroupResponse"

    invoke-virtual {v2, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 74
    :cond_0
    iget-boolean v2, p0, Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;->processFriendlyValue:Z

    if-eqz v2, :cond_1

    .line 75
    iget-object v2, p0, Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;->jsonObject:Lorg/json/JSONObject;

    const-string v3, "GetFriendlyNameResponse"

    invoke-virtual {v2, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 77
    :cond_1
    iget-boolean v2, p0, Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;->deleteGroupValue:Z

    if-eqz v2, :cond_2

    .line 78
    iget-object v2, p0, Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;->jsonObject:Lorg/json/JSONObject;

    const-string v3, "GetDeleteResponse"

    invoke-virtual {v2, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 84
    :cond_2
    :goto_0
    return-void

    .line 80
    :catch_0
    move-exception v0

    .line 81
    .local v0, "e":Lorg/json/JSONException;
    const-string v2, "GetCreateGroupResponseParser"

    const-string v3, "exception in characters()"

    invoke-static {v2, v3, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0
.end method

.method public endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 89
    invoke-super {p0, p1, p2, p3}, Lorg/xml/sax/helpers/DefaultHandler;->endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    iget-object v0, p0, Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;->ATTRIBUTE:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 91
    iput-boolean v2, p0, Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;->processValue:Z

    .line 92
    iget-object v0, p0, Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;->jsonArray:Lorg/json/JSONArray;

    iget-object v1, p0, Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;->jsonObject:Lorg/json/JSONObject;

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 94
    :cond_0
    iget-object v0, p0, Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;->ATTRIBUTE_FRIENDLYNAME:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 95
    iput-boolean v2, p0, Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;->processFriendlyValue:Z

    .line 96
    iget-object v0, p0, Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;->jsonArray:Lorg/json/JSONArray;

    iget-object v1, p0, Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;->jsonObject:Lorg/json/JSONObject;

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 98
    :cond_1
    iget-object v0, p0, Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;->ATTRIBUTE_DELETERESPONSE:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 99
    iput-boolean v2, p0, Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;->deleteGroupValue:Z

    .line 100
    iget-object v0, p0, Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;->jsonArray:Lorg/json/JSONArray;

    iget-object v1, p0, Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;->jsonObject:Lorg/json/JSONObject;

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 102
    :cond_2
    return-void
.end method

.method public parseCreateGroupResponse(Ljava/lang/String;)Lorg/json/JSONArray;
    .locals 3
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 36
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    iput-object v1, p0, Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;->jsonArray:Lorg/json/JSONArray;

    .line 38
    :try_start_0
    invoke-static {p1, p0}, Landroid/util/Xml;->parse(Ljava/lang/String;Lorg/xml/sax/ContentHandler;)V
    :try_end_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_0

    .line 43
    :goto_0
    iget-object v1, p0, Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;->jsonArray:Lorg/json/JSONArray;

    return-object v1

    .line 39
    :catch_0
    move-exception v0

    .line 40
    .local v0, "e":Lorg/xml/sax/SAXException;
    const-string v1, "GetCreateGroupResponseParser"

    const-string v2, "Exception in parseCreateGroupResponse"

    invoke-static {v1, v2, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

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

    .line 49
    invoke-super {p0, p1, p2, p3, p4}, Lorg/xml/sax/helpers/DefaultHandler;->startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V

    .line 50
    iget-object v0, p0, Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;->ATTRIBUTE:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 51
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;->processValue:Z

    .line 52
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;->jsonObject:Lorg/json/JSONObject;

    .line 54
    :cond_0
    iget-object v0, p0, Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;->ATTRIBUTE_FRIENDLYNAME:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 55
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;->processFriendlyValue:Z

    .line 56
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;->jsonObject:Lorg/json/JSONObject;

    .line 58
    :cond_1
    iget-object v0, p0, Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;->ATTRIBUTE_DELETERESPONSE:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 59
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;->deleteGroupValue:Z

    .line 60
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;->jsonObject:Lorg/json/JSONObject;

    .line 62
    :cond_2
    return-void
.end method
