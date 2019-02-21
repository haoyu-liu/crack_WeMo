.class public final enum Lcom/belkin/wemo/rules/data/RMDBRuleType;
.super Ljava/lang/Enum;
.source "RMDBRuleType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/belkin/wemo/rules/data/RMDBRuleType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/belkin/wemo/rules/data/RMDBRuleType;

.field public static final enum AWAY_MODE:Lcom/belkin/wemo/rules/data/RMDBRuleType;

.field public static final enum COUNTDOWN_RULE:Lcom/belkin/wemo/rules/data/RMDBRuleType;

.field public static final enum EVENT_RULE:Lcom/belkin/wemo/rules/data/RMDBRuleType;

.field public static final enum INSIGHT_RULE:Lcom/belkin/wemo/rules/data/RMDBRuleType;

.field public static final INVALID_RULE_TYPE_STRING_EXCEPTION:Ljava/lang/String; = "Rule type string is not recognized."

.field public static final enum LONG_PRESS:Lcom/belkin/wemo/rules/data/RMDBRuleType;

.field public static final enum MAKER_NOTIFY_RULE:Lcom/belkin/wemo/rules/data/RMDBRuleType;

.field public static final enum MAKER_SENSOR_RULE:Lcom/belkin/wemo/rules/data/RMDBRuleType;

.field public static final enum MOTION_CONTROLLED:Lcom/belkin/wemo/rules/data/RMDBRuleType;

.field public static final enum NOTIFY_ME:Lcom/belkin/wemo/rules/data/RMDBRuleType;

.field public static final enum SIMPLE_SWITCH:Lcom/belkin/wemo/rules/data/RMDBRuleType;

.field public static final enum TIME_INTERVAL:Lcom/belkin/wemo/rules/data/RMDBRuleType;


