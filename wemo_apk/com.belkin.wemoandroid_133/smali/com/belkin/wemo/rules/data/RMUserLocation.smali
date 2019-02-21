.class public Lcom/belkin/wemo/rules/data/RMUserLocation;
.super Ljava/lang/Object;
.source "RMUserLocation.java"


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static userLocation:Lcom/belkin/wemo/rules/data/RMUserLocation;


# instance fields
.field private locationInfo:Lcom/belkin/wemo/rules/data/RMLocationInfo;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 9
    const-class v0, Lcom/belkin/wemo/rules/data/RMUserLocation;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/rules/data/RMUserLocation;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    new-instance v0, Lcom/belkin/wemo/rules/data/RMLocationInfo;

    invoke-direct {v0}, Lcom/belkin/wemo/rules/data/RMLocationInfo;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/rules/data/RMUserLocation;->locationInfo:Lcom/belkin/wemo/rules/data/RMLocationInfo;

    .line 20
    return-void
.end method

.method public static getInstance()Lcom/belkin/wemo/rules/data/RMUserLocation;
    .locals 1

    .prologue
    .line 12
    sget-object v0, Lcom/belkin/wemo/rules/data/RMUserLocation;->userLocation:Lcom/belkin/wemo/rules/data/RMUserLocation;

    if-nez v0, :cond_0

    .line 13
    new-instance v0, Lcom/belkin/wemo/rules/data/RMUserLocation;

    invoke-direct {v0}, Lcom/belkin/wemo/rules/data/RMUserLocation;-><init>()V

    sput-object v0, Lcom/belkin/wemo/rules/data/RMUserLocation;->userLocation:Lcom/belkin/wemo/rules/data/RMUserLocation;

    .line 15
    :cond_0
    sget-object v0, Lcom/belkin/wemo/rules/data/RMUserLocation;->userLocation:Lcom/belkin/wemo/rules/data/RMUserLocation;

    return-object v0
.end method


# virtual methods
.method public getLocationInfo()Lcom/belkin/wemo/rules/data/RMLocationInfo;
    .locals 1

    .prologue
    .line 26
    iget-object v0, p0, Lcom/belkin/wemo/rules/data/RMUserLocation;->locationInfo:Lcom/belkin/wemo/rules/data/RMLocationInfo;

    return-object v0
.end method

.method public setLocationInfo(Lcom/belkin/wemo/rules/data/RMLocationInfo;)V
    .locals 1
    .param p1, "locationInfo"    # Lcom/belkin/wemo/rules/data/RMLocationInfo;

    .prologue
    .line 33
    if-nez p1, :cond_0

    .line 34
    new-instance v0, Lcom/belkin/wemo/rules/data/RMLocationInfo;

    invoke-direct {v0}, Lcom/belkin/wemo/rules/data/RMLocationInfo;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/rules/data/RMUserLocation;->locationInfo:Lcom/belkin/wemo/rules/data/RMLocationInfo;

    .line 38
    :goto_0
    return-void

    .line 36
    :cond_0
    iput-object p1, p0, Lcom/belkin/wemo/rules/data/RMUserLocation;->locationInfo:Lcom/belkin/wemo/rules/data/RMLocationInfo;

    goto :goto_0
.end method
