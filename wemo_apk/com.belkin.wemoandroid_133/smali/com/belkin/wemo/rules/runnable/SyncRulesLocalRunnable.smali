.class public Lcom/belkin/wemo/rules/runnable/SyncRulesLocalRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "SyncRulesLocalRunnable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/rules/runnable/SyncRulesLocalRunnable$DeviceSyncProcessingRunnable;
    }
.end annotation


# static fields
.field public static final TAG:Ljava/lang/String; = "SyncRulesLocalRunnable"

.field private static lock:Ljava/lang/Object;


# instance fields
.field private context:Landroid/content/Context;

.field private dbVersionToSend:I

.field private devicesToBeSyncedUDNsList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private localZippedDBFilePath:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 76
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/belkin/wemo/rules/runnable/SyncRulesLocalRunnable;->lock:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/util/ArrayList;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p3, "dbVersionToSend"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 85
    .local p2, "devicesToBeSyncedUDNsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 72
    const/4 v0, -0x1

    iput v0, p0, Lcom/belkin/wemo/rules/runnable/SyncRulesLocalRunnable;->dbVersionToSend:I

    .line 86
    iput-object p1, p0, Lcom/belkin/wemo/rules/runnable/SyncRulesLocalRunnable;->context:Landroid/content/Context;

    .line 87
    if-eqz p2, :cond_0

    .line 88
    iput-object p2, p0, Lcom/belkin/wemo/rules/runnable/SyncRulesLocalRunnable;->devicesToBeSyncedUDNsList:Ljava/util/ArrayList;

    .line 93
    :goto_0
    iput p3, p0, Lcom/belkin/wemo/rules/runnable/SyncRulesLocalRunnable;->dbVersionToSend:I

    .line 94
    return-void

    .line 90
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/rules/runnable/SyncRulesLocalRunnable;->devicesToBeSyncedUDNsList:Ljava/util/ArrayList;

    goto :goto_0
.end method

.method static synthetic access$000(Lcom/belkin/wemo/rules/runnable/SyncRulesLocalRunnable;)I
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/runnable/SyncRulesLocalRunnable;

    .prologue
    .line 63
    iget v0, p0, Lcom/belkin/wemo/rules/runnable/SyncRulesLocalRunnable;->dbVersionToSend:I

    return v0
.end method

.method static synthetic access$100(Lcom/belkin/wemo/rules/runnable/SyncRulesLocalRunnable;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/runnable/SyncRulesLocalRunnable;

    .prologue
    .line 63
    invoke-direct {p0}, Lcom/belkin/wemo/rules/runnable/SyncRulesLocalRunnable;->getLocalZippedDBFilePath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getLocalZippedDBFilePath()Ljava/lang/String;
    .locals 4

    .prologue
    .line 144
    sget-object v2, Lcom/belkin/wemo/rules/runnable/SyncRulesLocalRunnable;->lock:Ljava/lang/Object;

    monitor-enter v2

    .line 146
    :try_start_0
    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/SyncRulesLocalRunnable;->localZippedDBFilePath:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 148
    const-string v1, "SyncRulesLocalRunnable"

    const-string v3, "Sync Rules: local zipped file path string is null. Creating zipped file"

    invoke-static {v1, v3}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 151
    new-instance v0, Lcom/belkin/utils/RuleUtility;

    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/SyncRulesLocalRunnable;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/belkin/utils/RuleUtility;-><init>(Landroid/content/Context;)V

    .line 152
    .local v0, "ruleUtility":Lcom/belkin/utils/RuleUtility;
    iget v1, p0, Lcom/belkin/wemo/rules/runnable/SyncRulesLocalRunnable;->dbVersionToSend:I

    invoke-virtual {v0, v1}, Lcom/belkin/utils/RuleUtility;->getLocalZippedDBFilePath(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/rules/runnable/SyncRulesLocalRunnable;->localZippedDBFilePath:Ljava/lang/String;

    .line 159
    .end local v0    # "ruleUtility":Lcom/belkin/utils/RuleUtility;
    :goto_0
    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/SyncRulesLocalRunnable;->localZippedDBFilePath:Ljava/lang/String;

    monitor-exit v2

    return-object v1

    .line 156
    :cond_0
    const-string v1, "SyncRulesLocalRunnable"

    const-string v3, "Sync Rules: local zipped file path string is avialable for use."

    invoke-static {v1, v3}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 160
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    .line 102
    iget-object v4, p0, Lcom/belkin/wemo/rules/runnable/SyncRulesLocalRunnable;->context:Landroid/content/Context;

    if-eqz v4, :cond_1

    .line 103
    iget-object v4, p0, Lcom/belkin/wemo/rules/runnable/SyncRulesLocalRunnable;->context:Landroid/content/Context;

    invoke-static {v4}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    move-result-object v4

    invoke-virtual {v4}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->getUpnpControl()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/cybergarage/upnp/ControlPoint;

    .line 105
    .local v0, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    iget-object v4, p0, Lcom/belkin/wemo/rules/runnable/SyncRulesLocalRunnable;->devicesToBeSyncedUDNsList:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 106
    .local v2, "deviceToBeSyncedUDN":Ljava/lang/String;
    invoke-virtual {v0, v2}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v1

    .line 107
    .local v1, "device":Lorg/cybergarage/upnp/Device;
    if-eqz v1, :cond_0

    .line 108
    const-string v4, "SyncRulesLocalRunnable"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Sync Rules: device to be synced: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    new-instance v4, Lcom/belkin/wemo/rules/runnable/SyncRulesLocalRunnable$DeviceSyncProcessingRunnable;

    invoke-direct {v4, p0, v1}, Lcom/belkin/wemo/rules/runnable/SyncRulesLocalRunnable$DeviceSyncProcessingRunnable;-><init>(Lcom/belkin/wemo/rules/runnable/SyncRulesLocalRunnable;Lorg/cybergarage/upnp/Device;)V

    invoke-static {v4}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 113
    .end local v0    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .end local v1    # "device":Lorg/cybergarage/upnp/Device;
    .end local v2    # "deviceToBeSyncedUDN":Ljava/lang/String;
    .end local v3    # "i$":Ljava/util/Iterator;
    :cond_1
    return-void
.end method
