.class public Lcom/belkin/widgets/WidgetUtil;
.super Ljava/lang/Object;
.source "WidgetUtil.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 28
    const-class v0, Lcom/belkin/widgets/WidgetUtil;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/widgets/WidgetUtil;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addWidgetIdToMapping(Landroid/content/Context;Ljava/lang/String;I)V
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "deviceId"    # Ljava/lang/String;
    .param p2, "widgetId"    # I

    .prologue
    .line 130
    new-instance v0, Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-direct {v0, p0}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    .line 131
    .local v0, "prefs":Lcom/belkin/wemo/cache/utils/SharePreferences;
    invoke-virtual {v0, p1}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getWidgetIdSet(Ljava/lang/String;)Ljava/util/Set;

    move-result-object v1

    .line 132
    .local v1, "widgetIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    if-nez v1, :cond_0

    .line 133
    new-instance v1, Ljava/util/HashSet;

    .end local v1    # "widgetIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 135
    .restart local v1    # "widgetIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_0
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 136
    invoke-virtual {v0, p1, v1}, Lcom/belkin/wemo/cache/utils/SharePreferences;->storeWidgetIdSet(Ljava/lang/String;Ljava/util/Set;)V

    .line 137
    return-void
.end method

.method private static buildWidgetProviderIntent(Ljava/lang/String;I)Landroid/content/Intent;
    .locals 2
    .param p0, "action"    # Ljava/lang/String;
    .param p1, "widgetId"    # I

    .prologue
    .line 250
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 251
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {v0, p0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 252
    const-string v1, "appWidgetId"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 253
    return-object v0
.end method

.method private static buildWidgetProviderIntentFilter()Landroid/content/IntentFilter;
    .locals 2

    .prologue
    .line 242
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "stateUpdating"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 243
    .local v0, "intentFilter":Landroid/content/IntentFilter;
    const-string v1, "refreshState"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 244
    const-string v1, "automaticUpdate"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 245
    return-object v0
.end method

.method public static convertIntArrayToStringList([I)Ljava/util/List;
    .locals 6
    .param p0, "values"    # [I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([I)",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 200
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 201
    .local v3, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    move-object v0, p0

    .local v0, "arr$":[I
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_0

    aget v4, v0, v1

    .line 202
    .local v4, "value":I
    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 201
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 204
    .end local v4    # "value":I
    :cond_0
    return-object v3
.end method

.method public static generateGroupedDeviceList(Ljava/util/List;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;"
        }
    .end annotation

    .prologue
    .line 32
    .local p0, "ungroupedList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    if-eqz p0, :cond_3

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_3

    .line 33
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 34
    .local v0, "groupedDeviceMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 35
    .local v2, "info":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual {v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/belkin/wemo/cache/utils/IsDevice;->Bridge(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 36
    sget-object v3, Lcom/belkin/widgets/WidgetUtil;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Discovered device ignored since it is an LED bridge: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 37
    :cond_0
    invoke-virtual {v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getGroupID()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 38
    invoke-virtual {v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 40
    :cond_1
    invoke-virtual {v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getGroupID()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 43
    .end local v2    # "info":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_2
    new-instance p0, Ljava/util/ArrayList;

    .end local p0    # "ungroupedList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-direct {p0, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 45
    .end local v0    # "groupedDeviceMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_3
    return-object p0
.end method

.method public static getDefaultDeviceIcon(Landroid/content/Context;Lcom/belkin/wemo/cache/data/DeviceInformation;)Landroid/graphics/drawable/Drawable;
    .locals 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "device"    # Lcom/belkin/wemo/cache/data/DeviceInformation;

    .prologue
    .line 69
    const-string v2, "www/img/new_icons/"

    .line 70
    .local v2, "icon":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/belkin/wemo/cache/utils/IsDevice;->WeMoSwitch(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 71
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "WeMo_Switch_Old_@3x.png"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 98
    :goto_0
    const/4 v0, 0x0

    .line 100
    .local v0, "drawable":Landroid/graphics/drawable/Drawable;
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3

    const/4 v4, 0x0

    invoke-static {v3, v4}, Landroid/graphics/drawable/Drawable;->createFromStream(Ljava/io/InputStream;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 104
    :goto_1
    return-object v0

    .line 72
    .end local v0    # "drawable":Landroid/graphics/drawable/Drawable;
    :cond_0
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/belkin/wemo/cache/utils/IsDevice;->LightSocket(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/belkin/wemo/cache/utils/IsDevice;->Dimmer(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 73
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "WeMo_LightSwitch_@3x.png"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 74
    :cond_2
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/belkin/wemo/cache/utils/IsDevice;->Insight(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 75
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "WeMo_Insight_Switch_@3x.png"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 76
    :cond_3
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/belkin/wemo/cache/utils/IsDevice;->NonSmartMaker(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 77
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "WeMo_Maker_@3x.png"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 78
    :cond_4
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/belkin/wemo/cache/utils/IsDevice;->Crockpot(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 79
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "CrockPot_SlowCooker_@3x.png"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_0

    .line 80
    :cond_5
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/belkin/wemo/cache/utils/IsDevice;->Heater(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 81
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "HolmesBionaire_Heater_@3x.png"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_0

    .line 82
    :cond_6
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/belkin/wemo/cache/utils/IsDevice;->Humidifier(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 83
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "Holmes_Console_Humidifier_@3x.png"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_0

    .line 84
    :cond_7
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/belkin/wemo/cache/utils/IsDevice;->AirPurifier(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 85
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "HolmesBionaire_AirPurifier_@3x.png"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_0

    .line 86
    :cond_8
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/belkin/wemo/cache/utils/IsDevice;->CoffeeMaker(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 87
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "MrCoffee_Machine_@3x.png"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_0

    .line 88
    :cond_9
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/belkin/wemo/cache/utils/IsDevice;->NetCam(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_a

    .line 89
    const-string v2, "www/img/ic_netcam_HD.png"

    goto/16 :goto_0

    .line 90
    :cond_a
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/belkin/wemo/cache/utils/IsDevice;->MotionSensor(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_b

    .line 91
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "WeMo_Motion_@3x.png"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_0

    .line 92
    :cond_b
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/belkin/wemo/cache/utils/IsDevice;->NestThermostat(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_c

    .line 93
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "Nest_@3x.png"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_0

    .line 95
    :cond_c
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "WeMo_LightBulb_@3x.png"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_0

    .line 101
    .restart local v0    # "drawable":Landroid/graphics/drawable/Drawable;
    :catch_0
    move-exception v1

    .line 102
    .local v1, "e":Ljava/io/IOException;
    sget-object v3, Lcom/belkin/widgets/WidgetUtil;->TAG:Ljava/lang/String;

    const-string v4, "IOException while attempting to load default icon from assets: "

    invoke-static {v3, v4, v1}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_1
.end method

.method public static getDeviceInformation(Lcom/belkin/controller/WidgetController;Lcom/belkin/widgets/WidgetData;)Lcom/belkin/wemo/cache/data/DeviceInformation;
    .locals 1
    .param p0, "controller"    # Lcom/belkin/controller/WidgetController;
    .param p1, "widgetData"    # Lcom/belkin/widgets/WidgetData;

    .prologue
    .line 166
    invoke-virtual {p1}, Lcom/belkin/widgets/WidgetData;->isGroup()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 167
    invoke-virtual {p1}, Lcom/belkin/widgets/WidgetData;->getId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/belkin/controller/WidgetController;->getDeviceFromGroup(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    .line 169
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p1}, Lcom/belkin/widgets/WidgetData;->getId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/belkin/controller/WidgetController;->getDevice(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    goto :goto_0
.end method

.method public static getDeviceInformation(Lcom/belkin/controller/WidgetController;Lcom/belkin/widgets/WidgetData;Lcom/belkin/controller/WidgetGetDeviceCallback;)V
    .locals 1
    .param p0, "controller"    # Lcom/belkin/controller/WidgetController;
    .param p1, "widgetData"    # Lcom/belkin/widgets/WidgetData;
    .param p2, "callback"    # Lcom/belkin/controller/WidgetGetDeviceCallback;

    .prologue
    .line 158
    invoke-virtual {p1}, Lcom/belkin/widgets/WidgetData;->isGroup()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 159
    invoke-virtual {p1}, Lcom/belkin/widgets/WidgetData;->getId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lcom/belkin/controller/WidgetController;->getDeviceFromGroup(Ljava/lang/String;Lcom/belkin/controller/WidgetGetDeviceCallback;)V

    .line 163
    :goto_0
    return-void

    .line 161
    :cond_0
    invoke-virtual {p1}, Lcom/belkin/widgets/WidgetData;->getId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lcom/belkin/controller/WidgetController;->getDevice(Ljava/lang/String;Lcom/belkin/controller/WidgetGetDeviceCallback;)V

    goto :goto_0
.end method

.method public static getFirstSupportedDeviceIndex(Ljava/util/List;)I
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;)I"
        }
    .end annotation

    .prologue
    .line 49
    .local p0, "devices":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    const/4 v2, -0x1

    .line 50
    .local v2, "index":I
    if-eqz p0, :cond_1

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_1

    .line 51
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v3

    if-ge v1, v3, :cond_1

    .line 52
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 53
    .local v0, "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v0, :cond_0

    invoke-static {v0}, Lcom/belkin/widgets/WidgetUtil;->supportsWidgets(Lcom/belkin/wemo/cache/data/DeviceInformation;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 58
    .end local v0    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v1    # "i":I
    :goto_1
    return v1

    .line 51
    .restart local v0    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .restart local v1    # "i":I
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .end local v0    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v1    # "i":I
    :cond_1
    move v1, v2

    .line 58
    goto :goto_1
.end method

.method public static getLightLevelString(Lcom/belkin/widgets/WidgetData;)Ljava/lang/String;
    .locals 4
    .param p0, "data"    # Lcom/belkin/widgets/WidgetData;

    .prologue
    .line 227
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcom/belkin/widgets/WidgetData;->getLightLevel()I

    move-result v0

    if-gez v0, :cond_1

    :cond_0
    const-string v0, ""

    :goto_0
    return-object v0

    :cond_1
    const-string v0, "%d%%"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {p0}, Lcom/belkin/widgets/WidgetData;->getLightLevel()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static getProviderClassForWidget(Landroid/content/Context;I)Ljava/lang/Class;
    .locals 9
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "widgetId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "I)",
            "Ljava/lang/Class",
            "<+",
            "Lcom/belkin/widgets/WemoWidgetProvider;",
            ">;"
        }
    .end annotation

    .prologue
    .line 208
    invoke-static {p0}, Landroid/appwidget/AppWidgetManager;->getInstance(Landroid/content/Context;)Landroid/appwidget/AppWidgetManager;

    move-result-object v1

    .line 209
    .local v1, "manager":Landroid/appwidget/AppWidgetManager;
    invoke-virtual {v1, p1}, Landroid/appwidget/AppWidgetManager;->getAppWidgetInfo(I)Landroid/appwidget/AppWidgetProviderInfo;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 210
    invoke-virtual {v1, p1}, Landroid/appwidget/AppWidgetManager;->getAppWidgetInfo(I)Landroid/appwidget/AppWidgetProviderInfo;

    move-result-object v4

    iget-object v4, v4, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    invoke-virtual {v4}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v3

    .line 211
    .local v3, "providerClassName":Ljava/lang/String;
    const-class v2, Lcom/belkin/widgets/WemoOneByOneWidgetProvider;

    .line 214
    .local v2, "providerClass":Ljava/lang/Class;
    :try_start_0
    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 223
    .end local v2    # "providerClass":Ljava/lang/Class;
    .end local v3    # "providerClassName":Ljava/lang/String;
    :goto_0
    return-object v2

    .line 215
    .restart local v2    # "providerClass":Ljava/lang/Class;
    .restart local v3    # "providerClassName":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 217
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    sget-object v4, Lcom/belkin/widgets/WidgetUtil;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "WidgetProvider class not found: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 222
    .end local v0    # "e":Ljava/lang/ClassNotFoundException;
    .end local v2    # "providerClass":Ljava/lang/Class;
    .end local v3    # "providerClassName":Ljava/lang/String;
    :cond_0
    sget-object v4, Lcom/belkin/widgets/WidgetUtil;->TAG:Ljava/lang/String;

    const-string v5, "getProviderClassForWidget -- WidgetProvider class cannot be found for widgetId: %d"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 223
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static getWidgetDataFromId(Landroid/content/Context;I)Lcom/belkin/widgets/WidgetData;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "widgetId"    # I

    .prologue
    .line 113
    new-instance v1, Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-direct {v1, p0}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    .line 114
    .local v1, "prefs":Lcom/belkin/wemo/cache/utils/SharePreferences;
    invoke-virtual {v1, p1}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getWidgetData(I)Ljava/lang/String;

    move-result-object v0

    .line 116
    .local v0, "deviceStr":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 117
    sget-object v2, Lcom/belkin/widgets/WidgetUtil;->TAG:Ljava/lang/String;

    invoke-static {v2, v0}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    new-instance v2, Lcom/belkin/widgets/WidgetData;

    invoke-direct {v2, v0}, Lcom/belkin/widgets/WidgetData;-><init>(Ljava/lang/String;)V

    .line 121
    :goto_0
    return-object v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static getWidgetIdSet(Landroid/content/Context;Ljava/lang/String;)Ljava/util/Set;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "deviceId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 140
    new-instance v0, Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-direct {v0, p0}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    .line 141
    .local v0, "prefs":Lcom/belkin/wemo/cache/utils/SharePreferences;
    invoke-virtual {v0, p1}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getWidgetIdSet(Ljava/lang/String;)Ljava/util/Set;

    move-result-object v1

    return-object v1
.end method

.method public static removeWidgetData(Landroid/content/Context;I)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "widgetId"    # I

    .prologue
    .line 125
    new-instance v0, Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-direct {v0, p0}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    .line 126
    .local v0, "prefs":Lcom/belkin/wemo/cache/utils/SharePreferences;
    invoke-virtual {v0, p1}, Lcom/belkin/wemo/cache/utils/SharePreferences;->removeWidgetData(I)V

    .line 127
    return-void
.end method

.method public static removeWidgetIdMapping(Landroid/content/Context;Ljava/lang/String;I)V
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "deviceId"    # Ljava/lang/String;
    .param p2, "widgetId"    # I

    .prologue
    .line 145
    new-instance v0, Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-direct {v0, p0}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    .line 146
    .local v0, "prefs":Lcom/belkin/wemo/cache/utils/SharePreferences;
    invoke-virtual {v0, p1}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getWidgetIdSet(Ljava/lang/String;)Ljava/util/Set;

    move-result-object v1

    .line 147
    .local v1, "widgetIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    if-eqz v1, :cond_0

    .line 148
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 149
    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v2

    if-nez v2, :cond_1

    .line 150
    invoke-virtual {v0, p1}, Lcom/belkin/wemo/cache/utils/SharePreferences;->removeWidgetIdSet(Ljava/lang/String;)V

    .line 155
    :cond_0
    :goto_0
    return-void

    .line 152
    :cond_1
    invoke-virtual {v0, p1, v1}, Lcom/belkin/wemo/cache/utils/SharePreferences;->storeWidgetIdSet(Ljava/lang/String;Ljava/util/Set;)V

    goto :goto_0
.end method

.method private static sendBroadcast(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/Intent;Landroid/content/IntentFilter;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "receiver"    # Landroid/content/BroadcastReceiver;
    .param p2, "intent"    # Landroid/content/Intent;
    .param p3, "intentFilter"    # Landroid/content/IntentFilter;

    .prologue
    .line 234
    invoke-static {p0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v0

    .line 235
    .local v0, "broadcastManager":Landroid/support/v4/content/LocalBroadcastManager;
    invoke-virtual {v0, p1, p3}, Landroid/support/v4/content/LocalBroadcastManager;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    .line 236
    invoke-virtual {v0, p2}, Landroid/support/v4/content/LocalBroadcastManager;->sendBroadcast(Landroid/content/Intent;)Z

    .line 237
    invoke-virtual {v0, p1}, Landroid/support/v4/content/LocalBroadcastManager;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 238
    return-void
.end method

.method public static sendWidgetBroadcast(Landroid/content/Context;Ljava/lang/String;I)V
    .locals 9
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "widgetId"    # I

    .prologue
    const/4 v5, 0x3

    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 183
    invoke-static {p0, p2}, Lcom/belkin/widgets/WidgetUtil;->getProviderClassForWidget(Landroid/content/Context;I)Ljava/lang/Class;

    move-result-object v2

    .line 184
    .local v2, "widgetProviderClass":Ljava/lang/Class;
    if-eqz v2, :cond_0

    .line 186
    :try_start_0
    invoke-virtual {v2}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/BroadcastReceiver;

    .line 187
    .local v1, "receiver":Landroid/content/BroadcastReceiver;
    invoke-static {p1, p2}, Lcom/belkin/widgets/WidgetUtil;->buildWidgetProviderIntent(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v3

    invoke-static {}, Lcom/belkin/widgets/WidgetUtil;->buildWidgetProviderIntentFilter()Landroid/content/IntentFilter;

    move-result-object v4

    invoke-static {p0, v1, v3, v4}, Lcom/belkin/widgets/WidgetUtil;->sendBroadcast(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/Intent;Landroid/content/IntentFilter;)V
    :try_end_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1

    .line 197
    .end local v1    # "receiver":Landroid/content/BroadcastReceiver;
    :goto_0
    return-void

    .line 188
    :catch_0
    move-exception v0

    .line 189
    .local v0, "e":Ljava/lang/InstantiationException;
    sget-object v3, Lcom/belkin/widgets/WidgetUtil;->TAG:Ljava/lang/String;

    const-string v4, "sendWidgetBroadcast -- InstantiationException when trying to instantiate BroadcastReceiver for action, widgetId, widget provider class: %s, %d, %s"

    new-array v5, v5, [Ljava/lang/Object;

    aput-object p1, v5, v6

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-virtual {v2}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v8

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 190
    .end local v0    # "e":Ljava/lang/InstantiationException;
    :catch_1
    move-exception v0

    .line 191
    .local v0, "e":Ljava/lang/IllegalAccessException;
    sget-object v3, Lcom/belkin/widgets/WidgetUtil;->TAG:Ljava/lang/String;

    const-string v4, "sendWidgetBroadcast -- IllegalAccessException when trying to instantiate BroadcastReceiver for action, widgetId, widget provider class: %s, %d, %s"

    new-array v5, v5, [Ljava/lang/Object;

    aput-object p1, v5, v6

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-virtual {v2}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v8

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 195
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :cond_0
    sget-object v3, Lcom/belkin/widgets/WidgetUtil;->TAG:Ljava/lang/String;

    const-string v4, "sendWidgetBroadcast -- WidgetProvider class cannot be found for action, widgetId: %s, %d"

    new-array v5, v8, [Ljava/lang/Object;

    aput-object p1, v5, v6

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static setDeviceOrGroupState(Lcom/belkin/controller/WidgetController;Lcom/belkin/widgets/WidgetData;Lcom/belkin/wemo/cache/data/DeviceInformation;I)V
    .locals 3
    .param p0, "controller"    # Lcom/belkin/controller/WidgetController;
    .param p1, "widgetData"    # Lcom/belkin/widgets/WidgetData;
    .param p2, "deviceInformation"    # Lcom/belkin/wemo/cache/data/DeviceInformation;
    .param p3, "state"    # I

    .prologue
    .line 175
    invoke-virtual {p1}, Lcom/belkin/widgets/WidgetData;->isGroup()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 176
    invoke-virtual {p2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getGroupID()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getBridgeUDN()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1, p3}, Lcom/belkin/controller/WidgetController;->setGroupState(Ljava/lang/String;Ljava/lang/String;I)V

    .line 180
    :goto_0
    return-void

    .line 178
    :cond_0
    invoke-virtual {p1}, Lcom/belkin/widgets/WidgetData;->getId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getCapabilities()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v0, p3, v1, v2}, Lcom/belkin/controller/WidgetController;->setDeviceState(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static storeWidgetData(Landroid/content/Context;ILcom/belkin/widgets/WidgetData;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "widgetId"    # I
    .param p2, "updatedData"    # Lcom/belkin/widgets/WidgetData;

    .prologue
    .line 108
    new-instance v0, Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-direct {v0, p0}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    .line 109
    .local v0, "prefs":Lcom/belkin/wemo/cache/utils/SharePreferences;
    invoke-virtual {p2}, Lcom/belkin/widgets/WidgetData;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcom/belkin/wemo/cache/utils/SharePreferences;->storeWidgetData(ILjava/lang/String;)V

    .line 110
    return-void
.end method

.method public static supportsWidgets(Lcom/belkin/wemo/cache/data/DeviceInformation;)Z
    .locals 1
    .param p0, "device"    # Lcom/belkin/wemo/cache/data/DeviceInformation;

    .prologue
    .line 63
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/belkin/wemo/cache/utils/IsDevice;->WeMoSwitch(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/belkin/wemo/cache/utils/IsDevice;->Insight(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/belkin/wemo/cache/utils/IsDevice;->LightSocket(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/belkin/wemo/cache/utils/IsDevice;->NonSmartMaker(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/belkin/wemo/cache/utils/IsDevice;->Dimmer(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getBridgeUDN()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
