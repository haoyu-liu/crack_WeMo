.class Lcom/belkin/wemo/push/service/GCMIntentService$FetchDevicesRulesCallback;
.super Ljava/lang/Object;
.source "GCMIntentService.java"

# interfaces
.implements Lcom/belkin/wemo/rules/callback/FetchRulesErrorCallback;
.implements Lcom/belkin/wemo/rules/callback/FetchRulesSuccessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/push/service/GCMIntentService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FetchDevicesRulesCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/wemo/push/service/GCMIntentService;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/push/service/GCMIntentService;)V
    .locals 0

    .prologue
    .line 250
    iput-object p1, p0, Lcom/belkin/wemo/push/service/GCMIntentService$FetchDevicesRulesCallback;->this$0:Lcom/belkin/wemo/push/service/GCMIntentService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 251
    return-void
.end method

.method private doesRulesDBExist()Z
    .locals 3

    .prologue
    .line 292
    new-instance v0, Ljava/io/File;

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getLocalDBPath()Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getLocalDBName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 293
    .local v0, "dbExists":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 294
    const/4 v1, 0x1

    .line 296
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private getWeeklyCalender(Ljava/util/ArrayList;)Ljava/util/HashMap;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 302
    .local p1, "ruleIdArrayForNestDevices":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v5, p0, Lcom/belkin/wemo/push/service/GCMIntentService$FetchDevicesRulesCallback;->this$0:Lcom/belkin/wemo/push/service/GCMIntentService;

    iget-object v5, v5, Lcom/belkin/wemo/push/service/GCMIntentService;->TAG:Ljava/lang/String;

    const-string v6, "Get Weekly Calendar"

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 304
    const/4 v3, 0x0

    .line 306
    .local v3, "targetDeviceUdn":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :try_start_0
    sget-object v5, Lcom/belkin/wemo/push/service/GCMIntentService;->rMRulesDBManager:Lcom/belkin/rules/db/RMRulesDBManager;

    invoke-virtual {v5, p1}, Lcom/belkin/rules/db/RMRulesDBManager;->getTargetDeviceUDNForNestDevices(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    :try_end_0
    .catch Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 312
    :goto_0
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 314
    .local v4, "weeklyRecordsHashMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;[Ljava/lang/String;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v2, v5, :cond_0

    .line 316
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 317
    .local v0, "UDN":Ljava/lang/String;
    iget-object v5, p0, Lcom/belkin/wemo/push/service/GCMIntentService$FetchDevicesRulesCallback;->this$0:Lcom/belkin/wemo/push/service/GCMIntentService;

    iget-object v5, v5, Lcom/belkin/wemo/push/service/GCMIntentService;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Target Device UDN For Nest Devices: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 318
    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/String;

    invoke-virtual {v4, v0, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 314
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 307
    .end local v0    # "UDN":Ljava/lang/String;
    .end local v2    # "i":I
    .end local v4    # "weeklyRecordsHashMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;[Ljava/lang/String;>;"
    :catch_0
    move-exception v1

    .line 308
    .local v1, "e":Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
    iget-object v5, p0, Lcom/belkin/wemo/push/service/GCMIntentService$FetchDevicesRulesCallback;->this$0:Lcom/belkin/wemo/push/service/GCMIntentService;

    iget-object v5, v5, Lcom/belkin/wemo/push/service/GCMIntentService;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "RuleDBException: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 309
    invoke-virtual {v1}, Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;->printStackTrace()V

    goto :goto_0

    .line 320
    .end local v1    # "e":Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
    .restart local v2    # "i":I
    .restart local v4    # "weeklyRecordsHashMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;[Ljava/lang/String;>;"
    :cond_0
    return-object v4
.end method


# virtual methods
.method public onError()V
    .locals 2

    .prologue
    .line 255
    iget-object v0, p0, Lcom/belkin/wemo/push/service/GCMIntentService$FetchDevicesRulesCallback;->this$0:Lcom/belkin/wemo/push/service/GCMIntentService;

    iget-object v0, v0, Lcom/belkin/wemo/push/service/GCMIntentService;->TAG:Ljava/lang/String;

    const-string v1, "FetchDevicerulesCallback: error during fetchRules()."

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 256
    return-void
.end method

.method public onSuccess(Ljava/lang/String;ILjava/util/ArrayList;)V
    .locals 8
    .param p1, "pragmaUserVersion"    # Ljava/lang/String;
    .param p2, "latestDBVersion"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 261
    .local p3, "outdatedDeviceUDNsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v5, p0, Lcom/belkin/wemo/push/service/GCMIntentService$FetchDevicesRulesCallback;->this$0:Lcom/belkin/wemo/push/service/GCMIntentService;

    iget-object v5, v5, Lcom/belkin/wemo/push/service/GCMIntentService;->TAG:Ljava/lang/String;

    const-string v6, "FetchDevicerulesCallback: on success during fetchRules()."

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 263
    const/4 v3, 0x0

    .line 266
    .local v3, "ruleIdArrayForNestDevices":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-direct {p0}, Lcom/belkin/wemo/push/service/GCMIntentService$FetchDevicesRulesCallback;->doesRulesDBExist()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 268
    iget-object v5, p0, Lcom/belkin/wemo/push/service/GCMIntentService$FetchDevicesRulesCallback;->this$0:Lcom/belkin/wemo/push/service/GCMIntentService;

    invoke-virtual {v5}, Lcom/belkin/wemo/push/service/GCMIntentService;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lcom/belkin/rules/db/RMRulesDBManager;->getInstance(Landroid/content/Context;)Lcom/belkin/rules/db/RMRulesDBManager;

    move-result-object v5

    sput-object v5, Lcom/belkin/wemo/push/service/GCMIntentService;->rMRulesDBManager:Lcom/belkin/rules/db/RMRulesDBManager;

    .line 270
    :try_start_0
    sget-object v5, Lcom/belkin/wemo/push/service/GCMIntentService;->rMRulesDBManager:Lcom/belkin/rules/db/RMRulesDBManager;

    invoke-virtual {v5}, Lcom/belkin/rules/db/RMRulesDBManager;->getRuleIdArrayForNestDevices()Ljava/util/ArrayList;

    move-result-object v3

    .line 271
    iget-object v5, p0, Lcom/belkin/wemo/push/service/GCMIntentService$FetchDevicesRulesCallback;->this$0:Lcom/belkin/wemo/push/service/GCMIntentService;

    invoke-direct {p0, v3}, Lcom/belkin/wemo/push/service/GCMIntentService$FetchDevicesRulesCallback;->getWeeklyCalender(Ljava/util/ArrayList;)Ljava/util/HashMap;

    move-result-object v6

    iput-object v6, v5, Lcom/belkin/wemo/push/service/GCMIntentService;->weeklyRecordsHashMap:Ljava/util/HashMap;

    .line 272
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v1, v5, :cond_0

    .line 274
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 275
    .local v2, "ruleId":Ljava/lang/String;
    iget-object v5, p0, Lcom/belkin/wemo/push/service/GCMIntentService$FetchDevicesRulesCallback;->this$0:Lcom/belkin/wemo/push/service/GCMIntentService;

    iget-object v5, v5, Lcom/belkin/wemo/push/service/GCMIntentService;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "RuleId: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 276
    sget-object v5, Lcom/belkin/wemo/push/service/GCMIntentService;->rMRulesDBManager:Lcom/belkin/rules/db/RMRulesDBManager;

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Lcom/belkin/rules/db/RMRulesDBManager;->deleteRowRules(I)I

    .line 277
    sget-object v5, Lcom/belkin/wemo/push/service/GCMIntentService;->rMRulesDBManager:Lcom/belkin/rules/db/RMRulesDBManager;

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Lcom/belkin/rules/db/RMRulesDBManager;->deleteRowRuleDevices(I)I
    :try_end_0
    .catch Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException; {:try_start_0 .. :try_end_0} :catch_0

    .line 272
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 279
    .end local v1    # "i":I
    .end local v2    # "ruleId":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 280
    .local v0, "e":Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
    iget-object v5, p0, Lcom/belkin/wemo/push/service/GCMIntentService$FetchDevicesRulesCallback;->this$0:Lcom/belkin/wemo/push/service/GCMIntentService;

    iget-object v5, v5, Lcom/belkin/wemo/push/service/GCMIntentService;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "RuleDBException: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v0}, Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 282
    .end local v0    # "e":Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
    :cond_0
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lez v5, :cond_1

    .line 283
    new-instance v4, Lcom/belkin/wemo/push/service/GCMIntentService$StoreDeviceRulesCallback;

    iget-object v5, p0, Lcom/belkin/wemo/push/service/GCMIntentService$FetchDevicesRulesCallback;->this$0:Lcom/belkin/wemo/push/service/GCMIntentService;

    invoke-direct {v4, v5}, Lcom/belkin/wemo/push/service/GCMIntentService$StoreDeviceRulesCallback;-><init>(Lcom/belkin/wemo/push/service/GCMIntentService;)V

    .line 284
    .local v4, "storeDeviceRulesCallback":Lcom/belkin/wemo/push/service/GCMIntentService$StoreDeviceRulesCallback;
    iget-object v5, p0, Lcom/belkin/wemo/push/service/GCMIntentService$FetchDevicesRulesCallback;->this$0:Lcom/belkin/wemo/push/service/GCMIntentService;

    invoke-virtual {v5}, Lcom/belkin/wemo/push/service/GCMIntentService;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lcom/belkin/wemo/rules/impl/WeMoRulesFactory;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/rules/IWeMoRules;

    move-result-object v5

    iget-object v6, p0, Lcom/belkin/wemo/push/service/GCMIntentService$FetchDevicesRulesCallback;->this$0:Lcom/belkin/wemo/push/service/GCMIntentService;

    invoke-virtual {v6}, Lcom/belkin/wemo/push/service/GCMIntentService;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/wemo/push/service/GCMIntentService$FetchDevicesRulesCallback;->this$0:Lcom/belkin/wemo/push/service/GCMIntentService;

    iget-object v7, v7, Lcom/belkin/wemo/push/service/GCMIntentService;->weeklyRecordsHashMap:Ljava/util/HashMap;

    invoke-interface {v5, v6, v7, v4, v4}, Lcom/belkin/wemo/rules/IWeMoRules;->storeRules(Landroid/content/Context;Ljava/util/HashMap;Lcom/belkin/wemo/rules/callback/StoreRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/StoreRulesErrorCallback;)V

    .line 289
    .end local v4    # "storeDeviceRulesCallback":Lcom/belkin/wemo/push/service/GCMIntentService$StoreDeviceRulesCallback;
    :cond_1
    :goto_1
    return-void

    .line 287
    :cond_2
    iget-object v5, p0, Lcom/belkin/wemo/push/service/GCMIntentService$FetchDevicesRulesCallback;->this$0:Lcom/belkin/wemo/push/service/GCMIntentService;

    iget-object v5, v5, Lcom/belkin/wemo/push/service/GCMIntentService;->TAG:Ljava/lang/String;

    const-string v6, "Rule DB does not exists."

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method
