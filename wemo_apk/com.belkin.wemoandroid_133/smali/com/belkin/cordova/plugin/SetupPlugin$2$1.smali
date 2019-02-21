.class Lcom/belkin/cordova/plugin/SetupPlugin$2$1;
.super Ljava/lang/Object;
.source "SetupPlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/cordova/plugin/SetupPlugin$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/belkin/cordova/plugin/SetupPlugin$2;


# direct methods
.method constructor <init>(Lcom/belkin/cordova/plugin/SetupPlugin$2;)V
    .locals 0

    .prologue
    .line 146
    iput-object p1, p0, Lcom/belkin/cordova/plugin/SetupPlugin$2$1;->this$1:Lcom/belkin/cordova/plugin/SetupPlugin$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 150
    const-wide/16 v2, 0x3a98

    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 154
    :goto_0
    const/4 v1, 0x0

    invoke-static {v1}, Lcom/belkin/wemo/storage/FileStorage;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/storage/FileStorage;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/belkin/wemo/storage/FileStorage;->setReload(Z)V

    .line 155
    return-void

    .line 151
    :catch_0
    move-exception v0

    .line 152
    .local v0, "e":Ljava/lang/InterruptedException;
    const-string v1, "SetupPlugin"

    const-string v2, "Exception during ACTION_SETUP_DEVICE_DETAILS :: setReload"

    invoke-static {v1, v2, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
