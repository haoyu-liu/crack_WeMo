.class Lorg/apache/cordova/file/FileUtils$23;
.super Ljava/lang/Object;
.source "FileUtils.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/file/FileUtils;->threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Lorg/apache/cordova/CallbackContext;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/file/FileUtils;

.field final synthetic val$callbackContext:Lorg/apache/cordova/CallbackContext;

.field final synthetic val$f:Lorg/apache/cordova/file/FileUtils$FileOp;


# direct methods
.method constructor <init>(Lorg/apache/cordova/file/FileUtils;Lorg/apache/cordova/file/FileUtils$FileOp;Lorg/apache/cordova/CallbackContext;)V
    .locals 0

    .prologue
    .line 324
    iput-object p1, p0, Lorg/apache/cordova/file/FileUtils$23;->this$0:Lorg/apache/cordova/file/FileUtils;

    iput-object p2, p0, Lorg/apache/cordova/file/FileUtils$23;->val$f:Lorg/apache/cordova/file/FileUtils$FileOp;

    iput-object p3, p0, Lorg/apache/cordova/file/FileUtils$23;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 327
    :try_start_0
    iget-object v1, p0, Lorg/apache/cordova/file/FileUtils$23;->val$f:Lorg/apache/cordova/file/FileUtils$FileOp;

    invoke-interface {v1}, Lorg/apache/cordova/file/FileUtils$FileOp;->run()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 350
    :cond_0
    :goto_0
    return-void

    .line 328
    :catch_0
    move-exception v0

    .line 329
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 330
    instance-of v1, v0, Lorg/apache/cordova/file/EncodingException;

    if-eqz v1, :cond_1

    .line 331
    iget-object v1, p0, Lorg/apache/cordova/file/FileUtils$23;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    sget v2, Lorg/apache/cordova/file/FileUtils;->ENCODING_ERR:I

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CallbackContext;->error(I)V

    goto :goto_0

    .line 332
    :cond_1
    instance-of v1, v0, Ljava/io/FileNotFoundException;

    if-eqz v1, :cond_2

    .line 333
    iget-object v1, p0, Lorg/apache/cordova/file/FileUtils$23;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    sget v2, Lorg/apache/cordova/file/FileUtils;->NOT_FOUND_ERR:I

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CallbackContext;->error(I)V

    goto :goto_0

    .line 334
    :cond_2
    instance-of v1, v0, Lorg/apache/cordova/file/FileExistsException;

    if-eqz v1, :cond_3

    .line 335
    iget-object v1, p0, Lorg/apache/cordova/file/FileUtils$23;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    sget v2, Lorg/apache/cordova/file/FileUtils;->PATH_EXISTS_ERR:I

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CallbackContext;->error(I)V

    goto :goto_0

    .line 336
    :cond_3
    instance-of v1, v0, Lorg/apache/cordova/file/NoModificationAllowedException;

    if-eqz v1, :cond_4

    .line 337
    iget-object v1, p0, Lorg/apache/cordova/file/FileUtils$23;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    sget v2, Lorg/apache/cordova/file/FileUtils;->NO_MODIFICATION_ALLOWED_ERR:I

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CallbackContext;->error(I)V

    goto :goto_0

    .line 338
    :cond_4
    instance-of v1, v0, Lorg/apache/cordova/file/InvalidModificationException;

    if-eqz v1, :cond_5

    .line 339
    iget-object v1, p0, Lorg/apache/cordova/file/FileUtils$23;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    sget v2, Lorg/apache/cordova/file/FileUtils;->INVALID_MODIFICATION_ERR:I

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CallbackContext;->error(I)V

    goto :goto_0

    .line 340
    :cond_5
    instance-of v1, v0, Ljava/net/MalformedURLException;

    if-eqz v1, :cond_6

    .line 341
    iget-object v1, p0, Lorg/apache/cordova/file/FileUtils$23;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    sget v2, Lorg/apache/cordova/file/FileUtils;->ENCODING_ERR:I

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CallbackContext;->error(I)V

    goto :goto_0

    .line 342
    :cond_6
    instance-of v1, v0, Ljava/io/IOException;

    if-eqz v1, :cond_7

    .line 343
    iget-object v1, p0, Lorg/apache/cordova/file/FileUtils$23;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    sget v2, Lorg/apache/cordova/file/FileUtils;->INVALID_MODIFICATION_ERR:I

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CallbackContext;->error(I)V

    goto :goto_0

    .line 344
    :cond_7
    instance-of v1, v0, Lorg/apache/cordova/file/EncodingException;

    if-eqz v1, :cond_8

    .line 345
    iget-object v1, p0, Lorg/apache/cordova/file/FileUtils$23;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    sget v2, Lorg/apache/cordova/file/FileUtils;->ENCODING_ERR:I

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CallbackContext;->error(I)V

    goto :goto_0

    .line 346
    :cond_8
    instance-of v1, v0, Lorg/apache/cordova/file/TypeMismatchException;

    if-eqz v1, :cond_0

    .line 347
    iget-object v1, p0, Lorg/apache/cordova/file/FileUtils$23;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    sget v2, Lorg/apache/cordova/file/FileUtils;->TYPE_MISMATCH_ERR:I

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CallbackContext;->error(I)V

    goto :goto_0
.end method
