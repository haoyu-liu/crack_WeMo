.class public Lcom/belkin/wemo/cache/cloud/CloudRequestSetDataStoreOnLink;
.super Ljava/lang/Object;
.source "CloudRequestSetDataStoreOnLink.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;


# static fields
.field private static final KEY_ERROR_CODE:Ljava/lang/String; = "errorCode"

.field private static final KEY_PLUGIN_TAG:Ljava/lang/String; = "plugin"

.field private static final TAG:Ljava/lang/String; = "SetDataStoreOnLink"


# instance fields
.field private TIMEOUT:I

.field private final TIMEOUT_LIMIT:I

.field private final URL:Ljava/lang/String;

.field private callback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

.field private emergencyContacts:Ljava/lang/String;

.field private mac:Ljava/lang/String;

.field private pluginID:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/callback/SetAndGetActionCallBack;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "callback"    # Lcom/belkin/wemo/callback/SetAndGetActionCallBack;
    .param p2, "deviceID"    # Ljava/lang/String;
    .param p3, "pluginID"    # Ljava/lang/String;
    .param p4, "mac"    # Ljava/lang/String;
    .param p5, "emergencyContacts"    # Ljava/lang/String;

    .prologue
    const/16 v0, 0x7530

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDataStoreOnLink;->TIMEOUT_LIMIT:I

    .line 18
    iput v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDataStoreOnLink;->TIMEOUT:I

    .line 19
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/belkin/wemo/cache/cloud/CloudConstants;->CLOUD_URL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/apis/http/plugin/message/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDataStoreOnLink;->URL:Ljava/lang/String;

    .line 20
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDataStoreOnLink;->pluginID:Ljava/lang/String;

    .line 21
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDataStoreOnLink;->mac:Ljava/lang/String;

    .line 22
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDataStoreOnLink;->callback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    .line 23
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDataStoreOnLink;->emergencyContacts:Ljava/lang/String;

    .line 26
    iput-object p3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDataStoreOnLink;->pluginID:Ljava/lang/String;

    .line 27
    iput-object p4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDataStoreOnLink;->mac:Ljava/lang/String;

    .line 28
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDataStoreOnLink;->callback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    .line 29
    iput-object p5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDataStoreOnLink;->emergencyContacts:Ljava/lang/String;

    .line 30
    return-void
.end method

.method private buildXMLRequest()Ljava/lang/String;
    .locals 3

    .prologue
    .line 93
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "<plugins> \n<plugin> \n<recipientId>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDataStoreOnLink;->pluginID:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</recipientId> \n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<macAddress>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDataStoreOnLink;->mac:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</macAddress> \n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<content><![CDATA[<pluginId>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDataStoreOnLink;->pluginID:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</pluginId> \n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<macAddress>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDataStoreOnLink;->mac:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</macAddress> \n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<status></status> \n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<dataStores action=\"SetDataStores\">\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<dataStore> \n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<name>EmergencyContacts</name> \n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<value>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDataStoreOnLink;->emergencyContacts:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</value> \n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</dataStore> \n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</dataStores>]]></content> \n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</plugin> \n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</plugins> \n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 108
    .local v0, "xmlString":Ljava/lang/String;
    return-object v0
.end method

