.class Lcom/belkin/wemo/cache/devicelist/DeviceListManager$16;
.super Ljava/lang/Object;
.source "DeviceListManager.java"

# interfaces
.implements Lcom/belkin/wemo/controlaction/callback/ControlActionErrorCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->configureHushMode(Ljava/lang/String;Ljava/lang/String;Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeSuccessCallback;Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeErrorCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field final synthetic val$errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeErrorCallback;


# direct methods
.method constructor <init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeErrorCallback;)V
    .locals 0

    .prologue
    .line 1816
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$16;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iput-object p2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$16;->val$errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeErrorCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onActionError(Ljava/lang/Exception;)V
    .locals 2
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 1819
    const-string v0, "DeviceListManager"

    const-string v1, "configureHushMode: Exception during PostControlAction: "

    invoke-static {v0, v1, p1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 1820
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$16;->val$errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeErrorCallback;

    if-eqz v0, :cond_0

    .line 1821
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$16;->val$errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeErrorCallback;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeErrorCallback;->onConfigureHushModeFailed(Ljava/lang/String;)V

    .line 1823
    :cond_0
    return-void
.end method
