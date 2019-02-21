.class Lorg/apache/cordova/file/FileUtils$9;
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

.field final synthetic val$data:Ljava/lang/String;

.field final synthetic val$fname:Ljava/lang/String;

.field final synthetic val$isBinary:Ljava/lang/Boolean;

.field final synthetic val$offset:I


# direct methods
.method constructor <init>(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Boolean;Lorg/apache/cordova/CallbackContext;)V
    .locals 0

    .prologue
    .line 170
    iput-object p1, p0, Lorg/apache/cordova/file/FileUtils$9;->this$0:Lorg/apache/cordova/file/FileUtils;

    iput-object p2, p0, Lorg/apache/cordova/file/FileUtils$9;->val$fname:Ljava/lang/String;

    iput-object p3, p0, Lorg/apache/cordova/file/FileUtils$9;->val$data:Ljava/lang/String;

    iput p4, p0, Lorg/apache/cordova/file/FileUtils$9;->val$offset:I

    iput-object p5, p0, Lorg/apache/cordova/file/FileUtils$9;->val$isBinary:Ljava/lang/Boolean;

    iput-object p6, p0, Lorg/apache/cordova/file/FileUtils$9;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;,
            Lorg/apache/cordova/file/NoModificationAllowedException;
        }
    .end annotation

    .prologue
    .line 172
    iget-object v2, p0, Lorg/apache/cordova/file/FileUtils$9;->this$0:Lorg/apache/cordova/file/FileUtils;

    iget-object v3, p0, Lorg/apache/cordova/file/FileUtils$9;->val$fname:Ljava/lang/String;

    iget-object v4, p0, Lorg/apache/cordova/file/FileUtils$9;->val$data:Ljava/lang/String;

    iget v5, p0, Lorg/apache/cordova/file/FileUtils$9;->val$offset:I

    iget-object v6, p0, Lorg/apache/cordova/file/FileUtils$9;->val$isBinary:Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    invoke-virtual {v2, v3, v4, v5, v6}, Lorg/apache/cordova/file/FileUtils;->write(Ljava/lang/String;Ljava/lang/String;IZ)J

    move-result-wide v0

    .line 173
    .local v0, "fileSize":J
    iget-object v2, p0, Lorg/apache/cordova/file/FileUtils$9;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    new-instance v3, Lorg/apache/cordova/PluginResult;

    sget-object v4, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    long-to-float v5, v0

    invoke-direct {v3, v4, v5}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;F)V

    invoke-virtual {v2, v3}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 174
    return-void
.end method
