.class Lcom/belkin/controller/DeviceListController$CameraPictureProcessor;
.super Ljava/lang/Object;
.source "DeviceListController.java"

# interfaces
.implements Lcom/belkin/controller/listener/TakePictureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/controller/DeviceListController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CameraPictureProcessor"
.end annotation


# instance fields
.field private callbackContext:Lorg/apache/cordova/CallbackContext;

.field final synthetic this$0:Lcom/belkin/controller/DeviceListController;


# direct methods
.method constructor <init>(Lcom/belkin/controller/DeviceListController;Lorg/apache/cordova/CallbackContext;)V
    .locals 0
    .param p2, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 1309
    iput-object p1, p0, Lcom/belkin/controller/DeviceListController$CameraPictureProcessor;->this$0:Lcom/belkin/controller/DeviceListController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1310
    iput-object p2, p0, Lcom/belkin/controller/DeviceListController$CameraPictureProcessor;->callbackContext:Lorg/apache/cordova/CallbackContext;

    .line 1311
    return-void
.end method


# virtual methods
.method public onPictureTaken(Landroid/net/Uri;)V
    .locals 9
    .param p1, "iconUri"    # Landroid/net/Uri;

    .prologue
    .line 1319
    :try_start_0
    const-string v4, "DeviceListController"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "EDIT ICON: onPictureTaken: Original Bitmap stored in file: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1321
    sget-object v4, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v4, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getIconFromUriForCrop(Landroid/net/Uri;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 1322
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    const-string v5, "DeviceListController"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "EDIT ICON: onPictureTaken: Size of bitmap after Picture Taken: "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getByteCount()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    :goto_0
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v5, v4}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1324
    sget-object v4, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v4, p1, v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->rotateCameraIcon(Landroid/net/Uri;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 1327
    sget-object v4, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v4, v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->saveEditedIcon(Landroid/graphics/Bitmap;)Ljava/lang/String;

    move-result-object v3

    .line 1328
    .local v3, "filePath":Ljava/lang/String;
    const-string v4, "DeviceListController"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "EDIT ICON: onPictureTaken: bitmap save temporarily to loc: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1329
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1330
    .local v2, "file":Ljava/io/File;
    iget-object v4, p0, Lcom/belkin/controller/DeviceListController$CameraPictureProcessor;->this$0:Lcom/belkin/controller/DeviceListController;

    invoke-static {v4}, Lcom/belkin/controller/DeviceListController;->access$100(Lcom/belkin/controller/DeviceListController;)Lcom/belkin/controller/listener/PhotoRequestedListener;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 1331
    iget-object v4, p0, Lcom/belkin/controller/DeviceListController$CameraPictureProcessor;->this$0:Lcom/belkin/controller/DeviceListController;

    invoke-static {v4}, Lcom/belkin/controller/DeviceListController;->access$100(Lcom/belkin/controller/DeviceListController;)Lcom/belkin/controller/listener/PhotoRequestedListener;

    move-result-object v4

    invoke-static {v2}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v5

    new-instance v6, Lcom/belkin/controller/DeviceListController$IconCroppedCallback;

    iget-object v7, p0, Lcom/belkin/controller/DeviceListController$CameraPictureProcessor;->this$0:Lcom/belkin/controller/DeviceListController;

    iget-object v8, p0, Lcom/belkin/controller/DeviceListController$CameraPictureProcessor;->callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-direct {v6, v7, v8}, Lcom/belkin/controller/DeviceListController$IconCroppedCallback;-><init>(Lcom/belkin/controller/DeviceListController;Lorg/apache/cordova/CallbackContext;)V

    invoke-interface {v4, v5, v6}, Lcom/belkin/controller/listener/PhotoRequestedListener;->onCropImageByUser(Landroid/net/Uri;Lcom/belkin/controller/listener/CropImageByUserCallback;)V

    .line 1340
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v2    # "file":Ljava/io/File;
    .end local v3    # "filePath":Ljava/lang/String;
    :cond_0
    :goto_1
    return-void

    .line 1322
    .restart local v0    # "bitmap":Landroid/graphics/Bitmap;
    :cond_1
    const-string v4, "Bitmap is NULL"

    goto :goto_0

    .line 1333
    .restart local v2    # "file":Ljava/io/File;
    .restart local v3    # "filePath":Ljava/lang/String;
    :cond_2
    iget-object v4, p0, Lcom/belkin/controller/DeviceListController$CameraPictureProcessor;->callbackContext:Lorg/apache/cordova/CallbackContext;

    if-eqz v4, :cond_0

    .line 1334
    iget-object v4, p0, Lcom/belkin/controller/DeviceListController$CameraPictureProcessor;->callbackContext:Lorg/apache/cordova/CallbackContext;

    new-instance v5, Lorg/apache/cordova/PluginResult;

    sget-object v6, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v5, v6}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    invoke-virtual {v4, v5}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 1337
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v2    # "file":Ljava/io/File;
    .end local v3    # "filePath":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 1338
    .local v1, "ex":Ljava/lang/Exception;
    iget-object v4, p0, Lcom/belkin/controller/DeviceListController$CameraPictureProcessor;->callbackContext:Lorg/apache/cordova/CallbackContext;

    new-instance v5, Lorg/apache/cordova/PluginResult;

    sget-object v6, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v5, v6}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    invoke-virtual {v4, v5}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_1
.end method

.method public onTakePictureError(Ljava/lang/String;)V
    .locals 3
    .param p1, "error"    # Ljava/lang/String;

    .prologue
    .line 1348
    const-string v0, "DeviceListController"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onTakePictureError: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1349
    iget-object v0, p0, Lcom/belkin/controller/DeviceListController$CameraPictureProcessor;->callbackContext:Lorg/apache/cordova/CallbackContext;

    new-instance v1, Lorg/apache/cordova/PluginResult;

    sget-object v2, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v1, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 1350
    return-void
.end method
