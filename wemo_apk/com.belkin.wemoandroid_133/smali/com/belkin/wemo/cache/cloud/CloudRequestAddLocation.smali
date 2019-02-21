.class public Lcom/belkin/wemo/cache/cloud/CloudRequestAddLocation;
.super Ljava/lang/Object;
.source "CloudRequestAddLocation.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;


# static fields
.field private static final KEY_HOME_ID:Ljava/lang/String; = "homeId"

.field private static final KEY_HOME_TAG:Ljava/lang/String; = "home"


# instance fields
.field private final TAG:Ljava/lang/String;

.field private TIMEOUT:I

.field private final TIMEOUT_LIMIT:I

.field private final URL:Ljava/lang/String;

.field private arpMac:Ljava/lang/String;

.field private currentHomeId:Ljava/lang/String;

.field private deviceId:Ljava/lang/String;

.field private locationName:Ljava/lang/String;

.field private mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field private newHomeId:Ljava/lang/String;

.field private ssid:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "devMgr"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "deviceId"    # Ljava/lang/String;
    .param p4, "arpMac"    # Ljava/lang/String;
    .param p5, "ssid"    # Ljava/lang/String;
    .param p6, "currentHomeId"    # Ljava/lang/String;
    .param p7, "locationName"    # Ljava/lang/String;

    .prologue
    const/16 v2, 0x7530

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/belkin/wemo/cache/cloud/CloudConstants;->CLOUD_URL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/apis/http/plugin/location/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddLocation;->URL:Ljava/lang/String;

    .line 18
    const-string v0, "SDK_CloudRequestAddLocation"

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddLocation;->TAG:Ljava/lang/String;

    .line 19
    iput v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddLocation;->TIMEOUT_LIMIT:I

    .line 26
    iput v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddLocation;->TIMEOUT:I

    .line 33
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddLocation;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 34
    iput-object p3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddLocation;->deviceId:Ljava/lang/String;

    .line 35
    iput-object p4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddLocation;->arpMac:Ljava/lang/String;

    .line 36
    iput-object p5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddLocation;->ssid:Ljava/lang/String;

    .line 37
    iput-object p6, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddLocation;->currentHomeId:Ljava/lang/String;

    .line 38
    iput-object p7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddLocation;->locationName:Ljava/lang/String;

    .line 39
    return-void
.end method

.method private parseResponse(Ljava/lang/String;)Z
    .locals 6
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 106
    :try_start_0
    new-instance v3, Lcom/belkin/wemo/cache/cloud/XMLParser;

    invoke-direct {v3}, Lcom/belkin/wemo/cache/cloud/XMLParser;-><init>()V

    .line 107
    .local v3, "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    invoke-virtual {v3, p1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getDomElement(Ljava/lang/String;)Lorg/w3c/dom/Document;

    move-result-object v0

    .line 108
    .local v0, "doc":Lorg/w3c/dom/Document;
    const-string v5, "home"

    invoke-interface {v0, v5}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v2

    .line 109
    .local v2, "nl":Lorg/w3c/dom/NodeList;
    const/4 v5, 0x0

    invoke-interface {v2, v5}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    check-cast v1, Lorg/w3c/dom/Element;

    .line 110
    .local v1, "e":Lorg/w3c/dom/Element;
    const-string v5, "homeId"

    invoke-virtual {v3, v1, v5}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddLocation;->newHomeId:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 111
    const/4 v4, 0x1

    .line 114
    .end local v0    # "doc":Lorg/w3c/dom/Document;
    .end local v1    # "e":Lorg/w3c/dom/Element;
    .end local v2    # "nl":Lorg/w3c/dom/NodeList;
    .end local v3    # "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    :goto_0
    return v4

    .line 112
    :catch_0
    move-exception v1

    .line 113
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

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
    .line 135
    const/4 v0, 0x0

    return-object v0
.end method

