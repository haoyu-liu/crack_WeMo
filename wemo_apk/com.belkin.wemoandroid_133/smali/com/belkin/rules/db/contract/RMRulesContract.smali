.class public final Lcom/belkin/rules/db/contract/RMRulesContract;
.super Ljava/lang/Object;
.source "RMRulesContract.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/rules/db/contract/RMRulesContract$BlockedRules;,
        Lcom/belkin/rules/db/contract/RMRulesContract$LocationInfo;,
        Lcom/belkin/rules/db/contract/RMRulesContract$SensorNotification;,
        Lcom/belkin/rules/db/contract/RMRulesContract$RulesNotifyMessage;,
        Lcom/belkin/rules/db/contract/RMRulesContract$GroupDevices;,
        Lcom/belkin/rules/db/contract/RMRulesContract$DeviceCombination;,
        Lcom/belkin/rules/db/contract/RMRulesContract$RuleDevices;,
        Lcom/belkin/rules/db/contract/RMRulesContract$Rules;
    }
.end annotation


# static fields
.field public static final DATABASE_NAME:Ljava/lang/String; = "temppluginRules.db"

.field public static final DATABASE_VERSION:I = 0x6


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    return-void
.end method
