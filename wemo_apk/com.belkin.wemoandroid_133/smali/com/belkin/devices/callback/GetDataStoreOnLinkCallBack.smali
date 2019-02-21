.class public Lcom/belkin/devices/callback/GetDataStoreOnLinkCallBack;
.super Ljava/lang/Object;
.source "GetDataStoreOnLinkCallBack.java"

# interfaces
.implements Lcom/belkin/wemo/callback/SetAndGetActionCallBack;


# static fields
.field private static final TAG:Ljava/lang/String; = "GetDataStoreOnLinkCallBack"


# instance fields
.field private mCallbackContext:Lorg/apache/cordova/CallbackContext;


# direct methods
.method public constructor <init>(Lorg/apache/cordova/CallbackContext;)V
    .locals 0
    .param p1, "context"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput-object p1, p0, Lcom/belkin/devices/callback/GetDataStoreOnLinkCallBack;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    .line 20
    return-void
.end method


# virtual methods
.method public onError()V
    .locals 3

    .prologue
    .line 24
    const-string v1, "GetDataStoreOnLinkCallBack"

    const-string v2, "GetDataStoreOnLinkCallBack: error during getting emergency contact."

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    iget-object v1, p0, Lcom/belkin/devices/callback/GetDataStoreOnLinkCallBack;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    if-eqz v1, :cond_0

    .line 26
    new-instance v0, Lorg/apache/cordova/PluginResult;

    sget-object v1, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v0, v1}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 27
    .local v0, "dataResult":Lorg/apache/cordova/PluginResult;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 28
    iget-object v1, p0, Lcom/belkin/devices/callback/GetDataStoreOnLinkCallBack;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v1, v0}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 30
    .end local v0    # "dataResult":Lorg/apache/cordova/PluginResult;
    :cond_0
    return-void
.end method

.method public onSuccess(Ljava/lang/String;)V
    .locals 6
    .param p1, "result"    # Ljava/lang/String;

    .prologue
    .line 34
    const-string v3, "GetDataStoreOnLinkCallBack"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "GetDataStoreOnLinkCallBack"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    iget-object v3, p0, Lcom/belkin/devices/callback/GetDataStoreOnLinkCallBack;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    if-eqz v3, :cond_0

    .line 36
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 37
    const/4 v1, 0x0

    .line 39
    .local v1, "emergencyContactsObj":Lorg/json/JSONObject;
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    .end local v1    # "emergencyContactsObj":Lorg/json/JSONObject;
    .local v2, "emergencyContactsObj":Lorg/json/JSONObject;
    :try_start_1
    const-string v3, "GetDataStoreOnLinkCallBack"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "final response: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    iget-object v3, p0, Lcom/belkin/devices/callback/GetDataStoreOnLinkCallBack;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v3, v2}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONObject;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    move-object v1, v2

    .line 51
    .end local v2    # "emergencyContactsObj":Lorg/json/JSONObject;
    :cond_0
    :goto_0
    return-void

    .line 42
    .restart local v1    # "emergencyContactsObj":Lorg/json/JSONObject;
    :catch_0
    move-exception v0

    .line 43
    .local v0, "e":Lorg/json/JSONException;
    :goto_1
    const-string v3, "GetDataStoreOnLinkCallBack"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Exception in getting the emergency contacts:: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    invoke-virtual {p0}, Lcom/belkin/devices/callback/GetDataStoreOnLinkCallBack;->onError()V

    goto :goto_0

    .line 48
    .end local v0    # "e":Lorg/json/JSONException;
    .end local v1    # "emergencyContactsObj":Lorg/json/JSONObject;
    :cond_1
    iget-object v3, p0, Lcom/belkin/devices/callback/GetDataStoreOnLinkCallBack;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {v3, v4}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONObject;)V

    goto :goto_0

    .line 42
    .restart local v2    # "emergencyContactsObj":Lorg/json/JSONObject;
    :catch_1
    move-exception v0

    move-object v1, v2

    .end local v2    # "emergencyContactsObj":Lorg/json/JSONObject;
    .restart local v1    # "emergencyContactsObj":Lorg/json/JSONObject;
    goto :goto_1
.end method
