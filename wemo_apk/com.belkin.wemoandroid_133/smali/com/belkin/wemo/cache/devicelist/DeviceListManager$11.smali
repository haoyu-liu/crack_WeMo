.class Lcom/belkin/wemo/cache/devicelist/DeviceListManager$11;
.super Ljava/lang/Object;
.source "DeviceListManager.java"

# interfaces
.implements Lcom/belkin/wemo/controlaction/callback/ControlActionSuccessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->calibrate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/belkin/wemo/cache/devicelist/callback/CalibrateSuccessCallback;Lcom/belkin/wemo/cache/devicelist/callback/CalibrateErrorCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field final synthetic val$errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/CalibrateErrorCallback;

.field final synthetic val$successCallback:Lcom/belkin/wemo/cache/devicelist/callback/CalibrateSuccessCallback;


# direct methods
.method constructor <init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Lcom/belkin/wemo/cache/devicelist/callback/CalibrateSuccessCallback;Lcom/belkin/wemo/cache/devicelist/callback/CalibrateErrorCallback;)V
    .locals 0

    .prologue
    .line 1615
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$11;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iput-object p2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$11;->val$successCallback:Lcom/belkin/wemo/cache/devicelist/callback/CalibrateSuccessCallback;

    iput-object p3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$11;->val$errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/CalibrateErrorCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onActionSuccess(Ljava/lang/String;)V
    .locals 3
    .param p1, "responseXMLStr"    # Ljava/lang/String;

    .prologue
    .line 1619
    const-string v0, "DeviceListManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "calibrate: Response from FW: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1620
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "SUCCESS"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1621
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$11;->val$successCallback:Lcom/belkin/wemo/cache/devicelist/callback/CalibrateSuccessCallback;

    if-eqz v0, :cond_0

    .line 1622
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$11;->val$successCallback:Lcom/belkin/wemo/cache/devicelist/callback/CalibrateSuccessCallback;

    invoke-interface {v0}, Lcom/belkin/wemo/cache/devicelist/callback/CalibrateSuccessCallback;->onCalibrationPassed()V

    .line 1630
    :cond_0
    :goto_0
    return-void

    .line 1625
    :cond_1
    const-string v0, "DeviceListManager"

    const-string v1, "calibrate: Action Failed."

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1626
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$11;->val$errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/CalibrateErrorCallback;

    if-eqz v0, :cond_0

    .line 1627
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$11;->val$errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/CalibrateErrorCallback;

    const-string v1, "Action failed. Response is empty."

    invoke-interface {v0, v1}, Lcom/belkin/wemo/cache/devicelist/callback/CalibrateErrorCallback;->onCalibrationFailed(Ljava/lang/String;)V

    goto :goto_0
.end method
