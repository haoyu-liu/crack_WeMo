.class public Lcom/belkin/wemo/cache/cloud/CloudRequestForGetDevicePreset;
.super Ljava/lang/Object;
.source "CloudRequestForGetDevicePreset.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;


# instance fields
.field private final TAG:Ljava/lang/String;

.field private TIMEOUT:I

.field private final TIMEOUT_LIMIT:I

.field private URL:Ljava/lang/String;

.field private callback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

.field private id:Ljava/lang/String;

.field private isGroupId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/callback/SetAndGetActionCallBack;Lorg/json/JSONArray;)V
    .locals 2
    .param p1, "callback"    # Lcom/belkin/wemo/callback/SetAndGetActionCallBack;
    .param p2, "presetsInfo"    # Lorg/json/JSONArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/16 v1, 0x7530

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    const-string v0, "CloudRequestForGetDevicePreset"

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForGetDevicePreset;->TAG:Ljava/lang/String;

    .line 23
    iput v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForGetDevicePreset;->TIMEOUT_LIMIT:I

    .line 24
    iput v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForGetDevicePreset;->TIMEOUT:I

    .line 25
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/belkin/wemo/cache/cloud/CloudConstants;->CLOUD_URL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/apis/http/device/presets/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForGetDevicePreset;->URL:Ljava/lang/String;

    .line 26
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForGetDevicePreset;->callback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    .line 27
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForGetDevicePreset;->isGroupId:Ljava/lang/String;

    .line 28
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForGetDevicePreset;->id:Ljava/lang/String;

    .line 38
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForGetDevicePreset;->callback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    .line 39
    invoke-direct {p0, p2}, Lcom/belkin/wemo/cache/cloud/CloudRequestForGetDevicePreset;->initSetPresetRequestValues(Lorg/json/JSONArray;)V

    .line 40
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForGetDevicePreset;->isGroupId:Ljava/lang/String;

    const-string v1, "0"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 41
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForGetDevicePreset;->URL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "device/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForGetDevicePreset;->id:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForGetDevicePreset;->URL:Ljava/lang/String;

    .line 45
    :goto_0
    return-void

    .line 43
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForGetDevicePreset;->URL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "group/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForGetDevicePreset;->id:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForGetDevicePreset;->URL:Ljava/lang/String;

    goto :goto_0
.end method

