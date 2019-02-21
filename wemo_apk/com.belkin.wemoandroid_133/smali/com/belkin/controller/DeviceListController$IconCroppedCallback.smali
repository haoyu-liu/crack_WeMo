.class Lcom/belkin/controller/DeviceListController$IconCroppedCallback;
.super Ljava/lang/Object;
.source "DeviceListController.java"

# interfaces
.implements Lcom/belkin/controller/listener/CropImageByUserCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/controller/DeviceListController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "IconCroppedCallback"
.end annotation


# instance fields
.field private callbackContext:Lorg/apache/cordova/CallbackContext;

.field final synthetic this$0:Lcom/belkin/controller/DeviceListController;


# direct methods
.method public constructor <init>(Lcom/belkin/controller/DeviceListController;Lorg/apache/cordova/CallbackContext;)V
    .locals 0
    .param p2, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 1271
    iput-object p1, p0, Lcom/belkin/controller/DeviceListController$IconCroppedCallback;->this$0:Lcom/belkin/controller/DeviceListController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1272
    iput-object p2, p0, Lcom/belkin/controller/DeviceListController$IconCroppedCallback;->callbackContext:Lorg/apache/cordova/CallbackContext;

    .line 1273
    return-void
.end method


# virtual methods
.method public onCropError(Ljava/lang/String;)V
    .locals 3
    .param p1, "error"    # Ljava/lang/String;

    .prologue
    .line 1298
    const-string v0, "DeviceListController"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "EDIT ICON: onCropError: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1299
    iget-object v0, p0, Lcom/belkin/controller/DeviceListController$IconCroppedCallback;->callbackContext:Lorg/apache/cordova/CallbackContext;

    if-eqz v0, :cond_0

    .line 1300
    iget-object v0, p0, Lcom/belkin/controller/DeviceListController$IconCroppedCallback;->callbackContext:Lorg/apache/cordova/CallbackContext;

    new-instance v1, Lorg/apache/cordova/PluginResult;

    sget-object v2, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v1, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 1302
    :cond_0
    return-void
.end method

.method public onImageCropped(Landroid/net/Uri;)V
    .locals 6
    .param p1, "icon"    # Landroid/net/Uri;

    .prologue
    .line 1278
    sget-object v3, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v3, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getIconFromUri(Landroid/net/Uri;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 1279
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    sget-object v3, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v3, v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->saveEditedIcon(Landroid/graphics/Bitmap;)Ljava/lang/String;

    move-result-object v1

    .line 1280
    .local v1, "filePath":Ljava/lang/String;
    const-string v4, "DeviceListController"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "EDIT ICON: onImageCropped. ICON FILE PATH: "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "; New File Size after Shrink: "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getByteCount()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    :goto_0
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1283
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 1284
    new-instance v2, Lorg/apache/cordova/PluginResult;

    sget-object v3, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v2, v3, v1}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    .line 1291
    .local v2, "result":Lorg/apache/cordova/PluginResult;
    :goto_1
    iget-object v3, p0, Lcom/belkin/controller/DeviceListController$IconCroppedCallback;->callbackContext:Lorg/apache/cordova/CallbackContext;

    if-eqz v3, :cond_0

    .line 1292
    iget-object v3, p0, Lcom/belkin/controller/DeviceListController$IconCroppedCallback;->callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v3, v2}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 1294
    :cond_0
    return-void

    .line 1280
    .end local v2    # "result":Lorg/apache/cordova/PluginResult;
    :cond_1
    const-string v3, "Bitmap is NULL"

    goto :goto_0

    .line 1288
    :cond_2
    new-instance v2, Lorg/apache/cordova/PluginResult;

    sget-object v3, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v2, v3}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .restart local v2    # "result":Lorg/apache/cordova/PluginResult;
    goto :goto_1
.end method
