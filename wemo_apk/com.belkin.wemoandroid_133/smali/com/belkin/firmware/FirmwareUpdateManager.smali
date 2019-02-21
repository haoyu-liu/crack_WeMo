.class public Lcom/belkin/firmware/FirmwareUpdateManager;
.super Ljava/lang/Object;
.source "FirmwareUpdateManager.java"


# static fields
.field private static final ACTION_ARGS_DEVICELIST:Ljava/lang/String; = "DeviceList"

.field private static final ACTION_ARGS_FIRMWARELINK:Ljava/lang/String; = "FirmwareLink"

.field private static final ACTION_ARGS_UPGRADEPOLICY:Ljava/lang/String; = "UpgradePolicy"

.field private static final DEVICE_CURRENT_FW:Ljava/lang/String; = "devicefirmware"

.field private static final DEVICE_TYPE:Ljava/lang/String; = "type"

.field private static final DEVICE_UDN:Ljava/lang/String; = "udn"

.field private static final FW_MD5:Ljava/lang/String; = "checksum"

.field private static final FW_URL:Ljava/lang/String; = "url"

.field private static final NEW_FW_VERSION:Ljava/lang/String; = "version"

.field private static UPDATE_FAILED:Ljava/lang/String; = null

.field private static final UPGRADE:Ljava/lang/String; = "0"

.field private static currentDevice:Lcom/belkin/firmware/FirmwareDetails;

.field private static currentlyUpdating:Ljava/lang/String;

.field private static isUpdating:Z

.field public static tag:Ljava/lang/String;

.field private static zigbeeUpdateInitiatedQueue:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private static zigbeeUpdateQueue:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/belkin/firmware/FirmwareDetails;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 41
    const-string v0, "FirmwareUpdateManager"

    sput-object v0, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    .line 55
    const/4 v0, 0x0

    sput-object v0, Lcom/belkin/firmware/FirmwareUpdateManager;->currentDevice:Lcom/belkin/firmware/FirmwareDetails;

    .line 57
    const-string v0, "2"

    sput-object v0, Lcom/belkin/firmware/FirmwareUpdateManager;->UPDATE_FAILED:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Ljava/util/LinkedHashMap;
    .locals 1

    .prologue
    .line 40
    sget-object v0, Lcom/belkin/firmware/FirmwareUpdateManager;->zigbeeUpdateQueue:Ljava/util/LinkedHashMap;

    return-object v0
.end method

.method static synthetic access$100(Lcom/belkin/firmware/FirmwareDetails;)V
    .locals 0
    .param p0, "x0"    # Lcom/belkin/firmware/FirmwareDetails;

    .prologue
    .line 40
    invoke-static {p0}, Lcom/belkin/firmware/FirmwareUpdateManager;->startUpdate(Lcom/belkin/firmware/FirmwareDetails;)V

    return-void
.end method

.method public static addToZigbeeUpdateQueue(Lcom/belkin/firmware/FirmwareDetails;)V
    .locals 3
    .param p0, "fd"    # Lcom/belkin/firmware/FirmwareDetails;

    .prologue
    .line 270
    sget-object v0, Lcom/belkin/firmware/FirmwareUpdateManager;->zigbeeUpdateQueue:Ljava/util/LinkedHashMap;

    if-nez v0, :cond_0

    .line 271
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    sput-object v0, Lcom/belkin/firmware/FirmwareUpdateManager;->zigbeeUpdateQueue:Ljava/util/LinkedHashMap;

    .line 273
    :cond_0
    sget-object v0, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "adding to queue"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/belkin/firmware/FirmwareDetails;->getUniqueID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 274
    sget-object v0, Lcom/belkin/firmware/FirmwareUpdateManager;->zigbeeUpdateQueue:Ljava/util/LinkedHashMap;

    invoke-virtual {p0}, Lcom/belkin/firmware/FirmwareDetails;->getUniqueID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p0}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 275
    sget-object v0, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "queue size"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/belkin/firmware/FirmwareUpdateManager;->zigbeeUpdateQueue:Ljava/util/LinkedHashMap;

    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 276
    sget-object v0, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    const-string v1, "printing zigbeeUpdateQueue"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 277
    sget-object v0, Lcom/belkin/firmware/FirmwareUpdateManager;->zigbeeUpdateQueue:Ljava/util/LinkedHashMap;

    invoke-static {v0}, Lcom/belkin/firmware/FirmwareUpdateManager;->printQ(Ljava/util/HashMap;)V

    .line 279
    sget-boolean v0, Lcom/belkin/firmware/FirmwareUpdateManager;->isUpdating:Z

    if-nez v0, :cond_1

    .line 280
    const/4 v0, 0x1

    sput-boolean v0, Lcom/belkin/firmware/FirmwareUpdateManager;->isUpdating:Z

    .line 281
    invoke-static {}, Lcom/belkin/firmware/FirmwareUpdateManager;->startUpdate()V

    .line 283
    :cond_1
    return-void
.end method

