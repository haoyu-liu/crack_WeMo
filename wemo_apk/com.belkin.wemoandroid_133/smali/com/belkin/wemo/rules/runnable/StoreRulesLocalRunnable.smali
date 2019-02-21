.class public Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;
.super Ljava/lang/Object;
.source "StoreRulesLocalRunnable.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$1;,
        Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$ProcessDBModel;,
        Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;,
        Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$NonRuleDevicesStoreRulesCallback;,
        Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$DeviceStoreProcessingRunnable;,
        Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$DBStatusCheckCallback;
    }
.end annotation


# static fields
.field public static final BRIDGE_STUB:Ljava/lang/String; = "bridge"

.field public static final DB_DOWNLOAD_EXCEPTION:Ljava/lang/String; = "DB Download failed."

.field public static final DB_PATH_STUB:Ljava/lang/String; = "/temprules.db"

.field public static final INVALID_DB_PATH_EXCEPTION:Ljava/lang/String; = "Invalid Device DB Path"

.field public static final MAKER_STUB:Ljava/lang/String; = "maker"

.field public static final STATE_DO_NOT_PROCESS_DB:I = -0x1

.field public static final STATE_LINK_PROCESS_DB:I = 0x2

.field public static final STATE_NOT_LINK_PROCESS_DB:I = 0x1

.field public static final TAG:Ljava/lang/String; = "StoreRulesLocalRunnable"

.field public static final UUID_STUB:Ljava/lang/String; = "uuid"

.field private static storeRuleslock:Ljava/lang/Object;


# instance fields
.field private context:Landroid/content/Context;

.field private dbVersionToSend:I

.field private errorCallback:Lcom/belkin/wemo/rules/callback/StoreRulesErrorCallback;

.field private localZippedDBFilePath:Ljava/lang/String;

.field private nonRuleDevicesList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/cybergarage/upnp/Device;",
            ">;"
        }
    .end annotation
.end field

.field private ruleDevicesList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/cybergarage/upnp/Device;",
            ">;"
        }
    .end annotation
.end field

.field private sharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

.field private successCallback:Lcom/belkin/wemo/rules/callback/StoreRulesSuccessCallback;

.field private udnToProcessDBModelMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$ProcessDBModel;",
            ">;"
        }
    .end annotation
.end field

.field private weeklyRecordsHashMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 105
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->storeRuleslock:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/belkin/wemo/rules/callback/StoreRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/StoreRulesErrorCallback;Ljava/util/HashMap;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "successCallback"    # Lcom/belkin/wemo/rules/callback/StoreRulesSuccessCallback;
    .param p3, "errorCallback"    # Lcom/belkin/wemo/rules/callback/StoreRulesErrorCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/belkin/wemo/rules/callback/StoreRulesSuccessCallback;",
            "Lcom/belkin/wemo/rules/callback/StoreRulesErrorCallback;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 120
    .local p4, "weeklyRecordsHashMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;[Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 100
    const/4 v0, -0x1

    iput v0, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->dbVersionToSend:I

    .line 121
    iput-object p1, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->context:Landroid/content/Context;

    .line 122
    iput-object p2, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->successCallback:Lcom/belkin/wemo/rules/callback/StoreRulesSuccessCallback;

    .line 123
    iput-object p3, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->errorCallback:Lcom/belkin/wemo/rules/callback/StoreRulesErrorCallback;

    .line 124
    iput-object p4, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->weeklyRecordsHashMap:Ljava/util/HashMap;

    .line 125
    new-instance v0, Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-direct {v0, p1}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->sharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    .line 126
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->localZippedDBFilePath:Ljava/lang/String;

    .line 128
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->udnToProcessDBModelMap:Ljava/util/HashMap;

    .line 129
    return-void
.end method

.method static synthetic access$000(Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;

    .prologue
    .line 76
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->context:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$100(Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;)V
    .locals 0
    .param p0, "x0"    # Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;

    .prologue
    .line 76
    invoke-direct {p0}, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->startStoreRules()V

    return-void
.end method

.method static synthetic access$1000(Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;)Lcom/belkin/wemo/cache/utils/SharePreferences;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;

    .prologue
    .line 76
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->sharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;

    .prologue
    .line 76
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->nonRuleDevicesList:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;Ljava/util/List;Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;)V
    .locals 0
    .param p0, "x0"    # Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;
    .param p1, "x1"    # Ljava/util/List;
    .param p2, "x2"    # Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;

    .prologue
    .line 76
    invoke-direct {p0, p1, p2}, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->saveRuleToDevices(Ljava/util/List;Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;)V

    return-void
