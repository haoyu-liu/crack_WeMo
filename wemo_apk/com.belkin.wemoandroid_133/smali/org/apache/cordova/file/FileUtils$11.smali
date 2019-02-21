.class Lorg/apache/cordova/file/FileUtils$11;
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

.field final synthetic val$fstype:I

.field final synthetic val$size:J


# direct methods
.method constructor <init>(Lorg/apache/cordova/file/FileUtils;JLorg/apache/cordova/CallbackContext;I)V
    .locals 0

    .prologue
    .line 190
    iput-object p1, p0, Lorg/apache/cordova/file/FileUtils$11;->this$0:Lorg/apache/cordova/file/FileUtils;

    iput-wide p2, p0, Lorg/apache/cordova/file/FileUtils$11;->val$size:J

    iput-object p4, p0, Lorg/apache/cordova/file/FileUtils$11;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    iput p5, p0, Lorg/apache/cordova/file/FileUtils$11;->val$fstype:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 192
    iget-wide v2, p0, Lorg/apache/cordova/file/FileUtils$11;->val$size:J

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-eqz v1, :cond_0

    iget-wide v2, p0, Lorg/apache/cordova/file/FileUtils$11;->val$size:J

    const/4 v1, 0x1

    invoke-static {v1}, Lorg/apache/cordova/file/DirectoryManager;->getFreeDiskSpace(Z)J

    move-result-wide v4

    const-wide/16 v6, 0x400

    mul-long/2addr v4, v6

    cmp-long v1, v2, v4

    if-lez v1, :cond_0

    .line 193
    iget-object v1, p0, Lorg/apache/cordova/file/FileUtils$11;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    new-instance v2, Lorg/apache/cordova/PluginResult;

    sget-object v3, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    sget v4, Lorg/apache/cordova/file/FileUtils;->QUOTA_EXCEEDED_ERR:I

    invoke-direct {v2, v3, v4}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;I)V

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 198
    :goto_0
    return-void

    .line 195
    :cond_0
    iget-object v1, p0, Lorg/apache/cordova/file/FileUtils$11;->this$0:Lorg/apache/cordova/file/FileUtils;

    iget v2, p0, Lorg/apache/cordova/file/FileUtils$11;->val$fstype:I

    invoke-static {v1, v2}, Lorg/apache/cordova/file/FileUtils;->access$100(Lorg/apache/cordova/file/FileUtils;I)Lorg/json/JSONObject;

    move-result-object v0

    .line 196
    .local v0, "obj":Lorg/json/JSONObject;
    iget-object v1, p0, Lorg/apache/cordova/file/FileUtils$11;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v1, v0}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONObject;)V

    goto :goto_0
.end method
