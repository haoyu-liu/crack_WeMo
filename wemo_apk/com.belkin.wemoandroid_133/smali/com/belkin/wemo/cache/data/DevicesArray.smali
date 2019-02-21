.class public Lcom/belkin/wemo/cache/data/DevicesArray;
.super Ljava/lang/Object;
.source "DevicesArray.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "DevicesArray"

.field private static mInstance:Lcom/belkin/wemo/cache/data/DevicesArray;

.field public static productNameMapping:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static productTypeMapping:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private deviceDiscovered:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private deviceInformationList:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;"
        }
    .end annotation
.end field

.field private mActivity:Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;

.field private mContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 28
    const/4 v0, 0x0

    sput-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->mInstance:Lcom/belkin/wemo/cache/data/DevicesArray;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x0

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DevicesArray;->mActivity:Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;

    .line 36
    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DevicesArray;->mContext:Landroid/content/Context;

    .line 40
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DevicesArray;->deviceInformationList:Ljava/util/Map;

    .line 42
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DevicesArray;->deviceDiscovered:Ljava/util/HashMap;

    .line 43
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DevicesArray;->mContext:Landroid/content/Context;

    .line 44
    return-void
.end method

.method static synthetic access$000(Lcom/belkin/wemo/cache/data/DevicesArray;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/cache/data/DevicesArray;

    .prologue
    .line 25
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DevicesArray;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$100(Lcom/belkin/wemo/cache/data/DevicesArray;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/cache/data/DevicesArray;

    .prologue
    .line 25
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DevicesArray;->deviceInformationList:Ljava/util/Map;

    return-object v0
.end method

.method private deleteDevice(Ljava/lang/String;)Z
    .locals 4
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 386
    const-string v1, "DevicesArray"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Deleting device from DevicesArray. UDN: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 387
    iget-object v1, p0, Lcom/belkin/wemo/cache/data/DevicesArray;->deviceInformationList:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 389
    .local v0, "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v0, :cond_0

    .line 390
    const/4 v1, 0x1

    .line 392
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static declared-synchronized getInstance()Lcom/belkin/wemo/cache/data/DevicesArray;
    .locals 2

    .prologue
    .line 54
    const-class v0, Lcom/belkin/wemo/cache/data/DevicesArray;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/belkin/wemo/cache/data/DevicesArray;->mInstance:Lcom/belkin/wemo/cache/data/DevicesArray;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/data/DevicesArray;
    .locals 2
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 47
    const-class v1, Lcom/belkin/wemo/cache/data/DevicesArray;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->mInstance:Lcom/belkin/wemo/cache/data/DevicesArray;

    if-nez v0, :cond_0

    .line 48
    new-instance v0, Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-direct {v0, p0}, Lcom/belkin/wemo/cache/data/DevicesArray;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->mInstance:Lcom/belkin/wemo/cache/data/DevicesArray;

    .line 51
    :cond_0
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->mInstance:Lcom/belkin/wemo/cache/data/DevicesArray;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 47
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static loadProductNameMapping()Ljava/util/HashMap;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 706
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productNameMapping:Ljava/util/HashMap;

    if-nez v0, :cond_0

    .line 707
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productNameMapping:Ljava/util/HashMap;

    .line 708
    :cond_0
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productNameMapping:Ljava/util/HashMap;

    const-string v1, "AirPurifier"

    const-string v2, "AirPurifier"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 709
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productNameMapping:Ljava/util/HashMap;

    const-string v1, "BabyMonitor"

    const-string v2, "BabyMonitor"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 710
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productNameMapping:Ljava/util/HashMap;

    const-string v1, "Bridge"

    const-string v2, "Bridge"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 711
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productNameMapping:Ljava/util/HashMap;

    const-string v1, "Classic A60 RGBW"

    const-string v2, "FlexBulb"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 712
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productNameMapping:Ljava/util/HashMap;

    const-string v1, "Classic A60 TW"

    const-string v2, "ColorBulb"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 713
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productNameMapping:Ljava/util/HashMap;

    const-string v1, "CoffeeMaker"

    const-string v2, "CoffeeMaker"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 714
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productNameMapping:Ljava/util/HashMap;

    const-string v1, "Connected A-19 60W"

    const-string v2, "Lighting"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 715
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productNameMapping:Ljava/util/HashMap;

    const-string v1, "crockpot"

    const-string v2, "crockpot"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 716
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productNameMapping:Ljava/util/HashMap;

    const-string v1, "Flex RGBW"

    const-string v2, "FlexBulb"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 717
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productNameMapping:Ljava/util/HashMap;

    const-string v1, "Gardenspot RGB"

    const-string v2, "ColorBulb"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 718
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productNameMapping:Ljava/util/HashMap;

    const-string v1, "HeaterA"

    const-string v2, "Heater"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 719
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productNameMapping:Ljava/util/HashMap;

    const-string v1, "HeaterB"

    const-string v2, "Heater"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 720
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productNameMapping:Ljava/util/HashMap;

    const-string v1, "Humidifier"

    const-string v2, "Humidifier"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 721
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productNameMapping:Ljava/util/HashMap;

    const-string v1, "Insight"

    const-string v2, "Insight"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 722
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productNameMapping:Ljava/util/HashMap;

    const-string v1, "iQBR30"

    const-string v2, "Lighting"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 723
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productNameMapping:Ljava/util/HashMap;

    const-string v1, "LCT001"

    const-string v2, "Lighting"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 724
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productNameMapping:Ljava/util/HashMap;

    const-string v1, "LGDWL"

    const-string v2, "Lighting"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 725
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productNameMapping:Ljava/util/HashMap;

    const-string v1, "LIGHTIFY A19 Tunable White"

    const-string v2, "TemperatureBulb"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 726
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productNameMapping:Ljava/util/HashMap;

    const-string v1, "LIGHTIFY Flex RGBW"

    const-string v2, "FlexBulb"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 727
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productNameMapping:Ljava/util/HashMap;

    const-string v1, "LIGHTIFY Gardenspot RGB"

    const-string v2, "ColorBulb"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 728
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productNameMapping:Ljava/util/HashMap;

    const-string v1, "Lightswitch"

    const-string v2, "Lightswitch"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 729
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productNameMapping:Ljava/util/HashMap;

    const-string v1, "Dimmer"

    const-string v2, "Dimmer"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 730
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productNameMapping:Ljava/util/HashMap;

    const-string v1, "LWB004"

    const-string v2, "Lighting"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 731
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productNameMapping:Ljava/util/HashMap;

    const-string v1, "MZ100"

    const-string v2, "Lighting"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 732
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productNameMapping:Ljava/util/HashMap;

    const-string v1, "Maker"

    const-string v2, "Maker"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 733
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productNameMapping:Ljava/util/HashMap;

    const-string v1, "NetCam"

    const-string v2, "NetCam"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 734
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productNameMapping:Ljava/util/HashMap;

    const-string v1, "NetCamHDv1"

    const-string v2, "NetCamHDv1"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 735
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productNameMapping:Ljava/util/HashMap;

    const-string v1, "NetCamHDv2"

    const-string v2, "NetCamHDv2"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 736
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productNameMapping:Ljava/util/HashMap;

    const-string v1, "netcamsensor"

    const-string v2, "NetCamSensor"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 737
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productNameMapping:Ljava/util/HashMap;

    const-string v1, "Sensor"

    const-string v2, "Sensor"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 738
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productNameMapping:Ljava/util/HashMap;

    const-string v1, "smart"

    const-string v2, "smart"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 739
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productNameMapping:Ljava/util/HashMap;

    const-string v1, "Socket"

    const-string v2, "Socket"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 740
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productNameMapping:Ljava/util/HashMap;

    const-string v1, "Surface Light TW"

    const-string v2, "Lighting"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 741
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productNameMapping:Ljava/util/HashMap;

    const-string v1, "ZLL Light"

    const-string v2, "Lighting"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 742
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productNameMapping:Ljava/util/HashMap;

    const-string v1, "F7C038"

    const-string v2, "DWSensor"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 743
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productNameMapping:Ljava/util/HashMap;

    const-string v1, "F7C039"

    const-string v2, "Fob"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 744
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productNameMapping:Ljava/util/HashMap;

    const-string v1, "F7C040"

    const-string v2, "AlarmSensor"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 745
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productNameMapping:Ljava/util/HashMap;

    const-string v1, "F7C041"

    const-string v2, "PIR"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 746
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productNameMapping:Ljava/util/HashMap;

    const-string v1, "Water"

    const-string v2, "Water"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 747
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productNameMapping:Ljava/util/HashMap;

    const-string v1, "Connected A-19 60W Equivalent"

    const-string v2, "Lighting"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 749
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productNameMapping:Ljava/util/HashMap;

    return-object v0
.end method

.method public static loadProductTypeMapping()Ljava/util/HashMap;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 660
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productTypeMapping:Ljava/util/HashMap;

    if-nez v0, :cond_0

    .line 661
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productTypeMapping:Ljava/util/HashMap;

    .line 662
    :cond_0
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productTypeMapping:Ljava/util/HashMap;

    const-string v1, "AirPurifier"

    const-string v2, "AirPurifier"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 663
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productTypeMapping:Ljava/util/HashMap;

    const-string v1, "BabyMonitor"

    const-string v2, "BabyMonitor"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 664
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productTypeMapping:Ljava/util/HashMap;

    const-string v1, "Bridge"

    const-string v2, "Bridge"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 665
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productTypeMapping:Ljava/util/HashMap;

    const-string v1, "Classic A60 RGBW"

    const-string v2, "Lighting"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 666
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productTypeMapping:Ljava/util/HashMap;

    const-string v1, "Classic A60 TW"

    const-string v2, "Lighting"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 667
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productTypeMapping:Ljava/util/HashMap;

    const-string v1, "CoffeeMaker"

    const-string v2, "CoffeeMaker"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 668
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productTypeMapping:Ljava/util/HashMap;

    const-string v1, "Connected A-19 60W"

    const-string v2, "Lighting"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 669
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productTypeMapping:Ljava/util/HashMap;

    const-string v1, "crockpot"

    const-string v2, "crockpot"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 670
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productTypeMapping:Ljava/util/HashMap;

    const-string v1, "Flex RGBW"

    const-string v2, "Lighting"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 671
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productTypeMapping:Ljava/util/HashMap;

    const-string v1, "Gardenspot RGB"

    const-string v2, "Lighting"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 672
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productTypeMapping:Ljava/util/HashMap;

    const-string v1, "HeaterA"

    const-string v2, "Heater"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 673
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productTypeMapping:Ljava/util/HashMap;

    const-string v1, "HeaterB"

    const-string v2, "Heater"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 674
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productTypeMapping:Ljava/util/HashMap;

    const-string v1, "Humidifier"

    const-string v2, "Humidifier"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 675
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productTypeMapping:Ljava/util/HashMap;

    const-string v1, "Insight"

    const-string v2, "Insight"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 676
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productTypeMapping:Ljava/util/HashMap;

    const-string v1, "iQBR30"

    const-string v2, "Lighting"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 677
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productTypeMapping:Ljava/util/HashMap;

    const-string v1, "LCT001"

    const-string v2, "Lighting"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 678
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productTypeMapping:Ljava/util/HashMap;

    const-string v1, "LGDWL"

    const-string v2, "Lighting"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 679
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productTypeMapping:Ljava/util/HashMap;

    const-string v1, "LIGHTIFY A19 Tunable White"

    const-string v2, "Lighting"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 680
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productTypeMapping:Ljava/util/HashMap;

    const-string v1, "LIGHTIFY Flex RGBW"

    const-string v2, "Lighting"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 681
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productTypeMapping:Ljava/util/HashMap;

    const-string v1, "LIGHTIFY Gardenspot RGB"

    const-string v2, "Lighting"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 682
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productTypeMapping:Ljava/util/HashMap;

    const-string v1, "Lightswitch"

    const-string v2, "Lightswitch"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 683
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productTypeMapping:Ljava/util/HashMap;

    const-string v1, "Dimmer"

    const-string v2, "Dimmer"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 684
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productTypeMapping:Ljava/util/HashMap;

    const-string v1, "LWB004"

    const-string v2, "Lighting"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 685
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productTypeMapping:Ljava/util/HashMap;

    const-string v1, "MZ100"

    const-string v2, "Lighting"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 686
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productTypeMapping:Ljava/util/HashMap;

    const-string v1, "Maker"

    const-string v2, "Maker"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 687
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productTypeMapping:Ljava/util/HashMap;

    const-string v1, "NetCam"

    const-string v2, "NetCam"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 688
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productTypeMapping:Ljava/util/HashMap;

    const-string v1, "NetCamHDv1"

    const-string v2, "NetCam"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 689
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productTypeMapping:Ljava/util/HashMap;

    const-string v1, "NetCamHDv2"

    const-string v2, "NetCam"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 690
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productTypeMapping:Ljava/util/HashMap;

    const-string v1, "netcamsensor"

    const-string v2, "NetCam"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 691
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productTypeMapping:Ljava/util/HashMap;

    const-string v1, "Sensor"

    const-string v2, "Sensor"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 692
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productTypeMapping:Ljava/util/HashMap;

    const-string v1, "smart"

    const-string v2, "smart"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 693
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productTypeMapping:Ljava/util/HashMap;

    const-string v1, "Socket"

    const-string v2, "Socket"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 694
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productTypeMapping:Ljava/util/HashMap;

    const-string v1, "Surface Light TW"

    const-string v2, "Lighting"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 695
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productTypeMapping:Ljava/util/HashMap;

    const-string v1, "ZLL Light"

    const-string v2, "Lighting"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 696
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productTypeMapping:Ljava/util/HashMap;

    const-string v1, "F7C038"

    const-string v2, "Sensor"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 697
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productTypeMapping:Ljava/util/HashMap;

    const-string v1, "F7C039"

    const-string v2, "Sensor"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 698
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productTypeMapping:Ljava/util/HashMap;

    const-string v1, "F7C040"

    const-string v2, "Sensor"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 699
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productTypeMapping:Ljava/util/HashMap;

    const-string v1, "F7C041"

    const-string v2, "Sensor"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 700
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productTypeMapping:Ljava/util/HashMap;

    const-string v1, "Water"

    const-string v2, "Water"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 701
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productTypeMapping:Ljava/util/HashMap;

    const-string v1, "Connected A-19 60W Equivalent"

    const-string v2, "Lighting"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 702
    sget-object v0, Lcom/belkin/wemo/cache/data/DevicesArray;->productTypeMapping:Ljava/util/HashMap;

    return-object v0
.end method

.method private setDeviceInfoParameters(Lcom/belkin/wemo/cache/data/DeviceInformation;Lcom/belkin/wemo/cache/devicelist/WeMoDevice;)V
    .locals 2
    .param p1, "devInfo"    # Lcom/belkin/wemo/cache/data/DeviceInformation;
    .param p2, "dev"    # Lcom/belkin/wemo/cache/devicelist/WeMoDevice;

    .prologue
    .line 286
    sget-boolean v0, Lcom/belkin/wemo/cache/utils/Constants;->IS_DEMOAPP:Z

    if-eqz v0, :cond_0

    .line 287
    invoke-virtual {p2}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getDiscoveryState()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setDiscoveryState(Ljava/lang/String;)V

    .line 288
    invoke-virtual {p2}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getStartDiscoveryTime()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setStartDiscoveryTime(J)V

    .line 289
    invoke-virtual {p2}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getEndDiscoveryTime()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setEndDiscoveryTime(J)V

    .line 290
    invoke-virtual {p2}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getCheckingStatus()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setCheckingStatus(Ljava/lang/String;)V

    .line 292
    invoke-virtual {p2}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getTimestamp()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setTimestamp(Ljava/lang/String;)V

    .line 293
    invoke-virtual {p2}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getLastTimestamp()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setLastTimestamp(Ljava/lang/String;)V

    .line 295
    :cond_0
    invoke-virtual {p2}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getInActive()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setInActive(I)V

    .line 296
    invoke-virtual {p2}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getInActive()I

    move-result v0

    if-nez v0, :cond_5

    .line 297
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIsDiscovered(Z)V

    .line 300
    :goto_0
    invoke-virtual {p2}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getMac()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setMAC(Ljava/lang/String;)V

    .line 301
    invoke-virtual {p2}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getPluginID()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setPluginId(Ljava/lang/String;)V

    .line 302
    invoke-virtual {p2}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getLogoURL()Ljava/lang/String;

    move-result-object v0

    const-string v1, "data"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p2}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getLogoURL()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 303
    :cond_1
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIP()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getPort()I

    move-result v0

    if-lez v0, :cond_2

    .line 304
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIP()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getPort()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/icon.jpg"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->setLogoURL(Ljava/lang/String;)V

    .line 306
    invoke-virtual {p2}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getLogoURL()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIconURL(Ljava/lang/String;)V

    .line 309
    :cond_2
    if-eqz p1, :cond_4

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIcon()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_4

    if-eqz p2, :cond_4

    invoke-virtual {p2}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getLogo()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 311
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIcon()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getLogo()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    invoke-virtual {p2}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getLogo()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    .line 313
    invoke-virtual {p2}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getLogo()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIcon(Ljava/lang/String;)V

    .line 316
    :cond_3
    :try_start_0
    invoke-virtual {p2}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getState()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setState(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 323
    :cond_4
    :goto_1
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 324
    return-void

    .line 299
    :cond_5
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIsDiscovered(Z)V

    goto/16 :goto_0

    .line 318
    :catch_0
    move-exception v0

    goto :goto_1
.end method


# virtual methods
.method public declared-synchronized addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V
    .locals 1
    .param p1, "dev"    # Lcom/belkin/wemo/cache/data/DeviceInformation;

    .prologue
    .line 327
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/cache/data/DevicesArray;->updateDeviceInformationList(Lcom/belkin/wemo/cache/data/DeviceInformation;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 328
    monitor-exit p0

    return-void

    .line 327
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized clearAll()V
    .locals 2

    .prologue
    .line 610
    monitor-enter p0

    :try_start_0
    const-string v0, "DevicesArray"

    const-string v1, "Clearing all DeviceInformation objects and their respective discoveries from DevicesArray."

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 611
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DevicesArray;->deviceInformationList:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 613
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/data/DevicesArray;->clearDeviceDiscoveries()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 614
    monitor-exit p0

    return-void

    .line 610
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized clearAllDiscoveryTime()V
    .locals 4

    .prologue
    .line 629
    monitor-enter p0

    :try_start_0
    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DevicesArray;->deviceInformationList:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 630
    .local v0, "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    const-wide/16 v2, 0x0

    invoke-virtual {v0, v2, v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setStartDiscoveryTime(J)V

    .line 631
    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DevicesArray;->deviceInformationList:Ljava/util/Map;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 629
    .end local v0    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v1    # "i$":Ljava/util/Iterator;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 633
    .restart local v1    # "i$":Ljava/util/Iterator;
    :cond_0
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized clearDeviceDiscoveries()V
    .locals 1

    .prologue
    .line 495
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DevicesArray;->deviceDiscovered:Ljava/util/HashMap;

    if-eqz v0, :cond_0

    .line 496
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DevicesArray;->deviceDiscovered:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 498
    :cond_0
    monitor-exit p0

    return-void

    .line 495
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized deleteDeviceInformation(Ljava/lang/String;)Z
    .locals 1
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 382
    monitor-enter p0

    :try_start_0
    invoke-direct {p0, p1}, Lcom/belkin/wemo/cache/data/DevicesArray;->deleteDevice(Ljava/lang/String;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized deleteDevicesInGroup(Ljava/lang/String;)Ljava/util/List;
    .locals 6
    .param p1, "groupId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 396
    monitor-enter p0

    :try_start_0
    const-string v3, "DevicesArray"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Deleting devices, from Device List, with GroupID: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 397
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 399
    .local v2, "macList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v3, p0, Lcom/belkin/wemo/cache/data/DevicesArray;->deviceInformationList:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 400
    .local v1, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;>;>;"
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 401
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 402
    .local v0, "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getGroupID()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 403
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    .line 404
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getMAC()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 405
    const-string v3, "DevicesArray"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Device containing groupID has been removed. UDN: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ". Total devices removed yet: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 396
    .end local v0    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v1    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;>;>;"
    .end local v2    # "macList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3

    .line 408
    .restart local v1    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;>;>;"
    .restart local v2    # "macList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_1
    monitor-exit p0

    return-object v2
.end method

.method public declared-synchronized deleteWeMoDevice(Ljava/lang/String;)Z
    .locals 1
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 378
    monitor-enter p0

    :try_start_0
    invoke-direct {p0, p1}, Lcom/belkin/wemo/cache/data/DevicesArray;->deleteDevice(Ljava/lang/String;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getActiveDeviceInfoList()Ljava/util/ArrayList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;"
        }
    .end annotation

    .prologue
    .line 597
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 598
    .local v2, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    iget-object v3, p0, Lcom/belkin/wemo/cache/data/DevicesArray;->deviceInformationList:Ljava/util/Map;

    if-nez v3, :cond_0

    .line 599
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    iput-object v3, p0, Lcom/belkin/wemo/cache/data/DevicesArray;->deviceInformationList:Ljava/util/Map;

    .line 601
    :cond_0
    iget-object v3, p0, Lcom/belkin/wemo/cache/data/DevicesArray;->deviceInformationList:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 602
    .local v0, "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_1

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIsDiscovered()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getInActive()I

    move-result v3

    if-nez v3, :cond_1

    .line 603
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 606
    .end local v0    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_2
    return-object v2
.end method

.method public declared-synchronized getDeviceDiscovered(Ljava/lang/String;)Z
    .locals 3
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 484
    monitor-enter p0

    const/4 v0, 0x0

    .line 485
    .local v0, "isDiscovered":Z
    :try_start_0
    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DevicesArray;->deviceDiscovered:Ljava/util/HashMap;

    if-eqz v2, :cond_0

    .line 486
    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DevicesArray;->deviceDiscovered:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    .line 487
    .local v1, "isDiscoveredObj":Ljava/lang/Boolean;
    if-eqz v1, :cond_0

    .line 488
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    .line 491
    .end local v1    # "isDiscoveredObj":Ljava/lang/Boolean;
    :cond_0
    monitor-exit p0

    return v0

    .line 484
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized getDeviceInformation(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;
    .locals 1
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 444
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DevicesArray;->deviceInformationList:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/cache/data/DeviceInformation;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getDeviceInformationArrayList()Ljava/util/ArrayList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;"
        }
    .end annotation

    .prologue
    .line 535
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 537
    .local v2, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    iget-object v3, p0, Lcom/belkin/wemo/cache/data/DevicesArray;->deviceInformationList:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 538
    .local v0, "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 541
    .end local v0    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_0
    return-object v2
.end method

.method public declared-synchronized getDeviceInformationList()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;"
        }
    .end annotation

    .prologue
    .line 550
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DevicesArray;->deviceInformationList:Ljava/util/Map;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getDevicesInGroup(Ljava/lang/String;)Ljava/util/List;
    .locals 6
    .param p1, "groupId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 412
    const-string v3, "DevicesArray"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Get devices, from Device List, with GroupID: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 413
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 415
    .local v2, "macList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v3, p0, Lcom/belkin/wemo/cache/data/DevicesArray;->deviceInformationList:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 416
    .local v1, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;>;>;"
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 417
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 418
    .local v0, "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getGroupID()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 419
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getMAC()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 420
    const-string v3, "DevicesArray"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Device containing groupID has been added. UDN: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ". Total devices added yet: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 423
    .end local v0    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_1
    return-object v2
.end method

.method public getDiscoveredDeviceList()Ljava/util/HashMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .prologue
    .line 554
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DevicesArray;->deviceDiscovered:Ljava/util/HashMap;

    return-object v0
.end method

.method public declared-synchronized removeDiscoveredDevice(Ljava/lang/String;)Z
    .locals 3
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 473
    monitor-enter p0

    const/4 v0, 0x0

    .line 474
    .local v0, "isRemoved":Z
    :try_start_0
    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DevicesArray;->deviceDiscovered:Ljava/util/HashMap;

    if-eqz v2, :cond_0

    .line 475
    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DevicesArray;->deviceDiscovered:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    .line 476
    .local v1, "isRemovedObj":Ljava/lang/Boolean;
    if-eqz v1, :cond_0

    .line 477
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    .line 480
    .end local v1    # "isRemovedObj":Ljava/lang/Boolean;
    :cond_0
    monitor-exit p0

    return v0

    .line 473
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public setCallbackListener(Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;)V
    .locals 0
    .param p1, "act"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;

    .prologue
    .line 57
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DevicesArray;->mActivity:Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;

    .line 58
    return-void
.end method

.method public setDeviceDiscovered(Ljava/lang/String;Z)V
    .locals 3
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "discovered"    # Z

    .prologue
    .line 448
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DevicesArray;->deviceDiscovered:Ljava/util/HashMap;

    if-nez v0, :cond_0

    .line 449
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DevicesArray;->deviceDiscovered:Ljava/util/HashMap;

    .line 451
    :cond_0
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 452
    const-string v0, "DevicesArray"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Adding DEVICE DISCOVERED: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 453
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DevicesArray;->deviceDiscovered:Ljava/util/HashMap;

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 469
    :cond_1
    return-void
.end method

.method public declared-synchronized setDeviceHTML(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "devUdn"    # Ljava/lang/String;
    .param p2, "devHTML"    # Ljava/lang/String;

    .prologue
    .line 636
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/belkin/wemo/cache/data/DevicesArray;->deviceInformationList:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 637
    .local v0, "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual {v0, p2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setHtml(Ljava/lang/String;)V

    .line 638
    iget-object v1, p0, Lcom/belkin/wemo/cache/data/DevicesArray;->deviceInformationList:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 639
    monitor-exit p0

    return-void

    .line 636
    .end local v0    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public setDeviceInactive(Ljava/lang/String;)V
    .locals 2
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 642
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceInformation(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    .line 643
    .local v0, "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setInActive(I)V

    .line 644
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIsDiscovered(Z)V

    .line 645
    invoke-virtual {p0, v0}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 646
    return-void
.end method

.method public declared-synchronized updateDeviceCache(Lcom/belkin/wemo/cache/data/DeviceInformation;Z)V
    .locals 2
    .param p1, "dev"    # Lcom/belkin/wemo/cache/data/DeviceInformation;
    .param p2, "needUpdateIcon"    # Z

    .prologue
    .line 202
    monitor-enter p0

    if-nez p1, :cond_0

    .line 243
    :goto_0
    monitor-exit p0

    return-void

    .line 206
    :cond_0
    :try_start_0
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 207
    const-string v0, "DevicesArray"

    const-string v1, "updateDeviceCache() - DeviceInformation: Empty/Null UDN found."

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 202
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 211
    :cond_1
    :try_start_1
    sget-boolean v0, Lcom/belkin/wemo/cache/utils/Constants;->IS_DEMOAPP:Z

    if-eqz v0, :cond_2

    .line 212
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getDiscoveryState()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setDiscoveryState(Ljava/lang/String;)V

    .line 213
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getStartDiscoveryTime()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setStartDiscoveryTime(J)V

    .line 214
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getEndDiscoveryTime()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setEndDiscoveryTime(J)V

    .line 215
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getCheckingStatus()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setCheckingStatus(Ljava/lang/String;)V

    .line 217
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getTimestamp()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setTimestamp(Ljava/lang/String;)V

    .line 218
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getLastTimestamp()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setLastTimestamp(Ljava/lang/String;)V

    .line 220
    :cond_2
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getInActive()I

    move-result v0

    if-nez v0, :cond_7

    .line 221
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIsDiscovered(Z)V

    .line 225
    :goto_1
    if-eqz p2, :cond_3

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIconURL()Ljava/lang/String;

    move-result-object v0

    const-string v1, "data"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4

    :cond_3
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIconURL()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 226
    :cond_4
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIP()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_5

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getPort()I

    move-result v0

    if-lez v0, :cond_5

    .line 227
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIP()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getPort()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/icon.jpg"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIconURL(Ljava/lang/String;)V

    .line 232
    :cond_5
    if-eqz p2, :cond_6

    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v0

    if-nez v0, :cond_6

    .line 233
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/cache/data/DevicesArray;->updateIconRemote(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 236
    :cond_6
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    goto/16 :goto_0

    .line 223
    :cond_7
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIsDiscovered(Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1
.end method

.method public updateDeviceInformationList(Lcom/belkin/wemo/cache/data/DeviceInformation;)V
    .locals 4
    .param p1, "dev"    # Lcom/belkin/wemo/cache/data/DeviceInformation;

    .prologue
    .line 557
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v0

    .line 558
    .local v0, "udn":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 559
    const-string v1, "DevicesArray"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Updating DeviceInformation object in DevicesArray. UDN: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 560
    iget-object v1, p0, Lcom/belkin/wemo/cache/data/DevicesArray;->deviceInformationList:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 564
    :goto_0
    return-void

    .line 562
    :cond_0
    const-string v1, "DevicesArray"

    const-string v2, "updateDeviceInformationList(): Empty/Null UDN found."

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public declared-synchronized updateFriendlyName(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 514
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceInformation(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    .line 515
    .local v0, "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v0, :cond_0

    .line 516
    invoke-virtual {v0, p2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setFriendlyName(Ljava/lang/String;)V

    .line 517
    invoke-virtual {p0, v0}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 519
    :cond_0
    monitor-exit p0

    return-void

    .line 514
    .end local v0    # "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public updateIcon(Lcom/belkin/wemo/cache/devicelist/WeMoDevice;)V
    .locals 2
    .param p1, "dev"    # Lcom/belkin/wemo/cache/devicelist/WeMoDevice;

    .prologue
    .line 245
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/belkin/wemo/cache/data/DevicesArray$1;

    invoke-direct {v1, p0, p1}, Lcom/belkin/wemo/cache/data/DevicesArray$1;-><init>(Lcom/belkin/wemo/cache/data/DevicesArray;Lcom/belkin/wemo/cache/devicelist/WeMoDevice;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 271
    return-void
.end method

.method public updateIconRemote(Lcom/belkin/wemo/cache/data/DeviceInformation;)V
    .locals 6
    .param p1, "dev"    # Lcom/belkin/wemo/cache/data/DeviceInformation;

    .prologue
    .line 274
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getMAC()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_0

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getMAC()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    .line 275
    const-string v3, "DevicesArray"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "updateIconRemote: Downloading remote icon for device: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 276
    iget-object v3, p0, Lcom/belkin/wemo/cache/data/DevicesArray;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v0

    .line 277
    .local v0, "devMgr":Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    new-instance v1, Lcom/belkin/wemo/cache/cloud/CloudRequestGetIcon;

    invoke-direct {v1, v0, p1}, Lcom/belkin/wemo/cache/cloud/CloudRequestGetIcon;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 278
    .local v1, "req":Lcom/belkin/wemo/cache/cloud/CloudRequestGetIcon;
    new-instance v2, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    iget-object v3, p0, Lcom/belkin/wemo/cache/data/DevicesArray;->mContext:Landroid/content/Context;

    invoke-direct {v2, v3}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    .line 279
    .local v2, "rm":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    invoke-virtual {v2, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeByteStreamRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    .line 282
    .end local v0    # "devMgr":Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    .end local v1    # "req":Lcom/belkin/wemo/cache/cloud/CloudRequestGetIcon;
    .end local v2    # "rm":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    :cond_0
    return-void
.end method
