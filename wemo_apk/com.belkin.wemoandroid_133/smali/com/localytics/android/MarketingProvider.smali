.class Lcom/localytics/android/MarketingProvider;
.super Lcom/localytics/android/BaseProvider;
.source "MarketingProvider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/localytics/android/MarketingProvider$MarketingDatabaseHelper;,
        Lcom/localytics/android/MarketingProvider$CamapignsDisplayedV3Columns;,
        Lcom/localytics/android/MarketingProvider$FrequencyCappingBlackoutTimeV3Columns;,
        Lcom/localytics/android/MarketingProvider$FrequencyCappingBlackoutWeekdayV3Columns;,
        Lcom/localytics/android/MarketingProvider$FrequencyCappingBlackoutDateV3Columns;,
        Lcom/localytics/android/MarketingProvider$FrequencyCappingDisplayFrequencyV3Columns;,
        Lcom/localytics/android/MarketingProvider$FrequencyCappingV3Columns;,
        Lcom/localytics/android/MarketingProvider$MarketingConditionValuesV3Columns;,
        Lcom/localytics/android/MarketingProvider$MarketingConditionsV3Columns;,
        Lcom/localytics/android/MarketingProvider$MarketingRuleEventV3Columns;,
        Lcom/localytics/android/MarketingProvider$MarketingDisplayedV3Columns;,
        Lcom/localytics/android/MarketingProvider$MarketingRulesV3Columns;
    }
.end annotation


# static fields
.field static final DATABASE_VERSION:I = 0x3


# direct methods
.method constructor <init>(Lcom/localytics/android/LocalyticsDao;)V
    .locals 0
    .param p1, "localyticsDao"    # Lcom/localytics/android/LocalyticsDao;

    .prologue
    .line 55
    invoke-direct {p0, p1}, Lcom/localytics/android/BaseProvider;-><init>(Lcom/localytics/android/LocalyticsDao;)V

    .line 56
    return-void
.end method

.method constructor <init>(Ljava/lang/String;Lcom/localytics/android/LocalyticsDao;)V
    .locals 5
    .param p1, "dbName"    # Ljava/lang/String;
    .param p2, "localyticsDao"    # Lcom/localytics/android/LocalyticsDao;

    .prologue
    .line 36
    invoke-direct {p0, p2}, Lcom/localytics/android/BaseProvider;-><init>(Lcom/localytics/android/LocalyticsDao;)V

    .line 43
    new-instance v0, Lcom/localytics/android/MarketingProvider$MarketingDatabaseHelper;

    const-string v1, "com.localytics.android.%s.%s.sqlite"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

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

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2, p2}, Lcom/localytics/android/MarketingProvider$MarketingDatabaseHelper;-><init>(Ljava/lang/String;ILcom/localytics/android/LocalyticsDao;)V

    invoke-virtual {v0}, Lcom/localytics/android/MarketingProvider$MarketingDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    iput-object v0, p0, Lcom/localytics/android/MarketingProvider;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    .line 48
    return-void
.end method


# virtual methods
.method canAddToDB()Z
    .locals 1

    .prologue
    .line 67
    const/4 v0, 0x1

    return v0
.end method

.method maxSiloDbSize()J
    .locals 2

    .prologue
    .line 61
    const-wide v0, 0x7fffffffffffffffL

    return-wide v0
.end method
