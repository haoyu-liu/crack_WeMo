.class Lorg/apache/cordova/file/FileUtils$8;
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

.field final synthetic val$end:I

.field final synthetic val$fname:Ljava/lang/String;

.field final synthetic val$start:I


# direct methods
.method constructor <init>(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;IILorg/apache/cordova/CallbackContext;)V
    .locals 0

    .prologue
    .line 159
    iput-object p1, p0, Lorg/apache/cordova/file/FileUtils$8;->this$0:Lorg/apache/cordova/file/FileUtils;

    iput-object p2, p0, Lorg/apache/cordova/file/FileUtils$8;->val$fname:Ljava/lang/String;

    iput p3, p0, Lorg/apache/cordova/file/FileUtils$8;->val$start:I

    iput p4, p0, Lorg/apache/cordova/file/FileUtils$8;->val$end:I

    iput-object p5, p0, Lorg/apache/cordova/file/FileUtils$8;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    .line 161
    iget-object v0, p0, Lorg/apache/cordova/file/FileUtils$8;->this$0:Lorg/apache/cordova/file/FileUtils;

    iget-object v1, p0, Lorg/apache/cordova/file/FileUtils$8;->val$fname:Ljava/lang/String;

    iget v2, p0, Lorg/apache/cordova/file/FileUtils$8;->val$start:I

    iget v3, p0, Lorg/apache/cordova/file/FileUtils$8;->val$end:I

    iget-object v4, p0, Lorg/apache/cordova/file/FileUtils$8;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    const/4 v5, 0x0

    const/4 v6, 0x7

    invoke-virtual/range {v0 .. v6}, Lorg/apache/cordova/file/FileUtils;->readFileAs(Ljava/lang/String;IILorg/apache/cordova/CallbackContext;Ljava/lang/String;I)V

    .line 162
    return-void
.end method
