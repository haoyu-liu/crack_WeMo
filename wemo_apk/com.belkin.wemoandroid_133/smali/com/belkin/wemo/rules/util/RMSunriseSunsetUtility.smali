.class public Lcom/belkin/wemo/rules/util/RMSunriseSunsetUtility;
.super Ljava/lang/Object;
.source "RMSunriseSunsetUtility.java"


# static fields
.field public static final DATE_FORMAT_MM_DD_YYYY:Ljava/lang/String; = "MM/dd/yyyy"

.field private static final TAG:Ljava/lang/String;

.field public static final TIMEZONE_GMT:Ljava/lang/String; = "GMT+00:00"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 17
    const-class v0, Lcom/belkin/wemo/rules/util/RMSunriseSunsetUtility;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/rules/util/RMSunriseSunsetUtility;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getSunriseTime(DDI)D
    .locals 18
    .param p0, "latitude"    # D
    .param p2, "longitude"    # D
    .param p4, "day"    # I

    .prologue
    .line 51
    sget-object v14, Lcom/belkin/wemo/rules/util/RMSunriseSunsetUtility;->TAG:Ljava/lang/String;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Sunrise Time Requested. Latitude: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-wide/from16 v0, p0

    invoke-virtual {v15, v0, v1}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "; Longtitude: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-wide/from16 v0, p2

    invoke-virtual {v15, v0, v1}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "; day: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move/from16 v0, p4

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    const-wide/16 v10, 0x0

    .line 54
    .local v10, "sunrise":D
    new-instance v7, Lcom/luckycatlabs/sunrisesunset/dto/Location;

    move-wide/from16 v0, p0

    move-wide/from16 v2, p2

    invoke-direct {v7, v0, v1, v2, v3}, Lcom/luckycatlabs/sunrisesunset/dto/Location;-><init>(DD)V

    .line 57
    .local v7, "location":Lcom/luckycatlabs/sunrisesunset/dto/Location;
    new-instance v4, Lcom/luckycatlabs/sunrisesunset/SunriseSunsetCalculator;

    const-string v14, "GMT+00:00"

    invoke-static {v14}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v14

    invoke-direct {v4, v7, v14}, Lcom/luckycatlabs/sunrisesunset/SunriseSunsetCalculator;-><init>(Lcom/luckycatlabs/sunrisesunset/dto/Location;Ljava/util/TimeZone;)V

    .line 59
    .local v4, "calculator":Lcom/luckycatlabs/sunrisesunset/SunriseSunsetCalculator;
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v5

    .line 60
    .local v5, "calendar":Ljava/util/Calendar;
    const/16 v14, 0xb

    const/4 v15, 0x0

    invoke-virtual {v5, v14, v15}, Ljava/util/Calendar;->set(II)V

    .line 61
    const/16 v14, 0xc

    const/4 v15, 0x0

    invoke-virtual {v5, v14, v15}, Ljava/util/Calendar;->set(II)V

    .line 63
    invoke-virtual {v4, v5}, Lcom/luckycatlabs/sunrisesunset/SunriseSunsetCalculator;->getOfficialSunriseForDate(Ljava/util/Calendar;)Ljava/lang/String;

    move-result-object v12

    .line 64
    .local v12, "sunriseStr":Ljava/lang/String;
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v14

    invoke-virtual {v14}, Ljava/util/TimeZone;->getRawOffset()I

    move-result v14

    div-int/lit16 v9, v14, 0x3e8

    .line 65
    .local v9, "offsetInSec":I
    sget-object v14, Lcom/belkin/wemo/rules/util/RMSunriseSunsetUtility;->TAG:Ljava/lang/String;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "GMT Sunrise Time String: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "; Timezone offset in sec: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    const-string v14, ":"

    invoke-virtual {v12, v14}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v13

    .line 69
    .local v13, "sunriseStrArr":[Ljava/lang/String;
    array-length v14, v13

    const/4 v15, 0x2

    if-ne v14, v15, :cond_0

    .line 70
    const/4 v14, 0x0

    aget-object v14, v13, v14

    invoke-static {v14}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    .line 71
    .local v6, "hours":I
    const/4 v14, 0x1

    aget-object v14, v13, v14

    invoke-static {v14}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    .line 73
    .local v8, "minutes":I
    invoke-static {v6, v8}, Lcom/belkin/wemo/rules/util/RMSunriseSunsetUtility;->getTimeInSecSinceMidnight(II)I

    move-result v14

    add-int/2addr v14, v9

    add-int/lit8 v14, v14, 0x1

    int-to-double v10, v14

    .line 76
    .end local v6    # "hours":I
    .end local v8    # "minutes":I
    :cond_0
    sget-object v14, Lcom/belkin/wemo/rules/util/RMSunriseSunsetUtility;->TAG:Ljava/lang/String;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Final location based sunrise time calculated: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v10, v11}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    return-wide v10
