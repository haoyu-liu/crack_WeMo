.class public abstract Lcom/belkin/wemo/rules/data/RMRule;
.super Ljava/lang/Object;
.source "RMRule.java"


# static fields
.field public static final DB_RULE_TYPE:Ljava/lang/String; = "DB_RULE_TYPE"

.field public static final DISPLAY_NAME:Ljava/lang/String; = "DISPLAY_NAME"

.field public static final RULES_TYPE_COUNT:I = 0x2

.field public static final RULES_TYPE_DB:I = 0x2

.field public static final RULES_TYPE_TNG:I = 0x1

.field public static final RULE_DISABLED:I = 0x0

.field public static final RULE_ENABLED:I = 0x1

.field public static final RULE_ID:Ljava/lang/String; = "RULE_ID"

.field public static final RULE_TYPE:Ljava/lang/String; = "RULE_TYPE"

.field public static final START_RULE_CODE:Ljava/lang/String; = "START_RULE_CODE"

.field public static final STATE:Ljava/lang/String; = "STATE"


# instance fields
.field private displayName:Ljava/lang/String;

.field public isDelete:Z

.field private ruleId:I

.field private rulesType:I

.field private state:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    const/4 v0, -0x1

    iput v0, p0, Lcom/belkin/wemo/rules/data/RMRule;->ruleId:I

    .line 28
    const/4 v0, 0x2

    iput v0, p0, Lcom/belkin/wemo/rules/data/RMRule;->rulesType:I

    .line 31
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/belkin/wemo/rules/data/RMRule;->isDelete:Z

    .line 41
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/rules/data/RMRule;->displayName:Ljava/lang/String;

    .line 42
    invoke-virtual {p0}, Lcom/belkin/wemo/rules/data/RMRule;->assignRuleType()I

    move-result v0

    iput v0, p0, Lcom/belkin/wemo/rules/data/RMRule;->rulesType:I

    .line 43
    return-void
.end method

.method public constructor <init>(IILjava/lang/String;I)V
    .locals 1
    .param p1, "ruleId"    # I
    .param p2, "rulesType"    # I
    .param p3, "displayName"    # Ljava/lang/String;
    .param p4, "state"    # I

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    const/4 v0, -0x1

    iput v0, p0, Lcom/belkin/wemo/rules/data/RMRule;->ruleId:I

    .line 28
    const/4 v0, 0x2

    iput v0, p0, Lcom/belkin/wemo/rules/data/RMRule;->rulesType:I

    .line 31
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/belkin/wemo/rules/data/RMRule;->isDelete:Z

    .line 34
    iput p1, p0, Lcom/belkin/wemo/rules/data/RMRule;->ruleId:I

    .line 35
    iput p2, p0, Lcom/belkin/wemo/rules/data/RMRule;->rulesType:I

    .line 36
    iput-object p3, p0, Lcom/belkin/wemo/rules/data/RMRule;->displayName:Ljava/lang/String;

    .line 37
    iput p4, p0, Lcom/belkin/wemo/rules/data/RMRule;->state:I

    .line 38
    return-void
.end method

.method public static getRulesTypeDb()I
    .locals 1

    .prologue
    .line 95
    const/4 v0, 0x2

    return v0
.end method

.method public static getRulesTypeTng()I
    .locals 1

    .prologue
    .line 89
    const/4 v0, 0x1

    return v0
.end method


# virtual methods
.method protected abstract assignRuleType()I
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 115
    if-ne p0, p1, :cond_1

    .line 133
    :cond_0
    :goto_0
    return v1

    .line 118
    :cond_1
    if-nez p1, :cond_2

    move v1, v2

    .line 119
    goto :goto_0

    .line 121
    :cond_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    move v1, v2

    .line 122
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 124
    check-cast v0, Lcom/belkin/wemo/rules/data/RMRule;

    .line 127
    .local v0, "other":Lcom/belkin/wemo/rules/data/RMRule;
    iget v3, v0, Lcom/belkin/wemo/rules/data/RMRule;->state:I

    if-nez v3, :cond_4

    move v1, v2

    .line 128
    goto :goto_0

    .line 130
    :cond_4
    iget v3, p0, Lcom/belkin/wemo/rules/data/RMRule;->rulesType:I

    iget v4, v0, Lcom/belkin/wemo/rules/data/RMRule;->rulesType:I

    if-eq v3, v4, :cond_0

    move v1, v2

    .line 131
    goto :goto_0
