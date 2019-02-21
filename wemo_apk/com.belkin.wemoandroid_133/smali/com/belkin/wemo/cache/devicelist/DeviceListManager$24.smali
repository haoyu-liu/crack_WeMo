.class Lcom/belkin/wemo/cache/devicelist/DeviceListManager$24;
.super Ljava/lang/Object;
.source "DeviceListManager.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->resetFNIconRules(Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field final synthetic val$successCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;

.field final synthetic val$udn:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 6206
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$24;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iput-object p2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$24;->val$successCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;

    iput-object p3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$24;->val$udn:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onRequestComplete(ZI[B)V
    .locals 6
    .param p1, "success"    # Z
    .param p2, "statusCode"    # I
    .param p3, "resp"    # [B

    .prologue
    .line 6210
    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$24;->val$successCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;

    if-eqz v2, :cond_0

    .line 6212
    :try_start_0
    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$24;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v3, "reset_fn_icon_rules"

    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$24;->val$udn:Ljava/lang/String;

    const-string v5, "true"

    invoke-virtual {v2, v3, v4, v5}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->prepareDeviceResetResponse(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 6213
    .local v1, "response":Lorg/json/JSONObject;
    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$24;->val$successCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;->onSuccess(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6218
    .end local v1    # "response":Lorg/json/JSONObject;
    :cond_0
    :goto_0
    return-void

    .line 6214
    :catch_0
    move-exception v0

    .line 6215
    .local v0, "e":Lorg/json/JSONException;
    const-string v2, "DeviceListManager"

    const-string v3, "JSONException while sending response for CloudRequestResetFNIRules: "

    invoke-static {v2, v3, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0
.end method
