.class Lcom/belkin/cordova/plugin/NativeUtilPlugin$2;
.super Ljava/lang/Object;
.source "NativeUtilPlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/cordova/plugin/NativeUtilPlugin;->execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/cordova/plugin/NativeUtilPlugin;

.field final synthetic val$callbackContext:Lorg/apache/cordova/CallbackContext;


# direct methods
.method constructor <init>(Lcom/belkin/cordova/plugin/NativeUtilPlugin;Lorg/apache/cordova/CallbackContext;)V
    .locals 0

    .prologue
    .line 204
    iput-object p1, p0, Lcom/belkin/cordova/plugin/NativeUtilPlugin$2;->this$0:Lcom/belkin/cordova/plugin/NativeUtilPlugin;

    iput-object p2, p0, Lcom/belkin/cordova/plugin/NativeUtilPlugin$2;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 207
    iget-object v0, p0, Lcom/belkin/cordova/plugin/NativeUtilPlugin$2;->this$0:Lcom/belkin/cordova/plugin/NativeUtilPlugin;

    invoke-static {v0}, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->access$100(Lcom/belkin/cordova/plugin/NativeUtilPlugin;)Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-result-object v0

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/utils/SharePreferences;->isRemoteEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 208
    iget-object v0, p0, Lcom/belkin/cordova/plugin/NativeUtilPlugin$2;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    iget-object v1, p0, Lcom/belkin/cordova/plugin/NativeUtilPlugin$2;->this$0:Lcom/belkin/cordova/plugin/NativeUtilPlugin;

    invoke-static {v1}, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->access$200(Lcom/belkin/cordova/plugin/NativeUtilPlugin;)Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    move-result-object v1

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->generateAuthCode()Lorg/json/JSONArray;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONArray;)V

    .line 212
    :goto_0
    return-void

    .line 210
    :cond_0
    iget-object v0, p0, Lcom/belkin/cordova/plugin/NativeUtilPlugin$2;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->error(I)V

    goto :goto_0
.end method
