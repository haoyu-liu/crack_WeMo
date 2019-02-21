.class public Lcom/belkin/wemo/rules/operation/runnable/RMStoreDBRulesNoStoreRemoteRunnable;
.super Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;
.source "RMStoreDBRulesNoStoreRemoteRunnable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/rules/operation/runnable/RMStoreDBRulesNoStoreRemoteRunnable$1;,
        Lcom/belkin/wemo/rules/operation/runnable/RMStoreDBRulesNoStoreRemoteRunnable$UpdateWeeklyCalendarResponse;
    }
.end annotation


# instance fields
.field private rule:Lcom/belkin/wemo/rules/data/RMDBRule;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteErrorCallback;Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteSuccessCallback;Ljava/util/List;Lcom/belkin/wemo/rules/data/RMDBRule;Ljava/util/HashMap;Lcom/belkin/wemo/rules/util/RMIRulesUtils;)V
    .locals 6
    .param p1, "errorCallback"    # Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteErrorCallback;
    .param p2, "succesCallback"    # Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteSuccessCallback;
    .param p4, "rule"    # Lcom/belkin/wemo/rules/data/RMDBRule;
    .param p6, "rulesUtils"    # Lcom/belkin/wemo/rules/util/RMIRulesUtils;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteErrorCallback;",
            "Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteSuccessCallback;",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;",
            "Lcom/belkin/wemo/rules/data/RMDBRule;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/belkin/wemo/rules/util/RMIRulesUtils;",
            ")V"
        }
    .end annotation

    .prologue
    .line 35
    .local p3, "devicesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    .local p5, "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p5

    move-object v5, p6

    invoke-direct/range {v0 .. v5}, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;-><init>(Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteErrorCallback;Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteSuccessCallback;Ljava/util/List;Ljava/util/HashMap;Lcom/belkin/wemo/rules/util/RMIRulesUtils;)V

    .line 36
    iput-object p4, p0, Lcom/belkin/wemo/rules/operation/runnable/RMStoreDBRulesNoStoreRemoteRunnable;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    .line 37
    return-void
.end method

