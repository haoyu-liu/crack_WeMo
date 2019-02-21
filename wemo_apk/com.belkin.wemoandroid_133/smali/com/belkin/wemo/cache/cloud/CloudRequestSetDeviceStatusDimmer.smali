.class public Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;
.super Ljava/lang/Object;
.source "CloudRequestSetDeviceStatusDimmer.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;


# static fields
.field private static final KEY_PLUGIN_TAG:Ljava/lang/String; = "plugin"


# instance fields
.field private final TAG:Ljava/lang/String;

.field private TIMEOUT:I

.field private final TIMEOUT_LIMIT:I

.field private final URL:Ljava/lang/String;

.field private attributeName:Ljava/lang/String;

.field private attributeValue:Ljava/lang/String;

.field private brightnessFromCloud:Ljava/lang/String;

.field private faderFromCloud:Ljava/lang/String;

.field private mCacheManager:Lcom/belkin/wemo/cache/CacheManager;

.field private mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field private mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

.field private mDevicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

.field private mac:Ljava/lang/String;

.field private pluginID:Ljava/lang/String;

.field private state:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "udn"    # Ljava/lang/String;
    .param p3, "attributeName"    # Ljava/lang/String;
    .param p4, "attributeValue"    # Ljava/lang/String;

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
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

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->URL:Ljava/lang/String;

    .line 24
    const-class v0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->TAG:Ljava/lang/String;

    .line 25
    const v0, 0x9c40

    iput v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->TIMEOUT_LIMIT:I

    .line 34
    const/16 v0, 0x2710

    iput v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->TIMEOUT:I

    .line 43
    invoke-static {p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 44
    invoke-static {p1}, Lcom/belkin/wemo/cache/CacheManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/CacheManager;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->mCacheManager:Lcom/belkin/wemo/cache/CacheManager;

    .line 45
    invoke-static {}, Lcom/belkin/wemo/cache/data/DevicesArray;->getInstance()Lcom/belkin/wemo/cache/data/DevicesArray;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->mDevicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    .line 46
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformationList()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/cache/data/DeviceInformation;

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 47
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getPluginID()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->pluginID:Ljava/lang/String;

    .line 48
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getMAC()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->mac:Ljava/lang/String;

    .line 49
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getState()I

    move-result v0

    iput v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->state:I

    .line 50
    iput-object p3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->attributeName:Ljava/lang/String;

    .line 51
    iput-object p4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->attributeValue:Ljava/lang/String;

    .line 52
    return-void
.end method

.method private parseResponse(Ljava/lang/String;)Z
    .locals 9
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 141
    const/4 v2, 0x1

    .line 143
    .local v2, "isSuccess":Z
    :try_start_0
    new-instance v4, Lcom/belkin/wemo/cache/cloud/XMLParser;

    invoke-direct {v4}, Lcom/belkin/wemo/cache/cloud/XMLParser;-><init>()V

    .line 144
    .local v4, "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    invoke-virtual {v4, p1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getDomElement(Ljava/lang/String;)Lorg/w3c/dom/Document;

    move-result-object v0

    .line 145
    .local v0, "doc":Lorg/w3c/dom/Document;
    const-string v6, "plugin"

    invoke-interface {v0, v6}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v3

    .line 146
    .local v3, "nl":Lorg/w3c/dom/NodeList;
    const/4 v6, 0x0

    invoke-interface {v3, v6}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    check-cast v1, Lorg/w3c/dom/Element;

    .line 148
    .local v1, "e":Lorg/w3c/dom/Element;
    const-string v6, "brightness"

    invoke-virtual {v4, v1, v6}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->brightnessFromCloud:Ljava/lang/String;

    .line 149
    const-string v6, "fader"

    invoke-virtual {v4, v1, v6}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->faderFromCloud:Ljava/lang/String;

    .line 151
    const-string v6, "status"

    invoke-virtual {v4, v1, v6}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 152
    .local v5, "status":Ljava/lang/String;
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 153
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    iput v6, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->state:I

    .line 154
    iget v6, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->state:I

    const/4 v7, 0x3

    if-ne v6, v7, :cond_0

    .line 155
    const/4 v2, 0x0

    .line 161
    :cond_0
    iget-object v6, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Response parsed. Status: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "; Brightness: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->brightnessFromCloud:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "; Fader: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->faderFromCloud:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 166
    .end local v0    # "doc":Lorg/w3c/dom/Document;
    .end local v1    # "e":Lorg/w3c/dom/Element;
    .end local v3    # "nl":Lorg/w3c/dom/NodeList;
    .end local v4    # "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    .end local v5    # "status":Ljava/lang/String;
    :goto_0
    return v2

    .line 162
    :catch_0
    move-exception v1

    .line 163
    .local v1, "e":Ljava/lang/NumberFormatException;
    iget-object v6, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->TAG:Ljava/lang/String;

    const-string v7, "NumberFormatException while parsing xml response for Dimmer Attribute change: "

    invoke-static {v6, v7, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 164
    const/4 v2, 0x0

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
    .line 187
    const/4 v0, 0x0

    return-object v0
.end method

.method public getBody()Ljava/lang/String;
    .locals 3

    .prologue
    .line 76
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "<plugins>\n    <plugin>                 \n        <recipientId>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->pluginID:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</recipientId>                    \n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "        <macAddress>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->mac:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</macAddress>\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "        <content>                          \n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "            <![CDATA[ <pluginSetDeviceStatus>\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "                            <plugin>                                               \n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "                                <pluginId>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->pluginID:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</pluginId>                                                 \n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "                                <macAddress>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->mac:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</macAddress> \n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "                                <"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->attributeName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ">"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->attributeValue:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->attributeName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ">\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "                            </plugin>\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "                      </pluginSetDeviceStatus> ]]>            \n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "        </content>    \n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "    </plugin>\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</plugins>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 91
    .local v0, "xmlString":Ljava/lang/String;
    const-string v1, "xmlString::: "

    invoke-static {v1, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    return-object v0
.end method

.method public getFileByteArray()[B
    .locals 1

    .prologue
    .line 172
    const/4 v0, 0x0

    return-object v0
.end method

.method public getRequestMethod()I
    .locals 1

    .prologue
    .line 56
    const/4 v0, 0x1

    return v0
.end method

.method public getTimeout()I
    .locals 1

    .prologue
    .line 61
    iget v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->TIMEOUT:I

    return v0
.end method

.method public getTimeoutLimit()I
    .locals 1

    .prologue
    .line 66
    const v0, 0x9c40

    return v0
.end method

.method public getURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 71
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->URL:Ljava/lang/String;

    return-object v0
.end method

.method public getUploadFileName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 177
    const/4 v0, 0x0

    return-object v0
.end method

.method public isAuthHeaderRequired()Z
    .locals 1

    .prologue
    .line 182
    const/4 v0, 0x1

    return v0
.end method

.method public requestComplete(ZI[B)V
    .locals 9
    .param p1, "success"    # Z
    .param p2, "statusCode"    # I
    .param p3, "resp"    # [B

    .prologue
    .line 97
    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Attribute change request completed. is success: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    if-eqz p1, :cond_4

    .line 100
    :try_start_0
    new-instance v1, Ljava/lang/String;

    const-string v4, "UTF-8"

    invoke-direct {v1, p3, v4}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 101
    .local v1, "response":Ljava/lang/String;
    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->TAG:Ljava/lang/String;

    invoke-static {v4, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    invoke-direct {p0, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->parseResponse(Ljava/lang/String;)Z

    move-result v2

    .line 104
    .local v2, "responseParse":Z
    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Response parse - isSuccess: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {v2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    if-eqz v2, :cond_3

    .line 107
    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->faderFromCloud:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 108
    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const-string v5, "fader"

    iget-object v6, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->faderFromCloud:Ljava/lang/String;

    invoke-virtual {v4, v5, v6}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    :cond_0
    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->brightnessFromCloud:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 111
    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const-string v5, "brightness"

    iget-object v6, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->brightnessFromCloud:Ljava/lang/String;

    invoke-virtual {v4, v5, v6}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    :cond_1
    iget v4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->state:I

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    .line 114
    .local v3, "stateStr":Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 115
    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const-string v5, "binaryState"

    invoke-virtual {v4, v5, v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->state:I

    invoke-virtual {v4, v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setState(I)V

    .line 117
    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v4, v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setBinaryState(Ljava/lang/String;)V

    .line 120
    :cond_2
    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->mDevicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v4, v5}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 121
    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->mCacheManager:Lcom/belkin/wemo/cache/CacheManager;

    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x1

    invoke-virtual {v4, v5, v6, v7, v8}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 123
    .end local v3    # "stateStr":Ljava/lang/String;
    :cond_3
    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v5, "change_state"

    invoke-static {v2}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v7}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v5, v6, v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    .line 137
    .end local v1    # "response":Ljava/lang/String;
    .end local v2    # "responseParse":Z
    :goto_0
    return-void

    .line 124
    :catch_0
    move-exception v0

    .line 125
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->TAG:Ljava/lang/String;

    const-string v5, "UnsupportedEncodingException while parsing cloud response: "

    invoke-static {v4, v5, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 127
    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->restartCloudPeriodicUpdate()V

    goto :goto_0

    .line 128
    .end local v0    # "e":Ljava/io/UnsupportedEncodingException;
    :catch_1
    move-exception v0

    .line 129
    .local v0, "e":Lorg/json/JSONException;
    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->TAG:Ljava/lang/String;

    const-string v5, "JSONException while parsing cloud response: "

    invoke-static {v4, v5, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 131
    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->restartCloudPeriodicUpdate()V

    goto :goto_0

    .line 135
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_4
    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->restartCloudPeriodicUpdate()V

    goto :goto_0
.end method
