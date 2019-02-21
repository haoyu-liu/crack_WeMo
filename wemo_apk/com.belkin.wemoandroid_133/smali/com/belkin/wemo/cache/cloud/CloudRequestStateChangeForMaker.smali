.class public Lcom/belkin/wemo/cache/cloud/CloudRequestStateChangeForMaker;
.super Ljava/lang/Object;
.source "CloudRequestStateChangeForMaker.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;


# static fields
.field private static final KEY_ATTRIBUTE_LISTS:Ljava/lang/String; = "attributeLists"

.field private static final KEY_FRIENDLY_NAME:Ljava/lang/String; = "friendlyName"

.field private static final KEY_PLUGIN_TAG:Ljava/lang/String; = "plugin"

.field private static final KEY_STATUS:Ljava/lang/String; = "status"


# instance fields
.field private final TAG:Ljava/lang/String;

.field private TIMEOUT:I

.field private final TIMEOUT_LIMIT:I

.field private final URL:Ljava/lang/String;

.field private attributeList:Ljava/lang/String;

.field private devName:Ljava/lang/String;

.field private mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field private mac:Ljava/lang/String;

.field private newAttributelist:Ljava/lang/String;

.field private newDevState:Ljava/lang/String;

.field private pluginID:Ljava/lang/String;

.field private status:Ljava/lang/String;

.field private udn:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "devMgr"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "udn"    # Ljava/lang/String;
    .param p4, "pluginID"    # Ljava/lang/String;
    .param p5, "mac"    # Ljava/lang/String;
    .param p6, "status"    # Ljava/lang/String;
    .param p7, "attributeList"    # Ljava/lang/String;

    .prologue
    .line 40
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

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChangeForMaker;->URL:Ljava/lang/String;

    .line 24
    const-string v0, "SDK_CloudRequestStateChangeForMaker"

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChangeForMaker;->TAG:Ljava/lang/String;

    .line 25
    const v0, 0xafc8

    iput v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChangeForMaker;->TIMEOUT_LIMIT:I

    .line 34
    const/16 v0, 0x7530

    iput v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChangeForMaker;->TIMEOUT:I

    .line 41
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChangeForMaker;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 42
    iput-object p4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChangeForMaker;->pluginID:Ljava/lang/String;

    .line 43
    iput-object p5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChangeForMaker;->mac:Ljava/lang/String;

    .line 44
    iput-object p6, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChangeForMaker;->status:Ljava/lang/String;

    .line 45
    iput-object p3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChangeForMaker;->udn:Ljava/lang/String;

    .line 46
    iput-object p7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChangeForMaker;->attributeList:Ljava/lang/String;

    .line 47
    return-void
.end method

