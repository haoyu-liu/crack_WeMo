.class public Lcom/belkin/wemo/rules/data/RMCountdownTimerRule;
.super Lcom/belkin/wemo/rules/data/RMDBRule;
.source "RMCountdownTimerRule.java"


# instance fields
.field private countdownTime:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Lcom/belkin/wemo/rules/data/RMDBRule;-><init>()V

    .line 31
    return-void
.end method

.method public constructor <init>(ILcom/belkin/wemo/rules/data/RMDBRuleType;IILjava/lang/String;Ljava/util/HashMap;IIIIJ)V
    .locals 1
    .param p1, "ruleId"    # I
    .param p2, "type"    # Lcom/belkin/wemo/rules/data/RMDBRuleType;
    .param p3, "rulesType"    # I
    .param p4, "state"    # I
    .param p5, "displayName"    # Ljava/lang/String;
    .param p7, "value"    # I
    .param p8, "level"    # I
    .param p9, "onModeOffset"    # I
    .param p10, "offModeOffset"    # I
    .param p11, "sunriseSunsetEndTime"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/belkin/wemo/rules/data/RMDBRuleType;",
            "II",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;>;IIIIJ)V"
        }
    .end annotation

    .prologue
    .line 25
    .local p6, "ruleDeviceUDNDaysMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/Integer;>;>;"
    invoke-direct/range {p0 .. p12}, Lcom/belkin/wemo/rules/data/RMDBRule;-><init>(ILcom/belkin/wemo/rules/data/RMDBRuleType;IILjava/lang/String;Ljava/util/HashMap;IIIIJ)V

    .line 27
    return-void
.end method


# virtual methods
.method protected assignDBRuleType()Lcom/belkin/wemo/rules/data/RMDBRuleType;
    .locals 1

    .prologue
    .line 14
    sget-object v0, Lcom/belkin/wemo/rules/data/RMDBRuleType;->COUNTDOWN_RULE:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    return-object v0
.end method

.method public getCountdownTime()I
    .locals 1

    .prologue
    .line 34
    iget v0, p0, Lcom/belkin/wemo/rules/data/RMCountdownTimerRule;->countdownTime:I

    return v0
.end method

.method public setCountdownTime(I)V
    .locals 0
    .param p1, "countdownTime"    # I

    .prologue
    .line 38
    iput p1, p0, Lcom/belkin/wemo/rules/data/RMCountdownTimerRule;->countdownTime:I

    .line 39
    return-void
.end method
