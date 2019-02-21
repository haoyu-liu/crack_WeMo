.class public Lcom/belkin/wemo/cache/utils/BlobStorageParser;
.super Ljava/lang/Object;
.source "BlobStorageParser.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "BlobStorageParser"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createArgumentList(Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 6
    .param p0, "argumentList"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 22
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 23
    .local v2, "str":Ljava/lang/StringBuffer;
    invoke-virtual {p0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    .line 24
    .local v1, "getterKeyIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 25
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 27
    .local v0, "argumentKey":Ljava/lang/String;
    const-string v3, "<attribute>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 28
    const-string v3, "<name>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 29
    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 30
    const-string v3, "</name>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 31
    const-string v3, "<value>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 32
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 33
    const-string v3, "</value>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 34
    const-string v3, "</attribute>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 37
    .end local v0    # "argumentKey":Ljava/lang/String;
    :cond_0
    const-string v3, "BlobStorageParser"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Parsed: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public static parseGetResponse(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 15
    .param p0, "response"    # Ljava/lang/String;

    .prologue
    .line 59
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 61
    .local v0, "blobStorageAttr":Lorg/json/JSONObject;
    :try_start_0
    new-instance v5, Lcom/belkin/wemo/cache/cloud/XMLParser;

    invoke-direct {v5}, Lcom/belkin/wemo/cache/cloud/XMLParser;-><init>()V

    .line 63
    .local v5, "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    invoke-virtual {v5, p0}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getDomElement(Ljava/lang/String;)Lorg/w3c/dom/Document;

    move-result-object v1

    .line 64
    .local v1, "doc":Lorg/w3c/dom/Document;
    const-string v12, "attributeLists"

    invoke-interface {v1, v12}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v4

    .line 66
    .local v4, "nl":Lorg/w3c/dom/NodeList;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-interface {v4}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v12

    if-ge v3, v12, :cond_2

    .line 67
    invoke-interface {v4, v3}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v11

    check-cast v11, Lorg/w3c/dom/Element;

    .line 68
    .local v11, "tempAttribute":Lorg/w3c/dom/Element;
    const/4 v7, 0x0

    .local v7, "tempAttrName":Lorg/w3c/dom/Element;
    const/4 v9, 0x0

    .line 69
    .local v9, "tempAttrValue":Lorg/w3c/dom/Element;
    const-string v12, "name"

    invoke-interface {v11, v12}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v8

    .line 70
    .local v8, "tempAttrNameNL":Lorg/w3c/dom/NodeList;
    invoke-interface {v8}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v12

    if-lez v12, :cond_0

    .line 71
    const/4 v12, 0x0

    invoke-interface {v8, v12}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v7

    .end local v7    # "tempAttrName":Lorg/w3c/dom/Element;
    check-cast v7, Lorg/w3c/dom/Element;

    .line 73
    .restart local v7    # "tempAttrName":Lorg/w3c/dom/Element;
    :cond_0
    const-string v12, "value"

    invoke-interface {v11, v12}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v10

    .line 74
    .local v10, "tempAttrValueNL":Lorg/w3c/dom/NodeList;
    invoke-interface {v10}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v12

    if-lez v12, :cond_1

    .line 75
    const/4 v12, 0x0

    invoke-interface {v10, v12}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v7

    .end local v7    # "tempAttrName":Lorg/w3c/dom/Element;
    check-cast v7, Lorg/w3c/dom/Element;

    .line 77
    .restart local v7    # "tempAttrName":Lorg/w3c/dom/Element;
    :cond_1
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    .line 78
    .local v6, "tempAttr":Lorg/json/JSONObject;
    const-string v12, "name"

    invoke-interface {v7}, Lorg/w3c/dom/Element;->getNodeValue()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v6, v12, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 79
    const-string v12, "value"

    invoke-interface {v9}, Lorg/w3c/dom/Element;->getNodeValue()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v6, v12, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 81
    invoke-interface {v7}, Lorg/w3c/dom/Element;->getNodeValue()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lcom/belkin/wemo/cache/utils/StringUtils;->toLowerCamelCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v0, v12, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 66
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 84
    .end local v6    # "tempAttr":Lorg/json/JSONObject;
    .end local v7    # "tempAttrName":Lorg/w3c/dom/Element;
    .end local v8    # "tempAttrNameNL":Lorg/w3c/dom/NodeList;
    .end local v9    # "tempAttrValue":Lorg/w3c/dom/Element;
    .end local v10    # "tempAttrValueNL":Lorg/w3c/dom/NodeList;
    .end local v11    # "tempAttribute":Lorg/w3c/dom/Element;
    :cond_2
    const-string v12, "BlobStorageParser"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "blob storage attribute list attribute list: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 89
    .end local v1    # "doc":Lorg/w3c/dom/Document;
    .end local v3    # "i":I
    .end local v4    # "nl":Lorg/w3c/dom/NodeList;
    .end local v5    # "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    :goto_1
    return-object v0

    .line 85
    :catch_0
    move-exception v2

    .line 86
    .local v2, "e":Ljava/lang/Exception;
    const-string v12, "BlobStorageParser"

    const-string v13, "Exception while parsing blob storage cloud response  "

    invoke-static {v12, v13, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_1
.end method

.method public static parseSetResponse(Ljava/lang/String;)Z
    .locals 9
    .param p0, "response"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 45
    :try_start_0
    new-instance v4, Lcom/belkin/wemo/cache/cloud/XMLParser;

    invoke-direct {v4}, Lcom/belkin/wemo/cache/cloud/XMLParser;-><init>()V

    .line 46
    .local v4, "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    invoke-virtual {v4, p0}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getDomElement(Ljava/lang/String;)Lorg/w3c/dom/Document;

    move-result-object v0

    .line 47
    .local v0, "doc":Lorg/w3c/dom/Document;
    const-string v6, "plugin"

    invoke-interface {v0, v6}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v3

    .line 48
    .local v3, "nl":Lorg/w3c/dom/NodeList;
    const/4 v6, 0x0

    invoke-interface {v3, v6}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    check-cast v1, Lorg/w3c/dom/Element;

    .line 49
    .local v1, "e":Lorg/w3c/dom/Element;
    const-string v6, "macAddress"

    invoke-virtual {v4, v1, v6}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 50
    .local v2, "mac":Ljava/lang/String;
    const-string v6, "BlobStorageParser"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Success response for mac: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    const/4 v5, 0x1

    .line 54
    .end local v0    # "doc":Lorg/w3c/dom/Document;
    .end local v1    # "e":Lorg/w3c/dom/Element;
    .end local v2    # "mac":Ljava/lang/String;
    .end local v3    # "nl":Lorg/w3c/dom/NodeList;
    .end local v4    # "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    :goto_0
    return v5

    .line 52
    :catch_0
    move-exception v1

    .line 53
    .local v1, "e":Ljava/lang/Exception;
    const-string v6, "BlobStorageParser"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Exception while parsing API response "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0
.end method
