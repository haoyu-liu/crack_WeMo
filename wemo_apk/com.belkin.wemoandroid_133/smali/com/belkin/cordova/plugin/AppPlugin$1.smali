.class Lcom/belkin/cordova/plugin/AppPlugin$1;
.super Ljava/lang/Object;
.source "AppPlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/cordova/plugin/AppPlugin;->execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/cordova/plugin/AppPlugin;

.field final synthetic val$callbackContext:Lorg/apache/cordova/CallbackContext;


# direct methods
.method constructor <init>(Lcom/belkin/cordova/plugin/AppPlugin;Lorg/apache/cordova/CallbackContext;)V
    .locals 0

    .prologue
    .line 57
    iput-object p1, p0, Lcom/belkin/cordova/plugin/AppPlugin$1;->this$0:Lcom/belkin/cordova/plugin/AppPlugin;

    iput-object p2, p0, Lcom/belkin/cordova/plugin/AppPlugin$1;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 61
    iget-object v2, p0, Lcom/belkin/cordova/plugin/AppPlugin$1;->this$0:Lcom/belkin/cordova/plugin/AppPlugin;

    invoke-static {v2}, Lcom/belkin/cordova/plugin/AppPlugin;->access$000(Lcom/belkin/cordova/plugin/AppPlugin;)Lcom/belkin/controller/AppController;

    move-result-object v2

    invoke-virtual {v2}, Lcom/belkin/controller/AppController;->getContactsList()Lorg/json/JSONArray;

    move-result-object v0

    .line 63
    .local v0, "contactsList":Lorg/json/JSONArray;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-lez v2, :cond_0

    .line 64
    const-string v2, "AppPlugin"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "ACTION_GET_CONTACT_LIST : contacts list "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    new-instance v1, Lorg/apache/cordova/PluginResult;

    sget-object v2, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v1, v2, v0}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONArray;)V

    .line 66
    .local v1, "dataResult":Lorg/apache/cordova/PluginResult;
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 67
    iget-object v2, p0, Lcom/belkin/cordova/plugin/AppPlugin$1;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v2, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 72
    .end local v1    # "dataResult":Lorg/apache/cordova/PluginResult;
    :goto_0
    return-void

    .line 70
    :cond_0
    iget-object v2, p0, Lcom/belkin/cordova/plugin/AppPlugin$1;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    const-string v3, "error fetching contacts list"

    invoke-virtual {v2, v3}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_0
.end method
