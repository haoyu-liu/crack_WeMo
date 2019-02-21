.class public Lcom/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesStoreSupportLocal;
.super Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesStoreSupportLocal;
.source "RMStoreDevRulesStoreSupportLocal.java"


# static fields
.field public static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 17
    const-class v0, Lcom/belkin/wemo/rules/util/RMRulesUtility;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesStoreSupportLocal;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lorg/cybergarage/upnp/Device;Lcom/belkin/wemo/rules/data/RMDBRule;Ljava/util/HashMap;Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;Lcom/belkin/wemo/rules/util/RMIRulesUtils;)V
    .locals 0
    .param p1, "device"    # Lorg/cybergarage/upnp/Device;
    .param p2, "rule"    # Lcom/belkin/wemo/rules/data/RMDBRule;
    .param p4, "successCallback"    # Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;
    .param p5, "errorCallback"    # Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;
    .param p6, "rulesUtils"    # Lcom/belkin/wemo/rules/util/RMIRulesUtils;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/cybergarage/upnp/Device;",
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
    .line 21
    .local p3, "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-direct/range {p0 .. p6}, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesStoreSupportLocal;-><init>(Lorg/cybergarage/upnp/Device;Lcom/belkin/wemo/rules/data/RMDBRule;Ljava/util/HashMap;Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;Lcom/belkin/wemo/rules/util/RMIRulesUtils;)V

    .line 22
    return-void
.end method


# virtual methods
.method protected getProcessDBValue(Lcom/belkin/wemo/rules/data/RMDBRule;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "rule"    # Lcom/belkin/wemo/rules/data/RMDBRule;
    .param p2, "deviceUdn"    # Ljava/lang/String;

    .prologue
    .line 26
    const-string v0, "0"

    .line 28
    .local v0, "processDB":Ljava/lang/String;
    sget-object v1, Lcom/belkin/wemo/rules/data/RMUserRules;->INSTANCE:Lcom/belkin/wemo/rules/data/RMUserRules;

    invoke-virtual {v1, p1, p2}, Lcom/belkin/wemo/rules/data/RMUserRules;->isProcessDBRequired(Lcom/belkin/wemo/rules/data/RMDBRule;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 29
    const-string v0, "1"

    .line 32
    :cond_0
    return-object v0
.end method
