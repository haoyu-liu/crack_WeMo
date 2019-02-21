.class Lorg/apache/cordova/file/FileUtils$20;
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

.field final synthetic val$newName:Ljava/lang/String;

.field final synthetic val$newParent:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V
    .locals 0

    .prologue
    .line 287
    iput-object p1, p0, Lorg/apache/cordova/file/FileUtils$20;->this$0:Lorg/apache/cordova/file/FileUtils;

    iput-object p2, p0, Lorg/apache/cordova/file/FileUtils$20;->val$fname:Ljava/lang/String;

    iput-object p3, p0, Lorg/apache/cordova/file/FileUtils$20;->val$newParent:Ljava/lang/String;

    iput-object p4, p0, Lorg/apache/cordova/file/FileUtils$20;->val$newName:Ljava/lang/String;

    iput-object p5, p0, Lorg/apache/cordova/file/FileUtils$20;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Lorg/apache/cordova/file/NoModificationAllowedException;,
            Ljava/io/IOException;,
            Lorg/apache/cordova/file/InvalidModificationException;,
            Lorg/apache/cordova/file/EncodingException;,
            Lorg/apache/cordova/file/FileExistsException;
        }
    .end annotation

    .prologue
    .line 289
    iget-object v1, p0, Lorg/apache/cordova/file/FileUtils$20;->this$0:Lorg/apache/cordova/file/FileUtils;

    iget-object v2, p0, Lorg/apache/cordova/file/FileUtils$20;->val$fname:Ljava/lang/String;

    iget-object v3, p0, Lorg/apache/cordova/file/FileUtils$20;->val$newParent:Ljava/lang/String;

    iget-object v4, p0, Lorg/apache/cordova/file/FileUtils$20;->val$newName:Ljava/lang/String;

    const/4 v5, 0x1

    invoke-static {v1, v2, v3, v4, v5}, Lorg/apache/cordova/file/FileUtils;->access$1000(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v0

    .line 290
    .local v0, "entry":Lorg/json/JSONObject;
    iget-object v1, p0, Lorg/apache/cordova/file/FileUtils$20;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v1, v0}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONObject;)V

    .line 291
    return-void
.end method
