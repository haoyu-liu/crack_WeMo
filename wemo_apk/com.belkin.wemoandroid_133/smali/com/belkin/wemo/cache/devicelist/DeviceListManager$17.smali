.class Lcom/belkin/wemo/cache/devicelist/DeviceListManager$17;
.super Ljava/lang/Object;
.source "DeviceListManager.java"

# interfaces
.implements Lcom/belkin/wemo/controlaction/callback/ControlActionSuccessCallback;


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

.field final synthetic val$devInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

.field final synthetic val$errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeErrorCallback;

.field final synthetic val$hushModeValue:Ljava/lang/String;

.field final synthetic val$successCallback:Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeSuccessCallback;


# direct methods
.method constructor <init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Lcom/belkin/wemo/cache/data/DeviceInformation;Ljava/lang/String;Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeSuccessCallback;Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeErrorCallback;)V
    .locals 0

    .prologue
    .line 1825
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$17;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iput-object p2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$17;->val$devInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iput-object p3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$17;->val$hushModeValue:Ljava/lang/String;

    iput-object p4, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$17;->val$successCallback:Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeSuccessCallback;

    iput-object p5, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$17;->val$errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeErrorCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onActionSuccess(Ljava/lang/String;)V
    .locals 6
    .param p1, "responseXMLStr"    # Ljava/lang/String;

    .prologue
    .line 1829
    const-string v1, "DeviceListManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "configureHushMode: Response from FW: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1830
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "SUCCESS"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1832
    :try_start_0
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$17;->val$devInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const-string v2, "hushMode"

    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$17;->val$hushModeValue:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 1834
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$17;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-static {v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->access$300(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)Lcom/belkin/wemo/cache/data/DevicesArray;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$17;->val$devInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v1, v2}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 1835
    invoke-static {}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->access$400()Lcom/belkin/wemo/cache/CacheManager;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$17;->val$devInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const/4 v3, 0x1

    const/4 v4, 0x1

    const/4 v5, 0x1

    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 1837
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$17;->val$successCallback:Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeSuccessCallback;

    if-eqz v1, :cond_0

    .line 1838
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$17;->val$successCallback:Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeSuccessCallback;

    invoke-interface {v1}, Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeSuccessCallback;->onHushModeConfigured()V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1854
    :cond_0
    :goto_0
    return-void

    .line 1840
    :catch_0
    move-exception v0

    .line 1841
    .local v0, "e":Lorg/json/JSONException;
    const-string v1, "DeviceListManager"

    const-string v2, "configureHushMode: JSONException while updating device information object: "

    invoke-static {v1, v2, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 1842
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$17;->val$errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeErrorCallback;

    if-eqz v1, :cond_0

    .line 1843
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$17;->val$errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeErrorCallback;

    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeErrorCallback;->onConfigureHushModeFailed(Ljava/lang/String;)V

    goto :goto_0

    .line 1848
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_1
    const-string v1, "DeviceListManager"

    const-string v2, "configureHushMode: Action Failed."

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1849
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$17;->val$errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeErrorCallback;

    if-eqz v1, :cond_0

    .line 1850
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$17;->val$errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeErrorCallback;

    const-string v2, "Action Failed"

    invoke-interface {v1, v2}, Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeErrorCallback;->onConfigureHushModeFailed(Ljava/lang/String;)V

    goto :goto_0
.end method
