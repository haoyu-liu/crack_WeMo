.class Lorg/apache/cordova/file/FileUtils$15;
.super Ljava/lang/Object;
.source "FileUtils.java"

# interfaces
.implements Lorg/apache/cordova/file/FileUtils$FileOp;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/file/FileUtils;->execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/file/FileUtils;

.field final synthetic val$callbackContext:Lorg/apache/cordova/CallbackContext;

.field final synthetic val$fname:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V
    .locals 0

    .prologue
    .line 229
    iput-object p1, p0, Lorg/apache/cordova/file/FileUtils$15;->this$0:Lorg/apache/cordova/file/FileUtils;

    iput-object p2, p0, Lorg/apache/cordova/file/FileUtils$15;->val$fname:Ljava/lang/String;

    iput-object p3, p0, Lorg/apache/cordova/file/FileUtils$15;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 231
    iget-object v1, p0, Lorg/apache/cordova/file/FileUtils$15;->this$0:Lorg/apache/cordova/file/FileUtils;

    iget-object v2, p0, Lorg/apache/cordova/file/FileUtils$15;->val$fname:Ljava/lang/String;

    invoke-static {v1, v2}, Lorg/apache/cordova/file/FileUtils;->access$500(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 232
    .local v0, "obj":Lorg/json/JSONObject;
    iget-object v1, p0, Lorg/apache/cordova/file/FileUtils$15;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v1, v0}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONObject;)V

    .line 233
    return-void
.end method