.end method

.method public getDisplayName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 73
    iget-object v0, p0, Lcom/belkin/wemo/rules/data/RMRule;->displayName:Ljava/lang/String;

    return-object v0
.end method

.method public getRuleId()I
    .locals 1

    .prologue
    .line 49
    iget v0, p0, Lcom/belkin/wemo/rules/data/RMRule;->ruleId:I

    return v0
.end method

.method public getRulesType()I
    .locals 1

    .prologue
    .line 61
    iget v0, p0, Lcom/belkin/wemo/rules/data/RMRule;->rulesType:I

    return v0
.end method

.method public getState()I
    .locals 1

    .prologue
    .line 142
    iget v0, p0, Lcom/belkin/wemo/rules/data/RMRule;->state:I

    return v0
.end method

.method public hashCode()I
    .locals 4

    .prologue
    .line 103
    const/16 v0, 0x1f

    .line 104
    .local v0, "prime":I
    const/4 v1, 0x1

    .line 105
    .local v1, "result":I
    iget v2, p0, Lcom/belkin/wemo/rules/data/RMRule;->ruleId:I

    add-int/lit8 v1, v2, 0x1f

    .line 106
    mul-int/lit8 v2, v1, 0x1f

    iget v3, p0, Lcom/belkin/wemo/rules/data/RMRule;->rulesType:I

    add-int v1, v2, v3

    .line 107
    return v1
.end method

.method public setDisplayName(Ljava/lang/String;)V
    .locals 1
    .param p1, "displayName"    # Ljava/lang/String;

    .prologue
    .line 79
    if-nez p1, :cond_0

    .line 80
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/rules/data/RMRule;->displayName:Ljava/lang/String;

    .line 84
    :goto_0
    return-void

    .line 82
    :cond_0
    iput-object p1, p0, Lcom/belkin/wemo/rules/data/RMRule;->displayName:Ljava/lang/String;

    goto :goto_0
.end method

.method public setRuleId(I)V
    .locals 0
    .param p1, "ruleId"    # I

    .prologue
    .line 55
    iput p1, p0, Lcom/belkin/wemo/rules/data/RMRule;->ruleId:I

    .line 56
    return-void
.end method

.method public setRulesType(I)V
    .locals 0
    .param p1, "rulesType"    # I

    .prologue
    .line 67
    iput p1, p0, Lcom/belkin/wemo/rules/data/RMRule;->rulesType:I

    .line 68
    return-void
.end method

.method public setState(I)V
    .locals 0
    .param p1, "state"    # I

    .prologue
    .line 149
    iput p1, p0, Lcom/belkin/wemo/rules/data/RMRule;->state:I

    .line 150
    return-void
.end method

.method public toJSON(Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .locals 2
    .param p1, "jo"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 158
    const-string v0, "RULE_ID"

    iget v1, p0, Lcom/belkin/wemo/rules/data/RMRule;->ruleId:I

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 159
    const-string v0, "STATE"

    iget v1, p0, Lcom/belkin/wemo/rules/data/RMRule;->state:I

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 160
    const-string v0, "DISPLAY_NAME"

    iget-object v1, p0, Lcom/belkin/wemo/rules/data/RMRule;->displayName:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 161
    const-string v0, "RULE_TYPE"

    iget v1, p0, Lcom/belkin/wemo/rules/data/RMRule;->rulesType:I

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 163
    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 154
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "RULE_ID: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/belkin/wemo/rules/data/RMRule;->ruleId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "; STATE: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/belkin/wemo/rules/data/RMRule;->state:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "; DISPLAY_NAME: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/wemo/rules/data/RMRule;->displayName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "; RULES_TYPE: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/belkin/wemo/rules/data/RMRule;->rulesType:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
