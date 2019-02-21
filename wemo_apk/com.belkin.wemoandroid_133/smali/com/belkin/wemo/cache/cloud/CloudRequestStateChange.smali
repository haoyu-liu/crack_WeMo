.class public Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;
.super Ljava/lang/Object;
.source "CloudRequestStateChange.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;


# static fields
.field private static final KEY_FRIENDLY_NAME:Ljava/lang/String; = "friendlyName"

.field private static final KEY_PLUGIN_TAG:Ljava/lang/String; = "plugin"

.field private static final KEY_STATUS:Ljava/lang/String; = "status"


# instance fields
.field private final TAG:Ljava/lang/String;

.field private TIMEOUT:I

.field private final TIMEOUT_LIMIT:I

.field private final URL:Ljava/lang/String;

.field private devName:Ljava/lang/String;

.field private eventDuration:Ljava/lang/String;

.field private mCacheManager:Lcom/belkin/wemo/cache/CacheManager;

.field private mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field private mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

.field private mDevicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

.field private mac:Ljava/lang/String;

.field private mode:Ljava/lang/String;

.field private newDevState:Ljava/lang/String;

.field private pluginID:Ljava/lang/String;

.field private status:Ljava/lang/String;

.field private time:Ljava/lang/String;

.field private udn:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "udn"    # Ljava/lang/String;
    .param p3, "attribute"    # Lorg/json/JSONObject;

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/belkin/wemo/cache/cloud/CloudConstants;->CLOUD_URL:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/apis/http/plugin/message/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->URL:Ljava/lang/String;

    .line 27
    const-class v1, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->TAG:Ljava/lang/String;

    .line 28
    const v1, 0x9c40

    iput v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->TIMEOUT_LIMIT:I

    .line 35
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->mode:Ljava/lang/String;

    .line 36
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->time:Ljava/lang/String;

    .line 39
    const/16 v1, 0x2710

    iput v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->TIMEOUT:I

    .line 47
    invoke-static {p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 48
    iput-object p2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->udn:Ljava/lang/String;

    .line 49
    invoke-static {p1}, Lcom/belkin/wemo/cache/CacheManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/CacheManager;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->mCacheManager:Lcom/belkin/wemo/cache/CacheManager;

    .line 50
    invoke-static {}, Lcom/belkin/wemo/cache/data/DevicesArray;->getInstance()Lcom/belkin/wemo/cache/data/DevicesArray;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->mDevicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    .line 51
    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformationList()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/belkin/wemo/cache/data/DeviceInformation;

    iput-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 52
    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getPluginID()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->pluginID:Ljava/lang/String;

    .line 53
    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getMAC()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->mac:Ljava/lang/String;

    .line 55
    :try_start_0
    invoke-static {p2}, Lcom/belkin/wemo/cache/utils/IsDevice;->Crockpot(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 56
    const-string v1, "mode"

    invoke-virtual {p3, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->mode:Ljava/lang/String;

    .line 57
    const-string v1, "time"

    invoke-virtual {p3, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->time:Ljava/lang/String;

    .line 58
    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->mode:Ljava/lang/String;

    iput-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->status:Ljava/lang/String;

    .line 59
    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->time:Ljava/lang/String;

    iput-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->eventDuration:Ljava/lang/String;

    .line 70
    :goto_0
    return-void

    .line 61
    :cond_0
    const-string v1, "binaryState"

    invoke-virtual {p3, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->status:Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 65
    :catch_0
    move-exception v0

    .line 67
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method

.method private parseResponse(Ljava/lang/String;)Z
    .locals 6
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 190
    :try_start_0
    new-instance v3, Lcom/belkin/wemo/cache/cloud/XMLParser;

    invoke-direct {v3}, Lcom/belkin/wemo/cache/cloud/XMLParser;-><init>()V

    .line 191
    .local v3, "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    invoke-virtual {v3, p1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getDomElement(Ljava/lang/String;)Lorg/w3c/dom/Document;

    move-result-object v0

    .line 192
    .local v0, "doc":Lorg/w3c/dom/Document;
    const-string v5, "plugin"

    invoke-interface {v0, v5}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v2

    .line 193
    .local v2, "nl":Lorg/w3c/dom/NodeList;
    const/4 v5, 0x0

    invoke-interface {v2, v5}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    check-cast v1, Lorg/w3c/dom/Element;

    .line 194
    .local v1, "e":Lorg/w3c/dom/Element;
    const-string v5, "status"

    invoke-virtual {v3, v1, v5}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->newDevState:Ljava/lang/String;

    .line 195
    const-string v5, "friendlyName"

    invoke-virtual {v3, v1, v5}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->devName:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 196
    const/4 v4, 0x1

    .line 199
    .end local v0    # "doc":Lorg/w3c/dom/Document;
    .end local v1    # "e":Lorg/w3c/dom/Element;
    .end local v2    # "nl":Lorg/w3c/dom/NodeList;
    .end local v3    # "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    :goto_0
    return v4

    .line 197
    :catch_0
    move-exception v1

    .line 198
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
    .line 221
    const/4 v0, 0x0

    return-object v0
.end method

.method public getBody()Ljava/lang/String;
    .locals 4

    .prologue
    .line 95
    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->udn:Ljava/lang/String;

    invoke-static {v2}, Lcom/belkin/wemo/cache/utils/IsDevice;->Crockpot(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 96
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "<plugins>\n    <plugin>                 \n        <recipientId>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->pluginID:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "</recipientId>                    \n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "        <macAddress>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->mac:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "</macAddress>\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "        <content>                          \n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "            <![CDATA[ <pluginSetDeviceStatus>\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "                            <plugin>                                               \n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "                                <pluginId>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->pluginID:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "</pluginId>                                                 \n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "                                <macAddress>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->mac:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "</macAddress> \n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "                                <status>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->status:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "</status>\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "                                <eventDuration>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->eventDuration:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "</eventDuration>\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "                            </plugin>\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "                      </pluginSetDeviceStatus > ]]>            \n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "        </content>    \n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "    </plugin>\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "</plugins>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 112
    .local v0, "xmlString":Ljava/lang/String;
    const-string v2, "xmlString::: "

    invoke-static {v2, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    move-object v1, v0

    .line 132
    .end local v0    # "xmlString":Ljava/lang/String;
    .local v1, "xmlString":Ljava/lang/String;
    :goto_0
    return-object v1

    .line 116
    .end local v1    # "xmlString":Ljava/lang/String;
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "<plugins>\n    <plugin>                 \n        <recipientId>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->pluginID:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "</recipientId>                    \n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "        <macAddress>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->mac:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "</macAddress>\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "        <content>                          \n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "            <![CDATA[ <pluginSetDeviceStatus>\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "                            <plugin>                                               \n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "                                <pluginId>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->pluginID:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "</pluginId>                                                 \n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "                                <macAddress>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->mac:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "</macAddress> \n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "                                <status>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->status:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "</status>\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "                            </plugin>\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "                      </pluginSetDeviceStatus > ]]>            \n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "        </content>    \n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "    </plugin>\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "</plugins>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 131
    .restart local v0    # "xmlString":Ljava/lang/String;
    const-string v2, "xmlString::: "

    invoke-static {v2, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    move-object v1, v0

    .line 132
    .end local v0    # "xmlString":Ljava/lang/String;
    .restart local v1    # "xmlString":Ljava/lang/String;
    goto/16 :goto_0
.end method

.method public getFileByteArray()[B
    .locals 1

    .prologue
    .line 206
    const/4 v0, 0x0

    return-object v0
.end method

.method public getRequestMethod()I
    .locals 1

    .prologue
    .line 74
    const/4 v0, 0x1

    return v0
.end method

.method public getTimeout()I
    .locals 1

    .prologue
    .line 79
    iget v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->TIMEOUT:I

    return v0
.end method

.method public getTimeoutLimit()I
    .locals 1

    .prologue
    .line 84
    const v0, 0x9c40

    return v0
.end method

.method public getURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 89
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->URL:Ljava/lang/String;

    return-object v0
.end method

.method public getUploadFileName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 211
    const/4 v0, 0x0

    return-object v0
.end method

.method public isAuthHeaderRequired()Z
    .locals 1

    .prologue
    .line 216
    const/4 v0, 0x1

    return v0
.end method

.method public requestComplete(ZI[B)V
    .locals 10
    .param p1, "success"    # Z
    .param p2, "statusCode"    # I
    .param p3, "resp"    # [B

    .prologue
    .line 139
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Set Device State Request Completed. is success: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 140
    if-eqz p1, :cond_2

    .line 142
    :try_start_0
    new-instance v2, Ljava/lang/String;

    const-string v5, "UTF-8"

    invoke-direct {v2, p3, v5}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 143
    .local v2, "response":Ljava/lang/String;
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->TAG:Ljava/lang/String;

    invoke-static {v5, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 144
    invoke-direct {p0, v2}, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->parseResponse(Ljava/lang/String;)Z

    move-result v3

    .line 146
    .local v3, "responseParse":Z
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Response parse: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static {v3}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 147
    if-eqz v3, :cond_0

    .line 148
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->udn:Ljava/lang/String;

    invoke-static {v5}, Lcom/belkin/wemo/cache/utils/IsDevice;->Crockpot(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 149
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getAttributeList()Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v0

    .line 151
    .local v0, "deviceAttributes":Lorg/json/JSONObject;
    :try_start_1
    const-string v5, "mode"

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/json/JSONObject;

    .line 152
    .local v4, "valObject":Lorg/json/JSONObject;
    const-string v5, "value"

    iget-object v6, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->mode:Ljava/lang/String;

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 153
    const-string v5, "mode"

    invoke-virtual {v0, v5, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 155
    const-string v5, "time"

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    .end local v4    # "valObject":Lorg/json/JSONObject;
    check-cast v4, Lorg/json/JSONObject;

    .line 156
    .restart local v4    # "valObject":Lorg/json/JSONObject;
    const-string v5, "value"

    iget-object v6, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->time:Ljava/lang/String;

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 157
    const-string v5, "time"

    invoke-virtual {v0, v5, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 159
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v5, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeList(Lorg/json/JSONObject;)V

    .line 160
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->mDevicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    iget-object v6, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v5, v6}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 161
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->mCacheManager:Lcom/belkin/wemo/cache/CacheManager;

    iget-object v6, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x1

    invoke-virtual {v5, v6, v7, v8, v9}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_1

    .line 176
    .end local v0    # "deviceAttributes":Lorg/json/JSONObject;
    .end local v4    # "valObject":Lorg/json/JSONObject;
    :cond_0
    :goto_0
    :try_start_2
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v6, "set_state"

    invoke-static {p1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v6, v7, v8}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 186
    .end local v2    # "response":Ljava/lang/String;
    .end local v3    # "responseParse":Z
    :goto_1
    return-void

    .line 162
    .restart local v0    # "deviceAttributes":Lorg/json/JSONObject;
    .restart local v2    # "response":Ljava/lang/String;
    .restart local v3    # "responseParse":Z
    :catch_0
    move-exception v1

    .line 163
    .local v1, "e":Lorg/json/JSONException;
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->TAG:Ljava/lang/String;

    const-string v6, "JSONException while parsing cloud response: "

    invoke-static {v5, v6, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V
    :try_end_2
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 177
    .end local v0    # "deviceAttributes":Lorg/json/JSONObject;
    .end local v1    # "e":Lorg/json/JSONException;
    .end local v2    # "response":Ljava/lang/String;
    .end local v3    # "responseParse":Z
    :catch_1
    move-exception v1

    .line 178
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->TAG:Ljava/lang/String;

    const-string v6, "UnsupportedEncodingException while parsing cloud response: "

    invoke-static {v5, v6, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 180
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v5}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->restartCloudPeriodicUpdate()V

    goto :goto_1

    .line 166
    .end local v1    # "e":Ljava/io/UnsupportedEncodingException;
    .restart local v2    # "response":Ljava/lang/String;
    .restart local v3    # "responseParse":Z
    :cond_1
    :try_start_3
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->newDevState:Ljava/lang/String;

    if-eqz v5, :cond_0

    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->newDevState:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_0

    .line 167
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v6, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->newDevState:Ljava/lang/String;

    invoke-virtual {v5, v6}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setBinaryState(Ljava/lang/String;)V

    .line 168
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v6, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->newDevState:Ljava/lang/String;

    const-string v7, "\\|"

    invoke-virtual {v6, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    aget-object v6, v6, v7

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-virtual {v5, v6}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setState(I)V

    .line 169
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->mDevicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    iget-object v6, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v5, v6}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 170
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->mCacheManager:Lcom/belkin/wemo/cache/CacheManager;

    iget-object v6, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x1

    invoke-virtual {v5, v6, v7, v8, v9}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V
    :try_end_3
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_0

    .line 184
    .end local v2    # "response":Ljava/lang/String;
    .end local v3    # "responseParse":Z
    :cond_2
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v5}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->restartCloudPeriodicUpdate()V

    goto :goto_1
.end method
