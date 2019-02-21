.class public abstract Lcom/belkin/rules/db/contract/RMRulesContract$Rules;
.super Ljava/lang/Object;
.source "RMRulesContract.java"

# interfaces
.implements Landroid/provider/BaseColumns;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/rules/db/contract/RMRulesContract;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Rules"
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

.field public static final COLUMN_NAME_END_DATE:Ljava/lang/String; = "EndDate"

.field public static final COLUMN_NAME_NAME:Ljava/lang/String; = "Name"

.field public static final COLUMN_NAME_RULE_ID:Ljava/lang/String; = "RuleID"

.field public static final COLUMN_NAME_RULE_ORDER:Ljava/lang/String; = "RuleOrder"

.field public static final COLUMN_NAME_START_DATE:Ljava/lang/String; = "StartDate"

.field public static final COLUMN_NAME_STATE:Ljava/lang/String; = "State"

.field public static final COLUMN_NAME_SYNC:Ljava/lang/String; = "Sync"

.field public static final COLUMN_NAME_TYPE:Ljava/lang/String; = "Type"

.field public static final CREATE_TABLE:Ljava/lang/String; = "CREATE TABLE IF NOT EXISTS RULES ( RuleID PRIMARY KEY, Name TEXT NOT NULL, Type TEXT NOT NULL, RuleOrder INTEGER, StartDate TEXT, EndDate TEXT, State TEXT, Sync INTEGER)"

.field public static final ORDER_BY:Ljava/lang/String; = "RuleID"

.field public static final SELECTION_BY_RULE_ID:Ljava/lang/String; = "RuleID=?"

.field public static final TABLE_NAME:Ljava/lang/String; = "RULES"


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 42
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "RuleID"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "Name"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "Type"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "State"

    aput-object v2, v0, v1

    sput-object v0, Lcom/belkin/rules/db/contract/RMRulesContract$Rules;->COLUMNS:[Ljava/lang/String;

    .line 43
    sget-object v0, Lcom/belkin/rules/db/contract/RMRulesContract$Rules;->COLUMNS:[Ljava/lang/String;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/belkin/rules/db/contract/RMRulesContract$Rules;->COLUMNS_LIST:Ljava/util/List;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
