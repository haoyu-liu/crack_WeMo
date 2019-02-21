.class public abstract Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarData;
.super Ljava/lang/Object;
.source "RMPluginWeeklyCalendarData.java"


# instance fields
.field protected mac:Ljava/lang/String;

.field protected pluginId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "pluginId"    # Ljava/lang/String;
    .param p2, "mac"    # Ljava/lang/String;

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarData;->pluginId:Ljava/lang/String;

    .line 11
    iput-object p2, p0, Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarData;->mac:Ljava/lang/String;

    .line 12
    return-void
.end method


# virtual methods
.method public abstract assembleWeeklyCalendarData()Ljava/lang/String;
.end method

.method public getMac()Ljava/lang/String;
    .locals 1

    .prologue
    .line 34
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarData;->mac:Ljava/lang/String;

    return-object v0
.end method

.method public getPluginId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 20
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarData;->pluginId:Ljava/lang/String;

    return-object v0
.end method

.method public setMac(Ljava/lang/String;)V
    .locals 0
    .param p1, "mac"    # Ljava/lang/String;

    .prologue
    .line 41
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarData;->mac:Ljava/lang/String;

    .line 42
    return-void
.end method

.method public setPluginId(Ljava/lang/String;)V
    .locals 0
    .param p1, "pluginId"    # Ljava/lang/String;

    .prologue
    .line 27
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarData;->pluginId:Ljava/lang/String;

    .line 28
    return-void
.end method
