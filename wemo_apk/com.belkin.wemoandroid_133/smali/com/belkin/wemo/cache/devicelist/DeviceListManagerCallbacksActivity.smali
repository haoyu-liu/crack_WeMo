.class public interface abstract Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;
.super Ljava/lang/Object;
.source "DeviceListManagerCallbacksActivity.java"


# virtual methods
.method public abstract mustRestartApp()V
.end method

.method public abstract onDeviceAdded(Lcom/belkin/wemo/cache/data/DeviceInformation;)V
.end method

.method public abstract onDeviceRemoved(Ljava/lang/String;)V
.end method

.method public abstract onDeviceUpdated(Lcom/belkin/wemo/cache/data/DeviceInformation;)V
.end method

.method public abstract onIconUpdate(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract onZigBeeDeviceAdded(Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;)V
.end method

.method public abstract onZigBeeDeviceUpdated(Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;)V
.end method
