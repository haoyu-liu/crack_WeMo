.class public Lcom/belkin/wemo/rules/device/impl/DeviceRulesFactory;
.super Ljava/lang/Object;
.source "DeviceRulesFactory.java"


# static fields
.field public static final TAG:Ljava/lang/String; = "DeviceRulesFactory"

.field private static fetchSupportInstance:Lcom/belkin/wemo/rules/device/IDeviceRules;

.field private static noFetchSupportInstance:Lcom/belkin/wemo/rules/device/IDeviceRules;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    return-void
.end method

.method public static declared-synchronized destroy()V
    .locals 2

    .prologue
    .line 90
    const-class v1, Lcom/belkin/wemo/rules/device/impl/DeviceRulesFactory;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/belkin/wemo/rules/device/impl/DeviceRulesFactory;->fetchSupportInstance:Lcom/belkin/wemo/rules/device/IDeviceRules;

    if-eqz v0, :cond_0

    .line 91
    const/4 v0, 0x0

    sput-object v0, Lcom/belkin/wemo/rules/device/impl/DeviceRulesFactory;->fetchSupportInstance:Lcom/belkin/wemo/rules/device/IDeviceRules;

    .line 93
    :cond_0
    sget-object v0, Lcom/belkin/wemo/rules/device/impl/DeviceRulesFactory;->noFetchSupportInstance:Lcom/belkin/wemo/rules/device/IDeviceRules;

    if-eqz v0, :cond_1

    .line 94
    const/4 v0, 0x0

    sput-object v0, Lcom/belkin/wemo/rules/device/impl/DeviceRulesFactory;->noFetchSupportInstance:Lcom/belkin/wemo/rules/device/IDeviceRules;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 96
    :cond_1
    monitor-exit v1

    return-void

    .line 90
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private getDeviceRulesInstanceNoFetchAPISupport()Lcom/belkin/wemo/rules/device/IDeviceRules;
    .locals 1

    .prologue
    .line 106
    sget-object v0, Lcom/belkin/wemo/rules/device/impl/DeviceRulesFactory;->noFetchSupportInstance:Lcom/belkin/wemo/rules/device/IDeviceRules;

    if-nez v0, :cond_0

    .line 107
    new-instance v0, Lcom/belkin/wemo/rules/device/impl/DeviceRulesNoFetchStoreAPIImpl;

    invoke-direct {v0}, Lcom/belkin/wemo/rules/device/impl/DeviceRulesNoFetchStoreAPIImpl;-><init>()V

    sput-object v0, Lcom/belkin/wemo/rules/device/impl/DeviceRulesFactory;->noFetchSupportInstance:Lcom/belkin/wemo/rules/device/IDeviceRules;

    .line 109
    :cond_0
    sget-object v0, Lcom/belkin/wemo/rules/device/impl/DeviceRulesFactory;->noFetchSupportInstance:Lcom/belkin/wemo/rules/device/IDeviceRules;

    return-object v0
.end method

.method private getDeviceRulesInstanceWithFetchAPISupport()Lcom/belkin/wemo/rules/device/IDeviceRules;
    .locals 1

    .prologue
    .line 99
    sget-object v0, Lcom/belkin/wemo/rules/device/impl/DeviceRulesFactory;->fetchSupportInstance:Lcom/belkin/wemo/rules/device/IDeviceRules;

    if-nez v0, :cond_0

    .line 100
    new-instance v0, Lcom/belkin/wemo/rules/device/impl/DeviceRulesWithStoreFetchImpl;

    invoke-direct {v0}, Lcom/belkin/wemo/rules/device/impl/DeviceRulesWithStoreFetchImpl;-><init>()V

    sput-object v0, Lcom/belkin/wemo/rules/device/impl/DeviceRulesFactory;->fetchSupportInstance:Lcom/belkin/wemo/rules/device/IDeviceRules;

    .line 102
    :cond_0
    sget-object v0, Lcom/belkin/wemo/rules/device/impl/DeviceRulesFactory;->fetchSupportInstance:Lcom/belkin/wemo/rules/device/IDeviceRules;

    return-object v0
.end method


# virtual methods
.method public getDeviceRulesInstance(Lorg/cybergarage/upnp/Device;)Lcom/belkin/wemo/rules/device/IDeviceRules;
    .locals 6
    .param p1, "device"    # Lorg/cybergarage/upnp/Device;

    .prologue
    .line 71
    const-string v1, "DeviceRulesFactory"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Time: Device Rules Factory: Runtime IN : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    const/4 v0, 0x0

    .line 75
    .local v0, "deviceRulesIns":Lcom/belkin/wemo/rules/device/IDeviceRules;
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/belkin/wemo/utils/WeMoUtils;->isSmartDevice(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 76
    invoke-static {p1}, Lcom/belkin/wemo/utils/WeMoUtils;->areFetchStoreAPIsSupportedInLocal(Lorg/cybergarage/upnp/Device;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 77
    invoke-direct {p0}, Lcom/belkin/wemo/rules/device/impl/DeviceRulesFactory;->getDeviceRulesInstanceWithFetchAPISupport()Lcom/belkin/wemo/rules/device/IDeviceRules;

    move-result-object v0

    .line 82
    :cond_0
    :goto_0
    const-string v1, "DeviceRulesFactory"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Time: Device Rules Factory: Runtime OUT: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    return-object v0

    .line 79
    :cond_1
    invoke-direct {p0}, Lcom/belkin/wemo/rules/device/impl/DeviceRulesFactory;->getDeviceRulesInstanceNoFetchAPISupport()Lcom/belkin/wemo/rules/device/IDeviceRules;

    move-result-object v0

    goto :goto_0
.end method
