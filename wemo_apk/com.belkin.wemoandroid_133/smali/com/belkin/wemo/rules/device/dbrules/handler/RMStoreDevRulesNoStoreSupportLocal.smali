.class public Lcom/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesNoStoreSupportLocal;
.super Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal;
.source "RMStoreDevRulesNoStoreSupportLocal.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesNoStoreSupportLocal$WeeklyCalendarActionCallback;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private deviceUdn:Ljava/lang/String;

.field private rule:Lcom/belkin/wemo/rules/data/RMDBRule;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 30
    const-class v0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesNoStoreSupportLocal;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesNoStoreSupportLocal;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/belkin/wemo/cache/data/DeviceInformation;Lcom/belkin/wemo/rules/data/RMDBRule;Ljava/util/HashMap;Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;Lcom/belkin/wemo/rules/util/RMIRulesUtils;)V
    .locals 6
    .param p1, "device"    # Lcom/belkin/wemo/cache/data/DeviceInformation;
    .param p2, "rule"    # Lcom/belkin/wemo/rules/data/RMDBRule;
    .param p4, "successCallback"    # Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;
    .param p5, "errorCallback"    # Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;
    .param p6, "rulesUtils"    # Lcom/belkin/wemo/rules/util/RMIRulesUtils;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            "Lcom/belkin/wemo/rules/data/RMDBRule;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;",
            "Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;",
            "Lcom/belkin/wemo/rules/util/RMIRulesUtils;",
            ")V"
        }
    .end annotation

    .prologue
    .line 35
    .local p3, "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    move-object v0, p0

    move-object v1, p1

    move-object v2, p3

    move-object v3, p4

    move-object v4, p5

    move-object v5, p6

    invoke-direct/range {v0 .. v5}, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal;-><init>(Lcom/belkin/wemo/cache/data/DeviceInformation;Ljava/util/HashMap;Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;Lcom/belkin/wemo/rules/util/RMIRulesUtils;)V

    .line 40
    iput-object p2, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesNoStoreSupportLocal;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    .line 41
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesNoStoreSupportLocal;->deviceUdn:Ljava/lang/String;

    .line 42
    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .prologue
    .line 25
    sget-object v0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesNoStoreSupportLocal;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method private postWeeklyCalendarAction(Lorg/cybergarage/upnp/Action;Ljava/util/Map;)V
    .locals 7
    .param p1, "action"    # Lorg/cybergarage/upnp/Action;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/cybergarage/upnp/Action;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 69
    .local p2, "argumentsHashMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v4, Lcom/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesNoStoreSupportLocal$WeeklyCalendarActionCallback;

    iget-object v0, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesNoStoreSupportLocal;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v4, p0, v0}, Lcom/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesNoStoreSupportLocal$WeeklyCalendarActionCallback;-><init>(Lcom/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesNoStoreSupportLocal;Ljava/lang/String;)V

    .line 71
    .local v4, "callback":Lcom/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesNoStoreSupportLocal$WeeklyCalendarActionCallback;
    invoke-static {}, Lcom/belkin/wemo/controlaction/ControlActionHandler;->newInstance()Lcom/belkin/wemo/controlaction/ControlActionHandler;

    move-result-object v0

    const/16 v2, 0x3a98

    const/16 v3, 0xfa0

    move-object v1, p1

    move-object v5, v4

    move-object v6, p2

    invoke-virtual/range {v0 .. v6}, Lcom/belkin/wemo/controlaction/ControlActionHandler;->postControlAction(Lorg/cybergarage/upnp/Action;IILcom/belkin/wemo/controlaction/callback/ControlActionErrorCallback;Lcom/belkin/wemo/controlaction/callback/ControlActionSuccessCallback;Ljava/util/Map;)V

    .line 77
    return-void
.end method


# virtual methods
.method public process()V
    .locals 6

    .prologue
    .line 48
    sget-object v3, Lcom/belkin/wemo/rules/data/RMUserRules;->INSTANCE:Lcom/belkin/wemo/rules/data/RMUserRules;

    iget-object v4, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesNoStoreSupportLocal;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    iget-object v5, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesNoStoreSupportLocal;->deviceUdn:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Lcom/belkin/wemo/rules/data/RMUserRules;->isProcessDBRequired(Lcom/belkin/wemo/rules/data/RMDBRule;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 49
    iget-object v3, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesNoStoreSupportLocal;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v3

    const-string v4, "UpdateWeeklyCalendar"

    invoke-virtual {v3, v4}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 50
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    iget-object v3, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesNoStoreSupportLocal;->deviceUdn:Ljava/lang/String;

    const-string v4, "Bridge"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 52
    iget-object v3, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesNoStoreSupportLocal;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    invoke-virtual {v3}, Lcom/belkin/wemo/rules/data/RMDBRule;->getRuleDeviceSet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;

    .line 54
    .local v2, "ruleDevice":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-class v4, Lcom/belkin/wemo/rules/data/device/RMLed;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_0

    .line 60
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "ruleDevice":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    :cond_1
    iget-object v3, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesNoStoreSupportLocal;->deviceUdn:Ljava/lang/String;

    invoke-static {v3}, Lcom/belkin/wemo/rules/data/weeklycalendar/RMWeeklyCalendarGeneratorUtility;->getWeeklyCalendarStringMap(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v3

    invoke-direct {p0, v0, v3}, Lcom/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesNoStoreSupportLocal;->postWeeklyCalendarAction(Lorg/cybergarage/upnp/Action;Ljava/util/Map;)V

    .line 66
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    :cond_2
    :goto_1
    return-void

    .line 64
    :cond_3
    iget-object v3, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesNoStoreSupportLocal;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesNoStoreSupportLocal;->writeDBFileToDevice(Ljava/lang/String;)V

    goto :goto_1
.end method
