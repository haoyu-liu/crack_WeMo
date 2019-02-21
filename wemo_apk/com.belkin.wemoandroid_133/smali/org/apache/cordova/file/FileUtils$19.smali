.class Lorg/apache/cordova/file/FileUtils$19;
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
    .line 272
    iput-object p1, p0, Lorg/apache/cordova/file/FileUtils$19;->this$0:Lorg/apache/cordova/file/FileUtils;

    iput-object p2, p0, Lorg/apache/cordova/file/FileUtils$19;->val$fname:Ljava/lang/String;

    iput-object p3, p0, Lorg/apache/cordova/file/FileUtils$19;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/cordova/file/FileExistsException;
        }
    .end annotation

    .prologue
    .line 274
    iget-object v1, p0, Lorg/apache/cordova/file/FileUtils$19;->this$0:Lorg/apache/cordova/file/FileUtils;

    iget-object v2, p0, Lorg/apache/cordova/file/FileUtils$19;->val$fname:Ljava/lang/String;

    invoke-static {v1, v2}, Lorg/apache/cordova/file/FileUtils;->access$900(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;)Z

    move-result v0

    .line 275
    .local v0, "success":Z
    if-eqz v0, :cond_0

    .line 276
    iget-object v1, p0, Lorg/apache/cordova/file/FileUtils$19;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v1}, Lorg/apache/cordova/CallbackContext;->success()V

    .line 280
    :goto_0
    return-void

    .line 278
    :cond_0
    iget-object v1, p0, Lorg/apache/cordova/file/FileUtils$19;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    sget v2, Lorg/apache/cordova/file/FileUtils;->NO_MODIFICATION_ALLOWED_ERR:I

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CallbackContext;->error(I)V

    goto :goto_0
.end method
