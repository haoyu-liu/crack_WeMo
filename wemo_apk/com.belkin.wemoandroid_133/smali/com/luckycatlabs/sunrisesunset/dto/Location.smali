.class public Lcom/luckycatlabs/sunrisesunset/dto/Location;
.super Ljava/lang/Object;
.source "Location.java"


# instance fields
.field private latitude:Ljava/math/BigDecimal;

.field private longitude:Ljava/math/BigDecimal;


# direct methods
.method public constructor <init>(DD)V
    .locals 1
    .param p1, "latitude"    # D
    .param p3, "longitude"    # D

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    new-instance v0, Ljava/math/BigDecimal;

    invoke-direct {v0, p1, p2}, Ljava/math/BigDecimal;-><init>(D)V

    iput-object v0, p0, Lcom/luckycatlabs/sunrisesunset/dto/Location;->latitude:Ljava/math/BigDecimal;

    .line 51
    new-instance v0, Ljava/math/BigDecimal;

    invoke-direct {v0, p3, p4}, Ljava/math/BigDecimal;-><init>(D)V

    iput-object v0, p0, Lcom/luckycatlabs/sunrisesunset/dto/Location;->longitude:Ljava/math/BigDecimal;

    .line 52
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "latitude"    # Ljava/lang/String;
    .param p2, "longitude"    # Ljava/lang/String;

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    new-instance v0, Ljava/math/BigDecimal;

    invoke-direct {v0, p1}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/luckycatlabs/sunrisesunset/dto/Location;->latitude:Ljava/math/BigDecimal;

    .line 38
    new-instance v0, Ljava/math/BigDecimal;

    invoke-direct {v0, p2}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/luckycatlabs/sunrisesunset/dto/Location;->longitude:Ljava/math/BigDecimal;

    .line 39
    return-void
.end method


# virtual methods
.method public getLatitude()Ljava/math/BigDecimal;
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/luckycatlabs/sunrisesunset/dto/Location;->latitude:Ljava/math/BigDecimal;

    return-object v0
.end method

.method public getLongitude()Ljava/math/BigDecimal;
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lcom/luckycatlabs/sunrisesunset/dto/Location;->longitude:Ljava/math/BigDecimal;

    return-object v0
.end method

.method public setLocation(DD)V
    .locals 1
    .param p1, "latitude"    # D
    .param p3, "longitude"    # D

    .prologue
    .line 90
    new-instance v0, Ljava/math/BigDecimal;

    invoke-direct {v0, p1, p2}, Ljava/math/BigDecimal;-><init>(D)V

    iput-object v0, p0, Lcom/luckycatlabs/sunrisesunset/dto/Location;->latitude:Ljava/math/BigDecimal;

    .line 91
    new-instance v0, Ljava/math/BigDecimal;

    invoke-direct {v0, p3, p4}, Ljava/math/BigDecimal;-><init>(D)V

    iput-object v0, p0, Lcom/luckycatlabs/sunrisesunset/dto/Location;->longitude:Ljava/math/BigDecimal;

    .line 92
    return-void
.end method

.method public setLocation(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "latitude"    # Ljava/lang/String;
    .param p2, "longitude"    # Ljava/lang/String;

    .prologue
    .line 77
    new-instance v0, Ljava/math/BigDecimal;

    invoke-direct {v0, p1}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/luckycatlabs/sunrisesunset/dto/Location;->latitude:Ljava/math/BigDecimal;

    .line 78
    new-instance v0, Ljava/math/BigDecimal;

    invoke-direct {v0, p2}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/luckycatlabs/sunrisesunset/dto/Location;->longitude:Ljava/math/BigDecimal;

    .line 79
    return-void
.end method