.method private static checkUpdate(Ljava/lang/String;)Z
    .locals 11
    .param p0, "id"    # Ljava/lang/String;

    .prologue
    .line 489
    sget-object v8, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "in check update:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 490
    sget-object v8, Lcom/belkin/firmware/FirmwareUpdateManager;->currentlyUpdating:Ljava/lang/String;

    if-eqz v8, :cond_0

    sget-object v8, Lcom/belkin/firmware/FirmwareUpdateManager;->currentlyUpdating:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 491
    :cond_0
    invoke-static {p0}, Lcom/belkin/firmware/FirmwareUpdateManager;->getUniqueID(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    sput-object v8, Lcom/belkin/firmware/FirmwareUpdateManager;->currentlyUpdating:Ljava/lang/String;

    .line 493
    :cond_1
    sget-object v8, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "currentlyUpdating:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    sget-object v10, Lcom/belkin/firmware/FirmwareUpdateManager;->currentlyUpdating:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 494
    sget-object v8, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    const-string v9, "printing zigbeeUpdateQueue"

    invoke-static {v8, v9}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 497
    invoke-static {}, Lcom/belkin/firmware/FirmwareUpdateManager;->getZigbeeUpdateQueue()Ljava/util/LinkedHashMap;

    .line 499
    sget-object v8, Lcom/belkin/firmware/FirmwareUpdateManager;->zigbeeUpdateQueue:Ljava/util/LinkedHashMap;

    invoke-static {v8}, Lcom/belkin/firmware/FirmwareUpdateManager;->printQ(Ljava/util/HashMap;)V

    .line 500
    sget-object v8, Lcom/belkin/firmware/FirmwareUpdateManager;->zigbeeUpdateQueue:Ljava/util/LinkedHashMap;

    sget-object v9, Lcom/belkin/firmware/FirmwareUpdateManager;->currentlyUpdating:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/belkin/firmware/FirmwareDetails;

    .line 501
    .local v1, "fd":Lcom/belkin/firmware/FirmwareDetails;
    sget-object v8, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "fd:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 502
    if-nez v1, :cond_3

    .line 503
    const/4 v5, 0x0

    .line 533
    :cond_2
    :goto_0
    return v5

    .line 505
    :cond_3
    invoke-virtual {v1}, Lcom/belkin/firmware/FirmwareDetails;->getZigbeeIds()Ljava/lang/String;

    move-result-object v7

    .line 506
    .local v7, "zigbeeIDs":Ljava/lang/String;
    const/4 v5, 0x1

    .line 507
    .local v5, "updateStatus":Z
    const-string v8, "tag"

    const-string v9, "printing zigbeeUpdateInitiatedQueue"

    invoke-static {v8, v9}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 508
    sget-object v8, Lcom/belkin/firmware/FirmwareUpdateManager;->zigbeeUpdateInitiatedQueue:Ljava/util/HashMap;

    invoke-static {v8}, Lcom/belkin/firmware/FirmwareUpdateManager;->printQ(Ljava/util/HashMap;)V

    .line 509
    const-string v8, ","

    invoke-virtual {v7, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 510
    sget-object v8, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    const-string v9, "multiple ids:"

    invoke-static {v8, v9}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 511
    const-string v8, ","

    invoke-virtual {v7, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 512
    .local v3, "ids":[Ljava/lang/String;
    move-object v0, v3

    .local v0, "arr$":[Ljava/lang/String;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_1
    if-ge v2, v4, :cond_2

    aget-object v6, v0, v2

    .line 513
    .local v6, "zigbeeID":Ljava/lang/String;
    sget-object v8, Lcom/belkin/firmware/FirmwareUpdateManager;->zigbeeUpdateInitiatedQueue:Ljava/util/HashMap;

    invoke-virtual {v8, v6}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 514
    sget-object v8, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "zigbee id:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 515
    sget-object v8, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "zigbee id status:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    sget-object v10, Lcom/belkin/firmware/FirmwareUpdateManager;->zigbeeUpdateInitiatedQueue:Ljava/util/HashMap;

    invoke-virtual {v10, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 516
    sget-object v8, Lcom/belkin/firmware/FirmwareUpdateManager;->zigbeeUpdateInitiatedQueue:Ljava/util/HashMap;

    invoke-virtual {v8, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Boolean;

    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v8

    if-nez v8, :cond_4

    .line 517
    const/4 v5, 0x0

    .line 518
    goto :goto_0

    .line 512
    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 523
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v2    # "i$":I
    .end local v3    # "ids":[Ljava/lang/String;
    .end local v4    # "len$":I
    .end local v6    # "zigbeeID":Ljava/lang/String;
    :cond_5
    sget-object v8, Lcom/belkin/firmware/FirmwareUpdateManager;->zigbeeUpdateInitiatedQueue:Ljava/util/HashMap;

    invoke-virtual {v8, v7}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 524
    sget-object v8, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "zigbee id:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 525
    sget-object v8, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "zigbee id status:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    sget-object v10, Lcom/belkin/firmware/FirmwareUpdateManager;->zigbeeUpdateInitiatedQueue:Ljava/util/HashMap;

    invoke-virtual {v10, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 526
    sget-object v8, Lcom/belkin/firmware/FirmwareUpdateManager;->zigbeeUpdateInitiatedQueue:Ljava/util/HashMap;

    invoke-virtual {v8, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Boolean;

    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v8

    if-nez v8, :cond_2

    .line 527
    const/4 v5, 0x0

    goto/16 :goto_0

    .line 530
    :cond_6
    sget-object v8, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "zigbee id not found in zigbeeUpdateInitiatedQueue :"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method public static getAvailableUpdates(Lorg/json/JSONArray;)V
    .locals 6
    .param p0, "params"    # Lorg/json/JSONArray;

    .prologue
    .line 242
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-lez v3, :cond_0

    .line 243
    new-instance v3, Lcom/belkin/wemo/cache/utils/SharePreferences;

    sget-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v3, v4}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getHomeId()Ljava/lang/String;

    move-result-object v2

    .line 244
    .local v2, "strHomeID":Ljava/lang/String;
    sget-object v3, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "ACTION_GET_AVAILABLE_UPDATES: Home ID = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 247
    const/4 v0, 0x0

    .line 248
    .local v0, "cloudRequest":Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 249
    new-instance v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetAvailFWUpdatesNoHomeID;

    .end local v0    # "cloudRequest":Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;
    sget-object v3, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v0, v3, p0}, Lcom/belkin/wemo/cache/cloud/CloudRequestGetAvailFWUpdatesNoHomeID;-><init>(Landroid/content/Context;Lorg/json/JSONArray;)V

    .line 254
    .restart local v0    # "cloudRequest":Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;
    :goto_0
    new-instance v1, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    sget-object v3, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v1, v3}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    .line 255
    .local v1, "crm":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    invoke-virtual {v1, v0}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    .line 259
    .end local v0    # "cloudRequest":Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;
    .end local v1    # "crm":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    .end local v2    # "strHomeID":Ljava/lang/String;
    :cond_0
    return-void

    .line 251
    .restart local v0    # "cloudRequest":Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;
    .restart local v2    # "strHomeID":Ljava/lang/String;
    :cond_1
    new-instance v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetAvailableFWUpdates;

    .end local v0    # "cloudRequest":Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;
    sget-object v3, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v0, v3, p0, v2}, Lcom/belkin/wemo/cache/cloud/CloudRequestGetAvailableFWUpdates;-><init>(Landroid/content/Context;Lorg/json/JSONArray;Ljava/lang/String;)V

    .restart local v0    # "cloudRequest":Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;
    goto :goto_0
.end method

.method private static getUniqueID(Ljava/lang/String;)Ljava/lang/String;
    .locals 10
    .param p0, "id"    # Ljava/lang/String;

    .prologue
    .line 451
    const-string v7, ""

    .line 452
    .local v7, "uniqueID":Ljava/lang/String;
    sget-object v8, Lcom/belkin/firmware/FirmwareUpdateManager;->zigbeeUpdateQueue:Ljava/util/LinkedHashMap;

    if-nez v8, :cond_0

    .line 453
    const-string v8, ""

    .line 474
    :goto_0
    return-object v8

    .line 455
    :cond_0
    sget-object v8, Lcom/belkin/firmware/FirmwareUpdateManager;->zigbeeUpdateQueue:Ljava/util/LinkedHashMap;

    invoke-virtual {v8}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 456
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/belkin/firmware/FirmwareDetails;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/belkin/firmware/FirmwareDetails;

    invoke-virtual {v8}, Lcom/belkin/firmware/FirmwareDetails;->getZigbeeIds()Ljava/lang/String;

    move-result-object v8

    const-string v9, ","

    invoke-virtual {v8, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 457
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/belkin/firmware/FirmwareDetails;

    invoke-virtual {v8}, Lcom/belkin/firmware/FirmwareDetails;->getZigbeeIds()Ljava/lang/String;

    move-result-object v8

    const-string v9, ","

    invoke-virtual {v8, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    .line 458
    .local v6, "splitIDs":[Ljava/lang/String;
    move-object v0, v6

    .local v0, "arr$":[Ljava/lang/String;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_2
    if-ge v3, v5, :cond_1

    aget-object v4, v0, v3

    .line 459
    .local v4, "ledId":Ljava/lang/String;
    invoke-virtual {p0, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 460
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    .end local v7    # "uniqueID":Ljava/lang/String;
    check-cast v7, Ljava/lang/String;

    .line 462
    .restart local v7    # "uniqueID":Ljava/lang/String;
    goto :goto_1

    .line 458
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 466
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v3    # "i$":I
    .end local v4    # "ledId":Ljava/lang/String;
    .end local v5    # "len$":I
    .end local v6    # "splitIDs":[Ljava/lang/String;
    :cond_3
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/belkin/firmware/FirmwareDetails;

    invoke-virtual {v8}, Lcom/belkin/firmware/FirmwareDetails;->getZigbeeIds()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 467
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    .end local v7    # "uniqueID":Ljava/lang/String;
    check-cast v7, Ljava/lang/String;

    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/belkin/firmware/FirmwareDetails;>;"
    .restart local v7    # "uniqueID":Ljava/lang/String;
    :cond_4
    move-object v8, v7

    .line 474
    goto :goto_0
.end method

.method private static getZigbeeUpdateQueue()Ljava/util/LinkedHashMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/LinkedHashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/belkin/firmware/FirmwareDetails;",
            ">;"
        }
    .end annotation

    .prologue
    .line 482
    sget-object v0, Lcom/belkin/firmware/FirmwareUpdateManager;->zigbeeUpdateQueue:Ljava/util/LinkedHashMap;

    if-nez v0, :cond_0

    .line 483
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    sput-object v0, Lcom/belkin/firmware/FirmwareUpdateManager;->zigbeeUpdateQueue:Ljava/util/LinkedHashMap;

    .line 485
    :cond_0
    sget-object v0, Lcom/belkin/firmware/FirmwareUpdateManager;->zigbeeUpdateQueue:Ljava/util/LinkedHashMap;

    return-object v0
.end method

.method private static printQ(Ljava/util/HashMap;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<**>;)V"
        }
    .end annotation

    .prologue
    .line 537
    .local p0, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<**>;"
    sget-object v5, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "printing Q:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 539
    :try_start_0
    invoke-virtual {p0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 540
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<**>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    .line 541
    .local v3, "key":Ljava/lang/Object;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    .line 543
    .local v4, "value":Ljava/lang/Object;
    sget-object v5, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "key:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " value:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 545
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<**>;"
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "key":Ljava/lang/Object;
    .end local v4    # "value":Ljava/lang/Object;
    :catch_0
    move-exception v1

    .line 546
    .local v1, "ex":Ljava/lang/Exception;
    sget-object v5, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Exception in printQ: map: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6, v1}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 548
    .end local v1    # "ex":Ljava/lang/Exception;
    :cond_0
    return-void
.end method

.method public static processFirwareUpdatePayload(Lorg/json/JSONArray;)Z
    .locals 9
    .param p0, "payLoad"    # Lorg/json/JSONArray;

    .prologue
    const/4 v5, 0x0

    .line 60
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-nez v6, :cond_1

    .line 116
    :cond_0
    :goto_0
    return v5

    .line 63
    :cond_1
    sget-object v6, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Processing Payload:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    :try_start_0
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-ge v3, v6, :cond_5

    .line 66
    invoke-virtual {p0, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    const-string v7, "url"

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 69
    invoke-virtual {p0, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    const-string v7, "bridgeUDN"

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 70
    sget-object v6, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    const-string v7, "non zigbee update:"

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    new-instance v1, Lcom/belkin/firmware/FirmwareDetails;

    invoke-virtual {p0, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    invoke-direct {v1, v6}, Lcom/belkin/firmware/FirmwareDetails;-><init>(Lorg/json/JSONObject;)V

    .line 72
    .local v1, "firmwareObj":Lcom/belkin/firmware/FirmwareDetails;
    sget-object v6, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    invoke-virtual {v1}, Lcom/belkin/firmware/FirmwareDetails;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    iget-object v6, v1, Lcom/belkin/firmware/FirmwareDetails;->deviceType:Ljava/lang/String;

    const-string v7, "Bridge"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 75
    move-object v2, v1

    .line 76
    .local v2, "firmwareObject":Lcom/belkin/firmware/FirmwareDetails;
    new-instance v6, Ljava/lang/Thread;

    new-instance v7, Lcom/belkin/firmware/FirmwareUpdateManager$1;

    invoke-direct {v7, v2}, Lcom/belkin/firmware/FirmwareUpdateManager$1;-><init>(Lcom/belkin/firmware/FirmwareDetails;)V

    invoke-direct {v6, v7}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v6}, Ljava/lang/Thread;->start()V

    .line 65
    .end local v1    # "firmwareObj":Lcom/belkin/firmware/FirmwareDetails;
    .end local v2    # "firmwareObject":Lcom/belkin/firmware/FirmwareDetails;
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 96
    .restart local v1    # "firmwareObj":Lcom/belkin/firmware/FirmwareDetails;
    :cond_2
    sget-object v6, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    const-string v7, "Not bridge starting update: "

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    invoke-static {v1}, Lcom/belkin/firmware/FirmwareUpdateManager;->startUpdate(Lcom/belkin/firmware/FirmwareDetails;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 110
    .end local v1    # "firmwareObj":Lcom/belkin/firmware/FirmwareDetails;
    :catch_0
    move-exception v0

    .line 112
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    .line 100
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_3
    :try_start_1
    sget-object v6, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "zigbee update: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p0, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 101
    new-instance v4, Ljava/util/Random;

    invoke-direct {v4}, Ljava/util/Random;-><init>()V

    .line 103
    .local v4, "rand":Ljava/util/Random;
    new-instance v1, Lcom/belkin/firmware/FirmwareDetails;

    invoke-virtual {p0, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    const/16 v7, 0x63

    invoke-virtual {v4, v7}, Ljava/util/Random;->nextInt(I)I

    move-result v7

    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v1, v6, v7}, Lcom/belkin/firmware/FirmwareDetails;-><init>(Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 104
    .restart local v1    # "firmwareObj":Lcom/belkin/firmware/FirmwareDetails;
    invoke-static {v1}, Lcom/belkin/firmware/FirmwareUpdateManager;->addToZigbeeUpdateQueue(Lcom/belkin/firmware/FirmwareDetails;)V

    goto :goto_2

    .line 107
    .end local v1    # "firmwareObj":Lcom/belkin/firmware/FirmwareDetails;
    .end local v4    # "rand":Ljava/util/Random;
    :cond_4
    sget-object v6, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    const-string v7, "Payload without url "

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    .line 116
    :cond_5
    const/4 v5, 0x1

    goto/16 :goto_0
.end method

.method private static setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z
    .locals 4
    .param p0, "action"    # Lorg/cybergarage/upnp/Action;
    .param p1, "keyList"    # [Ljava/lang/String;
    .param p2, "argList"    # [Ljava/lang/String;

    .prologue
    .line 230
    if-eqz p2, :cond_0

    if-eqz p1, :cond_0

    .line 231
    const/4 v0, 0x0

    .local v0, "counter":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_1

    .line 232
    sget-object v1, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Key "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    aget-object v3, p1, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    aget-object v3, p2, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " Value"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 233
    aget-object v1, p1, v0

    aget-object v2, p2, v0

    invoke-virtual {p0, v1, v2}, Lorg/cybergarage/upnp/Action;->setArgumentValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 231
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 236
    .end local v0    # "counter":I
    :cond_0
    const/4 v1, 0x0

    .line 238
    :goto_1
    return v1

    .restart local v0    # "counter":I
    :cond_1
    const/4 v1, 0x1

    goto :goto_1
.end method

.method private static startLocalUpdate(Lcom/belkin/firmware/FirmwareDetails;)Z
    .locals 14
    .param p0, "firmwareObj"    # Lcom/belkin/firmware/FirmwareDetails;

    .prologue
    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 174
    iget-object v7, p0, Lcom/belkin/firmware/FirmwareDetails;->uniqueID:Ljava/lang/String;

    .line 175
    .local v7, "udn":Ljava/lang/String;
    sget-object v10, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "starting local update: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 177
    :try_start_0
    sget-object v10, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-static {v10}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v10

    invoke-virtual {v10}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v1

    .line 178
    .local v1, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    if-eqz v1, :cond_2

    .line 179
    invoke-virtual {v1, v7}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v3

    .line 180
    .local v3, "device":Lorg/cybergarage/upnp/Device;
    if-eqz v3, :cond_1

    .line 182
    sget-object v10, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-static {v10}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v10

    invoke-virtual {v10, v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->subscribeToService(Lorg/cybergarage/upnp/Device;)Z

    .line 184
    const-string v10, "UpdateFirmware"

    invoke-virtual {v3, v10}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 185
    .local v0, "actionPost":Lorg/cybergarage/upnp/Action;
    if-eqz v0, :cond_0

    .line 186
    new-instance v6, Ljava/text/SimpleDateFormat;

    const-string v10, "dd/MM/yyyy"

    invoke-direct {v6, v10}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 187
    .local v6, "timeStampFormat":Ljava/text/SimpleDateFormat;
    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    .line 188
    .local v2, "date":Ljava/util/Date;
    if-eqz v0, :cond_3

    .line 189
    sget-object v10, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->SET_UPDATE_FIRMWARE_ARGS:[Ljava/lang/String;

    const/4 v11, 0x5

    new-array v11, v11, [Ljava/lang/String;

    const/4 v12, 0x0

    invoke-virtual {p0}, Lcom/belkin/firmware/FirmwareDetails;->getUpdateVersion()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v11, v12

    const/4 v12, 0x1

    invoke-virtual {v6, v2}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v13

    aput-object v13, v11, v12

    const/4 v12, 0x2

    invoke-virtual {p0}, Lcom/belkin/firmware/FirmwareDetails;->getUpdateURL()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v11, v12

    const/4 v12, 0x3

    invoke-virtual {p0}, Lcom/belkin/firmware/FirmwareDetails;->getMd5()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v11, v12

    const/4 v12, 0x4

    const-string v13, "0"

    aput-object v13, v11, v12

    invoke-static {v0, v10, v11}, Lcom/belkin/firmware/FirmwareUpdateManager;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 192
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v5

    .line 193
    .local v5, "response":Ljava/lang/String;
    sget-object v10, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "UDN:"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " Firmware Upgrade UPNP Response:"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 195
    if-eqz v5, :cond_3

    invoke-virtual {v5}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v10

    const-string v11, "success"

    invoke-virtual {v10, v11}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_3

    .line 218
    .end local v0    # "actionPost":Lorg/cybergarage/upnp/Action;
    .end local v1    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .end local v2    # "date":Ljava/util/Date;
    .end local v3    # "device":Lorg/cybergarage/upnp/Device;
    .end local v5    # "response":Ljava/lang/String;
    .end local v6    # "timeStampFormat":Ljava/text/SimpleDateFormat;
    :goto_0
    return v8

    .line 200
    .restart local v0    # "actionPost":Lorg/cybergarage/upnp/Action;
    .restart local v1    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .restart local v3    # "device":Lorg/cybergarage/upnp/Device;
    :cond_0
    sget-object v8, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "UDN:"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " Message:"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "Action null for device."

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v8, v10}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    move v8, v9

    .line 201
    goto :goto_0

    .line 205
    .end local v0    # "actionPost":Lorg/cybergarage/upnp/Action;
    :cond_1
    sget-object v8, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "UDN:"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " Message:"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "Device not found in control point."

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v8, v10}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    move v8, v9

    .line 206
    goto :goto_0

    .line 210
    .end local v3    # "device":Lorg/cybergarage/upnp/Device;
    :cond_2
    sget-object v8, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "UDN:"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " Message:"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "Control Point is null."

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v8, v10}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move v8, v9

    .line 211
    goto :goto_0

    .line 214
    .end local v1    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    :catch_0
    move-exception v4

    .line 215
    .local v4, "e":Ljava/lang/Exception;
    const-string v8, "local Update"

    invoke-static {v7, v8, v4}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    move v8, v9

    .line 216
    goto :goto_0

    .end local v4    # "e":Ljava/lang/Exception;
    .restart local v0    # "actionPost":Lorg/cybergarage/upnp/Action;
    .restart local v1    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .restart local v2    # "date":Ljava/util/Date;
    .restart local v3    # "device":Lorg/cybergarage/upnp/Device;
    .restart local v6    # "timeStampFormat":Ljava/text/SimpleDateFormat;
    :cond_3
    move v8, v9

    .line 218
    goto :goto_0
.end method

.method private static startNextUpdate()V
    .locals 4

    .prologue
    .line 440
    sget-object v1, Lcom/belkin/firmware/FirmwareUpdateManager;->zigbeeUpdateQueue:Ljava/util/LinkedHashMap;

    if-eqz v1, :cond_0

    .line 441
    sget-object v1, Lcom/belkin/firmware/FirmwareUpdateManager;->currentDevice:Lcom/belkin/firmware/FirmwareDetails;

    invoke-virtual {v1}, Lcom/belkin/firmware/FirmwareDetails;->getUniqueID()Ljava/lang/String;

    move-result-object v0

    .line 442
    .local v0, "id":Ljava/lang/String;
    sget-object v1, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "removing from queue:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 443
    sget-object v1, Lcom/belkin/firmware/FirmwareUpdateManager;->zigbeeUpdateQueue:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, v0}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 444
    const/4 v1, 0x0

    sput-boolean v1, Lcom/belkin/firmware/FirmwareUpdateManager;->isUpdating:Z

    .line 445
    const-string v1, ""

    sput-object v1, Lcom/belkin/firmware/FirmwareUpdateManager;->currentlyUpdating:Ljava/lang/String;

    .line 446
    invoke-static {}, Lcom/belkin/firmware/FirmwareUpdateManager;->startUpdate()V

    .line 448
    :cond_0
    return-void
.end method

.method private static startRemoteUpdate(Lcom/belkin/firmware/FirmwareDetails;)V
    .locals 19
    .param p0, "firmwareObj"    # Lcom/belkin/firmware/FirmwareDetails;

    .prologue
    .line 143
    if-eqz p0, :cond_0

    .line 144
    :try_start_0
    new-instance v11, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v11, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    .line 145
    .local v11, "crm":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    invoke-virtual/range {p0 .. p0}, Lcom/belkin/firmware/FirmwareDetails;->getBridgeUDN()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 146
    sget-object v1, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "non zigbee update: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual/range {p0 .. p0}, Lcom/belkin/firmware/FirmwareDetails;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 147
    invoke-static {}, Lcom/belkin/wemo/cache/data/DevicesArray;->getInstance()Lcom/belkin/wemo/cache/data/DevicesArray;

    move-result-object v1

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceInformationList()Ljava/util/Map;

    move-result-object v1

    invoke-virtual/range {p0 .. p0}, Lcom/belkin/firmware/FirmwareDetails;->getUniqueID()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 148
    .local v13, "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v13, :cond_0

    .line 149
    new-instance v1, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;

    sget-object v2, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-virtual {v13}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getMAC()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v13}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getPluginID()Ljava/lang/String;

    move-result-object v4

    invoke-virtual/range {p0 .. p0}, Lcom/belkin/firmware/FirmwareDetails;->getUpdateURL()Ljava/lang/String;

    move-result-object v5

    invoke-virtual/range {p0 .. p0}, Lcom/belkin/firmware/FirmwareDetails;->getMd5()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v13}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    const-string v9, ""

    invoke-direct/range {v1 .. v9}, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    invoke-virtual {v11, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    .line 171
    .end local v11    # "crm":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    .end local v13    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_0
    :goto_0
    return-void

    .line 152
    .restart local v11    # "crm":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    :cond_1
    sget-object v1, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "zigbee update: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual/range {p0 .. p0}, Lcom/belkin/firmware/FirmwareDetails;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 153
    invoke-static {}, Lcom/belkin/wemo/cache/data/DevicesArray;->getInstance()Lcom/belkin/wemo/cache/data/DevicesArray;

    move-result-object v1

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceInformationList()Ljava/util/Map;

    move-result-object v12

    .line 154
    .local v12, "devInfoList":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    invoke-virtual/range {p0 .. p0}, Lcom/belkin/firmware/FirmwareDetails;->getBridgeUDN()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v12, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 155
    .restart local v13    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    const-string v7, ""

    .line 156
    .local v7, "zigbeeMacAddress":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/belkin/firmware/FirmwareDetails;->getZigbeeIds()Ljava/lang/String;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 157
    invoke-virtual/range {p0 .. p0}, Lcom/belkin/firmware/FirmwareDetails;->getZigbeeIds()Ljava/lang/String;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v18

    .line 158
    .local v18, "splitIDs":[Ljava/lang/String;
    move-object/from16 v10, v18

    .local v10, "arr$":[Ljava/lang/String;
    array-length v0, v10

    move/from16 v17, v0

    .local v17, "len$":I
    const/4 v15, 0x0

    .local v15, "i$":I
    :goto_1
    move/from16 v0, v17

    if-ge v15, v0, :cond_2

    aget-object v16, v10, v15

    .line 159
    .local v16, "ledId":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, v16

    invoke-interface {v12, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getMAC()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 158
    add-int/lit8 v15, v15, 0x1

    goto :goto_1

    .line 161
    .end local v16    # "ledId":Ljava/lang/String;
    :cond_2
    const/4 v1, 0x0

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v7, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    .line 165
    .end local v10    # "arr$":[Ljava/lang/String;
    .end local v15    # "i$":I
    .end local v17    # "len$":I
    .end local v18    # "splitIDs":[Ljava/lang/String;
    :goto_2
    new-instance v1, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;

    sget-object v2, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-virtual {v13}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getMAC()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v13}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getPluginID()Ljava/lang/String;

    move-result-object v4

    invoke-virtual/range {p0 .. p0}, Lcom/belkin/firmware/FirmwareDetails;->getUpdateURL()Ljava/lang/String;

    move-result-object v5

    invoke-virtual/range {p0 .. p0}, Lcom/belkin/firmware/FirmwareDetails;->getMd5()Ljava/lang/String;

    move-result-object v6

    const/4 v8, 0x1

    invoke-virtual/range {p0 .. p0}, Lcom/belkin/firmware/FirmwareDetails;->getBridgeUDN()Ljava/lang/String;

    move-result-object v9

    invoke-direct/range {v1 .. v9}, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateFirmware;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    invoke-virtual {v11, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 168
    .end local v7    # "zigbeeMacAddress":Ljava/lang/String;
    .end local v11    # "crm":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    .end local v12    # "devInfoList":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    .end local v13    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :catch_0
    move-exception v14

    .line 169
    .local v14, "ex":Ljava/lang/Exception;
    sget-object v1, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    const-string v2, "Exception in startRemoteUpdate : "

    invoke-static {v1, v2, v14}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 163
    .end local v14    # "ex":Ljava/lang/Exception;
    .restart local v7    # "zigbeeMacAddress":Ljava/lang/String;
    .restart local v11    # "crm":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    .restart local v12    # "devInfoList":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    .restart local v13    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_3
    :try_start_1
    invoke-virtual/range {p0 .. p0}, Lcom/belkin/firmware/FirmwareDetails;->getZigbeeIds()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v12, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getMAC()Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v7

    goto :goto_2
.end method

.method private static startUpdate()V
    .locals 7

    .prologue
    .line 290
    sget-object v4, Lcom/belkin/firmware/FirmwareUpdateManager;->zigbeeUpdateQueue:Ljava/util/LinkedHashMap;

    invoke-virtual {v4}, Ljava/util/LinkedHashMap;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_1

    .line 293
    const-wide/16 v4, 0x3e8

    :try_start_0
    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 298
    .local v0, "e":Ljava/lang/InterruptedException;
    :goto_0
    sget-object v4, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    const-string v5, "starting update :"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 299
    sget-object v4, Lcom/belkin/firmware/FirmwareUpdateManager;->zigbeeUpdateQueue:Ljava/util/LinkedHashMap;

    invoke-virtual {v4}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 300
    .local v2, "key":Ljava/lang/String;
    sget-object v4, Lcom/belkin/firmware/FirmwareUpdateManager;->zigbeeUpdateQueue:Ljava/util/LinkedHashMap;

    invoke-virtual {v4, v2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/belkin/firmware/FirmwareDetails;

    .line 301
    .local v1, "fwDetail":Lcom/belkin/firmware/FirmwareDetails;
    sput-object v1, Lcom/belkin/firmware/FirmwareUpdateManager;->currentDevice:Lcom/belkin/firmware/FirmwareDetails;

    .line 303
    new-instance v3, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    sget-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;-><init>(Landroid/content/Context;)V

    .line 304
    .local v3, "mNetworkUtil":Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;
    invoke-virtual {v3}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->isHomeNetwork()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 305
    sget-object v4, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    const-string v5, "local fw update :"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 306
    invoke-static {v1}, Lcom/belkin/firmware/FirmwareUpdateManager;->updateSubDeviceFirmware(Lcom/belkin/firmware/FirmwareDetails;)Z

    .line 321
    .end local v0    # "e":Ljava/lang/InterruptedException;
    .end local v1    # "fwDetail":Lcom/belkin/firmware/FirmwareDetails;
    .end local v2    # "key":Ljava/lang/String;
    .end local v3    # "mNetworkUtil":Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;
    :goto_1
    return-void

    .line 294
    :catch_0
    move-exception v0

    .line 296
    .restart local v0    # "e":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0

    .line 308
    .restart local v1    # "fwDetail":Lcom/belkin/firmware/FirmwareDetails;
    .restart local v2    # "key":Ljava/lang/String;
    .restart local v3    # "mNetworkUtil":Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;
    :cond_0
    sget-object v4, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    const-string v5, "remote fw update :"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 309
    invoke-static {v1}, Lcom/belkin/firmware/FirmwareUpdateManager;->startRemoteUpdate(Lcom/belkin/firmware/FirmwareDetails;)V

    goto :goto_1

    .line 312
    .end local v0    # "e":Ljava/lang/InterruptedException;
    .end local v1    # "fwDetail":Lcom/belkin/firmware/FirmwareDetails;
    .end local v2    # "key":Ljava/lang/String;
    .end local v3    # "mNetworkUtil":Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;
    :cond_1
    sget-object v4, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    const-string v5, "update queue is empty"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 313
    sget-object v4, Lcom/belkin/firmware/FirmwareUpdateManager;->zigbeeUpdateInitiatedQueue:Ljava/util/HashMap;

    if-eqz v4, :cond_2

    .line 314
    sget-object v4, Lcom/belkin/firmware/FirmwareUpdateManager;->zigbeeUpdateInitiatedQueue:Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->clear()V

    .line 315
    sget-object v4, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "zigbeeUpdateInitiatedQueue size:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    sget-object v6, Lcom/belkin/firmware/FirmwareUpdateManager;->zigbeeUpdateInitiatedQueue:Ljava/util/HashMap;

    invoke-virtual {v6}, Ljava/util/HashMap;->size()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 317
    :cond_2
    sget-object v4, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    const-string v5, "zigbeeUpdateInitiatedQueue is null:"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method

.method private static startUpdate(Lcom/belkin/firmware/FirmwareDetails;)V
    .locals 6
    .param p0, "firmwareObj"    # Lcom/belkin/firmware/FirmwareDetails;

    .prologue
    .line 120
    const/4 v1, 0x0

    .line 121
    .local v1, "response":Z
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 122
    invoke-static {p0}, Lcom/belkin/firmware/FirmwareUpdateManager;->startLocalUpdate(Lcom/belkin/firmware/FirmwareDetails;)Z

    move-result v1

    .line 123
    if-nez v1, :cond_1

    .line 124
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 125
    .local v0, "devMgr":Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    if-eqz v0, :cond_0

    .line 126
    const-string v3, "FirmwareUpdateStatus"

    sget-object v4, Lcom/belkin/firmware/FirmwareUpdateManager;->UPDATE_FAILED:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/belkin/firmware/FirmwareDetails;->getUniqueID()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v3, v4, v5}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 139
    .end local v0    # "devMgr":Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    :cond_0
    :goto_0
    return-void

    .line 129
    :cond_1
    invoke-virtual {p0}, Lcom/belkin/firmware/FirmwareDetails;->getUniqueID()Ljava/lang/String;

    move-result-object v2

    .line 130
    .local v2, "udn":Ljava/lang/String;
    sget-object v3, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-static {v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->onDeviceFWUpdateStarted(Ljava/lang/String;)V

    .line 132
    sget-object v3, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "FW Update: update successfully started for UDN: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 136
    .end local v2    # "udn":Ljava/lang/String;
    :cond_2
    invoke-static {p0}, Lcom/belkin/firmware/FirmwareUpdateManager;->startRemoteUpdate(Lcom/belkin/firmware/FirmwareDetails;)V

    goto :goto_0
.end method

.method private static updateSubDeviceFirmware(Lcom/belkin/firmware/FirmwareDetails;)Z
    .locals 13
    .param p0, "firmwareDetails"    # Lcom/belkin/firmware/FirmwareDetails;

    .prologue
    const/4 v9, 0x0

    .line 329
    sget-object v10, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "in updateSubDeviceFirmware"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {p0}, Lcom/belkin/firmware/FirmwareDetails;->getUniqueID()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 330
    const/4 v2, 0x0

    .line 331
    .local v2, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    const/4 v1, 0x0

    .line 333
    .local v1, "bridgeDevice":Lorg/cybergarage/upnp/Device;
    sget-object v10, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-static {v10}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v10

    invoke-virtual {v10}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v2

    .line 335
    if-nez v2, :cond_1

    .line 375
    :cond_0
    :goto_0
    return v9

    .line 337
    :cond_1
    invoke-virtual {v2}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v4

    .line 339
    .local v4, "deviceList":Lorg/cybergarage/upnp/DeviceList;
    if-eqz v4, :cond_0

    .line 342
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_1
    invoke-virtual {v4}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v10

    if-ge v6, v10, :cond_2

    .line 343
    invoke-virtual {v4, v6}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v3

    .line 344
    .local v3, "device":Lorg/cybergarage/upnp/Device;
    if-eqz v3, :cond_0

    .line 346
    invoke-virtual {v3}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v8

    .line 347
    .local v8, "udn":Ljava/lang/String;
    if-eqz v8, :cond_4

    const-string v10, "Bridge"

    invoke-virtual {v8, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_4

    .line 348
    move-object v1, v3

    .line 353
    .end local v3    # "device":Lorg/cybergarage/upnp/Device;
    .end local v8    # "udn":Ljava/lang/String;
    :cond_2
    :try_start_0
    const-string v10, "UpgradeSubDeviceFirmware"

    invoke-virtual {v1, v10}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 354
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    if-eqz v0, :cond_0

    .line 355
    const-string v10, "DeviceList"

    invoke-virtual {p0}, Lcom/belkin/firmware/FirmwareDetails;->getZigbeeIds()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v0, v10, v11}, Lorg/cybergarage/upnp/Action;->setArgumentValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 356
    const-string v10, "FirmwareLink"

    invoke-virtual {p0}, Lcom/belkin/firmware/FirmwareDetails;->getUpdateURL()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v0, v10, v11}, Lorg/cybergarage/upnp/Action;->setArgumentValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 357
    const-string v10, "UpgradePolicy"

    const-string v11, "0"

    invoke-virtual {v0, v10, v11}, Lorg/cybergarage/upnp/Action;->setArgumentValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 358
    sget-object v10, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "action arguements: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "DeviceList"

    invoke-virtual {v0, v12}, Lorg/cybergarage/upnp/Action;->getArgumentValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 359
    sget-object v10, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "action arguements: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "FirmwareLink"

    invoke-virtual {v0, v12}, Lorg/cybergarage/upnp/Action;->getArgumentValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 360
    sget-object v10, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "action arguements: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "UpgradePolicy"

    invoke-virtual {v0, v12}, Lorg/cybergarage/upnp/Action;->getArgumentValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 361
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v7

    .line 362
    .local v7, "response":Ljava/lang/String;
    sget-object v10, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "BULB FIRMWARE RESPONSE: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 363
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_0

    .line 364
    const-string v10, "<Status>0</Status>"

    invoke-virtual {v7, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_3

    .line 365
    sget-object v10, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Bulb update Error"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {p0}, Lcom/belkin/firmware/FirmwareDetails;->getUniqueID()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 366
    invoke-static {}, Lcom/belkin/firmware/FirmwareUpdateManager;->startNextUpdate()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 368
    :cond_3
    const/4 v9, 0x1

    goto/16 :goto_0

    .line 342
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v7    # "response":Ljava/lang/String;
    .restart local v3    # "device":Lorg/cybergarage/upnp/Device;
    .restart local v8    # "udn":Ljava/lang/String;
    :cond_4
    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_1

    .line 372
    .end local v3    # "device":Lorg/cybergarage/upnp/Device;
    .end local v8    # "udn":Ljava/lang/String;
    :catch_0
    move-exception v5

    .line 373
    .local v5, "e":Ljava/lang/Exception;
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_0
.end method

.method public static updateUpgradeStatus(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p0, "id"    # Ljava/lang/String;
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "deviceFWVersion"    # Ljava/lang/String;

    .prologue
    .line 383
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 434
    :cond_0
    :goto_0
    return-void

    .line 386
    :cond_1
    sget-object v1, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "upgrade status: id: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " value:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 388
    const-string v1, "0"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 389
    sget-object v1, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "upgrade started :"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 390
    const/4 v1, 0x1

    sput-boolean v1, Lcom/belkin/firmware/FirmwareUpdateManager;->isUpdating:Z

    .line 391
    invoke-static {p0}, Lcom/belkin/firmware/FirmwareUpdateManager;->getUniqueID(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/belkin/firmware/FirmwareUpdateManager;->currentlyUpdating:Ljava/lang/String;

    .line 392
    sget-object v1, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "updated currently Updating :"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/belkin/firmware/FirmwareUpdateManager;->currentlyUpdating:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 393
    sget-object v1, Lcom/belkin/firmware/FirmwareUpdateManager;->zigbeeUpdateInitiatedQueue:Ljava/util/HashMap;

    if-nez v1, :cond_2

    .line 394
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    sput-object v1, Lcom/belkin/firmware/FirmwareUpdateManager;->zigbeeUpdateInitiatedQueue:Ljava/util/HashMap;

    .line 396
    :cond_2
    sget-object v1, Lcom/belkin/firmware/FirmwareUpdateManager;->zigbeeUpdateInitiatedQueue:Ljava/util/HashMap;

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v1, p0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 397
    sget-object v1, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "updated zigbeeUpdateInitiatedQueue  :"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/belkin/firmware/FirmwareUpdateManager;->zigbeeUpdateInitiatedQueue:Ljava/util/HashMap;

    invoke-virtual {v3, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 398
    sget-object v1, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    const-string v2, "printing zigbeeUpdateInitiatedQueue"

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 399
    sget-object v1, Lcom/belkin/firmware/FirmwareUpdateManager;->zigbeeUpdateInitiatedQueue:Ljava/util/HashMap;

    invoke-static {v1}, Lcom/belkin/firmware/FirmwareUpdateManager;->printQ(Ljava/util/HashMap;)V

    goto/16 :goto_0

    .line 401
    :cond_3
    const-string v1, "4"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 402
    sget-object v1, Lcom/belkin/firmware/FirmwareUpdateManager;->zigbeeUpdateInitiatedQueue:Ljava/util/HashMap;

    if-eqz v1, :cond_4

    sget-object v1, Lcom/belkin/firmware/FirmwareUpdateManager;->zigbeeUpdateInitiatedQueue:Ljava/util/HashMap;

    invoke-virtual {v1, p0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 403
    sget-object v1, Lcom/belkin/firmware/FirmwareUpdateManager;->zigbeeUpdateInitiatedQueue:Ljava/util/HashMap;

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1, p0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 405
    :cond_4
    sget-object v1, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "currentlyUpdating is"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/belkin/firmware/FirmwareUpdateManager;->currentlyUpdating:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 406
    sget-object v1, Lcom/belkin/firmware/FirmwareUpdateManager;->currentlyUpdating:Ljava/lang/String;

    if-eqz v1, :cond_6

    sget-object v1, Lcom/belkin/firmware/FirmwareUpdateManager;->currentlyUpdating:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_6

    .line 407
    invoke-static {p0}, Lcom/belkin/firmware/FirmwareUpdateManager;->checkUpdate(Ljava/lang/String;)Z

    move-result v0

    .line 408
    .local v0, "updateStatus":Z
    sget-object v1, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "updateStatus  :"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 409
    if-eqz v0, :cond_5

    .line 410
    sget-object v1, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    const-string v2, "all good can start next update"

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 411
    invoke-static {}, Lcom/belkin/firmware/FirmwareUpdateManager;->startNextUpdate()V

    .line 417
    .end local v0    # "updateStatus":Z
    :cond_5
    :goto_1
    sget-object v1, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "upgrade completed :"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " deviceFWVersion:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 415
    :cond_6
    sget-object v1, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    const-string v2, "currentlyUpdating isEmpty"

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 419
    :cond_7
    const-string v1, "2"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_8

    const-string v1, "5"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_8

    const-string v1, "6"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 421
    :cond_8
    sget-object v1, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    const-string v2, "error :Firmware Failure"

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 422
    sget-object v1, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "currentlyUpdating is"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/belkin/firmware/FirmwareUpdateManager;->currentlyUpdating:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 423
    sget-object v1, Lcom/belkin/firmware/FirmwareUpdateManager;->zigbeeUpdateInitiatedQueue:Ljava/util/HashMap;

    if-eqz v1, :cond_9

    sget-object v1, Lcom/belkin/firmware/FirmwareUpdateManager;->zigbeeUpdateInitiatedQueue:Ljava/util/HashMap;

    invoke-virtual {v1, p0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 424
    sget-object v1, Lcom/belkin/firmware/FirmwareUpdateManager;->zigbeeUpdateInitiatedQueue:Ljava/util/HashMap;

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1, p0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 426
    :cond_9
    sget-object v1, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Before sending to checkUpdate: id: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 427
    invoke-static {p0}, Lcom/belkin/firmware/FirmwareUpdateManager;->checkUpdate(Ljava/lang/String;)Z

    move-result v0

    .line 428
    .restart local v0    # "updateStatus":Z
    sget-object v1, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "updateStatus  :"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 429
    if-eqz v0, :cond_0

    .line 430
    sget-object v1, Lcom/belkin/firmware/FirmwareUpdateManager;->tag:Ljava/lang/String;

    const-string v2, "all good can start next update"

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 431
    invoke-static {}, Lcom/belkin/firmware/FirmwareUpdateManager;->startNextUpdate()V

    goto/16 :goto_0
.end method
