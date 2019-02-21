.class public interface abstract Lcom/belkin/wemo/cache/cloud/DeviceReachabilityTester$IDeviceReachabilityListener;
.super Ljava/lang/Object;
.source "DeviceReachabilityTester.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/cache/cloud/DeviceReachabilityTester;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "IDeviceReachabilityListener"
.end annotation


# virtual methods
.method public abstract onDeviceNotReachable()V
.end method

.method public abstract onDeviceReachable()V
.end method
