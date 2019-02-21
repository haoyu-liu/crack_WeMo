.class public Lcom/belkin/wemo/cache/location/Location;
.super Ljava/lang/Object;
.source "Location.java"


# instance fields
.field private ID:I

.field private arpMacs:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private currentHomeId:Ljava/lang/String;

.field private deviceList:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;"
        }
    .end annotation
.end field

.field private homeId:Ljava/lang/String;

.field private name:Ljava/lang/String;

.field private rulesDB:Ljava/lang/String;

.field private ssids:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "homeId"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-object p1, p0, Lcom/belkin/wemo/cache/location/Location;->homeId:Ljava/lang/String;

    .line 22
    iput-object p2, p0, Lcom/belkin/wemo/cache/location/Location;->name:Ljava/lang/String;

    .line 23
    return-void
.end method


# virtual methods
.method public getArpMacs()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 57
    iget-object v0, p0, Lcom/belkin/wemo/cache/location/Location;->arpMacs:Ljava/util/Set;

    return-object v0
.end method

.method public getCurrentHomeId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 124
    iget-object v0, p0, Lcom/belkin/wemo/cache/location/Location;->currentHomeId:Ljava/lang/String;

    return-object v0
.end method

.method public getDeviceList()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;"
        }
    .end annotation

    .prologue
    .line 100
    iget-object v0, p0, Lcom/belkin/wemo/cache/location/Location;->deviceList:Ljava/util/Set;

    return-object v0
.end method

.method public getHomeId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 43
    iget-object v0, p0, Lcom/belkin/wemo/cache/location/Location;->homeId:Ljava/lang/String;

    return-object v0
.end method

.method public getID()I
    .locals 1

    .prologue
    .line 29
    iget v0, p0, Lcom/belkin/wemo/cache/location/Location;->ID:I

    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 86
    iget-object v0, p0, Lcom/belkin/wemo/cache/location/Location;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getRulesDB()Ljava/lang/String;
    .locals 1

    .prologue
    .line 114
    iget-object v0, p0, Lcom/belkin/wemo/cache/location/Location;->rulesDB:Ljava/lang/String;

    return-object v0
.end method

.method public getSsids()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 72
    iget-object v0, p0, Lcom/belkin/wemo/cache/location/Location;->ssids:Ljava/util/Set;

    return-object v0
.end method

.method public setArpMacs(Ljava/util/Set;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 64
    .local p1, "arpMacs":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/belkin/wemo/cache/location/Location;->arpMacs:Ljava/util/Set;

    .line 65
    return-void
.end method

.method public setCurrentHomeId(Ljava/lang/String;)V
    .locals 0
    .param p1, "currentHomeId"    # Ljava/lang/String;

    .prologue
    .line 127
    iput-object p1, p0, Lcom/belkin/wemo/cache/location/Location;->currentHomeId:Ljava/lang/String;

    .line 128
    return-void
.end method

.method public setDeviceList(Ljava/util/Set;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 107
    .local p1, "deviceList":Ljava/util/Set;, "Ljava/util/Set<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    iput-object p1, p0, Lcom/belkin/wemo/cache/location/Location;->deviceList:Ljava/util/Set;

    .line 108
    return-void
.end method

.method public setHomeId(Ljava/lang/String;)V
    .locals 0
    .param p1, "homeId"    # Ljava/lang/String;

    .prologue
    .line 50
    iput-object p1, p0, Lcom/belkin/wemo/cache/location/Location;->homeId:Ljava/lang/String;

    .line 51
    return-void
.end method

.method public setID(I)V
    .locals 0
    .param p1, "id"    # I

    .prologue
    .line 36
    iput p1, p0, Lcom/belkin/wemo/cache/location/Location;->ID:I

    .line 37
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 93
    iput-object p1, p0, Lcom/belkin/wemo/cache/location/Location;->name:Ljava/lang/String;

    .line 94
    return-void
.end method

.method public setRulesDB(Ljava/lang/String;)V
    .locals 0
    .param p1, "rulesDB"    # Ljava/lang/String;

    .prologue
    .line 121
    iput-object p1, p0, Lcom/belkin/wemo/cache/location/Location;->rulesDB:Ljava/lang/String;

    .line 122
    return-void
.end method

.method public setSsids(Ljava/util/Set;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 79
    .local p1, "ssids":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/belkin/wemo/cache/location/Location;->ssids:Ljava/util/Set;

    .line 80
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 132
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "#ID: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/belkin/wemo/cache/location/Location;->ID:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/wemo/cache/location/Location;->homeId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/wemo/cache/location/Location;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ArpMacs: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/belkin/wemo/cache/location/Location;->getArpMacs()Ljava/util/Set;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " Ssids: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/belkin/wemo/cache/location/Location;->getSsids()Ljava/util/Set;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
