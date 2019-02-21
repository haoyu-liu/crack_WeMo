.class public final enum Lcom/belkin/wemo/rules/fetch/RMFetchRulesManager;
.super Ljava/lang/Enum;
.source "RMFetchRulesManager.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/belkin/wemo/rules/fetch/RMFetchRulesManager;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/belkin/wemo/rules/fetch/RMFetchRulesManager;

.field public static final enum INSTANCE:Lcom/belkin/wemo/rules/fetch/RMFetchRulesManager;

.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 25
    new-instance v0, Lcom/belkin/wemo/rules/fetch/RMFetchRulesManager;

    const-string v1, "INSTANCE"

    invoke-direct {v0, v1, v2}, Lcom/belkin/wemo/rules/fetch/RMFetchRulesManager;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/belkin/wemo/rules/fetch/RMFetchRulesManager;->INSTANCE:Lcom/belkin/wemo/rules/fetch/RMFetchRulesManager;

    .line 23
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/belkin/wemo/rules/fetch/RMFetchRulesManager;

    sget-object v1, Lcom/belkin/wemo/rules/fetch/RMFetchRulesManager;->INSTANCE:Lcom/belkin/wemo/rules/fetch/RMFetchRulesManager;

    aput-object v1, v0, v2

    sput-object v0, Lcom/belkin/wemo/rules/fetch/RMFetchRulesManager;->$VALUES:[Lcom/belkin/wemo/rules/fetch/RMFetchRulesManager;

    .line 27
    const-class v0, Lcom/belkin/wemo/rules/fetch/RMFetchRulesManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/rules/fetch/RMFetchRulesManager;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 29
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 31
    return-void
.end method

.method private fetchDBRules(Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesSuccessCallback;Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesErrorCallback;Ljava/util/List;Lcom/belkin/wemo/rules/RMRulesSDK;)V
    .locals 9
    .param p1, "successCallback"    # Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesSuccessCallback;
    .param p2, "errorCallback"    # Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesErrorCallback;
    .param p4, "sdk"    # Lcom/belkin/wemo/rules/RMRulesSDK;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesSuccessCallback;",
            "Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesErrorCallback;",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;",
            "Lcom/belkin/wemo/rules/RMRulesSDK;",
            ")V"
        }
    .end annotation

    .prologue
    .line 143
    .local p3, "wemoDevicesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 146
    .local v5, "rulesDBDevicesList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 147
    .local v1, "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    sget-object v6, Lcom/belkin/wemo/WeMo;->INSTANCE:Lcom/belkin/wemo/WeMo;

    invoke-virtual {v6}, Lcom/belkin/wemo/WeMo;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v6

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->isSmart(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 148
    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 153
    .end local v1    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_1
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 154
    .local v0, "dbDevicesCount":I
    sget-object v6, Lcom/belkin/wemo/rules/fetch/RMFetchRulesManager;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Fetch Rules: DB based online devices count: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    if-lez v0, :cond_4

    .line 156
    new-instance v4, Lcom/belkin/wemo/rules/fetch/handler/RMFetchRulesResponseHandler;

    const/4 v6, 0x1

    invoke-virtual {p4}, Lcom/belkin/wemo/rules/RMRulesSDK;->getDependencyProvider()Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;

    move-result-object v7

    invoke-interface {v7}, Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;->provideRulesUpdateBroadcast()Lcom/belkin/wemo/rules/db/broadcast/RMIRulesUpdatedBroadcaster;

    move-result-object v7

    invoke-direct {v4, v6, p1, p2, v7}, Lcom/belkin/wemo/rules/fetch/handler/RMFetchRulesResponseHandler;-><init>(ILcom/belkin/wemo/rules/fetch/callback/RMFetchRulesSuccessCallback;Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesErrorCallback;Lcom/belkin/wemo/rules/db/broadcast/RMIRulesUpdatedBroadcaster;)V

    .line 157
    .local v4, "responseHandler":Lcom/belkin/wemo/rules/fetch/handler/RMFetchRulesResponseHandler;
    invoke-static {}, Lcom/belkin/wemo/rules/operation/impl/RMDBRulesOperationFactory;->getInstance()Lcom/belkin/wemo/rules/operation/RMIRulesOperation;

    move-result-object v3

    .line 158
    .local v3, "operation":Lcom/belkin/wemo/rules/operation/RMIRulesOperation;, "Lcom/belkin/wemo/rules/operation/RMIRulesOperation<Lcom/belkin/wemo/rules/data/RMDBRule;>;"
    if-eqz v3, :cond_3

    .line 159
    invoke-interface {v3, v5, v4, v4}, Lcom/belkin/wemo/rules/operation/RMIRulesOperation;->fetchRules(Ljava/util/List;Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeSuccessCallback;Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeErrorCallback;)V

    .line 172
    .end local v3    # "operation":Lcom/belkin/wemo/rules/operation/RMIRulesOperation;, "Lcom/belkin/wemo/rules/operation/RMIRulesOperation<Lcom/belkin/wemo/rules/data/RMDBRule;>;"
    .end local v4    # "responseHandler":Lcom/belkin/wemo/rules/fetch/handler/RMFetchRulesResponseHandler;
    :cond_2
    :goto_1
    return-void

    .line 161
    .restart local v3    # "operation":Lcom/belkin/wemo/rules/operation/RMIRulesOperation;, "Lcom/belkin/wemo/rules/operation/RMIRulesOperation<Lcom/belkin/wemo/rules/data/RMDBRule;>;"
    .restart local v4    # "responseHandler":Lcom/belkin/wemo/rules/fetch/handler/RMFetchRulesResponseHandler;
    :cond_3
    if-eqz p2, :cond_2

    .line 162
    new-instance v6, Lcom/belkin/wemo/rules/error/RMRulesError;

    invoke-direct {v6}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>()V

    invoke-interface {p2, v6}, Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesErrorCallback;->onRulesFetchFailed(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    goto :goto_1

    .line 167
    .end local v3    # "operation":Lcom/belkin/wemo/rules/operation/RMIRulesOperation;, "Lcom/belkin/wemo/rules/operation/RMIRulesOperation<Lcom/belkin/wemo/rules/data/RMDBRule;>;"
    .end local v4    # "responseHandler":Lcom/belkin/wemo/rules/fetch/handler/RMFetchRulesResponseHandler;
    :cond_4
    if-eqz p2, :cond_2

    .line 169
    new-instance v6, Lcom/belkin/wemo/rules/error/RMRulesError;

    const/16 v7, 0x12c

    const-string v8, "No device is online."

    invoke-direct {v6, v7, v8}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>(ILjava/lang/String;)V

    invoke-interface {p2, v6}, Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesErrorCallback;->onRulesFetchFailed(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    goto :goto_1
.end method

.method private fetchTNGRules(Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesSuccessCallback;Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesErrorCallback;Ljava/util/List;Lcom/belkin/wemo/rules/RMRulesSDK;)V
    .locals 8
    .param p1, "successCallback"    # Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesSuccessCallback;
    .param p2, "errorCallback"    # Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesErrorCallback;
    .param p4, "sdk"    # Lcom/belkin/wemo/rules/RMRulesSDK;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesSuccessCallback;",
            "Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesErrorCallback;",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;",
            "Lcom/belkin/wemo/rules/RMRulesSDK;",
            ")V"
        }
    .end annotation

    .prologue
    .line 118
    .local p3, "wemoDevicesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 120
    .local v1, "genericDevicesList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 121
    .local v0, "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    sget-object v5, Lcom/belkin/wemo/WeMo;->INSTANCE:Lcom/belkin/wemo/WeMo;

    invoke-virtual {v5}, Lcom/belkin/wemo/WeMo;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v5

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->isSmart(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 122
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 127
    .end local v0    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_1
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    .line 128
    .local v4, "tngDevicesCount":I
    sget-object v5, Lcom/belkin/wemo/rules/fetch/RMFetchRulesManager;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Fetch Rules: TNG based online devices count: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    if-lez v4, :cond_3

    .line 130
    new-instance v3, Lcom/belkin/wemo/rules/fetch/handler/RMFetchRulesResponseHandler;

    const/4 v5, 0x1

    invoke-virtual {p4}, Lcom/belkin/wemo/rules/RMRulesSDK;->getDependencyProvider()Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;

    move-result-object v6

    invoke-interface {v6}, Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;->provideRulesUpdateBroadcast()Lcom/belkin/wemo/rules/db/broadcast/RMIRulesUpdatedBroadcaster;

    move-result-object v6

    invoke-direct {v3, v5, p1, p2, v6}, Lcom/belkin/wemo/rules/fetch/handler/RMFetchRulesResponseHandler;-><init>(ILcom/belkin/wemo/rules/fetch/callback/RMFetchRulesSuccessCallback;Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesErrorCallback;Lcom/belkin/wemo/rules/db/broadcast/RMIRulesUpdatedBroadcaster;)V

    .line 131
    .local v3, "responseHandler":Lcom/belkin/wemo/rules/fetch/handler/RMFetchRulesResponseHandler;
    invoke-static {}, Lcom/belkin/wemo/rules/operation/impl/RMTNGRulesOperationFactory;->getInstance()Lcom/belkin/wemo/rules/operation/RMIRulesOperation;

    move-result-object v5

    invoke-interface {v5, v1, v3, v3}, Lcom/belkin/wemo/rules/operation/RMIRulesOperation;->fetchRules(Ljava/util/List;Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeSuccessCallback;Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeErrorCallback;)V

    .line 138
    .end local v3    # "responseHandler":Lcom/belkin/wemo/rules/fetch/handler/RMFetchRulesResponseHandler;
    :cond_2
    :goto_1
    return-void

    .line 133
    :cond_3
    if-eqz p2, :cond_2

    .line 135
    new-instance v5, Lcom/belkin/wemo/rules/error/RMRulesError;

    const/16 v6, 0x12c

    const-string v7, "No device is online."

    invoke-direct {v5, v6, v7}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>(ILjava/lang/String;)V

    invoke-interface {p2, v5}, Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesErrorCallback;->onRulesFetchFailed(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    goto :goto_1
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/belkin/wemo/rules/fetch/RMFetchRulesManager;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 23
    const-class v0, Lcom/belkin/wemo/rules/fetch/RMFetchRulesManager;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/rules/fetch/RMFetchRulesManager;

    return-object v0
.end method

.method public static values()[Lcom/belkin/wemo/rules/fetch/RMFetchRulesManager;
    .locals 1

    .prologue
    .line 23
    sget-object v0, Lcom/belkin/wemo/rules/fetch/RMFetchRulesManager;->$VALUES:[Lcom/belkin/wemo/rules/fetch/RMFetchRulesManager;

    invoke-virtual {v0}, [Lcom/belkin/wemo/rules/fetch/RMFetchRulesManager;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/belkin/wemo/rules/fetch/RMFetchRulesManager;

    return-object v0
.end method


# virtual methods
.method public fetchAndSyncRules(Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesSuccessCallback;Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesErrorCallback;Ljava/util/List;)V
    .locals 15
    .param p1, "successCallback"    # Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesSuccessCallback;
    .param p2, "errorCallback"    # Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesErrorCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesSuccessCallback;",
            "Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesErrorCallback;",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 35
    .local p3, "activeDevicesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    invoke-static {}, Lcom/belkin/wemo/rules/RMRulesSDK;->instance()Lcom/belkin/wemo/rules/RMRulesSDK;

    move-result-object v14

    .line 36
    .local v14, "sdk":Lcom/belkin/wemo/rules/RMRulesSDK;
    if-eqz v14, :cond_6

    .line 37
    const/4 v12, 0x0

    .line 40
    .local v12, "ruleTypesCount":I
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 43
    .local v9, "genericDevicesList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    .line 46
    .local v13, "rulesDBDevicesList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    invoke-interface/range {p3 .. p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .local v10, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 48
    .local v8, "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual {v14}, Lcom/belkin/wemo/rules/RMRulesSDK;->getDependencyProvider()Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;

    move-result-object v2

    invoke-interface {v2}, Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;->provideIRulesUtils()Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    move-result-object v2

    invoke-virtual {v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->isSmartDevice(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 49
    invoke-virtual {v9, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 51
    :cond_0
    invoke-virtual {v13, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 55
    .end local v8    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_1
    new-instance v1, Lcom/belkin/wemo/rules/fetch/handler/RMFetchAndSyncRulesResponseHandler;

    const/4 v2, 0x0

    invoke-virtual {v14}, Lcom/belkin/wemo/rules/RMRulesSDK;->getDependencyProvider()Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;

    move-result-object v3

    invoke-interface {v3}, Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;->provideIRulesUtils()Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    move-result-object v5

    invoke-virtual {v14}, Lcom/belkin/wemo/rules/RMRulesSDK;->getDependencyProvider()Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;

    move-result-object v3

    invoke-interface {v3}, Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;->provideRulesUpdateBroadcast()Lcom/belkin/wemo/rules/db/broadcast/RMIRulesUpdatedBroadcaster;

    move-result-object v6

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    invoke-direct/range {v1 .. v6}, Lcom/belkin/wemo/rules/fetch/handler/RMFetchAndSyncRulesResponseHandler;-><init>(ILcom/belkin/wemo/rules/fetch/callback/RMFetchRulesSuccessCallback;Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesErrorCallback;Lcom/belkin/wemo/rules/util/RMIRulesUtils;Lcom/belkin/wemo/rules/db/broadcast/RMIRulesUpdatedBroadcaster;)V

    .line 61
    .local v1, "responseHandler":Lcom/belkin/wemo/rules/fetch/handler/RMFetchAndSyncRulesResponseHandler;
    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v7

    .line 62
    .local v7, "dbDevicesCount":I
    sget-object v2, Lcom/belkin/wemo/rules/fetch/RMFetchRulesManager;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Fetch Rules: DB based online devices count: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    if-lez v7, :cond_2

    .line 64
    add-int/lit8 v12, v12, 0x1

    invoke-virtual {v1, v12}, Lcom/belkin/wemo/rules/fetch/handler/RMFetchAndSyncRulesResponseHandler;->setRuleTypesCount(I)V

    .line 65
    invoke-static {}, Lcom/belkin/wemo/rules/operation/impl/RMDBRulesOperationFactory;->getInstance()Lcom/belkin/wemo/rules/operation/RMIRulesOperation;

    move-result-object v11

    .line 66
    .local v11, "operation":Lcom/belkin/wemo/rules/operation/RMIRulesOperation;, "Lcom/belkin/wemo/rules/operation/RMIRulesOperation<Lcom/belkin/wemo/rules/data/RMDBRule;>;"
    if-eqz v11, :cond_5

    .line 67
    invoke-interface {v11, v13, v1, v1}, Lcom/belkin/wemo/rules/operation/RMIRulesOperation;->fetchRules(Ljava/util/List;Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeSuccessCallback;Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeErrorCallback;)V

    .line 84
    .end local v11    # "operation":Lcom/belkin/wemo/rules/operation/RMIRulesOperation;, "Lcom/belkin/wemo/rules/operation/RMIRulesOperation<Lcom/belkin/wemo/rules/data/RMDBRule;>;"
    :cond_2
    :goto_1
    if-nez v12, :cond_3

    if-eqz p2, :cond_3

    .line 85
    new-instance v2, Lcom/belkin/wemo/rules/error/RMRulesError;

    const/16 v3, 0x12c

    const-string v4, "No device is online."

    invoke-direct {v2, v3, v4}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>(ILjava/lang/String;)V

    move-object/from16 v0, p2

    invoke-interface {v0, v2}, Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesErrorCallback;->onRulesFetchFailed(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    .line 87
    :cond_3
    const/4 v14, 0x0

    .line 93
    .end local v1    # "responseHandler":Lcom/belkin/wemo/rules/fetch/handler/RMFetchAndSyncRulesResponseHandler;
    .end local v7    # "dbDevicesCount":I
    .end local v9    # "genericDevicesList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    .end local v10    # "i$":Ljava/util/Iterator;
    .end local v12    # "ruleTypesCount":I
    .end local v13    # "rulesDBDevicesList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    :cond_4
    :goto_2
    return-void

    .line 69
    .restart local v1    # "responseHandler":Lcom/belkin/wemo/rules/fetch/handler/RMFetchAndSyncRulesResponseHandler;
    .restart local v7    # "dbDevicesCount":I
    .restart local v9    # "genericDevicesList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    .restart local v10    # "i$":Ljava/util/Iterator;
    .restart local v11    # "operation":Lcom/belkin/wemo/rules/operation/RMIRulesOperation;, "Lcom/belkin/wemo/rules/operation/RMIRulesOperation<Lcom/belkin/wemo/rules/data/RMDBRule;>;"
    .restart local v12    # "ruleTypesCount":I
    .restart local v13    # "rulesDBDevicesList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    :cond_5
    if-eqz p2, :cond_2

    .line 70
    new-instance v2, Lcom/belkin/wemo/rules/error/RMRulesError;

    invoke-direct {v2}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>()V

    move-object/from16 v0, p2

    invoke-interface {v0, v2}, Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesErrorCallback;->onRulesFetchFailed(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    goto :goto_1

    .line 89
    .end local v1    # "responseHandler":Lcom/belkin/wemo/rules/fetch/handler/RMFetchAndSyncRulesResponseHandler;
    .end local v7    # "dbDevicesCount":I
    .end local v9    # "genericDevicesList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    .end local v10    # "i$":Ljava/util/Iterator;
    .end local v11    # "operation":Lcom/belkin/wemo/rules/operation/RMIRulesOperation;, "Lcom/belkin/wemo/rules/operation/RMIRulesOperation<Lcom/belkin/wemo/rules/data/RMDBRule;>;"
    .end local v12    # "ruleTypesCount":I
    .end local v13    # "rulesDBDevicesList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    :cond_6
    if-eqz p2, :cond_4

    .line 90
    new-instance v2, Lcom/belkin/wemo/rules/error/RMRulesError;

    invoke-direct {v2}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>()V

    move-object/from16 v0, p2

    invoke-interface {v0, v2}, Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesErrorCallback;->onRulesFetchFailed(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    goto :goto_2
.end method

.method public fetchRules(Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesSuccessCallback;Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesErrorCallback;ILjava/util/List;)V
    .locals 3
    .param p1, "successCallback"    # Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesSuccessCallback;
    .param p2, "errorCallback"    # Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesErrorCallback;
    .param p3, "rulesType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesSuccessCallback;",
            "Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesErrorCallback;",
            "I",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 96
    .local p4, "activeDevicesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    invoke-static {}, Lcom/belkin/wemo/rules/RMRulesSDK;->instance()Lcom/belkin/wemo/rules/RMRulesSDK;

    move-result-object v0

    .line 97
    .local v0, "sdk":Lcom/belkin/wemo/rules/RMRulesSDK;
    if-eqz v0, :cond_3

    .line 98
    const/4 v1, 0x2

    if-ne p3, v1, :cond_1

    .line 99
    invoke-direct {p0, p1, p2, p4, v0}, Lcom/belkin/wemo/rules/fetch/RMFetchRulesManager;->fetchDBRules(Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesSuccessCallback;Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesErrorCallback;Ljava/util/List;Lcom/belkin/wemo/rules/RMRulesSDK;)V

    .line 113
    :cond_0
    :goto_0
    return-void

    .line 100
    :cond_1
    const/4 v1, 0x1

    if-ne p3, v1, :cond_2

    .line 101
    invoke-direct {p0, p1, p2, p4, v0}, Lcom/belkin/wemo/rules/fetch/RMFetchRulesManager;->fetchTNGRules(Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesSuccessCallback;Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesErrorCallback;Ljava/util/List;Lcom/belkin/wemo/rules/RMRulesSDK;)V

    goto :goto_0

    .line 103
    :cond_2
    sget-object v1, Lcom/belkin/wemo/rules/fetch/RMFetchRulesManager;->TAG:Ljava/lang/String;

    const-string v2, "Fetch Rules: Unknown RULES TYPE"

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    if-eqz p2, :cond_0

    .line 105
    new-instance v1, Lcom/belkin/wemo/rules/error/RMRulesError;

    invoke-direct {v1}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>()V

    invoke-interface {p2, v1}, Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesErrorCallback;->onRulesFetchFailed(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    goto :goto_0

    .line 109
    :cond_3
    if-eqz p2, :cond_0

    .line 110
    new-instance v1, Lcom/belkin/wemo/rules/error/RMRulesError;

    invoke-direct {v1}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>()V

    invoke-interface {p2, v1}, Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesErrorCallback;->onRulesFetchFailed(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    goto :goto_0
.end method