.end method

.method static synthetic access$200(Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;)Lcom/belkin/wemo/rules/callback/StoreRulesErrorCallback;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;

    .prologue
    .line 76
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->errorCallback:Lcom/belkin/wemo/rules/callback/StoreRulesErrorCallback;

    return-object v0
.end method

.method static synthetic access$300(Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;ILjava/util/ArrayList;)V
    .locals 0
    .param p0, "x0"    # Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;
    .param p1, "x1"    # I
    .param p2, "x2"    # Ljava/util/ArrayList;

    .prologue
    .line 76
    invoke-direct {p0, p1, p2}, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->syncLowerDevicesDB(ILjava/util/ArrayList;)V

    return-void
.end method

.method static synthetic access$500(Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;)Ljava/util/HashMap;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;

    .prologue
    .line 76
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->udnToProcessDBModelMap:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$600(Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;)I
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;

    .prologue
    .line 76
    invoke-direct {p0}, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->getDBVersionToStoreOnDevice()I

    move-result v0

    return v0
.end method

.method static synthetic access$700(Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;

    .prologue
    .line 76
    invoke-direct {p0}, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->getLocalZippedDBFilePath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$800(Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;)Lcom/belkin/wemo/rules/callback/StoreRulesSuccessCallback;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;

    .prologue
    .line 76
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->successCallback:Lcom/belkin/wemo/rules/callback/StoreRulesSuccessCallback;

    return-object v0
.end method

.method static synthetic access$900(Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;)I
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;

    .prologue
    .line 76
    iget v0, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->dbVersionToSend:I

    return v0
.end method

.method private getDBVersionToStoreOnDevice()I
    .locals 3

    .prologue
    .line 418
    iget v1, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->dbVersionToSend:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    .line 419
    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->sharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getDBVersion()Ljava/lang/String;

    move-result-object v0

    .line 421
    .local v0, "currentDBVersion":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isDigitsOnly(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 422
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->dbVersionToSend:I

    .line 427
    .end local v0    # "currentDBVersion":Ljava/lang/String;
    :cond_0
    :goto_0
    iget v1, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->dbVersionToSend:I

    return v1

    .line 424
    .restart local v0    # "currentDBVersion":Ljava/lang/String;
    :cond_1
    const/4 v1, 0x1

    iput v1, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->dbVersionToSend:I

    goto :goto_0
.end method

.method private getLocalZippedDBFilePath()Ljava/lang/String;
    .locals 4

    .prologue
    .line 432
    sget-object v2, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->storeRuleslock:Ljava/lang/Object;

    monitor-enter v2

    .line 434
    :try_start_0
    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->localZippedDBFilePath:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 436
    const-string v1, "StoreRulesLocalRunnable"

    const-string v3, "Store Rules: local zipped file path string is null. Creating zipped file"

    invoke-static {v1, v3}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 439
    new-instance v0, Lcom/belkin/utils/RuleUtility;

    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/belkin/utils/RuleUtility;-><init>(Landroid/content/Context;)V

    .line 440
    .local v0, "ruleUtility":Lcom/belkin/utils/RuleUtility;
    invoke-direct {p0}, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->getDBVersionToStoreOnDevice()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/belkin/utils/RuleUtility;->getLocalZippedDBFilePath(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->localZippedDBFilePath:Ljava/lang/String;

    .line 447
    .end local v0    # "ruleUtility":Lcom/belkin/utils/RuleUtility;
    :goto_0
    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->localZippedDBFilePath:Ljava/lang/String;

    monitor-exit v2

    return-object v1

    .line 444
    :cond_0
    const-string v1, "StoreRulesLocalRunnable"

    const-string v3, "Store Rules: local zipped file path string is avialable for use."

    invoke-static {v1, v3}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 448
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private getProcessDBModelForDevice(Ljava/lang/String;)Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$ProcessDBModel;
    .locals 4
    .param p1, "deviceUDN"    # Ljava/lang/String;

    .prologue
    .line 253
    const/4 v0, -0x1

    .line 254
    .local v0, "processDBState":I
    iget-object v2, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->weeklyRecordsHashMap:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    .line 256
    .local v1, "weeklyRecordArr":[Ljava/lang/String;
    if-eqz v1, :cond_1

    .line 257
    const/4 v0, 0x1

    .line 274
    :cond_0
    :goto_0
    new-instance v2, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$ProcessDBModel;

    invoke-direct {v2, p0, v0, p1, v1}, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$ProcessDBModel;-><init>(Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;ILjava/lang/String;[Ljava/lang/String;)V

    return-object v2

    .line 260
    :cond_1
    iget-object v2, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->weeklyRecordsHashMap:Ljava/util/HashMap;

    invoke-static {p1}, Lcom/belkin/wemo/utils/WeMoUtils;->getMakerUDNComparisonString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "weeklyRecordArr":[Ljava/lang/String;
    check-cast v1, [Ljava/lang/String;

    .line 261
    .restart local v1    # "weeklyRecordArr":[Ljava/lang/String;
    if-eqz v1, :cond_2

    .line 262
    const/4 v0, 0x1

    goto :goto_0

    .line 265
    :cond_2
    iget-object v2, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->weeklyRecordsHashMap:Ljava/util/HashMap;

    const-string v3, "bridge"

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "weeklyRecordArr":[Ljava/lang/String;
    check-cast v1, [Ljava/lang/String;

    .line 267
    .restart local v1    # "weeklyRecordArr":[Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 268
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "bridge"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 269
    const/4 v0, 0x2

    goto :goto_0
.end method

.method private processRuleAndNonRuleDevicesData()V
    .locals 10

    .prologue
    .line 207
    const-string v7, "StoreRulesLocalRunnable"

    const-string v8, "Store Rules: Separating out list of rule and non-rule devices."

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 208
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    iput-object v7, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->ruleDevicesList:Ljava/util/List;

    .line 209
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    iput-object v7, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->nonRuleDevicesList:Ljava/util/List;

    .line 210
    iget-object v7, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->udnToProcessDBModelMap:Ljava/util/HashMap;

    invoke-virtual {v7}, Ljava/util/HashMap;->clear()V

    .line 212
    iget-object v7, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->context:Landroid/content/Context;

    invoke-static {v7}, Lcom/belkin/wemo/utils/WeMoUtils;->getWiFiDeviceList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v2

    .line 213
    .local v2, "deviceList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    .line 214
    .local v3, "devicesCount":I
    const-string v7, "StoreRulesLocalRunnable"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Store Rules: Total upnp devices count = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 216
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 217
    .local v0, "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v1

    .line 219
    .local v1, "device":Lorg/cybergarage/upnp/Device;
    if-eqz v1, :cond_0

    .line 220
    invoke-virtual {v1}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v6

    .line 222
    .local v6, "udn":Ljava/lang/String;
    invoke-virtual {v1}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/belkin/wemo/utils/WeMoUtils;->isSmartDevice(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 223
    const-string v7, "StoreRulesLocalRunnable"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Store Rules: Device: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " is a Smart Device. Thus it shall be ignored."

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 225
    :cond_1
    invoke-direct {p0, v6}, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->getProcessDBModelForDevice(Ljava/lang/String;)Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$ProcessDBModel;

    move-result-object v5

    .line 226
    .local v5, "model":Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$ProcessDBModel;
    iget-object v7, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->udnToProcessDBModelMap:Ljava/util/HashMap;

    invoke-virtual {v7, v6, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 228
    invoke-virtual {v5}, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$ProcessDBModel;->getState()I

    move-result v7

    const/4 v8, -0x1

    if-eq v7, v8, :cond_2

    .line 229
    const-string v7, "StoreRulesLocalRunnable"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Store Rules: Device: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " is a RULE device."

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 230
    iget-object v7, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->ruleDevicesList:Ljava/util/List;

    invoke-interface {v7, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 232
    :cond_2
    const-string v7, "StoreRulesLocalRunnable"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Store Rules: Device: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " is NOT a RULE device."

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 233
    iget-object v7, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->nonRuleDevicesList:Ljava/util/List;

    invoke-interface {v7, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 238
    .end local v0    # "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v1    # "device":Lorg/cybergarage/upnp/Device;
    .end local v5    # "model":Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$ProcessDBModel;
    .end local v6    # "udn":Ljava/lang/String;
    :cond_3
    const-string v7, "StoreRulesLocalRunnable"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Store Rules: Rule devices count: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->ruleDevicesList:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "; Non rule devices count: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->nonRuleDevicesList:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 239
    return-void
.end method

.method private saveRuleToDevices(Ljava/util/List;Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;)V
    .locals 6
    .param p2, "callback"    # Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/cybergarage/upnp/Device;",
            ">;",
            "Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;",
            ")V"
        }
    .end annotation

    .prologue
    .line 242
    .local p1, "deviceList":Ljava/util/List;, "Ljava/util/List<Lorg/cybergarage/upnp/Device;>;"
    const-string v2, "StoreRulesLocalRunnable"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Time: StoreRulesLocalRunnable: Runtime IN : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 245
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/cybergarage/upnp/Device;

    .line 246
    .local v0, "device":Lorg/cybergarage/upnp/Device;
    new-instance v2, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$DeviceStoreProcessingRunnable;

    invoke-direct {v2, p0, v0, p2}, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$DeviceStoreProcessingRunnable;-><init>(Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;Lorg/cybergarage/upnp/Device;Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;)V

    invoke-static {v2}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 249
    .end local v0    # "device":Lorg/cybergarage/upnp/Device;
    :cond_0
    const-string v2, "StoreRulesLocalRunnable"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Time: StoreRulesLocalRunnable: Runtime OUT : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 250
    return-void
.end method

.method private startStoreRules()V
    .locals 5

    .prologue
    .line 190
    const-string v1, "StoreRulesLocalRunnable"

    const-string v2, "Store Rules: Starting the process to save rule to all devices."

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 191
    invoke-direct {p0}, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->processRuleAndNonRuleDevicesData()V

    .line 193
    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->ruleDevicesList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_1

    .line 194
    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->ruleDevicesList:Ljava/util/List;

    new-instance v2, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;

    iget-object v3, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->ruleDevicesList:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    const/4 v4, 0x0

    invoke-direct {v2, p0, v3, v4}, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;-><init>(Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;ILcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$1;)V

    invoke-direct {p0, v1, v2}, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->saveRuleToDevices(Ljava/util/List;Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;)V

    .line 204
    :cond_0
    :goto_0
    return-void

    .line 195
    :cond_1
    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->nonRuleDevicesList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_2

    .line 196
    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->nonRuleDevicesList:Ljava/util/List;

    new-instance v2, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$NonRuleDevicesStoreRulesCallback;

    iget-object v3, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->nonRuleDevicesList:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    invoke-direct {v2, p0, v3}, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$NonRuleDevicesStoreRulesCallback;-><init>(Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;I)V

    invoke-direct {p0, v1, v2}, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->saveRuleToDevices(Ljava/util/List;Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$RuleDevicesStoreDeviceRulesCallback;)V

    goto :goto_0

    .line 198
    :cond_2
    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->errorCallback:Lcom/belkin/wemo/rules/callback/StoreRulesErrorCallback;

    if-eqz v1, :cond_0

    .line 199
    new-instance v0, Lcom/belkin/wemo/rules/error/RMRulesError;

    invoke-direct {v0}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>()V

    .line 200
    .local v0, "error":Lcom/belkin/wemo/rules/error/RMRulesError;
    const-string v1, "No device is online for rules processing."

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/error/RMRulesError;->setErrorMessage(Ljava/lang/String;)V

    .line 201
    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->errorCallback:Lcom/belkin/wemo/rules/callback/StoreRulesErrorCallback;

    invoke-interface {v1, v0}, Lcom/belkin/wemo/rules/callback/StoreRulesErrorCallback;->onError(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    goto :goto_0
.end method

.method private syncLowerDevicesDB(ILjava/util/ArrayList;)V
    .locals 4
    .param p1, "latestDBVersion"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 181
    .local p2, "lowerDBVersionDeviceUDNsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 182
    .local v0, "size":I
    const-string v1, "StoreRulesLocalRunnable"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Store Rules: Devices with older versions of DB to be synced: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 184
    if-lez v0, :cond_0

    .line 185
    new-instance v1, Lcom/belkin/wemo/rules/runnable/SyncRulesLocalRunnable;

    iget-object v2, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->context:Landroid/content/Context;

    invoke-direct {v1, v2, p2, p1}, Lcom/belkin/wemo/rules/runnable/SyncRulesLocalRunnable;-><init>(Landroid/content/Context;Ljava/util/ArrayList;I)V

    invoke-static {v1}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V

    .line 187
    :cond_0
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 136
    const-string v0, "StoreRulesLocalRunnable"

    const-string v1, "Store Rules: Verifying if app has greatest DB version in the home network"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 137
    new-instance v0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$DBStatusCheckCallback;

    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;->sharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getDBVersion()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-direct {v0, p0, v1}, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$DBStatusCheckCallback;-><init>(Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;I)V

    .line 138
    return-void
.end method
