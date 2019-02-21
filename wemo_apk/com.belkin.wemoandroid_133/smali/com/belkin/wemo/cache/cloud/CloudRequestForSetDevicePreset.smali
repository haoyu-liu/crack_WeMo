.class public Lcom/belkin/wemo/cache/cloud/CloudRequestForSetDevicePreset;
.super Ljava/lang/Object;
.source "CloudRequestForSetDevicePreset.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;


# instance fields
.field private final TAG:Ljava/lang/String;

.field private TIMEOUT:I

.field private final TIMEOUT_LIMIT:I

.field private final URL:Ljava/lang/String;

.field private callback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

.field private id:Ljava/lang/String;

.field private isGroupId:Ljava/lang/String;

.field private name:Ljava/lang/String;

.field private type:Ljava/lang/String;

.field private value:Ljava/lang/String;

.field private version:Ljava/lang/String;


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

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    const-string v0, "CloudRequestForSetDevicePreset"

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSetDevicePreset;->TAG:Ljava/lang/String;

    .line 22
    iput v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSetDevicePreset;->TIMEOUT_LIMIT:I

    .line 23
    iput v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSetDevicePreset;->TIMEOUT:I

    .line 24
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/belkin/wemo/cache/cloud/CloudConstants;->CLOUD_URL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/apis/http/device/presets/preset/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSetDevicePreset;->URL:Ljava/lang/String;

    .line 25
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSetDevicePreset;->version:Ljava/lang/String;

    .line 26
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSetDevicePreset;->isGroupId:Ljava/lang/String;

    .line 27
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSetDevicePreset;->id:Ljava/lang/String;

    .line 28
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSetDevicePreset;->name:Ljava/lang/String;

    .line 29
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSetDevicePreset;->value:Ljava/lang/String;

    .line 30
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSetDevicePreset;->type:Ljava/lang/String;

    .line 31
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSetDevicePreset;->callback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    .line 41
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSetDevicePreset;->callback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    .line 42
    invoke-direct {p0, p2}, Lcom/belkin/wemo/cache/cloud/CloudRequestForSetDevicePreset;->initSetPresetRequestValues(Lorg/json/JSONArray;)V

    .line 43
    return-void
.end method

