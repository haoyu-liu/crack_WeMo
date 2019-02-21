.class public Lcom/belkin/devices/runnable/GetSensorEventsFromDBRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "GetSensorEventsFromDBRunnable.java"


# instance fields
.field private mCallback:Lcom/belkin/devices/callback/GetSensorEventFromDBCallBack;

.field private mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;


# direct methods
.method public constructor <init>(Lcom/belkin/devices/callback/GetSensorEventFromDBCallBack;Landroid/content/Context;)V
    .locals 1
    .param p1, "callback"    # Lcom/belkin/devices/callback/GetSensorEventFromDBCallBack;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x0

    .line 15
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 11
    iput-object v0, p0, Lcom/belkin/devices/runnable/GetSensorEventsFromDBRunnable;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 12
    iput-object v0, p0, Lcom/belkin/devices/runnable/GetSensorEventsFromDBRunnable;->mCallback:Lcom/belkin/devices/callback/GetSensorEventFromDBCallBack;

    .line 16
    iput-object p1, p0, Lcom/belkin/devices/runnable/GetSensorEventsFromDBRunnable;->mCallback:Lcom/belkin/devices/callback/GetSensorEventFromDBCallBack;

    .line 17
    invoke-static {p2}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/devices/runnable/GetSensorEventsFromDBRunnable;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 18
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 22
    iget-object v0, p0, Lcom/belkin/devices/runnable/GetSensorEventsFromDBRunnable;->mCallback:Lcom/belkin/devices/callback/GetSensorEventFromDBCallBack;

    iget-object v1, p0, Lcom/belkin/devices/runnable/GetSensorEventsFromDBRunnable;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->fetchSensorEventHistoryFromDB()Lorg/json/JSONArray;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/belkin/devices/callback/GetSensorEventFromDBCallBack;->onSuccess(Lorg/json/JSONArray;)V

    .line 23
    return-void
.end method
