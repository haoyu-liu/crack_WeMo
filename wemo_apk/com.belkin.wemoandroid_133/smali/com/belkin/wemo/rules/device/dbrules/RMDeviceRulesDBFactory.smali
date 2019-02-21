.class public final enum Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFactory;
.super Ljava/lang/Enum;
.source "RMDeviceRulesDBFactory.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFactory;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFactory;

.field public static final enum INSTANCE:Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFactory;

.field public static final TAG:Ljava/lang/String;

.field private static fetchSupportInstance:Lcom/belkin/wemo/rules/device/RMIDeviceRules;

.field private static noFetchSupportInstance:Lcom/belkin/wemo/rules/device/RMIDeviceRules;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 55
    new-instance v0, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFactory;

    const-string v1, "INSTANCE"

    invoke-direct {v0, v1, v2}, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFactory;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFactory;->INSTANCE:Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFactory;

    .line 53
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFactory;

    sget-object v1, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFactory;->INSTANCE:Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFactory;

    aput-object v1, v0, v2

    sput-object v0, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFactory;->$VALUES:[Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFactory;

    .line 60
    const-class v0, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFactory;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFactory;->TAG:Ljava/lang/String;

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
    .line 62
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 64
    return-void
.end method

.method private getDeviceRulesInstanceNoFetchAPISupport(Lcom/belkin/wemo/rules/util/RMIRulesUtils;)Lcom/belkin/wemo/rules/device/RMIDeviceRules;
    .locals 1
    .param p1, "rulesUtils"    # Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    .prologue
    .line 100
    sget-object v0, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFactory;->noFetchSupportInstance:Lcom/belkin/wemo/rules/device/RMIDeviceRules;

    if-nez v0, :cond_0

    .line 101
    new-instance v0, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBNoFetchSupportImpl;

    invoke-direct {v0, p1}, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBNoFetchSupportImpl;-><init>(Lcom/belkin/wemo/rules/util/RMIRulesUtils;)V

    sput-object v0, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFactory;->noFetchSupportInstance:Lcom/belkin/wemo/rules/device/RMIDeviceRules;

    .line 103
    :cond_0
    sget-object v0, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFactory;->noFetchSupportInstance:Lcom/belkin/wemo/rules/device/RMIDeviceRules;

    return-object v0
.end method

.method private getDeviceRulesInstanceWithFetchAPISupport(Lcom/belkin/wemo/rules/util/RMIRulesUtils;)Lcom/belkin/wemo/rules/device/RMIDeviceRules;
    .locals 1
    .param p1, "rulesUtils"    # Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    .prologue
    .line 93
    sget-object v0, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFactory;->fetchSupportInstance:Lcom/belkin/wemo/rules/device/RMIDeviceRules;

    if-nez v0, :cond_0

    .line 94
    new-instance v0, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFetchSupportImpl;

    invoke-direct {v0, p1}, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFetchSupportImpl;-><init>(Lcom/belkin/wemo/rules/util/RMIRulesUtils;)V

    sput-object v0, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFactory;->fetchSupportInstance:Lcom/belkin/wemo/rules/device/RMIDeviceRules;

    .line 96
    :cond_0
    sget-object v0, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFactory;->fetchSupportInstance:Lcom/belkin/wemo/rules/device/RMIDeviceRules;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFactory;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 53
    const-class v0, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFactory;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFactory;

    return-object v0
.end method

.method public static values()[Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFactory;
    .locals 1

    .prologue
    .line 53
    sget-object v0, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFactory;->$VALUES:[Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFactory;

    invoke-virtual {v0}, [Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFactory;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFactory;

    return-object v0
.end method


# virtual methods
.method public getDeviceRulesInstance(Lcom/belkin/wemo/cache/data/DeviceInformation;)Lcom/belkin/wemo/rules/device/RMIDeviceRules;
    .locals 4
    .param p1, "device"    # Lcom/belkin/wemo/cache/data/DeviceInformation;

    .prologue
    .line 74
    const/4 v0, 0x0

    .line 76
    .local v0, "deviceRulesIns":Lcom/belkin/wemo/rules/device/RMIDeviceRules;
    if-eqz p1, :cond_0

    .line 77
    invoke-static {}, Lcom/belkin/wemo/rules/RMRulesSDK;->instance()Lcom/belkin/wemo/rules/RMRulesSDK;

    move-result-object v2

    .line 78
    .local v2, "sdk":Lcom/belkin/wemo/rules/RMRulesSDK;
    if-eqz v2, :cond_0

    .line 79
    invoke-virtual {v2}, Lcom/belkin/wemo/rules/RMRulesSDK;->getDependencyProvider()Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;

    move-result-object v3

    invoke-interface {v3}, Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;->provideIRulesUtils()Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    move-result-object v1

    .line 80
    .local v1, "rulesUtils":Lcom/belkin/wemo/rules/util/RMIRulesUtils;
    invoke-interface {v1, p1}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->isFetchStoreRulesSupportedInDevice(Lcom/belkin/wemo/cache/data/DeviceInformation;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 81
    invoke-direct {p0, v1}, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFactory;->getDeviceRulesInstanceWithFetchAPISupport(Lcom/belkin/wemo/rules/util/RMIRulesUtils;)Lcom/belkin/wemo/rules/device/RMIDeviceRules;

    move-result-object v0

    .line 85
    :goto_0
    const/4 v1, 0x0

    .line 89
    .end local v1    # "rulesUtils":Lcom/belkin/wemo/rules/util/RMIRulesUtils;
    .end local v2    # "sdk":Lcom/belkin/wemo/rules/RMRulesSDK;
    :cond_0
    return-object v0

    .line 83
    .restart local v1    # "rulesUtils":Lcom/belkin/wemo/rules/util/RMIRulesUtils;
    .restart local v2    # "sdk":Lcom/belkin/wemo/rules/RMRulesSDK;
    :cond_1
    invoke-direct {p0, v1}, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFactory;->getDeviceRulesInstanceNoFetchAPISupport(Lcom/belkin/wemo/rules/util/RMIRulesUtils;)Lcom/belkin/wemo/rules/device/RMIDeviceRules;

    move-result-object v0

    goto :goto_0
.end method
