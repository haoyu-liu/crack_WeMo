.class public Lcom/belkin/utils/GPSTracker;
.super Ljava/lang/Object;
.source "GPSTracker.java"

# interfaces
.implements Landroid/location/LocationListener;


# static fields
.field private static final MIN_DISTANCE_CHANGE_FOR_UPDATES:J = 0xaL

.field private static final MIN_TIME_BW_UPDATES:J = 0xea60L


# instance fields
.field canGetLocation:Z

.field isGPSEnabled:Z

.field isNetworkEnabled:Z

.field latitude:D

.field location:Landroid/location/Location;

.field protected locationManager:Landroid/location/LocationManager;

.field longitude:D

.field private final mContext:Landroid/content/Context;

.field private mpermissions:Lcom/belkin/wemo/Permissions;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x0

    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    iput-boolean v0, p0, Lcom/belkin/utils/GPSTracker;->isGPSEnabled:Z

    .line 56
    iput-boolean v0, p0, Lcom/belkin/utils/GPSTracker;->isNetworkEnabled:Z

    .line 57
    iput-boolean v0, p0, Lcom/belkin/utils/GPSTracker;->canGetLocation:Z

    .line 67
    iput-object p1, p0, Lcom/belkin/utils/GPSTracker;->mContext:Landroid/content/Context;

    .line 70
    return-void
.end method

