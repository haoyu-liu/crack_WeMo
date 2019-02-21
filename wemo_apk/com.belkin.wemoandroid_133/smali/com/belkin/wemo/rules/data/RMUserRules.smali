.class public final enum Lcom/belkin/wemo/rules/data/RMUserRules;
.super Ljava/lang/Enum;
.source "RMUserRules.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/rules/data/RMUserRules$1;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/belkin/wemo/rules/data/RMUserRules;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/belkin/wemo/rules/data/RMUserRules;

.field public static final enum INSTANCE:Lcom/belkin/wemo/rules/data/RMUserRules;

.field public static final TAG:Ljava/lang/String;


# instance fields
.field private final DEFAULT_START_RULE_ID_NATIVE:I

.field private highestDBRuleId:I

.field private highestTNGRuleId:I

.field private rulesList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/rules/data/RMRule;",
            ">;"
        }
    .end annotation
.end field

.field private tempRuleToDeleteOrEdit:Lcom/belkin/wemo/rules/data/RMRule;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 25
    new-instance v0, Lcom/belkin/wemo/rules/data/RMUserRules;

    const-string v1, "INSTANCE"

    invoke-direct {v0, v1, v2}, Lcom/belkin/wemo/rules/data/RMUserRules;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/belkin/wemo/rules/data/RMUserRules;->INSTANCE:Lcom/belkin/wemo/rules/data/RMUserRules;

    .line 23
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/belkin/wemo/rules/data/RMUserRules;

    sget-object v1, Lcom/belkin/wemo/rules/data/RMUserRules;->INSTANCE:Lcom/belkin/wemo/rules/data/RMUserRules;

    aput-object v1, v0, v2

    sput-object v0, Lcom/belkin/wemo/rules/data/RMUserRules;->$VALUES:[Lcom/belkin/wemo/rules/data/RMUserRules;

    .line 27
    const-class v0, Lcom/belkin/wemo/rules/data/RMUserRules;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/rules/data/RMUserRules;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    const/16 v0, 0x1f4

    .line 44
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 30
    iput v0, p0, Lcom/belkin/wemo/rules/data/RMUserRules;->DEFAULT_START_RULE_ID_NATIVE:I

    .line 32
    iput v0, p0, Lcom/belkin/wemo/rules/data/RMUserRules;->highestDBRuleId:I

    .line 33
    iput v0, p0, Lcom/belkin/wemo/rules/data/RMUserRules;->highestTNGRuleId:I

    .line 45
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/rules/data/RMUserRules;->rulesList:Ljava/util/List;

    .line 46
    return-void
.end method

.method private calculateNextRuleId()V
    .locals 7

    .prologue
    .line 115
    iget-object v4, p0, Lcom/belkin/wemo/rules/data/RMUserRules;->rulesList:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    :pswitch_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/belkin/wemo/rules/data/RMRule;

    .line 116
    .local v1, "rule":Lcom/belkin/wemo/rules/data/RMRule;
    invoke-virtual {v1}, Lcom/belkin/wemo/rules/data/RMRule;->getRulesType()I

    move-result v3

    .line 117
    .local v3, "ruleType":I
    packed-switch v3, :pswitch_data_0

    goto :goto_0

    .line 120
    :pswitch_1
    invoke-virtual {v1}, Lcom/belkin/wemo/rules/data/RMRule;->getRuleId()I

    move-result v2

    .line 121
    .local v2, "ruleId":I
    iget v4, p0, Lcom/belkin/wemo/rules/data/RMUserRules;->highestDBRuleId:I

    if-le v2, v4, :cond_0

    .line 122
    iput v2, p0, Lcom/belkin/wemo/rules/data/RMUserRules;->highestDBRuleId:I

    goto :goto_0

    .line 134
    .end local v1    # "rule":Lcom/belkin/wemo/rules/data/RMRule;
    .end local v2    # "ruleId":I
    .end local v3    # "ruleType":I
    :cond_1
    sget-object v4, Lcom/belkin/wemo/rules/data/RMUserRules;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Highest rule ID: DB RULE = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Lcom/belkin/wemo/rules/data/RMUserRules;->highestDBRuleId:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "; TNG RULE = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Lcom/belkin/wemo/rules/data/RMUserRules;->highestTNGRuleId:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    return-void

    .line 117
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private setNextRuleIdOnRuleDeleted(II)V
    .locals 1
    .param p1, "ruleId"    # I
    .param p2, "rulesType"    # I

    .prologue
    .line 197
    const/4 v0, 0x2

    if-ne p2, v0, :cond_1

    .line 200
    iget v0, p0, Lcom/belkin/wemo/rules/data/RMUserRules;->highestDBRuleId:I

    add-int/lit8 v0, v0, -0x1

    if-ne p1, v0, :cond_0

    .line 201
    iput p1, p0, Lcom/belkin/wemo/rules/data/RMUserRules;->highestDBRuleId:I

    .line 206
    :cond_0
    :goto_0
    return-void

    .line 203
    :cond_1
    const/4 v0, 0x1

    if-ne p2, v0, :cond_0

    goto :goto_0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/belkin/wemo/rules/data/RMUserRules;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 23
    const-class v0, Lcom/belkin/wemo/rules/data/RMUserRules;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/rules/data/RMUserRules;

    return-object v0
.end method

.method public static values()[Lcom/belkin/wemo/rules/data/RMUserRules;
    .locals 1

    .prologue
    .line 23
    sget-object v0, Lcom/belkin/wemo/rules/data/RMUserRules;->$VALUES:[Lcom/belkin/wemo/rules/data/RMUserRules;

    invoke-virtual {v0}, [Lcom/belkin/wemo/rules/data/RMUserRules;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/belkin/wemo/rules/data/RMUserRules;

    return-object v0
.end method


# virtual methods
.method public declared-synchronized addRule(Lcom/belkin/wemo/rules/data/RMRule;)V
    .locals 2
    .param p1, "rule"    # Lcom/belkin/wemo/rules/data/RMRule;

    .prologue
    .line 209
    monitor-enter p0

    if-eqz p1, :cond_0

    .line 210
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/rules/data/RMUserRules;->assignNewRuleId(Lcom/belkin/wemo/rules/data/RMRule;)I

    move-result v1

    invoke-virtual {p1, v1}, Lcom/belkin/wemo/rules/data/RMRule;->setRuleId(I)V

    .line 211
    iget-object v1, p0, Lcom/belkin/wemo/rules/data/RMUserRules;->rulesList:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 212
    invoke-virtual {p1}, Lcom/belkin/wemo/rules/data/RMRule;->getRuleId()I

    move-result v0

    .line 213
    .local v0, "ruleId":I
    iget v1, p0, Lcom/belkin/wemo/rules/data/RMUserRules;->highestDBRuleId:I

    if-ge v1, v0, :cond_0

    .line 214
    iput v0, p0, Lcom/belkin/wemo/rules/data/RMUserRules;->highestDBRuleId:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 217
    .end local v0    # "ruleId":I
    :cond_0
    monitor-exit p0

    return-void

    .line 209
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized addRuleNoRuleIdChange(Lcom/belkin/wemo/rules/data/RMRule;)V
    .locals 1
    .param p1, "rule"    # Lcom/belkin/wemo/rules/data/RMRule;

    .prologue
    .line 220
    monitor-enter p0

    if-eqz p1, :cond_0

    .line 221
    :try_start_0
    iget-object v0, p0, Lcom/belkin/wemo/rules/data/RMUserRules;->rulesList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 223
    :cond_0
    monitor-exit p0

    return-void

    .line 220
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized assignNewRuleId(Lcom/belkin/wemo/rules/data/RMRule;)I
    .locals 6
    .param p1, "rule"    # Lcom/belkin/wemo/rules/data/RMRule;

    .prologue
    .line 266
    monitor-enter p0

    const/4 v0, 0x0

    .line 268
    .local v0, "ruleId":I
    if-eqz p1, :cond_0

    .line 269
    :try_start_0
    invoke-virtual {p1}, Lcom/belkin/wemo/rules/data/RMRule;->getRulesType()I

    move-result v2

    .line 270
    .local v2, "ruleType":I
    packed-switch v2, :pswitch_data_0

    .line 280
    :goto_0
    sget-object v3, Lcom/belkin/wemo/rules/data/RMUserRules;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Save Rule: rule ID assigned to new rule: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "; Rule type: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 281
    invoke-virtual {p1, v0}, Lcom/belkin/wemo/rules/data/RMRule;->setRuleId(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 283
    .end local v2    # "ruleType":I
    :cond_0
    monitor-exit p0

    return v0

    .line 272
    .restart local v2    # "ruleType":I
    :pswitch_0
    :try_start_1
    iget v3, p0, Lcom/belkin/wemo/rules/data/RMUserRules;->highestDBRuleId:I

    add-int/lit8 v1, v3, 0x1

    iput v1, p0, Lcom/belkin/wemo/rules/data/RMUserRules;->highestDBRuleId:I

    .end local v0    # "ruleId":I
    .local v1, "ruleId":I
    move v0, v1

    .line 273
    .end local v1    # "ruleId":I
    .restart local v0    # "ruleId":I
    goto :goto_0

    .line 275
    :pswitch_1
    iget v3, p0, Lcom/belkin/wemo/rules/data/RMUserRules;->highestTNGRuleId:I

    add-int/lit8 v1, v3, 0x1

    iput v1, p0, Lcom/belkin/wemo/rules/data/RMUserRules;->highestTNGRuleId:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .end local v0    # "ruleId":I
    .restart local v1    # "ruleId":I
    move v0, v1

    .line 276
    .end local v1    # "ruleId":I
    .restart local v0    # "ruleId":I
    goto :goto_0

    .line 266
    .end local v2    # "ruleType":I
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3

    .line 270
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public clear()V
    .locals 2

    .prologue
    const/16 v1, 0x1f4

    .line 53
    iget-object v0, p0, Lcom/belkin/wemo/rules/data/RMUserRules;->rulesList:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 54
    iget-object v0, p0, Lcom/belkin/wemo/rules/data/RMUserRules;->rulesList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 56
    :cond_0
    iput v1, p0, Lcom/belkin/wemo/rules/data/RMUserRules;->highestDBRuleId:I

    .line 57
    iput v1, p0, Lcom/belkin/wemo/rules/data/RMUserRules;->highestTNGRuleId:I

    .line 58
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/belkin/wemo/rules/data/RMUserRules;->tempRuleToDeleteOrEdit:Lcom/belkin/wemo/rules/data/RMRule;

    .line 59
    return-void
.end method

.method public declared-synchronized deleteRule(I)Lcom/belkin/wemo/rules/data/RMRule;
    .locals 4
    .param p1, "ruleId"    # I

    .prologue
    .line 226
    monitor-enter p0

    const/4 v1, 0x0

    .line 227
    .local v1, "entry":Lcom/belkin/wemo/rules/data/RMRule;
    :try_start_0
    iget-object v3, p0, Lcom/belkin/wemo/rules/data/RMUserRules;->rulesList:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 228
    .local v2, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/belkin/wemo/rules/data/RMRule;>;"
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 229
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/belkin/wemo/rules/data/RMRule;

    move-object v1, v0

    .line 230
    invoke-virtual {v1}, Lcom/belkin/wemo/rules/data/RMRule;->getRuleId()I

    move-result v3

    if-ne v3, p1, :cond_1

    .line 231
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    .line 233
    invoke-virtual {v1}, Lcom/belkin/wemo/rules/data/RMRule;->getRulesType()I

    move-result v3

    invoke-direct {p0, p1, v3}, Lcom/belkin/wemo/rules/data/RMUserRules;->setNextRuleIdOnRuleDeleted(II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 240
    :cond_0
    monitor-exit p0

    return-object v1

    .line 236
    :cond_1
    const/4 v1, 0x0

    goto :goto_0

    .line 226
    .end local v2    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/belkin/wemo/rules/data/RMRule;>;"
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public declared-synchronized deleteRule(Lcom/belkin/wemo/rules/data/RMRule;)Lcom/belkin/wemo/rules/data/RMRule;
    .locals 5
    .param p1, "rule"    # Lcom/belkin/wemo/rules/data/RMRule;

    .prologue
    .line 158
    monitor-enter p0

    const/4 v1, 0x0

    .line 159
    .local v1, "entry":Lcom/belkin/wemo/rules/data/RMRule;
    :try_start_0
    iget-object v3, p0, Lcom/belkin/wemo/rules/data/RMUserRules;->rulesList:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 160
    .local v2, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/belkin/wemo/rules/data/RMRule;>;"
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 161
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/belkin/wemo/rules/data/RMRule;

    move-object v1, v0

    .line 163
    invoke-virtual {v1}, Lcom/belkin/wemo/rules/data/RMRule;->getRuleId()I

    move-result v3

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/data/RMRule;->getRuleId()I

    move-result v4

    if-ne v3, v4, :cond_1

    .line 165
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    .line 168
    invoke-virtual {v1}, Lcom/belkin/wemo/rules/data/RMRule;->getRuleId()I

    move-result v3

    invoke-virtual {v1}, Lcom/belkin/wemo/rules/data/RMRule;->getRulesType()I

    move-result v4

    invoke-direct {p0, v3, v4}, Lcom/belkin/wemo/rules/data/RMUserRules;->setNextRuleIdOnRuleDeleted(II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 174
    :cond_0
    monitor-exit p0

    return-object v1

    .line 171
    :cond_1
    const/4 v1, 0x0

    goto :goto_0

    .line 158
    .end local v2    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/belkin/wemo/rules/data/RMRule;>;"
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public declared-synchronized deleteRuleNoRuleIdChange(I)Lcom/belkin/wemo/rules/data/RMRule;
    .locals 4
    .param p1, "ruleId"    # I

    .prologue
    .line 179
    monitor-enter p0

    const/4 v1, 0x0

    .line 180
    .local v1, "entry":Lcom/belkin/wemo/rules/data/RMRule;
    :try_start_0
    iget-object v3, p0, Lcom/belkin/wemo/rules/data/RMUserRules;->rulesList:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 181
    .local v2, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/belkin/wemo/rules/data/RMRule;>;"
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 182
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/belkin/wemo/rules/data/RMRule;

    move-object v1, v0

    .line 184
    invoke-virtual {v1}, Lcom/belkin/wemo/rules/data/RMRule;->getRuleId()I

    move-result v3

    if-ne v3, p1, :cond_1

    .line 186
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 192
    :cond_0
    monitor-exit p0

    return-object v1

    .line 189
    :cond_1
    const/4 v1, 0x0

    goto :goto_0

    .line 179
    .end local v2    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/belkin/wemo/rules/data/RMRule;>;"
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public getDBRuleDeviceDayToRulesMap(Ljava/lang/String;)Ljava/util/HashMap;
    .locals 11
    .param p1, "udn"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/rules/data/RMDBRule;",
            ">;>;"
        }
    .end annotation

    .prologue
    const/4 v10, 0x2

    .line 73
    new-instance v3, Ljava/util/LinkedHashMap;

    invoke-direct {v3}, Ljava/util/LinkedHashMap;-><init>()V

    .line 75
    .local v3, "deviceDayToRulesMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/Integer;Ljava/util/List<Lcom/belkin/wemo/rules/data/RMDBRule;>;>;"
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v3, v8, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    const/4 v8, 0x3

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v3, v8, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    const/4 v8, 0x4

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v3, v8, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    const/4 v8, 0x5

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v3, v8, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    const/4 v8, 0x6

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v3, v8, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    const/4 v8, 0x7

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v3, v8, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    const/4 v8, 0x1

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v3, v8, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    iget-object v8, p0, Lcom/belkin/wemo/rules/data/RMUserRules;->rulesList:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/belkin/wemo/rules/data/RMRule;

    .line 84
    .local v7, "rule":Lcom/belkin/wemo/rules/data/RMRule;
    invoke-virtual {v7}, Lcom/belkin/wemo/rules/data/RMRule;->getRulesType()I

    move-result v8

    if-ne v8, v10, :cond_0

    move-object v1, v7

    .line 85
    check-cast v1, Lcom/belkin/wemo/rules/data/RMDBRule;

    .line 86
    .local v1, "dbRule":Lcom/belkin/wemo/rules/data/RMDBRule;
    invoke-virtual {v1}, Lcom/belkin/wemo/rules/data/RMDBRule;->getRuleDeviceSet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i$":Ljava/util/Iterator;
    :cond_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;

    .line 87
    .local v2, "device":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    invoke-virtual {v2}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->getUiUdn()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 88
    invoke-virtual {v1}, Lcom/belkin/wemo/rules/data/RMDBRule;->getDaySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_2
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 89
    .local v0, "day":I
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 90
    .local v6, "list":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/rules/data/RMDBRule;>;"
    if-eqz v6, :cond_2

    .line 91
    invoke-interface {v6, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 99
    .end local v0    # "day":I
    .end local v1    # "dbRule":Lcom/belkin/wemo/rules/data/RMDBRule;
    .end local v2    # "device":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    .end local v5    # "i$":Ljava/util/Iterator;
    .end local v6    # "list":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/rules/data/RMDBRule;>;"
    .end local v7    # "rule":Lcom/belkin/wemo/rules/data/RMRule;
    :cond_3
    return-object v3
.end method

.method public getDBRulesList()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/rules/data/RMDBRule;",
            ">;"
        }
    .end annotation

    .prologue
    .line 62
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 63
    .local v0, "dbRulesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/rules/data/RMDBRule;>;"
    iget-object v3, p0, Lcom/belkin/wemo/rules/data/RMUserRules;->rulesList:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/belkin/wemo/rules/data/RMRule;

    .line 64
    .local v2, "rule":Lcom/belkin/wemo/rules/data/RMRule;
    invoke-virtual {v2}, Lcom/belkin/wemo/rules/data/RMRule;->getRulesType()I

    move-result v3

    const/4 v4, 0x2

    if-ne v3, v4, :cond_0

    .line 65
    check-cast v2, Lcom/belkin/wemo/rules/data/RMDBRule;

    .end local v2    # "rule":Lcom/belkin/wemo/rules/data/RMRule;
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 68
    :cond_1
    return-object v0
.end method

.method public getDeviceRules(Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .param p1, "udn"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/rules/data/RMRule;",
            ">;"
        }
    .end annotation

    .prologue
    .line 524
    const/4 v0, 0x0

    return-object v0
.end method

.method public getLEDRules(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .param p1, "bridgeUdn"    # Ljava/lang/String;
    .param p2, "deviceId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/rules/data/RMRule;",
            ">;"
        }
    .end annotation

    .prologue
    .line 528
    const/4 v0, 0x0

    return-object v0
.end method

.method public getRule(I)Lcom/belkin/wemo/rules/data/RMRule;
    .locals 5
    .param p1, "ruleId"    # I

    .prologue
    .line 138
    const/4 v0, 0x0

    .line 139
    .local v0, "entry":Lcom/belkin/wemo/rules/data/RMRule;
    iget-object v4, p0, Lcom/belkin/wemo/rules/data/RMUserRules;->rulesList:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    :pswitch_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/belkin/wemo/rules/data/RMRule;

    .line 140
    .local v2, "rule":Lcom/belkin/wemo/rules/data/RMRule;
    invoke-virtual {v2}, Lcom/belkin/wemo/rules/data/RMRule;->getRulesType()I

    move-result v3

    .line 141
    .local v3, "ruleType":I
    packed-switch v3, :pswitch_data_0

    goto :goto_0

    .line 143
    :pswitch_1
    invoke-virtual {v2}, Lcom/belkin/wemo/rules/data/RMRule;->getRuleId()I

    move-result v4

    if-ne v4, p1, :cond_0

    .line 144
    move-object v0, v2

    goto :goto_0

    .line 154
    .end local v2    # "rule":Lcom/belkin/wemo/rules/data/RMRule;
    .end local v3    # "ruleType":I
    :cond_1
    return-object v0

    .line 141
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public getRulesForSpecificType(Ljava/lang/Class;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 513
    .local p1, "ruleTypeClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 514
    .local v2, "specificRuleTypeList":Ljava/util/List;, "Ljava/util/List<TT;>;"
    iget-object v3, p0, Lcom/belkin/wemo/rules/data/RMUserRules;->rulesList:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/belkin/wemo/rules/data/RMRule;

    .line 515
    .local v1, "rule":Lcom/belkin/wemo/rules/data/RMRule;
    invoke-virtual {p1, v1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 516
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 520
    .end local v1    # "rule":Lcom/belkin/wemo/rules/data/RMRule;
    :cond_1
    return-object v2
.end method

.method public getRulesList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/rules/data/RMRule;",
            ">;"
        }
    .end annotation

    .prologue
    .line 49
    iget-object v0, p0, Lcom/belkin/wemo/rules/data/RMUserRules;->rulesList:Ljava/util/List;

    return-object v0
.end method

.method public getRulesType(I)I
    .locals 4
    .param p1, "ruleId"    # I

    .prologue
    .line 288
    const/4 v2, -0x1

    .line 290
    .local v2, "rulesType":I
    iget-object v3, p0, Lcom/belkin/wemo/rules/data/RMUserRules;->rulesList:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/belkin/wemo/rules/data/RMRule;

    .line 291
    .local v1, "rule":Lcom/belkin/wemo/rules/data/RMRule;
    invoke-virtual {v1}, Lcom/belkin/wemo/rules/data/RMRule;->getRuleId()I

    move-result v3

    if-ne v3, p1, :cond_0

    .line 292
    invoke-virtual {v1}, Lcom/belkin/wemo/rules/data/RMRule;->getRulesType()I

    move-result v2

    goto :goto_0

    .line 295
    .end local v1    # "rule":Lcom/belkin/wemo/rules/data/RMRule;
    :cond_1
    return v2
.end method

.method public getTempDBRuleToEditOrDelete()Lcom/belkin/wemo/rules/data/RMRule;
    .locals 1

    .prologue
    .line 476
    iget-object v0, p0, Lcom/belkin/wemo/rules/data/RMUserRules;->tempRuleToDeleteOrEdit:Lcom/belkin/wemo/rules/data/RMRule;

    return-object v0
.end method

.method public isProcessDBRequired(Lcom/belkin/wemo/rules/data/RMDBRule;Ljava/lang/String;)Z
    .locals 7
    .param p1, "rule"    # Lcom/belkin/wemo/rules/data/RMDBRule;
    .param p2, "deviceUdn"    # Ljava/lang/String;

    .prologue
    .line 480
    const/4 v2, 0x0

    .line 481
    .local v2, "isRequired":Z
    new-instance v3, Ljava/util/HashSet;

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/data/RMDBRule;->getRuleDeviceSet()Ljava/util/Set;

    move-result-object v5

    invoke-direct {v3, v5}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 482
    .local v3, "oldAndNewDeviceSet":Ljava/util/Set;, "Ljava/util/Set<Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;>;"
    iget-object v5, p0, Lcom/belkin/wemo/rules/data/RMUserRules;->tempRuleToDeleteOrEdit:Lcom/belkin/wemo/rules/data/RMRule;

    if-eqz v5, :cond_0

    iget-object v5, p0, Lcom/belkin/wemo/rules/data/RMUserRules;->tempRuleToDeleteOrEdit:Lcom/belkin/wemo/rules/data/RMRule;

    invoke-virtual {v5}, Lcom/belkin/wemo/rules/data/RMRule;->getRulesType()I

    move-result v5

    const/4 v6, 0x2

    if-ne v5, v6, :cond_0

    .line 483
    iget-object v5, p0, Lcom/belkin/wemo/rules/data/RMUserRules;->tempRuleToDeleteOrEdit:Lcom/belkin/wemo/rules/data/RMRule;

    check-cast v5, Lcom/belkin/wemo/rules/data/RMDBRule;

    invoke-virtual {v5}, Lcom/belkin/wemo/rules/data/RMDBRule;->getRuleDeviceSet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v3, v5}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 487
    :cond_0
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;

    .line 488
    .local v0, "dev":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    invoke-virtual {v0}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->getUiUdn()Ljava/lang/String;

    move-result-object v4

    .line 490
    .local v4, "udn":Ljava/lang/String;
    const-string v5, "Bridge"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_2

    invoke-virtual {v4, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 491
    :cond_2
    const/4 v2, 0x1

    .line 508
    .end local v0    # "dev":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    .end local v4    # "udn":Ljava/lang/String;
    :cond_3
    return v2
.end method

.method public isRuleDuplicate(Lcom/belkin/wemo/rules/data/RMRule;)Z
    .locals 5
    .param p1, "otherRule"    # Lcom/belkin/wemo/rules/data/RMRule;

    .prologue
    .line 299
    const/4 v1, 0x0

    .line 300
    .local v1, "isDuplicate":Z
    iget-object v3, p0, Lcom/belkin/wemo/rules/data/RMUserRules;->rulesList:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/belkin/wemo/rules/data/RMRule;

    .line 302
    .local v2, "thisRule":Lcom/belkin/wemo/rules/data/RMRule;
    invoke-virtual {v2}, Lcom/belkin/wemo/rules/data/RMRule;->getRuleId()I

    move-result v3

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/data/RMRule;->getRuleId()I

    move-result v4

    if-eq v3, v4, :cond_0

    .line 303
    invoke-virtual {v2, p1}, Lcom/belkin/wemo/rules/data/RMRule;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 304
    const/4 v1, 0x1

    .line 309
    .end local v2    # "thisRule":Lcom/belkin/wemo/rules/data/RMRule;
    :cond_1
    return v1
.end method

.method public declared-synchronized replaceRule(Lcom/belkin/wemo/rules/data/RMRule;)Lcom/belkin/wemo/rules/data/RMRule;
    .locals 5
    .param p1, "rule"    # Lcom/belkin/wemo/rules/data/RMRule;

    .prologue
    .line 244
    monitor-enter p0

    const/4 v1, 0x0

    .line 247
    .local v1, "entry":Lcom/belkin/wemo/rules/data/RMRule;
    :try_start_0
    iget-object v3, p0, Lcom/belkin/wemo/rules/data/RMUserRules;->rulesList:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 248
    .local v2, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/belkin/wemo/rules/data/RMRule;>;"
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 249
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/belkin/wemo/rules/data/RMRule;

    move-object v1, v0

    .line 250
    invoke-virtual {v1}, Lcom/belkin/wemo/rules/data/RMRule;->getRuleId()I

    move-result v3

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/data/RMRule;->getRuleId()I

    move-result v4

    if-ne v3, v4, :cond_1

    .line 252
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    .line 260
    :cond_0
    iget-object v3, p0, Lcom/belkin/wemo/rules/data/RMUserRules;->rulesList:Ljava/util/List;

    invoke-interface {v3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 262
    monitor-exit p0

    return-object v1

    .line 255
    :cond_1
    const/4 v1, 0x0

    goto :goto_0

    .line 244
    .end local v2    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/belkin/wemo/rules/data/RMRule;>;"
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public declared-synchronized setRulesList(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/rules/data/RMRule;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 103
    .local p1, "newRulesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/rules/data/RMRule;>;"
    monitor-enter p0

    if-nez p1, :cond_0

    .line 104
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/rules/data/RMUserRules;->rulesList:Ljava/util/List;

    .line 105
    const/16 v0, 0x1f4

    iput v0, p0, Lcom/belkin/wemo/rules/data/RMUserRules;->highestDBRuleId:I

    .line 106
    const/16 v0, 0x1f4

    iput v0, p0, Lcom/belkin/wemo/rules/data/RMUserRules;->highestTNGRuleId:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 111
    :goto_0
    monitor-exit p0

    return-void

    .line 108
    :cond_0
    :try_start_1
    iput-object p1, p0, Lcom/belkin/wemo/rules/data/RMUserRules;->rulesList:Ljava/util/List;

    .line 109
    invoke-direct {p0}, Lcom/belkin/wemo/rules/data/RMUserRules;->calculateNextRuleId()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 103
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setTempDBRuleToEditOrDelete(Lcom/belkin/wemo/rules/data/RMRule;)V
    .locals 0
    .param p1, "tempRuleToDeleteOrEdit"    # Lcom/belkin/wemo/rules/data/RMRule;

    .prologue
    .line 472
    iput-object p1, p0, Lcom/belkin/wemo/rules/data/RMUserRules;->tempRuleToDeleteOrEdit:Lcom/belkin/wemo/rules/data/RMRule;

    .line 473
    return-void
.end method

.method public verifyRuleConflicts(Lcom/belkin/wemo/rules/data/RMRule;Lcom/belkin/wemo/rules/data/callback/RMRuleConflictSuccessCallback;Lcom/belkin/wemo/rules/data/callback/RMRuleConflictErrorCallback;)V
    .locals 28
    .param p1, "otherRule"    # Lcom/belkin/wemo/rules/data/RMRule;
    .param p2, "successCallback"    # Lcom/belkin/wemo/rules/data/callback/RMRuleConflictSuccessCallback;
    .param p3, "errorCallback"    # Lcom/belkin/wemo/rules/data/callback/RMRuleConflictErrorCallback;

    .prologue
    .line 314
    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/rules/data/RMRule;->getRuleId()I

    move-result v14

    .line 315
    .local v14, "otherRuleId":I
    sget-object v25, Lcom/belkin/wemo/rules/data/RMUserRules;->TAG:Ljava/lang/String;

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string v27, "Rule Conflict Checks: Other/New Rule ID: "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-static/range {v25 .. v26}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 318
    invoke-virtual/range {p0 .. p1}, Lcom/belkin/wemo/rules/data/RMUserRules;->isRuleDuplicate(Lcom/belkin/wemo/rules/data/RMRule;)Z

    move-result v25

    if-eqz v25, :cond_1

    .line 319
    if-eqz p3, :cond_0

    .line 320
    new-instance v25, Lcom/belkin/wemo/rules/data/error/RMRuleConflictError;

    const/16 v26, 0x1f9

    const-string v27, "Rule is duplicate of an existing rule."

    invoke-direct/range {v25 .. v27}, Lcom/belkin/wemo/rules/data/error/RMRuleConflictError;-><init>(ILjava/lang/String;)V

    move-object/from16 v0, p3

    move-object/from16 v1, v25

    invoke-interface {v0, v1}, Lcom/belkin/wemo/rules/data/callback/RMRuleConflictErrorCallback;->onConflictFound(Lcom/belkin/wemo/rules/data/error/RMRuleConflictError;)V

    .line 469
    :cond_0
    :goto_0
    return-void

    .line 324
    :cond_1
    const/4 v9, 0x0

    .line 325
    .local v9, "isConflicting":Z
    const/4 v4, 0x0

    .line 326
    .local v4, "errorCode":I
    const-string v5, ""

    .line 328
    .local v5, "errorMsg":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/rules/data/RMRule;->getRulesType()I

    move-result v16

    .line 329
    .local v16, "otherRulesType":I
    sget-object v25, Lcom/belkin/wemo/rules/data/RMUserRules;->TAG:Ljava/lang/String;

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string v27, "Rule Conflict Check: Other/New rules type (DB/TNG): "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-static/range {v25 .. v26}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 330
    const/16 v25, 0x2

    move/from16 v0, v16

    move/from16 v1, v25

    if-ne v0, v1, :cond_2

    move-object/from16 v11, p1

    .line 331
    check-cast v11, Lcom/belkin/wemo/rules/data/RMDBRule;

    .line 333
    .local v11, "otherDBRule":Lcom/belkin/wemo/rules/data/RMDBRule;
    invoke-virtual {v11}, Lcom/belkin/wemo/rules/data/RMDBRule;->getRuleType()Lcom/belkin/wemo/rules/data/RMDBRuleType;

    move-result-object v15

    .line 334
    .local v15, "otherRuleType":Lcom/belkin/wemo/rules/data/RMDBRuleType;
    sget-object v25, Lcom/belkin/wemo/rules/data/RMUserRules;->TAG:Ljava/lang/String;

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string v27, "Rule Conflict Check: Other/New rule type: "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-static/range {v25 .. v26}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 336
    sget-object v25, Lcom/belkin/wemo/rules/data/RMUserRules$1;->$SwitchMap$com$belkin$wemo$rules$data$RMDBRuleType:[I

    invoke-virtual {v15}, Lcom/belkin/wemo/rules/data/RMDBRuleType;->ordinal()I

    move-result v26

    aget v25, v25, v26

    packed-switch v25, :pswitch_data_0

    .line 459
    .end local v11    # "otherDBRule":Lcom/belkin/wemo/rules/data/RMDBRule;
    .end local v15    # "otherRuleType":Lcom/belkin/wemo/rules/data/RMDBRuleType;
    :cond_2
    :goto_1
    if-eqz v9, :cond_a

    .line 460
    if-eqz p3, :cond_0

    .line 461
    new-instance v25, Lcom/belkin/wemo/rules/data/error/RMRuleConflictError;

    move-object/from16 v0, v25

    invoke-direct {v0, v4, v5}, Lcom/belkin/wemo/rules/data/error/RMRuleConflictError;-><init>(ILjava/lang/String;)V

    move-object/from16 v0, p3

    move-object/from16 v1, v25

    invoke-interface {v0, v1}, Lcom/belkin/wemo/rules/data/callback/RMRuleConflictErrorCallback;->onConflictFound(Lcom/belkin/wemo/rules/data/error/RMRuleConflictError;)V

    goto :goto_0

    .restart local v11    # "otherDBRule":Lcom/belkin/wemo/rules/data/RMDBRule;
    .restart local v15    # "otherRuleType":Lcom/belkin/wemo/rules/data/RMDBRuleType;
    :pswitch_0
    move-object v13, v11

    .line 338
    check-cast v13, Lcom/belkin/wemo/rules/data/RMLongPressRule;

    .line 343
    .local v13, "otherLongPressRule":Lcom/belkin/wemo/rules/data/RMLongPressRule;
    invoke-virtual {v13}, Lcom/belkin/wemo/rules/data/RMLongPressRule;->getRuleDeviceSet()Ljava/util/Set;

    move-result-object v25

    invoke-interface/range {v25 .. v25}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_3
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v25

    if-eqz v25, :cond_5

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;

    .line 344
    .local v2, "device":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    invoke-virtual {v2}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->getStartAction()I

    move-result v21

    .line 345
    .local v21, "startAction":I
    const/16 v25, 0x3

    move/from16 v0, v25

    move/from16 v1, v21

    if-ne v0, v1, :cond_3

    .line 347
    invoke-virtual {v13}, Lcom/belkin/wemo/rules/data/RMLongPressRule;->getTargetDeviceSet()Ljava/util/Set;

    move-result-object v25

    invoke-interface/range {v25 .. v25}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, "i$":Ljava/util/Iterator;
    :cond_4
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v25

    if-eqz v25, :cond_3

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Lcom/belkin/wemo/rules/data/RMTargetDevice;

    .line 348
    .local v22, "targetDevice":Lcom/belkin/wemo/rules/data/RMTargetDevice;
    invoke-virtual/range {v22 .. v22}, Lcom/belkin/wemo/rules/data/RMTargetDevice;->getDeviceId()Ljava/lang/String;

    move-result-object v23

    .line 349
    .local v23, "targetDeviceUdn":Ljava/lang/String;
    sget-object v25, Lcom/belkin/wemo/WeMo;->INSTANCE:Lcom/belkin/wemo/WeMo;

    invoke-virtual/range {v25 .. v25}, Lcom/belkin/wemo/WeMo;->getContext()Landroid/content/Context;

    move-result-object v25

    invoke-static/range {v25 .. v25}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDevice(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v3

    .line 350
    .local v3, "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v3, :cond_4

    .line 351
    invoke-static {}, Lcom/belkin/wemo/rules/RMRulesSDK;->instance()Lcom/belkin/wemo/rules/RMRulesSDK;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Lcom/belkin/wemo/rules/RMRulesSDK;->getDependencyProvider()Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;

    move-result-object v25

    invoke-interface/range {v25 .. v25}, Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;->provideIRulesUtils()Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    move-result-object v25

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFirmwareVersion()Ljava/lang/String;

    move-result-object v26

    invoke-interface/range {v25 .. v26}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->getFirmwareVersionRevisionNumber(Ljava/lang/String;)I

    move-result v18

    .line 352
    .local v18, "revisionNumber":I
    const/16 v25, 0x2968

    move/from16 v0, v18

    move/from16 v1, v25

    if-ge v0, v1, :cond_4

    .line 353
    const/4 v9, 0x1

    .line 354
    const/16 v4, 0x385

    .line 355
    const-string v5, "Long Press Away Mode rule cannot created on target devices with old FWs!"

    .line 357
    sget-object v25, Lcom/belkin/wemo/rules/data/RMUserRules;->TAG:Ljava/lang/String;

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string v27, "LONG PRESS AWAY MODE RULE Creation Error due to old FW. Target DeviceUDN: "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v27, "; FW Revision No:"

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-static/range {v25 .. v26}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 365
    .end local v2    # "device":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    .end local v3    # "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v7    # "i$":Ljava/util/Iterator;
    .end local v18    # "revisionNumber":I
    .end local v21    # "startAction":I
    .end local v22    # "targetDevice":Lcom/belkin/wemo/rules/data/RMTargetDevice;
    .end local v23    # "targetDeviceUdn":Ljava/lang/String;
    :cond_5
    invoke-virtual/range {p0 .. p0}, Lcom/belkin/wemo/rules/data/RMUserRules;->getRulesList()Ljava/util/List;

    move-result-object v25

    invoke-interface/range {v25 .. v25}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_6
    :goto_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v25

    if-eqz v25, :cond_2

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lcom/belkin/wemo/rules/data/RMRule;

    .line 366
    .local v19, "rule":Lcom/belkin/wemo/rules/data/RMRule;
    invoke-virtual/range {v19 .. v19}, Lcom/belkin/wemo/rules/data/RMRule;->getRuleId()I

    move-result v20

    .line 368
    .local v20, "ruleId":I
    invoke-virtual/range {v19 .. v19}, Lcom/belkin/wemo/rules/data/RMRule;->getRulesType()I

    move-result v25

    const/16 v26, 0x2

    move/from16 v0, v25

    move/from16 v1, v26

    if-ne v0, v1, :cond_6

    move-object/from16 v25, v19

    check-cast v25, Lcom/belkin/wemo/rules/data/RMDBRule;

    invoke-virtual/range {v25 .. v25}, Lcom/belkin/wemo/rules/data/RMDBRule;->getRuleType()Lcom/belkin/wemo/rules/data/RMDBRuleType;

    move-result-object v25

    sget-object v26, Lcom/belkin/wemo/rules/data/RMDBRuleType;->LONG_PRESS:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    if-ne v0, v1, :cond_6

    move-object/from16 v10, v19

    .line 369
    check-cast v10, Lcom/belkin/wemo/rules/data/RMLongPressRule;

    .line 371
    .local v10, "longPressRule":Lcom/belkin/wemo/rules/data/RMLongPressRule;
    move/from16 v0, v20

    if-ne v0, v14, :cond_7

    .line 375
    sget-object v25, Lcom/belkin/wemo/rules/data/RMUserRules;->TAG:Ljava/lang/String;

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string v27, "Rule Conflict Checks: LONG PRESS IS BEING EDITED. PLEASE CONTINUE - Rule ID: "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v27, "; Other Rule ID: "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-static/range {v25 .. v26}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 380
    :cond_7
    invoke-virtual {v10}, Lcom/belkin/wemo/rules/data/RMLongPressRule;->getRuleDeviceSet()Ljava/util/Set;

    move-result-object v25

    invoke-interface/range {v25 .. v25}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_8
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v25

    if-eqz v25, :cond_6

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;

    .line 381
    .restart local v2    # "device":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    invoke-virtual {v2}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->getUiUdn()Ljava/lang/String;

    move-result-object v24

    .line 382
    .local v24, "udn":Ljava/lang/String;
    invoke-virtual {v13}, Lcom/belkin/wemo/rules/data/RMLongPressRule;->getRuleDeviceSet()Ljava/util/Set;

    move-result-object v25

    invoke-interface/range {v25 .. v25}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, "i$":Ljava/util/Iterator;
    :cond_9
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v25

    if-eqz v25, :cond_8

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;

    .line 383
    .local v12, "otherDevice":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    invoke-virtual {v12}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->getUiUdn()Ljava/lang/String;

    move-result-object v17

    .line 384
    .local v17, "otherUdn":Ljava/lang/String;
    sget-object v25, Lcom/belkin/wemo/rules/data/RMUserRules;->TAG:Ljava/lang/String;

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string v27, "Rule Conflict Check: LONG PRESS - UDN: "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v27, "; Other UDN: "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-static/range {v25 .. v26}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 385
    move-object/from16 v0, v17

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v25

    if-eqz v25, :cond_9

    .line 386
    const/4 v9, 0x1

    .line 387
    const/16 v4, 0x384

    .line 388
    const-string v5, "Duplicate Rule: A Long Press rule already exists on the device!"

    .line 389
    goto/16 :goto_1

    .line 464
    .end local v2    # "device":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    .end local v8    # "i$":Ljava/util/Iterator;
    .end local v10    # "longPressRule":Lcom/belkin/wemo/rules/data/RMLongPressRule;
    .end local v11    # "otherDBRule":Lcom/belkin/wemo/rules/data/RMDBRule;
    .end local v12    # "otherDevice":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    .end local v13    # "otherLongPressRule":Lcom/belkin/wemo/rules/data/RMLongPressRule;
    .end local v15    # "otherRuleType":Lcom/belkin/wemo/rules/data/RMDBRuleType;
    .end local v17    # "otherUdn":Ljava/lang/String;
    .end local v19    # "rule":Lcom/belkin/wemo/rules/data/RMRule;
    .end local v20    # "ruleId":I
    .end local v24    # "udn":Ljava/lang/String;
    :cond_a
    if-eqz p2, :cond_0

    .line 465
    invoke-interface/range {p2 .. p2}, Lcom/belkin/wemo/rules/data/callback/RMRuleConflictSuccessCallback;->onNoConflictFound()V

    goto/16 :goto_0

    .line 336
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
