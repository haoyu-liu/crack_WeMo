.class public Lcom/belkin/wemo/rules/util/SDKRulesConstants;
.super Ljava/lang/Object;
.source "SDKRulesConstants.java"


# static fields
.field public static final CLOUD_DB:Ljava/lang/String; = "rules.db"

.field public static final CLOUD_TEMP_DB:Ljava/lang/String; = "cloudtemp.db"

.field public static PKG_NAME:Ljava/lang/String; = null

.field public static RULES_DB_PATH:Ljava/lang/String; = null

.field public static final UUID:Ljava/lang/String; = "uuid"

.field public static final WEEKLY_RECORD:I = 0x8

.field public static ZIP_DB_PATH:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 18
    const-string v0, ""

    sput-object v0, Lcom/belkin/wemo/rules/util/SDKRulesConstants;->RULES_DB_PATH:Ljava/lang/String;

    .line 19
    const-string v0, ""

    sput-object v0, Lcom/belkin/wemo/rules/util/SDKRulesConstants;->PKG_NAME:Ljava/lang/String;

    .line 20
    const-string v0, "data/data/"

    sput-object v0, Lcom/belkin/wemo/rules/util/SDKRulesConstants;->ZIP_DB_PATH:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
