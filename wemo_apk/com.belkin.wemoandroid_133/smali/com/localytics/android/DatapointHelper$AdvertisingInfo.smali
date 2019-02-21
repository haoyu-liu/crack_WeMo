.class Lcom/localytics/android/DatapointHelper$AdvertisingInfo;
.super Ljava/lang/Object;
.source "DatapointHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/localytics/android/DatapointHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "AdvertisingInfo"
.end annotation


# instance fields
.field public id:Ljava/lang/String;

.field public limitAdTracking:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 0
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "limitAdTracking"    # Z

    .prologue
    .line 238
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 239
    iput-object p1, p0, Lcom/localytics/android/DatapointHelper$AdvertisingInfo;->id:Ljava/lang/String;

    .line 240
    iput-boolean p2, p0, Lcom/localytics/android/DatapointHelper$AdvertisingInfo;->limitAdTracking:Z

    .line 241
    return-void
.end method
