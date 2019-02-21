.class public Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;
.super Ljava/lang/Object;
.source "RMStoreDBRulesLocalHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$1;,
        Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$NonRuleDevicesStoreRulesCallback;,
        Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$RuleDevicesStoreDeviceRulesCallback;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private errorCallback:Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback;

.field private nonRuleDeviceList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;"
        }
    .end annotation
.end field

.field private params:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private rule:Lcom/belkin/wemo/rules/data/RMDBRule;

.field private ruleDeviceList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;"
        }
    .end annotation
.end field

.field private successCallback:Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeSuccessCallback;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 21
    const-class v0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback;Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeSuccessCallback;Lcom/belkin/wemo/rules/data/RMDBRule;Ljava/util/HashMap;)V
    .locals 1
    .param p1, "errorCallback"    # Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback;
    .param p2, "successCallback"    # Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeSuccessCallback;
    .param p3, "rule"    # Lcom/belkin/wemo/rules/data/RMDBRule;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback;",
            "Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeSuccessCallback;",
            "Lcom/belkin/wemo/rules/data/RMDBRule;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 34
    .local p4, "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-object p1, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;->errorCallback:Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback;

    .line 36
    iput-object p2, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;->successCallback:Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeSuccessCallback;

    .line 37
    iput-object p3, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    .line 38
    iput-object p4, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;->params:Ljava/util/HashMap;

    .line 40
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;->ruleDeviceList:Ljava/util/List;

    .line 41
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;->nonRuleDeviceList:Ljava/util/List;

    .line 42
    return-void
.end method

.method static synthetic access$100()Ljava/lang/String;
    .locals 1

    .prologue
    .line 19
    sget-object v0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;)Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;

    .prologue
    .line 19
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;->errorCallback:Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback;

    return-object v0
.end method

.method static synthetic access$300(Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;

    .prologue
    .line 19
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;->nonRuleDeviceList:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$400(Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;)Lcom/belkin/wemo/rules/data/RMDBRule;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;

    .prologue
    .line 19
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    return-object v0
.end method

.method static synthetic access$500(Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;)Ljava/util/HashMap;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;

    .prologue
    .line 19
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;->params:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$600(Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;)Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeSuccessCallback;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;

    .prologue
    .line 19
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;->successCallback:Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeSuccessCallback;

    return-object v0
.end method

.method private extractRuleAndNonRuleDeviceList(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 90
    .local p1, "deviceList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 91
    .local v0, "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;->isRuleDevice(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 92
    iget-object v2, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;->ruleDeviceList:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 94
    :cond_0
    iget-object v2, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;->nonRuleDeviceList:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 97
    .end local v0    # "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_1
    sget-object v2, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "STORE RULES: Online Rule Devices Count: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;->ruleDeviceList:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "; NON Rule devices count: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;->nonRuleDeviceList:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "; Total Rule Devices Count: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    invoke-virtual {v4}, Lcom/belkin/wemo/rules/data/RMDBRule;->getRuleDeviceSet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    return-void
.end method

.method private isRuleDevice(Ljava/lang/String;)Z
    .locals 6
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 101
    const/4 v1, 0x0

    .line 102
    .local v1, "isRuleDev":Z
    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    invoke-virtual {v3}, Lcom/belkin/wemo/rules/data/RMDBRule;->getRuleDeviceSet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;

    .line 103
    .local v2, "ruleDevice":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    invoke-virtual {v2}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->getUiUdn()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 104
    const/4 v1, 0x1

    goto :goto_0

    .line 107
    .end local v2    # "ruleDevice":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    :cond_1
    sget-object v3, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Store Rules - UDN: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "; Is RULE DEVICE: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 108
    return v1
.end method


# virtual methods
.method public process(Ljava/util/List;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "deviceList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    const/4 v1, 0x0

    .line 46
    invoke-direct {p0, p1}, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;->extractRuleAndNonRuleDeviceList(Ljava/util/List;)V

    .line 52
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    iget-boolean v0, v0, Lcom/belkin/wemo/rules/data/RMDBRule;->isDelete:Z

    if-nez v0, :cond_2

    .line 53
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;->ruleDeviceList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 55
    new-instance v4, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$RuleDevicesStoreDeviceRulesCallback;

    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;->ruleDeviceList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    invoke-direct {v4, p0, v0, v1}, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$RuleDevicesStoreDeviceRulesCallback;-><init>(Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;ILcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$1;)V

    .line 56
    .local v4, "callback":Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$RuleDevicesStoreDeviceRulesCallback;
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;->ruleDeviceList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 57
    .local v2, "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v7

    new-instance v0, Lcom/belkin/wemo/rules/operation/runnable/RMStoreDevDBRulesLocalRunnable;

    iget-object v1, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;->params:Ljava/util/HashMap;

    move-object v5, v4

    invoke-direct/range {v0 .. v5}, Lcom/belkin/wemo/rules/operation/runnable/RMStoreDevDBRulesLocalRunnable;-><init>(Lcom/belkin/wemo/rules/data/RMDBRule;Lcom/belkin/wemo/cache/data/DeviceInformation;Ljava/util/HashMap;Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;)V

    invoke-virtual {v7, v0}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    goto :goto_0

    .line 67
    .end local v2    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v4    # "callback":Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$RuleDevicesStoreDeviceRulesCallback;
    .end local v6    # "i$":Ljava/util/Iterator;
    :cond_0
    sget-object v0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;->TAG:Ljava/lang/String;

    const-string v1, "NO Rule Device is ONLINE. Thus rule cannot be saved."

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;->errorCallback:Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback;

    if-eqz v0, :cond_1

    .line 69
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;->errorCallback:Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback;

    const/4 v1, 0x2

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0, v1, v3}, Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback;->onSingleTypeStoreFailed(ILjava/util/List;)V

    .line 87
    :cond_1
    return-void

    .line 75
    :cond_2
    new-instance v4, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$RuleDevicesStoreDeviceRulesCallback;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    invoke-direct {v4, p0, v0, v1}, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$RuleDevicesStoreDeviceRulesCallback;-><init>(Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;ILcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$1;)V

    .line 76
    .restart local v4    # "callback":Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler$RuleDevicesStoreDeviceRulesCallback;
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .restart local v6    # "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 77
    .restart local v2    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v7

    new-instance v0, Lcom/belkin/wemo/rules/operation/runnable/RMStoreDevDBRulesLocalRunnable;

    iget-object v1, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;->params:Ljava/util/HashMap;

    move-object v5, v4

    invoke-direct/range {v0 .. v5}, Lcom/belkin/wemo/rules/operation/runnable/RMStoreDevDBRulesLocalRunnable;-><init>(Lcom/belkin/wemo/rules/data/RMDBRule;Lcom/belkin/wemo/cache/data/DeviceInformation;Ljava/util/HashMap;Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;)V

    invoke-virtual {v7, v0}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    .line 83
    sget-object v0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;->TAG:Ljava/lang/String;

    const-string v1, "Rule Deleted"

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method
