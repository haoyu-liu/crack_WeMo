.class Lcom/belkin/cordova/plugin/AppSettingsPlugin$1;
.super Ljava/lang/Object;
.source "AppSettingsPlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/cordova/plugin/AppSettingsPlugin;->execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/cordova/plugin/AppSettingsPlugin;

.field final synthetic val$callbackContext:Lorg/apache/cordova/CallbackContext;

.field final synthetic val$inParamArray:Lorg/json/JSONArray;


# direct methods
.method constructor <init>(Lcom/belkin/cordova/plugin/AppSettingsPlugin;Lorg/apache/cordova/CallbackContext;Lorg/json/JSONArray;)V
    .locals 0

    .prologue
    .line 46
    iput-object p1, p0, Lcom/belkin/cordova/plugin/AppSettingsPlugin$1;->this$0:Lcom/belkin/cordova/plugin/AppSettingsPlugin;

    iput-object p2, p0, Lcom/belkin/cordova/plugin/AppSettingsPlugin$1;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    iput-object p3, p0, Lcom/belkin/cordova/plugin/AppSettingsPlugin$1;->val$inParamArray:Lorg/json/JSONArray;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 49
    iget-object v2, p0, Lcom/belkin/cordova/plugin/AppSettingsPlugin$1;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    if-eqz v2, :cond_0

    .line 50
    iget-object v2, p0, Lcom/belkin/cordova/plugin/AppSettingsPlugin$1;->val$inParamArray:Lorg/json/JSONArray;

    if-eqz v2, :cond_2

    .line 51
    iget-object v2, p0, Lcom/belkin/cordova/plugin/AppSettingsPlugin$1;->this$0:Lcom/belkin/cordova/plugin/AppSettingsPlugin;

    invoke-static {v2}, Lcom/belkin/cordova/plugin/AppSettingsPlugin;->access$000(Lcom/belkin/cordova/plugin/AppSettingsPlugin;)Lcom/belkin/controller/AppSettingsController;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/cordova/plugin/AppSettingsPlugin$1;->val$inParamArray:Lorg/json/JSONArray;

    invoke-virtual {v2, v3}, Lcom/belkin/controller/AppSettingsController;->reportAProblem(Lorg/json/JSONArray;)Ljava/lang/String;

    move-result-object v1

    .line 52
    .local v1, "result":Ljava/lang/String;
    const-string v2, "AppSettingsPlugin"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " result: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 54
    new-instance v0, Lorg/apache/cordova/PluginResult;

    sget-object v2, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v0, v2, v1}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    .line 55
    .local v0, "dataResult":Lorg/apache/cordova/PluginResult;
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 56
    iget-object v2, p0, Lcom/belkin/cordova/plugin/AppSettingsPlugin$1;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v2, v0}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 64
    .end local v0    # "dataResult":Lorg/apache/cordova/PluginResult;
    .end local v1    # "result":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 58
    .restart local v1    # "result":Ljava/lang/String;
    :cond_1
    iget-object v2, p0, Lcom/belkin/cordova/plugin/AppSettingsPlugin$1;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    new-instance v3, Lorg/apache/cordova/PluginResult;

    sget-object v4, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v3, v4}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    invoke-virtual {v2, v3}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_0

    .line 61
    .end local v1    # "result":Ljava/lang/String;
    :cond_2
    iget-object v2, p0, Lcom/belkin/cordova/plugin/AppSettingsPlugin$1;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    new-instance v3, Lorg/apache/cordova/PluginResult;

    sget-object v4, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v3, v4}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    invoke-virtual {v2, v3}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_0
.end method
