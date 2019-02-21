.class public Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;
.super Ljava/lang/Object;
.source "CloudRequestUpdateFirmware.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;


# static fields
.field private static final PLUGINS:Ljava/lang/String; = "plugins"

.field private static final RESULT_CODE:Ljava/lang/String; = "resultCode"

.field private static UPDATE_FAILED:Ljava/lang/String;

.field private static UPDATE_STARTED:Ljava/lang/String;


# instance fields
.field private final TAG:Ljava/lang/String;

.field private TIMEOUT:I

.field private final TIMEOUT_LIMIT:I

.field private final URL:Ljava/lang/String;

.field private bridgeMacAddress:Ljava/lang/String;

.field private isZigbee:Z

.field private mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field private macAddress:Ljava/lang/String;

.field private pluginID:Ljava/lang/String;

.field private signature:Ljava/lang/String;

.field private udn:Ljava/lang/String;

.field private url:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 31
    const-string v0, "2"

    sput-object v0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->UPDATE_FAILED:Ljava/lang/String;

    .line 32
    const-string v0, "0"

    sput-object v0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->UPDATE_STARTED:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "macAddress"    # Ljava/lang/String;
    .param p3, "pluginID"    # Ljava/lang/String;
    .param p4, "url"    # Ljava/lang/String;
    .param p5, "signature"    # Ljava/lang/String;
    .param p6, "udn"    # Ljava/lang/String;
    .param p7, "isZigbee"    # Z
    .param p8, "bridgeMacAddress"    # Ljava/lang/String;

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/belkin/wemo/cache/cloud/CloudConstants;->CLOUD_URL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/apis/http/plugin/upgradeFwVersion"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->URL:Ljava/lang/String;

    .line 19
    const-string v0, "CloudRequestUpdateFirmware"

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->TAG:Ljava/lang/String;

    .line 20
    const/16 v0, 0x7530

    iput v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->TIMEOUT_LIMIT:I

    .line 21
    const/16 v0, 0x2710

    iput v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->TIMEOUT:I

    .line 23
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->macAddress:Ljava/lang/String;

    .line 24
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->pluginID:Ljava/lang/String;

    .line 25
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->url:Ljava/lang/String;

    .line 26
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->udn:Ljava/lang/String;

    .line 27
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->signature:Ljava/lang/String;

    .line 28
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->bridgeMacAddress:Ljava/lang/String;

    .line 33
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->isZigbee:Z

    .line 36
    invoke-static {p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 37
    iput-object p2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->macAddress:Ljava/lang/String;

    .line 38
    iput-object p3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->pluginID:Ljava/lang/String;

    .line 39
    iput-object p4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->url:Ljava/lang/String;

    .line 40
    iput-object p5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->signature:Ljava/lang/String;

    .line 41
    iput-object p6, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->udn:Ljava/lang/String;

    .line 42
    iput-boolean p7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->isZigbee:Z

    .line 43
    iput-object p8, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->bridgeMacAddress:Ljava/lang/String;

    .line 44
    return-void
.end method

.method private parseResponse(Ljava/lang/String;)Z
    .locals 7
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 169
    const/4 v3, 0x0

    .line 170
    .local v3, "result":Z
    new-instance v2, Lcom/belkin/wemo/cache/cloud/XMLParser;

    invoke-direct {v2}, Lcom/belkin/wemo/cache/cloud/XMLParser;-><init>()V

    .line 171
    .local v2, "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    invoke-virtual {v2, p1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getDomElement(Ljava/lang/String;)Lorg/w3c/dom/Document;

    move-result-object v0

    .line 172
    .local v0, "doc":Lorg/w3c/dom/Document;
    const-string v4, "plugins"

    invoke-interface {v0, v4}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v1

    .line 174
    .local v1, "nl":Lorg/w3c/dom/NodeList;
    if-eqz v1, :cond_0

    invoke-interface {v1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v4

    if-lez v4, :cond_0

    .line 175
    const/4 v3, 0x1

    .line 178
    :goto_0
    const-string v4, "CloudRequestUpdateFirmware"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "parseResponse:: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 179
    return v3

    .line 177
    :cond_0
    const/4 v3, 0x0

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
    .line 189
    const/4 v0, 0x0

    return-object v0
.end method

.method public getBody()Ljava/lang/String;
    .locals 14

    .prologue
    .line 70
    iget-boolean v10, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->isZigbee:Z

    if-eqz v10, :cond_3

    .line 71
    const/4 v4, 0x0

    .line 72
    .local v4, "isMutiDeviceUpdate":Z
    iget-object v10, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->udn:Ljava/lang/String;

    const-string v11, ","

    invoke-virtual {v10, v11}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 73
    const/4 v4, 0x1

    .line 75
    :cond_0
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "<plugins><plugin><recipientId>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->pluginID:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "</recipientId>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "<macAddress>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->macAddress:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "</macAddress>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "<content><![CDATA[<upgradeFwVersion>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "<plugins>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 76
    .local v7, "requestXML":Ljava/lang/String;
    if-eqz v4, :cond_1

    .line 77
    iget-object v10, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->udn:Ljava/lang/String;

    const-string v11, ","

    invoke-virtual {v10, v11}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v8

    .line 78
    .local v8, "splitIDs":[Ljava/lang/String;
    move-object v0, v8

    .local v0, "arr$":[Ljava/lang/String;
    array-length v6, v0

    .local v6, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v6, :cond_2

    aget-object v5, v0, v3

    .line 79
    .local v5, "ledId":Ljava/lang/String;
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "<plugin>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "  <downloadStartTime>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    invoke-virtual {v10, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "</downloadStartTime>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "  <macAddress>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "</macAddress>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "  <signature>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->signature:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "</signature>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "  <firmwareDownloadUrl>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->url:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "</firmwareDownloadUrl>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "  </plugin>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 78
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 87
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v3    # "i$":I
    .end local v5    # "ledId":Ljava/lang/String;
    .end local v6    # "len$":I
    .end local v8    # "splitIDs":[Ljava/lang/String;
    :cond_1
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "<plugin>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "  <downloadStartTime>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    invoke-virtual {v10, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "</downloadStartTime>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "  <macAddress>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->udn:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "</macAddress>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "  <signature>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->signature:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "</signature>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "  <firmwareDownloadUrl>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->url:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "</firmwareDownloadUrl>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "  </plugin>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 94
    :cond_2
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "</plugins></upgradeFwVersion>]]></content></plugin></plugins>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 113
    .end local v4    # "isMutiDeviceUpdate":Z
    .end local v7    # "requestXML":Ljava/lang/String;
    :goto_1
    return-object v7

    .line 98
    :cond_3
    const-string v2, "<![CDATA[<upgradeFwVersion>"

    .line 99
    .local v2, "cdataStart":Ljava/lang/String;
    const-string v1, "</upgradeFwVersion>]]>"

    .line 101
    .local v1, "cdataEnd":Ljava/lang/String;
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "<plugins>  <plugin>  <recipientId>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->pluginID:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "</recipientId>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "  <macAddress>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->macAddress:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "</macAddress>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "  <content>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "  <plugin>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "  <downloadStartTime>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "0"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "</downloadStartTime>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "  <signature>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->signature:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "</signature>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "  <firmwareDownloadUrl>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->url:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "</firmwareDownloadUrl>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "  <macAddress>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->macAddress:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "</macAddress>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "  </plugin>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " </content>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "  </plugin></plugins>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .local v9, "xmlString":Ljava/lang/String;
    move-object v7, v9

    .line 113
    goto/16 :goto_1
.end method

.method public getFileByteArray()[B
    .locals 1

    .prologue
    .line 160
    const/4 v0, 0x0

    return-object v0
.end method

.method public getRequestMethod()I
    .locals 1

    .prologue
    .line 48
    const/4 v0, 0x1

    return v0
.end method

.method public getTimeout()I
    .locals 1

    .prologue
    .line 53
    iget v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->TIMEOUT:I

    return v0
.end method

.method public getTimeoutLimit()I
    .locals 1

    .prologue
    .line 58
    const/16 v0, 0x7530

    return v0
.end method

.method public getURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->URL:Ljava/lang/String;

    return-object v0
.end method

.method public getUploadFileName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 165
    const/4 v0, 0x0

    return-object v0
.end method

.method public isAuthHeaderRequired()Z
    .locals 1

    .prologue
    .line 184
    const/4 v0, 0x1

    return v0
.end method

.method public requestComplete(ZI[B)V
    .locals 12
    .param p1, "success"    # Z
    .param p2, "statusCode"    # I
    .param p3, "resp"    # [B

    .prologue
    .line 120
    const-string v8, "CloudRequestUpdateFirmware"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "success: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 121
    if-eqz p1, :cond_4

    .line 123
    :try_start_0
    new-instance v6, Ljava/lang/String;

    const-string v8, "UTF-8"

    invoke-direct {v6, p3, v8}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 124
    .local v6, "response":Ljava/lang/String;
    const-string v8, "CloudRequestUpdateFirmware"

    invoke-static {v8, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    if-eqz v6, :cond_1

    .line 126
    invoke-direct {p0, v6}, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->parseResponse(Ljava/lang/String;)Z

    move-result v5

    .line 127
    .local v5, "parsedResponse":Z
    if-eqz v5, :cond_3

    .line 128
    const-string v8, "CloudRequestUpdateFirmware"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "firmware update started successfully for udn:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->udn:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    iget-boolean v8, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->isZigbee:Z

    if-eqz v8, :cond_2

    .line 130
    iget-object v8, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->udn:Ljava/lang/String;

    const-string v9, ","

    invoke-virtual {v8, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 131
    iget-object v8, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->udn:Ljava/lang/String;

    const-string v9, ","

    invoke-virtual {v8, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    .line 132
    .local v7, "splitIDs":[Ljava/lang/String;
    move-object v0, v7

    .local v0, "arr$":[Ljava/lang/String;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v4, :cond_1

    aget-object v3, v0, v2

    .line 133
    .local v3, "ledId":Ljava/lang/String;
    iget-object v8, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v9, "FirmwareUpdateStatus"

    sget-object v10, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->UPDATE_STARTED:Ljava/lang/String;

    invoke-virtual {v8, v9, v10, v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 137
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v2    # "i$":I
    .end local v3    # "ledId":Ljava/lang/String;
    .end local v4    # "len$":I
    .end local v7    # "splitIDs":[Ljava/lang/String;
    :cond_0
    iget-object v8, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v9, "FirmwareUpdateStatus"

    sget-object v10, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->UPDATE_STARTED:Ljava/lang/String;

    iget-object v11, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->udn:Ljava/lang/String;

    invoke-virtual {v8, v9, v10, v11}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    .end local v5    # "parsedResponse":Z
    .end local v6    # "response":Ljava/lang/String;
    :cond_1
    :goto_1
    return-void

    .line 140
    .restart local v5    # "parsedResponse":Z
    .restart local v6    # "response":Ljava/lang/String;
    :cond_2
    iget-object v8, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v9, "FirmwareUpdateStatus"

    sget-object v10, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->UPDATE_STARTED:Ljava/lang/String;

    iget-object v11, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->udn:Ljava/lang/String;

    invoke-virtual {v8, v9, v10, v11}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 148
    .end local v5    # "parsedResponse":Z
    .end local v6    # "response":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 149
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    const-string v8, "CloudRequestUpdateFirmware"

    const-string v9, "error in firmware update"

    invoke-static {v8, v9, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 150
    iget-object v8, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v9, "FirmwareUpdateStatus"

    sget-object v10, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->UPDATE_FAILED:Ljava/lang/String;

    iget-object v11, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->udn:Ljava/lang/String;

    invoke-virtual {v8, v9, v10, v11}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 145
    .end local v1    # "e":Ljava/io/UnsupportedEncodingException;
    .restart local v5    # "parsedResponse":Z
    .restart local v6    # "response":Ljava/lang/String;
    :cond_3
    :try_start_1
    iget-object v8, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v9, "FirmwareUpdateStatus"

    sget-object v10, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->UPDATE_FAILED:Ljava/lang/String;

    iget-object v11, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->udn:Ljava/lang/String;

    invoke-virtual {v8, v9, v10, v11}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 153
    .end local v5    # "parsedResponse":Z
    .end local v6    # "response":Ljava/lang/String;
    :cond_4
    iget-object v8, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v9, "FirmwareUpdateStatus"

    sget-object v10, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->UPDATE_FAILED:Ljava/lang/String;

    iget-object v11, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;->udn:Ljava/lang/String;

    invoke-virtual {v8, v9, v10, v11}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method
