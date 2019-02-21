.class public Lcom/belkin/wemo/cache/cloud/CloudRequestZigbeeStateChange;
.super Ljava/lang/Object;
.source "CloudRequestZigbeeStateChange.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;


# static fields
.field private static final KEY_FRIENDLY_NAME:Ljava/lang/String; = "friendlyName"

.field private static final KEY_PLUGIN_TAG:Ljava/lang/String; = "plugin"

.field private static final KEY_STATUS:Ljava/lang/String; = "status"


# instance fields
.field private final KEY_CAPABILITY_ID:Ljava/lang/String;

.field private final KEY_CAPABILITY_PROFILE:Ljava/lang/String;

.field private final KEY_CAPABILITY_ROOT:Ljava/lang/String;

.field private final KEY_CAPABILITY_VALUE:Ljava/lang/String;

.field private final TAG:Ljava/lang/String;

.field private TIMEOUT:I

.field private final TIMEOUT_LIMIT:I

.field private final URL:Ljava/lang/String;

.field private capabilityID:Ljava/lang/String;

.field private capabilityName:Ljava/lang/String;

.field private capabilityValue:Ljava/lang/String;

.field private deviceId:Ljava/lang/String;

.field private isGroupAction:Ljava/lang/String;

.field private mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field private mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

.field private modelCode:Ljava/lang/String;

.field private pluginID:Ljava/lang/String;

.field private responseCapabilityID:Ljava/lang/String;

.field private responseCapabilityValue:Ljava/lang/String;