# instance fields
.field private final dbRuleType:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 9
    new-instance v0, Lcom/belkin/wemo/rules/data/RMDBRuleType;

    const-string v1, "SIMPLE_SWITCH"

    const-string v2, "Simple Switch"

    invoke-direct {v0, v1, v4, v2}, Lcom/belkin/wemo/rules/data/RMDBRuleType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/belkin/wemo/rules/data/RMDBRuleType;->SIMPLE_SWITCH:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    .line 10
    new-instance v0, Lcom/belkin/wemo/rules/data/RMDBRuleType;

    const-string v1, "COUNTDOWN_RULE"

    const-string v2, "Countdown Rule"

    invoke-direct {v0, v1, v5, v2}, Lcom/belkin/wemo/rules/data/RMDBRuleType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/belkin/wemo/rules/data/RMDBRuleType;->COUNTDOWN_RULE:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    .line 11
    new-instance v0, Lcom/belkin/wemo/rules/data/RMDBRuleType;

    const-string v1, "TIME_INTERVAL"

    const-string v2, "Time Interval"

    invoke-direct {v0, v1, v6, v2}, Lcom/belkin/wemo/rules/data/RMDBRuleType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/belkin/wemo/rules/data/RMDBRuleType;->TIME_INTERVAL:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    .line 12
    new-instance v0, Lcom/belkin/wemo/rules/data/RMDBRuleType;

    const-string v1, "INSIGHT_RULE"

    const-string v2, "Insight Rule"

    invoke-direct {v0, v1, v7, v2}, Lcom/belkin/wemo/rules/data/RMDBRuleType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/belkin/wemo/rules/data/RMDBRuleType;->INSIGHT_RULE:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    .line 13
    new-instance v0, Lcom/belkin/wemo/rules/data/RMDBRuleType;

    const-string v1, "MOTION_CONTROLLED"

    const-string v2, "Motion Controlled"

    invoke-direct {v0, v1, v8, v2}, Lcom/belkin/wemo/rules/data/RMDBRuleType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/belkin/wemo/rules/data/RMDBRuleType;->MOTION_CONTROLLED:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    .line 14
    new-instance v0, Lcom/belkin/wemo/rules/data/RMDBRuleType;

    const-string v1, "AWAY_MODE"

    const/4 v2, 0x5

    const-string v3, "Away Mode"

    invoke-direct {v0, v1, v2, v3}, Lcom/belkin/wemo/rules/data/RMDBRuleType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/belkin/wemo/rules/data/RMDBRuleType;->AWAY_MODE:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    .line 15
    new-instance v0, Lcom/belkin/wemo/rules/data/RMDBRuleType;

    const-string v1, "MAKER_SENSOR_RULE"

    const/4 v2, 0x6

    const-string v3, "Maker Sensor Rule"

    invoke-direct {v0, v1, v2, v3}, Lcom/belkin/wemo/rules/data/RMDBRuleType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/belkin/wemo/rules/data/RMDBRuleType;->MAKER_SENSOR_RULE:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    .line 16
    new-instance v0, Lcom/belkin/wemo/rules/data/RMDBRuleType;

    const-string v1, "MAKER_NOTIFY_RULE"

    const/4 v2, 0x7

    const-string v3, "Maker Notify Rule"

    invoke-direct {v0, v1, v2, v3}, Lcom/belkin/wemo/rules/data/RMDBRuleType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/belkin/wemo/rules/data/RMDBRuleType;->MAKER_NOTIFY_RULE:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    .line 17
    new-instance v0, Lcom/belkin/wemo/rules/data/RMDBRuleType;

    const-string v1, "LONG_PRESS"

    const/16 v2, 0x8

    const-string v3, "Long Press"

    invoke-direct {v0, v1, v2, v3}, Lcom/belkin/wemo/rules/data/RMDBRuleType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/belkin/wemo/rules/data/RMDBRuleType;->LONG_PRESS:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    .line 18
    new-instance v0, Lcom/belkin/wemo/rules/data/RMDBRuleType;

    const-string v1, "EVENT_RULE"

    const/16 v2, 0x9

    const-string v3, "Event Rule"

    invoke-direct {v0, v1, v2, v3}, Lcom/belkin/wemo/rules/data/RMDBRuleType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/belkin/wemo/rules/data/RMDBRuleType;->EVENT_RULE:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    .line 19
    new-instance v0, Lcom/belkin/wemo/rules/data/RMDBRuleType;

    const-string v1, "NOTIFY_ME"

    const/16 v2, 0xa

    const-string v3, "Notify Me"

    invoke-direct {v0, v1, v2, v3}, Lcom/belkin/wemo/rules/data/RMDBRuleType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/belkin/wemo/rules/data/RMDBRuleType;->NOTIFY_ME:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    .line 7
    const/16 v0, 0xb

    new-array v0, v0, [Lcom/belkin/wemo/rules/data/RMDBRuleType;

    sget-object v1, Lcom/belkin/wemo/rules/data/RMDBRuleType;->SIMPLE_SWITCH:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/belkin/wemo/rules/data/RMDBRuleType;->COUNTDOWN_RULE:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/belkin/wemo/rules/data/RMDBRuleType;->TIME_INTERVAL:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    aput-object v1, v0, v6

    sget-object v1, Lcom/belkin/wemo/rules/data/RMDBRuleType;->INSIGHT_RULE:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    aput-object v1, v0, v7

    sget-object v1, Lcom/belkin/wemo/rules/data/RMDBRuleType;->MOTION_CONTROLLED:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    aput-object v1, v0, v8

    const/4 v1, 0x5

    sget-object v2, Lcom/belkin/wemo/rules/data/RMDBRuleType;->AWAY_MODE:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/belkin/wemo/rules/data/RMDBRuleType;->MAKER_SENSOR_RULE:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/belkin/wemo/rules/data/RMDBRuleType;->MAKER_NOTIFY_RULE:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/belkin/wemo/rules/data/RMDBRuleType;->LONG_PRESS:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/belkin/wemo/rules/data/RMDBRuleType;->EVENT_RULE:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lcom/belkin/wemo/rules/data/RMDBRuleType;->NOTIFY_ME:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    aput-object v2, v0, v1

    sput-object v0, Lcom/belkin/wemo/rules/data/RMDBRuleType;->$VALUES:[Lcom/belkin/wemo/rules/data/RMDBRuleType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .param p3, "dbRuleType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 25
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 26
    iput-object p3, p0, Lcom/belkin/wemo/rules/data/RMDBRuleType;->dbRuleType:Ljava/lang/String;

    .line 27
    return-void
.end method

.method public static fromString(Ljava/lang/String;)Lcom/belkin/wemo/rules/data/RMDBRuleType;
    .locals 7
    .param p0, "ruleTypeStr"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 35
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 36
    invoke-static {}, Lcom/belkin/wemo/rules/data/RMDBRuleType;->values()[Lcom/belkin/wemo/rules/data/RMDBRuleType;

    move-result-object v0

    .local v0, "arr$":[Lcom/belkin/wemo/rules/data/RMDBRuleType;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_1

    aget-object v3, v0, v1

    .line 37
    .local v3, "ruleType":Lcom/belkin/wemo/rules/data/RMDBRuleType;
    invoke-virtual {v3}, Lcom/belkin/wemo/rules/data/RMDBRuleType;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 38
    return-object v3

    .line 36
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 42
    .end local v0    # "arr$":[Lcom/belkin/wemo/rules/data/RMDBRuleType;
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    .end local v3    # "ruleType":Lcom/belkin/wemo/rules/data/RMDBRuleType;
    :cond_1
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Rule type string is not recognized.: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/belkin/wemo/rules/data/RMDBRuleType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 7
    const-class v0, Lcom/belkin/wemo/rules/data/RMDBRuleType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/rules/data/RMDBRuleType;

    return-object v0
.end method

.method public static values()[Lcom/belkin/wemo/rules/data/RMDBRuleType;
    .locals 1

    .prologue
    .line 7
    sget-object v0, Lcom/belkin/wemo/rules/data/RMDBRuleType;->$VALUES:[Lcom/belkin/wemo/rules/data/RMDBRuleType;

    invoke-virtual {v0}, [Lcom/belkin/wemo/rules/data/RMDBRuleType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/belkin/wemo/rules/data/RMDBRuleType;

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 31
    iget-object v0, p0, Lcom/belkin/wemo/rules/data/RMDBRuleType;->dbRuleType:Ljava/lang/String;

    return-object v0
.end method
