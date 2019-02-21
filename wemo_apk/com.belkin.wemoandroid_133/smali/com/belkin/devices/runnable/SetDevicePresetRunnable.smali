.class public Lcom/belkin/devices/runnable/SetDevicePresetRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "SetDevicePresetRunnable.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "SetDevicePresetRunnable"


# instance fields
.field private mCallback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

.field private mContext:Landroid/content/Context;

.field private mPresetsInfo:Lorg/json/JSONArray;


# direct methods
.method public constructor <init>(Lorg/json/JSONArray;Lcom/belkin/wemo/callback/SetAndGetActionCallBack;Landroid/content/Context;)V
    .locals 3
    .param p1, "presetsInfo"    # Lorg/json/JSONArray;
    .param p2, "callbackContext"    # Lcom/belkin/wemo/callback/SetAndGetActionCallBack;
    .param p3, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x0

    .line 22
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 17
    iput-object v0, p0, Lcom/belkin/devices/runnable/SetDevicePresetRunnable;->mCallback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    .line 18
    iput-object v0, p0, Lcom/belkin/devices/runnable/SetDevicePresetRunnable;->mPresetsInfo:Lorg/json/JSONArray;

    .line 19
    iput-object v0, p0, Lcom/belkin/devices/runnable/SetDevicePresetRunnable;->mContext:Landroid/content/Context;

    .line 23
    const-string v0, "SetDevicePresetRunnable"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "presetsInfo: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    iput-object p2, p0, Lcom/belkin/devices/runnable/SetDevicePresetRunnable;->mCallback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    .line 25
    iput-object p1, p0, Lcom/belkin/devices/runnable/SetDevicePresetRunnable;->mPresetsInfo:Lorg/json/JSONArray;

    .line 26
    iput-object p3, p0, Lcom/belkin/devices/runnable/SetDevicePresetRunnable;->mContext:Landroid/content/Context;

    .line 27
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 32
    :try_start_0
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 33
    new-instance v1, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    iget-object v2, p0, Lcom/belkin/devices/runnable/SetDevicePresetRunnable;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;-><init>(Landroid/content/Context;)V

    iget-object v2, p0, Lcom/belkin/devices/runnable/SetDevicePresetRunnable;->mPresetsInfo:Lorg/json/JSONArray;

    iget-object v3, p0, Lcom/belkin/devices/runnable/SetDevicePresetRunnable;->mCallback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    invoke-virtual {v1, v2, v3}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->setDevicePreset(Lorg/json/JSONArray;Lcom/belkin/wemo/callback/SetAndGetActionCallBack;)V

    .line 41
    :goto_0
    return-void

    .line 36
    :cond_0
    iget-object v1, p0, Lcom/belkin/devices/runnable/SetDevicePresetRunnable;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/devices/runnable/SetDevicePresetRunnable;->mPresetsInfo:Lorg/json/JSONArray;

    iget-object v3, p0, Lcom/belkin/devices/runnable/SetDevicePresetRunnable;->mCallback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    invoke-virtual {v1, v2, v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setDevicePresetCloud(Lorg/json/JSONArray;Lcom/belkin/wemo/callback/SetAndGetActionCallBack;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 38
    :catch_0
    move-exception v0

    .line 39
    .local v0, "e":Lorg/json/JSONException;
    const-string v1, "SetDevicePresetRunnable"

    const-string v2, "JSONException during set preset: "

    invoke-static {v1, v2, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
