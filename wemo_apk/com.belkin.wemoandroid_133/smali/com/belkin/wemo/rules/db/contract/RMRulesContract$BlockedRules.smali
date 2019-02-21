.class public abstract Lcom/belkin/wemo/rules/db/contract/RMRulesContract$BlockedRules;
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
    name = "BlockedRules"
.end annotation


# static fields
.field public static final COLUMN_NAME_PRIMARY_KEY:Ljava/lang/String; = "Primarykey"

.field public static final COLUMN_NAME_RULE_ID:Ljava/lang/String; = "ruleId"

.field public static final CREATE_TABLE:Ljava/lang/String; = "CREATE TABLE IF NOT EXISTS BLOCKEDRULES(Primarykey INTEGER PRIMARY KEY AUTOINCREMENT, ruleId TEXT )"

.field public static final DROP_TABLE:Ljava/lang/String; = "DROP TABLE IF EXISTS BLOCKEDRULES"

.field public static final TABLE_NAME:Ljava/lang/String; = "BLOCKEDRULES"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 263
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