.field private state:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "deviceId"    # Ljava/lang/String;
    .param p3, "capabilityID"    # Ljava/lang/String;
    .param p4, "capabilityName"    # Ljava/lang/String;
    .param p5, "capabilityValue"    # Ljava/lang/String;
    .param p6, "state"    # I
    .param p7, "pluginID"    # Ljava/lang/String;
    .param p8, "modelCode"    # Ljava/lang/String;

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/belkin/wemo/cache/cloud/CloudConstants;->CLOUD_URL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/apis/http/device/homeDevices/capabilityProfile?remoteSync=true"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestZigbeeStateChange;->URL:Ljava/lang/String;

    .line 24
    const-string v0, "SDK_CloudRequestZigbeeStateChange"

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestZigbeeStateChange;->TAG:Ljava/lang/String;

    .line 25
    const/4 v0, 0x4

    iput v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestZigbeeStateChange;->TIMEOUT_LIMIT:I

    .line 27
    const/16 v0, 0x2710

    iput v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestZigbeeStateChange;->TIMEOUT:I

    .line 38
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestZigbeeStateChange;->responseCapabilityID:Ljava/lang/String;

    .line 39
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestZigbeeStateChange;->responseCapabilityValue:Ljava/lang/String;

    .line 40
    const-string v0, "deviceCapabilityProfiles"

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestZigbeeStateChange;->KEY_CAPABILITY_ROOT:Ljava/lang/String;

    .line 41
    const-string v0, "capabilityProfile"

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestZigbeeStateChange;->KEY_CAPABILITY_PROFILE:Ljava/lang/String;

    .line 42
    const-string v0, "capabilityId"

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestZigbeeStateChange;->KEY_CAPABILITY_ID:Ljava/lang/String;

    .line 43
    const-string v0, "currentValue"

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestZigbeeStateChange;->KEY_CAPABILITY_VALUE:Ljava/lang/String;

    .line 49
    invoke-static {p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestZigbeeStateChange;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 50
    iput-object p2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestZigbeeStateChange;->deviceId:Ljava/lang/String;

    .line 51
    iput-object p3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestZigbeeStateChange;->capabilityID:Ljava/lang/String;

    .line 52
    iput-object p4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestZigbeeStateChange;->capabilityName:Ljava/lang/String;

    .line 53
    iput-object p5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestZigbeeStateChange;->capabilityValue:Ljava/lang/String;

    .line 54
    iput p6, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestZigbeeStateChange;->state:I

    .line 55
    iput-object p8, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestZigbeeStateChange;->modelCode:Ljava/lang/String;

    .line 56
    iput-object p7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestZigbeeStateChange;->pluginID:Ljava/lang/String;

    .line 57
    return-void
.end method

.method private extractCapabilities(Lcom/belkin/wemo/cache/cloud/XMLParser;Lorg/w3c/dom/Element;)V
    .locals 9
    .param p1, "parser"    # Lcom/belkin/wemo/cache/cloud/XMLParser;
    .param p2, "e"    # Lorg/w3c/dom/Element;

    .prologue
    .line 164
    :try_start_0
    const-string v7, "deviceCapabilityProfiles"

    invoke-interface {p2, v7}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v7

    const/4 v8, 0x0

    invoke-interface {v7, v8}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v4

    .line 165
    .local v4, "root":Lorg/w3c/dom/Node;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v7

    invoke-interface {v7}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v7

    if-ge v2, v7, :cond_0

    .line 166
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v7

    invoke-interface {v7, v2}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v0

    check-cast v0, Lorg/w3c/dom/Element;

    .line 167
    .local v0, "el":Lorg/w3c/dom/Element;
    const-string v7, "capabilityProfile"

    invoke-interface {v0, v7}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v7

    const/4 v8, 0x0

    invoke-interface {v7, v8}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v5

    check-cast v5, Lorg/w3c/dom/Element;

    .line 169
    .local v5, "subEl":Lorg/w3c/dom/Element;
    const-string v7, "capabilityId"

    invoke-virtual {p1, v5, v7}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 170
    .local v3, "key":Ljava/lang/String;
    const-string v7, "currentValue"

    invoke-virtual {p1, v0, v7}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 171
    .local v6, "value":Ljava/lang/String;
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestZigbeeStateChange;->capabilityID:Ljava/lang/String;

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 172
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestZigbeeStateChange;->capabilityID:Ljava/lang/String;

    iput-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestZigbeeStateChange;->responseCapabilityID:Ljava/lang/String;

    .line 173
    iput-object v6, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestZigbeeStateChange;->responseCapabilityValue:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 181
    .end local v0    # "el":Lorg/w3c/dom/Element;
    .end local v2    # "i":I
    .end local v3    # "key":Ljava/lang/String;
    .end local v4    # "root":Lorg/w3c/dom/Node;
    .end local v5    # "subEl":Lorg/w3c/dom/Element;
    .end local v6    # "value":Ljava/lang/String;
    :cond_0
    :goto_1
    return-void

    .line 165
    .restart local v0    # "el":Lorg/w3c/dom/Element;
    .restart local v2    # "i":I
    .restart local v3    # "key":Ljava/lang/String;
    .restart local v4    # "root":Lorg/w3c/dom/Node;
    .restart local v5    # "subEl":Lorg/w3c/dom/Element;
    .restart local v6    # "value":Ljava/lang/String;
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 177
    .end local v0    # "el":Lorg/w3c/dom/Element;
    .end local v2    # "i":I
    .end local v3    # "key":Ljava/lang/String;
    .end local v4    # "root":Lorg/w3c/dom/Node;
    .end local v5    # "subEl":Lorg/w3c/dom/Element;
    .end local v6    # "value":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 178
    .local v1, "ex":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method private parseResponse(Ljava/lang/String;)Z
    .locals 8
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 136
    :try_start_0
    new-instance v3, Lcom/belkin/wemo/cache/cloud/XMLParser;

    invoke-direct {v3}, Lcom/belkin/wemo/cache/cloud/XMLParser;-><init>()V

    .line 137
    .local v3, "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    invoke-virtual {v3, p1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getDomElement(Ljava/lang/String;)Lorg/w3c/dom/Document;

    move-result-object v0

    .line 138
    .local v0, "doc":Lorg/w3c/dom/Document;
    const-string v5, "device"

    invoke-interface {v0, v5}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v2

    .line 139
    .local v2, "nl":Lorg/w3c/dom/NodeList;
    const/4 v5, 0x0

    invoke-interface {v2, v5}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    check-cast v1, Lorg/w3c/dom/Element;

    .line 141
    .local v1, "e":Lorg/w3c/dom/Element;
    const-string v5, "setNewStateForDevice: "

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "success: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "status"

    invoke-virtual {v3, v1, v7}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    invoke-direct {p0, v3, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestZigbeeStateChange;->extractCapabilities(Lcom/belkin/wemo/cache/cloud/XMLParser;Lorg/w3c/dom/Element;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 143
    const/4 v4, 0x1

    .line 146
    .end local v0    # "doc":Lorg/w3c/dom/Document;
    .end local v1    # "e":Lorg/w3c/dom/Element;
    .end local v2    # "nl":Lorg/w3c/dom/NodeList;
    .end local v3    # "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    :goto_0
    return v4

    .line 144
    :catch_0
    move-exception v1

    .line 145
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
    .line 190
    const/4 v0, 0x0

    return-object v0
.end method

.method public getBody()Ljava/lang/String;
    .locals 6

    .prologue
    .line 81
    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestZigbeeStateChange;->capabilityID:Ljava/lang/String;

    const-string v5, "\\s*,\\s*"

    invoke-virtual {v4, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    .line 82
    .local v1, "capabilityIdList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestZigbeeStateChange;->capabilityValue:Ljava/lang/String;

    const-string v5, "\\s*,\\s*"

    invoke-virtual {v4, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    .line 87
    .local v2, "capabilityValueList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "<devices>\n    <device> \n        <pluginId>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestZigbeeStateChange;->pluginID:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "</pluginId> \n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "        <macAddress>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestZigbeeStateChange;->deviceId:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "</macAddress> \n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "        <modelCode>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestZigbeeStateChange;->modelCode:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "</modelCode>\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "        <status>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestZigbeeStateChange;->state:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "</status>\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "        <deviceCapabilityProfiles>\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 95
    .local v0, "XMLBody":Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    if-ge v3, v4, :cond_0

    .line 96
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "            <deviceCapabilityProfile>\n                <capabilityId>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "</capabilityId> \n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "                <currentValue>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "</currentValue>\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "            </deviceCapabilityProfile>\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 95
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 102
    :cond_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "         </deviceCapabilityProfiles>\n       </device>\n</devices>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 105
    return-object v0
.end method

.method public getFileByteArray()[B
    .locals 1

    .prologue
    .line 153
    const/4 v0, 0x0

    return-object v0
.end method

.method public getRequestMethod()I
    .locals 1

    .prologue
    .line 61
    const/4 v0, 0x4

    return v0
.end method

.method public getTimeout()I
    .locals 1

    .prologue
    .line 66
    iget v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestZigbeeStateChange;->TIMEOUT:I

    return v0
.end method

.method public getTimeoutLimit()I
    .locals 1

    .prologue
    .line 71
    const/4 v0, 0x4

    return v0
.end method

.method public getURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 76
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestZigbeeStateChange;->URL:Ljava/lang/String;

    return-object v0
.end method

.method public getUploadFileName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 159
    const/4 v0, 0x0

    return-object v0
.end method

.method public isAuthHeaderRequired()Z
    .locals 1

    .prologue
    .line 185
    const/4 v0, 0x1

    return v0
.end method

.method public requestComplete(ZI[B)V
    .locals 7
    .param p1, "success"    # Z
    .param p2, "statusCode"    # I
    .param p3, "resp"    # [B

    .prologue
    .line 110
    const-string v3, "setNewStateForDevice: "

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "success: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    const/4 v2, 0x0

    .line 112
    .local v2, "responseParse":Z
    if-eqz p1, :cond_1

    .line 114
    :try_start_0
    new-instance v1, Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-direct {v1, p3, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 115
    .local v1, "response":Ljava/lang/String;
    const-string v3, "SDK_CloudRequestZigbeeStateChange"

    invoke-static {v3, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    invoke-direct {p0, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestZigbeeStateChange;->parseResponse(Ljava/lang/String;)Z

    move-result v2

    .line 117
    const-string v3, "SDK_CloudRequestZigbeeStateChange"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Response parse: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 118
    if-eqz v2, :cond_0

    .line 119
    const-string v3, "SDK_CloudRequestZigbeeStateChange"

    const-string v4, "Request complete: "

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestZigbeeStateChange;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->updateZigbeeStateResponse()V

    .line 121
    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestZigbeeStateChange;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestZigbeeStateChange;->deviceId:Ljava/lang/String;

    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestZigbeeStateChange;->capabilityID:Ljava/lang/String;

    iget-object v6, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestZigbeeStateChange;->capabilityValue:Ljava/lang/String;

    invoke-virtual {v3, v4, v5, v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->updateZigbeeCapability(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 122
    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestZigbeeStateChange;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v4, "set_state"

    invoke-static {v2}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestZigbeeStateChange;->deviceId:Ljava/lang/String;

    invoke-virtual {v3, v4, v5, v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 132
    .end local v1    # "response":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 124
    :catch_0
    move-exception v0

    .line 125
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    .line 126
    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestZigbeeStateChange;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v4, "set_state"

    invoke-static {v2}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestZigbeeStateChange;->deviceId:Ljava/lang/String;

    invoke-virtual {v3, v4, v5, v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 129
    .end local v0    # "e":Ljava/io/UnsupportedEncodingException;
    :cond_1
    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestZigbeeStateChange;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v4, "set_state"

    invoke-static {p1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestZigbeeStateChange;->deviceId:Ljava/lang/String;

    invoke-virtual {v3, v4, v5, v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
