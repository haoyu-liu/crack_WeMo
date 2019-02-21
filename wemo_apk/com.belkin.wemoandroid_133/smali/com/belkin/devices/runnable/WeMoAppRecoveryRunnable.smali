.class public Lcom/belkin/devices/runnable/WeMoAppRecoveryRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "WeMoAppRecoveryRunnable.java"


# instance fields
.field private mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 13
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 10
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/belkin/devices/runnable/WeMoAppRecoveryRunnable;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 14
    invoke-static {p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/devices/runnable/WeMoAppRecoveryRunnable;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 15
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 19
    iget-object v0, p0, Lcom/belkin/devices/runnable/WeMoAppRecoveryRunnable;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->checkAppRecovery()V

    .line 20
    return-void
.end method
