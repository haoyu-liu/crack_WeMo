.class public final enum Lcom/belkin/wemo/rules/read/type/db/RMDBRuleParserFactory;
.super Ljava/lang/Enum;
.source "RMDBRuleParserFactory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/rules/read/type/db/RMDBRuleParserFactory$1;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/belkin/wemo/rules/read/type/db/RMDBRuleParserFactory;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/belkin/wemo/rules/read/type/db/RMDBRuleParserFactory;

.field public static final enum INSTANCE:Lcom/belkin/wemo/rules/read/type/db/RMDBRuleParserFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 7
    new-instance v0, Lcom/belkin/wemo/rules/read/type/db/RMDBRuleParserFactory;

    const-string v1, "INSTANCE"

    invoke-direct {v0, v1, v2}, Lcom/belkin/wemo/rules/read/type/db/RMDBRuleParserFactory;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/belkin/wemo/rules/read/type/db/RMDBRuleParserFactory;->INSTANCE:Lcom/belkin/wemo/rules/read/type/db/RMDBRuleParserFactory;

    .line 5
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/belkin/wemo/rules/read/type/db/RMDBRuleParserFactory;

    sget-object v1, Lcom/belkin/wemo/rules/read/type/db/RMDBRuleParserFactory;->INSTANCE:Lcom/belkin/wemo/rules/read/type/db/RMDBRuleParserFactory;

    aput-object v1, v0, v2

    sput-object v0, Lcom/belkin/wemo/rules/read/type/db/RMDBRuleParserFactory;->$VALUES:[Lcom/belkin/wemo/rules/read/type/db/RMDBRuleParserFactory;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 9
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 11
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/belkin/wemo/rules/read/type/db/RMDBRuleParserFactory;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 5
    const-class v0, Lcom/belkin/wemo/rules/read/type/db/RMDBRuleParserFactory;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/rules/read/type/db/RMDBRuleParserFactory;

    return-object v0
.end method

.method public static values()[Lcom/belkin/wemo/rules/read/type/db/RMDBRuleParserFactory;
    .locals 1

    .prologue
    .line 5
    sget-object v0, Lcom/belkin/wemo/rules/read/type/db/RMDBRuleParserFactory;->$VALUES:[Lcom/belkin/wemo/rules/read/type/db/RMDBRuleParserFactory;

    invoke-virtual {v0}, [Lcom/belkin/wemo/rules/read/type/db/RMDBRuleParserFactory;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/belkin/wemo/rules/read/type/db/RMDBRuleParserFactory;

    return-object v0
.end method


# virtual methods
.method public getDBRuleParserInstance(Lcom/belkin/wemo/rules/data/RMDBRuleType;)Lcom/belkin/wemo/rules/read/type/db/RMIDBRuleParser;
    .locals 3
    .param p1, "ruleType"    # Lcom/belkin/wemo/rules/data/RMDBRuleType;

    .prologue
    .line 14
    const/4 v0, 0x0

    .line 16
    .local v0, "parser":Lcom/belkin/wemo/rules/read/type/db/RMIDBRuleParser;
    sget-object v1, Lcom/belkin/wemo/rules/read/type/db/RMDBRuleParserFactory$1;->$SwitchMap$com$belkin$wemo$rules$data$RMDBRuleType:[I

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/data/RMDBRuleType;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 54
    :goto_0
    return-object v0

    .line 18
    :pswitch_0
    new-instance v0, Lcom/belkin/wemo/rules/read/type/db/RMSimpleSwitchRuleParser;

    .end local v0    # "parser":Lcom/belkin/wemo/rules/read/type/db/RMIDBRuleParser;
    invoke-direct {v0}, Lcom/belkin/wemo/rules/read/type/db/RMSimpleSwitchRuleParser;-><init>()V

    .line 19
    .restart local v0    # "parser":Lcom/belkin/wemo/rules/read/type/db/RMIDBRuleParser;
    goto :goto_0

    .line 21
    :pswitch_1
    new-instance v0, Lcom/belkin/wemo/rules/read/type/db/RMCountdownTimerRuleParser;

    .end local v0    # "parser":Lcom/belkin/wemo/rules/read/type/db/RMIDBRuleParser;
    invoke-direct {v0}, Lcom/belkin/wemo/rules/read/type/db/RMCountdownTimerRuleParser;-><init>()V

    .line 22
    .restart local v0    # "parser":Lcom/belkin/wemo/rules/read/type/db/RMIDBRuleParser;
    goto :goto_0

    .line 24
    :pswitch_2
    new-instance v0, Lcom/belkin/wemo/rules/read/type/db/RMAwayModeRuleParser;

    .end local v0    # "parser":Lcom/belkin/wemo/rules/read/type/db/RMIDBRuleParser;
    invoke-direct {v0}, Lcom/belkin/wemo/rules/read/type/db/RMAwayModeRuleParser;-><init>()V

    .line 25
    .restart local v0    # "parser":Lcom/belkin/wemo/rules/read/type/db/RMIDBRuleParser;
    goto :goto_0

    .line 27
    :pswitch_3
    new-instance v0, Lcom/belkin/wemo/rules/read/type/db/RMInsightRuleParser;

    .end local v0    # "parser":Lcom/belkin/wemo/rules/read/type/db/RMIDBRuleParser;
    invoke-direct {v0}, Lcom/belkin/wemo/rules/read/type/db/RMInsightRuleParser;-><init>()V

    .line 28
    .restart local v0    # "parser":Lcom/belkin/wemo/rules/read/type/db/RMIDBRuleParser;
    goto :goto_0

    .line 30
    :pswitch_4
    new-instance v0, Lcom/belkin/wemo/rules/read/type/db/RMMakerNotifyRuleParser;

    .end local v0    # "parser":Lcom/belkin/wemo/rules/read/type/db/RMIDBRuleParser;
    invoke-direct {v0}, Lcom/belkin/wemo/rules/read/type/db/RMMakerNotifyRuleParser;-><init>()V

    .line 31
    .restart local v0    # "parser":Lcom/belkin/wemo/rules/read/type/db/RMIDBRuleParser;
    goto :goto_0

    .line 33
    :pswitch_5
    new-instance v0, Lcom/belkin/wemo/rules/read/type/db/RMMakerSensorRuleParser;

    .end local v0    # "parser":Lcom/belkin/wemo/rules/read/type/db/RMIDBRuleParser;
    invoke-direct {v0}, Lcom/belkin/wemo/rules/read/type/db/RMMakerSensorRuleParser;-><init>()V

    .line 34
    .restart local v0    # "parser":Lcom/belkin/wemo/rules/read/type/db/RMIDBRuleParser;
    goto :goto_0

    .line 36
    :pswitch_6
    new-instance v0, Lcom/belkin/wemo/rules/read/type/db/RMMotionControlledRuleParser;

    .end local v0    # "parser":Lcom/belkin/wemo/rules/read/type/db/RMIDBRuleParser;
    invoke-direct {v0}, Lcom/belkin/wemo/rules/read/type/db/RMMotionControlledRuleParser;-><init>()V

    .line 37
    .restart local v0    # "parser":Lcom/belkin/wemo/rules/read/type/db/RMIDBRuleParser;
    goto :goto_0

    .line 39
    :pswitch_7
    new-instance v0, Lcom/belkin/wemo/rules/read/type/db/RMNotifyMeRuleParser;

    .end local v0    # "parser":Lcom/belkin/wemo/rules/read/type/db/RMIDBRuleParser;
    invoke-direct {v0}, Lcom/belkin/wemo/rules/read/type/db/RMNotifyMeRuleParser;-><init>()V

    .line 40
    .restart local v0    # "parser":Lcom/belkin/wemo/rules/read/type/db/RMIDBRuleParser;
    goto :goto_0

    .line 42
    :pswitch_8
    new-instance v0, Lcom/belkin/wemo/rules/read/type/db/RMTimeInternalRuleParser;

    .end local v0    # "parser":Lcom/belkin/wemo/rules/read/type/db/RMIDBRuleParser;
    invoke-direct {v0}, Lcom/belkin/wemo/rules/read/type/db/RMTimeInternalRuleParser;-><init>()V

    .line 43
    .restart local v0    # "parser":Lcom/belkin/wemo/rules/read/type/db/RMIDBRuleParser;
    goto :goto_0

    .line 45
    :pswitch_9
    new-instance v0, Lcom/belkin/wemo/rules/read/type/db/RMLongPressRuleParser;

    .end local v0    # "parser":Lcom/belkin/wemo/rules/read/type/db/RMIDBRuleParser;
    invoke-direct {v0}, Lcom/belkin/wemo/rules/read/type/db/RMLongPressRuleParser;-><init>()V

    .line 46
    .restart local v0    # "parser":Lcom/belkin/wemo/rules/read/type/db/RMIDBRuleParser;
    goto :goto_0

    .line 48
    :pswitch_a
    new-instance v0, Lcom/belkin/wemo/rules/read/type/db/RMEventRuleParser;

    .end local v0    # "parser":Lcom/belkin/wemo/rules/read/type/db/RMIDBRuleParser;
    invoke-direct {v0}, Lcom/belkin/wemo/rules/read/type/db/RMEventRuleParser;-><init>()V

    .line 49
    .restart local v0    # "parser":Lcom/belkin/wemo/rules/read/type/db/RMIDBRuleParser;
    goto :goto_0

    .line 16
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
    .end packed-switch
.end method
