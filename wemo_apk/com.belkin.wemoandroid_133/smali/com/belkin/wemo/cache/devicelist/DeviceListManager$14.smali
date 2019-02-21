.class Lcom/belkin/wemo/cache/devicelist/DeviceListManager$14;
.super Ljava/lang/Object;
.source "DeviceListManager.java"

# interfaces
.implements Lcom/belkin/wemo/controlaction/callback/ControlActionErrorCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setNightModeConfiguration(Ljava/lang/String;IIIILcom/belkin/wemo/cache/devicelist/callback/SetNightModeSuccessCallback;Lcom/belkin/wemo/cache/devicelist/callback/SetNightModeErrorCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field final synthetic val$errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/SetNightModeErrorCallback;


# direct methods
.method constructor <init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Lcom/belkin/wemo/cache/devicelist/callback/SetNightModeErrorCallback;)V
    .locals 0

    .prologue
    .line 1742
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$14;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iput-object p2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$14;->val$errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/SetNightModeErrorCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onActionError(Ljava/lang/Exception;)V
    .locals 2
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 1746
    const-string v0, "DeviceListManager"

    const-string v1, "setNightModeConfiguration: Exception during PostControlAction: "

    invoke-static {v0, v1, p1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 1747
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$14;->val$errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/SetNightModeErrorCallback;

    if-eqz v0, :cond_0

    .line 1748
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$14;->val$errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/SetNightModeErrorCallback;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/belkin/wemo/cache/devicelist/callback/SetNightModeErrorCallback;->onNightModeConfigurationFailed(Ljava/lang/String;)V

    .line 1750
    :cond_0
    return-void
.end method
