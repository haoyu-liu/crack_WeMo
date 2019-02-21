.class public interface abstract Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable$onMSearchDeviceProcessedListener;
.super Ljava/lang/Object;
.source "MSearchDeviceAddedRunnable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "onMSearchDeviceProcessedListener"
.end annotation


# virtual methods
.method public abstract onMSearchProcessingDone(Lcom/belkin/wemo/cache/data/DeviceInformation;)V
.end method

.method public abstract onMSearchProcessingFailed(Ljava/lang/String;)V
.end method
