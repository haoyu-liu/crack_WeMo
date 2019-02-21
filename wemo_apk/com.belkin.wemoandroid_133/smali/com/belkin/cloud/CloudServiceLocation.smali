.class public Lcom/belkin/cloud/CloudServiceLocation;
.super Lcom/belkin/cloud/CloudServiceBase;
.source "CloudServiceLocation.java"


# instance fields
.field private final SERVICE_URL:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "mContext"    # Landroid/content/Context;

    .prologue
    .line 14
    invoke-direct {p0, p1}, Lcom/belkin/cloud/CloudServiceBase;-><init>(Landroid/content/Context;)V

    .line 11
    const-string v0, "https://api.xbcs.net:8443/apis/http/plugin/geoInfo/cityLocations?cityName="

    iput-object v0, p0, Lcom/belkin/cloud/CloudServiceLocation;->SERVICE_URL:Ljava/lang/String;

    .line 15
    return-void
.end method


# virtual methods
.method public makeRequest(Ljava/lang/String;)Lcom/belkin/cloud/objects/CloudObjectLocation;
    .locals 3
    .param p1, "cityName"    # Ljava/lang/String;

    .prologue
    .line 19
    new-instance v0, Lcom/belkin/cloud/objects/CloudObjectLocation;

    invoke-direct {v0}, Lcom/belkin/cloud/objects/CloudObjectLocation;-><init>()V

    .line 21
    .local v0, "res":Lcom/belkin/cloud/objects/CloudObjectLocation;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "https://api.xbcs.net:8443/apis/http/plugin/geoInfo/cityLocations?cityName="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/cloud/CloudServiceLocation;->urlStr:Ljava/lang/String;

    .line 22
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/cloud/CloudServiceLocation;->data:Ljava/lang/String;

    .line 24
    invoke-super {p0}, Lcom/belkin/cloud/CloudServiceBase;->makeRequest()Ljava/lang/Object;

    .line 26
    return-object v0
.end method
