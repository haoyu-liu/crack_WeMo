.class public final enum Lcom/belkin/wemo/rules/composer/impl/RMRuleComposerFactory;
.super Ljava/lang/Enum;
.source "RMRuleComposerFactory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/rules/composer/impl/RMRuleComposerFactory$1;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/belkin/wemo/rules/composer/impl/RMRuleComposerFactory;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/belkin/wemo/rules/composer/impl/RMRuleComposerFactory;

.field public static final enum INSTANCE:Lcom/belkin/wemo/rules/composer/impl/RMRuleComposerFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 12
    new-instance v0, Lcom/belkin/wemo/rules/composer/impl/RMRuleComposerFactory;

    const-string v1, "INSTANCE"

    invoke-direct {v0, v1, v2}, Lcom/belkin/wemo/rules/composer/impl/RMRuleComposerFactory;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/belkin/wemo/rules/composer/impl/RMRuleComposerFactory;->INSTANCE:Lcom/belkin/wemo/rules/composer/impl/RMRuleComposerFactory;

    .line 10
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/belkin/wemo/rules/composer/impl/RMRuleComposerFactory;

    sget-object v1, Lcom/belkin/wemo/rules/composer/impl/RMRuleComposerFactory;->INSTANCE:Lcom/belkin/wemo/rules/composer/impl/RMRuleComposerFactory;

    aput-object v1, v0, v2

    sput-object v0, Lcom/belkin/wemo/rules/composer/impl/RMRuleComposerFactory;->$VALUES:[Lcom/belkin/wemo/rules/composer/impl/RMRuleComposerFactory;

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
    .line 14
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 16
    return-void
.end method

.method private getDBRuleComposer(Lcom/belkin/wemo/rules/data/RMRule;)Lcom/belkin/wemo/rules/composer/RMAbstractRuleComposer;
    .locals 3
    .param p1, "rule"    # Lcom/belkin/wemo/rules/data/RMRule;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/belkin/wemo/rules/data/RMRule;",
            ")",
            "Lcom/belkin/wemo/rules/composer/RMAbstractRuleComposer",
            "<+",
            "Lcom/belkin/wemo/rules/data/RMRule;",
            ">;"
        }
    .end annotation

    .prologue
    .line 34
    const/4 v0, 0x0

    .line 36
    .local v0, "composer":Lcom/belkin/wemo/rules/composer/RMAbstractRuleComposer;, "Lcom/belkin/wemo/rules/composer/RMAbstractRuleComposer<+Lcom/belkin/wemo/rules/data/RMRule;>;"
    sget-object v2, Lcom/belkin/wemo/rules/composer/impl/RMRuleComposerFactory$1;->$SwitchMap$com$belkin$wemo$rules$data$RMDBRuleType:[I

    move-object v1, p1

    check-cast v1, Lcom/belkin/wemo/rules/data/RMDBRule;

    invoke-virtual {v1}, Lcom/belkin/wemo/rules/data/RMDBRule;->getRuleType()Lcom/belkin/wemo/rules/data/RMDBRuleType;

    move-result-object v1

    invoke-virtual {v1}, Lcom/belkin/wemo/rules/data/RMDBRuleType;->ordinal()I

    move-result v1

    aget v1, v2, v1

    packed-switch v1, :pswitch_data_0

    .line 73
    .end local p1    # "rule":Lcom/belkin/wemo/rules/data/RMRule;
    :goto_0
    :pswitch_0
    return-object v0

    .line 56
    .restart local p1    # "rule":Lcom/belkin/wemo/rules/data/RMRule;
    :pswitch_1
    new-instance v0, Lcom/belkin/wemo/rules/composer/impl/RMSimpleSwitchRuleComposer;

    .end local v0    # "composer":Lcom/belkin/wemo/rules/composer/RMAbstractRuleComposer;, "Lcom/belkin/wemo/rules/composer/RMAbstractRuleComposer<+Lcom/belkin/wemo/rules/data/RMRule;>;"
    check-cast p1, Lcom/belkin/wemo/rules/data/RMSimpleSwitchRule;

    .end local p1    # "rule":Lcom/belkin/wemo/rules/data/RMRule;
    invoke-direct {v0, p1}, Lcom/belkin/wemo/rules/composer/impl/RMSimpleSwitchRuleComposer;-><init>(Lcom/belkin/wemo/rules/data/RMSimpleSwitchRule;)V

    .line 57
    .restart local v0    # "composer":Lcom/belkin/wemo/rules/composer/RMAbstractRuleComposer;, "Lcom/belkin/wemo/rules/composer/RMAbstractRuleComposer<+Lcom/belkin/wemo/rules/data/RMRule;>;"
    goto :goto_0

    .line 59
    .restart local p1    # "rule":Lcom/belkin/wemo/rules/data/RMRule;
    :pswitch_2
    new-instance v0, Lcom/belkin/wemo/rules/composer/impl/RMCountdownTimerRuleComposer;

    .end local v0    # "composer":Lcom/belkin/wemo/rules/composer/RMAbstractRuleComposer;, "Lcom/belkin/wemo/rules/composer/RMAbstractRuleComposer<+Lcom/belkin/wemo/rules/data/RMRule;>;"
    check-cast p1, Lcom/belkin/wemo/rules/data/RMCountdownTimerRule;

    .end local p1    # "rule":Lcom/belkin/wemo/rules/data/RMRule;
    invoke-direct {v0, p1}, Lcom/belkin/wemo/rules/composer/impl/RMCountdownTimerRuleComposer;-><init>(Lcom/belkin/wemo/rules/data/RMCountdownTimerRule;)V

    .line 60
    .restart local v0    # "composer":Lcom/belkin/wemo/rules/composer/RMAbstractRuleComposer;, "Lcom/belkin/wemo/rules/composer/RMAbstractRuleComposer<+Lcom/belkin/wemo/rules/data/RMRule;>;"
    goto :goto_0

    .line 65
    .restart local p1    # "rule":Lcom/belkin/wemo/rules/data/RMRule;
    :pswitch_3
    new-instance v0, Lcom/belkin/wemo/rules/composer/impl/RMLongPressRuleComposer;

    .end local v0    # "composer":Lcom/belkin/wemo/rules/composer/RMAbstractRuleComposer;, "Lcom/belkin/wemo/rules/composer/RMAbstractRuleComposer<+Lcom/belkin/wemo/rules/data/RMRule;>;"
    check-cast p1, Lcom/belkin/wemo/rules/data/RMLongPressRule;

    .end local p1    # "rule":Lcom/belkin/wemo/rules/data/RMRule;
    invoke-direct {v0, p1}, Lcom/belkin/wemo/rules/composer/impl/RMLongPressRuleComposer;-><init>(Lcom/belkin/wemo/rules/data/RMLongPressRule;)V

    .line 66
    .restart local v0    # "composer":Lcom/belkin/wemo/rules/composer/RMAbstractRuleComposer;, "Lcom/belkin/wemo/rules/composer/RMAbstractRuleComposer<+Lcom/belkin/wemo/rules/data/RMRule;>;"
    goto :goto_0

    .line 36
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_3
        :pswitch_0
    .end packed-switch
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/belkin/wemo/rules/composer/impl/RMRuleComposerFactory;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 10
    const-class v0, Lcom/belkin/wemo/rules/composer/impl/RMRuleComposerFactory;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/rules/composer/impl/RMRuleComposerFactory;

    return-object v0
.end method

.method public static values()[Lcom/belkin/wemo/rules/composer/impl/RMRuleComposerFactory;
    .locals 1

    .prologue
    .line 10
    sget-object v0, Lcom/belkin/wemo/rules/composer/impl/RMRuleComposerFactory;->$VALUES:[Lcom/belkin/wemo/rules/composer/impl/RMRuleComposerFactory;

    invoke-virtual {v0}, [Lcom/belkin/wemo/rules/composer/impl/RMRuleComposerFactory;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/belkin/wemo/rules/composer/impl/RMRuleComposerFactory;

    return-object v0
.end method


# virtual methods
.method public getInstance(Lcom/belkin/wemo/rules/data/RMRule;)Lcom/belkin/wemo/rules/composer/RMAbstractRuleComposer;
    .locals 2
    .param p1, "rule"    # Lcom/belkin/wemo/rules/data/RMRule;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/belkin/wemo/rules/data/RMRule;",
            ")",
            "Lcom/belkin/wemo/rules/composer/RMAbstractRuleComposer",
            "<+",
            "Lcom/belkin/wemo/rules/data/RMRule;",
            ">;"
        }
    .end annotation

    .prologue
    .line 19
    const/4 v0, 0x0

    .line 21
    .local v0, "composer":Lcom/belkin/wemo/rules/composer/RMAbstractRuleComposer;, "Lcom/belkin/wemo/rules/composer/RMAbstractRuleComposer<+Lcom/belkin/wemo/rules/data/RMRule;>;"
    invoke-virtual {p1}, Lcom/belkin/wemo/rules/data/RMRule;->getRulesType()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 30
    :goto_0
    :pswitch_0
    return-object v0

    .line 26
    :pswitch_1
    invoke-direct {p0, p1}, Lcom/belkin/wemo/rules/composer/impl/RMRuleComposerFactory;->getDBRuleComposer(Lcom/belkin/wemo/rules/data/RMRule;)Lcom/belkin/wemo/rules/composer/RMAbstractRuleComposer;

    move-result-object v0

    goto :goto_0

    .line 21
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