.method private initSetPresetRequestValues(Lorg/json/JSONArray;)V
    .locals 3
    .param p1, "presetsInfo"    # Lorg/json/JSONArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 142
    invoke-virtual {p1, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "isGroupID"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForGetDevicePreset;->isGroupId:Ljava/lang/String;

    .line 143
    invoke-virtual {p1, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "id"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForGetDevicePreset;->id:Ljava/lang/String;

    .line 144
    return-void
.end method

.method private parseResponse(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 20
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 105
    new-instance v8, Lorg/json/JSONObject;

    invoke-direct {v8}, Lorg/json/JSONObject;-><init>()V

    .line 107
    .local v8, "jsonResp":Lorg/json/JSONObject;
    :try_start_0
    new-instance v13, Lcom/belkin/wemo/cache/cloud/XMLParser;

    invoke-direct {v13}, Lcom/belkin/wemo/cache/cloud/XMLParser;-><init>()V

    .line 108
    .local v13, "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    sget-object v12, Lcom/belkin/wemo/cache/utils/Constants;->KEY_GET_DEVICE_PRESET_DATA:[Ljava/lang/String;

    .line 109
    .local v12, "paramKeys":[Ljava/lang/String;
    move-object/from16 v0, p1

    invoke-virtual {v13, v0}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getDomElement(Ljava/lang/String;)Lorg/w3c/dom/Document;

    move-result-object v4

    .line 110
    .local v4, "doc":Lorg/w3c/dom/Document;
    const-string v17, "devicePreset"

    move-object/from16 v0, v17

    invoke-interface {v4, v0}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v10

    .line 111
    .local v10, "nList":Lorg/w3c/dom/NodeList;
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-interface {v10, v0}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v3

    check-cast v3, Lorg/w3c/dom/Element;

    .line 112
    .local v3, "devicePreset":Lorg/w3c/dom/Element;
    if-eqz v3, :cond_2

    .line 113
    const/16 v17, 0x0

    aget-object v17, v12, v17

    const/16 v18, 0x0

    aget-object v18, v12, v18

    move-object/from16 v0, v18

    invoke-virtual {v13, v3, v0}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v8, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 114
    const/16 v17, 0x1

    aget-object v17, v12, v17

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestForGetDevicePreset;->isGroupId:Ljava/lang/String;

    move-object/from16 v18, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v8, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 115
    const/16 v17, 0x2

    aget-object v17, v12, v17

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestForGetDevicePreset;->id:Ljava/lang/String;

    move-object/from16 v18, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v8, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 116
    const-string v17, "preset"

    move-object/from16 v0, v17

    invoke-interface {v3, v0}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v10

    .line 117
    new-instance v15, Lorg/json/JSONArray;

    invoke-direct {v15}, Lorg/json/JSONArray;-><init>()V

    .line 118
    .local v15, "presetList":Lorg/json/JSONArray;
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    invoke-interface {v10}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v17

    move/from16 v0, v17

    if-ge v6, v0, :cond_1

    .line 119
    invoke-interface {v10, v6}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v14

    check-cast v14, Lorg/w3c/dom/Element;

    .line 120
    .local v14, "preset":Lorg/w3c/dom/Element;
    new-instance v11, Lorg/json/JSONObject;

    invoke-direct {v11}, Lorg/json/JSONObject;-><init>()V

    .line 121
    .local v11, "obj":Lorg/json/JSONObject;
    sget-object v2, Lcom/belkin/wemo/cache/utils/Constants;->KEY_GET_PRESET_DATA:[Ljava/lang/String;

    .local v2, "arr$":[Ljava/lang/String;
    array-length v9, v2

    .local v9, "len$":I
    const/4 v7, 0x0

    .local v7, "i$":I
    :goto_1
    if-ge v7, v9, :cond_0

    aget-object v16, v2, v7

    .line 122
    .local v16, "tag":Ljava/lang/String;
    move-object/from16 v0, v16

    invoke-virtual {v13, v14, v0}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-virtual {v11, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 121
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 124
    .end local v16    # "tag":Ljava/lang/String;
    :cond_0
    invoke-virtual {v15, v11}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 118
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 126
    .end local v2    # "arr$":[Ljava/lang/String;
    .end local v7    # "i$":I
    .end local v9    # "len$":I
    .end local v11    # "obj":Lorg/json/JSONObject;
    .end local v14    # "preset":Lorg/w3c/dom/Element;
    :cond_1
    const-string v17, "preset"

    move-object/from16 v0, v17

    invoke-virtual {v8, v0, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 133
    .end local v3    # "devicePreset":Lorg/w3c/dom/Element;
    .end local v4    # "doc":Lorg/w3c/dom/Document;
    .end local v6    # "i":I
    .end local v10    # "nList":Lorg/w3c/dom/NodeList;
    .end local v12    # "paramKeys":[Ljava/lang/String;
    .end local v13    # "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    .end local v15    # "presetList":Lorg/json/JSONArray;
    :cond_2
    :goto_2
    return-object v8

    .line 129
    :catch_0
    move-exception v5

    .line 130
    .local v5, "e":Ljava/lang/Exception;
    const-string v17, "CloudRequestForGetDevicePreset"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, " Exception while parsing get preset list "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2
.end method


# virtual methods
.method public getAdditionalHeaders()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 153
    const/4 v0, 0x0

    return-object v0
.end method

.method public getBody()Ljava/lang/String;
    .locals 1

    .prologue
    .line 91
    const-string v0, ""

    return-object v0
.end method

.method public getFileByteArray()[B
    .locals 1

    .prologue
    .line 96
    const/4 v0, 0x0

    return-object v0
.end method

.method public getRequestMethod()I
    .locals 1

    .prologue
    .line 70
    const/4 v0, 0x2

    return v0
.end method

.method public getTimeout()I
    .locals 1

    .prologue
    .line 75
    iget v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForGetDevicePreset;->TIMEOUT:I

    return v0
.end method

.method public getTimeoutLimit()I
    .locals 1

    .prologue
    .line 80
    const/16 v0, 0x7530

    return v0
.end method

.method public getURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForGetDevicePreset;->URL:Ljava/lang/String;

    return-object v0
.end method

.method public getUploadFileName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 101
    const/4 v0, 0x0

    return-object v0
.end method

.method public isAuthHeaderRequired()Z
    .locals 1

    .prologue
    .line 148
    const/4 v0, 0x1

    return v0
.end method

.method public requestComplete(ZI[B)V
    .locals 6
    .param p1, "success"    # Z
    .param p2, "statusCode"    # I
    .param p3, "resp"    # [B

    .prologue
    .line 50
    const-string v3, "CloudRequestForGetDevicePreset"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "requestComplete status: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    if-eqz p1, :cond_0

    .line 53
    :try_start_0
    new-instance v1, Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-direct {v1, p3, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 54
    .local v1, "response":Ljava/lang/String;
    const-string v3, "CloudRequestForGetDevicePreset"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, " :: response is:: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    invoke-direct {p0, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestForGetDevicePreset;->parseResponse(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 56
    .local v2, "result":Lorg/json/JSONObject;
    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForGetDevicePreset;->callback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lcom/belkin/wemo/callback/SetAndGetActionCallBack;->onSuccess(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 66
    .end local v1    # "response":Ljava/lang/String;
    .end local v2    # "result":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 57
    :catch_0
    move-exception v0

    .line 58
    .local v0, "e":Ljava/lang/Exception;
    const-string v3, "CloudRequestForGetDevicePreset"

    const-string v4, "Exception occured in Cloud request for get device preset"

    invoke-static {v3, v4, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 59
    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForGetDevicePreset;->callback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    invoke-interface {v3}, Lcom/belkin/wemo/callback/SetAndGetActionCallBack;->onError()V

    goto :goto_0

    .line 63
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForGetDevicePreset;->callback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    invoke-interface {v3}, Lcom/belkin/wemo/callback/SetAndGetActionCallBack;->onError()V

    goto :goto_0
.end method
