.class Lcom/belkin/controller/DeviceListController$PhotoGalleryProcessor;
.super Ljava/lang/Object;
.source "DeviceListController.java"

# interfaces
.implements Lcom/belkin/controller/listener/SelectPhotoListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/controller/DeviceListController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PhotoGalleryProcessor"
.end annotation


# instance fields
.field private callbackContext:Lorg/apache/cordova/CallbackContext;

.field final synthetic this$0:Lcom/belkin/controller/DeviceListController;


# direct methods
.method constructor <init>(Lcom/belkin/controller/DeviceListController;Lorg/apache/cordova/CallbackContext;)V
    .locals 0
    .param p2, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 1227
    iput-object p1, p0, Lcom/belkin/controller/DeviceListController$PhotoGalleryProcessor;->this$0:Lcom/belkin/controller/DeviceListController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1228
    iput-object p2, p0, Lcom/belkin/controller/DeviceListController$PhotoGalleryProcessor;->callbackContext:Lorg/apache/cordova/CallbackContext;

    .line 1229
    return-void
.end method


# virtual methods
.method public onPhotoSelected(Landroid/net/Uri;)V
    .locals 8
    .param p1, "selectedPhoto"    # Landroid/net/Uri;

    .prologue
    .line 1237
    const-string v3, "DeviceListController"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "PhotoGalleryProcessor: onPhotoSelected - URI of selected photo: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1239
    sget-object v3, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v3, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getIconFromUriForCrop(Landroid/net/Uri;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 1240
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    const-string v4, "DeviceListController"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "EDIT ICON: onPhotoSelected: Size of bitmap after photo selection: "

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

    .line 1242
    sget-object v3, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v3, p1, v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->rotateGalleryIcon(Landroid/net/Uri;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 1243
    sget-object v3, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v3, v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->saveEditedIcon(Landroid/graphics/Bitmap;)Ljava/lang/String;

    move-result-object v2

    .line 1244
    .local v2, "filePath":Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1245
    .local v1, "file":Ljava/io/File;
    iget-object v3, p0, Lcom/belkin/controller/DeviceListController$PhotoGalleryProcessor;->this$0:Lcom/belkin/controller/DeviceListController;

    invoke-static {v3}, Lcom/belkin/controller/DeviceListController;->access$100(Lcom/belkin/controller/DeviceListController;)Lcom/belkin/controller/listener/PhotoRequestedListener;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 1246
    iget-object v3, p0, Lcom/belkin/controller/DeviceListController$PhotoGalleryProcessor;->this$0:Lcom/belkin/controller/DeviceListController;

    invoke-static {v3}, Lcom/belkin/controller/DeviceListController;->access$100(Lcom/belkin/controller/DeviceListController;)Lcom/belkin/controller/listener/PhotoRequestedListener;

    move-result-object v3

    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v4

    new-instance v5, Lcom/belkin/controller/DeviceListController$IconCroppedCallback;

    iget-object v6, p0, Lcom/belkin/controller/DeviceListController$PhotoGalleryProcessor;->this$0:Lcom/belkin/controller/DeviceListController;

    iget-object v7, p0, Lcom/belkin/controller/DeviceListController$PhotoGalleryProcessor;->callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-direct {v5, v6, v7}, Lcom/belkin/controller/DeviceListController$IconCroppedCallback;-><init>(Lcom/belkin/controller/DeviceListController;Lorg/apache/cordova/CallbackContext;)V

    invoke-interface {v3, v4, v5}, Lcom/belkin/controller/listener/PhotoRequestedListener;->onCropImageByUser(Landroid/net/Uri;Lcom/belkin/controller/listener/CropImageByUserCallback;)V

    .line 1252
    :cond_0
    :goto_1
    return-void

    .line 1240
    .end local v1    # "file":Ljava/io/File;
    .end local v2    # "filePath":Ljava/lang/String;
    :cond_1
    const-string v3, "Bitmap is NULL"

    goto :goto_0

    .line 1248
    .restart local v1    # "file":Ljava/io/File;
    .restart local v2    # "filePath":Ljava/lang/String;
    :cond_2
    iget-object v3, p0, Lcom/belkin/controller/DeviceListController$PhotoGalleryProcessor;->callbackContext:Lorg/apache/cordova/CallbackContext;

    if-eqz v3, :cond_0

    .line 1249
    iget-object v3, p0, Lcom/belkin/controller/DeviceListController$PhotoGalleryProcessor;->callbackContext:Lorg/apache/cordova/CallbackContext;

    new-instance v4, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v4, v5}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    invoke-virtual {v3, v4}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_1
.end method

.method public onPhotoSelectionError(Ljava/lang/String;)V
    .locals 3
    .param p1, "error"    # Ljava/lang/String;

    .prologue
    .line 1260
    const-string v0, "DeviceListController"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onPhotoSelectedError: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1261
    iget-object v0, p0, Lcom/belkin/controller/DeviceListController$PhotoGalleryProcessor;->callbackContext:Lorg/apache/cordova/CallbackContext;

    if-eqz v0, :cond_0

    .line 1262
    iget-object v0, p0, Lcom/belkin/controller/DeviceListController$PhotoGalleryProcessor;->callbackContext:Lorg/apache/cordova/CallbackContext;

    new-instance v1, Lorg/apache/cordova/PluginResult;

    sget-object v2, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v1, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 1264
    :cond_0
    return-void
.end method
