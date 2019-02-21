.class Lcom/belkin/wemo/cache/devicelist/DeviceListManager$15;
.super Ljava/lang/Object;
.source "DeviceListManager.java"

# interfaces
.implements Lcom/belkin/wemo/controlaction/callback/ControlActionSuccessCallback;


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

.field final synthetic val$devInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

.field final synthetic val$endTime:I

.field final synthetic val$errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/SetNightModeErrorCallback;

.field final synthetic val$nightMode:I

.field final synthetic val$nightModeBrightness:I

.field final synthetic val$startTime:I

.field final synthetic val$successCallback:Lcom/belkin/wemo/cache/devicelist/callback/SetNightModeSuccessCallback;


# direct methods
.method constructor <init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Lcom/belkin/wemo/cache/data/DeviceInformation;IIIILcom/belkin/wemo/cache/devicelist/callback/SetNightModeSuccessCallback;Lcom/belkin/wemo/cache/devicelist/callback/SetNightModeErrorCallback;)V
    .locals 0

    .prologue
    .line 1751
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$15;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iput-object p2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$15;->val$devInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iput p3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$15;->val$nightMode:I

    iput p4, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$15;->val$startTime:I

    iput p5, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$15;->val$endTime:I

    iput p6, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$15;->val$nightModeBrightness:I

    iput-object p7, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$15;->val$successCallback:Lcom/belkin/wemo/cache/devicelist/callback/SetNightModeSuccessCallback;

    iput-object p8, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$15;->val$errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/SetNightModeErrorCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onActionSuccess(Ljava/lang/String;)V
    .locals 6
    .param p1, "responseXMLStr"    # Ljava/lang/String;

    .prologue
    .line 1755
    const-string v1, "DeviceListManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setNightModeConfiguration: Response from FW: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1756
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "SUCCESS"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1758
    :try_start_0
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$15;->val$devInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const-string v2, "nightMode"

    iget v3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$15;->val$nightMode:I

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 1759
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$15;->val$devInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const-string v2, "startTime"

    iget v3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$15;->val$startTime:I

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 1760
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$15;->val$devInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const-string v2, "endTime"

    iget v3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$15;->val$endTime:I

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 1761
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$15;->val$devInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const-string v2, "nightModeBrightness"

    iget v3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$15;->val$nightModeBrightness:I

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 1763
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$15;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-static {v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->access$300(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)Lcom/belkin/wemo/cache/data/DevicesArray;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$15;->val$devInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v1, v2}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 1764
    invoke-static {}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->access$400()Lcom/belkin/wemo/cache/CacheManager;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$15;->val$devInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const/4 v3, 0x1

    const/4 v4, 0x1

    const/4 v5, 0x1

    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 1766
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$15;->val$successCallback:Lcom/belkin/wemo/cache/devicelist/callback/SetNightModeSuccessCallback;

    if-eqz v1, :cond_0

    .line 1767
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$15;->val$successCallback:Lcom/belkin/wemo/cache/devicelist/callback/SetNightModeSuccessCallback;

    invoke-interface {v1}, Lcom/belkin/wemo/cache/devicelist/callback/SetNightModeSuccessCallback;->onNightModeConfigured()V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1781
    :cond_0
    :goto_0
    return-void

    .line 1769
    :catch_0
    move-exception v0

    .line 1770
    .local v0, "e":Lorg/json/JSONException;
    const-string v1, "DeviceListManager"

    const-string v2, "setNightModeConfiguration: JSONException while updating device information object: "

    invoke-static {v1, v2, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 1771
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$15;->val$errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/SetNightModeErrorCallback;

    if-eqz v1, :cond_0

    .line 1772
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$15;->val$errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/SetNightModeErrorCallback;

    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/belkin/wemo/cache/devicelist/callback/SetNightModeErrorCallback;->onNightModeConfigurationFailed(Ljava/lang/String;)V

    goto :goto_0

    .line 1776
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_1
    const-string v1, "DeviceListManager"

    const-string v2, "setNightModeConfiguration: Action Failed."

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1777
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$15;->val$errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/SetNightModeErrorCallback;

    if-eqz v1, :cond_0

    .line 1778
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$15;->val$errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/SetNightModeErrorCallback;

    const-string v2, "Action failed"

    invoke-interface {v1, v2}, Lcom/belkin/wemo/cache/devicelist/callback/SetNightModeErrorCallback;->onNightModeConfigurationFailed(Ljava/lang/String;)V

    goto :goto_0
.end method
