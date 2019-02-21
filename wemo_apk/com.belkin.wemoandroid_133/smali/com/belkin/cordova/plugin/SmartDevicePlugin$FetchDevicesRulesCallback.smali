.class Lcom/belkin/cordova/plugin/SmartDevicePlugin$FetchDevicesRulesCallback;
.super Ljava/lang/Object;
.source "SmartDevicePlugin.java"

# interfaces
.implements Lcom/belkin/wemo/rules/callback/FetchRulesErrorCallback;
.implements Lcom/belkin/wemo/rules/callback/FetchRulesSuccessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/cordova/plugin/SmartDevicePlugin;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FetchDevicesRulesCallback"
.end annotation


# instance fields
.field private nestUDN:Ljava/lang/String;

.field final synthetic this$0:Lcom/belkin/cordova/plugin/SmartDevicePlugin;


# direct methods
.method public constructor <init>(Lcom/belkin/cordova/plugin/SmartDevicePlugin;Ljava/lang/String;)V
    .locals 0
    .param p2, "udn"    # Ljava/lang/String;

    .prologue
    .line 992
    iput-object p1, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin$FetchDevicesRulesCallback;->this$0:Lcom/belkin/cordova/plugin/SmartDevicePlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 993
    iput-object p2, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin$FetchDevicesRulesCallback;->nestUDN:Ljava/lang/String;

    .line 994
    return-void
.end method