.method private parseResponse(Ljava/lang/String;)Z
    .locals 8
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 114
    :try_start_0
    new-instance v4, Lcom/belkin/wemo/cache/cloud/XMLParser;

    invoke-direct {v4}, Lcom/belkin/wemo/cache/cloud/XMLParser;-><init>()V

    .line 115
    .local v4, "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    invoke-virtual {v4, p1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getDomElement(Ljava/lang/String;)Lorg/w3c/dom/Document;

    move-result-object v0

    .line 116
    .local v0, "doc":Lorg/w3c/dom/Document;
    const-string v6, "plugin"

    invoke-interface {v0, v6}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v3

    .line 117
    .local v3, "nl":Lorg/w3c/dom/NodeList;
    const/4 v6, 0x0

    invoke-interface {v3, v6}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    check-cast v1, Lorg/w3c/dom/Element;

    .line 118
    .local v1, "e":Lorg/w3c/dom/Element;
    const-string v6, "errorCode"

    invoke-virtual {v4, v1, v6}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 119
    .local v2, "errorCodeVal":Ljava/lang/String;
    const-string v6, "0"

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v6

    if-eqz v6, :cond_0

    .line 120
    const/4 v5, 0x1

    .line 125
    .end local v0    # "doc":Lorg/w3c/dom/Document;
    .end local v1    # "e":Lorg/w3c/dom/Element;
    .end local v2    # "errorCodeVal":Ljava/lang/String;
    .end local v3    # "nl":Lorg/w3c/dom/NodeList;
    .end local v4    # "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    :cond_0
    :goto_0
    return v5

    .line 123
    :catch_0
    move-exception v1

    .line 124
    .local v1, "e":Ljava/lang/Exception;
    const-string v6, "SetDataStoreOnLink"

    const-string v7, "Exception in parsing the response:"

    invoke-static {v6, v7, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

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
    .line 136
    const/4 v0, 0x0

    return-object v0
.end method

.method public getBody()Ljava/lang/String;
    .locals 1

    .prologue
    .line 79
    invoke-direct {p0}, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDataStoreOnLink;->buildXMLRequest()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFileByteArray()[B
    .locals 1

    .prologue
    .line 84
    const/4 v0, 0x0

    return-object v0
.end method

.method public getRequestMethod()I
    .locals 1

    .prologue
    .line 58
    const/4 v0, 0x1

    return v0
.end method

.method public getTimeout()I
    .locals 1

    .prologue
    .line 63
    iget v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDataStoreOnLink;->TIMEOUT:I

    return v0
.end method

.method public getTimeoutLimit()I
    .locals 1

    .prologue
    .line 68
    const/16 v0, 0x7530

    return v0
.end method

.method public getURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 73
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDataStoreOnLink;->URL:Ljava/lang/String;

    return-object v0
.end method

.method public getUploadFileName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 89
    const/4 v0, 0x0

    return-object v0
.end method

.method public isAuthHeaderRequired()Z
    .locals 1

    .prologue
    .line 131
    const/4 v0, 0x1

    return v0
.end method

.method public requestComplete(ZI[B)V
    .locals 6
    .param p1, "success"    # Z
    .param p2, "statusCode"    # I
    .param p3, "resp"    # [B

    .prologue
    .line 35
    const-string v3, "SetDataStoreOnLink"

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

    .line 36
    if-eqz p1, :cond_1

    .line 38
    :try_start_0
    new-instance v1, Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-direct {v1, p3, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 39
    .local v1, "response":Ljava/lang/String;
    const-string v3, "SetDataStoreOnLink"

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

    .line 40
    invoke-direct {p0, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDataStoreOnLink;->parseResponse(Ljava/lang/String;)Z

    move-result v2

    .line 41
    .local v2, "responseParse":Z
    if-eqz v2, :cond_0

    .line 42
    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDataStoreOnLink;->callback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    const-string v4, "Success in setting the emergency contacts"

    invoke-interface {v3, v4}, Lcom/belkin/wemo/callback/SetAndGetActionCallBack;->onSuccess(Ljava/lang/String;)V

    .line 54
    .end local v1    # "response":Ljava/lang/String;
    .end local v2    # "responseParse":Z
    :goto_0
    return-void

    .line 44
    .restart local v1    # "response":Ljava/lang/String;
    .restart local v2    # "responseParse":Z
    :cond_0
    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDataStoreOnLink;->callback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    invoke-interface {v3}, Lcom/belkin/wemo/callback/SetAndGetActionCallBack;->onError()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 45
    .end local v1    # "response":Ljava/lang/String;
    .end local v2    # "responseParse":Z
    :catch_0
    move-exception v0

    .line 46
    .local v0, "e":Ljava/lang/Exception;
    const-string v3, "SetDataStoreOnLink"

    const-string v4, "Exception occured in Cloud request for Sensor Event History"

    invoke-static {v3, v4, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 47
    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDataStoreOnLink;->callback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    invoke-interface {v3}, Lcom/belkin/wemo/callback/SetAndGetActionCallBack;->onError()V

    goto :goto_0

    .line 51
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_1
    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDataStoreOnLink;->callback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    invoke-interface {v3}, Lcom/belkin/wemo/callback/SetAndGetActionCallBack;->onError()V

    goto :goto_0
.end method
