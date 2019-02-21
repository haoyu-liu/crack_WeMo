.class Lcom/belkin/wemo/cache/devicelist/DeviceListManager$13;
.super Ljava/lang/Object;
.source "DeviceListManager.java"

# interfaces
.implements Lcom/belkin/wemo/controlaction/callback/ControlActionSuccessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setBulbType(Ljava/lang/String;Ljava/lang/String;Lcom/belkin/wemo/cache/devicelist/callback/SetBulbTypeSuccessCallback;Lcom/belkin/wemo/cache/devicelist/callback/SetBulbTypeErrorCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field final synthetic val$bulbType:Ljava/lang/String;

.field final synthetic val$errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/SetBulbTypeErrorCallback;

.field final synthetic val$successCallback:Lcom/belkin/wemo/cache/devicelist/callback/SetBulbTypeSuccessCallback;

.field final synthetic val$udn:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Lcom/belkin/wemo/cache/devicelist/callback/SetBulbTypeSuccessCallback;Ljava/lang/String;Ljava/lang/String;Lcom/belkin/wemo/cache/devicelist/callback/SetBulbTypeErrorCallback;)V
    .locals 0

    .prologue
    .line 1671
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$13;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iput-object p2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$13;->val$successCallback:Lcom/belkin/wemo/cache/devicelist/callback/SetBulbTypeSuccessCallback;

    iput-object p3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$13;->val$udn:Ljava/lang/String;

    iput-object p4, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$13;->val$bulbType:Ljava/lang/String;

    iput-object p5, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$13;->val$errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/SetBulbTypeErrorCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onActionSuccess(Ljava/lang/String;)V
    .locals 7
    .param p1, "responseXMLStr"    # Ljava/lang/String;

    .prologue
    .line 1675
    const-string v3, "DeviceListManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "setBulbType: Response from FW: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1676
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 1677
    new-instance v3, Lcom/belkin/wemo/upnp/parser/SetBulbTypeResponseParser;

    invoke-direct {v3}, Lcom/belkin/wemo/upnp/parser/SetBulbTypeResponseParser;-><init>()V

    invoke-virtual {v3, p1}, Lcom/belkin/wemo/upnp/parser/SetBulbTypeResponseParser;->parseResponse(Ljava/lang/String;)Lcom/belkin/wemo/upnp/response/SetBulbTypeResponse;

    move-result-object v2

    .line 1678
    .local v2, "responseObj":Lcom/belkin/wemo/upnp/response/SetBulbTypeResponse;
    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$13;->val$successCallback:Lcom/belkin/wemo/cache/devicelist/callback/SetBulbTypeSuccessCallback;

    if-eqz v3, :cond_0

    .line 1679
    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$13;->val$successCallback:Lcom/belkin/wemo/cache/devicelist/callback/SetBulbTypeSuccessCallback;

    invoke-virtual {v2}, Lcom/belkin/wemo/upnp/response/SetBulbTypeResponse;->getMinLevel()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2}, Lcom/belkin/wemo/upnp/response/SetBulbTypeResponse;->getMaxLevel()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2}, Lcom/belkin/wemo/upnp/response/SetBulbTypeResponse;->getTurnOnLevel()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3, v4, v5, v6}, Lcom/belkin/wemo/cache/devicelist/callback/SetBulbTypeSuccessCallback;->onBulbTypeSet(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1683
    :cond_0
    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$13;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$13;->val$udn:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDevice(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    .line 1684
    .local v0, "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v0, :cond_1

    .line 1686
    :try_start_0
    const-string v3, "bulbType"

    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$13;->val$bulbType:Ljava/lang/String;

    invoke-virtual {v0, v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 1687
    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$13;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-static {v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->access$300(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)Lcom/belkin/wemo/cache/data/DevicesArray;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 1688
    invoke-static {}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->access$400()Lcom/belkin/wemo/cache/CacheManager;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x1

    invoke-virtual {v3, v0, v4, v5, v6}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1700
    .end local v0    # "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v2    # "responseObj":Lcom/belkin/wemo/upnp/response/SetBulbTypeResponse;
    :cond_1
    :goto_0
    return-void

    .line 1689
    .restart local v0    # "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .restart local v2    # "responseObj":Lcom/belkin/wemo/upnp/response/SetBulbTypeResponse;
    :catch_0
    move-exception v1

    .line 1690
    .local v1, "e":Lorg/json/JSONException;
    const-string v3, "DeviceListManager"

    const-string v4, "JSONException while setting bulb type in Devices Array"

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 1695
    .end local v0    # "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v1    # "e":Lorg/json/JSONException;
    .end local v2    # "responseObj":Lcom/belkin/wemo/upnp/response/SetBulbTypeResponse;
    :cond_2
    const-string v3, "DeviceListManager"

    const-string v4, "setBulbType: Action Failed."

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1696
    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$13;->val$errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/SetBulbTypeErrorCallback;

    if-eqz v3, :cond_1

    .line 1697
    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$13;->val$errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/SetBulbTypeErrorCallback;

    const-string v4, "Action failed. Response is empty."

    invoke-interface {v3, v4}, Lcom/belkin/wemo/cache/devicelist/callback/SetBulbTypeErrorCallback;->onSetBulbTypeFailed(Ljava/lang/String;)V

    goto :goto_0
.end method
