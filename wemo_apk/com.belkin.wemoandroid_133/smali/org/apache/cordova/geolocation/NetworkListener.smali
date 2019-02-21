.class public Lorg/apache/cordova/geolocation/NetworkListener;
.super Lorg/apache/cordova/geolocation/CordovaLocationListener;
.source "NetworkListener.java"


# direct methods
.method public constructor <init>(Landroid/location/LocationManager;Lorg/apache/cordova/geolocation/GeoBroker;)V
    .locals 1
    .param p1, "locationManager"    # Landroid/location/LocationManager;
    .param p2, "m"    # Lorg/apache/cordova/geolocation/GeoBroker;

    .prologue
    .line 31
    const-string v0, "[Cordova NetworkListener]"

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/cordova/geolocation/CordovaLocationListener;-><init>(Landroid/location/LocationManager;Lorg/apache/cordova/geolocation/GeoBroker;Ljava/lang/String;)V

    .line 32
    return-void
.end method
