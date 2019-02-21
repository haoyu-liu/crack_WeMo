.class public Lcom/belkin/devices/runnable/GetSensorEventRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "GetSensorEventRunnable.java"


# instance fields
.field private array:Lorg/json/JSONArray;

.field private mCallback:Lcom/belkin/devices/callback/GetSensorEventHistoryCallBack;

.field private mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;


# direct methods
.method public constructor <init>(Lcom/belkin/devices/callback/GetSensorEventHistoryCallBack;Landroid/content/Context;Lorg/json/JSONArray;)V
    .locals 1
    .param p1, "callback"    # Lcom/belkin/devices/callback/GetSensorEventHistoryCallBack;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "params"    # Lorg/json/JSONArray;

    .prologue
    const/4 v0, 0x0

    .line 18
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 13
    iput-object v0, p0, Lcom/belkin/devices/runnable/GetSensorEventRunnable;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 14
    iput-object v0, p0, Lcom/belkin/devices/runnable/GetSensorEventRunnable;->mCallback:Lcom/belkin/devices/callback/GetSensorEventHistoryCallBack;

    .line 15
    iput-object v0, p0, Lcom/belkin/devices/runnable/GetSensorEventRunnable;->array:Lorg/json/JSONArray;

    .line 19
    iput-object p1, p0, Lcom/belkin/devices/runnable/GetSensorEventRunnable;->mCallback:Lcom/belkin/devices/callback/GetSensorEventHistoryCallBack;

    .line 20
    invoke-static {p2}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/devices/runnable/GetSensorEventRunnable;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 21
    iput-object p3, p0, Lcom/belkin/devices/runnable/GetSensorEventRunnable;->array:Lorg/json/JSONArray;

    .line 22
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 26
    iget-object v0, p0, Lcom/belkin/devices/runnable/GetSensorEventRunnable;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iget-object v1, p0, Lcom/belkin/devices/runnable/GetSensorEventRunnable;->mCallback:Lcom/belkin/devices/callback/GetSensorEventHistoryCallBack;

    iget-object v2, p0, Lcom/belkin/devices/runnable/GetSensorEventRunnable;->array:Lorg/json/JSONArray;

    invoke-virtual {v0, v1, v2}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->fetchSensorEventHistory(Lcom/belkin/wemo/callback/SetAndGetActionCallBack;Lorg/json/JSONArray;)V

    .line 27
    return-void
.end method
