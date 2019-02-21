.class public Lcom/belkin/cloud/objects/CloudObjectLocation;
.super Ljava/lang/Object;
.source "CloudObjectLocation.java"


# instance fields
.field private cityName:Ljava/lang/String;

.field private latitude:Ljava/lang/Double;

.field private longitude:Ljava/lang/Double;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getCityName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 9
    iget-object v0, p0, Lcom/belkin/cloud/objects/CloudObjectLocation;->cityName:Ljava/lang/String;

    return-object v0
.end method

.method public getLatitude()Ljava/lang/Double;
    .locals 1

    .prologue
    .line 17
    iget-object v0, p0, Lcom/belkin/cloud/objects/CloudObjectLocation;->latitude:Ljava/lang/Double;

    return-object v0
.end method

.method public getLongitude()Ljava/lang/Double;
    .locals 1

    .prologue
    .line 25
    iget-object v0, p0, Lcom/belkin/cloud/objects/CloudObjectLocation;->longitude:Ljava/lang/Double;

    return-object v0
.end method

.method public setCityName(Ljava/lang/String;)V
    .locals 0
    .param p1, "cityName"    # Ljava/lang/String;

    .prologue
    .line 13
    iput-object p1, p0, Lcom/belkin/cloud/objects/CloudObjectLocation;->cityName:Ljava/lang/String;

    .line 14
    return-void
.end method

.method public setLatitude(Ljava/lang/Double;)V
    .locals 0
    .param p1, "latitude"    # Ljava/lang/Double;

    .prologue
    .line 21
    iput-object p1, p0, Lcom/belkin/cloud/objects/CloudObjectLocation;->latitude:Ljava/lang/Double;

    .line 22
    return-void
.end method

.method public setLongitude(Ljava/lang/Double;)V
    .locals 0
    .param p1, "longitude"    # Ljava/lang/Double;

    .prologue
    .line 29
    iput-object p1, p0, Lcom/belkin/cloud/objects/CloudObjectLocation;->longitude:Ljava/lang/Double;

    .line 30
    return-void
.end method
