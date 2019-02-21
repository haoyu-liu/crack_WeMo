.class public interface abstract Lcom/belkin/wemo/cache/zigbee/IFetchZigBeeDevicesCallback;
.super Ljava/lang/Object;
.source "IFetchZigBeeDevicesCallback.java"


# virtual methods
.method public abstract onZigBeeDevicesFetchError(Lcom/belkin/wemo/error/WeMoError;)V
.end method

.method public abstract onZigBeeDevicesFetched(Ljava/util/Map;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;)V"
        }
    .end annotation
.end method
