.class Lcom/belkin/cordova/plugin/NativeUtilPlugin$3;
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
    .line 441
    iput-object p1, p0, Lcom/belkin/cordova/plugin/NativeUtilPlugin$3;->this$0:Lcom/belkin/cordova/plugin/NativeUtilPlugin;

    iput-object p2, p0, Lcom/belkin/cordova/plugin/NativeUtilPlugin$3;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 443
    iget-object v0, p0, Lcom/belkin/cordova/plugin/NativeUtilPlugin$3;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    iget-object v1, p0, Lcom/belkin/cordova/plugin/NativeUtilPlugin$3;->this$0:Lcom/belkin/cordova/plugin/NativeUtilPlugin;

    invoke-static {v1}, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->access$200(Lcom/belkin/cordova/plugin/NativeUtilPlugin;)Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    move-result-object v1

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getArpMac()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    .line 444
    return-void
.end method
