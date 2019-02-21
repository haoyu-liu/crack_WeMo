.class public Lcom/luckycatlabs/sunrisesunset/SunriseSunsetCalculator;
.super Ljava/lang/Object;
.source "SunriseSunsetCalculator.java"


# instance fields
.field private calculator:Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;

.field private location:Lcom/luckycatlabs/sunrisesunset/dto/Location;


# direct methods
.method public constructor <init>(Lcom/luckycatlabs/sunrisesunset/dto/Location;Ljava/lang/String;)V
    .locals 1
    .param p1, "location"    # Lcom/luckycatlabs/sunrisesunset/dto/Location;
    .param p2, "timeZoneIdentifier"    # Ljava/lang/String;

    .prologue
    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    iput-object p1, p0, Lcom/luckycatlabs/sunrisesunset/SunriseSunsetCalculator;->location:Lcom/luckycatlabs/sunrisesunset/dto/Location;

    .line 47
    new-instance v0, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;

    invoke-direct {v0, p1, p2}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;-><init>(Lcom/luckycatlabs/sunrisesunset/dto/Location;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/luckycatlabs/sunrisesunset/SunriseSunsetCalculator;->calculator:Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;

    .line 48
    return-void
.end method

.method public constructor <init>(Lcom/luckycatlabs/sunrisesunset/dto/Location;Ljava/util/TimeZone;)V
    .locals 1
    .param p1, "location"    # Lcom/luckycatlabs/sunrisesunset/dto/Location;
    .param p2, "timeZone"    # Ljava/util/TimeZone;

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    iput-object p1, p0, Lcom/luckycatlabs/sunrisesunset/SunriseSunsetCalculator;->location:Lcom/luckycatlabs/sunrisesunset/dto/Location;

    .line 61
    new-instance v0, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;

    invoke-direct {v0, p1, p2}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;-><init>(Lcom/luckycatlabs/sunrisesunset/dto/Location;Ljava/util/TimeZone;)V

    iput-object v0, p0, Lcom/luckycatlabs/sunrisesunset/SunriseSunsetCalculator;->calculator:Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;

    .line 62
    return-void
.end method

.method public static getSunrise(DDLjava/util/TimeZone;Ljava/util/Calendar;D)Ljava/util/Calendar;
    .locals 4
    .param p0, "latitude"    # D
    .param p2, "longitude"    # D
    .param p4, "timeZone"    # Ljava/util/TimeZone;
    .param p5, "date"    # Ljava/util/Calendar;
    .param p6, "degrees"    # D

    .prologue
    .line 257
    new-instance v0, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;

    new-instance v1, Lcom/luckycatlabs/sunrisesunset/dto/Location;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/luckycatlabs/sunrisesunset/dto/Location;-><init>(DD)V

    invoke-direct {v0, v1, p4}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;-><init>(Lcom/luckycatlabs/sunrisesunset/dto/Location;Ljava/util/TimeZone;)V

    .line 258
    .local v0, "solarEventCalculator":Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;
    new-instance v1, Lcom/luckycatlabs/sunrisesunset/Zenith;

    const-wide v2, 0x4056800000000000L    # 90.0

    sub-double/2addr v2, p6

    invoke-direct {v1, v2, v3}, Lcom/luckycatlabs/sunrisesunset/Zenith;-><init>(D)V

    invoke-virtual {v0, v1, p5}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->computeSunriseCalendar(Lcom/luckycatlabs/sunrisesunset/Zenith;Ljava/util/Calendar;)Ljava/util/Calendar;

    move-result-object v1

    return-object v1
.end method

.method public static getSunset(DDLjava/util/TimeZone;Ljava/util/Calendar;D)Ljava/util/Calendar;
    .locals 4
    .param p0, "latitude"    # D
    .param p2, "longitude"    # D
    .param p4, "timeZone"    # Ljava/util/TimeZone;
    .param p5, "date"    # Ljava/util/Calendar;
    .param p6, "degrees"    # D

    .prologue
    .line 278
    new-instance v0, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;

    new-instance v1, Lcom/luckycatlabs/sunrisesunset/dto/Location;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/luckycatlabs/sunrisesunset/dto/Location;-><init>(DD)V

    invoke-direct {v0, v1, p4}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;-><init>(Lcom/luckycatlabs/sunrisesunset/dto/Location;Ljava/util/TimeZone;)V

    .line 279
    .local v0, "solarEventCalculator":Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;
    new-instance v1, Lcom/luckycatlabs/sunrisesunset/Zenith;

    const-wide v2, 0x4056800000000000L    # 90.0

    sub-double/2addr v2, p6

    invoke-direct {v1, v2, v3}, Lcom/luckycatlabs/sunrisesunset/Zenith;-><init>(D)V

    invoke-virtual {v0, v1, p5}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->computeSunsetCalendar(Lcom/luckycatlabs/sunrisesunset/Zenith;Ljava/util/Calendar;)Ljava/util/Calendar;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public getAstronomicalSunriseCalendarForDate(Ljava/util/Calendar;)Ljava/util/Calendar;
    .locals 2
    .param p1, "date"    # Ljava/util/Calendar;

    .prologue
    .line 83
    iget-object v0, p0, Lcom/luckycatlabs/sunrisesunset/SunriseSunsetCalculator;->calculator:Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;

    sget-object v1, Lcom/luckycatlabs/sunrisesunset/Zenith;->ASTRONOMICAL:Lcom/luckycatlabs/sunrisesunset/Zenith;

    invoke-virtual {v0, v1, p1}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->computeSunriseCalendar(Lcom/luckycatlabs/sunrisesunset/Zenith;Ljava/util/Calendar;)Ljava/util/Calendar;

    move-result-object v0

    return-object v0
.end method

.method public getAstronomicalSunriseForDate(Ljava/util/Calendar;)Ljava/lang/String;
    .locals 2
    .param p1, "date"    # Ljava/util/Calendar;

    .prologue
    .line 72
    iget-object v0, p0, Lcom/luckycatlabs/sunrisesunset/SunriseSunsetCalculator;->calculator:Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;

    sget-object v1, Lcom/luckycatlabs/sunrisesunset/Zenith;->ASTRONOMICAL:Lcom/luckycatlabs/sunrisesunset/Zenith;

    invoke-virtual {v0, v1, p1}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->computeSunriseTime(Lcom/luckycatlabs/sunrisesunset/Zenith;Ljava/util/Calendar;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getAstronomicalSunsetCalendarForDate(Ljava/util/Calendar;)Ljava/util/Calendar;
    .locals 2
    .param p1, "date"    # Ljava/util/Calendar;

    .prologue
    .line 105
    iget-object v0, p0, Lcom/luckycatlabs/sunrisesunset/SunriseSunsetCalculator;->calculator:Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;

    sget-object v1, Lcom/luckycatlabs/sunrisesunset/Zenith;->ASTRONOMICAL:Lcom/luckycatlabs/sunrisesunset/Zenith;

    invoke-virtual {v0, v1, p1}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->computeSunsetCalendar(Lcom/luckycatlabs/sunrisesunset/Zenith;Ljava/util/Calendar;)Ljava/util/Calendar;

    move-result-object v0

    return-object v0
.end method

.method public getAstronomicalSunsetForDate(Ljava/util/Calendar;)Ljava/lang/String;
    .locals 2
    .param p1, "date"    # Ljava/util/Calendar;

    .prologue
    .line 94
    iget-object v0, p0, Lcom/luckycatlabs/sunrisesunset/SunriseSunsetCalculator;->calculator:Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;

    sget-object v1, Lcom/luckycatlabs/sunrisesunset/Zenith;->ASTRONOMICAL:Lcom/luckycatlabs/sunrisesunset/Zenith;

    invoke-virtual {v0, v1, p1}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->computeSunsetTime(Lcom/luckycatlabs/sunrisesunset/Zenith;Ljava/util/Calendar;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCivilSunriseCalendarForDate(Ljava/util/Calendar;)Ljava/util/Calendar;
    .locals 2
    .param p1, "date"    # Ljava/util/Calendar;

    .prologue
    .line 171
    iget-object v0, p0, Lcom/luckycatlabs/sunrisesunset/SunriseSunsetCalculator;->calculator:Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;

    sget-object v1, Lcom/luckycatlabs/sunrisesunset/Zenith;->CIVIL:Lcom/luckycatlabs/sunrisesunset/Zenith;

    invoke-virtual {v0, v1, p1}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->computeSunriseCalendar(Lcom/luckycatlabs/sunrisesunset/Zenith;Ljava/util/Calendar;)Ljava/util/Calendar;

    move-result-object v0

    return-object v0
.end method

.method public getCivilSunriseForDate(Ljava/util/Calendar;)Ljava/lang/String;
    .locals 2
    .param p1, "date"    # Ljava/util/Calendar;

    .prologue
    .line 160
    iget-object v0, p0, Lcom/luckycatlabs/sunrisesunset/SunriseSunsetCalculator;->calculator:Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;

    sget-object v1, Lcom/luckycatlabs/sunrisesunset/Zenith;->CIVIL:Lcom/luckycatlabs/sunrisesunset/Zenith;

    invoke-virtual {v0, v1, p1}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->computeSunriseTime(Lcom/luckycatlabs/sunrisesunset/Zenith;Ljava/util/Calendar;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCivilSunsetCalendarForDate(Ljava/util/Calendar;)Ljava/util/Calendar;
    .locals 2
    .param p1, "date"    # Ljava/util/Calendar;

    .prologue
    .line 193
    iget-object v0, p0, Lcom/luckycatlabs/sunrisesunset/SunriseSunsetCalculator;->calculator:Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;

    sget-object v1, Lcom/luckycatlabs/sunrisesunset/Zenith;->CIVIL:Lcom/luckycatlabs/sunrisesunset/Zenith;

    invoke-virtual {v0, v1, p1}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->computeSunsetCalendar(Lcom/luckycatlabs/sunrisesunset/Zenith;Ljava/util/Calendar;)Ljava/util/Calendar;

    move-result-object v0

    return-object v0
.end method

.method public getCivilSunsetForDate(Ljava/util/Calendar;)Ljava/lang/String;
    .locals 2
    .param p1, "date"    # Ljava/util/Calendar;

    .prologue
    .line 182
    iget-object v0, p0, Lcom/luckycatlabs/sunrisesunset/SunriseSunsetCalculator;->calculator:Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;

    sget-object v1, Lcom/luckycatlabs/sunrisesunset/Zenith;->CIVIL:Lcom/luckycatlabs/sunrisesunset/Zenith;

    invoke-virtual {v0, v1, p1}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->computeSunsetTime(Lcom/luckycatlabs/sunrisesunset/Zenith;Ljava/util/Calendar;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLocation()Lcom/luckycatlabs/sunrisesunset/dto/Location;
    .locals 1

    .prologue
    .line 288
    iget-object v0, p0, Lcom/luckycatlabs/sunrisesunset/SunriseSunsetCalculator;->location:Lcom/luckycatlabs/sunrisesunset/dto/Location;

    return-object v0
.end method

.method public getNauticalSunriseCalendarForDate(Ljava/util/Calendar;)Ljava/util/Calendar;
    .locals 2
    .param p1, "date"    # Ljava/util/Calendar;

    .prologue
    .line 127
    iget-object v0, p0, Lcom/luckycatlabs/sunrisesunset/SunriseSunsetCalculator;->calculator:Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;

    sget-object v1, Lcom/luckycatlabs/sunrisesunset/Zenith;->NAUTICAL:Lcom/luckycatlabs/sunrisesunset/Zenith;

    invoke-virtual {v0, v1, p1}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->computeSunriseCalendar(Lcom/luckycatlabs/sunrisesunset/Zenith;Ljava/util/Calendar;)Ljava/util/Calendar;

    move-result-object v0

    return-object v0
.end method

.method public getNauticalSunriseForDate(Ljava/util/Calendar;)Ljava/lang/String;
    .locals 2
    .param p1, "date"    # Ljava/util/Calendar;

    .prologue
    .line 116
    iget-object v0, p0, Lcom/luckycatlabs/sunrisesunset/SunriseSunsetCalculator;->calculator:Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;

    sget-object v1, Lcom/luckycatlabs/sunrisesunset/Zenith;->NAUTICAL:Lcom/luckycatlabs/sunrisesunset/Zenith;

    invoke-virtual {v0, v1, p1}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->computeSunriseTime(Lcom/luckycatlabs/sunrisesunset/Zenith;Ljava/util/Calendar;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNauticalSunsetCalendarForDate(Ljava/util/Calendar;)Ljava/util/Calendar;
    .locals 2
    .param p1, "date"    # Ljava/util/Calendar;

    .prologue
    .line 149
    iget-object v0, p0, Lcom/luckycatlabs/sunrisesunset/SunriseSunsetCalculator;->calculator:Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;

    sget-object v1, Lcom/luckycatlabs/sunrisesunset/Zenith;->NAUTICAL:Lcom/luckycatlabs/sunrisesunset/Zenith;

    invoke-virtual {v0, v1, p1}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->computeSunsetCalendar(Lcom/luckycatlabs/sunrisesunset/Zenith;Ljava/util/Calendar;)Ljava/util/Calendar;

    move-result-object v0

    return-object v0
.end method

.method public getNauticalSunsetForDate(Ljava/util/Calendar;)Ljava/lang/String;
    .locals 2
    .param p1, "date"    # Ljava/util/Calendar;

    .prologue
    .line 138
    iget-object v0, p0, Lcom/luckycatlabs/sunrisesunset/SunriseSunsetCalculator;->calculator:Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;

    sget-object v1, Lcom/luckycatlabs/sunrisesunset/Zenith;->NAUTICAL:Lcom/luckycatlabs/sunrisesunset/Zenith;

    invoke-virtual {v0, v1, p1}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->computeSunsetTime(Lcom/luckycatlabs/sunrisesunset/Zenith;Ljava/util/Calendar;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getOfficialSunriseCalendarForDate(Ljava/util/Calendar;)Ljava/util/Calendar;
    .locals 2
    .param p1, "date"    # Ljava/util/Calendar;

    .prologue
    .line 215
    iget-object v0, p0, Lcom/luckycatlabs/sunrisesunset/SunriseSunsetCalculator;->calculator:Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;

    sget-object v1, Lcom/luckycatlabs/sunrisesunset/Zenith;->OFFICIAL:Lcom/luckycatlabs/sunrisesunset/Zenith;

    invoke-virtual {v0, v1, p1}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->computeSunriseCalendar(Lcom/luckycatlabs/sunrisesunset/Zenith;Ljava/util/Calendar;)Ljava/util/Calendar;

    move-result-object v0

    return-object v0
.end method

.method public getOfficialSunriseForDate(Ljava/util/Calendar;)Ljava/lang/String;
    .locals 2
    .param p1, "date"    # Ljava/util/Calendar;

    .prologue
    .line 204
    iget-object v0, p0, Lcom/luckycatlabs/sunrisesunset/SunriseSunsetCalculator;->calculator:Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;

    sget-object v1, Lcom/luckycatlabs/sunrisesunset/Zenith;->OFFICIAL:Lcom/luckycatlabs/sunrisesunset/Zenith;

    invoke-virtual {v0, v1, p1}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->computeSunriseTime(Lcom/luckycatlabs/sunrisesunset/Zenith;Ljava/util/Calendar;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getOfficialSunsetCalendarForDate(Ljava/util/Calendar;)Ljava/util/Calendar;
    .locals 2
    .param p1, "date"    # Ljava/util/Calendar;

    .prologue
    .line 237
    iget-object v0, p0, Lcom/luckycatlabs/sunrisesunset/SunriseSunsetCalculator;->calculator:Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;

    sget-object v1, Lcom/luckycatlabs/sunrisesunset/Zenith;->OFFICIAL:Lcom/luckycatlabs/sunrisesunset/Zenith;

    invoke-virtual {v0, v1, p1}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->computeSunsetCalendar(Lcom/luckycatlabs/sunrisesunset/Zenith;Ljava/util/Calendar;)Ljava/util/Calendar;

    move-result-object v0

    return-object v0
.end method

.method public getOfficialSunsetForDate(Ljava/util/Calendar;)Ljava/lang/String;
    .locals 2
    .param p1, "date"    # Ljava/util/Calendar;

    .prologue
    .line 226
    iget-object v0, p0, Lcom/luckycatlabs/sunrisesunset/SunriseSunsetCalculator;->calculator:Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;

    sget-object v1, Lcom/luckycatlabs/sunrisesunset/Zenith;->OFFICIAL:Lcom/luckycatlabs/sunrisesunset/Zenith;

    invoke-virtual {v0, v1, p1}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->computeSunsetTime(Lcom/luckycatlabs/sunrisesunset/Zenith;Ljava/util/Calendar;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
