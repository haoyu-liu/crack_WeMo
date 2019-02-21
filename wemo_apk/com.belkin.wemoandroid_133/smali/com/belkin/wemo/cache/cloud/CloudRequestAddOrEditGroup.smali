.class public Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;
.super Ljava/lang/Object;
.source "CloudRequestAddOrEditGroup.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup$GroupCapabilityProfile;
    }
.end annotation


# instance fields
.field private final TAG:Ljava/lang/String;

.field private TIMEOUT:I

.field private final TIMEOUT_LIMIT:I

.field private final URL_1:Ljava/lang/String;

.field private final URL_2:Ljava/lang/String;

.field private bridgeUDN:Ljava/lang/String;

.field private deviceCapabilities:Lorg/json/JSONObject;

.field private deviceIDs:Lorg/json/JSONArray;

.field private groupIcon:Ljava/lang/String;

.field private groupId:Ljava/lang/String;

.field private groupName:Ljava/lang/String;

.field private homeId:Ljava/lang/String;

.field private isNewGroup:Z

.field private mCacheManager:Lcom/belkin/wemo/cache/CacheManager;

.field private mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field private mDevicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

.field private requestType:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Lorg/json/JSONObject;Z)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "bridgeUDN"    # Ljava/lang/String;
    .param p3, "groupProperties"    # Lorg/json/JSONObject;
    .param p4, "isNewGroup"    # Z

    .prologue
    const/4 v4, 0x4

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/belkin/wemo/cache/cloud/CloudConstants;->CLOUD_URL:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/apis/http/device/groups/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->URL_1:Ljava/lang/String;

    .line 30
    const-string v2, "/?remoteSync=true"

    iput-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->URL_2:Ljava/lang/String;

    .line 31
    const-string v2, "SDK_CloudRequestAddOrEditGroup"

    iput-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->TAG:Ljava/lang/String;

    .line 32
    iput v4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->TIMEOUT_LIMIT:I

    .line 33
    const/16 v2, 0x7530

    iput v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->TIMEOUT:I

    .line 44
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->isNewGroup:Z

    .line 48
    invoke-static {p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v2

    iput-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 50
    :try_start_0
    const-string v2, "groupID"

    invoke-virtual {p3, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->groupId:Ljava/lang/String;

    .line 51
    iput-object p2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->bridgeUDN:Ljava/lang/String;

    .line 52
    invoke-static {p1}, Lcom/belkin/wemo/cache/CacheManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/CacheManager;

    move-result-object v2

    iput-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->mCacheManager:Lcom/belkin/wemo/cache/CacheManager;

    .line 53
    invoke-static {}, Lcom/belkin/wemo/cache/data/DevicesArray;->getInstance()Lcom/belkin/wemo/cache/data/DevicesArray;

    move-result-object v2

    iput-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->mDevicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    .line 54
    new-instance v0, Lcom/belkin/wemo/cache/cloud/CloudAuth;

    invoke-direct {v0, p1}, Lcom/belkin/wemo/cache/cloud/CloudAuth;-><init>(Landroid/content/Context;)V

    .line 55
    .local v0, "cloudAuth":Lcom/belkin/wemo/cache/cloud/CloudAuth;
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/cloud/CloudAuth;->getHomeID()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->homeId:Ljava/lang/String;

    .line 56
    const-string v2, "groupName"

    invoke-virtual {p3, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->groupName:Ljava/lang/String;

    .line 57
    const-string v2, "groupIcon"

    invoke-virtual {p3, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->groupIcon:Ljava/lang/String;

    .line 58
    const-string v2, "deviceCapabilities"

    invoke-virtual {p3, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    iput-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->deviceCapabilities:Lorg/json/JSONObject;

    .line 59
    const-string v2, "deviceID"

    invoke-virtual {p3, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    iput-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->deviceIDs:Lorg/json/JSONArray;

    .line 60
    iput-boolean p4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->isNewGroup:Z

    .line 61
    if-eqz p4, :cond_0

    .line 62
    const/4 v2, 0x1

    iput v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->requestType:I

    .line 69
    .end local v0    # "cloudAuth":Lcom/belkin/wemo/cache/cloud/CloudAuth;
    :goto_0
    return-void

    .line 64
    .restart local v0    # "cloudAuth":Lcom/belkin/wemo/cache/cloud/CloudAuth;
    :cond_0
    const/4 v2, 0x4

    iput v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->requestType:I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 66
    .end local v0    # "cloudAuth":Lcom/belkin/wemo/cache/cloud/CloudAuth;
    :catch_0
    move-exception v1

    .line 67
    .local v1, "e":Lorg/json/JSONException;
    const-string v2, "SDK_CloudRequestAddOrEditGroup"

    const-string v3, "JSONException while extracting group properties: "

    invoke-static {v2, v3, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0
.end method

.method private getCapabilitiesXMLString(Ljava/util/Map;)Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 157
    .local p1, "capabilityIDToValueMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "<capabilities>"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 158
    .local v2, "xmlStrSB":Ljava/lang/StringBuilder;
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 159
    .local v0, "capability":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-direct {p0, v3, v4}, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->getSingleCapabilityXMLString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 161
    .end local v0    # "capability":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_0
    const-string v3, "</capabilities>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method private getDevicesXMLString()Ljava/lang/String;
    .locals 7

    .prologue
    .line 134
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 135
    .local v4, "xmlSB":Ljava/lang/StringBuilder;
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->deviceIDs:Lorg/json/JSONArray;

    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v3

    .line 136
    .local v3, "length":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v3, :cond_0

    .line 138
    :try_start_0
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iget-object v6, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->deviceIDs:Lorg/json/JSONArray;

    invoke-virtual {v6, v2}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDevice(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    .line 139
    .local v0, "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "<device><deviceId>"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getPluginID()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "</deviceId>"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "</device>"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 136
    .end local v0    # "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 142
    :catch_0
    move-exception v1

    .line 143
    .local v1, "e":Lorg/json/JSONException;
    const-string v5, "SDK_CloudRequestAddOrEditGroup"

    const-string v6, "JSONException while creating device IDs XML: "

    invoke-static {v5, v6, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_1

    .line 146
    .end local v1    # "e":Lorg/json/JSONException;
    :cond_0
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method private getGroupCapabilityProfile()Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup$GroupCapabilityProfile;
    .locals 9

    .prologue
    .line 281
    new-instance v4, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup$GroupCapabilityProfile;

    invoke-direct {v4, p0}, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup$GroupCapabilityProfile;-><init>(Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;)V

    .line 283
    .local v4, "profile":Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup$GroupCapabilityProfile;
    iget-object v6, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->deviceCapabilities:Lorg/json/JSONObject;

    if-eqz v6, :cond_2

    .line 284
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 286
    .local v0, "capabilityIDToValueMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v6, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->deviceCapabilities:Lorg/json/JSONObject;

    invoke-virtual {v6}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v3

    .line 287
    .local v3, "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 288
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 290
    .local v2, "key":Ljava/lang/String;
    :try_start_0
    iget-object v6, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->deviceCapabilities:Lorg/json/JSONObject;

    invoke-virtual {v6, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 291
    .local v5, "value":Ljava/lang/String;
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 292
    invoke-static {v2}, Lcom/belkin/wemo/cache/utils/WemoUtils;->getCapabilityID(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 294
    .end local v5    # "value":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 295
    .local v1, "e":Lorg/json/JSONException;
    const-string v6, "SDK_CloudRequestAddOrEditGroup"

    const-string v7, "JSONException while creating group capabilities IDs/Values Pair: "

    invoke-static {v6, v7, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0

    .line 298
    .end local v1    # "e":Lorg/json/JSONException;
    .end local v2    # "key":Ljava/lang/String;
    :cond_1
    invoke-virtual {v4, v0}, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup$GroupCapabilityProfile;->setCapabilityIDToValueMap(Ljava/util/Map;)V

    .line 300
    .end local v0    # "capabilityIDToValueMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v3    # "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_2
    const-string v6, "SDK_CloudRequestAddOrEditGroup"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Group Capability IDs: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup$GroupCapabilityProfile;->getCapabilityIDsAsString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "; Group Capability Values: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup$GroupCapabilityProfile;->getCapabilityValuesAsString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 301
    return-object v4
.end method

.method private getSingleCapabilityXMLString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 150
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<capability><capabilityId>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</capabilityId>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "<currentValue>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</currentValue>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</capability>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private parseResponse(Ljava/lang/String;)Z
    .locals 8
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 252
    :try_start_0
    new-instance v3, Lcom/belkin/wemo/cache/cloud/XMLParser;

    invoke-direct {v3}, Lcom/belkin/wemo/cache/cloud/XMLParser;-><init>()V

    .line 253
    .local v3, "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    invoke-virtual {v3, p1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getDomElement(Ljava/lang/String;)Lorg/w3c/dom/Document;

    move-result-object v0

    .line 254
    .local v0, "doc":Lorg/w3c/dom/Document;
    const-string v5, "groups"

    invoke-interface {v0, v5}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v2

    .line 255
    .local v2, "nl":Lorg/w3c/dom/NodeList;
    const/4 v5, 0x0

    invoke-interface {v2, v5}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    check-cast v1, Lorg/w3c/dom/Element;

    .line 256
    .local v1, "e":Lorg/w3c/dom/Element;
    const-string v5, "RemoveGroup: "

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "success: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "statusCode"

    invoke-virtual {v3, v1, v7}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 257
    const-string v5, "statusCode"

    invoke-virtual {v3, v1, v5}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "S"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v5

    if-eqz v5, :cond_0

    .line 258
    const/4 v4, 0x1

    .line 263
    .end local v0    # "doc":Lorg/w3c/dom/Document;
    .end local v1    # "e":Lorg/w3c/dom/Element;
    .end local v2    # "nl":Lorg/w3c/dom/NodeList;
    .end local v3    # "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    :cond_0
    :goto_0
    return v4

    .line 261
    :catch_0
    move-exception v1

    .line 262
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
    .line 349
    const/4 v0, 0x0

    return-object v0
.end method

.method public getBody()Ljava/lang/String;
    .locals 9

    .prologue
    .line 95
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 97
    .local v2, "devIds":Ljava/lang/StringBuffer;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    :try_start_0
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->deviceIDs:Lorg/json/JSONArray;

    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-ge v4, v7, :cond_1

    .line 98
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->deviceIDs:Lorg/json/JSONArray;

    invoke-virtual {v7, v4}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 99
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->deviceIDs:Lorg/json/JSONArray;

    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    if-ge v4, v7, :cond_0

    .line 100
    const-string v7, ","

    invoke-virtual {v2, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 97
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 102
    :catch_0
    move-exception v3

    .line 103
    .local v3, "e":Lorg/json/JSONException;
    const-string v7, "SDK_CloudRequestAddOrEditGroup"

    const-string v8, "JSONException while creating device IDs String: "

    invoke-static {v7, v8, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 106
    .end local v3    # "e":Lorg/json/JSONException;
    :cond_1
    const-string v1, "<![CDATA[<CreateGroup>"

    .line 107
    .local v1, "cdataStart":Ljava/lang/String;
    const-string v0, "</CreateGroup>]]>"

    .line 108
    .local v0, "cdataEnd":Ljava/lang/String;
    invoke-direct {p0}, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->getGroupCapabilityProfile()Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup$GroupCapabilityProfile;

    move-result-object v5

    .line 110
    .local v5, "profile":Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup$GroupCapabilityProfile;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "<groups>  <group>  <referenceId>"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->groupId:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "</referenceId>"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "  <groupName>"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->groupName:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "</groupName>"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "  <iconVersion></iconVersion>"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "  <content>"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "  <GroupID>"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->groupId:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "</GroupID>"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "  <GroupName>"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->groupName:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "</GroupName>"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "  <DeviceIDList>"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "</DeviceIDList>"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "  <GroupCapabilityIDs>"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v5}, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup$GroupCapabilityProfile;->getCapabilityIDsAsString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "</GroupCapabilityIDs>"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "  <GroupCapabilityValues>"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v5}, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup$GroupCapabilityProfile;->getCapabilityValuesAsString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "</GroupCapabilityValues>"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " </content>"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 123
    .local v6, "xmlString":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "<devices>"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-direct {p0}, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->getDevicesXMLString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "</devices>"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 125
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v5}, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup$GroupCapabilityProfile;->getCapabilityIDToValueMap()Ljava/util/Map;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->getCapabilitiesXMLString(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 127
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "</group></groups>"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 130
    return-object v6
.end method

.method public getFileByteArray()[B
    .locals 1

    .prologue
    .line 270
    const/4 v0, 0x0

    return-object v0
.end method

.method public getRequestMethod()I
    .locals 1

    .prologue
    .line 73
    iget v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->requestType:I

    return v0
.end method

.method public getTimeout()I
    .locals 1

    .prologue
    .line 78
    iget v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->TIMEOUT:I

    return v0
.end method

.method public getTimeoutLimit()I
    .locals 1

    .prologue
    .line 83
    const/4 v0, 0x4

    return v0
.end method

.method public getURL()Ljava/lang/String;
    .locals 4

    .prologue
    .line 88
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->URL_1:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->homeId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/?remoteSync=true"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 89
    .local v0, "url":Ljava/lang/String;
    const-string v1, "SDK_CloudRequestAddOrEditGroup"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Cloud request url: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    return-object v0
.end method

.method public getUploadFileName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 276
    const/4 v0, 0x0

    return-object v0
.end method

.method public isAuthHeaderRequired()Z
    .locals 1

    .prologue
    .line 344
    const/4 v0, 0x1

    return v0
.end method

.method public requestComplete(ZI[B)V
    .locals 22
    .param p1, "success"    # Z
    .param p2, "statusCode"    # I
    .param p3, "resp"    # [B

    .prologue
    .line 167
    const-string v18, "AddGroup: "

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "success: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 168
    const/16 v17, 0x0

    .line 169
    .local v17, "responseParse":Z
    const-string v15, "null"

    .line 171
    .local v15, "response":Ljava/lang/String;
    if-eqz p3, :cond_0

    .line 172
    :try_start_0
    new-instance v16, Ljava/lang/String;

    const-string v18, "UTF-8"

    move-object/from16 v0, v16

    move-object/from16 v1, p3

    move-object/from16 v2, v18

    invoke-direct {v0, v1, v2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v15    # "response":Ljava/lang/String;
    .local v16, "response":Ljava/lang/String;
    move-object/from16 v15, v16

    .line 178
    .end local v16    # "response":Ljava/lang/String;
    .restart local v15    # "response":Ljava/lang/String;
    :cond_0
    :goto_0
    const-string v18, "SDK_CloudRequestAddOrEditGroup"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "Cloud response: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 180
    if-eqz p1, :cond_9

    .line 181
    const-string v14, ""

    .line 183
    .local v14, "removedDeviceID":Ljava/lang/String;
    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->parseResponse(Ljava/lang/String;)Z

    move-result v17

    .line 184
    const-string v18, "SDK_CloudRequestAddOrEditGroup"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "Response parse: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-static/range {v17 .. v17}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 185
    if-eqz v17, :cond_7

    .line 186
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->deviceIDs:Lorg/json/JSONArray;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/json/JSONArray;->length()I

    move-result v18

    move/from16 v0, v18

    if-ge v9, v0, :cond_2

    .line 189
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->deviceIDs:Lorg/json/JSONArray;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v9}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 190
    .local v5, "deviceID":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->deviceCapabilities:Lorg/json/JSONObject;

    move-object/from16 v19, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v5, v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->updateZigbeeCapabilities(Ljava/lang/String;Lorg/json/JSONObject;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v12

    .line 191
    .local v12, "ledDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->groupId:Ljava/lang/String;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setGroupID(Ljava/lang/String;)V

    .line 192
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->groupName:Ljava/lang/String;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setGroupName(Ljava/lang/String;)V

    .line 193
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->groupIcon:Ljava/lang/String;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->isEmpty()Z

    move-result v18

    if-eqz v18, :cond_1

    .line 194
    invoke-virtual {v12}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getManufacturerName()Ljava/lang/String;

    move-result-object v18

    invoke-virtual {v12}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getModelCode()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Lcom/belkin/wemo/cache/utils/WemoUtils;->getZigbeeIcon(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->groupIcon:Ljava/lang/String;

    .line 195
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->groupIcon:Ljava/lang/String;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setGroupIcon(Ljava/lang/String;)V

    .line 196
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->mDevicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v12}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 197
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->mCacheManager:Lcom/belkin/wemo/cache/CacheManager;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x1

    move-object/from16 v0, v18

    move/from16 v1, v19

    move/from16 v2, v20

    move/from16 v3, v21

    invoke-virtual {v0, v12, v1, v2, v3}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 186
    .end local v5    # "deviceID":Ljava/lang/String;
    .end local v12    # "ledDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :goto_2
    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_1

    .line 174
    .end local v9    # "i":I
    .end local v14    # "removedDeviceID":Ljava/lang/String;
    :catch_0
    move-exception v6

    .line 175
    .local v6, "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v6}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    .line 176
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-object/from16 v18, v0

    const-string v19, "set_state"

    invoke-static/range {v17 .. v17}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->bridgeUDN:Ljava/lang/String;

    move-object/from16 v21, v0

    invoke-virtual/range {v18 .. v21}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 198
    .end local v6    # "e":Ljava/io/UnsupportedEncodingException;
    .restart local v9    # "i":I
    .restart local v14    # "removedDeviceID":Ljava/lang/String;
    :catch_1
    move-exception v6

    .line 200
    .local v6, "e":Lorg/json/JSONException;
    invoke-virtual {v6}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_2

    .line 204
    .end local v6    # "e":Lorg/json/JSONException;
    :cond_2
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->isNewGroup:Z

    move/from16 v18, v0

    if-nez v18, :cond_6

    .line 206
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->mCacheManager:Lcom/belkin/wemo/cache/CacheManager;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->groupId:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Lcom/belkin/wemo/cache/CacheManager;->getDevicesForGroup(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v13

    .line 208
    .local v13, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    if-eqz v13, :cond_5

    :try_start_2
    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v18

    if-lez v18, :cond_5

    .line 210
    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->deviceIDs:Lorg/json/JSONArray;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/json/JSONArray;->length()I

    move-result v19

    move/from16 v0, v18

    move/from16 v1, v19

    if-le v0, v1, :cond_5

    .line 211
    const-string v18, "SDK_CloudRequestAddOrEditGroup"

    const-string v19, "removing device from existing group"

    invoke-static/range {v18 .. v19}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 213
    invoke-virtual {v13}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .local v10, "i$":Ljava/util/Iterator;
    :cond_3
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_5

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 214
    .local v4, "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    const/4 v8, 0x0

    .line 215
    .local v8, "found":Z
    const/4 v9, 0x0

    :goto_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->deviceIDs:Lorg/json/JSONArray;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/json/JSONArray;->length()I

    move-result v18

    move/from16 v0, v18

    if-ge v9, v0, :cond_4

    .line 216
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->deviceIDs:Lorg/json/JSONArray;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v9}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v11

    .line 217
    .local v11, "id":Ljava/lang/String;
    invoke-virtual {v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v11, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v18

    if-eqz v18, :cond_8

    .line 218
    const/4 v8, 0x1

    .line 222
    .end local v11    # "id":Ljava/lang/String;
    :cond_4
    if-nez v8, :cond_3

    .line 223
    invoke-virtual {v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v14

    .line 224
    const-string v18, "SDK_CloudRequestAddOrEditGroup"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "removedDeviceID:"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_2

    .line 233
    .end local v4    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v8    # "found":Z
    .end local v10    # "i$":Ljava/util/Iterator;
    :cond_5
    :goto_4
    if-eqz v14, :cond_6

    invoke-virtual {v14}, Ljava/lang/String;->isEmpty()Z

    move-result v18

    if-nez v18, :cond_6

    .line 234
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v14}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformationFromDevicesArray(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v7

    .line 235
    .local v7, "editedDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    const-string v18, ""

    move-object/from16 v0, v18

    invoke-virtual {v7, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setGroupID(Ljava/lang/String;)V

    .line 236
    const-string v18, ""

    move-object/from16 v0, v18

    invoke-virtual {v7, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setGroupName(Ljava/lang/String;)V

    .line 237
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->mDevicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v7}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 238
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->mCacheManager:Lcom/belkin/wemo/cache/CacheManager;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x1

    move-object/from16 v0, v18

    move/from16 v1, v19

    move/from16 v2, v20

    move/from16 v3, v21

    invoke-virtual {v0, v7, v1, v2, v3}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 242
    .end local v7    # "editedDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v13    # "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-object/from16 v18, v0

    const-string v19, "set_state"

    invoke-static/range {v17 .. v17}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->bridgeUDN:Ljava/lang/String;

    move-object/from16 v21, v0

    invoke-virtual/range {v18 .. v21}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 248
    .end local v9    # "i":I
    .end local v14    # "removedDeviceID":Ljava/lang/String;
    :cond_7
    :goto_5
    return-void

    .line 215
    .restart local v4    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .restart local v8    # "found":Z
    .restart local v9    # "i":I
    .restart local v10    # "i$":Ljava/util/Iterator;
    .restart local v11    # "id":Ljava/lang/String;
    .restart local v13    # "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    .restart local v14    # "removedDeviceID":Ljava/lang/String;
    :cond_8
    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_3

    .line 230
    .end local v4    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v8    # "found":Z
    .end local v10    # "i$":Ljava/util/Iterator;
    .end local v11    # "id":Ljava/lang/String;
    :catch_2
    move-exception v6

    .line 231
    .restart local v6    # "e":Lorg/json/JSONException;
    const-string v18, "SDK_CloudRequestAddOrEditGroup"

    const-string v19, "JSON Exception"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-static {v0, v1, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_4

    .line 245
    .end local v6    # "e":Lorg/json/JSONException;
    .end local v9    # "i":I
    .end local v13    # "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    .end local v14    # "removedDeviceID":Ljava/lang/String;
    :cond_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-object/from16 v18, v0

    const-string v19, "set_state"

    invoke-static/range {p1 .. p1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;->bridgeUDN:Ljava/lang/String;

    move-object/from16 v21, v0

    invoke-virtual/range {v18 .. v21}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_5
.end method
