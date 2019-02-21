.class public Lcom/belkin/wemo/cache/utils/MoreUtil;
.super Ljava/lang/Object;
.source "MoreUtil.java"


# static fields
.field public static final APPVERSIONCODE:Ljava/lang/String; = "appVersionCode"

.field public static final APPVERSIONNAME:Ljava/lang/String; = "appVersionName"

.field private static AirPurifierFlag:Z = false

.field private static ClassicA60TWFlag:Z = false

.field private static CoffeeMakerFlag:Z = false

.field public static final DEVICEMODELNAME:Ljava/lang/String; = "deviceModelName"

.field public static final DEVICEUSERINFO:Ljava/lang/String; = "deviceUserInfo"

.field private static FlexRGBWFlag:Z = false

.field private static GardenspotRGBFlag:Z = false

.field private static HeaterAFlag:Z = false

.field private static HeaterBFlag:Z = false

.field private static HumidifierBFlag:Z = false

.field private static HumidifierFlag:Z = false

.field public static final TAG:Ljava/lang/String; = "MoreUtil"

.field private static bridgewwFlag:Z

.field private static bulbWWflag:Z

.field private static euFlag:Z

.field private static insightFlag:Z

.field private static lightFlag:Z

.field private static makerFlag:Z

.field private static openWRTAirPurifier:Z

.field private static openWRTCoffeeMaker:Z

.field private static openWRTHeaterA:Z

.field private static openWRTHeaterB:Z

.field private static openWRTHumidifier:Z

.field private static openWRTHumidifierB:Z

.field private static openWRTInsightV2:Z

.field private static openWRTMaker:Z

.field private static openWRTSNS:Z

.field private static openWRTSlowCooker:Z

.field private static openWRTTransAirPurifier:Z

.field private static openWRTTransCoffeeMaker:Z

.field private static openWRTTransHeaterA:Z

.field private static openWRTTransHeaterB:Z

.field private static openWRTTransHumidifier:Z

.field private static openWRTTransHumidifierB:Z

.field private static openWRTTransMaker:Z

.field private static openWRTTransSNS:Z

.field private static openWRTTransSlowCooker:Z

.field private static openWRTTransinsight:Z

.field private static openWRTTranslight:Z

.field private static openWRTTranssmart:Z

.field private static openWRTinsight:Z

.field private static openWRTlight:Z

.field private static openWRTsmart:Z

.field private static signedInsightFlag:Z

.field private static signedLightFlag:Z

.field private static signedMakerFlag:Z

.field private static signedeuFlag:Z

.field private static signedusFlag:Z

.field private static slowcookerUSFlag:Z

.field private static usFlag:Z

.field private static wemoSmartFlag:Z


# instance fields
.field private packageInfo:Landroid/content/pm/PackageInfo;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 45
    sput-boolean v0, Lcom/belkin/wemo/cache/utils/MoreUtil;->bridgewwFlag:Z

    .line 46
    sput-boolean v0, Lcom/belkin/wemo/cache/utils/MoreUtil;->usFlag:Z

    .line 47
    sput-boolean v0, Lcom/belkin/wemo/cache/utils/MoreUtil;->euFlag:Z

    .line 48
    sput-boolean v0, Lcom/belkin/wemo/cache/utils/MoreUtil;->lightFlag:Z

    .line 49
    sput-boolean v0, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTlight:Z

    .line 50
    sput-boolean v0, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTTranslight:Z

    .line 51
    sput-boolean v0, Lcom/belkin/wemo/cache/utils/MoreUtil;->insightFlag:Z

    .line 52
    sput-boolean v0, Lcom/belkin/wemo/cache/utils/MoreUtil;->signedInsightFlag:Z

    .line 53
    sput-boolean v0, Lcom/belkin/wemo/cache/utils/MoreUtil;->signedusFlag:Z

    .line 54
    sput-boolean v0, Lcom/belkin/wemo/cache/utils/MoreUtil;->signedeuFlag:Z

    .line 55
    sput-boolean v0, Lcom/belkin/wemo/cache/utils/MoreUtil;->signedLightFlag:Z

    .line 56
    sput-boolean v0, Lcom/belkin/wemo/cache/utils/MoreUtil;->slowcookerUSFlag:Z

    .line 58
    sput-boolean v0, Lcom/belkin/wemo/cache/utils/MoreUtil;->signedMakerFlag:Z

    .line 60
    sput-boolean v0, Lcom/belkin/wemo/cache/utils/MoreUtil;->wemoSmartFlag:Z

    .line 61
    sput-boolean v0, Lcom/belkin/wemo/cache/utils/MoreUtil;->makerFlag:Z

    .line 62
    sput-boolean v0, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTinsight:Z

    .line 63
    sput-boolean v0, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTTransinsight:Z

    .line 64
    sput-boolean v0, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTSNS:Z

    .line 65
    sput-boolean v0, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTTransSNS:Z

    .line 66
    sput-boolean v0, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTSlowCooker:Z

    .line 67
    sput-boolean v0, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTTransSlowCooker:Z

    .line 69
    sput-boolean v0, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTsmart:Z

    .line 71
    sput-boolean v0, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTTranssmart:Z

    .line 72
    sput-boolean v0, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTMaker:Z

    .line 73
    sput-boolean v0, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTTransMaker:Z

    .line 74
    sput-boolean v0, Lcom/belkin/wemo/cache/utils/MoreUtil;->bulbWWflag:Z

    .line 75
    sput-boolean v0, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTInsightV2:Z

    .line 76
    sput-boolean v0, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTTransHumidifier:Z

    .line 77
    sput-boolean v0, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTHumidifier:Z

    .line 78
    sput-boolean v0, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTTransHumidifierB:Z

    .line 79
    sput-boolean v0, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTHumidifierB:Z

    .line 80
    sput-boolean v0, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTTransHeaterA:Z

    .line 81
    sput-boolean v0, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTHeaterA:Z

    .line 82
    sput-boolean v0, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTTransHeaterB:Z

    .line 83
    sput-boolean v0, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTHeaterB:Z

    .line 84
    sput-boolean v0, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTTransAirPurifier:Z

    .line 85
    sput-boolean v0, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTAirPurifier:Z

    .line 86
    sput-boolean v0, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTTransCoffeeMaker:Z

    .line 87
    sput-boolean v0, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTCoffeeMaker:Z

    .line 88
    sput-boolean v0, Lcom/belkin/wemo/cache/utils/MoreUtil;->HeaterAFlag:Z

    .line 89
    sput-boolean v0, Lcom/belkin/wemo/cache/utils/MoreUtil;->HeaterBFlag:Z

    .line 90
    sput-boolean v0, Lcom/belkin/wemo/cache/utils/MoreUtil;->CoffeeMakerFlag:Z

    .line 91
    sput-boolean v0, Lcom/belkin/wemo/cache/utils/MoreUtil;->HumidifierFlag:Z

    .line 92
    sput-boolean v0, Lcom/belkin/wemo/cache/utils/MoreUtil;->HumidifierBFlag:Z

    .line 93
    sput-boolean v0, Lcom/belkin/wemo/cache/utils/MoreUtil;->AirPurifierFlag:Z

    .line 94
    sput-boolean v0, Lcom/belkin/wemo/cache/utils/MoreUtil;->GardenspotRGBFlag:Z

    .line 95
    sput-boolean v0, Lcom/belkin/wemo/cache/utils/MoreUtil;->ClassicA60TWFlag:Z

    .line 96
    sput-boolean v0, Lcom/belkin/wemo/cache/utils/MoreUtil;->FlexRGBWFlag:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private capitalize(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 305
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_2

    .line 306
    :cond_0
    const-string p1, ""

    .line 312
    .end local p1    # "s":Ljava/lang/String;
    :cond_1
    :goto_0
    return-object p1

    .line 308
    .restart local p1    # "s":Ljava/lang/String;
    :cond_2
    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 309
    .local v0, "first":C
    invoke-static {v0}, Ljava/lang/Character;->isUpperCase(C)Z

    move-result v1

    if-nez v1, :cond_1

    .line 312
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v0}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0
.end method

