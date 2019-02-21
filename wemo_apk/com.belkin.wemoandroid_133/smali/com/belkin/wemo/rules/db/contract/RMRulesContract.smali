.class public final Lcom/belkin/wemo/rules/db/contract/RMRulesContract;
.super Ljava/lang/Object;
.source "RMRulesContract.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/rules/db/contract/RMRulesContract$TargetDevices;,
        Lcom/belkin/wemo/rules/db/contract/RMRulesContract$BlockedRules;,
        Lcom/belkin/wemo/rules/db/contract/RMRulesContract$LocationInfo;,
        Lcom/belkin/wemo/rules/db/contract/RMRulesContract$SensorNotification;,
        Lcom/belkin/wemo/rules/db/contract/RMRulesContract$RulesNotifyMessage;,
        Lcom/belkin/wemo/rules/db/contract/RMRulesContract$GroupDevices;,
        Lcom/belkin/wemo/rules/db/contract/RMRulesContract$DeviceCombination;,
        Lcom/belkin/wemo/rules/db/contract/RMRulesContract$RuleDevices;,
        Lcom/belkin/wemo/rules/db/contract/RMRulesContract$Rules;
    }
.end annotation


# static fields
.field public static final DATABASE_NAME:Ljava/lang/String; = "pluginrules2.db"

.field public static final DATABASE_VERSION:I = 0x9

.field public static final DATABASE_VERSION_DIMMER:I = 0x9

.field public static final DATABASE_VERSION_FIVE:I = 0x5

.field public static final DATABASE_VERSION_FOUR:I = 0x4

.field public static final DATABASE_VERSION_INTREPID:I = 0x7

.field public static final DATABASE_VERSION_NEST:I = 0x8

.field public static final DATABASE_VERSION_SIX:I = 0x6

.field public static final WHERE:Ljava/lang/String; = "=?"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    return-void
.end method