.method private parseResponse(Ljava/lang/String;)Z
    .locals 10
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 120
    :try_start_0
    const-string v7, "SDK_CloudRequestStateChangeForMaker"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Response from Server"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    new-instance v5, Lcom/belkin/wemo/cache/cloud/XMLParser;

    invoke-direct {v5}, Lcom/belkin/wemo/cache/cloud/XMLParser;-><init>()V

    .line 122
    .local v5, "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    invoke-virtual {v5, p1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getDomElement(Ljava/lang/String;)Lorg/w3c/dom/Document;

    move-result-object v2

    .line 123
    .local v2, "doc":Lorg/w3c/dom/Document;
    const-string v7, "plugin"

    invoke-interface {v2, v7}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v4

    .line 124
    .local v4, "nl":Lorg/w3c/dom/NodeList;
    const/4 v7, 0x0

    invoke-interface {v4, v7}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v3

    check-cast v3, Lorg/w3c/dom/Element;

    .line 125
    .local v3, "e":Lorg/w3c/dom/Element;
    const-string v7, "status"

    invoke-virtual {v5, v3, v7}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChangeForMaker;->newDevState:Ljava/lang/String;

    .line 126
    const-string v7, "friendlyName"

    invoke-virtual {v5, v3, v7}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChangeForMaker;->devName:Ljava/lang/String;

    .line 128
    const-string v7, "attributeLists"

    invoke-interface {v3, v7}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v7

    const/4 v8, 0x0

    invoke-interface {v7, v8}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    .line 130
    .local v1, "attrNode":Lorg/w3c/dom/Node;
    if-eqz v1, :cond_1

    .line 131
    const/4 v0, 0x0

    .line 132
    .local v0, "attrJSON":Ljava/lang/String;
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChangeForMaker;->devName:Ljava/lang/String;

    const-string v8, "Maker"

    invoke-virtual {v7, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 133
    new-instance v7, Lcom/belkin/wemo/cache/utils/XmlToJSONConverter;

    invoke-direct {v7, v1}, Lcom/belkin/wemo/cache/utils/XmlToJSONConverter;-><init>(Lorg/w3c/dom/Node;)V

    invoke-virtual {v7}, Lcom/belkin/wemo/cache/utils/XmlToJSONConverter;->getJSONMakerString()Ljava/lang/String;

    move-result-object v0

    .line 135
    :cond_0
    const-string v7, "SDK_CloudRequestStateChangeForMaker"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "attributeList i  state Change ::"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 136
    if-eqz v0, :cond_1

    .line 137
    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChangeForMaker;->newAttributelist:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 142
    .end local v0    # "attrJSON":Ljava/lang/String;
    :cond_1
    const/4 v6, 0x1

    .line 145
    .end local v1    # "attrNode":Lorg/w3c/dom/Node;
    .end local v2    # "doc":Lorg/w3c/dom/Document;
    .end local v3    # "e":Lorg/w3c/dom/Element;
    .end local v4    # "nl":Lorg/w3c/dom/NodeList;
    .end local v5    # "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    :goto_0
    return v6

    .line 143
    :catch_0
    move-exception v3

    .line 144
    .local v3, "e":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

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
    .line 167
    const/4 v0, 0x0

    return-object v0
.end method

.method public getBody()Ljava/lang/String;
    .locals 2

    .prologue
    .line 72
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<plugins>\n    <plugin>                 \n        <recipientId>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChangeForMaker;->pluginID:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</recipientId>                    \n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "        <macAddress>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChangeForMaker;->mac:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</macAddress>\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "        <content>                          \n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "            <![CDATA[ <pluginSetDeviceStatus>\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "                            <plugin>                                               \n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "                                <pluginId>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChangeForMaker;->pluginID:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</pluginId>                                                 \n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "                                <macAddress>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChangeForMaker;->mac:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</macAddress> \n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "                                <status>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChangeForMaker;->status:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</status>\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "                    <attributeLists action=\"SetAttributes\" >"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChangeForMaker;->attributeList:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</attributeLists>\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "                            </plugin>\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "                      </pluginSetDeviceStatus > ]]>            \n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "        </content>    \n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "    </plugin>\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</plugins>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFileByteArray()[B
    .locals 1

    .prologue
    .line 152
    const/4 v0, 0x0

    return-object v0
.end method

.method public getRequestMethod()I
    .locals 1

    .prologue
    .line 51
    const/4 v0, 0x1

    return v0
.end method

.method public getTimeout()I
    .locals 1

    .prologue
    .line 56
    iget v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChangeForMaker;->TIMEOUT:I

    return v0
.end method

.method public getTimeoutLimit()I
    .locals 1

    .prologue
    .line 61
    const v0, 0xafc8

    return v0
.end method

.method public getURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 66
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChangeForMaker;->URL:Ljava/lang/String;

    return-object v0
.end method

.method public getUploadFileName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 157
    const/4 v0, 0x0

    return-object v0
.end method

.method public isAuthHeaderRequired()Z
    .locals 1

    .prologue
    .line 162
    const/4 v0, 0x1

    return v0
.end method

.method public requestComplete(ZI[B)V
    .locals 8
    .param p1, "success"    # Z
    .param p2, "statusCode"    # I
    .param p3, "resp"    # [B

    .prologue
    .line 92
    const-string v3, "SDK_CloudRequestStateChangeForMaker"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Set Device State Request Completed. is success: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    if-eqz p1, :cond_1

    .line 95
    :try_start_0
    new-instance v1, Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-direct {v1, p3, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 96
    .local v1, "response":Ljava/lang/String;
    const-string v3, "SDK_CloudRequestStateChangeForMaker"

    invoke-static {v3, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    invoke-direct {p0, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChangeForMaker;->parseResponse(Ljava/lang/String;)Z

    move-result v2

    .line 98
    .local v2, "responseParse":Z
    const-string v3, "SDK_CloudRequestStateChangeForMaker"

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

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    if-eqz v2, :cond_0

    .line 100
    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChangeForMaker;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChangeForMaker;->udn:Ljava/lang/String;

    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChangeForMaker;->devName:Ljava/lang/String;

    iget-object v6, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChangeForMaker;->newDevState:Ljava/lang/String;

    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChangeForMaker;->newAttributelist:Ljava/lang/String;

    invoke-virtual {v3, v4, v5, v6, v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setNewStateForMakerDevice(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 116
    .end local v1    # "response":Ljava/lang/String;
    .end local v2    # "responseParse":Z
    :cond_0
    :goto_0
    return-void

    .line 102
    :catch_0
    move-exception v0

    .line 103
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    const-string v3, "SDK_CloudRequestStateChangeForMaker"

    const-string v4, "UnsupportedEncodingException while parsing cloud response: "

    invoke-static {v3, v4, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 107
    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChangeForMaker;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->restartCloudPeriodicUpdate()V

    goto :goto_0

    .line 113
    .end local v0    # "e":Ljava/io/UnsupportedEncodingException;
    :cond_1
    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChangeForMaker;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->restartCloudPeriodicUpdate()V

    goto :goto_0
.end method
