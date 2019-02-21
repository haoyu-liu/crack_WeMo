.class public final enum Lcom/belkin/wemo/rules/store/RMStoreRulesManager;
.super Ljava/lang/Enum;
.source "RMStoreRulesManager.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/belkin/wemo/rules/store/RMStoreRulesManager;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/belkin/wemo/rules/store/RMStoreRulesManager;

.field public static final enum INSTANCE:Lcom/belkin/wemo/rules/store/RMStoreRulesManager;

.field public static final PARAM_DB_ZIP_FILE_LOC:Ljava/lang/String; = "db_zip_file"

.field public static final PARAM_NEW_DB_VERSION:Ljava/lang/String; = "new_db_version"

.field public static final PARAM_PROCESS_DB:Ljava/lang/String; = "process_db"

.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 30
    new-instance v0, Lcom/belkin/wemo/rules/store/RMStoreRulesManager;

    const-string v1, "INSTANCE"

    invoke-direct {v0, v1, v2}, Lcom/belkin/wemo/rules/store/RMStoreRulesManager;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/belkin/wemo/rules/store/RMStoreRulesManager;->INSTANCE:Lcom/belkin/wemo/rules/store/RMStoreRulesManager;

    .line 28
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/belkin/wemo/rules/store/RMStoreRulesManager;

    sget-object v1, Lcom/belkin/wemo/rules/store/RMStoreRulesManager;->INSTANCE:Lcom/belkin/wemo/rules/store/RMStoreRulesManager;

    aput-object v1, v0, v2

    sput-object v0, Lcom/belkin/wemo/rules/store/RMStoreRulesManager;->$VALUES:[Lcom/belkin/wemo/rules/store/RMStoreRulesManager;

    .line 36
    const-class v0, Lcom/belkin/wemo/rules/store/RMStoreRulesManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/rules/store/RMStoreRulesManager;->TAG:Ljava/lang/String;

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
    .line 38
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 40
    return-void
.end method

.method private getDBVersionToStoreOnDevice(Lcom/belkin/wemo/rules/util/RMIRulesUtils;)I
    .locals 3
    .param p1, "rulesUtils"    # Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    .prologue
    .line 164
    const/4 v1, 0x1

    .line 165
    .local v1, "dbVersionToSend":I
    invoke-interface {p1}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->getRulesDBVerion()Ljava/lang/String;

    move-result-object v0

    .line 167
    .local v0, "currentDBVersion":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isDigitsOnly(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 168
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    add-int/lit8 v1, v2, 0x1

    .line 171
    :cond_0
    return v1
.end method

.method private storeDBRules(Ljava/util/List;Lcom/belkin/wemo/rules/data/RMRule;Lcom/belkin/wemo/rules/store/callback/RMStoreRulesSuccessCallback;Lcom/belkin/wemo/rules/store/callback/RMStoreRulesErrorCallback;)V
    .locals 18
    .param p2, "rule"    # Lcom/belkin/wemo/rules/data/RMRule;
    .param p3, "successCallback"    # Lcom/belkin/wemo/rules/store/callback/RMStoreRulesSuccessCallback;
    .param p4, "errorCallback"    # Lcom/belkin/wemo/rules/store/callback/RMStoreRulesErrorCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;",
            "Lcom/belkin/wemo/rules/data/RMRule;",
            "Lcom/belkin/wemo/rules/store/callback/RMStoreRulesSuccessCallback;",
            "Lcom/belkin/wemo/rules/store/callback/RMStoreRulesErrorCallback;",
            ")V"
        }
    .end annotation

    .prologue
    .line 53
    .local p1, "wemoDevicesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    invoke-static {}, Lcom/belkin/wemo/rules/RMRulesSDK;->instance()Lcom/belkin/wemo/rules/RMRulesSDK;

    move-result-object v16

    .line 54
    .local v16, "sdk":Lcom/belkin/wemo/rules/RMRulesSDK;
    if-eqz v16, :cond_9

    .line 56
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 59
    .local v3, "rulesDBDevicesList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .local v13, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 61
    .local v10, "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    sget-object v4, Lcom/belkin/wemo/WeMo;->INSTANCE:Lcom/belkin/wemo/WeMo;

    invoke-virtual {v4}, Lcom/belkin/wemo/WeMo;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v4

    invoke-virtual {v10}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->isSmart(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 62
    invoke-virtual {v3, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 66
    .end local v10    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_1
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v8

    .line 67
    .local v8, "dbDevicesCount":I
    sget-object v4, Lcom/belkin/wemo/rules/store/RMStoreRulesManager;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Store Rules: DB based online devices count: "

    move-object/from16 v0, v17

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v4, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    if-nez v8, :cond_4

    .line 71
    new-instance v4, Lcom/belkin/wemo/rules/error/RMRulesError;

    const/16 v7, 0x12c

    const-string v17, "No device is online."

    move-object/from16 v0, v17

    invoke-direct {v4, v7, v0}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>(ILjava/lang/String;)V

    move-object/from16 v0, p4

    invoke-interface {v0, v4}, Lcom/belkin/wemo/rules/store/callback/RMStoreRulesErrorCallback;->onStoreRulesFailed(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    .line 128
    :cond_2
    :goto_1
    const/16 v16, 0x0

    .line 135
    .end local v3    # "rulesDBDevicesList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    .end local v8    # "dbDevicesCount":I
    .end local v13    # "i$":Ljava/util/Iterator;
    :cond_3
    :goto_2
    return-void

    .line 73
    .restart local v3    # "rulesDBDevicesList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    .restart local v8    # "dbDevicesCount":I
    .restart local v13    # "i$":Ljava/util/Iterator;
    :cond_4
    invoke-virtual/range {v16 .. v16}, Lcom/belkin/wemo/rules/RMRulesSDK;->getDependencyProvider()Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;

    move-result-object v4

    invoke-interface {v4}, Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;->provideIRulesUtils()Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    move-result-object v15

    .line 76
    .local v15, "rulesUtils":Lcom/belkin/wemo/rules/util/RMIRulesUtils;
    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lcom/belkin/wemo/rules/store/RMStoreRulesManager;->getDBVersionToStoreOnDevice(Lcom/belkin/wemo/rules/util/RMIRulesUtils;)I

    move-result v14

    .line 79
    .local v14, "newDBversion":I
    invoke-interface {v15}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->getDBFilePathWithNameInApp()Ljava/lang/String;

    move-result-object v12

    .line 80
    .local v12, "fileToZip":Ljava/lang/String;
    invoke-interface {v15}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->getZippedDBFilePathWithNameInApp()Ljava/lang/String;

    move-result-object v9

    .line 82
    .local v9, "dbZIPFileLoc":Ljava/lang/String;
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 83
    if-eqz p4, :cond_2

    .line 84
    new-instance v4, Lcom/belkin/wemo/rules/error/RMRulesError;

    invoke-direct {v4}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>()V

    move-object/from16 v0, p4

    invoke-interface {v0, v4}, Lcom/belkin/wemo/rules/store/callback/RMStoreRulesErrorCallback;->onStoreRulesFailed(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    goto :goto_1

    .line 89
    :cond_5
    invoke-interface {v15, v12}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->getFileSizeInByte(Ljava/lang/String;)I

    move-result v4

    const v7, 0x19000

    if-lt v4, v7, :cond_6

    .line 92
    :try_start_0
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v4

    invoke-virtual {v4}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->executeVacuum()V
    :try_end_0
    .catch Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException; {:try_start_0 .. :try_end_0} :catch_0

    .line 103
    :cond_6
    :try_start_1
    invoke-interface {v15, v12, v9}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->createZipFileInApp(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 111
    :cond_7
    :goto_3
    new-instance v5, Ljava/util/HashMap;

    const/4 v4, 0x2

    invoke-direct {v5, v4}, Ljava/util/HashMap;-><init>(I)V

    .line 112
    .local v5, "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v4, "db_zip_file"

    invoke-virtual {v5, v4, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    const-string v4, "new_db_version"

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v5, v4, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    new-instance v6, Lcom/belkin/wemo/rules/store/handler/RMStoreRulesDBResponseHandler;

    invoke-static {v14}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p3

    move-object/from16 v1, p4

    invoke-direct {v6, v0, v1, v15, v4}, Lcom/belkin/wemo/rules/store/handler/RMStoreRulesDBResponseHandler;-><init>(Lcom/belkin/wemo/rules/store/callback/RMStoreRulesSuccessCallback;Lcom/belkin/wemo/rules/store/callback/RMStoreRulesErrorCallback;Lcom/belkin/wemo/rules/util/RMIRulesUtils;Ljava/lang/String;)V

    .line 118
    .local v6, "responseHandler":Lcom/belkin/wemo/rules/store/handler/RMStoreRulesDBResponseHandler;
    invoke-static {}, Lcom/belkin/wemo/rules/operation/impl/RMDBRulesOperationFactory;->getInstance()Lcom/belkin/wemo/rules/operation/RMIRulesOperation;

    move-result-object v2

    .line 119
    .local v2, "operation":Lcom/belkin/wemo/rules/operation/RMIRulesOperation;, "Lcom/belkin/wemo/rules/operation/RMIRulesOperation<Lcom/belkin/wemo/rules/data/RMDBRule;>;"
    if-eqz v2, :cond_8

    move-object/from16 v4, p2

    .line 120
    check-cast v4, Lcom/belkin/wemo/rules/data/RMDBRule;

    move-object v7, v6

    invoke-interface/range {v2 .. v7}, Lcom/belkin/wemo/rules/operation/RMIRulesOperation;->storeRules(Ljava/util/List;Lcom/belkin/wemo/rules/data/RMRule;Ljava/util/HashMap;Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeSuccessCallback;Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback;)V

    goto :goto_1

    .line 93
    .end local v2    # "operation":Lcom/belkin/wemo/rules/operation/RMIRulesOperation;, "Lcom/belkin/wemo/rules/operation/RMIRulesOperation<Lcom/belkin/wemo/rules/data/RMDBRule;>;"
    .end local v5    # "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v6    # "responseHandler":Lcom/belkin/wemo/rules/store/handler/RMStoreRulesDBResponseHandler;
    :catch_0
    move-exception v11

    .line 94
    .local v11, "e":Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
    if-eqz p4, :cond_3

    .line 95
    new-instance v4, Lcom/belkin/wemo/rules/error/RMRulesError;

    invoke-direct {v4}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>()V

    move-object/from16 v0, p4

    invoke-interface {v0, v4}, Lcom/belkin/wemo/rules/store/callback/RMStoreRulesErrorCallback;->onStoreRulesFailed(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    goto :goto_2

    .line 104
    .end local v11    # "e":Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
    :catch_1
    move-exception v11

    .line 105
    .local v11, "e":Ljava/io/IOException;
    sget-object v4, Lcom/belkin/wemo/rules/store/RMStoreRulesManager;->TAG:Ljava/lang/String;

    const-string v7, "Store Rules: Exception during zip: "

    invoke-static {v4, v7, v11}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 106
    if-eqz p4, :cond_7

    .line 107
    new-instance v4, Lcom/belkin/wemo/rules/error/RMRulesError;

    invoke-direct {v4}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>()V

    move-object/from16 v0, p4

    invoke-interface {v0, v4}, Lcom/belkin/wemo/rules/store/callback/RMStoreRulesErrorCallback;->onStoreRulesFailed(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    goto :goto_3

    .line 122
    .end local v11    # "e":Ljava/io/IOException;
    .restart local v2    # "operation":Lcom/belkin/wemo/rules/operation/RMIRulesOperation;, "Lcom/belkin/wemo/rules/operation/RMIRulesOperation<Lcom/belkin/wemo/rules/data/RMDBRule;>;"
    .restart local v5    # "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v6    # "responseHandler":Lcom/belkin/wemo/rules/store/handler/RMStoreRulesDBResponseHandler;
    :cond_8
    if-eqz p4, :cond_2

    .line 123
    new-instance v4, Lcom/belkin/wemo/rules/error/RMRulesError;

    invoke-direct {v4}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>()V

    move-object/from16 v0, p4

    invoke-interface {v0, v4}, Lcom/belkin/wemo/rules/store/callback/RMStoreRulesErrorCallback;->onStoreRulesFailed(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    goto/16 :goto_1

    .line 130
    .end local v2    # "operation":Lcom/belkin/wemo/rules/operation/RMIRulesOperation;, "Lcom/belkin/wemo/rules/operation/RMIRulesOperation<Lcom/belkin/wemo/rules/data/RMDBRule;>;"
    .end local v3    # "rulesDBDevicesList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    .end local v5    # "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v6    # "responseHandler":Lcom/belkin/wemo/rules/store/handler/RMStoreRulesDBResponseHandler;
    .end local v8    # "dbDevicesCount":I
    .end local v9    # "dbZIPFileLoc":Ljava/lang/String;
    .end local v12    # "fileToZip":Ljava/lang/String;
    .end local v13    # "i$":Ljava/util/Iterator;
    .end local v14    # "newDBversion":I
    .end local v15    # "rulesUtils":Lcom/belkin/wemo/rules/util/RMIRulesUtils;
    :cond_9
    sget-object v4, Lcom/belkin/wemo/rules/store/RMStoreRulesManager;->TAG:Ljava/lang/String;

    const-string v7, "Store Rules: Rules SDK is not initialized."

    invoke-static {v4, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    if-eqz p4, :cond_3

    .line 132
    new-instance v4, Lcom/belkin/wemo/rules/error/RMRulesError;

    invoke-direct {v4}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>()V

    move-object/from16 v0, p4

    invoke-interface {v0, v4}, Lcom/belkin/wemo/rules/store/callback/RMStoreRulesErrorCallback;->onStoreRulesFailed(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    goto/16 :goto_2
.end method

.method private storeTNGRules(Ljava/util/List;Lcom/belkin/wemo/rules/data/RMRule;Lcom/belkin/wemo/rules/store/callback/RMStoreRulesSuccessCallback;Lcom/belkin/wemo/rules/store/callback/RMStoreRulesErrorCallback;)V
    .locals 8
    .param p2, "rule"    # Lcom/belkin/wemo/rules/data/RMRule;
    .param p3, "successCallback"    # Lcom/belkin/wemo/rules/store/callback/RMStoreRulesSuccessCallback;
    .param p4, "errorCallback"    # Lcom/belkin/wemo/rules/store/callback/RMStoreRulesErrorCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;",
            "Lcom/belkin/wemo/rules/data/RMRule;",
            "Lcom/belkin/wemo/rules/store/callback/RMStoreRulesSuccessCallback;",
            "Lcom/belkin/wemo/rules/store/callback/RMStoreRulesErrorCallback;",
            ")V"
        }
    .end annotation

    .prologue
    .line 139
    .local p1, "wemoDevicesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 142
    .local v1, "genericDevicesList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    new-instance v3, Lcom/belkin/wemo/rules/store/handler/RMStoreRulesDBResponseHandler;

    invoke-static {}, Lcom/belkin/wemo/rules/RMRulesSDK;->instance()Lcom/belkin/wemo/rules/RMRulesSDK;

    move-result-object v5

    invoke-virtual {v5}, Lcom/belkin/wemo/rules/RMRulesSDK;->getDependencyProvider()Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;

    move-result-object v5

    invoke-interface {v5}, Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;->provideIRulesUtils()Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    move-result-object v5

    const-string v6, ""

    invoke-direct {v3, p3, p4, v5, v6}, Lcom/belkin/wemo/rules/store/handler/RMStoreRulesDBResponseHandler;-><init>(Lcom/belkin/wemo/rules/store/callback/RMStoreRulesSuccessCallback;Lcom/belkin/wemo/rules/store/callback/RMStoreRulesErrorCallback;Lcom/belkin/wemo/rules/util/RMIRulesUtils;Ljava/lang/String;)V

    .line 145
    .local v3, "responseHandler":Lcom/belkin/wemo/rules/store/handler/RMStoreRulesDBResponseHandler;
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

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

    .line 147
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

    .line 148
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 152
    .end local v0    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_1
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    .line 153
    .local v4, "tngDevicesCount":I
    sget-object v5, Lcom/belkin/wemo/rules/store/RMStoreRulesManager;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Store Rules: TNG based online devices count: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 156
    if-nez v4, :cond_2

    .line 157
    new-instance v5, Lcom/belkin/wemo/rules/error/RMRulesError;

    const/16 v6, 0x12c

    const-string v7, "No device is online."

    invoke-direct {v5, v6, v7}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>(ILjava/lang/String;)V

    invoke-interface {p4, v5}, Lcom/belkin/wemo/rules/store/callback/RMStoreRulesErrorCallback;->onStoreRulesFailed(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    .line 161
    :cond_2
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/belkin/wemo/rules/store/RMStoreRulesManager;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 28
    const-class v0, Lcom/belkin/wemo/rules/store/RMStoreRulesManager;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/rules/store/RMStoreRulesManager;

    return-object v0
.end method

.method public static values()[Lcom/belkin/wemo/rules/store/RMStoreRulesManager;
    .locals 1

    .prologue
    .line 28
    sget-object v0, Lcom/belkin/wemo/rules/store/RMStoreRulesManager;->$VALUES:[Lcom/belkin/wemo/rules/store/RMStoreRulesManager;

    invoke-virtual {v0}, [Lcom/belkin/wemo/rules/store/RMStoreRulesManager;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/belkin/wemo/rules/store/RMStoreRulesManager;

    return-object v0
.end method


# virtual methods
.method public storeRules(Lcom/belkin/wemo/rules/data/RMRule;Lcom/belkin/wemo/rules/store/callback/RMStoreRulesSuccessCallback;Lcom/belkin/wemo/rules/store/callback/RMStoreRulesErrorCallback;Ljava/util/List;)V
    .locals 2
    .param p1, "rule"    # Lcom/belkin/wemo/rules/data/RMRule;
    .param p2, "successCallback"    # Lcom/belkin/wemo/rules/store/callback/RMStoreRulesSuccessCallback;
    .param p3, "errorCallback"    # Lcom/belkin/wemo/rules/store/callback/RMStoreRulesErrorCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/belkin/wemo/rules/data/RMRule;",
            "Lcom/belkin/wemo/rules/store/callback/RMStoreRulesSuccessCallback;",
            "Lcom/belkin/wemo/rules/store/callback/RMStoreRulesErrorCallback;",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 44
    .local p4, "wemoDevicesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    const/4 v0, 0x2

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/data/RMRule;->getRulesType()I

    move-result v1

    if-ne v0, v1, :cond_1

    .line 45
    invoke-direct {p0, p4, p1, p2, p3}, Lcom/belkin/wemo/rules/store/RMStoreRulesManager;->storeDBRules(Ljava/util/List;Lcom/belkin/wemo/rules/data/RMRule;Lcom/belkin/wemo/rules/store/callback/RMStoreRulesSuccessCallback;Lcom/belkin/wemo/rules/store/callback/RMStoreRulesErrorCallback;)V

    .line 49
    :cond_0
    :goto_0
    return-void

    .line 46
    :cond_1
    const/4 v0, 0x1

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/data/RMRule;->getRulesType()I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 47
    invoke-direct {p0, p4, p1, p2, p3}, Lcom/belkin/wemo/rules/store/RMStoreRulesManager;->storeTNGRules(Ljava/util/List;Lcom/belkin/wemo/rules/data/RMRule;Lcom/belkin/wemo/rules/store/callback/RMStoreRulesSuccessCallback;Lcom/belkin/wemo/rules/store/callback/RMStoreRulesErrorCallback;)V

    goto :goto_0
.end method
