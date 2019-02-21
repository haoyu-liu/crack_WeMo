.class public Lcom/belkin/wemo/cache/utils/IsDevice;
.super Ljava/lang/Object;
.source "IsDevice.java"


# static fields
.field private static final AIR_PURIFIER:Ljava/lang/String; = "AirPurifier"

.field private static final BRIDGE:Ljava/lang/String; = "Bridge"

.field private static final COFFEE_MAKER:Ljava/lang/String; = "CoffeeMaker"

.field private static final CONTROLLEE:Ljava/lang/String; = "Controllee"

.field private static final CROCKPOT:Ljava/lang/String; = "Crockpot"

.field private static final DIMMER:Ljava/lang/String; = "Dimmer"

.field private static final HEATER:Ljava/lang/String; = "Heater"

.field private static final HUMIDIFIER:Ljava/lang/String; = "Humidifier"

.field private static final INSIGHT:Ljava/lang/String; = "Insight"

.field private static final LIGHTSWITCH:Ljava/lang/String; = "Lightswitch"

.field private static final LIGHT_SWITCH:Ljava/lang/String; = "LightSocket"

.field private static final MAKER:Ljava/lang/String; = "Maker"

.field private static final MOTION_SENSOR:Ljava/lang/String; = "Sensor"

.field private static final NESTTHERMOSTAT:Ljava/lang/String; = "WEMO"

.field private static final NETCAM:Ljava/lang/String; = "NetCam"

.field private static final SWITCH:Ljava/lang/String; = "Socket"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static AirPurifier(Ljava/lang/String;)Z
    .locals 1
    .param p0, "udn"    # Ljava/lang/String;

    .prologue
    .line 83
    if-eqz p0, :cond_0

    const-string v0, "AirPurifier"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 84
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static Bridge(Ljava/lang/String;)Z
    .locals 1
    .param p0, "udn"    # Ljava/lang/String;

    .prologue
    .line 28
    if-eqz p0, :cond_0

    const-string v0, "Bridge"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 29
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static CoffeeMaker(Ljava/lang/String;)Z
    .locals 1
    .param p0, "udn"    # Ljava/lang/String;

    .prologue
    .line 89
    if-eqz p0, :cond_0

    const-string v0, "CoffeeMaker"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 90
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static Crockpot(Ljava/lang/String;)Z
    .locals 1
    .param p0, "udn"    # Ljava/lang/String;

    .prologue
    .line 106
    if-eqz p0, :cond_0

    const-string v0, "Crockpot"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 107
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static Dimmer(Ljava/lang/String;)Z
    .locals 1
    .param p0, "udn"    # Ljava/lang/String;

    .prologue
    .line 48
    if-eqz p0, :cond_0

    const-string v0, "Dimmer"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 49
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static Heater(Ljava/lang/String;)Z
    .locals 1
    .param p0, "udn"    # Ljava/lang/String;

    .prologue
    .line 71
    if-eqz p0, :cond_0

    const-string v0, "Heater"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 72
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static Humidifier(Ljava/lang/String;)Z
    .locals 1
    .param p0, "udn"    # Ljava/lang/String;

    .prologue
    .line 77
    if-eqz p0, :cond_0

    const-string v0, "Humidifier"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 78
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static Insight(Ljava/lang/String;)Z
    .locals 1
    .param p0, "udn"    # Ljava/lang/String;

    .prologue
    .line 38
    if-eqz p0, :cond_0

    const-string v0, "Insight"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 39
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static InvisibleInList(Ljava/lang/String;)Z
    .locals 1
    .param p0, "udn"    # Ljava/lang/String;

    .prologue
    .line 117
    if-eqz p0, :cond_0

    invoke-static {p0}, Lcom/belkin/wemo/cache/utils/IsDevice;->Bridge(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 119
    const/4 v0, 0x1

    .line 122
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static LightSocket(Ljava/lang/String;)Z
    .locals 1
    .param p0, "udn"    # Ljava/lang/String;

    .prologue
    .line 54
    if-eqz p0, :cond_0

    const-string v0, "Lightswitch"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 55
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static LightSwitch(Ljava/lang/String;)Z
    .locals 1
    .param p0, "udn"    # Ljava/lang/String;

    .prologue
    .line 43
    if-eqz p0, :cond_0

    const-string v0, "LightSocket"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 44
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static Maker(Ljava/lang/String;)Z
    .locals 1
    .param p0, "udn"    # Ljava/lang/String;

    .prologue
    .line 33
    if-eqz p0, :cond_0

    const-string v0, "Maker"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 34
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static MotionSensor(Ljava/lang/String;)Z
    .locals 1
    .param p0, "udn"    # Ljava/lang/String;

    .prologue
    .line 95
    if-eqz p0, :cond_0

    const-string v0, "Sensor"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 96
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static NestThermostat(Ljava/lang/String;)Z
    .locals 1
    .param p0, "udn"    # Ljava/lang/String;

    .prologue
    .line 111
    if-eqz p0, :cond_0

    const-string v0, "WEMO"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 112
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static NetCam(Ljava/lang/String;)Z
    .locals 1
    .param p0, "udn"    # Ljava/lang/String;

    .prologue
    .line 23
    if-eqz p0, :cond_0

    const-string v0, "NetCam"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 24
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static NonSmartMaker(Ljava/lang/String;)Z
    .locals 1
    .param p0, "udn"    # Ljava/lang/String;

    .prologue
    .line 101
    invoke-static {p0}, Lcom/belkin/wemo/cache/utils/IsDevice;->Maker(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p0}, Lcom/belkin/wemo/cache/utils/IsDevice;->CoffeeMaker(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    .line 102
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static Smart(Ljava/lang/String;)Z
    .locals 1
    .param p0, "udn"    # Ljava/lang/String;

    .prologue
    .line 126
    const-string v0, "Heater"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Humidifier"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "AirPurifier"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "CoffeeMaker"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 129
    :cond_0
    const/4 v0, 0x1

    .line 131
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static Switch(Ljava/lang/String;)Z
    .locals 1
    .param p0, "udn"    # Ljava/lang/String;

    .prologue
    .line 59
    if-eqz p0, :cond_0

    const-string v0, "Socket"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 60
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static WeMoSwitch(Ljava/lang/String;)Z
    .locals 1
    .param p0, "udn"    # Ljava/lang/String;

    .prologue
    .line 65
    if-eqz p0, :cond_1

    const-string v0, "Socket"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Controllee"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    .line 66
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
