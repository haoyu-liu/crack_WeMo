.class public Lcom/belkin/wemo/rules/runnable/StoreRulesRemoteRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "StoreRulesRemoteRunnable.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;


# static fields
.field public static final BRIDGE_STUB:Ljava/lang/String; = "bridge"

.field public static final STATE_DO_NOT_PROCESS_DB:I = -0x1

.field public static final STATE_LINK_PROCESS_DB:I = 0x2

.field public static final STATE_NOT_LINK_PROCESS_DB:I = 0x1


# instance fields
.field private base64EncodedDbZip:Ljava/lang/String;

.field private context:Landroid/content/Context;

.field private dbVersionToSend:I

.field private devicesList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;"
        }
    .end annotation
.end field

.field private errorCallback:Lcom/belkin/wemo/rules/callback/StoreRulesErrorCallback;

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

.field private pluginStoreRulesDataList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/belkin/wemo/cache/cloud/RMCloudRequestStoreRules$PluginStoreRulesData;",
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
.method public constructor <init>(Landroid/content/Context;Ljava/util/List;Ljava/lang/String;Ljava/util/HashMap;Lcom/belkin/wemo/rules/callback/StoreRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/StoreRulesErrorCallback;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p3, "base64EncodedDbZip"    # Ljava/lang/String;
    .param p5, "successCallback"    # Lcom/belkin/wemo/rules/callback/StoreRulesSuccessCallback;
    .param p6, "errorCallback"    # Lcom/belkin/wemo/rules/callback/StoreRulesErrorCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ">;",
            "Lcom/belkin/wemo/rules/callback/StoreRulesSuccessCallback;",
            "Lcom/belkin/wemo/rules/callback/StoreRulesErrorCallback;",
            ")V"
        }
    .end annotation

    .prologue
    .line 48
    .local p2, "devicesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    .local p4, "weeklyRecordsHashMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;[Ljava/lang/String;>;"
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 33
    const/4 v0, -0x1

    iput v0, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesRemoteRunnable;->dbVersionToSend:I

    .line 49
    iput-object p3, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesRemoteRunnable;->base64EncodedDbZip:Ljava/lang/String;

    .line 50
    iput-object p1, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesRemoteRunnable;->context:Landroid/content/Context;

    .line 51
    new-instance v0, Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-direct {v0, p1}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesRemoteRunnable;->sharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    .line 52
    iput-object p4, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesRemoteRunnable;->weeklyRecordsHashMap:Ljava/util/HashMap;

    .line 53
    iput-object p5, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesRemoteRunnable;->successCallback:Lcom/belkin/wemo/rules/callback/StoreRulesSuccessCallback;

    .line 54
    iput-object p6, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesRemoteRunnable;->errorCallback:Lcom/belkin/wemo/rules/callback/StoreRulesErrorCallback;

    .line 55
    iput-object p2, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesRemoteRunnable;->devicesList:Ljava/util/List;

    .line 56
    return-void
.end method

.method private checkUdnExistenceInWeeklyCalendar(Ljava/lang/String;)Z
    .locals 6
    .param p1, "UDN"    # Ljava/lang/String;

    .prologue
    .line 121
    const/4 v0, 0x0

    .line 122
    .local v0, "flag":Z
    iget-object v3, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesRemoteRunnable;->weeklyRecordsHashMap:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 123
    .local v2, "key":Ljava/lang/String;
    iget-object v4, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesRemoteRunnable;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "key: "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, " value: "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v3, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesRemoteRunnable;->weeklyRecordsHashMap:Ljava/util/HashMap;

    invoke-virtual {v3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 126
    const/4 v0, 0x1

    goto :goto_0

    .line 129
    .end local v2    # "key":Ljava/lang/String;
    :cond_1
    iget-object v3, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesRemoteRunnable;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "flag "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 130
    return v0
.end method

.method private createPluginStoreRulesDataList()V
    .locals 11

    .prologue
    .line 97
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    iput-object v8, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesRemoteRunnable;->pluginStoreRulesDataList:Ljava/util/ArrayList;

    .line 99
    iget-object v8, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesRemoteRunnable;->devicesList:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v1

    .line 100
    .local v1, "devicesCount":I
    iget-object v8, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesRemoteRunnable;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Store Rules: Total upnp devices count = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    iget-object v8, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesRemoteRunnable;->devicesList:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 103
    .local v0, "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getPluginID()Ljava/lang/String;

    move-result-object v4

    .line 104
    .local v4, "plugingId":Ljava/lang/String;
    const-string v5, "0"

    .line 105
    .local v5, "processDb":Ljava/lang/String;
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v6

    .line 106
    .local v6, "udn":Ljava/lang/String;
    invoke-direct {p0, v6}, Lcom/belkin/wemo/rules/runnable/StoreRulesRemoteRunnable;->checkUdnExistenceInWeeklyCalendar(Ljava/lang/String;)Z

    move-result v7

    .line 107
    .local v7, "udnExitsInWeeklyCalendar":Z
    iget-object v8, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesRemoteRunnable;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "udnExitsInWeeklyCalendar "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " devInfo: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 108
    if-eqz v7, :cond_0

    .line 109
    const-string v5, "1"

    .line 112
    :cond_0
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getMAC()Ljava/lang/String;

    move-result-object v3

    .line 113
    .local v3, "macAddress":Ljava/lang/String;
    iget-object v8, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesRemoteRunnable;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "processDb "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " :plugingId: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " :macAddress: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 115
    iget-object v8, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesRemoteRunnable;->pluginStoreRulesDataList:Ljava/util/ArrayList;

    new-instance v9, Lcom/belkin/wemo/cache/cloud/RMCloudRequestStoreRules$PluginStoreRulesData;

    invoke-direct {v9, v4, v3, v5}, Lcom/belkin/wemo/cache/cloud/RMCloudRequestStoreRules$PluginStoreRulesData;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 118
    .end local v0    # "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v3    # "macAddress":Ljava/lang/String;
    .end local v4    # "plugingId":Ljava/lang/String;
    .end local v5    # "processDb":Ljava/lang/String;
    .end local v6    # "udn":Ljava/lang/String;
    .end local v7    # "udnExitsInWeeklyCalendar":Z
    :cond_1
    return-void
.end method

.method private getDBVersionToStoreOnDevice()I
    .locals 3

    .prologue
    .line 82
    iget v1, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesRemoteRunnable;->dbVersionToSend:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    .line 83
    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesRemoteRunnable;->sharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getDBVersion()Ljava/lang/String;

    move-result-object v0

    .line 85
    .local v0, "currentDBVersion":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isDigitsOnly(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 86
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesRemoteRunnable;->dbVersionToSend:I

    .line 92
    .end local v0    # "currentDBVersion":Ljava/lang/String;
    :cond_0
    :goto_0
    iget v1, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesRemoteRunnable;->dbVersionToSend:I

    return v1

    .line 88
    .restart local v0    # "currentDBVersion":Ljava/lang/String;
    :cond_1
    const/4 v1, 0x1

    iput v1, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesRemoteRunnable;->dbVersionToSend:I

    goto :goto_0
.end method


# virtual methods
.method protected getLoggerTag()Ljava/lang/String;
    .locals 4

    .prologue
    .line 60
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getId()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public onRequestComplete(ZI[B)V
    .locals 2
    .param p1, "success"    # Z
    .param p2, "statusCode"    # I
    .param p3, "resp"    # [B

    .prologue
    .line 135
    if-eqz p1, :cond_1

    .line 137
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesRemoteRunnable;->successCallback:Lcom/belkin/wemo/rules/callback/StoreRulesSuccessCallback;

    if-eqz v0, :cond_0

    .line 138
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesRemoteRunnable;->successCallback:Lcom/belkin/wemo/rules/callback/StoreRulesSuccessCallback;

    invoke-interface {v0}, Lcom/belkin/wemo/rules/callback/StoreRulesSuccessCallback;->onSuccess()V

    .line 146
    :cond_0
    :goto_0
    return-void

    .line 142
    :cond_1
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesRemoteRunnable;->errorCallback:Lcom/belkin/wemo/rules/callback/StoreRulesErrorCallback;

    if-eqz v0, :cond_0

    .line 143
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesRemoteRunnable;->errorCallback:Lcom/belkin/wemo/rules/callback/StoreRulesErrorCallback;

    new-instance v1, Lcom/belkin/wemo/rules/error/RMRulesError;

    invoke-direct {v1}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>()V

    invoke-interface {v0, v1}, Lcom/belkin/wemo/rules/callback/StoreRulesErrorCallback;->onError(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    goto :goto_0
.end method

.method public run()V
    .locals 6

    .prologue
    .line 66
    iget-object v3, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesRemoteRunnable;->TAG:Ljava/lang/String;

    const-string v4, "in StoreRulesRemoteRunnable: is remote enabled: "

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    :try_start_0
    invoke-direct {p0}, Lcom/belkin/wemo/rules/runnable/StoreRulesRemoteRunnable;->createPluginStoreRulesDataList()V

    .line 70
    new-instance v2, Lcom/belkin/wemo/cache/cloud/RMCloudRequestStoreRules;

    iget-object v3, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesRemoteRunnable;->pluginStoreRulesDataList:Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesRemoteRunnable;->base64EncodedDbZip:Ljava/lang/String;

    invoke-direct {p0}, Lcom/belkin/wemo/rules/runnable/StoreRulesRemoteRunnable;->getDBVersionToStoreOnDevice()I

    move-result v5

    invoke-direct {v2, v3, p0, v4, v5}, Lcom/belkin/wemo/cache/cloud/RMCloudRequestStoreRules;-><init>(Ljava/util/List;Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;Ljava/lang/String;I)V

    .line 73
    .local v2, "nestDevices":Lcom/belkin/wemo/cache/cloud/RMCloudRequestStoreRules;
    new-instance v0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    iget-object v3, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesRemoteRunnable;->context:Landroid/content/Context;

    invoke-direct {v0, v3}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    .line 74
    .local v0, "crm":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    invoke-virtual {v0, v2}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 78
    .end local v0    # "crm":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    .end local v2    # "nestDevices":Lcom/belkin/wemo/cache/cloud/RMCloudRequestStoreRules;
    :goto_0
    return-void

    .line 75
    :catch_0
    move-exception v1

    .line 76
    .local v1, "e":Ljava/lang/Exception;
    iget-object v3, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesRemoteRunnable;->TAG:Ljava/lang/String;

    const-string v4, "Exception: "

    invoke-static {v3, v4, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0
.end method
