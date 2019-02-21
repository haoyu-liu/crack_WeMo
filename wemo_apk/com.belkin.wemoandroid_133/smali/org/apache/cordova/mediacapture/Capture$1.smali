.class Lorg/apache/cordova/mediacapture/Capture$1;
.super Ljava/lang/Object;
.source "Capture.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/mediacapture/Capture;->onActivityResult(IILandroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/mediacapture/Capture;

.field final synthetic val$intent:Landroid/content/Intent;

.field final synthetic val$that:Lorg/apache/cordova/mediacapture/Capture;


# direct methods
.method constructor <init>(Lorg/apache/cordova/mediacapture/Capture;Landroid/content/Intent;Lorg/apache/cordova/mediacapture/Capture;)V
    .locals 0

    .prologue
    .line 266
    iput-object p1, p0, Lorg/apache/cordova/mediacapture/Capture$1;->this$0:Lorg/apache/cordova/mediacapture/Capture;

    iput-object p2, p0, Lorg/apache/cordova/mediacapture/Capture$1;->val$intent:Landroid/content/Intent;

    iput-object p3, p0, Lorg/apache/cordova/mediacapture/Capture$1;->val$that:Lorg/apache/cordova/mediacapture/Capture;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 271
    iget-object v1, p0, Lorg/apache/cordova/mediacapture/Capture$1;->val$intent:Landroid/content/Intent;

    invoke-virtual {v1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    .line 273
    .local v0, "data":Landroid/net/Uri;
    iget-object v1, p0, Lorg/apache/cordova/mediacapture/Capture$1;->this$0:Lorg/apache/cordova/mediacapture/Capture;

    invoke-static {v1}, Lorg/apache/cordova/mediacapture/Capture;->access$100(Lorg/apache/cordova/mediacapture/Capture;)Lorg/json/JSONArray;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/cordova/mediacapture/Capture$1;->this$0:Lorg/apache/cordova/mediacapture/Capture;

    invoke-static {v2, v0}, Lorg/apache/cordova/mediacapture/Capture;->access$000(Lorg/apache/cordova/mediacapture/Capture;Landroid/net/Uri;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 275
    iget-object v1, p0, Lorg/apache/cordova/mediacapture/Capture$1;->this$0:Lorg/apache/cordova/mediacapture/Capture;

    invoke-static {v1}, Lorg/apache/cordova/mediacapture/Capture;->access$100(Lorg/apache/cordova/mediacapture/Capture;)Lorg/json/JSONArray;

    move-result-object v1

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v1

    int-to-long v2, v1

    iget-object v1, p0, Lorg/apache/cordova/mediacapture/Capture$1;->this$0:Lorg/apache/cordova/mediacapture/Capture;

    invoke-static {v1}, Lorg/apache/cordova/mediacapture/Capture;->access$200(Lorg/apache/cordova/mediacapture/Capture;)J

    move-result-wide v4

    cmp-long v1, v2, v4

    if-ltz v1, :cond_0

    .line 277
    iget-object v1, p0, Lorg/apache/cordova/mediacapture/Capture$1;->val$that:Lorg/apache/cordova/mediacapture/Capture;

    invoke-static {v1}, Lorg/apache/cordova/mediacapture/Capture;->access$300(Lorg/apache/cordova/mediacapture/Capture;)Lorg/apache/cordova/CallbackContext;

    move-result-object v1

    new-instance v2, Lorg/apache/cordova/PluginResult;

    sget-object v3, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    iget-object v4, p0, Lorg/apache/cordova/mediacapture/Capture$1;->this$0:Lorg/apache/cordova/mediacapture/Capture;

    invoke-static {v4}, Lorg/apache/cordova/mediacapture/Capture;->access$100(Lorg/apache/cordova/mediacapture/Capture;)Lorg/json/JSONArray;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONArray;)V

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 282
    :goto_0
    return-void

    .line 280
    :cond_0
    iget-object v1, p0, Lorg/apache/cordova/mediacapture/Capture$1;->this$0:Lorg/apache/cordova/mediacapture/Capture;

    invoke-static {v1}, Lorg/apache/cordova/mediacapture/Capture;->access$400(Lorg/apache/cordova/mediacapture/Capture;)V

    goto :goto_0
.end method
