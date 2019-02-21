.class public abstract Lcom/belkin/wemo/rules/db/contract/RMRulesContract$RulesNotifyMessage;
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
    name = "RulesNotifyMessage"
.end annotation


# static fields
.field public static final COLUMN_NAME_FREQUENCY:Ljava/lang/String; = "Frequency"

.field public static final COLUMN_NAME_MESSAGE:Ljava/lang/String; = "Message"

.field public static final COLUMN_NAME_NOTIFY_RULE_ID:Ljava/lang/String; = "NotifyRuleID"

.field public static final COLUMN_NAME_RULE_ID:Ljava/lang/String; = "RuleID"

.field public static final CREATE_TABLE:Ljava/lang/String; = "CREATE TABLE IF NOT EXISTS RULESNOTIFYMESSAGE(RuleID INTEGER PRIMARY KEY AUTOINCREMENT, NotifyRuleID INTEGER , Message TEXT , Frequency INTEGER )"

.field public static final DROP_TABLE:Ljava/lang/String; = "DROP TABLE IF EXISTS RULESNOTIFYMESSAGE"

.field public static final TABLE_NAME:Ljava/lang/String; = "RULESNOTIFYMESSAGE"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 195
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
