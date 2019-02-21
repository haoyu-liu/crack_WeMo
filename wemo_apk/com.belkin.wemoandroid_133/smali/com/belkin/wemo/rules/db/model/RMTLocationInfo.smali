.class public Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;
.super Ljava/lang/Object;
.source "RMTLocationInfo.java"


# instance fields
.field private final LocationPk:I

.field private cityName:Ljava/lang/String;

.field private countryCode:Ljava/lang/String;

.field private countryName:Ljava/lang/String;

.field private latitude:Ljava/lang/String;

.field private longitude:Ljava/lang/String;

.field private region:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    const/4 v0, 0x1

    iput v0, p0, Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;->LocationPk:I

    .line 16
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "cityName"    # Ljava/lang/String;
    .param p2, "countryName"    # Ljava/lang/String;
    .param p3, "latitude"    # Ljava/lang/String;
    .param p4, "longitude"    # Ljava/lang/String;
    .param p5, "countryCode"    # Ljava/lang/String;
    .param p6, "region"    # Ljava/lang/String;

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    const/4 v0, 0x1

    iput v0, p0, Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;->LocationPk:I

    .line 20
    iput-object p1, p0, Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;->cityName:Ljava/lang/String;

    .line 21
    iput-object p2, p0, Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;->countryName:Ljava/lang/String;

    .line 22
    iput-object p3, p0, Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;->latitude:Ljava/lang/String;

    .line 23
    iput-object p4, p0, Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;->longitude:Ljava/lang/String;

    .line 24
    iput-object p5, p0, Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;->countryCode:Ljava/lang/String;

    .line 25
    iput-object p6, p0, Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;->region:Ljava/lang/String;

    .line 26
    return-void
.end method


# virtual methods
.method public getCityName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;->cityName:Ljava/lang/String;

    return-object v0
.end method

.method public getCountryCode()Ljava/lang/String;
    .locals 1

    .prologue
    .line 99
    iget-object v0, p0, Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;->countryCode:Ljava/lang/String;

    return-object v0
.end method

.method public getCountryName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;->countryName:Ljava/lang/String;

    return-object v0
.end method

.method public getLatitude()Ljava/lang/String;
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;->latitude:Ljava/lang/String;

    return-object v0
.end method

.method public getLocationPk()I
    .locals 1

    .prologue
    .line 32
    const/4 v0, 0x1

    return v0
.end method

.method public getLongitude()Ljava/lang/String;
    .locals 1

    .prologue
    .line 84
    iget-object v0, p0, Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;->longitude:Ljava/lang/String;

    return-object v0
.end method

.method public getRegion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 114
    iget-object v0, p0, Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;->region:Ljava/lang/String;

    return-object v0
.end method

.method public setCityName(Ljava/lang/String;)V
    .locals 0
    .param p1, "cityName"    # Ljava/lang/String;

    .prologue
    .line 47
    iput-object p1, p0, Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;->cityName:Ljava/lang/String;

    .line 48
    return-void
.end method

.method public setCountryCode(Ljava/lang/String;)V
    .locals 0
    .param p1, "countryCode"    # Ljava/lang/String;

    .prologue
    .line 107
    iput-object p1, p0, Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;->countryCode:Ljava/lang/String;

    .line 108
    return-void
.end method

.method public setCountryName(Ljava/lang/String;)V
    .locals 0
    .param p1, "countryName"    # Ljava/lang/String;

    .prologue
    .line 62
    iput-object p1, p0, Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;->countryName:Ljava/lang/String;

    .line 63
    return-void
.end method

.method public setLatitude(Ljava/lang/String;)V
    .locals 0
    .param p1, "latitude"    # Ljava/lang/String;

    .prologue
    .line 77
    iput-object p1, p0, Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;->latitude:Ljava/lang/String;

    .line 78
    return-void
.end method

.method public setLongitude(Ljava/lang/String;)V
    .locals 0
    .param p1, "longitude"    # Ljava/lang/String;

    .prologue
    .line 92
    iput-object p1, p0, Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;->longitude:Ljava/lang/String;

    .line 93
    return-void
.end method

.method public setRegion(Ljava/lang/String;)V
    .locals 0
    .param p1, "region"    # Ljava/lang/String;

    .prologue
    .line 122
    iput-object p1, p0, Lcom/belkin/wemo/rules/db/model/RMTLocationInfo;->region:Ljava/lang/String;

    .line 123
    return-void
.end method
