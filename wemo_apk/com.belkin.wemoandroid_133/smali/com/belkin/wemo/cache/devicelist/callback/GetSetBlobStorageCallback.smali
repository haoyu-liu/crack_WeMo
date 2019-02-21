.class public Lcom/belkin/wemo/cache/devicelist/callback/GetSetBlobStorageCallback;
.super Ljava/lang/Object;
.source "GetSetBlobStorageCallback.java"

# interfaces
.implements Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;
.implements Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;


# instance fields
.field private final TAG:Ljava/lang/String;

.field private mCallbackContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    const-string v0, "GetSetBlobStorageCallback"

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/callback/GetSetBlobStorageCallback;->TAG:Ljava/lang/String;

    .line 13
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/callback/GetSetBlobStorageCallback;->mCallbackContext:Landroid/content/Context;

    .line 14
    return-void
.end method


# virtual methods
.method public onError(Ljava/lang/String;)V
    .locals 3
    .param p1, "error"    # Ljava/lang/String;

    .prologue
    .line 24
    const-string v0, "GetSetBlobStorageCallback"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onError SDK error: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    return-void
.end method

.method public onSuccess(Ljava/lang/String;)V
    .locals 3
    .param p1, "result"    # Ljava/lang/String;

    .prologue
    .line 18
    const-string v0, "GetSetBlobStorageCallback"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onSuccess SDK result: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    return-void
.end method
