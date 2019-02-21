.class public Lcom/belkin/wemo/cache/cloud/CloudRequestRemoveGroup;
.super Ljava/lang/Object;
.source "CloudRequestRemoveGroup.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;


# static fields
.field private static final KEY_STATUS:Ljava/lang/String; = "status"


# instance fields
.field private final TAG:Ljava/lang/String;

.field private TIMEOUT:I

.field private final TIMEOUT_LIMIT:I

.field private final URL:Ljava/lang/String;

.field private bridgeUDN:Ljava/lang/String;

.field private cloudURL:Ljava/lang/String;

.field private final endURL:Ljava/lang/String;

.field private groupId:Ljava/lang/String;

.field private mCacheManager:Lcom/belkin/wemo/cache/CacheManager;

.field private mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field private mDevicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "bridgeUDN"    # Ljava/lang/String;
    .param p3, "groupID"    # Ljava/lang/String;

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/belkin/wemo/cache/cloud/CloudConstants;->CLOUD_URL:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/apis/http/device/groups/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestRemoveGroup;->URL:Ljava/lang/String;

    .line 18
    const-string v1, "?remoteSync=true"

    iput-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestRemoveGroup;->endURL:Ljava/lang/String;

    .line 19
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestRemoveGroup;->cloudURL:Ljava/lang/String;

    .line 20
    const-string v1, "SDK_CloudRequestRemoveGroup"

    iput-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestRemoveGroup;->TAG:Ljava/lang/String;

    .line 21
    const/4 v1, 0x4

    iput v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestRemoveGroup;->TIMEOUT_LIMIT:I

    .line 23
    const/16 v1, 0x7530

    iput v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestRemoveGroup;->TIMEOUT:I

    .line 32
    invoke-static {p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestRemoveGroup;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 33
    iput-object p3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestRemoveGroup;->groupId:Ljava/lang/String;

    .line 34
    iput-object p2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestRemoveGroup;->bridgeUDN:Ljava/lang/String;

    .line 35
    invoke-static {p1}, Lcom/belkin/wemo/cache/CacheManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/CacheManager;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestRemoveGroup;->mCacheManager:Lcom/belkin/wemo/cache/CacheManager;

    .line 36
    invoke-static {}, Lcom/belkin/wemo/cache/data/DevicesArray;->getInstance()Lcom/belkin/wemo/cache/data/DevicesArray;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestRemoveGroup;->mDevicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    .line 37
    new-instance v0, Lcom/belkin/wemo/cache/cloud/CloudAuth;

    invoke-direct {v0, p1}, Lcom/belkin/wemo/cache/cloud/CloudAuth;-><init>(Landroid/content/Context;)V

    .line 38
    .local v0, "cloudAuth":Lcom/belkin/wemo/cache/cloud/CloudAuth;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestRemoveGroup;->URL:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/cloud/CloudAuth;->getHomeID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestRemoveGroup;->cloudURL:Ljava/lang/String;

    .line 39
    return-void
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
    .line 124
    const/4 v0, 0x0

    return-object v0
.end method

.method public getBody()Ljava/lang/String;
    .locals 5

    .prologue
    .line 64
    const-string v2, ""

    .line 65
    .local v2, "xmlString":Ljava/lang/String;
    const-string v1, "<![CDATA[<DeleteGroup>"

    .line 66
    .local v1, "cdataStart":Ljava/lang/String;
    const-string v0, "</DeleteGroup>]]>"

    .line 68
    .local v0, "cdataEnd":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "<group>  <content>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "  <referenceId>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestRemoveGroup;->groupId:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "</referenceId>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " </content>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "  </group>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public getFileByteArray()[B
    .locals 1

    .prologue
    .line 108
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
    iget v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestRemoveGroup;->TIMEOUT:I

    return v0
.end method

.method public getTimeoutLimit()I
    .locals 1

    .prologue
    .line 53
    const/4 v0, 0x4

    return v0
.end method

.method public getURL()Ljava/lang/String;
    .locals 2

    .prologue
    .line 58
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestRemoveGroup;->cloudURL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestRemoveGroup;->groupId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "?remoteSync=true"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getUploadFileName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 114
    const/4 v0, 0x0

    return-object v0
.end method

.method public isAuthHeaderRequired()Z
    .locals 1

    .prologue
    .line 119
    const/4 v0, 0x1

    return v0
.end method

.method public requestComplete(ZI[B)V
    .locals 9
    .param p1, "success"    # Z
    .param p2, "statusCode"    # I
    .param p3, "resp"    # [B

    .prologue
    .line 77
    const-string v5, "remove device group: "

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "success: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    if-eqz p1, :cond_1

    .line 81
    :try_start_0
    new-instance v4, Ljava/lang/String;

    const-string v5, "UTF-8"

    invoke-direct {v4, p3, v5}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 82
    .local v4, "response":Ljava/lang/String;
    const-string v5, "SDK_CloudRequestRemoveGroup"

    invoke-static {v5, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    const-string v5, "SDK_CloudRequestRemoveGroup"

    const-string v6, "Request complete: "

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestRemoveGroup;->mCacheManager:Lcom/belkin/wemo/cache/CacheManager;

    iget-object v6, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestRemoveGroup;->groupId:Ljava/lang/String;

    invoke-virtual {v5, v6}, Lcom/belkin/wemo/cache/CacheManager;->getDevicesForGroup(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    .line 85
    .local v1, "groupedLEDList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    const-string v5, "SDK_CloudRequestRemoveGroup"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "removing devices:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 87
    .local v3, "ledDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    const-string v5, ""

    invoke-virtual {v3, v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setGroupID(Ljava/lang/String;)V

    .line 88
    const-string v5, ""

    invoke-virtual {v3, v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setGroupName(Ljava/lang/String;)V

    .line 89
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestRemoveGroup;->mDevicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v5, v3}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 90
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestRemoveGroup;->mCacheManager:Lcom/belkin/wemo/cache/CacheManager;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x1

    invoke-virtual {v5, v3, v6, v7, v8}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 91
    const-string v5, "SDK_CloudRequestRemoveGroup"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "updated cache and db for :"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 95
    .end local v1    # "groupedLEDList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "ledDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v4    # "response":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 96
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    .line 97
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestRemoveGroup;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v6, "set_state"

    invoke-static {p1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestRemoveGroup;->bridgeUDN:Ljava/lang/String;

    invoke-virtual {v5, v6, v7, v8}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    .end local v0    # "e":Ljava/io/UnsupportedEncodingException;
    :goto_1
    return-void

    .line 93
    .restart local v1    # "groupedLEDList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    .restart local v2    # "i$":Ljava/util/Iterator;
    .restart local v4    # "response":Ljava/lang/String;
    :cond_0
    :try_start_1
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestRemoveGroup;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v6, "set_state"

    invoke-static {p1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestRemoveGroup;->bridgeUDN:Ljava/lang/String;

    invoke-virtual {v5, v6, v7, v8}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 100
    .end local v1    # "groupedLEDList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v4    # "response":Ljava/lang/String;
    :cond_1
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestRemoveGroup;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v6, "set_state"

    invoke-static {p1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestRemoveGroup;->bridgeUDN:Ljava/lang/String;

    invoke-virtual {v5, v6, v7, v8}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method