.method public getBody()Ljava/lang/String;
    .locals 2

    .prologue
    .line 63
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<location>\n    <home>\n        <key1>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddLocation;->arpMac:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</key1>\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "        <key2>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddLocation;->ssid:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</key2>\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "        <key3>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddLocation;->arpMac:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</key3>\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "    </home>\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "    <currentHomeId>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddLocation;->currentHomeId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</currentHomeId>\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "    <smartDevice>\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "        <smartDeviceId>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddLocation;->deviceId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</smartDeviceId>\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "        <description>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</description>\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "    </smartDevice>\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</location>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFileByteArray()[B
    .locals 1

    .prologue
    .line 120
    const/4 v0, 0x0

    return-object v0
.end method

.method public getRequestMethod()I
    .locals 1

    .prologue
    .line 43
    const/4 v0, 0x1

    return v0
.end method

.method public getTimeout()I
    .locals 1

    .prologue
    .line 48
    iget v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddLocation;->TIMEOUT:I

    return v0
.end method

.method public getTimeoutLimit()I
    .locals 1

    .prologue
    .line 53
    const/16 v0, 0x7530

    return v0
.end method

.method public getURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddLocation;->URL:Ljava/lang/String;

    return-object v0
.end method

.method public getUploadFileName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 125
    const/4 v0, 0x0

    return-object v0
.end method

.method public isAuthHeaderRequired()Z
    .locals 1

    .prologue
    .line 130
    const/4 v0, 0x1

    return v0
.end method

.method public requestComplete(ZI[B)V
    .locals 9
    .param p1, "success"    # Z
    .param p2, "statusCode"    # I
    .param p3, "resp"    # [B

    .prologue
    const/4 v8, 0x0

    .line 79
    const-string v3, "SDK_CloudRequestAddLocation"

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

    .line 80
    if-eqz p1, :cond_1

    .line 82
    :try_start_0
    new-instance v1, Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-direct {v1, p3, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 83
    .local v1, "response":Ljava/lang/String;
    const-string v3, "SDK_CloudRequestAddLocation"

    invoke-static {v3, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    invoke-direct {p0, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestAddLocation;->parseResponse(Ljava/lang/String;)Z

    move-result v2

    .line 85
    .local v2, "responseParse":Z
    const-string v3, "SDK_CloudRequestAddLocation"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "requestComplete Response parse: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " newHomeId: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddLocation;->newHomeId:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    if-eqz v2, :cond_0

    .line 87
    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddLocation;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddLocation;->newHomeId:Ljava/lang/String;

    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddLocation;->arpMac:Ljava/lang/String;

    iget-object v6, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddLocation;->ssid:Ljava/lang/String;

    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddLocation;->locationName:Ljava/lang/String;

    invoke-virtual {v3, v4, v5, v6, v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setAndAddNewLocationCallback(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    .end local v1    # "response":Ljava/lang/String;
    .end local v2    # "responseParse":Z
    :goto_0
    return-void

    .line 91
    .restart local v1    # "response":Ljava/lang/String;
    .restart local v2    # "responseParse":Z
    :cond_0
    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddLocation;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddLocation;->arpMac:Ljava/lang/String;

    iget-object v6, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddLocation;->ssid:Ljava/lang/String;

    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddLocation;->locationName:Ljava/lang/String;

    invoke-virtual {v3, v4, v5, v6, v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setAndAddNewLocationCallback(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 93
    .end local v1    # "response":Ljava/lang/String;
    .end local v2    # "responseParse":Z
    :catch_0
    move-exception v0

    .line 94
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 95
    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddLocation;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddLocation;->arpMac:Ljava/lang/String;

    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddLocation;->ssid:Ljava/lang/String;

    iget-object v6, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddLocation;->locationName:Ljava/lang/String;

    invoke-virtual {v3, v8, v4, v5, v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setAndAddNewLocationCallback(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 99
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_1
    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddLocation;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddLocation;->arpMac:Ljava/lang/String;

    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddLocation;->ssid:Ljava/lang/String;

    iget-object v6, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddLocation;->locationName:Ljava/lang/String;

    invoke-virtual {v3, v8, v4, v5, v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setAndAddNewLocationCallback(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