.method static synthetic access$000(Lcom/belkin/utils/GPSTracker;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/utils/GPSTracker;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/belkin/utils/GPSTracker;->mContext:Landroid/content/Context;

    return-object v0
.end method


# virtual methods
.method public canGetLocation()Z
    .locals 5

    .prologue
    .line 163
    iget-object v3, p0, Lcom/belkin/utils/GPSTracker;->mContext:Landroid/content/Context;

    const-string v4, "location"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/location/LocationManager;

    .line 164
    .local v1, "lm":Landroid/location/LocationManager;
    const/4 v0, 0x0

    .line 165
    .local v0, "gps_enabled":Z
    const/4 v2, 0x0

    .line 168
    .local v2, "network_enabled":Z
    :try_start_0
    const-string v3, "gps"

    invoke-virtual {v1, v3}, Landroid/location/LocationManager;->isProviderEnabled(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result v0

    .line 172
    :goto_0
    :try_start_1
    const-string v3, "network"

    invoke-virtual {v1, v3}, Landroid/location/LocationManager;->isProviderEnabled(Ljava/lang/String;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result v2

    .line 175
    :goto_1
    if-nez v0, :cond_0

    if-nez v2, :cond_0

    .line 176
    iget-boolean v3, p0, Lcom/belkin/utils/GPSTracker;->canGetLocation:Z

    .line 178
    :goto_2
    return v3

    :cond_0
    const/4 v3, 0x1

    goto :goto_2

    .line 173
    :catch_0
    move-exception v3

    goto :goto_1

    .line 169
    :catch_1
    move-exception v3

    goto :goto_0
.end method

.method public getLatitude()D
    .locals 2

    .prologue
    .line 133
    iget-object v0, p0, Lcom/belkin/utils/GPSTracker;->location:Landroid/location/Location;

    if-nez v0, :cond_0

    .line 135
    invoke-virtual {p0}, Lcom/belkin/utils/GPSTracker;->getLocation()Landroid/location/Location;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/utils/GPSTracker;->location:Landroid/location/Location;

    .line 136
    iget-object v0, p0, Lcom/belkin/utils/GPSTracker;->location:Landroid/location/Location;

    invoke-virtual {v0}, Landroid/location/Location;->getLatitude()D

    move-result-wide v0

    iput-wide v0, p0, Lcom/belkin/utils/GPSTracker;->latitude:D

    .line 140
    :goto_0
    iget-wide v0, p0, Lcom/belkin/utils/GPSTracker;->latitude:D

    return-wide v0

    .line 138
    :cond_0
    iget-object v0, p0, Lcom/belkin/utils/GPSTracker;->location:Landroid/location/Location;

    invoke-virtual {v0}, Landroid/location/Location;->getLatitude()D

    move-result-wide v0

    iput-wide v0, p0, Lcom/belkin/utils/GPSTracker;->latitude:D

    goto :goto_0
.end method

.method public getLocation()Landroid/location/Location;
    .locals 7

    .prologue
    .line 74
    :try_start_0
    iget-object v0, p0, Lcom/belkin/utils/GPSTracker;->mContext:Landroid/content/Context;

    const-string v1, "location"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/location/LocationManager;

    iput-object v0, p0, Lcom/belkin/utils/GPSTracker;->locationManager:Landroid/location/LocationManager;

    .line 75
    iget-object v0, p0, Lcom/belkin/utils/GPSTracker;->locationManager:Landroid/location/LocationManager;

    const-string v1, "gps"

    invoke-virtual {v0, v1}, Landroid/location/LocationManager;->isProviderEnabled(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/belkin/utils/GPSTracker;->isGPSEnabled:Z

    .line 76
    iget-object v0, p0, Lcom/belkin/utils/GPSTracker;->locationManager:Landroid/location/LocationManager;

    const-string v1, "network"

    invoke-virtual {v0, v1}, Landroid/location/LocationManager;->isProviderEnabled(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/belkin/utils/GPSTracker;->isNetworkEnabled:Z

    .line 77
    iget-object v0, p0, Lcom/belkin/utils/GPSTracker;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/belkin/wemo/Permissions;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/Permissions;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/utils/GPSTracker;->mpermissions:Lcom/belkin/wemo/Permissions;

    .line 79
    iget-boolean v0, p0, Lcom/belkin/utils/GPSTracker;->isGPSEnabled:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/belkin/utils/GPSTracker;->isNetworkEnabled:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-nez v0, :cond_1

    .line 116
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/belkin/utils/GPSTracker;->location:Landroid/location/Location;

    return-object v0

    .line 82
    :cond_1
    :try_start_1
    iget-boolean v0, p0, Lcom/belkin/utils/GPSTracker;->isNetworkEnabled:Z

    if-eqz v0, :cond_2

    .line 83
    iget-object v0, p0, Lcom/belkin/utils/GPSTracker;->mpermissions:Lcom/belkin/wemo/Permissions;

    invoke-virtual {v0}, Lcom/belkin/wemo/Permissions;->checkLocationPermission()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 84
    iget-object v0, p0, Lcom/belkin/utils/GPSTracker;->locationManager:Landroid/location/LocationManager;

    const-string v1, "network"

    const-wide/32 v2, 0xea60

    const/high16 v4, 0x41200000    # 10.0f

    move-object v5, p0

    invoke-virtual/range {v0 .. v5}, Landroid/location/LocationManager;->requestLocationUpdates(Ljava/lang/String;JFLandroid/location/LocationListener;)V

    .line 85
    const-string v0, "Network"

    const-string v1, "Network"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    iget-object v0, p0, Lcom/belkin/utils/GPSTracker;->locationManager:Landroid/location/LocationManager;

    if-eqz v0, :cond_0

    .line 87
    iget-object v0, p0, Lcom/belkin/utils/GPSTracker;->locationManager:Landroid/location/LocationManager;

    const-string v1, "network"

    invoke-virtual {v0, v1}, Landroid/location/LocationManager;->getLastKnownLocation(Ljava/lang/String;)Landroid/location/Location;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/utils/GPSTracker;->location:Landroid/location/Location;

    .line 88
    iget-object v0, p0, Lcom/belkin/utils/GPSTracker;->location:Landroid/location/Location;

    if-eqz v0, :cond_0

    .line 89
    iget-object v0, p0, Lcom/belkin/utils/GPSTracker;->location:Landroid/location/Location;

    invoke-virtual {v0}, Landroid/location/Location;->getLatitude()D

    move-result-wide v0

    iput-wide v0, p0, Lcom/belkin/utils/GPSTracker;->latitude:D

    .line 90
    iget-object v0, p0, Lcom/belkin/utils/GPSTracker;->location:Landroid/location/Location;

    invoke-virtual {v0}, Landroid/location/Location;->getLongitude()D

    move-result-wide v0

    iput-wide v0, p0, Lcom/belkin/utils/GPSTracker;->longitude:D
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 112
    :catch_0
    move-exception v6

    .line 113
    .local v6, "e":Ljava/lang/Exception;
    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 94
    .end local v6    # "e":Ljava/lang/Exception;
    :cond_2
    :try_start_2
    iget-boolean v0, p0, Lcom/belkin/utils/GPSTracker;->isGPSEnabled:Z

    if-eqz v0, :cond_0

    .line 95
    iget-object v0, p0, Lcom/belkin/utils/GPSTracker;->location:Landroid/location/Location;

    if-nez v0, :cond_0

    .line 96
    iget-object v0, p0, Lcom/belkin/utils/GPSTracker;->mpermissions:Lcom/belkin/wemo/Permissions;

    invoke-virtual {v0}, Lcom/belkin/wemo/Permissions;->checkLocationPermission()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 97
    iget-object v0, p0, Lcom/belkin/utils/GPSTracker;->locationManager:Landroid/location/LocationManager;

    const-string v1, "gps"

    const-wide/32 v2, 0xea60

    const/high16 v4, 0x41200000    # 10.0f

    move-object v5, p0

    invoke-virtual/range {v0 .. v5}, Landroid/location/LocationManager;->requestLocationUpdates(Ljava/lang/String;JFLandroid/location/LocationListener;)V

    .line 98
    const-string v0, "GPS Enabled"

    const-string v1, "GPS Enabled"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 99
    iget-object v0, p0, Lcom/belkin/utils/GPSTracker;->locationManager:Landroid/location/LocationManager;

    if-eqz v0, :cond_0

    .line 100
    iget-object v0, p0, Lcom/belkin/utils/GPSTracker;->locationManager:Landroid/location/LocationManager;

    const-string v1, "gps"

    invoke-virtual {v0, v1}, Landroid/location/LocationManager;->getLastKnownLocation(Ljava/lang/String;)Landroid/location/Location;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/utils/GPSTracker;->location:Landroid/location/Location;

    .line 101
    iget-object v0, p0, Lcom/belkin/utils/GPSTracker;->location:Landroid/location/Location;

    if-eqz v0, :cond_0

    .line 102
    iget-object v0, p0, Lcom/belkin/utils/GPSTracker;->location:Landroid/location/Location;

    invoke-virtual {v0}, Landroid/location/Location;->getLatitude()D

    move-result-wide v0

    iput-wide v0, p0, Lcom/belkin/utils/GPSTracker;->latitude:D

    .line 103
    iget-object v0, p0, Lcom/belkin/utils/GPSTracker;->location:Landroid/location/Location;

    invoke-virtual {v0}, Landroid/location/Location;->getLongitude()D

    move-result-wide v0

    iput-wide v0, p0, Lcom/belkin/utils/GPSTracker;->longitude:D
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto/16 :goto_0
.end method

.method public getLongitude()D
    .locals 2

    .prologue
    .line 147
    iget-object v0, p0, Lcom/belkin/utils/GPSTracker;->location:Landroid/location/Location;

    if-nez v0, :cond_0

    .line 149
    invoke-virtual {p0}, Lcom/belkin/utils/GPSTracker;->getLocation()Landroid/location/Location;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/utils/GPSTracker;->location:Landroid/location/Location;

    .line 150
    iget-object v0, p0, Lcom/belkin/utils/GPSTracker;->location:Landroid/location/Location;

    invoke-virtual {v0}, Landroid/location/Location;->getLongitude()D

    move-result-wide v0

    iput-wide v0, p0, Lcom/belkin/utils/GPSTracker;->longitude:D

    .line 154
    :goto_0
    iget-wide v0, p0, Lcom/belkin/utils/GPSTracker;->longitude:D

    return-wide v0

    .line 152
    :cond_0
    iget-object v0, p0, Lcom/belkin/utils/GPSTracker;->location:Landroid/location/Location;

    invoke-virtual {v0}, Landroid/location/Location;->getLongitude()D

    move-result-wide v0

    iput-wide v0, p0, Lcom/belkin/utils/GPSTracker;->longitude:D

    goto :goto_0
.end method

.method public onLocationChanged(Landroid/location/Location;)V
    .locals 0
    .param p1, "location"    # Landroid/location/Location;

    .prologue
    .line 205
    return-void
.end method

.method public onProviderDisabled(Ljava/lang/String;)V
    .locals 0
    .param p1, "provider"    # Ljava/lang/String;

    .prologue
    .line 209
    return-void
.end method

.method public onProviderEnabled(Ljava/lang/String;)V
    .locals 0
    .param p1, "provider"    # Ljava/lang/String;

    .prologue
    .line 213
    return-void
.end method

.method public onStatusChanged(Ljava/lang/String;ILandroid/os/Bundle;)V
    .locals 0
    .param p1, "provider"    # Ljava/lang/String;
    .param p2, "status"    # I
    .param p3, "extras"    # Landroid/os/Bundle;

    .prologue
    .line 217
    return-void
.end method

.method public showSettingsAlert()V
    .locals 3

    .prologue
    .line 186
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/belkin/utils/GPSTracker;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 187
    .local v0, "alertDialog":Landroid/app/AlertDialog$Builder;
    const-string v1, "Location service is disabled"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 188
    const-string v1, "Location service is currently disabled. Use the \'Settings\' button below to launch the settings dialog where Location service can be enabled."

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 189
    const-string v1, "Settings"

    new-instance v2, Lcom/belkin/utils/GPSTracker$1;

    invoke-direct {v2, p0}, Lcom/belkin/utils/GPSTracker$1;-><init>(Lcom/belkin/utils/GPSTracker;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 195
    const-string v1, "Cancel"

    new-instance v2, Lcom/belkin/utils/GPSTracker$2;

    invoke-direct {v2, p0}, Lcom/belkin/utils/GPSTracker$2;-><init>(Lcom/belkin/utils/GPSTracker;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 200
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 201
    return-void
.end method
