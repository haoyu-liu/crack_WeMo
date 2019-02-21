.class Lcom/belkin/wemo/cache/devicelist/DeviceListManager$9;
.super Ljava/lang/Object;
.source "DeviceListManager.java"

# interfaces
.implements Lcom/belkin/wemo/controlaction/callback/ControlActionSuccessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->configureDimmingRange(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/belkin/wemo/cache/devicelist/callback/ConfigureDimmingRangeSuccessCallback;Lcom/belkin/wemo/cache/devicelist/callback/ConfigureDimmingRangeErrorCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field final synthetic val$errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/ConfigureDimmingRangeErrorCallback;


# direct methods
.method constructor <init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Lcom/belkin/wemo/cache/devicelist/callback/ConfigureDimmingRangeErrorCallback;)V
    .locals 0

    .prologue
    .line 1568
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$9;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iput-object p2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$9;->val$errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/ConfigureDimmingRangeErrorCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onActionSuccess(Ljava/lang/String;)V
    .locals 3
    .param p1, "responseXMLStr"    # Ljava/lang/String;

    .prologue
    .line 1571
    const-string v0, "DeviceListManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "configureDimmingRange: Response from FW: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1572
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "SUCCESS"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1579
    :cond_0
    :goto_0
    return-void

    .line 1575
    :cond_1
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$9;->val$errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/ConfigureDimmingRangeErrorCallback;

    if-eqz v0, :cond_0

    .line 1576
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$9;->val$errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/ConfigureDimmingRangeErrorCallback;

    const-string v1, "ERROR: ConfigureDimmingRange Action Failed on FW"

    invoke-interface {v0, v1}, Lcom/belkin/wemo/cache/devicelist/callback/ConfigureDimmingRangeErrorCallback;->onDimmingConfigurationError(Ljava/lang/String;)V

    goto :goto_0
.end method
