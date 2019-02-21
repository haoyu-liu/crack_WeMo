.class Lorg/apache/cordova/file/FileUtils$5;
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

.field final synthetic val$encoding:Ljava/lang/String;

.field final synthetic val$end:I

.field final synthetic val$fname:Ljava/lang/String;

.field final synthetic val$start:I


# direct methods
.method constructor <init>(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;IILorg/apache/cordova/CallbackContext;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 129
    iput-object p1, p0, Lorg/apache/cordova/file/FileUtils$5;->this$0:Lorg/apache/cordova/file/FileUtils;

    iput-object p2, p0, Lorg/apache/cordova/file/FileUtils$5;->val$fname:Ljava/lang/String;

    iput p3, p0, Lorg/apache/cordova/file/FileUtils$5;->val$start:I

    iput p4, p0, Lorg/apache/cordova/file/FileUtils$5;->val$end:I

    iput-object p5, p0, Lorg/apache/cordova/file/FileUtils$5;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    iput-object p6, p0, Lorg/apache/cordova/file/FileUtils$5;->val$encoding:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    .line 131
    iget-object v0, p0, Lorg/apache/cordova/file/FileUtils$5;->this$0:Lorg/apache/cordova/file/FileUtils;

    iget-object v1, p0, Lorg/apache/cordova/file/FileUtils$5;->val$fname:Ljava/lang/String;

    iget v2, p0, Lorg/apache/cordova/file/FileUtils$5;->val$start:I

    iget v3, p0, Lorg/apache/cordova/file/FileUtils$5;->val$end:I

    iget-object v4, p0, Lorg/apache/cordova/file/FileUtils$5;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    iget-object v5, p0, Lorg/apache/cordova/file/FileUtils$5;->val$encoding:Ljava/lang/String;

    const/4 v6, 0x1

    invoke-virtual/range {v0 .. v6}, Lorg/apache/cordova/file/FileUtils;->readFileAs(Ljava/lang/String;IILorg/apache/cordova/CallbackContext;Ljava/lang/String;I)V

    .line 132
    return-void
.end method