.method public static changeAttributes(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "content"    # Ljava/lang/String;

    .prologue
    .line 399
    const-string v0, "Switch"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "switch"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 400
    :cond_0
    const-string p0, "Switch"

    .line 408
    :cond_1
    :goto_0
    return-object p0

    .line 401
    :cond_2
    const-string v0, "Sensor"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    const-string v0, "sensor"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 402
    :cond_3
    const-string p0, "Sensor"

    goto :goto_0

    .line 403
    :cond_4
    const-string v0, "SwitchMode"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    const-string v0, "switchMode"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 404
    :cond_5
    const-string p0, "SwitchMode"

    goto :goto_0

    .line 405
    :cond_6
    const-string v0, "SensorPresent"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7

    const-string v0, "sensorPresent"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 406
    :cond_7
    const-string p0, "SensorPresent"

    goto :goto_0
.end method

.method private resetFieldValue(Ljava/lang/String;)Z
    .locals 7
    .param p1, "fieldName"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 1401
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_1

    :cond_0
    move v2, v3

    .line 1423
    :goto_0
    return v2

    .line 1404
    :cond_1
    :try_start_0
    const-class v4, Lcom/belkin/wemo/cache/utils/MoreUtil;

    invoke-virtual {v4, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 1405
    .local v1, "field":Ljava/lang/reflect/Field;
    const/4 v4, 0x1

    invoke-virtual {v1, v4}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 1406
    if-eqz v1, :cond_2

    .line 1407
    const-string v4, ""

    sget-object v5, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    invoke-virtual {v1, v4, v5}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    .line 1408
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object p1

    .line 1409
    const-string v4, "MoreUtil"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "fieldvalureset"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_2

    goto :goto_0

    .line 1413
    .end local v1    # "field":Ljava/lang/reflect/Field;
    :catch_0
    move-exception v0

    .line 1415
    .local v0, "e":Ljava/lang/NoSuchFieldException;
    invoke-virtual {v0}, Ljava/lang/NoSuchFieldException;->printStackTrace()V

    .end local v0    # "e":Ljava/lang/NoSuchFieldException;
    :cond_2
    :goto_1
    move v2, v3

    .line 1423
    goto :goto_0

    .line 1416
    :catch_1
    move-exception v0

    .line 1418
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_1

    .line 1419
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_2
    move-exception v0

    .line 1421
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->printStackTrace()V

    goto :goto_1
.end method

.method private setFieldValue(Ljava/lang/String;)Z
    .locals 7
    .param p1, "fieldName"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 1432
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_1

    :cond_0
    move v2, v3

    .line 1454
    :goto_0
    return v2

    .line 1435
    :cond_1
    :try_start_0
    const-class v4, Lcom/belkin/wemo/cache/utils/MoreUtil;

    invoke-virtual {v4, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 1436
    .local v1, "field":Ljava/lang/reflect/Field;
    const/4 v4, 0x1

    invoke-virtual {v1, v4}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 1437
    if-eqz v1, :cond_2

    .line 1438
    const-string v4, ""

    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    invoke-virtual {v1, v4, v5}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    .line 1439
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object p1

    .line 1440
    const-string v4, "MoreUtil"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "fieldvalueset"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_2

    goto :goto_0

    .line 1444
    .end local v1    # "field":Ljava/lang/reflect/Field;
    :catch_0
    move-exception v0

    .line 1446
    .local v0, "e":Ljava/lang/NoSuchFieldException;
    invoke-virtual {v0}, Ljava/lang/NoSuchFieldException;->printStackTrace()V

    .end local v0    # "e":Ljava/lang/NoSuchFieldException;
    :cond_2
    :goto_1
    move v2, v3

    .line 1454
    goto :goto_0

    .line 1447
    :catch_1
    move-exception v0

    .line 1449
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_1

    .line 1450
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_2
    move-exception v0

    .line 1452
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->printStackTrace()V

    goto :goto_1
.end method


# virtual methods
.method public analyticsData(Landroid/content/Context;)Ljava/lang/String;
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 1463
    const-string v0, ""

    .line 1464
    .local v0, "data":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, p1}, Lcom/belkin/wemo/cache/utils/MoreUtil;->getApplicationVersion(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "|"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/belkin/wemo/cache/utils/MoreUtil;->getVersionNumber()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "|"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    new-instance v2, Lcom/belkin/wemo/cache/utils/MoreUtil;

    invoke-direct {v2}, Lcom/belkin/wemo/cache/utils/MoreUtil;-><init>()V

    invoke-virtual {v2, p1}, Lcom/belkin/wemo/cache/utils/MoreUtil;->getDeviceUserName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1465
    return-object v0
.end method

.method public compareFirmwareVersions(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "currentPlugInVersion"    # Ljava/lang/String;
    .param p2, "fwTagObject"    # [Ljava/lang/String;
    .param p3, "deviceType"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x1

    .line 1343
    const/4 v0, -0x1

    .line 1344
    .local v0, "currentVersion":I
    const/4 v2, -0x1

    .line 1345
    .local v2, "fwTagVersion":I
    const-string v1, ""

    .line 1347
    .local v1, "fieldName":Ljava/lang/String;
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    if-eqz p2, :cond_0

    array-length v3, p2

    if-ge v3, v4, :cond_1

    .line 1348
    :cond_0
    const-string v3, ""

    .line 1360
    :goto_0
    return-object v3

    .line 1350
    :cond_1
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/cache/utils/MoreUtil;->getFirmwareNumber(Ljava/lang/String;)I

    move-result v0

    .line 1351
    aget-object v3, p2, v4

    invoke-virtual {p0, v3}, Lcom/belkin/wemo/cache/utils/MoreUtil;->getFirmwareNumber(Ljava/lang/String;)I

    move-result v2

    .line 1353
    if-ge v0, v2, :cond_2

    .line 1354
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "Flag"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1357
    :cond_2
    invoke-direct {p0, v1}, Lcom/belkin/wemo/cache/utils/MoreUtil;->setFieldValue(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    move-object v3, v1

    .line 1358
    goto :goto_0

    .line 1360
    :cond_3
    const-string v3, ""

    goto :goto_0
.end method

.method public compareFirmwareVersionsBulb(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "currentPlugInVersion"    # Ljava/lang/String;
    .param p2, "newVersion"    # Ljava/lang/String;
    .param p3, "deviceType"    # Ljava/lang/String;

    .prologue
    .line 1090
    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    if-nez p3, :cond_2

    .line 1091
    :cond_0
    const-string v0, ""

    .line 1104
    :cond_1
    :goto_0
    return-object v0

    .line 1093
    :cond_2
    const-string v0, ""

    .line 1094
    .local v0, "fieldName":Ljava/lang/String;
    const-string v1, "MoreUtil"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "compareFirmwareVersionsBulb: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "and newVersion is:: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1095
    invoke-virtual {p1, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 1097
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "Flag"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1098
    invoke-direct {p0, v0}, Lcom/belkin/wemo/cache/utils/MoreUtil;->setFieldValue(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 1101
    const-string v0, ""

    goto :goto_0

    .line 1104
    :cond_3
    const-string v0, ""

    goto :goto_0
.end method

.method public compareNEWFirmwareDataForBridge(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "currentPlugInVersion"    # Ljava/lang/String;
    .param p2, "newVersion"    # Ljava/lang/String;

    .prologue
    .line 1058
    invoke-virtual {p1, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1059
    const/4 v0, 0x1

    sput-boolean v0, Lcom/belkin/wemo/cache/utils/MoreUtil;->bridgewwFlag:Z

    .line 1060
    const-string v0, "Bridge"

    .line 1063
    :goto_0
    return-object v0

    :cond_0
    const-string v0, ""

    goto :goto_0
.end method

.method public compareNEWFirmwareDataForBulb(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "currentPlugInVersion"    # Ljava/lang/String;
    .param p2, "newVersion"    # Ljava/lang/String;

    .prologue
    .line 1072
    invoke-virtual {p0, p2}, Lcom/belkin/wemo/cache/utils/MoreUtil;->getFirmwareNumberForBulb(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1073
    .local v0, "newVersionNumber":Ljava/lang/String;
    const-string v1, "MoreUtil"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "compareNEWFirmwareDataForBulb: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "and newVersion is:: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1074
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1075
    const/4 v1, 0x1

    sput-boolean v1, Lcom/belkin/wemo/cache/utils/MoreUtil;->bulbWWflag:Z

    .line 1076
    const-string v1, "Bulb"

    .line 1079
    :goto_0
    return-object v1

    :cond_0
    const-string v1, ""

    goto :goto_0
.end method

.method public compareNEWFirmwareDataForCrockpot(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "currentPlugInVersion"    # Ljava/lang/String;
    .param p2, "newVersion"    # [Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    .line 1278
    const-string v0, "WeMo_WW_2.0"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    aget-object v0, p2, v2

    const-string v1, "WeMo_WW_2.0"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1279
    aget-object v0, p2, v2

    invoke-virtual {v0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1280
    sput-boolean v2, Lcom/belkin/wemo/cache/utils/MoreUtil;->slowcookerUSFlag:Z

    .line 1281
    const-string v0, "slowCookerFlag"

    .line 1286
    :goto_0
    return-object v0

    :cond_0
    const-string v0, ""

    goto :goto_0
.end method

.method public compareNEWFirmwareDataForInsight(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "currentPlugInVersion"    # Ljava/lang/String;
    .param p2, "newVersion"    # [Ljava/lang/String;
    .param p3, "signedVersion"    # [Ljava/lang/String;

    .prologue
    const/4 v3, 0x1

    .line 1113
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/cache/utils/MoreUtil;->getFirmwareNumber(Ljava/lang/String;)I

    move-result v0

    .line 1114
    .local v0, "currentVesrionName":I
    aget-object v2, p2, v3

    invoke-virtual {p0, v2}, Lcom/belkin/wemo/cache/utils/MoreUtil;->getFirmwareNumber(Ljava/lang/String;)I

    move-result v1

    .line 1116
    .local v1, "newVesrionName":I
    if-ge v0, v1, :cond_0

    .line 1117
    sput-boolean v3, Lcom/belkin/wemo/cache/utils/MoreUtil;->insightFlag:Z

    .line 1118
    const-string v2, "insight"

    .line 1127
    :goto_0
    return-object v2

    .line 1120
    :cond_0
    if-eqz p3, :cond_1

    .line 1122
    aget-object v2, p3, v3

    invoke-virtual {p1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 1123
    sput-boolean v3, Lcom/belkin/wemo/cache/utils/MoreUtil;->signedInsightFlag:Z

    .line 1124
    const-string v2, "signedInsight"

    goto :goto_0

    .line 1127
    :cond_1
    const-string v2, ""

    goto :goto_0
.end method

.method public compareNEWFirmwareDataForLightSwitch(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "currentPlugInVersion"    # Ljava/lang/String;
    .param p2, "newVersion"    # [Ljava/lang/String;
    .param p3, "signedVersion"    # [Ljava/lang/String;

    .prologue
    const/4 v3, 0x1

    .line 966
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/cache/utils/MoreUtil;->getFirmwareNumber(Ljava/lang/String;)I

    move-result v0

    .line 967
    .local v0, "currentVersionName":I
    aget-object v2, p2, v3

    invoke-virtual {p0, v2}, Lcom/belkin/wemo/cache/utils/MoreUtil;->getFirmwareNumber(Ljava/lang/String;)I

    move-result v1

    .line 969
    .local v1, "newVesrionName":I
    if-ge v0, v1, :cond_0

    .line 970
    sput-boolean v3, Lcom/belkin/wemo/cache/utils/MoreUtil;->lightFlag:Z

    .line 971
    const-string v2, "light"

    .line 981
    :goto_0
    return-object v2

    .line 974
    :cond_0
    if-eqz p3, :cond_1

    .line 976
    aget-object v2, p3, v3

    invoke-virtual {p1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 977
    sput-boolean v3, Lcom/belkin/wemo/cache/utils/MoreUtil;->signedLightFlag:Z

    .line 978
    const-string v2, "signedlight"

    goto :goto_0

    .line 981
    :cond_1
    const-string v2, ""

    goto :goto_0
.end method

.method public compareNEWFirmwareDataForMaker(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "currentPlugInVersion"    # Ljava/lang/String;
    .param p2, "newVersion"    # [Ljava/lang/String;

    .prologue
    const/4 v5, 0x1

    .line 1018
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/cache/utils/MoreUtil;->getFirmwareNumber(Ljava/lang/String;)I

    move-result v0

    .line 1019
    .local v0, "currentVesrionName":I
    aget-object v2, p2, v5

    invoke-virtual {p0, v2}, Lcom/belkin/wemo/cache/utils/MoreUtil;->getFirmwareNumber(Ljava/lang/String;)I

    move-result v1

    .line 1020
    .local v1, "newVesrionName":I
    const-string v2, "MoreUtil"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "currentVesrionName :: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " newVesrionName :: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1021
    aget-object v2, p2, v5

    invoke-virtual {p1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 1022
    sput-boolean v5, Lcom/belkin/wemo/cache/utils/MoreUtil;->makerFlag:Z

    .line 1023
    const-string v2, "Maker"

    .line 1025
    :goto_0
    return-object v2

    :cond_0
    const-string v2, ""

    goto :goto_0
.end method

.method public compareNEWFirmwareDataForSwitchSensor(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "currentPlugInVersion"    # Ljava/lang/String;
    .param p2, "newVersion"    # [Ljava/lang/String;
    .param p3, "signedVersion"    # [Ljava/lang/String;

    .prologue
    const/4 v4, 0x1

    .line 1188
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/cache/utils/MoreUtil;->getFirmwareNumber(Ljava/lang/String;)I

    move-result v0

    .line 1189
    .local v0, "currentVesrionName":I
    aget-object v2, p2, v4

    invoke-virtual {p0, v2}, Lcom/belkin/wemo/cache/utils/MoreUtil;->getFirmwareNumber(Ljava/lang/String;)I

    move-result v1

    .line 1190
    .local v1, "newVesrionName":I
    const-string v2, "WeMo_US"

    invoke-virtual {p1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "WeMo_WW_1.0"

    invoke-virtual {p1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_2

    :cond_0
    aget-object v2, p2, v4

    const-string v3, "WeMo_US"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1192
    if-ge v0, v1, :cond_1

    .line 1193
    sput-boolean v4, Lcom/belkin/wemo/cache/utils/MoreUtil;->usFlag:Z

    .line 1194
    const-string v2, "US"

    .line 1218
    :goto_0
    return-object v2

    .line 1196
    :cond_1
    if-eqz p3, :cond_2

    .line 1198
    aget-object v2, p3, v4

    invoke-virtual {p1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 1199
    sput-boolean v4, Lcom/belkin/wemo/cache/utils/MoreUtil;->signedusFlag:Z

    .line 1200
    const-string v2, "US_SIGNED"

    goto :goto_0

    .line 1204
    :cond_2
    const-string v2, "WeMo_EU"

    invoke-virtual {p1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_3

    const-string v2, "WeMo_WW_2.0"

    invoke-virtual {p1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_3
    aget-object v2, p2, v4

    const-string v3, "WeMo_WW"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 1206
    if-ge v0, v1, :cond_4

    .line 1207
    sput-boolean v4, Lcom/belkin/wemo/cache/utils/MoreUtil;->euFlag:Z

    .line 1208
    const-string v2, "EU"

    goto :goto_0

    .line 1210
    :cond_4
    if-eqz p3, :cond_5

    .line 1212
    aget-object v2, p3, v4

    invoke-virtual {p1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_5

    .line 1213
    sput-boolean v4, Lcom/belkin/wemo/cache/utils/MoreUtil;->signedeuFlag:Z

    .line 1214
    const-string v2, "EU_SIGNED"

    goto :goto_0

    .line 1218
    :cond_5
    const-string v2, ""

    goto :goto_0
.end method

.method public compareNEWFirmwareDataForWeMoSmart(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p1, "currentPlugInVersion"    # Ljava/lang/String;
    .param p2, "newVersion"    # [Ljava/lang/String;

    .prologue
    const/4 v7, 0x1

    .line 1297
    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    array-length v4, p2

    const/4 v5, 0x2

    if-ge v4, v5, :cond_1

    .line 1298
    :cond_0
    const-string v4, "MoreUtil"

    const-string v5, "compareNEWFirmwareDataForWeMoSmart:invalid data to compare"

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1299
    const-string v4, ""

    .line 1311
    :goto_0
    return-object v4

    .line 1302
    :cond_1
    const-string v4, "MoreUtil"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "currentPlugInVersion:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1303
    move-object v0, p2

    .local v0, "arr$":[Ljava/lang/String;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_1
    if-ge v1, v2, :cond_2

    aget-object v3, v0, v1

    .line 1304
    .local v3, "str":Ljava/lang/String;
    const-string v4, "MoreUtil"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "newVersion str:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1303
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1307
    .end local v3    # "str":Ljava/lang/String;
    :cond_2
    aget-object v4, p2, v7

    invoke-virtual {p1, v4}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v4

    if-nez v4, :cond_3

    .line 1308
    const-string v4, ""

    goto :goto_0

    .line 1310
    :cond_3
    sput-boolean v7, Lcom/belkin/wemo/cache/utils/MoreUtil;->wemoSmartFlag:Z

    .line 1311
    const-string v4, "wemoSmartFlag"

    goto :goto_0
.end method

.method public compareOpenWRTFirmwareForInsight(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "currentPlugInVersion"    # Ljava/lang/String;
    .param p2, "newVersion"    # [Ljava/lang/String;
    .param p3, "openWRTTransVersion"    # [Ljava/lang/String;
    .param p4, "openWRTVersion"    # [Ljava/lang/String;

    .prologue
    const/4 v5, 0x1

    .line 1138
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/cache/utils/MoreUtil;->getFirmwareNumber(Ljava/lang/String;)I

    move-result v0

    .line 1139
    .local v0, "currentVersionName":I
    aget-object v3, p3, v5

    invoke-virtual {p0, v3}, Lcom/belkin/wemo/cache/utils/MoreUtil;->getFirmwareNumber(Ljava/lang/String;)I

    move-result v2

    .line 1140
    .local v2, "openWRTTransVesrion":I
    const/4 v1, 0x0

    .line 1141
    .local v1, "newVesrionName":I
    if-eqz p2, :cond_0

    .line 1142
    aget-object v3, p2, v5

    invoke-virtual {p0, v3}, Lcom/belkin/wemo/cache/utils/MoreUtil;->getFirmwareNumber(Ljava/lang/String;)I

    move-result v1

    .line 1145
    :cond_0
    if-eqz v1, :cond_1

    if-ge v0, v1, :cond_1

    .line 1146
    sput-boolean v5, Lcom/belkin/wemo/cache/utils/MoreUtil;->insightFlag:Z

    .line 1147
    const-string v3, "insight"

    .line 1160
    :goto_0
    return-object v3

    .line 1149
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v3

    const-string v4, "OWRT"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    if-ge v0, v2, :cond_2

    .line 1151
    sput-boolean v5, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTTransinsight:Z

    .line 1152
    const-string v3, "openWRTTransinsight"

    goto :goto_0

    .line 1154
    :cond_2
    if-eqz p4, :cond_3

    .line 1155
    aget-object v3, p4, v5

    invoke-virtual {p1, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 1156
    sput-boolean v5, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTinsight:Z

    .line 1157
    const-string v3, "openWRTinsight"

    goto :goto_0

    .line 1160
    :cond_3
    const-string v3, ""

    goto :goto_0
.end method

.method public compareOpenWRTFirmwareForInsightV2(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "currentPlugInVersion"    # Ljava/lang/String;
    .param p2, "newVersion"    # [Ljava/lang/String;

    .prologue
    const/4 v3, 0x1

    .line 1170
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    if-eqz p2, :cond_0

    .line 1171
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/cache/utils/MoreUtil;->getFirmwareNumber(Ljava/lang/String;)I

    move-result v0

    .line 1172
    .local v0, "currentVersionName":I
    aget-object v2, p2, v3

    invoke-virtual {p0, v2}, Lcom/belkin/wemo/cache/utils/MoreUtil;->getFirmwareNumber(Ljava/lang/String;)I

    move-result v1

    .line 1173
    .local v1, "newVersionName":I
    if-ge v0, v1, :cond_0

    .line 1174
    sput-boolean v3, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTInsightV2:Z

    .line 1175
    const-string v2, "insightV2"

    .line 1178
    .end local v0    # "currentVersionName":I
    .end local v1    # "newVersionName":I
    :goto_0
    return-object v2

    :cond_0
    const-string v2, ""

    goto :goto_0
.end method

.method public compareOpenWRTFirmwareForLightSwitch(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "currentPlugInVersion"    # Ljava/lang/String;
    .param p2, "newVersion"    # [Ljava/lang/String;
    .param p3, "openWRTTransVersion"    # [Ljava/lang/String;
    .param p4, "openWRTVersion"    # [Ljava/lang/String;

    .prologue
    const/4 v5, 0x1

    .line 992
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/cache/utils/MoreUtil;->getFirmwareNumber(Ljava/lang/String;)I

    move-result v0

    .line 993
    .local v0, "currentVersionName":I
    aget-object v3, p3, v5

    invoke-virtual {p0, v3}, Lcom/belkin/wemo/cache/utils/MoreUtil;->getFirmwareNumber(Ljava/lang/String;)I

    move-result v2

    .line 994
    .local v2, "openWRTTransVesrion":I
    const/4 v1, 0x0

    .line 995
    .local v1, "newVesrionName":I
    if-eqz p2, :cond_0

    .line 996
    aget-object v3, p2, v5

    invoke-virtual {p0, v3}, Lcom/belkin/wemo/cache/utils/MoreUtil;->getFirmwareNumber(Ljava/lang/String;)I

    move-result v1

    .line 999
    :cond_0
    if-eqz v1, :cond_1

    if-ge v0, v1, :cond_1

    .line 1000
    sput-boolean v5, Lcom/belkin/wemo/cache/utils/MoreUtil;->lightFlag:Z

    .line 1001
    const-string v3, "light"

    .line 1014
    :goto_0
    return-object v3

    .line 1003
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v3

    const-string v4, "OWRT"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    if-ge v0, v2, :cond_2

    .line 1005
    sput-boolean v5, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTTranslight:Z

    .line 1006
    const-string v3, "openWRTTranslight"

    goto :goto_0

    .line 1008
    :cond_2
    if-eqz p4, :cond_3

    .line 1009
    aget-object v3, p4, v5

    invoke-virtual {p1, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 1010
    sput-boolean v5, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTlight:Z

    .line 1011
    const-string v3, "openWRTlight"

    goto :goto_0

    .line 1014
    :cond_3
    const-string v3, ""

    goto :goto_0
.end method

.method public compareOpenWRTFirmwareForMaker(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "currentPlugInVersion"    # Ljava/lang/String;
    .param p2, "openWRTTransVersion"    # [Ljava/lang/String;
    .param p3, "openWRTVersion"    # [Ljava/lang/String;

    .prologue
    const/4 v3, 0x1

    .line 1035
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/cache/utils/MoreUtil;->getFirmwareNumber(Ljava/lang/String;)I

    move-result v0

    .line 1036
    .local v0, "currentVersionName":I
    aget-object v2, p2, v3

    invoke-virtual {p0, v2}, Lcom/belkin/wemo/cache/utils/MoreUtil;->getFirmwareNumber(Ljava/lang/String;)I

    move-result v1

    .line 1038
    .local v1, "openWRTTransVesrion":I
    if-ge v0, v1, :cond_0

    .line 1039
    sput-boolean v3, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTTransMaker:Z

    .line 1040
    const-string v2, "openWRTTransMaker"

    .line 1048
    :goto_0
    return-object v2

    .line 1042
    :cond_0
    if-eqz p3, :cond_1

    .line 1043
    aget-object v2, p3, v3

    invoke-virtual {p1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 1044
    sput-boolean v3, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTMaker:Z

    .line 1045
    const-string v2, "openWRTMaker"

    goto :goto_0

    .line 1048
    :cond_1
    const-string v2, ""

    goto :goto_0
.end method

.method public compareOpenWRTFirmwareForSNS(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "currentPlugInVersion"    # Ljava/lang/String;
    .param p2, "newVersion"    # [Ljava/lang/String;
    .param p3, "openWRTTransVersion"    # [Ljava/lang/String;
    .param p4, "openWRTVersion"    # [Ljava/lang/String;

    .prologue
    const/4 v5, 0x1

    .line 1229
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/cache/utils/MoreUtil;->getFirmwareNumber(Ljava/lang/String;)I

    move-result v0

    .line 1230
    .local v0, "currentVersionName":I
    aget-object v3, p3, v5

    invoke-virtual {p0, v3}, Lcom/belkin/wemo/cache/utils/MoreUtil;->getFirmwareNumber(Ljava/lang/String;)I

    move-result v2

    .line 1231
    .local v2, "openWRTTransVesrion":I
    const/4 v1, 0x0

    .line 1232
    .local v1, "newVesrionName":I
    if-eqz p2, :cond_0

    .line 1233
    aget-object v3, p2, v5

    invoke-virtual {p0, v3}, Lcom/belkin/wemo/cache/utils/MoreUtil;->getFirmwareNumber(Ljava/lang/String;)I

    move-result v1

    .line 1236
    :cond_0
    const-string v3, "WeMo_US"

    invoke-virtual {p1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    const-string v3, "WeMo_WW_1.0"

    invoke-virtual {p1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_4

    :cond_1
    aget-object v3, p2, v5

    const-string v4, "WeMo_US"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 1238
    if-eqz v1, :cond_2

    if-ge v0, v1, :cond_2

    .line 1239
    sput-boolean v5, Lcom/belkin/wemo/cache/utils/MoreUtil;->usFlag:Z

    .line 1240
    const-string v3, "US"

    .line 1272
    :goto_0
    return-object v3

    .line 1242
    :cond_2
    invoke-virtual {p1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v3

    const-string v4, "OWRT"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_3

    if-ge v0, v2, :cond_3

    .line 1244
    sput-boolean v5, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTTransSNS:Z

    .line 1245
    const-string v3, "openWRTTransSNS"

    goto :goto_0

    .line 1247
    :cond_3
    if-eqz p4, :cond_4

    .line 1248
    aget-object v3, p4, v5

    invoke-virtual {p1, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_4

    .line 1249
    sput-boolean v5, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTSNS:Z

    .line 1250
    const-string v3, "openWRTSNS"

    goto :goto_0

    .line 1254
    :cond_4
    const-string v3, "WeMo_EU"

    invoke-virtual {p1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_5

    const-string v3, "WeMo_WW_2.0"

    invoke-virtual {p1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_8

    :cond_5
    aget-object v3, p2, v5

    const-string v4, "WeMo_WW"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 1256
    if-eqz v1, :cond_6

    if-ge v0, v1, :cond_6

    .line 1257
    sput-boolean v5, Lcom/belkin/wemo/cache/utils/MoreUtil;->euFlag:Z

    .line 1258
    const-string v3, "EU"

    goto :goto_0

    .line 1260
    :cond_6
    invoke-virtual {p1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v3

    const-string v4, "OWRT"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_7

    if-ge v0, v2, :cond_7

    .line 1262
    sput-boolean v5, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTTransSNS:Z

    .line 1263
    const-string v3, "openWRTTransSNS"

    goto :goto_0

    .line 1265
    :cond_7
    if-eqz p4, :cond_8

    .line 1266
    aget-object v3, p4, v5

    invoke-virtual {p1, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_8

    .line 1267
    sput-boolean v5, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTSNS:Z

    .line 1268
    const-string v3, "openWRTSNS"

    goto :goto_0

    .line 1272
    :cond_8
    const-string v3, ""

    goto :goto_0
.end method

.method public compareOpenWRTFirmwareForWeMoSmart(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "currentPlugInVersion"    # Ljava/lang/String;
    .param p2, "openWRTTransVersion"    # [Ljava/lang/String;
    .param p3, "openWRTVersion"    # [Ljava/lang/String;

    .prologue
    const/4 v3, 0x1

    .line 1321
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/cache/utils/MoreUtil;->getFirmwareNumber(Ljava/lang/String;)I

    move-result v0

    .line 1322
    .local v0, "currentVersionName":I
    aget-object v2, p2, v3

    invoke-virtual {p0, v2}, Lcom/belkin/wemo/cache/utils/MoreUtil;->getFirmwareNumber(Ljava/lang/String;)I

    move-result v1

    .line 1324
    .local v1, "openWRTTransVesrion":I
    if-ge v0, v1, :cond_0

    .line 1325
    sput-boolean v3, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTTranssmart:Z

    .line 1326
    const-string v2, "openWRTTranscrockpot"

    .line 1334
    :goto_0
    return-object v2

    .line 1328
    :cond_0
    if-eqz p3, :cond_1

    .line 1329
    aget-object v2, p3, v3

    invoke-virtual {p1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 1330
    sput-boolean v3, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTsmart:Z

    .line 1331
    const-string v2, "openWRTTranssmart"

    goto :goto_0

    .line 1334
    :cond_1
    const-string v2, ""

    goto :goto_0
.end method

.method public compareOpenWRTFirmwareVersions(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "currentPlugInVersion"    # Ljava/lang/String;
    .param p2, "openWRTObject"    # [Ljava/lang/String;
    .param p3, "deviceType"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x1

    .line 1370
    const-string v0, ""

    .line 1372
    .local v0, "fieldName":Ljava/lang/String;
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    if-eqz p2, :cond_0

    array-length v1, p2

    if-ge v1, v3, :cond_1

    .line 1373
    :cond_0
    const-string v1, ""

    .line 1392
    :goto_0
    return-object v1

    .line 1376
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v1

    const-string v2, "OWRT"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 1378
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "openWRTTrans"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1380
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "openWRT"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/belkin/wemo/cache/utils/MoreUtil;->resetFieldValue(Ljava/lang/String;)Z

    .line 1389
    :cond_2
    :goto_1
    invoke-direct {p0, v0}, Lcom/belkin/wemo/cache/utils/MoreUtil;->setFieldValue(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    move-object v1, v0

    .line 1390
    goto :goto_0

    .line 1383
    :cond_3
    aget-object v1, p2, v3

    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 1384
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "openWRT"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1386
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "openWRTTrans"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/belkin/wemo/cache/utils/MoreUtil;->resetFieldValue(Ljava/lang/String;)Z

    goto :goto_1

    .line 1392
    :cond_4
    const-string v1, ""

    goto :goto_0
.end method

.method public copyDbToDownloadDirectory(Ljava/lang/String;Landroid/content/Context;)V
    .locals 13
    .param p1, "databaseName"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 1512
    const/4 v1, 0x0

    .line 1513
    .local v1, "src":Ljava/nio/channels/FileChannel;
    const/4 v0, 0x0

    .line 1516
    .local v0, "dest":Ljava/nio/channels/FileChannel;
    :try_start_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "/data/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0, p2}, Lcom/belkin/wemo/cache/utils/MoreUtil;->getPackageName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/databases/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 1517
    .local v9, "currentDbPath":Ljava/lang/String;
    move-object v11, p1

    .line 1518
    .local v11, "proposedDbName":Ljava/lang/String;
    const-string v2, "DB COPY"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "package name reported by context "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0, p2}, Lcom/belkin/wemo/cache/utils/MoreUtil;->getPackageName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1521
    invoke-static {}, Lcom/belkin/wemo/storage/FileStorage;->getStoragePath()Ljava/io/File;

    move-result-object v12

    .line 1522
    .local v12, "publicDirLocation":Ljava/io/File;
    invoke-static {}, Landroid/os/Environment;->getDataDirectory()Ljava/io/File;

    move-result-object v6

    .line 1524
    .local v6, "appDataDirectory":Ljava/io/File;
    invoke-virtual {v12}, Ljava/io/File;->canWrite()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 1525
    new-instance v8, Ljava/io/File;

    invoke-direct {v8, v6, v9}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1526
    .local v8, "currentDb":Ljava/io/File;
    new-instance v7, Ljava/io/File;

    invoke-direct {v7, v12, v11}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1529
    .local v7, "backupDb":Ljava/io/File;
    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1530
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, v8}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-virtual {v2}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v1

    .line 1531
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v7}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-virtual {v2}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v0

    .line 1533
    const-wide/16 v2, 0x0

    invoke-virtual {v1}, Ljava/nio/channels/FileChannel;->size()J

    move-result-wide v4

    invoke-virtual/range {v0 .. v5}, Ljava/nio/channels/FileChannel;->transferFrom(Ljava/nio/channels/ReadableByteChannel;JJ)J

    .line 1534
    invoke-virtual {v1}, Ljava/nio/channels/FileChannel;->close()V

    .line 1535
    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->close()V

    .line 1536
    const-string v2, "DB COPY"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "copy successful to "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v7}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1549
    .end local v7    # "backupDb":Ljava/io/File;
    .end local v8    # "currentDb":Ljava/io/File;
    :cond_0
    :goto_0
    if-eqz v1, :cond_1

    .line 1550
    :try_start_1
    invoke-virtual {v1}, Ljava/nio/channels/FileChannel;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 1554
    :cond_1
    :goto_1
    if-eqz v0, :cond_2

    .line 1555
    :try_start_2
    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3

    .line 1560
    .end local v6    # "appDataDirectory":Ljava/io/File;
    .end local v9    # "currentDbPath":Ljava/lang/String;
    .end local v11    # "proposedDbName":Ljava/lang/String;
    .end local v12    # "publicDirLocation":Ljava/io/File;
    :cond_2
    :goto_2
    return-void

    .line 1541
    .restart local v6    # "appDataDirectory":Ljava/io/File;
    .restart local v9    # "currentDbPath":Ljava/lang/String;
    .restart local v11    # "proposedDbName":Ljava/lang/String;
    .restart local v12    # "publicDirLocation":Ljava/io/File;
    :cond_3
    :try_start_3
    const-string v2, "DB COPY"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " not writable"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 1544
    .end local v6    # "appDataDirectory":Ljava/io/File;
    .end local v9    # "currentDbPath":Ljava/lang/String;
    .end local v11    # "proposedDbName":Ljava/lang/String;
    .end local v12    # "publicDirLocation":Ljava/io/File;
    :catch_0
    move-exception v10

    .line 1546
    .local v10, "e":Ljava/lang/Exception;
    :try_start_4
    invoke-virtual {v10}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 1549
    if-eqz v1, :cond_4

    .line 1550
    :try_start_5
    invoke-virtual {v1}, Ljava/nio/channels/FileChannel;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_4

    .line 1554
    :cond_4
    :goto_3
    if-eqz v0, :cond_2

    .line 1555
    :try_start_6
    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1

    goto :goto_2

    .line 1557
    :catch_1
    move-exception v10

    invoke-virtual {v10}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2

    .line 1552
    .end local v10    # "e":Ljava/lang/Exception;
    .restart local v6    # "appDataDirectory":Ljava/io/File;
    .restart local v9    # "currentDbPath":Ljava/lang/String;
    .restart local v11    # "proposedDbName":Ljava/lang/String;
    .restart local v12    # "publicDirLocation":Ljava/io/File;
    :catch_2
    move-exception v10

    .restart local v10    # "e":Ljava/lang/Exception;
    invoke-virtual {v10}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 1557
    .end local v10    # "e":Ljava/lang/Exception;
    :catch_3
    move-exception v10

    .restart local v10    # "e":Ljava/lang/Exception;
    invoke-virtual {v10}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2

    .line 1552
    .end local v6    # "appDataDirectory":Ljava/io/File;
    .end local v9    # "currentDbPath":Ljava/lang/String;
    .end local v11    # "proposedDbName":Ljava/lang/String;
    .end local v12    # "publicDirLocation":Ljava/io/File;
    :catch_4
    move-exception v10

    invoke-virtual {v10}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_3

    .line 1548
    .end local v10    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    .line 1549
    if-eqz v1, :cond_5

    .line 1550
    :try_start_7
    invoke-virtual {v1}, Ljava/nio/channels/FileChannel;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_5

    .line 1554
    :cond_5
    :goto_4
    if-eqz v0, :cond_6

    .line 1555
    :try_start_8
    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->close()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_6

    .line 1557
    :cond_6
    :goto_5
    throw v2

    .line 1552
    :catch_5
    move-exception v10

    .restart local v10    # "e":Ljava/lang/Exception;
    invoke-virtual {v10}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_4

    .line 1557
    .end local v10    # "e":Ljava/lang/Exception;
    :catch_6
    move-exception v10

    .restart local v10    # "e":Ljava/lang/Exception;
    invoke-virtual {v10}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_5
.end method

.method public generateAndCallMarketUri(Landroid/content/Context;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 208
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    .line 209
    .local v2, "packageName":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "market://details?id="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 210
    .local v1, "marketUrl":Ljava/lang/String;
    const-string v3, "MoreUtil"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Play Store URL- "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 211
    new-instance v0, Landroid/content/Intent;

    const-string v3, "android.intent.action.VIEW"

    invoke-direct {v0, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 212
    .local v0, "intent":Landroid/content/Intent;
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 213
    const/high16 v3, 0x10000000

    invoke-virtual {v0, v3}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 214
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 215
    return-void
.end method

.method public generateReUnionKey(Lcom/belkin/wemo/cache/utils/SharePreferences;)Ljava/lang/String;
    .locals 8
    .param p1, "sp"    # Lcom/belkin/wemo/cache/utils/SharePreferences;

    .prologue
    .line 1469
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    const-wide/16 v6, 0x3e8

    div-long v2, v4, v6

    .line 1470
    .local v2, "utcTime":J
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, ""

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v4, 0x3e8

    const/16 v5, 0x270f

    invoke-virtual {p0, v4, v5}, Lcom/belkin/wemo/cache/utils/MoreUtil;->getRandomNumber(II)I

    move-result v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1471
    .local v0, "reUnionKey":Ljava/lang/String;
    invoke-virtual {p1, v0}, Lcom/belkin/wemo/cache/utils/SharePreferences;->storeReUnionKey(Ljava/lang/String;)V

    .line 1472
    const-string v1, "MoreUtil"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "generateReUnionKey reUnionKey: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1473
    return-object v0
.end method

.method public getAppAndDeviceInfo(Landroid/content/Context;)Lorg/json/JSONObject;
    .locals 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 343
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 345
    .local v3, "jsonObj":Lorg/json/JSONObject;
    :try_start_0
    const-string v4, "appVersionName"

    invoke-virtual {p0, p1}, Lcom/belkin/wemo/cache/utils/MoreUtil;->getApplicationVersion(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 346
    const-string v4, "appVersionCode"

    invoke-virtual {p0, p1}, Lcom/belkin/wemo/cache/utils/MoreUtil;->getApplicationCode(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 347
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/utils/MoreUtil;->getDeviceModel()Ljava/lang/String;

    move-result-object v0

    .line 348
    .local v0, "deviceModel":Ljava/lang/String;
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/cache/utils/MoreUtil;->getDeviceUserName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 351
    .local v1, "deviceUserName":Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 352
    const-string v1, ""

    .line 354
    :cond_0
    const-string v4, "deviceModelName"

    invoke-virtual {v3, v4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 355
    const-string v4, "deviceUserInfo"

    invoke-virtual {v3, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 359
    .end local v0    # "deviceModel":Ljava/lang/String;
    .end local v1    # "deviceUserName":Ljava/lang/String;
    .end local v3    # "jsonObj":Lorg/json/JSONObject;
    :goto_0
    return-object v3

    .line 357
    .restart local v3    # "jsonObj":Lorg/json/JSONObject;
    :catch_0
    move-exception v2

    .line 358
    .local v2, "ex":Lorg/json/JSONException;
    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    .line 359
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public getApplicationCode(Landroid/content/Context;)Ljava/lang/String;
    .locals 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 331
    const-string v0, ""

    .line 333
    .local v0, "applicationCode":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v2

    iput-object v2, p0, Lcom/belkin/wemo/cache/utils/MoreUtil;->packageInfo:Landroid/content/pm/PackageInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 337
    :goto_0
    iget-object v2, p0, Lcom/belkin/wemo/cache/utils/MoreUtil;->packageInfo:Landroid/content/pm/PackageInfo;

    iget v2, v2, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    .line 338
    const-string v2, "MoreUtil"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "applicationCode"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 339
    return-object v0

    .line 334
    :catch_0
    move-exception v1

    .line 335
    .local v1, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v1}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_0
.end method

.method public getApplicationVersion(Landroid/content/Context;)Ljava/lang/String;
    .locals 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 318
    const-string v0, ""

    .line 320
    .local v0, "applicationVersion":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v2

    iput-object v2, p0, Lcom/belkin/wemo/cache/utils/MoreUtil;->packageInfo:Landroid/content/pm/PackageInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 324
    :goto_0
    iget-object v2, p0, Lcom/belkin/wemo/cache/utils/MoreUtil;->packageInfo:Landroid/content/pm/PackageInfo;

    iget-object v0, v2, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    .line 325
    const-string v2, "MoreUtil"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "applicationVersion"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 326
    return-object v0

    .line 321
    :catch_0
    move-exception v1

    .line 322
    .local v1, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v1}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_0
.end method

.method public getDeviceModel()Ljava/lang/String;
    .locals 6

    .prologue
    .line 290
    :try_start_0
    sget-object v1, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    .line 291
    .local v1, "manufacturer":Ljava/lang/String;
    sget-object v2, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 292
    .local v2, "model":Ljava/lang/String;
    const-string v3, "MoreUtil"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "manufacturer "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " model "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 293
    invoke-virtual {v2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 294
    invoke-direct {p0, v2}, Lcom/belkin/wemo/cache/utils/MoreUtil;->capitalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 301
    .end local v1    # "manufacturer":Ljava/lang/String;
    .end local v2    # "model":Ljava/lang/String;
    :goto_0
    return-object v3

    .line 296
    .restart local v1    # "manufacturer":Ljava/lang/String;
    .restart local v2    # "model":Ljava/lang/String;
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0, v1}, Lcom/belkin/wemo/cache/utils/MoreUtil;->capitalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    goto :goto_0

    .line 298
    .end local v1    # "manufacturer":Ljava/lang/String;
    .end local v2    # "model":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 299
    .local v0, "ex":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 300
    const-string v3, "MoreUtil"

    const-string v4, "no name found for deviceName"

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 301
    const-string v3, "ANDROID"

    goto :goto_0
.end method

.method public getDeviceUserName(Landroid/content/Context;)Ljava/lang/String;
    .locals 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 233
    const/4 v0, 0x0

    .line 237
    .local v0, "deviceName":Ljava/lang/String;
    :try_start_0
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x13

    if-lt v2, v3, :cond_0

    .line 238
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "device_name"

    invoke-static {v2, v3}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 246
    :goto_0
    if-eqz v0, :cond_1

    .line 247
    const-string v2, "MoreUtil"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "deviceName "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 250
    .end local v0    # "deviceName":Ljava/lang/String;
    :goto_1
    return-object v0

    .line 240
    .restart local v0    # "deviceName":Ljava/lang/String;
    :cond_0
    :try_start_1
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "lock_screen_owner_info"

    invoke-static {v2, v3}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v0

    goto :goto_0

    .line 242
    :catch_0
    move-exception v1

    .line 243
    .local v1, "ex":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 250
    .end local v1    # "ex":Ljava/lang/Exception;
    :cond_1
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/utils/MoreUtil;->getDeviceModel()Ljava/lang/String;

    move-result-object v0

    goto :goto_1
.end method

.method public getFirmwareDetails(Ljava/lang/String;)Ljava/lang/String;
    .locals 25
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 526
    const-string v22, "https:"

    const-string v23, "http:"

    move-object/from16 v0, p1

    move-object/from16 v1, v22

    move-object/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 527
    const/4 v11, 0x0

    .line 528
    .local v11, "in":Ljava/io/BufferedReader;
    const-string v16, ""

    .line 529
    .local v16, "page":Ljava/lang/String;
    const-string v6, ""

    .line 531
    .local v6, "firmwareDetails":Ljava/lang/String;
    :try_start_0
    new-instance v4, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v4}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 532
    .local v4, "client":Lorg/apache/http/client/HttpClient;
    new-instance v17, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct/range {v17 .. v17}, Lorg/apache/http/client/methods/HttpGet;-><init>()V

    .line 533
    .local v17, "request":Lorg/apache/http/client/methods/HttpGet;
    new-instance v22, Ljava/net/URI;

    move-object/from16 v0, v22

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v17

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/apache/http/client/methods/HttpGet;->setURI(Ljava/net/URI;)V

    .line 534
    move-object/from16 v0, v17

    invoke-interface {v4, v0}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v18

    .line 535
    .local v18, "response":Lorg/apache/http/HttpResponse;
    new-instance v12, Ljava/io/BufferedReader;

    new-instance v22, Ljava/io/InputStreamReader;

    invoke-interface/range {v18 .. v18}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v23

    invoke-interface/range {v23 .. v23}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v23

    invoke-direct/range {v22 .. v23}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    move-object/from16 v0, v22

    invoke-direct {v12, v0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 537
    .end local v11    # "in":Ljava/io/BufferedReader;
    .local v12, "in":Ljava/io/BufferedReader;
    :try_start_1
    new-instance v19, Ljava/lang/StringBuffer;

    const-string v22, ""

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 538
    .local v19, "sb":Ljava/lang/StringBuffer;
    const-string v14, ""

    .line 539
    .local v14, "line":Ljava/lang/String;
    :cond_0
    :goto_0
    invoke-virtual {v12}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v14

    if-eqz v14, :cond_2

    .line 540
    const-string v22, ""

    move-object/from16 v0, v22

    invoke-virtual {v14, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-nez v22, :cond_0

    .line 544
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "\n"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    .line 944
    .end local v14    # "line":Ljava/lang/String;
    .end local v19    # "sb":Ljava/lang/StringBuffer;
    :catch_0
    move-exception v5

    move-object v11, v12

    .line 945
    .end local v4    # "client":Lorg/apache/http/client/HttpClient;
    .end local v12    # "in":Ljava/io/BufferedReader;
    .end local v17    # "request":Lorg/apache/http/client/methods/HttpGet;
    .end local v18    # "response":Lorg/apache/http/HttpResponse;
    .local v5, "e":Ljava/lang/Exception;
    .restart local v11    # "in":Ljava/io/BufferedReader;
    :goto_1
    :try_start_2
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 948
    if-eqz v11, :cond_1

    .line 949
    :try_start_3
    invoke-virtual {v11}, Ljava/io/BufferedReader;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    .end local v5    # "e":Ljava/lang/Exception;
    :cond_1
    :goto_2
    move-object v7, v6

    .line 955
    .end local v6    # "firmwareDetails":Ljava/lang/String;
    .local v7, "firmwareDetails":Ljava/lang/String;
    :goto_3
    return-object v7

    .line 546
    .end local v7    # "firmwareDetails":Ljava/lang/String;
    .end local v11    # "in":Ljava/io/BufferedReader;
    .restart local v4    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v6    # "firmwareDetails":Ljava/lang/String;
    .restart local v12    # "in":Ljava/io/BufferedReader;
    .restart local v14    # "line":Ljava/lang/String;
    .restart local v17    # "request":Lorg/apache/http/client/methods/HttpGet;
    .restart local v18    # "response":Lorg/apache/http/HttpResponse;
    .restart local v19    # "sb":Ljava/lang/StringBuffer;
    :cond_2
    :try_start_4
    invoke-virtual {v12}, Ljava/io/BufferedReader;->close()V

    .line 547
    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v16

    .line 550
    const-string v22, "-----\\r?\\n"

    move-object/from16 v0, v16

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v21

    .line 551
    .local v21, "strings":[Ljava/lang/String;
    if-eqz v21, :cond_5b

    .line 552
    move-object/from16 v3, v21

    .local v3, "arr$":[Ljava/lang/String;
    array-length v13, v3

    .local v13, "len$":I
    const/4 v10, 0x0

    .local v10, "i$":I
    :goto_4
    if-ge v10, v13, :cond_5b

    aget-object v20, v3, v10

    .line 553
    .local v20, "string":Ljava/lang/String;
    const-string v22, "\\r?\\n"

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v8

    .line 554
    .local v8, "firmwareName":[Ljava/lang/String;
    sget-object v22, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "firmware text ------------- ## "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const/16 v24, 0x0

    aget-object v24, v8, v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 556
    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "WeMoUS"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_4

    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "Plug-in"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_4

    sget-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->usFlag:Z

    if-eqz v22, :cond_4

    .line 557
    const-string v22, "\\r?\\n"

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 558
    .local v15, "newFirmwareVersion":[Ljava/lang/String;
    sget-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->signedusFlag:Z

    if-nez v22, :cond_4

    .line 559
    const/4 v9, 0x4

    .local v9, "i":I
    :goto_5
    array-length v0, v15

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v9, v0, :cond_3

    .line 560
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    aget-object v23, v15, v9

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br> "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 559
    add-int/lit8 v9, v9, 0x1

    goto :goto_5

    .line 562
    :cond_3
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br>"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 565
    .end local v9    # "i":I
    .end local v15    # "newFirmwareVersion":[Ljava/lang/String;
    :cond_4
    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "WeMoSignedUS"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_6

    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "Plug-in"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_6

    sget-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->signedusFlag:Z

    if-eqz v22, :cond_6

    .line 566
    const-string v22, "\\r?\\n"

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 567
    .restart local v15    # "newFirmwareVersion":[Ljava/lang/String;
    const/4 v9, 0x4

    .restart local v9    # "i":I
    :goto_6
    array-length v0, v15

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v9, v0, :cond_5

    .line 568
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    aget-object v23, v15, v9

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br> "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 567
    add-int/lit8 v9, v9, 0x1

    goto :goto_6

    .line 570
    :cond_5
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br>"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 572
    .end local v9    # "i":I
    .end local v15    # "newFirmwareVersion":[Ljava/lang/String;
    :cond_6
    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "WeMoOpenWRTSNS"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_8

    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "Plug-in"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_8

    sget-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTSNS:Z

    if-eqz v22, :cond_8

    .line 573
    const-string v22, "\\r?\\n"

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 574
    .restart local v15    # "newFirmwareVersion":[Ljava/lang/String;
    const/4 v9, 0x4

    .restart local v9    # "i":I
    :goto_7
    array-length v0, v15

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v9, v0, :cond_7

    .line 575
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    aget-object v23, v15, v9

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br> "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 574
    add-int/lit8 v9, v9, 0x1

    goto :goto_7

    .line 577
    :cond_7
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br>"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 579
    .end local v9    # "i":I
    .end local v15    # "newFirmwareVersion":[Ljava/lang/String;
    :cond_8
    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "WeMoOpenWRTTransSNS"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_a

    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "Plug-in"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_a

    sget-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTTransSNS:Z

    if-eqz v22, :cond_a

    .line 580
    const-string v22, "\\r?\\n"

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 581
    .restart local v15    # "newFirmwareVersion":[Ljava/lang/String;
    sget-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTSNS:Z

    if-nez v22, :cond_a

    .line 582
    const/4 v9, 0x4

    .restart local v9    # "i":I
    :goto_8
    array-length v0, v15

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v9, v0, :cond_9

    .line 583
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    aget-object v23, v15, v9

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br> "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 582
    add-int/lit8 v9, v9, 0x1

    goto :goto_8

    .line 585
    :cond_9
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br>"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 588
    .end local v9    # "i":I
    .end local v15    # "newFirmwareVersion":[Ljava/lang/String;
    :cond_a
    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "WeMoEU"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_c

    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "Plug-in"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_c

    sget-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->euFlag:Z

    if-eqz v22, :cond_c

    .line 589
    const-string v22, "\\r?\\n"

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 590
    .restart local v15    # "newFirmwareVersion":[Ljava/lang/String;
    sget-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->signedeuFlag:Z

    if-nez v22, :cond_c

    .line 591
    const/4 v9, 0x4

    .restart local v9    # "i":I
    :goto_9
    array-length v0, v15

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v9, v0, :cond_b

    .line 592
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    aget-object v23, v15, v9

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br> "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 591
    add-int/lit8 v9, v9, 0x1

    goto :goto_9

    .line 594
    :cond_b
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br>"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 598
    .end local v9    # "i":I
    .end local v15    # "newFirmwareVersion":[Ljava/lang/String;
    :cond_c
    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "WeMoSignedEU"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_e

    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "Plug-in"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_e

    sget-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->signedeuFlag:Z

    if-eqz v22, :cond_e

    .line 599
    const-string v22, "\\r?\\n"

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 600
    .restart local v15    # "newFirmwareVersion":[Ljava/lang/String;
    const/4 v9, 0x4

    .restart local v9    # "i":I
    :goto_a
    array-length v0, v15

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v9, v0, :cond_d

    .line 601
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    aget-object v23, v15, v9

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br> "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 600
    add-int/lit8 v9, v9, 0x1

    goto :goto_a

    .line 603
    :cond_d
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br>"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 605
    .end local v9    # "i":I
    .end local v15    # "newFirmwareVersion":[Ljava/lang/String;
    :cond_e
    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "WeMoWW_BRIDGE"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_10

    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "Plug-in"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_10

    sget-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->bridgewwFlag:Z

    if-eqz v22, :cond_10

    .line 606
    const-string v22, "\\r?\\n"

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 608
    .restart local v15    # "newFirmwareVersion":[Ljava/lang/String;
    const/4 v9, 0x4

    .restart local v9    # "i":I
    :goto_b
    array-length v0, v15

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v9, v0, :cond_f

    .line 609
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    aget-object v23, v15, v9

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br> "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 608
    add-int/lit8 v9, v9, 0x1

    goto :goto_b

    .line 611
    :cond_f
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br>"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 613
    .end local v9    # "i":I
    .end local v15    # "newFirmwareVersion":[Ljava/lang/String;
    :cond_10
    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "WeMoLightSwitch"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_12

    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "Plug-in"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_12

    sget-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->lightFlag:Z

    if-eqz v22, :cond_12

    .line 614
    const-string v22, "\\r?\\n"

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 615
    .restart local v15    # "newFirmwareVersion":[Ljava/lang/String;
    sget-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->signedLightFlag:Z

    if-nez v22, :cond_12

    .line 616
    const/4 v9, 0x4

    .restart local v9    # "i":I
    :goto_c
    array-length v0, v15

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v9, v0, :cond_11

    .line 617
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    aget-object v23, v15, v9

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br> "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 616
    add-int/lit8 v9, v9, 0x1

    goto :goto_c

    .line 619
    :cond_11
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br>"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 622
    .end local v9    # "i":I
    .end local v15    # "newFirmwareVersion":[Ljava/lang/String;
    :cond_12
    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "WeMoOpenWRTLightSwitch"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_14

    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "Plug-in"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_14

    sget-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTlight:Z

    if-eqz v22, :cond_14

    .line 623
    const-string v22, "\\r?\\n"

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 624
    .restart local v15    # "newFirmwareVersion":[Ljava/lang/String;
    const/4 v9, 0x4

    .restart local v9    # "i":I
    :goto_d
    array-length v0, v15

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v9, v0, :cond_13

    .line 625
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    aget-object v23, v15, v9

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br> "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 624
    add-int/lit8 v9, v9, 0x1

    goto :goto_d

    .line 627
    :cond_13
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br>"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 629
    .end local v9    # "i":I
    .end local v15    # "newFirmwareVersion":[Ljava/lang/String;
    :cond_14
    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "WeMoOpenWRTTransLightSwitch"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_16

    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "Plug-in"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_16

    sget-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTTranslight:Z

    if-eqz v22, :cond_16

    .line 630
    const-string v22, "\\r?\\n"

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 631
    .restart local v15    # "newFirmwareVersion":[Ljava/lang/String;
    sget-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTlight:Z

    if-nez v22, :cond_16

    .line 632
    const/4 v9, 0x4

    .restart local v9    # "i":I
    :goto_e
    array-length v0, v15

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v9, v0, :cond_15

    .line 633
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    aget-object v23, v15, v9

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br> "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 632
    add-int/lit8 v9, v9, 0x1

    goto :goto_e

    .line 635
    :cond_15
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br>"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 638
    .end local v9    # "i":I
    .end local v15    # "newFirmwareVersion":[Ljava/lang/String;
    :cond_16
    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "WeMoWW_Maker"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_18

    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "Plug-in"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_18

    sget-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->makerFlag:Z

    if-eqz v22, :cond_18

    .line 639
    const-string v22, "\\r?\\n"

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 640
    .restart local v15    # "newFirmwareVersion":[Ljava/lang/String;
    const/4 v9, 0x4

    .restart local v9    # "i":I
    :goto_f
    array-length v0, v15

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v9, v0, :cond_17

    .line 641
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    aget-object v23, v15, v9

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br> "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 640
    add-int/lit8 v9, v9, 0x1

    goto :goto_f

    .line 643
    :cond_17
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br>"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 645
    .end local v9    # "i":I
    .end local v15    # "newFirmwareVersion":[Ljava/lang/String;
    :cond_18
    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "WeMoSignedLightSwitch"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_1a

    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "Plug-in"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_1a

    sget-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->signedLightFlag:Z

    if-eqz v22, :cond_1a

    .line 646
    const-string v22, "\\r?\\n"

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 648
    .restart local v15    # "newFirmwareVersion":[Ljava/lang/String;
    const/4 v9, 0x4

    .restart local v9    # "i":I
    :goto_10
    array-length v0, v15

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v9, v0, :cond_19

    .line 649
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    aget-object v23, v15, v9

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br> "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 648
    add-int/lit8 v9, v9, 0x1

    goto :goto_10

    .line 651
    :cond_19
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br>"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 654
    .end local v9    # "i":I
    .end local v15    # "newFirmwareVersion":[Ljava/lang/String;
    :cond_1a
    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "WeMoInsight"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_1c

    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "Plug-in"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_1c

    sget-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->insightFlag:Z

    if-eqz v22, :cond_1c

    .line 655
    const-string v22, "\\r?\\n"

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 656
    .restart local v15    # "newFirmwareVersion":[Ljava/lang/String;
    sget-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->signedInsightFlag:Z

    if-nez v22, :cond_1c

    .line 657
    const/4 v9, 0x4

    .restart local v9    # "i":I
    :goto_11
    array-length v0, v15

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v9, v0, :cond_1b

    .line 658
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    aget-object v23, v15, v9

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br> "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 657
    add-int/lit8 v9, v9, 0x1

    goto :goto_11

    .line 660
    :cond_1b
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br>"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 663
    .end local v9    # "i":I
    .end local v15    # "newFirmwareVersion":[Ljava/lang/String;
    :cond_1c
    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "WeMoSignedInsight"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_1e

    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "Plug-in"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_1e

    sget-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->signedInsightFlag:Z

    if-eqz v22, :cond_1e

    .line 664
    const-string v22, "\\r?\\n"

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 665
    .restart local v15    # "newFirmwareVersion":[Ljava/lang/String;
    const/4 v9, 0x4

    .restart local v9    # "i":I
    :goto_12
    array-length v0, v15

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v9, v0, :cond_1d

    .line 666
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    aget-object v23, v15, v9

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br> "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 665
    add-int/lit8 v9, v9, 0x1

    goto :goto_12

    .line 668
    :cond_1d
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br>"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 671
    .end local v9    # "i":I
    .end local v15    # "newFirmwareVersion":[Ljava/lang/String;
    :cond_1e
    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "WeMoOpenWRTInsight"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_20

    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "Plug-in"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_20

    sget-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTinsight:Z

    if-eqz v22, :cond_20

    .line 672
    const-string v22, "\\r?\\n"

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 673
    .restart local v15    # "newFirmwareVersion":[Ljava/lang/String;
    const/4 v9, 0x4

    .restart local v9    # "i":I
    :goto_13
    array-length v0, v15

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v9, v0, :cond_1f

    .line 674
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    aget-object v23, v15, v9

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br> "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 673
    add-int/lit8 v9, v9, 0x1

    goto :goto_13

    .line 676
    :cond_1f
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br>"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 678
    .end local v9    # "i":I
    .end local v15    # "newFirmwareVersion":[Ljava/lang/String;
    :cond_20
    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "WeMoOpenWRTTransInsight"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_22

    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "Plug-in"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_22

    sget-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTTransinsight:Z

    if-eqz v22, :cond_22

    .line 679
    const-string v22, "\\r?\\n"

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 680
    .restart local v15    # "newFirmwareVersion":[Ljava/lang/String;
    sget-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTinsight:Z

    if-nez v22, :cond_22

    .line 681
    const/4 v9, 0x4

    .restart local v9    # "i":I
    :goto_14
    array-length v0, v15

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v9, v0, :cond_21

    .line 682
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    aget-object v23, v15, v9

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br> "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 681
    add-int/lit8 v9, v9, 0x1

    goto :goto_14

    .line 684
    :cond_21
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br>"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 688
    .end local v9    # "i":I
    .end local v15    # "newFirmwareVersion":[Ljava/lang/String;
    :cond_22
    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "WeMoWW_CROCKPOT"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_24

    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "Plug-in"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_24

    sget-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->slowcookerUSFlag:Z

    if-eqz v22, :cond_24

    .line 689
    const-string v22, "\\r?\\n"

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 690
    .restart local v15    # "newFirmwareVersion":[Ljava/lang/String;
    const/4 v9, 0x4

    .restart local v9    # "i":I
    :goto_15
    array-length v0, v15

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v9, v0, :cond_23

    .line 691
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    aget-object v23, v15, v9

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br> "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 690
    add-int/lit8 v9, v9, 0x1

    goto :goto_15

    .line 693
    :cond_23
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br>"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 696
    .end local v9    # "i":I
    .end local v15    # "newFirmwareVersion":[Ljava/lang/String;
    :cond_24
    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "WeMoWW_CoffeeMaker"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_26

    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "Plug-in"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_26

    sget-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->CoffeeMakerFlag:Z

    if-eqz v22, :cond_26

    .line 697
    const-string v22, "\\r?\\n"

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 698
    .restart local v15    # "newFirmwareVersion":[Ljava/lang/String;
    const/4 v9, 0x4

    .restart local v9    # "i":I
    :goto_16
    array-length v0, v15

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v9, v0, :cond_25

    .line 699
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    aget-object v23, v15, v9

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br> "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 698
    add-int/lit8 v9, v9, 0x1

    goto :goto_16

    .line 701
    :cond_25
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br>"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 704
    .end local v9    # "i":I
    .end local v15    # "newFirmwareVersion":[Ljava/lang/String;
    :cond_26
    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "WeMoWW_HeaterA"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_28

    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "Plug-in"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_28

    sget-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->HeaterAFlag:Z

    if-eqz v22, :cond_28

    .line 705
    const-string v22, "\\r?\\n"

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 707
    .restart local v15    # "newFirmwareVersion":[Ljava/lang/String;
    const/4 v9, 0x4

    .restart local v9    # "i":I
    :goto_17
    array-length v0, v15

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v9, v0, :cond_27

    .line 708
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    aget-object v23, v15, v9

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br> "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 707
    add-int/lit8 v9, v9, 0x1

    goto :goto_17

    .line 710
    :cond_27
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br>"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 713
    .end local v9    # "i":I
    .end local v15    # "newFirmwareVersion":[Ljava/lang/String;
    :cond_28
    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "WeMoWW_HeaterB"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_2a

    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "Plug-in"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_2a

    sget-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->HeaterBFlag:Z

    if-eqz v22, :cond_2a

    .line 714
    const-string v22, "\\r?\\n"

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 715
    .restart local v15    # "newFirmwareVersion":[Ljava/lang/String;
    const/4 v9, 0x4

    .restart local v9    # "i":I
    :goto_18
    array-length v0, v15

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v9, v0, :cond_29

    .line 716
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    aget-object v23, v15, v9

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br> "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 715
    add-int/lit8 v9, v9, 0x1

    goto :goto_18

    .line 718
    :cond_29
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br>"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 721
    .end local v9    # "i":I
    .end local v15    # "newFirmwareVersion":[Ljava/lang/String;
    :cond_2a
    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "WeMoWW_Humidifier"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_2c

    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "Plug-in"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_2c

    sget-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->HumidifierFlag:Z

    if-eqz v22, :cond_2c

    .line 722
    const-string v22, "\\r?\\n"

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 723
    .restart local v15    # "newFirmwareVersion":[Ljava/lang/String;
    const/4 v9, 0x4

    .restart local v9    # "i":I
    :goto_19
    array-length v0, v15

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v9, v0, :cond_2b

    .line 724
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    aget-object v23, v15, v9

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br> "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 723
    add-int/lit8 v9, v9, 0x1

    goto :goto_19

    .line 726
    :cond_2b
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br>"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 728
    .end local v9    # "i":I
    .end local v15    # "newFirmwareVersion":[Ljava/lang/String;
    :cond_2c
    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "WeMoWW_HumidifierB"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_2e

    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "Plug-in"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_2e

    sget-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->HumidifierBFlag:Z

    if-eqz v22, :cond_2e

    .line 729
    const-string v22, "\\r?\\n"

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 731
    .restart local v15    # "newFirmwareVersion":[Ljava/lang/String;
    const/4 v9, 0x4

    .restart local v9    # "i":I
    :goto_1a
    array-length v0, v15

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v9, v0, :cond_2d

    .line 732
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    aget-object v23, v15, v9

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br> "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 731
    add-int/lit8 v9, v9, 0x1

    goto :goto_1a

    .line 734
    :cond_2d
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br>"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 736
    .end local v9    # "i":I
    .end local v15    # "newFirmwareVersion":[Ljava/lang/String;
    :cond_2e
    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "WeMoWW_AirPurifier"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_30

    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "Plug-in"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_30

    sget-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->AirPurifierFlag:Z

    if-eqz v22, :cond_30

    .line 737
    const-string v22, "\\r?\\n"

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 738
    .restart local v15    # "newFirmwareVersion":[Ljava/lang/String;
    const/4 v9, 0x4

    .restart local v9    # "i":I
    :goto_1b
    array-length v0, v15

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v9, v0, :cond_2f

    .line 739
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    aget-object v23, v15, v9

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br> "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 738
    add-int/lit8 v9, v9, 0x1

    goto :goto_1b

    .line 741
    :cond_2f
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br>"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 744
    .end local v9    # "i":I
    .end local v15    # "newFirmwareVersion":[Ljava/lang/String;
    :cond_30
    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "WeMoWW_Bulb"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_32

    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "Plug-in"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_32

    sget-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->bulbWWflag:Z

    if-eqz v22, :cond_32

    .line 745
    const-string v22, "\\r?\\n"

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 746
    .restart local v15    # "newFirmwareVersion":[Ljava/lang/String;
    const/4 v9, 0x4

    .restart local v9    # "i":I
    :goto_1c
    array-length v0, v15

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v9, v0, :cond_31

    .line 747
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    aget-object v23, v15, v9

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br> "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 746
    add-int/lit8 v9, v9, 0x1

    goto :goto_1c

    .line 749
    :cond_31
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br>"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 752
    .end local v9    # "i":I
    .end local v15    # "newFirmwareVersion":[Ljava/lang/String;
    :cond_32
    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "WeMoOpenWRTInsight_v2"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_34

    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "Plug-in"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_34

    sget-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTInsightV2:Z

    if-eqz v22, :cond_34

    .line 753
    const-string v22, "\\r?\\n"

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 754
    .restart local v15    # "newFirmwareVersion":[Ljava/lang/String;
    const/4 v9, 0x4

    .restart local v9    # "i":I
    :goto_1d
    array-length v0, v15

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v9, v0, :cond_33

    .line 755
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    aget-object v23, v15, v9

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br> "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 754
    add-int/lit8 v9, v9, 0x1

    goto :goto_1d

    .line 757
    :cond_33
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br></br>"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 760
    .end local v9    # "i":I
    .end local v15    # "newFirmwareVersion":[Ljava/lang/String;
    :cond_34
    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "WeMoOpenWRTCROCKPOT"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_36

    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "Plug-in"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_36

    sget-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTSlowCooker:Z

    if-eqz v22, :cond_36

    .line 761
    const-string v22, "\\r?\\n"

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 762
    .restart local v15    # "newFirmwareVersion":[Ljava/lang/String;
    const/4 v9, 0x4

    .restart local v9    # "i":I
    :goto_1e
    array-length v0, v15

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v9, v0, :cond_35

    .line 763
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    aget-object v23, v15, v9

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br> "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 762
    add-int/lit8 v9, v9, 0x1

    goto :goto_1e

    .line 765
    :cond_35
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br>"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 767
    .end local v9    # "i":I
    .end local v15    # "newFirmwareVersion":[Ljava/lang/String;
    :cond_36
    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "WeMoOpenWRTTransCROCKPOT"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_38

    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "Plug-in"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_38

    sget-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTTransSlowCooker:Z

    if-eqz v22, :cond_38

    .line 768
    const-string v22, "\\r?\\n"

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 769
    .restart local v15    # "newFirmwareVersion":[Ljava/lang/String;
    const/4 v9, 0x4

    .restart local v9    # "i":I
    :goto_1f
    array-length v0, v15

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v9, v0, :cond_37

    .line 770
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    aget-object v23, v15, v9

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br> "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 769
    add-int/lit8 v9, v9, 0x1

    goto :goto_1f

    .line 772
    :cond_37
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br>"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 774
    .end local v9    # "i":I
    .end local v15    # "newFirmwareVersion":[Ljava/lang/String;
    :cond_38
    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "WeMoOpenWRTTransHumidifier"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_3a

    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "Plug-in"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_3a

    sget-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTTransHumidifier:Z

    if-eqz v22, :cond_3a

    .line 775
    const-string v22, "\\r?\\n"

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 776
    .restart local v15    # "newFirmwareVersion":[Ljava/lang/String;
    const/4 v9, 0x4

    .restart local v9    # "i":I
    :goto_20
    array-length v0, v15

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v9, v0, :cond_39

    .line 777
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    aget-object v23, v15, v9

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br> "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 776
    add-int/lit8 v9, v9, 0x1

    goto :goto_20

    .line 779
    :cond_39
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br>"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 781
    .end local v9    # "i":I
    .end local v15    # "newFirmwareVersion":[Ljava/lang/String;
    :cond_3a
    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "WeMoOpenWRTHumidifier"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_3c

    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "Plug-in"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_3c

    sget-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTHumidifier:Z

    if-eqz v22, :cond_3c

    .line 782
    const-string v22, "\\r?\\n"

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 783
    .restart local v15    # "newFirmwareVersion":[Ljava/lang/String;
    const/4 v9, 0x4

    .restart local v9    # "i":I
    :goto_21
    array-length v0, v15

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v9, v0, :cond_3b

    .line 784
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    aget-object v23, v15, v9

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br> "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 783
    add-int/lit8 v9, v9, 0x1

    goto :goto_21

    .line 786
    :cond_3b
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br>"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 788
    .end local v9    # "i":I
    .end local v15    # "newFirmwareVersion":[Ljava/lang/String;
    :cond_3c
    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "WeMoOpenWRTTransHumidifierB"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_3e

    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "Plug-in"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_3e

    sget-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTTransHumidifierB:Z

    if-eqz v22, :cond_3e

    .line 789
    const-string v22, "\\r?\\n"

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 791
    .restart local v15    # "newFirmwareVersion":[Ljava/lang/String;
    const/4 v9, 0x4

    .restart local v9    # "i":I
    :goto_22
    array-length v0, v15

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v9, v0, :cond_3d

    .line 792
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    aget-object v23, v15, v9

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br> "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 791
    add-int/lit8 v9, v9, 0x1

    goto :goto_22

    .line 794
    :cond_3d
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br>"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 796
    .end local v9    # "i":I
    .end local v15    # "newFirmwareVersion":[Ljava/lang/String;
    :cond_3e
    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "WeMoOpenWRTHumidifierB"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_40

    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "Plug-in"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_40

    sget-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTHumidifierB:Z

    if-eqz v22, :cond_40

    .line 797
    const-string v22, "\\r?\\n"

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 799
    .restart local v15    # "newFirmwareVersion":[Ljava/lang/String;
    const/4 v9, 0x4

    .restart local v9    # "i":I
    :goto_23
    array-length v0, v15

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v9, v0, :cond_3f

    .line 800
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    aget-object v23, v15, v9

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br> "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 799
    add-int/lit8 v9, v9, 0x1

    goto :goto_23

    .line 802
    :cond_3f
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br>"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 804
    .end local v9    # "i":I
    .end local v15    # "newFirmwareVersion":[Ljava/lang/String;
    :cond_40
    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "WeMoOpenWRTTransMaker"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_42

    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "Plug-in"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_42

    sget-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTTransMaker:Z

    if-eqz v22, :cond_42

    .line 805
    const-string v22, "\\r?\\n"

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 806
    .restart local v15    # "newFirmwareVersion":[Ljava/lang/String;
    const/4 v9, 0x4

    .restart local v9    # "i":I
    :goto_24
    array-length v0, v15

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v9, v0, :cond_41

    .line 807
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    aget-object v23, v15, v9

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br> "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 806
    add-int/lit8 v9, v9, 0x1

    goto :goto_24

    .line 809
    :cond_41
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br>"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 811
    .end local v9    # "i":I
    .end local v15    # "newFirmwareVersion":[Ljava/lang/String;
    :cond_42
    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "WeMoOpenWRTMaker"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_44

    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "Plug-in"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_44

    sget-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTMaker:Z

    if-eqz v22, :cond_44

    .line 812
    const-string v22, "\\r?\\n"

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 813
    .restart local v15    # "newFirmwareVersion":[Ljava/lang/String;
    const/4 v9, 0x4

    .restart local v9    # "i":I
    :goto_25
    array-length v0, v15

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v9, v0, :cond_43

    .line 814
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    aget-object v23, v15, v9

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br> "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 813
    add-int/lit8 v9, v9, 0x1

    goto :goto_25

    .line 816
    :cond_43
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br>"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 818
    .end local v9    # "i":I
    .end local v15    # "newFirmwareVersion":[Ljava/lang/String;
    :cond_44
    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "WeMoOpenWRTTransHeaterA"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_46

    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "Plug-in"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_46

    sget-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTTransHeaterA:Z

    if-eqz v22, :cond_46

    .line 819
    const-string v22, "\\r?\\n"

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 820
    .restart local v15    # "newFirmwareVersion":[Ljava/lang/String;
    const/4 v9, 0x4

    .restart local v9    # "i":I
    :goto_26
    array-length v0, v15

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v9, v0, :cond_45

    .line 821
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    aget-object v23, v15, v9

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br> "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 820
    add-int/lit8 v9, v9, 0x1

    goto :goto_26

    .line 823
    :cond_45
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br>"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 825
    .end local v9    # "i":I
    .end local v15    # "newFirmwareVersion":[Ljava/lang/String;
    :cond_46
    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "WeMoOpenWRTHeaterA"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_48

    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "Plug-in"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_48

    sget-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTHeaterA:Z

    if-eqz v22, :cond_48

    .line 826
    const-string v22, "\\r?\\n"

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 827
    .restart local v15    # "newFirmwareVersion":[Ljava/lang/String;
    const/4 v9, 0x4

    .restart local v9    # "i":I
    :goto_27
    array-length v0, v15

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v9, v0, :cond_47

    .line 828
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    aget-object v23, v15, v9

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br> "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 827
    add-int/lit8 v9, v9, 0x1

    goto :goto_27

    .line 830
    :cond_47
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br>"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 832
    .end local v9    # "i":I
    .end local v15    # "newFirmwareVersion":[Ljava/lang/String;
    :cond_48
    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "WeMoOpenWRTTransHeaterB"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_4a

    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "Plug-in"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_4a

    sget-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTTransHeaterB:Z

    if-eqz v22, :cond_4a

    .line 833
    const-string v22, "\\r?\\n"

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 834
    .restart local v15    # "newFirmwareVersion":[Ljava/lang/String;
    const/4 v9, 0x4

    .restart local v9    # "i":I
    :goto_28
    array-length v0, v15

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v9, v0, :cond_49

    .line 835
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    aget-object v23, v15, v9

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br> "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 834
    add-int/lit8 v9, v9, 0x1

    goto :goto_28

    .line 837
    :cond_49
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br>"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 839
    .end local v9    # "i":I
    .end local v15    # "newFirmwareVersion":[Ljava/lang/String;
    :cond_4a
    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "WeMoOpenWRTHeaterB"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_4c

    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "Plug-in"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_4c

    sget-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTHeaterB:Z

    if-eqz v22, :cond_4c

    .line 840
    const-string v22, "\\r?\\n"

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 841
    .restart local v15    # "newFirmwareVersion":[Ljava/lang/String;
    const/4 v9, 0x4

    .restart local v9    # "i":I
    :goto_29
    array-length v0, v15

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v9, v0, :cond_4b

    .line 842
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    aget-object v23, v15, v9

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br> "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 841
    add-int/lit8 v9, v9, 0x1

    goto :goto_29

    .line 844
    :cond_4b
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br>"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 846
    .end local v9    # "i":I
    .end local v15    # "newFirmwareVersion":[Ljava/lang/String;
    :cond_4c
    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "WeMoOpenWRTTransCoffeeMaker"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_4e

    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "Plug-in"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_4e

    sget-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTTransCoffeeMaker:Z

    if-eqz v22, :cond_4e

    .line 847
    const-string v22, "\\r?\\n"

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 848
    .restart local v15    # "newFirmwareVersion":[Ljava/lang/String;
    const/4 v9, 0x4

    .restart local v9    # "i":I
    :goto_2a
    array-length v0, v15

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v9, v0, :cond_4d

    .line 849
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    aget-object v23, v15, v9

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br> "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 848
    add-int/lit8 v9, v9, 0x1

    goto :goto_2a

    .line 851
    :cond_4d
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br>"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 853
    .end local v9    # "i":I
    .end local v15    # "newFirmwareVersion":[Ljava/lang/String;
    :cond_4e
    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "WeMoOpenWRTCoffeeMaker"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_50

    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "Plug-in"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_50

    sget-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTCoffeeMaker:Z

    if-eqz v22, :cond_50

    .line 854
    const-string v22, "\\r?\\n"

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 855
    .restart local v15    # "newFirmwareVersion":[Ljava/lang/String;
    const/4 v9, 0x4

    .restart local v9    # "i":I
    :goto_2b
    array-length v0, v15

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v9, v0, :cond_4f

    .line 856
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    aget-object v23, v15, v9

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br> "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 855
    add-int/lit8 v9, v9, 0x1

    goto :goto_2b

    .line 858
    :cond_4f
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br>"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 860
    .end local v9    # "i":I
    .end local v15    # "newFirmwareVersion":[Ljava/lang/String;
    :cond_50
    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "WeMoOpenWRTTransAirPurifier"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_52

    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "Plug-in"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_52

    sget-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTTransAirPurifier:Z

    if-eqz v22, :cond_52

    .line 861
    const-string v22, "\\r?\\n"

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 862
    .restart local v15    # "newFirmwareVersion":[Ljava/lang/String;
    const/4 v9, 0x4

    .restart local v9    # "i":I
    :goto_2c
    array-length v0, v15

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v9, v0, :cond_51

    .line 863
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    aget-object v23, v15, v9

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br> "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 862
    add-int/lit8 v9, v9, 0x1

    goto :goto_2c

    .line 865
    :cond_51
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br>"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 867
    .end local v9    # "i":I
    .end local v15    # "newFirmwareVersion":[Ljava/lang/String;
    :cond_52
    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "WeMoOpenWRTAirPurifier"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_54

    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "Plug-in"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_54

    sget-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTAirPurifier:Z

    if-eqz v22, :cond_54

    .line 868
    const-string v22, "\\r?\\n"

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 869
    .restart local v15    # "newFirmwareVersion":[Ljava/lang/String;
    const/4 v9, 0x4

    .restart local v9    # "i":I
    :goto_2d
    array-length v0, v15

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v9, v0, :cond_53

    .line 870
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    aget-object v23, v15, v9

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br> "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 869
    add-int/lit8 v9, v9, 0x1

    goto :goto_2d

    .line 872
    :cond_53
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br>"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 874
    .end local v9    # "i":I
    .end local v15    # "newFirmwareVersion":[Ljava/lang/String;
    :cond_54
    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "WeMoWW_OsramGardenSpotLED"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_56

    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "Plug-in"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_56

    sget-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->GardenspotRGBFlag:Z

    if-eqz v22, :cond_56

    .line 875
    const-string v22, "\\r?\\n"

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 876
    .restart local v15    # "newFirmwareVersion":[Ljava/lang/String;
    const/4 v9, 0x4

    .restart local v9    # "i":I
    :goto_2e
    array-length v0, v15

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v9, v0, :cond_55

    .line 877
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    aget-object v23, v15, v9

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br> "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 876
    add-int/lit8 v9, v9, 0x1

    goto :goto_2e

    .line 879
    :cond_55
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br>"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 881
    .end local v9    # "i":I
    .end local v15    # "newFirmwareVersion":[Ljava/lang/String;
    :cond_56
    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "WeMoWW_OsramTWBulb"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_58

    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "Plug-in"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_58

    sget-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->ClassicA60TWFlag:Z

    if-eqz v22, :cond_58

    .line 882
    const-string v22, "\\r?\\n"

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 883
    .restart local v15    # "newFirmwareVersion":[Ljava/lang/String;
    const/4 v9, 0x4

    .restart local v9    # "i":I
    :goto_2f
    array-length v0, v15

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v9, v0, :cond_57

    .line 884
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    aget-object v23, v15, v9

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br> "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 883
    add-int/lit8 v9, v9, 0x1

    goto :goto_2f

    .line 886
    :cond_57
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br>"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 888
    .end local v9    # "i":I
    .end local v15    # "newFirmwareVersion":[Ljava/lang/String;
    :cond_58
    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "WeMoWW_OsramFlexLED"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_5a

    const/16 v22, 0x0

    aget-object v22, v8, v22

    const-string v23, "Plug-in"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_5a

    sget-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->FlexRGBWFlag:Z

    if-eqz v22, :cond_5a

    .line 889
    const-string v22, "\\r?\\n"

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 890
    .restart local v15    # "newFirmwareVersion":[Ljava/lang/String;
    const/4 v9, 0x4

    .restart local v9    # "i":I
    :goto_30
    array-length v0, v15

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v9, v0, :cond_59

    .line 891
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    aget-object v23, v15, v9

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br> "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 890
    add-int/lit8 v9, v9, 0x1

    goto :goto_30

    .line 893
    :cond_59
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "</br>"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 552
    .end local v9    # "i":I
    .end local v15    # "newFirmwareVersion":[Ljava/lang/String;
    :cond_5a
    add-int/lit8 v10, v10, 0x1

    goto/16 :goto_4

    .line 897
    .end local v3    # "arr$":[Ljava/lang/String;
    .end local v8    # "firmwareName":[Ljava/lang/String;
    .end local v10    # "i$":I
    .end local v13    # "len$":I
    .end local v20    # "string":Ljava/lang/String;
    :cond_5b
    sget-object v22, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "firmware text ------------- ## "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual {v6}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 898
    const/16 v22, 0x0

    sput-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->usFlag:Z

    .line 899
    const/16 v22, 0x0

    sput-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->euFlag:Z

    .line 900
    const/16 v22, 0x0

    sput-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->lightFlag:Z

    .line 901
    const/16 v22, 0x0

    sput-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->insightFlag:Z

    .line 902
    const/16 v22, 0x0

    sput-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->bridgewwFlag:Z

    .line 903
    const/16 v22, 0x0

    sput-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->signedInsightFlag:Z

    .line 904
    const/16 v22, 0x0

    sput-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->signedusFlag:Z

    .line 905
    const/16 v22, 0x0

    sput-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->signedeuFlag:Z

    .line 906
    const/16 v22, 0x0

    sput-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->signedLightFlag:Z

    .line 907
    const/16 v22, 0x0

    sput-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->slowcookerUSFlag:Z

    .line 908
    const/16 v22, 0x0

    sput-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->wemoSmartFlag:Z

    .line 909
    const/16 v22, 0x0

    sput-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->makerFlag:Z

    .line 910
    const/16 v22, 0x0

    sput-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->bulbWWflag:Z

    .line 911
    const/16 v22, 0x0

    sput-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTinsight:Z

    .line 912
    const/16 v22, 0x0

    sput-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTlight:Z

    .line 913
    const/16 v22, 0x0

    sput-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTSNS:Z

    .line 914
    const/16 v22, 0x0

    sput-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTTranslight:Z

    .line 915
    const/16 v22, 0x0

    sput-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTTransinsight:Z

    .line 916
    const/16 v22, 0x0

    sput-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTTransSNS:Z

    .line 917
    const/16 v22, 0x0

    sput-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTInsightV2:Z

    .line 918
    const/16 v22, 0x0

    sput-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTSlowCooker:Z

    .line 919
    const/16 v22, 0x0

    sput-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTTransSlowCooker:Z

    .line 920
    const/16 v22, 0x0

    sput-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTMaker:Z

    .line 921
    const/16 v22, 0x0

    sput-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTTransMaker:Z

    .line 922
    const/16 v22, 0x0

    sput-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTTransHumidifier:Z

    .line 923
    const/16 v22, 0x0

    sput-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTTransHumidifierB:Z

    .line 924
    const/16 v22, 0x0

    sput-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTHumidifier:Z

    .line 925
    const/16 v22, 0x0

    sput-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTHumidifierB:Z

    .line 926
    const/16 v22, 0x0

    sput-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTTransHeaterA:Z

    .line 927
    const/16 v22, 0x0

    sput-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTHeaterA:Z

    .line 928
    const/16 v22, 0x0

    sput-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTTransHeaterB:Z

    .line 929
    const/16 v22, 0x0

    sput-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTHeaterB:Z

    .line 930
    const/16 v22, 0x0

    sput-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTTransAirPurifier:Z

    .line 931
    const/16 v22, 0x0

    sput-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTAirPurifier:Z

    .line 932
    const/16 v22, 0x0

    sput-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTTransCoffeeMaker:Z

    .line 933
    const/16 v22, 0x0

    sput-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->openWRTCoffeeMaker:Z

    .line 934
    const/16 v22, 0x0

    sput-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->HumidifierFlag:Z

    .line 935
    const/16 v22, 0x0

    sput-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->HumidifierBFlag:Z

    .line 936
    const/16 v22, 0x0

    sput-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->CoffeeMakerFlag:Z

    .line 937
    const/16 v22, 0x0

    sput-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->HeaterAFlag:Z

    .line 938
    const/16 v22, 0x0

    sput-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->HeaterBFlag:Z

    .line 939
    const/16 v22, 0x0

    sput-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->AirPurifierFlag:Z

    .line 940
    const/16 v22, 0x0

    sput-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->GardenspotRGBFlag:Z

    .line 941
    const/16 v22, 0x0

    sput-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->ClassicA60TWFlag:Z

    .line 942
    const/16 v22, 0x0

    sput-boolean v22, Lcom/belkin/wemo/cache/utils/MoreUtil;->FlexRGBWFlag:Z
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 948
    if-eqz v12, :cond_5c

    .line 949
    :try_start_5
    invoke-virtual {v12}, Ljava/io/BufferedReader;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    :cond_5c
    :goto_31
    move-object v11, v12

    .end local v12    # "in":Ljava/io/BufferedReader;
    .restart local v11    # "in":Ljava/io/BufferedReader;
    move-object v7, v6

    .line 953
    .end local v6    # "firmwareDetails":Ljava/lang/String;
    .restart local v7    # "firmwareDetails":Ljava/lang/String;
    goto/16 :goto_3

    .line 951
    .end local v7    # "firmwareDetails":Ljava/lang/String;
    .end local v11    # "in":Ljava/io/BufferedReader;
    .restart local v6    # "firmwareDetails":Ljava/lang/String;
    .restart local v12    # "in":Ljava/io/BufferedReader;
    :catch_1
    move-exception v5

    .line 952
    .local v5, "e":Ljava/io/IOException;
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_31

    .line 951
    .end local v4    # "client":Lorg/apache/http/client/HttpClient;
    .end local v12    # "in":Ljava/io/BufferedReader;
    .end local v14    # "line":Ljava/lang/String;
    .end local v17    # "request":Lorg/apache/http/client/methods/HttpGet;
    .end local v18    # "response":Lorg/apache/http/HttpResponse;
    .end local v19    # "sb":Ljava/lang/StringBuffer;
    .end local v21    # "strings":[Ljava/lang/String;
    .local v5, "e":Ljava/lang/Exception;
    .restart local v11    # "in":Ljava/io/BufferedReader;
    :catch_2
    move-exception v5

    .line 952
    .local v5, "e":Ljava/io/IOException;
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_2

    .line 947
    .end local v5    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v22

    .line 948
    :goto_32
    if-eqz v11, :cond_5d

    .line 949
    :try_start_6
    invoke-virtual {v11}, Ljava/io/BufferedReader;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_3

    .line 953
    :cond_5d
    :goto_33
    throw v22

    .line 951
    :catch_3
    move-exception v5

    .line 952
    .restart local v5    # "e":Ljava/io/IOException;
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_33

    .line 947
    .end local v5    # "e":Ljava/io/IOException;
    .end local v11    # "in":Ljava/io/BufferedReader;
    .restart local v4    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v12    # "in":Ljava/io/BufferedReader;
    .restart local v17    # "request":Lorg/apache/http/client/methods/HttpGet;
    .restart local v18    # "response":Lorg/apache/http/HttpResponse;
    :catchall_1
    move-exception v22

    move-object v11, v12

    .end local v12    # "in":Ljava/io/BufferedReader;
    .restart local v11    # "in":Ljava/io/BufferedReader;
    goto :goto_32

    .line 944
    .end local v4    # "client":Lorg/apache/http/client/HttpClient;
    .end local v17    # "request":Lorg/apache/http/client/methods/HttpGet;
    .end local v18    # "response":Lorg/apache/http/HttpResponse;
    :catch_4
    move-exception v5

    goto/16 :goto_1
.end method

.method public getFirmwareDetailsUSWW(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 20
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 418
    const/4 v7, 0x0

    .line 419
    .local v7, "in":Ljava/io/BufferedReader;
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 420
    .local v5, "firmWareArrayseSet":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v11, ""

    .line 422
    .local v11, "page":Ljava/lang/String;
    :try_start_0
    new-instance v3, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v3}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 423
    .local v3, "client":Lorg/apache/http/client/HttpClient;
    new-instance v12, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {v12}, Lorg/apache/http/client/methods/HttpGet;-><init>()V

    .line 424
    .local v12, "request":Lorg/apache/http/client/methods/HttpGet;
    new-instance v17, Ljava/net/URI;

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v17

    invoke-virtual {v12, v0}, Lorg/apache/http/client/methods/HttpGet;->setURI(Ljava/net/URI;)V

    .line 425
    invoke-interface {v3, v12}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v13

    .line 426
    .local v13, "response":Lorg/apache/http/HttpResponse;
    new-instance v8, Ljava/io/BufferedReader;

    new-instance v17, Ljava/io/InputStreamReader;

    invoke-interface {v13}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v18

    invoke-interface/range {v18 .. v18}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    move-object/from16 v0, v17

    invoke-direct {v8, v0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_5
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 428
    .end local v7    # "in":Ljava/io/BufferedReader;
    .local v8, "in":Ljava/io/BufferedReader;
    :try_start_1
    new-instance v14, Ljava/lang/StringBuffer;

    const-string v17, ""

    move-object/from16 v0, v17

    invoke-direct {v14, v0}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 429
    .local v14, "sb":Ljava/lang/StringBuffer;
    const-string v10, ""

    .line 430
    .local v10, "line":Ljava/lang/String;
    :cond_0
    :goto_0
    invoke-virtual {v8}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v10

    if-eqz v10, :cond_2

    .line 431
    const-string v17, ""

    move-object/from16 v0, v17

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_0

    .line 435
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v17

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, "\n"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v14, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    .line 493
    .end local v10    # "line":Ljava/lang/String;
    .end local v14    # "sb":Ljava/lang/StringBuffer;
    :catch_0
    move-exception v4

    move-object v7, v8

    .line 494
    .end local v3    # "client":Lorg/apache/http/client/HttpClient;
    .end local v8    # "in":Ljava/io/BufferedReader;
    .end local v12    # "request":Lorg/apache/http/client/methods/HttpGet;
    .end local v13    # "response":Lorg/apache/http/HttpResponse;
    .local v4, "e":Ljava/lang/Exception;
    .restart local v7    # "in":Ljava/io/BufferedReader;
    :goto_1
    :try_start_2
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 496
    if-eqz v7, :cond_7

    .line 498
    :try_start_3
    invoke-virtual {v7}, Ljava/io/BufferedReader;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    .line 507
    .end local v4    # "e":Ljava/lang/Exception;
    :goto_2
    :try_start_4
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    move-result v17

    if-gtz v17, :cond_1

    .line 508
    const/4 v5, 0x0

    .line 515
    .end local v5    # "firmWareArrayseSet":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_1
    :goto_3
    return-object v5

    .line 437
    .end local v7    # "in":Ljava/io/BufferedReader;
    .restart local v3    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v5    # "firmWareArrayseSet":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v8    # "in":Ljava/io/BufferedReader;
    .restart local v10    # "line":Ljava/lang/String;
    .restart local v12    # "request":Lorg/apache/http/client/methods/HttpGet;
    .restart local v13    # "response":Lorg/apache/http/HttpResponse;
    .restart local v14    # "sb":Ljava/lang/StringBuffer;
    :cond_2
    :try_start_5
    invoke-virtual {v8}, Ljava/io/BufferedReader;->close()V

    .line 438
    invoke-virtual {v14}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    .line 440
    const-string v17, "-----\\r?\\n"

    move-object/from16 v0, v17

    invoke-virtual {v11, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v16

    .line 441
    .local v16, "strings":[Ljava/lang/String;
    if-eqz v16, :cond_5

    .line 442
    move-object/from16 v2, v16

    .local v2, "arr$":[Ljava/lang/String;
    array-length v9, v2

    .local v9, "len$":I
    const/4 v6, 0x0

    .local v6, "i$":I
    :goto_4
    if-ge v6, v9, :cond_5

    aget-object v15, v2, v6

    .line 443
    .local v15, "string":Ljava/lang/String;
    const-string v17, "WeMoUS"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v17

    if-nez v17, :cond_3

    const-string v17, "WeMoEU"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v17

    if-nez v17, :cond_3

    const-string v17, "WeMoLightSwitch"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v17

    if-nez v17, :cond_3

    const-string v17, "WeMoInsight"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v17

    if-nez v17, :cond_3

    const-string v17, "WeMoSignedInsight"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v17

    if-nez v17, :cond_3

    const-string v17, "WeMoSignedLightSwitch"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v17

    if-nez v17, :cond_3

    const-string v17, "WeMoSignedUS"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v17

    if-nez v17, :cond_3

    const-string v17, "WeMoSignedEU"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v17

    if-nez v17, :cond_3

    const-string v17, "WeMoWW_CROCKPOT"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v17

    if-nez v17, :cond_3

    const-string v17, "WeMoWW_Maker"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v17

    if-nez v17, :cond_3

    const-string v17, "WeMoWW_BRIDGE"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v17

    if-nez v17, :cond_3

    const-string v17, "WeMoWW_Bulb"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v17

    if-nez v17, :cond_3

    const-string v17, "WeMoWW_OsramGardenSpotLED"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v17

    if-nez v17, :cond_3

    const-string v17, "WeMoWW_OsramTWBulb"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v17

    if-nez v17, :cond_3

    const-string v17, "WeMoWW_OsramFlexLED"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v17

    if-nez v17, :cond_3

    const-string v17, "WeMoWW_Heater"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v17

    if-nez v17, :cond_3

    const-string v17, "WeMoWW_HeaterA"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v17

    if-nez v17, :cond_3

    const-string v17, "WeMoWW_HeaterB"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v17

    if-nez v17, :cond_3

    const-string v17, "WeMoWW_Humidifier"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v17

    if-nez v17, :cond_3

    const-string v17, "WeMoWW_HumidifierB"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v17

    if-nez v17, :cond_3

    const-string v17, "WeMoOpenWRTAirPurifier"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v17

    if-nez v17, :cond_3

    const-string v17, "WeMoOpenWRTCoffeeMaker"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v17

    if-nez v17, :cond_3

    const-string v17, "WeMoOpenWRTCROCKPOT"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v17

    if-nez v17, :cond_3

    const-string v17, "WeMoOpenWRTHeaterA"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v17

    if-nez v17, :cond_3

    const-string v17, "WeMoOpenWRTHeaterB"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v17

    if-nez v17, :cond_3

    const-string v17, "WeMoOpenWRTHumidifier"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v17

    if-nez v17, :cond_3

    const-string v17, "WeMoOpenWRTHumidifierB"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v17

    if-nez v17, :cond_3

    const-string v17, "WeMoOpenWRTInsight"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v17

    if-nez v17, :cond_3

    const-string v17, "WeMoOpenWRTLightSwitch"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v17

    if-nez v17, :cond_3

    const-string v17, "WeMoOpenWRTMaker"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v17

    if-nez v17, :cond_3

    const-string v17, "WeMoOpenWRTSNS"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v17

    if-nez v17, :cond_3

    const-string v17, "WeMoOpenWRTTransAirPurifier"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v17

    if-nez v17, :cond_3

    const-string v17, "WeMoOpenWRTTransCoffeeMaker"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v17

    if-nez v17, :cond_3

    const-string v17, "WeMoOpenWRTTransCROCKPOT"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v17

    if-nez v17, :cond_3

    const-string v17, "WeMoOpenWRTTransHeaterA"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v17

    if-nez v17, :cond_3

    const-string v17, "WeMoOpenWRTTransHeaterB"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v17

    if-nez v17, :cond_3

    const-string v17, "WeMoOpenWRTTransHumidifier"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v17

    if-nez v17, :cond_3

    const-string v17, "WeMoOpenWRTTransHumidifierB"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v17

    if-nez v17, :cond_3

    const-string v17, "WeMoOpenWRTTransInsight"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v17

    if-nez v17, :cond_3

    const-string v17, "WeMoOpenWRTTransLightSwitch"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v17

    if-nez v17, :cond_3

    const-string v17, "WeMoOpenWRTTransMaker"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v17

    if-nez v17, :cond_3

    const-string v17, "WeMoOpenWRTTransSNS"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v17

    if-nez v17, :cond_3

    const-string v17, "WeMoWW_AirPurifier"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v17

    if-nez v17, :cond_3

    const-string v17, "WeMoOpenWRTInsight_v2"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v17

    if-eqz v17, :cond_4

    :cond_3
    const-string v17, "Plug-in"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v17

    if-nez v17, :cond_4

    .line 488
    const-string v17, "MoreUtil"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "Firmware res : "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 489
    invoke-virtual {v5, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 442
    :cond_4
    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_4

    .line 496
    .end local v2    # "arr$":[Ljava/lang/String;
    .end local v6    # "i$":I
    .end local v9    # "len$":I
    .end local v15    # "string":Ljava/lang/String;
    :cond_5
    if-eqz v8, :cond_6

    .line 498
    :try_start_6
    invoke-virtual {v8}, Ljava/io/BufferedReader;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1

    move-object v7, v8

    .line 501
    .end local v8    # "in":Ljava/io/BufferedReader;
    .restart local v7    # "in":Ljava/io/BufferedReader;
    goto/16 :goto_2

    .line 499
    .end local v7    # "in":Ljava/io/BufferedReader;
    .restart local v8    # "in":Ljava/io/BufferedReader;
    :catch_1
    move-exception v4

    .line 500
    .local v4, "e":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    move-object v7, v8

    .line 501
    .end local v8    # "in":Ljava/io/BufferedReader;
    .restart local v7    # "in":Ljava/io/BufferedReader;
    goto/16 :goto_2

    .line 503
    .end local v4    # "e":Ljava/io/IOException;
    .end local v7    # "in":Ljava/io/BufferedReader;
    .restart local v8    # "in":Ljava/io/BufferedReader;
    :cond_6
    const/4 v5, 0x0

    move-object v7, v8

    .end local v8    # "in":Ljava/io/BufferedReader;
    .restart local v7    # "in":Ljava/io/BufferedReader;
    goto/16 :goto_3

    .line 499
    .end local v3    # "client":Lorg/apache/http/client/HttpClient;
    .end local v10    # "line":Ljava/lang/String;
    .end local v12    # "request":Lorg/apache/http/client/methods/HttpGet;
    .end local v13    # "response":Lorg/apache/http/HttpResponse;
    .end local v14    # "sb":Ljava/lang/StringBuffer;
    .end local v16    # "strings":[Ljava/lang/String;
    .local v4, "e":Ljava/lang/Exception;
    :catch_2
    move-exception v4

    .line 500
    .local v4, "e":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_2

    .line 503
    .local v4, "e":Ljava/lang/Exception;
    :cond_7
    const/4 v5, 0x0

    goto/16 :goto_3

    .line 496
    .end local v4    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v17

    :goto_5
    if-eqz v7, :cond_8

    .line 498
    :try_start_7
    invoke-virtual {v7}, Ljava/io/BufferedReader;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_3

    .line 503
    :goto_6
    throw v17

    .line 499
    :catch_3
    move-exception v4

    .line 500
    .local v4, "e":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_6

    .line 503
    .end local v4    # "e":Ljava/io/IOException;
    :cond_8
    const/4 v5, 0x0

    goto/16 :goto_3

    .line 513
    :catch_4
    move-exception v4

    .line 514
    .local v4, "e":Ljava/lang/Exception;
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    .line 515
    const/4 v5, 0x0

    goto/16 :goto_3

    .line 496
    .end local v4    # "e":Ljava/lang/Exception;
    .end local v7    # "in":Ljava/io/BufferedReader;
    .restart local v3    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v8    # "in":Ljava/io/BufferedReader;
    .restart local v12    # "request":Lorg/apache/http/client/methods/HttpGet;
    .restart local v13    # "response":Lorg/apache/http/HttpResponse;
    :catchall_1
    move-exception v17

    move-object v7, v8

    .end local v8    # "in":Ljava/io/BufferedReader;
    .restart local v7    # "in":Ljava/io/BufferedReader;
    goto :goto_5

    .line 493
    .end local v3    # "client":Lorg/apache/http/client/HttpClient;
    .end local v12    # "request":Lorg/apache/http/client/methods/HttpGet;
    .end local v13    # "response":Lorg/apache/http/HttpResponse;
    :catch_5
    move-exception v4

    goto/16 :goto_1
.end method

.method public getFirmwareNumber(Ljava/lang/String;)I
    .locals 2
    .param p1, "firmwareVersion"    # Ljava/lang/String;

    .prologue
    .line 1491
    const-string v1, "\\."

    invoke-virtual {p1, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 1492
    .local v0, "firmWareNumber":[Ljava/lang/String;
    const/4 v1, 0x2

    aget-object v1, v0, v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    return v1
.end method

.method public getFirmwareNumberForBulb(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "firmwareVersion"    # Ljava/lang/String;

    .prologue
    .line 1500
    const-string v1, "_"

    invoke-virtual {p1, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 1501
    .local v0, "firmWareNumber":[Ljava/lang/String;
    const/4 v1, 0x4

    aget-object v1, v0, v1

    return-object v1
.end method

.method public getPackageName(Landroid/content/Context;)Ljava/lang/String;
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 219
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    .line 220
    .local v0, "packageName":Ljava/lang/String;
    return-object v0
.end method

.method public getRandomNumber(II)I
    .locals 4
    .param p1, "min"    # I
    .param p2, "max"    # I

    .prologue
    .line 1484
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v0

    sub-int v2, p2, p1

    add-int/lit8 v2, v2, 0x1

    int-to-double v2, v2

    mul-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    double-to-int v0, v0

    add-int/2addr v0, p1

    return v0
.end method

.method public getReUnionKey(Lcom/belkin/wemo/cache/utils/SharePreferences;)Ljava/lang/String;
    .locals 3
    .param p1, "sp"    # Lcom/belkin/wemo/cache/utils/SharePreferences;

    .prologue
    .line 1476
    const-string v0, "MoreUtil"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getReUnionKey reUnionKey: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getReUnionKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1477
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getReUnionKey()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    .line 1478
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/cache/utils/MoreUtil;->generateReUnionKey(Lcom/belkin/wemo/cache/utils/SharePreferences;)Ljava/lang/String;

    move-result-object v0

    .line 1480
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getReUnionKey()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getSignalStrength(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 11
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "selectedMAC"    # Ljava/lang/String;

    .prologue
    .line 365
    const-string v8, "connectivity"

    invoke-virtual {p1, v8}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/ConnectivityManager;

    .line 366
    .local v1, "cm":Landroid/net/ConnectivityManager;
    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    .line 368
    .local v0, "Info":Landroid/net/NetworkInfo;
    const/4 v3, 0x0

    .line 369
    .local v3, "level":I
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnectedOrConnecting()Z

    move-result v8

    if-nez v8, :cond_1

    .line 389
    :cond_0
    :goto_0
    if-nez v3, :cond_4

    const-string v8, "N/A"

    :goto_1
    return-object v8

    .line 371
    :cond_1
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getType()I

    move-result v4

    .line 372
    .local v4, "netType":I
    const/4 v8, 0x1

    if-ne v4, v8, :cond_3

    .line 373
    const-string v8, "wifi"

    invoke-virtual {p1, v8}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/net/wifi/WifiManager;

    .line 374
    .local v7, "wifiManager":Landroid/net/wifi/WifiManager;
    invoke-virtual {v7}, Landroid/net/wifi/WifiManager;->getScanResults()Ljava/util/List;

    move-result-object v6

    .line 375
    .local v6, "results":Ljava/util/List;, "Ljava/util/List<Landroid/net/wifi/ScanResult;>;"
    const/4 v8, 0x0

    invoke-interface {v6, v8}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 376
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v8

    if-ge v2, v8, :cond_0

    .line 377
    invoke-interface {v6, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/net/wifi/ScanResult;

    .line 378
    .local v5, "result":Landroid/net/wifi/ScanResult;
    iget-object v8, v5, Landroid/net/wifi/ScanResult;->BSSID:Ljava/lang/String;

    const-string v9, ":"

    const-string v10, ""

    invoke-virtual {v8, v9, v10}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p2, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 379
    iget v3, v5, Landroid/net/wifi/ScanResult;->level:I

    .line 380
    goto :goto_0

    .line 376
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 385
    .end local v2    # "i":I
    .end local v5    # "result":Landroid/net/wifi/ScanResult;
    .end local v6    # "results":Ljava/util/List;, "Ljava/util/List<Landroid/net/wifi/ScanResult;>;"
    .end local v7    # "wifiManager":Landroid/net/wifi/WifiManager;
    :cond_3
    if-nez v4, :cond_0

    goto :goto_0

    .line 389
    .end local v4    # "netType":I
    :cond_4
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    goto :goto_1
.end method

.method public getVersionNumber()Ljava/lang/String;
    .locals 1

    .prologue
    .line 226
    const-string v0, ""

    .line 227
    .local v0, "versionNumber":Ljava/lang/String;
    sget-object v0, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    .line 228
    return-object v0
.end method

.method public populateTagList()Ljava/util/HashMap;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .prologue
    const/4 v9, 0x4

    const/4 v8, 0x3

    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 109
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 110
    .local v0, "tagList":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 112
    .local v1, "tags":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-array v2, v9, [Ljava/lang/String;

    const-string v3, "makerFlag"

    aput-object v3, v2, v5

    const-string v3, "signedMakerFlag"

    aput-object v3, v2, v6

    const-string v3, "openWRTMaker"

    aput-object v3, v2, v7

    const-string v3, "openWRTTransMaker"

    aput-object v3, v2, v8

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 113
    const-string v2, "urn:Belkin:device:Maker:1"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    new-instance v1, Ljava/util/ArrayList;

    .end local v1    # "tags":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 116
    .restart local v1    # "tags":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v2, 0x6

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "usFlag"

    aput-object v3, v2, v5

    const-string v3, "euFlag"

    aput-object v3, v2, v6

    const-string v3, "signedusFlag"

    aput-object v3, v2, v7

    const-string v3, "signedeuFlag"

    aput-object v3, v2, v8

    const-string v3, "openWRTSNS"

    aput-object v3, v2, v9

    const/4 v3, 0x5

    const-string v4, "openWRTTransSNS"

    aput-object v4, v2, v3

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 117
    const-string v2, "urn:Belkin:device:sensor:1"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    const-string v2, "urn:Belkin:device:controllee:1"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    new-instance v1, Ljava/util/ArrayList;

    .end local v1    # "tags":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 121
    .restart local v1    # "tags":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-array v2, v9, [Ljava/lang/String;

    const-string v3, "lightFlag"

    aput-object v3, v2, v5

    const-string v3, "signedLightFlag"

    aput-object v3, v2, v6

    const-string v3, "openWRTlight"

    aput-object v3, v2, v7

    const-string v3, "openWRTTranslight"

    aput-object v3, v2, v8

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 122
    const-string v2, "urn:Belkin:device:lightswitch:1"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    new-instance v1, Ljava/util/ArrayList;

    .end local v1    # "tags":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 125
    .restart local v1    # "tags":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-array v2, v8, [Ljava/lang/String;

    const-string v3, "HumidifierFlag"

    aput-object v3, v2, v5

    const-string v3, "openWRTTransHumidifier"

    aput-object v3, v2, v6

    const-string v3, "openWRTHumidifier"

    aput-object v3, v2, v7

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 126
    const-string v2, "urn:Belkin:device:Humidifier:1"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 128
    new-instance v1, Ljava/util/ArrayList;

    .end local v1    # "tags":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 129
    .restart local v1    # "tags":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-array v2, v8, [Ljava/lang/String;

    const-string v3, "HumidifierBFlag"

    aput-object v3, v2, v5

    const-string v3, "openWRTTransHumidifierB"

    aput-object v3, v2, v6

    const-string v3, "openWRTHumidifierB"

    aput-object v3, v2, v7

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 130
    const-string v2, "urn:Belkin:device:HumidifierB:1"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    new-instance v1, Ljava/util/ArrayList;

    .end local v1    # "tags":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 133
    .restart local v1    # "tags":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-array v2, v8, [Ljava/lang/String;

    const-string v3, "slowcookerUSFlag"

    aput-object v3, v2, v5

    const-string v3, "openWRTSlowCooker"

    aput-object v3, v2, v6

    const-string v3, "openWRTTransSlowCooker"

    aput-object v3, v2, v7

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 137
    const-string v2, "urn:Belkin:device:crockpot:1"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    new-instance v1, Ljava/util/ArrayList;

    .end local v1    # "tags":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 140
    .restart local v1    # "tags":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "bridgewwFlag"

    aput-object v3, v2, v5

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 141
    const-string v2, "urn:Belkin:device:bridge:1"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    new-instance v1, Ljava/util/ArrayList;

    .end local v1    # "tags":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 144
    .restart local v1    # "tags":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "bulbWWflag"

    aput-object v3, v2, v5

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 145
    const-string v2, "MZ100"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 147
    new-instance v1, Ljava/util/ArrayList;

    .end local v1    # "tags":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 148
    .restart local v1    # "tags":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "AirPurifierFlag"

    aput-object v3, v2, v5

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 149
    const-string v2, "urn:Belkin:device:AirPurifier:1"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 151
    new-instance v1, Ljava/util/ArrayList;

    .end local v1    # "tags":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 152
    .restart local v1    # "tags":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "CoffeeMakerFlag"

    aput-object v3, v2, v5

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 153
    const-string v2, "urn:Belkin:device:CoffeeMaker:1"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    new-instance v1, Ljava/util/ArrayList;

    .end local v1    # "tags":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 156
    .restart local v1    # "tags":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "HeaterAFlag"

    aput-object v3, v2, v5

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 157
    const-string v2, "urn:Belkin:device:HeaterA:1"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 159
    new-instance v1, Ljava/util/ArrayList;

    .end local v1    # "tags":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 160
    .restart local v1    # "tags":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "HeaterBFlag"

    aput-object v3, v2, v5

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 161
    const-string v2, "urn:Belkin:device:HeaterB:1"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 163
    new-instance v1, Ljava/util/ArrayList;

    .end local v1    # "tags":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 164
    .restart local v1    # "tags":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-array v2, v9, [Ljava/lang/String;

    const-string v3, "insightFlag"

    aput-object v3, v2, v5

    const-string v3, "signedInsightFlag"

    aput-object v3, v2, v6

    const-string v3, "openWRTinsight"

    aput-object v3, v2, v7

    const-string v3, "openWRTTransinsight"

    aput-object v3, v2, v8

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 165
    const-string v2, "urn:Belkin:device:insight:1"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 167
    new-instance v1, Ljava/util/ArrayList;

    .end local v1    # "tags":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 168
    .restart local v1    # "tags":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "openWRTInsightV2"

    aput-object v3, v2, v5

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 170
    const-string v2, "urn:Belkin:device:insight:1v2"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 172
    new-instance v1, Ljava/util/ArrayList;

    .end local v1    # "tags":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 173
    .restart local v1    # "tags":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "GardenspotRGBFlag"

    aput-object v3, v2, v5

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 174
    const-string v2, "Gardenspot RGB"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 176
    new-instance v1, Ljava/util/ArrayList;

    .end local v1    # "tags":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 177
    .restart local v1    # "tags":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "ClassicA60TWFlag"

    aput-object v3, v2, v5

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 178
    const-string v2, "Classic A60 TW"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 180
    new-instance v1, Ljava/util/ArrayList;

    .end local v1    # "tags":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 181
    .restart local v1    # "tags":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "FlexRGBWFlag"

    aput-object v3, v2, v5

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 182
    const-string v2, "Flex RGBW"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 184
    return-object v0
.end method

.method public resetFWFlags(Ljava/lang/String;)V
    .locals 5
    .param p1, "deviceType"    # Ljava/lang/String;

    .prologue
    .line 192
    if-eqz p1, :cond_0

    .line 194
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/utils/MoreUtil;->populateTagList()Ljava/util/HashMap;

    move-result-object v2

    .line 196
    .local v2, "tagList":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/ArrayList;

    .line 197
    .local v3, "tags":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    if-eqz v3, :cond_0

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_0

    .line 198
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 200
    .local v1, "tag":Ljava/lang/String;
    invoke-direct {p0, v1}, Lcom/belkin/wemo/cache/utils/MoreUtil;->resetFieldValue(Ljava/lang/String;)Z

    goto :goto_0

    .line 205
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "tag":Ljava/lang/String;
    .end local v2    # "tagList":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .end local v3    # "tags":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_0
    return-void
.end method