.method private doesRulesDBExist()Z
    .locals 3

    .prologue
    .line 1037
    new-instance v0, Ljava/io/File;

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getLocalDBPath()Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getLocalDBName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1038
    .local v0, "dbExists":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1039
    const/4 v1, 0x1

    .line 1041
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
    .line 1047
    .local p1, "ruleIdArrayForNestDevices":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v5, "SmartDevicePlugin"

    const-string v6, "Get Weekly Calendar"

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1049
    const/4 v3, 0x0

    .line 1051
    .local v3, "targetDeviceUdn":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :try_start_0
    sget-object v5, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->rMRulesDBManager:Lcom/belkin/rules/db/RMRulesDBManager;

    invoke-virtual {v5, p1}, Lcom/belkin/rules/db/RMRulesDBManager;->getTargetDeviceUDNForNestDevices(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    :try_end_0
    .catch Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 1057
    :goto_0
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 1059
    .local v4, "weeklyRecordsHashMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;[Ljava/lang/String;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v2, v5, :cond_0

    .line 1061
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1062
    .local v0, "UDN":Ljava/lang/String;
    const-string v5, "SmartDevicePlugin"

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

    .line 1063
    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/String;

    invoke-virtual {v4, v0, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1059
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 1052
    .end local v0    # "UDN":Ljava/lang/String;
    .end local v2    # "i":I
    .end local v4    # "weeklyRecordsHashMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;[Ljava/lang/String;>;"
    :catch_0
    move-exception v1

    .line 1053
    .local v1, "e":Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
    const-string v5, "SmartDevicePlugin"

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

    .line 1054
    invoke-virtual {v1}, Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;->printStackTrace()V

    goto :goto_0

    .line 1065
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
    .line 998
    const-string v0, "SmartDevicePlugin"

    const-string v1, "FetchDevicerulesCallback: error during fetchRules()."

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 999
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
    .line 1004
    .local p3, "outdatedDeviceUDNsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v5, "SmartDevicePlugin"

    const-string v6, "FetchDevicerulesCallback: on success during fetchRules()."

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1009
    invoke-direct {p0}, Lcom/belkin/cordova/plugin/SmartDevicePlugin$FetchDevicesRulesCallback;->doesRulesDBExist()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 1011
    iget-object v5, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin$FetchDevicesRulesCallback;->this$0:Lcom/belkin/cordova/plugin/SmartDevicePlugin;

    invoke-static {v5}, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->access$100(Lcom/belkin/cordova/plugin/SmartDevicePlugin;)Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lcom/belkin/rules/db/RMRulesDBManager;->getInstance(Landroid/content/Context;)Lcom/belkin/rules/db/RMRulesDBManager;

    move-result-object v5

    sput-object v5, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->rMRulesDBManager:Lcom/belkin/rules/db/RMRulesDBManager;

    .line 1013
    :try_start_0
    sget-object v5, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->rMRulesDBManager:Lcom/belkin/rules/db/RMRulesDBManager;

    iget-object v6, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin$FetchDevicesRulesCallback;->nestUDN:Ljava/lang/String;

    invoke-virtual {v5, v6}, Lcom/belkin/rules/db/RMRulesDBManager;->getRuleIdArrayForNestDevices(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v3

    .line 1014
    .local v3, "ruleIdArrayForNestDevices":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v5, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin$FetchDevicesRulesCallback;->this$0:Lcom/belkin/cordova/plugin/SmartDevicePlugin;

    invoke-direct {p0, v3}, Lcom/belkin/cordova/plugin/SmartDevicePlugin$FetchDevicesRulesCallback;->getWeeklyCalender(Ljava/util/ArrayList;)Ljava/util/HashMap;

    move-result-object v6

    iput-object v6, v5, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->weeklyRecordsHashMap:Ljava/util/HashMap;

    .line 1015
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v1, v5, :cond_0

    .line 1017
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 1018
    .local v2, "ruleId":Ljava/lang/String;
    const-string v5, "SmartDevicePlugin"

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

    .line 1019
    sget-object v5, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->rMRulesDBManager:Lcom/belkin/rules/db/RMRulesDBManager;

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Lcom/belkin/rules/db/RMRulesDBManager;->deleteRowRules(I)I

    .line 1020
    sget-object v5, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->rMRulesDBManager:Lcom/belkin/rules/db/RMRulesDBManager;

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Lcom/belkin/rules/db/RMRulesDBManager;->deleteRowRuleDevices(I)I

    .line 1015
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1024
    .end local v2    # "ruleId":Ljava/lang/String;
    :cond_0
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lez v5, :cond_1

    .line 1025
    new-instance v4, Lcom/belkin/cordova/plugin/SmartDevicePlugin$StoreDeviceRulesCallback;

    iget-object v5, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin$FetchDevicesRulesCallback;->this$0:Lcom/belkin/cordova/plugin/SmartDevicePlugin;

    invoke-direct {v4, v5}, Lcom/belkin/cordova/plugin/SmartDevicePlugin$StoreDeviceRulesCallback;-><init>(Lcom/belkin/cordova/plugin/SmartDevicePlugin;)V

    .line 1026
    .local v4, "storeDeviceRulesCallback":Lcom/belkin/cordova/plugin/SmartDevicePlugin$StoreDeviceRulesCallback;
    iget-object v5, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin$FetchDevicesRulesCallback;->this$0:Lcom/belkin/cordova/plugin/SmartDevicePlugin;

    invoke-static {v5}, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->access$100(Lcom/belkin/cordova/plugin/SmartDevicePlugin;)Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lcom/belkin/wemo/rules/impl/WeMoRulesFactory;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/rules/IWeMoRules;

    move-result-object v5

    iget-object v6, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin$FetchDevicesRulesCallback;->this$0:Lcom/belkin/cordova/plugin/SmartDevicePlugin;

    invoke-static {v6}, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->access$100(Lcom/belkin/cordova/plugin/SmartDevicePlugin;)Landroid/content/Context;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin$FetchDevicesRulesCallback;->this$0:Lcom/belkin/cordova/plugin/SmartDevicePlugin;

    iget-object v7, v7, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->weeklyRecordsHashMap:Ljava/util/HashMap;

    invoke-interface {v5, v6, v7, v4, v4}, Lcom/belkin/wemo/rules/IWeMoRules;->storeRules(Landroid/content/Context;Ljava/util/HashMap;Lcom/belkin/wemo/rules/callback/StoreRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/StoreRulesErrorCallback;)V
    :try_end_0
    .catch Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1034
    .end local v1    # "i":I
    .end local v3    # "ruleIdArrayForNestDevices":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v4    # "storeDeviceRulesCallback":Lcom/belkin/cordova/plugin/SmartDevicePlugin$StoreDeviceRulesCallback;
    :cond_1
    :goto_1
    return-void

    .line 1028
    :catch_0
    move-exception v0

    .line 1029
    .local v0, "e":Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
    const-string v5, "SmartDevicePlugin"

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

    goto :goto_1

    .line 1032
    .end local v0    # "e":Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
    :cond_2
    const-string v5, "SmartDevicePlugin"

    const-string v6, "Rule DB does not exists."

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method
