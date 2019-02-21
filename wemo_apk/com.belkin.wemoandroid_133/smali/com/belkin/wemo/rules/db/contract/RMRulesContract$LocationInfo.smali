.class public abstract Lcom/belkin/wemo/rules/db/contract/RMRulesContract$LocationInfo;
.super Ljava/lang/Object;
.source "RMRulesContract.java"

# interfaces
.implements Landroid/provider/BaseColumns;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/rules/db/contract/RMRulesContract;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "LocationInfo"
.end annotation


# static fields
.field public static final COLUMNS:[Ljava/lang/String;

.field public static final COLUMNS_LIST:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final COLUMN_NAME_CITY_NAME:Ljava/lang/String; = "cityName"

.field public static final COLUMN_NAME_COUNTRY_CODE:Ljava/lang/String; = "countryCode"

.field public static final COLUMN_NAME_COUNTRY_NAME:Ljava/lang/String; = "countryName"

.field public static final COLUMN_NAME_LATITUDE:Ljava/lang/String; = "latitude"

.field public static final COLUMN_NAME_LOCATION_PK:Ljava/lang/String; = "LocationPk"

.field public static final COLUMN_NAME_LONGITUDE:Ljava/lang/String; = "longitude"

.field public static final COLUMN_NAME_REGION:Ljava/lang/String; = "region"

.field public static final CREATE_TABLE:Ljava/lang/String; = "CREATE TABLE IF NOT EXISTS LOCATIONINFO(LocationPk INTEGER PRIMARY KEY AUTOINCREMENT, cityName TEXT, countryName TEXT, latitude TEXT, longitude TEXT, countryCode TEXT, region TEXT )"

.field public static final DROP_TABLE:Ljava/lang/String; = "DROP TABLE IF EXISTS LOCATIONINFO"

.field public static final SELECTION_BY_LOCATION_PK:Ljava/lang/String; = "LocationPk=?"

.field public static final TABLE_NAME:Ljava/lang/String; = "LOCATIONINFO"


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 259
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "cityName"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "countryName"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "latitude"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "longitude"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "countryCode"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "region"

    aput-object v2, v0, v1

    sput-object v0, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$LocationInfo;->COLUMNS:[Ljava/lang/String;

    .line 260
    sget-object v0, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$LocationInfo;->COLUMNS:[Ljava/lang/String;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$LocationInfo;->COLUMNS_LIST:Ljava/util/List;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 236
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
