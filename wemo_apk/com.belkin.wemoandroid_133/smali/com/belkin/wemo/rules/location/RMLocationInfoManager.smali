.class public final enum Lcom/belkin/wemo/rules/location/RMLocationInfoManager;
.super Ljava/lang/Enum;
.source "RMLocationInfoManager.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/belkin/wemo/rules/location/RMLocationInfoManager;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/belkin/wemo/rules/location/RMLocationInfoManager;

.field public static final enum INSTANCE:Lcom/belkin/wemo/rules/location/RMLocationInfoManager;

.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 17
    new-instance v0, Lcom/belkin/wemo/rules/location/RMLocationInfoManager;

    const-string v1, "INSTANCE"

    invoke-direct {v0, v1, v2}, Lcom/belkin/wemo/rules/location/RMLocationInfoManager;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/belkin/wemo/rules/location/RMLocationInfoManager;->INSTANCE:Lcom/belkin/wemo/rules/location/RMLocationInfoManager;

    .line 15
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/belkin/wemo/rules/location/RMLocationInfoManager;

    sget-object v1, Lcom/belkin/wemo/rules/location/RMLocationInfoManager;->INSTANCE:Lcom/belkin/wemo/rules/location/RMLocationInfoManager;

    aput-object v1, v0, v2

    sput-object v0, Lcom/belkin/wemo/rules/location/RMLocationInfoManager;->$VALUES:[Lcom/belkin/wemo/rules/location/RMLocationInfoManager;

    .line 19
    const-class v0, Lcom/belkin/wemo/rules/location/RMLocationInfoManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/rules/location/RMLocationInfoManager;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 21
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 23
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/belkin/wemo/rules/location/RMLocationInfoManager;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 15
    const-class v0, Lcom/belkin/wemo/rules/location/RMLocationInfoManager;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/rules/location/RMLocationInfoManager;

    return-object v0
.end method

.method public static values()[Lcom/belkin/wemo/rules/location/RMLocationInfoManager;
    .locals 1

    .prologue
    .line 15
    sget-object v0, Lcom/belkin/wemo/rules/location/RMLocationInfoManager;->$VALUES:[Lcom/belkin/wemo/rules/location/RMLocationInfoManager;

    invoke-virtual {v0}, [Lcom/belkin/wemo/rules/location/RMLocationInfoManager;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/belkin/wemo/rules/location/RMLocationInfoManager;

    return-object v0
.end method


# virtual methods
.method public read(Lcom/belkin/wemo/rules/location/callback/RMReadLocationSuccessCallback;Lcom/belkin/wemo/rules/location/callback/RMReadLocationErrorCallback;)V
    .locals 6
    .param p1, "successCallback"    # Lcom/belkin/wemo/rules/location/callback/RMReadLocationSuccessCallback;
    .param p2, "errorCallback"    # Lcom/belkin/wemo/rules/location/callback/RMReadLocationErrorCallback;

    .prologue
    .line 61
    :try_start_0
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->readLocationInfo()Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;

    move-result-object v2

    .line 62
    .local v2, "row":Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;
    if-eqz v2, :cond_1

    .line 63
    new-instance v1, Lcom/belkin/wemo/rules/data/RMLocationInfo;

    invoke-direct {v1}, Lcom/belkin/wemo/rules/data/RMLocationInfo;-><init>()V

    .line 65
    .local v1, "locationInfo":Lcom/belkin/wemo/rules/data/RMLocationInfo;
    invoke-virtual {v2}, Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;->getCityName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/belkin/wemo/rules/data/RMLocationInfo;->setCityName(Ljava/lang/String;)V

    .line 66
    invoke-virtual {v2}, Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;->getCountryCode()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/belkin/wemo/rules/data/RMLocationInfo;->setCountryCode(Ljava/lang/String;)V

    .line 67
    invoke-virtual {v2}, Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;->getCountryName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/belkin/wemo/rules/data/RMLocationInfo;->setCountryName(Ljava/lang/String;)V

    .line 68
    invoke-virtual {v2}, Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;->getLatitude()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    float-to-double v4, v3

    invoke-virtual {v1, v4, v5}, Lcom/belkin/wemo/rules/data/RMLocationInfo;->setLatitude(D)V

    .line 69
    invoke-virtual {v2}, Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;->getLongitude()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    float-to-double v4, v3

    invoke-virtual {v1, v4, v5}, Lcom/belkin/wemo/rules/data/RMLocationInfo;->setLongitude(D)V

    .line 70
    invoke-virtual {v2}, Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;->getRegion()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/belkin/wemo/rules/data/RMLocationInfo;->setRegion(Ljava/lang/String;)V

    .line 72
    sget-object v3, Lcom/belkin/wemo/rules/location/RMLocationInfoManager;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Fetch Rules: Location Info in DB = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Lcom/belkin/wemo/rules/data/RMLocationInfo;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    if-eqz p1, :cond_0

    .line 74
    invoke-interface {p1, v1}, Lcom/belkin/wemo/rules/location/callback/RMReadLocationSuccessCallback;->onLocationRead(Lcom/belkin/wemo/rules/data/RMLocationInfo;)V

    .line 88
    .end local v1    # "locationInfo":Lcom/belkin/wemo/rules/data/RMLocationInfo;
    .end local v2    # "row":Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;
    :cond_0
    :goto_0
    return-void

    .line 77
    .restart local v2    # "row":Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;
    :cond_1
    if-eqz p1, :cond_0

    .line 78
    invoke-interface {p1}, Lcom/belkin/wemo/rules/location/callback/RMReadLocationSuccessCallback;->onNoInfoLocationFound()V
    :try_end_0
    .catch Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 81
    .end local v2    # "row":Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;
    :catch_0
    move-exception v0

    .line 82
    .local v0, "e":Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
    sget-object v3, Lcom/belkin/wemo/rules/location/RMLocationInfoManager;->TAG:Ljava/lang/String;

    const-string v4, "RuleDBException while reading location: "

    invoke-static {v3, v4, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 83
    if-eqz p1, :cond_0

    .line 84
    invoke-interface {p1}, Lcom/belkin/wemo/rules/location/callback/RMReadLocationSuccessCallback;->onNoInfoLocationFound()V

    goto :goto_0
.end method

.method public update(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/belkin/wemo/rules/location/callback/RMUpdateLocationSuccessCallback;Lcom/belkin/wemo/rules/location/callback/RMUpdateLocationErrorCallback;)V
    .locals 10
    .param p1, "cityName"    # Ljava/lang/String;
    .param p2, "countryName"    # Ljava/lang/String;
    .param p3, "latitude"    # Ljava/lang/String;
    .param p4, "longitude"    # Ljava/lang/String;
    .param p5, "countryCode"    # Ljava/lang/String;
    .param p6, "region"    # Ljava/lang/String;
    .param p7, "successCallback"    # Lcom/belkin/wemo/rules/location/callback/RMUpdateLocationSuccessCallback;
    .param p8, "errorCallback"    # Lcom/belkin/wemo/rules/location/callback/RMUpdateLocationErrorCallback;

    .prologue
    .line 36
    new-instance v2, Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    move-object v7, p5

    move-object/from16 v8, p6

    invoke-direct/range {v2 .. v8}, Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .local v2, "info":Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;
    :try_start_0
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->replaceLocationInfo(Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;)J

    move-result-wide v4

    const-wide/16 v6, -0x1

    cmp-long v3, v4, v6

    if-eqz v3, :cond_1

    .line 40
    if-eqz p7, :cond_0

    .line 41
    invoke-interface/range {p7 .. p7}, Lcom/belkin/wemo/rules/location/callback/RMUpdateLocationSuccessCallback;->onLocationUpdated()V

    .line 55
    :cond_0
    :goto_0
    return-void

    .line 44
    :cond_1
    if-eqz p8, :cond_0

    .line 45
    new-instance v3, Lcom/belkin/wemo/rules/error/RMRulesError;

    invoke-direct {v3}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>()V

    move-object/from16 v0, p8

    invoke-interface {v0, v3}, Lcom/belkin/wemo/rules/location/callback/RMUpdateLocationErrorCallback;->onLocationUpdateFailed(Lcom/belkin/wemo/rules/error/RMRulesError;)V
    :try_end_0
    .catch Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 49
    :catch_0
    move-exception v9

    .line 50
    .local v9, "e":Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
    sget-object v3, Lcom/belkin/wemo/rules/location/RMLocationInfoManager;->TAG:Ljava/lang/String;

    const-string v4, "RuleDBException while updating LOCATIONINFO table: "

    invoke-static {v3, v4, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 51
    if-eqz p8, :cond_0

    .line 52
    new-instance v3, Lcom/belkin/wemo/rules/error/RMRulesError;

    const/4 v4, -0x1

    invoke-virtual {v9}, Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>(ILjava/lang/String;)V

    move-object/from16 v0, p8

    invoke-interface {v0, v3}, Lcom/belkin/wemo/rules/location/callback/RMUpdateLocationErrorCallback;->onLocationUpdateFailed(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    goto :goto_0
.end method
