.class public Lcom/belkin/wemo/cache/utils/InsightParamsCloudResponseParser;
.super Ljava/lang/Object;
.source "InsightParamsCloudResponseParser.java"


# instance fields
.field private final TAG:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    const-string v0, "SDK_InsightParamsCloudResponseParser"

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/InsightParamsCloudResponseParser;->TAG:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public parseGetResponse(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 12
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 32
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 34
    .local v4, "insightParams":Lorg/json/JSONObject;
    :try_start_0
    new-instance v7, Lcom/belkin/wemo/cache/cloud/XMLParser;

    invoke-direct {v7}, Lcom/belkin/wemo/cache/cloud/XMLParser;-><init>()V

    .line 36
    .local v7, "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    sget-object v6, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->GET_INSIGHT_PARAMS_DATA:[Ljava/lang/String;

    .line 37
    .local v6, "paramKeys":[Ljava/lang/String;
    invoke-virtual {v7, p1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getDomElement(Ljava/lang/String;)Lorg/w3c/dom/Document;

    move-result-object v1

    .line 38
    .local v1, "doc":Lorg/w3c/dom/Document;
    const-string v8, "applianceConsumption"

    invoke-interface {v1, v8}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v5

    .line 39
    .local v5, "nl":Lorg/w3c/dom/NodeList;
    const/4 v8, 0x0

    invoke-interface {v5, v8}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v2

    check-cast v2, Lorg/w3c/dom/Element;

    .line 40
    .local v2, "e":Lorg/w3c/dom/Element;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v8, v6

    if-ge v3, v8, :cond_0

    .line 41
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 42
    .local v0, "attr":Lorg/json/JSONObject;
    const-string v8, "value"

    sget-object v9, Lcom/belkin/wemo/cache/utils/Constants;->KEY_INSIGHT_REMOTE_DATA:[Ljava/lang/String;

    aget-object v9, v9, v3

    invoke-virtual {v7, v2, v9}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 43
    aget-object v8, v6, v3

    invoke-virtual {v4, v8, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 40
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 45
    .end local v0    # "attr":Lorg/json/JSONObject;
    :cond_0
    sget-object v8, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_EXPORT_INTERVAL:Ljava/lang/String;

    new-instance v9, Lorg/json/JSONObject;

    invoke-direct {v9}, Lorg/json/JSONObject;-><init>()V

    const-string v10, "value"

    sget-object v11, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_EXPORT_INTERVAL:Ljava/lang/String;

    invoke-virtual {v7, v2, v11}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v9, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v9

    invoke-virtual {v4, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 46
    sget-object v8, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_EXPORT_EMAIL:Ljava/lang/String;

    new-instance v9, Lorg/json/JSONObject;

    invoke-direct {v9}, Lorg/json/JSONObject;-><init>()V

    const-string v10, "value"

    const-string v11, ""

    invoke-virtual {v9, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v9

    invoke-virtual {v4, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 47
    sget-object v6, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->GET_INSIGHT_HOME_SETTINGS_DATA:[Ljava/lang/String;

    .line 48
    const-string v8, "homeSettings"

    invoke-interface {v1, v8}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v5

    .line 49
    const/4 v8, 0x0

    invoke-interface {v5, v8}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v2

    .end local v2    # "e":Lorg/w3c/dom/Element;
    check-cast v2, Lorg/w3c/dom/Element;

    .line 50
    .restart local v2    # "e":Lorg/w3c/dom/Element;
    const/4 v3, 0x1

    :goto_1
    array-length v8, v6

    if-ge v3, v8, :cond_1

    .line 51
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 52
    .restart local v0    # "attr":Lorg/json/JSONObject;
    const-string v8, "value"

    aget-object v9, v6, v3

    invoke-virtual {v7, v2, v9}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 53
    aget-object v8, v6, v3

    invoke-virtual {v4, v8, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 50
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 55
    .end local v0    # "attr":Lorg/json/JSONObject;
    :cond_1
    const-string v8, "SDK_InsightParamsCloudResponseParser"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "insight attribute list: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 60
    .end local v1    # "doc":Lorg/w3c/dom/Document;
    .end local v2    # "e":Lorg/w3c/dom/Element;
    .end local v3    # "i":I
    .end local v5    # "nl":Lorg/w3c/dom/NodeList;
    .end local v6    # "paramKeys":[Ljava/lang/String;
    .end local v7    # "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    :goto_2
    return-object v4

    .line 56
    :catch_0
    move-exception v2

    .line 57
    .local v2, "e":Ljava/lang/Exception;
    const-string v8, "SDK_InsightParamsCloudResponseParser"

    const-string v9, "Exception while parsing insight params "

    invoke-static {v8, v9, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_2
.end method

.method public parseSetResponse(Ljava/lang/String;)Z
    .locals 9
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 18
    :try_start_0
    new-instance v4, Lcom/belkin/wemo/cache/cloud/XMLParser;

    invoke-direct {v4}, Lcom/belkin/wemo/cache/cloud/XMLParser;-><init>()V

    .line 19
    .local v4, "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    invoke-virtual {v4, p1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getDomElement(Ljava/lang/String;)Lorg/w3c/dom/Document;

    move-result-object v0

    .line 20
    .local v0, "doc":Lorg/w3c/dom/Document;
    const-string v6, "plugin"

    invoke-interface {v0, v6}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v3

    .line 21
    .local v3, "nl":Lorg/w3c/dom/NodeList;
    const/4 v6, 0x0

    invoke-interface {v3, v6}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    check-cast v1, Lorg/w3c/dom/Element;

    .line 22
    .local v1, "e":Lorg/w3c/dom/Element;
    const-string v6, "macAddress"

    invoke-virtual {v4, v1, v6}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 23
    .local v2, "mac":Ljava/lang/String;
    const-string v6, "SDK_InsightParamsCloudResponseParser"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Success response for insight: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 24
    const/4 v5, 0x1

    .line 27
    .end local v0    # "doc":Lorg/w3c/dom/Document;
    .end local v1    # "e":Lorg/w3c/dom/Element;
    .end local v2    # "mac":Ljava/lang/String;
    .end local v3    # "nl":Lorg/w3c/dom/NodeList;
    .end local v4    # "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    :goto_0
    return v5

    .line 25
    :catch_0
    move-exception v1

    .line 26
    .local v1, "e":Ljava/lang/Exception;
    const-string v6, "SDK_InsightParamsCloudResponseParser"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Exception while parsing API response "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0
.end method