.method static synthetic access$100(Lcom/belkin/wemo/rules/operation/runnable/RMStoreDBRulesNoStoreRemoteRunnable;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/operation/runnable/RMStoreDBRulesNoStoreRemoteRunnable;

    .prologue
    .line 27
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/runnable/RMStoreDBRulesNoStoreRemoteRunnable;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method private getPluginWeeklyCalendarLink(Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;)Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarData;
    .locals 5
    .param p1, "zigbeeDeviceId"    # Ljava/lang/String;
    .param p2, "deviceInfo"    # Lcom/belkin/wemo/cache/data/DeviceInformation;

    .prologue
    .line 93
    invoke-virtual {p2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, p1}, Lcom/belkin/wemo/rules/data/weeklycalendar/RMWeeklyCalendarGeneratorUtility;->getLinkWeeklyCalendarStringMap(Ljava/lang/String;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    .line 96
    .local v0, "calendarListMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v1, Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarLinkData;

    invoke-virtual {p2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getPluginID()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getMAC()Ljava/lang/String;

    move-result-object v4

    sget-object v2, Lcom/belkin/wemo/cache/utils/Constants;->TAG_CALENDAR_LIST:Ljava/lang/String;

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-direct {v1, v3, v4, v2}, Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarLinkData;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    .local v1, "data":Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarData;
    return-object v1
.end method

.method private getPluginWeeklyCalendarNonLink(Lcom/belkin/wemo/cache/data/DeviceInformation;)Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarData;
    .locals 11
    .param p1, "deviceInfo"    # Lcom/belkin/wemo/cache/data/DeviceInformation;

    .prologue
    .line 77
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/belkin/wemo/rules/data/weeklycalendar/RMWeeklyCalendarGeneratorUtility;->getWeeklyCalendarStringMap(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v10

    .line 79
    .local v10, "dayToCalendarMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v0, Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarNonLinkData;

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getPluginID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getMAC()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/belkin/wemo/rules/data/RMDBRule;->DAY_STR_MONDAY:Ljava/lang/String;

    invoke-interface {v10, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    sget-object v4, Lcom/belkin/wemo/rules/data/RMDBRule;->DAY_STR_TUESDAY:Ljava/lang/String;

    invoke-interface {v10, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    sget-object v5, Lcom/belkin/wemo/rules/data/RMDBRule;->DAY_STR_WEDNESDAY:Ljava/lang/String;

    invoke-interface {v10, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    sget-object v6, Lcom/belkin/wemo/rules/data/RMDBRule;->DAY_STR_THURSDAY:Ljava/lang/String;

    invoke-interface {v10, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    sget-object v7, Lcom/belkin/wemo/rules/data/RMDBRule;->DAY_STR_FRIDAY:Ljava/lang/String;

    invoke-interface {v10, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    sget-object v8, Lcom/belkin/wemo/rules/data/RMDBRule;->DAY_STR_SATURDAY:Ljava/lang/String;

    invoke-interface {v10, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    sget-object v9, Lcom/belkin/wemo/rules/data/RMDBRule;->DAY_STR_SUNDAY:Ljava/lang/String;

    invoke-interface {v10, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    invoke-direct/range {v0 .. v9}, Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarNonLinkData;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    .local v0, "data":Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarData;
    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 14

    .prologue
    .line 43
    iget-object v11, p0, Lcom/belkin/wemo/rules/operation/runnable/RMStoreDBRulesNoStoreRemoteRunnable;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    invoke-virtual {v11}, Lcom/belkin/wemo/rules/data/RMDBRule;->getRuleDeviceSet()Ljava/util/Set;

    move-result-object v8

    .line 44
    .local v8, "ruleDeviceSet":Ljava/util/Set;, "Ljava/util/Set<Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;>;"
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 46
    .local v6, "pluginWeeklyCalendarDataList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarData;>;"
    iget-object v11, p0, Lcom/belkin/wemo/rules/operation/runnable/RMStoreDBRulesNoStoreRemoteRunnable;->devicesList:Ljava/util/List;

    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 47
    .local v1, "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v2

    .line 48
    .local v2, "deviceUdn":Ljava/lang/String;
    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :cond_1
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;

    .line 49
    .local v7, "ruleDevice":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    invoke-virtual {v7}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->getUiUdn()Ljava/lang/String;

    move-result-object v9

    .line 50
    .local v9, "ruleDeviceUdn":Ljava/lang/String;
    iget-object v11, p0, Lcom/belkin/wemo/rules/operation/runnable/RMStoreDBRulesNoStoreRemoteRunnable;->TAG:Ljava/lang/String;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Store Rules (No Store): Is UpdateWeeklyCalendar required check. RuleDeviceUDN: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "; Current Device UDN: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    invoke-virtual {v9, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 52
    iget-object v11, p0, Lcom/belkin/wemo/rules/operation/runnable/RMStoreDBRulesNoStoreRemoteRunnable;->TAG:Ljava/lang/String;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Store Rules (No Store): MATCH FOUND. WEEKLY CALENDAR REQUIRED for UDN: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    const/4 v0, 0x0

    .line 54
    .local v0, "data":Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarData;
    const-string v11, "Bridge"

    invoke-virtual {v2, v11}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_1

    goto :goto_0

    .line 64
    .end local v0    # "data":Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarData;
    .end local v1    # "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v2    # "deviceUdn":Ljava/lang/String;
    .end local v4    # "i$":Ljava/util/Iterator;
    .end local v7    # "ruleDevice":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    .end local v9    # "ruleDeviceUdn":Ljava/lang/String;
    :cond_2
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v11

    if-lez v11, :cond_3

    .line 66
    new-instance v10, Lcom/belkin/wemo/cache/cloud/RMCloudRequestUpdateWeeklyCalendar;

    new-instance v11, Lcom/belkin/wemo/rules/operation/runnable/RMStoreDBRulesNoStoreRemoteRunnable$UpdateWeeklyCalendarResponse;

    const/4 v12, 0x0

    invoke-direct {v11, p0, v12}, Lcom/belkin/wemo/rules/operation/runnable/RMStoreDBRulesNoStoreRemoteRunnable$UpdateWeeklyCalendarResponse;-><init>(Lcom/belkin/wemo/rules/operation/runnable/RMStoreDBRulesNoStoreRemoteRunnable;Lcom/belkin/wemo/rules/operation/runnable/RMStoreDBRulesNoStoreRemoteRunnable$1;)V

    invoke-direct {v10, v6, v11}, Lcom/belkin/wemo/cache/cloud/RMCloudRequestUpdateWeeklyCalendar;-><init>(Ljava/util/List;Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;)V

    .line 67
    .local v10, "updateWeeklyCalendarRequest":Lcom/belkin/wemo/cache/cloud/RMCloudRequestUpdateWeeklyCalendar;
    iget-object v11, p0, Lcom/belkin/wemo/rules/operation/runnable/RMStoreDBRulesNoStoreRemoteRunnable;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    invoke-interface {v11}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->getCloudRequestManager()Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    move-result-object v5

    .line 68
    .local v5, "manager":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    invoke-virtual {v5, v10}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    .line 73
    .end local v5    # "manager":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    .end local v10    # "updateWeeklyCalendarRequest":Lcom/belkin/wemo/cache/cloud/RMCloudRequestUpdateWeeklyCalendar;
    :goto_1
    return-void

    .line 71
    :cond_3
    invoke-virtual {p0}, Lcom/belkin/wemo/rules/operation/runnable/RMStoreDBRulesNoStoreRemoteRunnable;->sendDBFileToCloud()V

    goto :goto_1
.end method