.method private buildXMLRequest()Ljava/lang/String;
    .locals 3

    .prologue
    .line 103
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "<presetList> \n<devicePreset> \n<id>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSetDevicePreset;->id:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</id> \n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<isGroupID>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSetDevicePreset;->isGroupId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</isGroupID> \n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<version>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSetDevicePreset;->version:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</version> \n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<content> \n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<![CDATA[<setDevicePreset> <presetList> <presets>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " <version>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSetDevicePreset;->version:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</version>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " <isGroupID>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSetDevicePreset;->isGroupId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</isGroupID>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " <id>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSetDevicePreset;->id:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</id>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " <preset>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " <name>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSetDevicePreset;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</name> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<value>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSetDevicePreset;->value:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</value> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<type>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSetDevicePreset;->type:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</type> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</preset> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</presets> </presetList> </setDevicePreset>]]> \n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</content> \n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<presets> \n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<preset> \n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<name>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSetDevicePreset;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</name> \n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<value>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSetDevicePreset;->value:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</value> \n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<type>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSetDevicePreset;->type:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</type> \n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</preset> \n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</presets> \n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</devicePreset> \n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</presetList>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 129
    .local v0, "xmlString":Ljava/lang/String;
    return-object v0
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

    .line 157
    invoke-virtual {p1, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "version"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSetDevicePreset;->version:Ljava/lang/String;

    .line 158
    invoke-virtual {p1, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "isGroupID"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSetDevicePreset;->isGroupId:Ljava/lang/String;

    .line 159
    invoke-virtual {p1, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "id"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSetDevicePreset;->id:Ljava/lang/String;

    .line 160
    invoke-virtual {p1, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "name"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSetDevicePreset;->name:Ljava/lang/String;

    .line 161
    invoke-virtual {p1, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "value"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSetDevicePreset;->value:Ljava/lang/String;

    .line 162
    invoke-virtual {p1, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "type"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSetDevicePreset;->type:Ljava/lang/String;

    .line 163
    return-void
.end method

.method private parseResponse(Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 133
    const-string v5, ""

    .line 134
    .local v5, "result":Ljava/lang/String;
    new-instance v4, Lcom/belkin/wemo/cache/cloud/XMLParser;

    invoke-direct {v4}, Lcom/belkin/wemo/cache/cloud/XMLParser;-><init>()V

    .line 135
    .local v4, "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    invoke-virtual {v4, p1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getDomElement(Ljava/lang/String;)Lorg/w3c/dom/Document;

    move-result-object v0

    .line 136
    .local v0, "doc":Lorg/w3c/dom/Document;
    const-string v6, "devicePreset"

    invoke-interface {v0, v6}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v3

    .line 138
    .local v3, "nl":Lorg/w3c/dom/NodeList;
    if-eqz v3, :cond_1

    invoke-interface {v3}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v6

    if-lez v6, :cond_1

    .line 139
    const/4 v6, 0x0

    invoke-interface {v3, v6}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    check-cast v1, Lorg/w3c/dom/Element;

    .line 140
    .local v1, "e":Lorg/w3c/dom/Element;
    const-string v6, "resultCode"

    invoke-virtual {v4, v1, v6}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 141
    .local v2, "name":Ljava/lang/String;
    if-eqz v2, :cond_0

    const-string v6, ""

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 142
    :cond_0
    const-string v5, "success"

    .line 147
    .end local v1    # "e":Lorg/w3c/dom/Element;
    .end local v2    # "name":Ljava/lang/String;
    :cond_1
    :goto_0
    const-string v6, "CloudRequestForSetDevicePreset"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "parseResponse:: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 148
    return-object v5

    .line 144
    .restart local v1    # "e":Lorg/w3c/dom/Element;
    .restart local v2    # "name":Ljava/lang/String;
    :cond_2
    const-string v5, "error"

    goto :goto_0
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
    .line 172
    const/4 v0, 0x0

    return-object v0
.end method

.method public getBody()Ljava/lang/String;
    .locals 1

    .prologue
    .line 89
    invoke-direct {p0}, Lcom/belkin/wemo/cache/cloud/CloudRequestForSetDevicePreset;->buildXMLRequest()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFileByteArray()[B
    .locals 1

    .prologue
    .line 94
    const/4 v0, 0x0

    return-object v0
.end method

.method public getRequestMethod()I
    .locals 1

    .prologue
    .line 68
    const/4 v0, 0x1

    return v0
.end method

.method public getTimeout()I
    .locals 1

    .prologue
    .line 73
    iget v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSetDevicePreset;->TIMEOUT:I

    return v0
.end method

.method public getTimeoutLimit()I
    .locals 1

    .prologue
    .line 78
    const/16 v0, 0x7530

    return v0
.end method

.method public getURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 83
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSetDevicePreset;->URL:Ljava/lang/String;

    return-object v0
.end method

.method public getUploadFileName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 99
    const/4 v0, 0x0

    return-object v0
.end method

.method public isAuthHeaderRequired()Z
    .locals 1

    .prologue
    .line 167
    const/4 v0, 0x1

    return v0
.end method

.method public requestComplete(ZI[B)V
    .locals 6
    .param p1, "success"    # Z
    .param p2, "statusCode"    # I
    .param p3, "resp"    # [B

    .prologue
    .line 48
    const-string v3, "CloudRequestForSetDevicePreset"

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

    .line 49
    if-eqz p1, :cond_0

    .line 51
    :try_start_0
    new-instance v1, Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-direct {v1, p3, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 52
    .local v1, "response":Ljava/lang/String;
    const-string v3, "CloudRequestForSetDevicePreset"

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

    .line 53
    invoke-direct {p0, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestForSetDevicePreset;->parseResponse(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 54
    .local v2, "result":Ljava/lang/String;
    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSetDevicePreset;->callback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    invoke-interface {v3, v2}, Lcom/belkin/wemo/callback/SetAndGetActionCallBack;->onSuccess(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 64
    .end local v1    # "response":Ljava/lang/String;
    .end local v2    # "result":Ljava/lang/String;
    :goto_0
    return-void

    .line 55
    :catch_0
    move-exception v0

    .line 56
    .local v0, "e":Ljava/lang/Exception;
    const-string v3, "CloudRequestForSetDevicePreset"

    const-string v4, "Exception occured in Cloud request for set device preset"

    invoke-static {v3, v4, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 57
    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSetDevicePreset;->callback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    invoke-interface {v3}, Lcom/belkin/wemo/callback/SetAndGetActionCallBack;->onError()V

    goto :goto_0

    .line 61
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSetDevicePreset;->callback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    invoke-interface {v3}, Lcom/belkin/wemo/callback/SetAndGetActionCallBack;->onError()V

    goto :goto_0
.end method
