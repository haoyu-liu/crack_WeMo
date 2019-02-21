.class public Lcom/belkin/wemo/cache/cloud/RMCloudRequestStoreRules$PluginStoreRulesData;
.super Ljava/lang/Object;
.source "RMCloudRequestStoreRules.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/cache/cloud/RMCloudRequestStoreRules;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PluginStoreRulesData"
.end annotation


# instance fields
.field private mac:Ljava/lang/String;

.field private pluginId:Ljava/lang/String;

.field private processDB:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "pluginId"    # Ljava/lang/String;
    .param p2, "mac"    # Ljava/lang/String;
    .param p3, "processDB"    # Ljava/lang/String;

    .prologue
    .line 123
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 124
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestStoreRules$PluginStoreRulesData;->pluginId:Ljava/lang/String;

    .line 125
    iput-object p2, p0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestStoreRules$PluginStoreRulesData;->mac:Ljava/lang/String;

    .line 126
    iput-object p3, p0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestStoreRules$PluginStoreRulesData;->processDB:Ljava/lang/String;

    .line 127
    return-void
.end method


# virtual methods
.method public getMac()Ljava/lang/String;
    .locals 1

    .prologue
    .line 145
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestStoreRules$PluginStoreRulesData;->mac:Ljava/lang/String;

    return-object v0
.end method

.method public getPluginId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 133
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestStoreRules$PluginStoreRulesData;->pluginId:Ljava/lang/String;

    return-object v0
.end method

.method public getProcessDB()Ljava/lang/String;
    .locals 1

    .prologue
    .line 158
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestStoreRules$PluginStoreRulesData;->processDB:Ljava/lang/String;

    return-object v0
.end method

.method public setMac(Ljava/lang/String;)V
    .locals 0
    .param p1, "mac"    # Ljava/lang/String;

    .prologue
    .line 151
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestStoreRules$PluginStoreRulesData;->mac:Ljava/lang/String;

    .line 152
    return-void
.end method

.method public setPluginId(Ljava/lang/String;)V
    .locals 0
    .param p1, "pluginId"    # Ljava/lang/String;

    .prologue
    .line 139
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestStoreRules$PluginStoreRulesData;->pluginId:Ljava/lang/String;

    .line 140
    return-void
.end method

.method public setProcessDB(Ljava/lang/String;)V
    .locals 0
    .param p1, "processDB"    # Ljava/lang/String;

    .prologue
    .line 165
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestStoreRules$PluginStoreRulesData;->processDB:Ljava/lang/String;

    .line 166
    return-void
.end method