.end method

.method public static getSunsetTime(DDI)D
    .locals 18
    .param p0, "latitude"    # D
    .param p2, "longitude"    # D
    .param p4, "day"    # I

    .prologue
    .line 21
    sget-object v14, Lcom/belkin/wemo/rules/util/RMSunriseSunsetUtility;->TAG:Ljava/lang/String;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Sunset Time Requested. Latitude: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-wide/from16 v0, p0

    invoke-virtual {v15, v0, v1}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "; Longtitude: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-wide/from16 v0, p2

    invoke-virtual {v15, v0, v1}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "; day: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move/from16 v0, p4

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    const-wide/16 v12, 0x0

    .line 24
    .local v12, "sunset":D
    new-instance v7, Lcom/luckycatlabs/sunrisesunset/dto/Location;

    move-wide/from16 v0, p0

    move-wide/from16 v2, p2

    invoke-direct {v7, v0, v1, v2, v3}, Lcom/luckycatlabs/sunrisesunset/dto/Location;-><init>(DD)V

    .line 27
    .local v7, "location":Lcom/luckycatlabs/sunrisesunset/dto/Location;
    new-instance v4, Lcom/luckycatlabs/sunrisesunset/SunriseSunsetCalculator;

    const-string v14, "GMT+00:00"

    invoke-static {v14}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v14

    invoke-direct {v4, v7, v14}, Lcom/luckycatlabs/sunrisesunset/SunriseSunsetCalculator;-><init>(Lcom/luckycatlabs/sunrisesunset/dto/Location;Ljava/util/TimeZone;)V

    .line 29
    .local v4, "calculator":Lcom/luckycatlabs/sunrisesunset/SunriseSunsetCalculator;
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v5

    .line 30
    .local v5, "calendar":Ljava/util/Calendar;
    const/16 v14, 0xb

    const/4 v15, 0x0

    invoke-virtual {v5, v14, v15}, Ljava/util/Calendar;->set(II)V

    .line 31
    const/16 v14, 0xc

    const/4 v15, 0x0

    invoke-virtual {v5, v14, v15}, Ljava/util/Calendar;->set(II)V

    .line 33
    invoke-virtual {v4, v5}, Lcom/luckycatlabs/sunrisesunset/SunriseSunsetCalculator;->getOfficialSunsetForDate(Ljava/util/Calendar;)Ljava/lang/String;

    move-result-object v10

    .line 34
    .local v10, "sunriseStr":Ljava/lang/String;
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v14

    invoke-virtual {v14}, Ljava/util/TimeZone;->getRawOffset()I

    move-result v14

    div-int/lit16 v9, v14, 0x3e8

    .line 35
    .local v9, "offsetInSec":I
    sget-object v14, Lcom/belkin/wemo/rules/util/RMSunriseSunsetUtility;->TAG:Ljava/lang/String;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "GMT Sunset Time String: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "; Timezone offset in sec: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    const-string v14, ":"

    invoke-virtual {v10, v14}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v11

    .line 39
    .local v11, "sunriseStrArr":[Ljava/lang/String;
    array-length v14, v11

    const/4 v15, 0x2

    if-ne v14, v15, :cond_0

    .line 40
    const/4 v14, 0x0

    aget-object v14, v11, v14

    invoke-static {v14}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    .line 41
    .local v6, "hours":I
    const/4 v14, 0x1

    aget-object v14, v11, v14

    invoke-static {v14}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    .line 43
    .local v8, "minutes":I
    invoke-static {v6, v8}, Lcom/belkin/wemo/rules/util/RMSunriseSunsetUtility;->getTimeInSecSinceMidnight(II)I

    move-result v14

    add-int/2addr v14, v9

    add-int/lit8 v14, v14, 0x2

    int-to-double v12, v14

    .line 46
    .end local v6    # "hours":I
    .end local v8    # "minutes":I
    :cond_0
    sget-object v14, Lcom/belkin/wemo/rules/util/RMSunriseSunsetUtility;->TAG:Ljava/lang/String;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Final location based sunset time calculated: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v12, v13}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    return-wide v12
.end method

.method public static getTimeInSecSinceMidnight(II)I
    .locals 1
    .param p0, "hours"    # I
    .param p1, "minutes"    # I

    .prologue
    .line 81
    mul-int/lit8 v0, p0, 0x3c

    add-int/2addr v0, p1

    mul-int/lit8 v0, v0, 0x3c

    return v0
.end method
