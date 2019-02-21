.class Lcom/localytics/android/AnalyticsProvider;
.super Lcom/localytics/android/BaseProvider;
.source "AnalyticsProvider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/localytics/android/AnalyticsProvider$AnalyticsDatabaseHelper;,
        Lcom/localytics/android/AnalyticsProvider$InfoV3Columns;,
        Lcom/localytics/android/AnalyticsProvider$IdentifiersV3Columns;,
        Lcom/localytics/android/AnalyticsProvider$EventsV3Columns;,
        Lcom/localytics/android/AnalyticsProvider$CustomDimensionsV3Columns;
    }
.end annotation


# static fields
.field static final DATABASE_VERSION:I = 0x2


# direct methods
.method constructor <init>(Lcom/localytics/android/LocalyticsDao;)V
    .locals 0
    .param p1, "localyticsDao"    # Lcom/localytics/android/LocalyticsDao;

    .prologue
    .line 59
    invoke-direct {p0, p1}, Lcom/localytics/android/BaseProvider;-><init>(Lcom/localytics/android/LocalyticsDao;)V

    .line 60
    return-void
.end method

.method constructor <init>(Ljava/lang/String;Lcom/localytics/android/LocalyticsDao;)V
    .locals 6
    .param p1, "dbName"    # Ljava/lang/String;
    .param p2, "localyticsDao"    # Lcom/localytics/android/LocalyticsDao;

    .prologue
    const/4 v5, 0x2

    .line 40
    invoke-direct {p0, p2}, Lcom/localytics/android/BaseProvider;-><init>(Lcom/localytics/android/LocalyticsDao;)V

    .line 47
    new-instance v0, Lcom/localytics/android/AnalyticsProvider$AnalyticsDatabaseHelper;

    const-string v1, "com.localytics.android.%s.%s.sqlite"

    new-array v2, v5, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-interface {p2}, Lcom/localytics/android/LocalyticsDao;->getApiKey()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/localytics/android/DatapointHelper;->getSha256_buggy(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    aput-object p1, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, v5, p2}, Lcom/localytics/android/AnalyticsProvider$AnalyticsDatabaseHelper;-><init>(Ljava/lang/String;ILcom/localytics/android/LocalyticsDao;)V

    invoke-virtual {v0}, Lcom/localytics/android/AnalyticsProvider$AnalyticsDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    iput-object v0, p0, Lcom/localytics/android/AnalyticsProvider;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    .line 52
    return-void
.end method


# virtual methods
.method canAddToDB()Z
    .locals 4

    .prologue
    .line 71
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/localytics/android/AnalyticsProvider;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v0

    invoke-virtual {p0}, Lcom/localytics/android/AnalyticsProvider;->maxSiloDbSize()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method maxSiloDbSize()J
    .locals 2

    .prologue
    .line 65
    sget-wide v0, Lcom/localytics/android/Constants;->dbMaxSizeForAnalytics:J

    return-wide v0
.end method
