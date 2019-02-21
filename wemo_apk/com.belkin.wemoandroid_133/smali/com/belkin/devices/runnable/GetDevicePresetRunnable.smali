.class public Lcom/belkin/devices/runnable/GetDevicePresetRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "GetDevicePresetRunnable.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "GetDevicePresetRunnable"


# instance fields
.field private mCallback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

.field private mContext:Landroid/content/Context;

.field private mPresetsInfo:Lorg/json/JSONArray;

.field private mUpNpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;


# direct methods
.method public constructor <init>(Lorg/json/JSONArray;Lcom/belkin/wemo/callback/SetAndGetActionCallBack;Landroid/content/Context;)V
    .locals 3
    .param p1, "presetsInfo"    # Lorg/json/JSONArray;
    .param p2, "callbackContext"    # Lcom/belkin/wemo/callback/SetAndGetActionCallBack;
    .param p3, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x0

    .line 23
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 17
    iput-object v0, p0, Lcom/belkin/devices/runnable/GetDevicePresetRunnable;->mCallback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    .line 18
    iput-object v0, p0, Lcom/belkin/devices/runnable/GetDevicePresetRunnable;->mUpNpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    .line 19
    iput-object v0, p0, Lcom/belkin/devices/runnable/GetDevicePresetRunnable;->mPresetsInfo:Lorg/json/JSONArray;

    .line 20
    iput-object v0, p0, Lcom/belkin/devices/runnable/GetDevicePresetRunnable;->mContext:Landroid/content/Context;

    .line 24
    const-string v0, "GetDevicePresetRunnable"

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

    .line 25
    iput-object p2, p0, Lcom/belkin/devices/runnable/GetDevicePresetRunnable;->mCallback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    .line 26
    new-instance v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    invoke-direct {v0, p3}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/belkin/devices/runnable/GetDevicePresetRunnable;->mUpNpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    .line 27
    iput-object p1, p0, Lcom/belkin/devices/runnable/GetDevicePresetRunnable;->mPresetsInfo:Lorg/json/JSONArray;

    .line 28
    iput-object p3, p0, Lcom/belkin/devices/runnable/GetDevicePresetRunnable;->mContext:Landroid/content/Context;

    .line 29
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 34
    :try_start_0
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 35
    iget-object v1, p0, Lcom/belkin/devices/runnable/GetDevicePresetRunnable;->mUpNpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    iget-object v2, p0, Lcom/belkin/devices/runnable/GetDevicePresetRunnable;->mPresetsInfo:Lorg/json/JSONArray;

    iget-object v3, p0, Lcom/belkin/devices/runnable/GetDevicePresetRunnable;->mCallback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    invoke-virtual {v1, v2, v3}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getDevicePreset(Lorg/json/JSONArray;Lcom/belkin/wemo/callback/SetAndGetActionCallBack;)V

    .line 43
    :goto_0
    return-void

    .line 38
    :cond_0
    iget-object v1, p0, Lcom/belkin/devices/runnable/GetDevicePresetRunnable;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/devices/runnable/GetDevicePresetRunnable;->mPresetsInfo:Lorg/json/JSONArray;

    iget-object v3, p0, Lcom/belkin/devices/runnable/GetDevicePresetRunnable;->mCallback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    invoke-virtual {v1, v2, v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDevicePresetCloud(Lorg/json/JSONArray;Lcom/belkin/wemo/callback/SetAndGetActionCallBack;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 40
    :catch_0
    move-exception v0

    .line 41
    .local v0, "e":Lorg/json/JSONException;
    const-string v1, "GetDevicePresetRunnable"

    const-string v2, "JSONException during get preset: "

    invoke-static {v1, v2, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
