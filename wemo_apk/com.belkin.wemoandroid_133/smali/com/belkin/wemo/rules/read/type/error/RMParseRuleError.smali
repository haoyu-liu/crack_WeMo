.class public Lcom/belkin/wemo/rules/read/type/error/RMParseRuleError;
.super Lcom/belkin/wemo/rules/error/RMRulesError;
.source "RMParseRuleError.java"


# instance fields
.field private ruleType:Ljava/lang/String;

.field private rulesType:I


# direct methods
.method public constructor <init>(ILjava/lang/String;)V
    .locals 0
    .param p1, "rulesType"    # I
    .param p2, "ruleType"    # Ljava/lang/String;

    .prologue
    .line 22
    invoke-direct {p0}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>()V

    .line 23
    iput p1, p0, Lcom/belkin/wemo/rules/read/type/error/RMParseRuleError;->rulesType:I

    .line 24
    iput-object p2, p0, Lcom/belkin/wemo/rules/read/type/error/RMParseRuleError;->ruleType:Ljava/lang/String;

    .line 25
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;I)V
    .locals 0
    .param p1, "errorCode"    # I
    .param p2, "errorMessage"    # Ljava/lang/String;
    .param p3, "rulesType"    # I

    .prologue
    .line 17
    invoke-direct {p0, p1, p2}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>(ILjava/lang/String;)V

    .line 18
    iput p3, p0, Lcom/belkin/wemo/rules/read/type/error/RMParseRuleError;->rulesType:I

    .line 19
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;ILjava/lang/String;)V
    .locals 0
    .param p1, "errorCode"    # I
    .param p2, "errorMessage"    # Ljava/lang/String;
    .param p3, "rulesType"    # I
    .param p4, "ruleType"    # Ljava/lang/String;

    .prologue
    .line 11
    invoke-direct {p0, p1, p2}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>(ILjava/lang/String;)V

    .line 12
    iput p3, p0, Lcom/belkin/wemo/rules/read/type/error/RMParseRuleError;->rulesType:I

    .line 13
    iput-object p4, p0, Lcom/belkin/wemo/rules/read/type/error/RMParseRuleError;->ruleType:Ljava/lang/String;

    .line 14
    return-void
.end method


# virtual methods
.method public getRuleType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lcom/belkin/wemo/rules/read/type/error/RMParseRuleError;->ruleType:Ljava/lang/String;

    return-object v0
.end method

.method public getRulesType()I
    .locals 1

    .prologue
    .line 31
    iget v0, p0, Lcom/belkin/wemo/rules/read/type/error/RMParseRuleError;->rulesType:I

    return v0
.end method

.method public setRuleType(Ljava/lang/String;)V
    .locals 0
    .param p1, "ruleType"    # Ljava/lang/String;

    .prologue
    .line 52
    iput-object p1, p0, Lcom/belkin/wemo/rules/read/type/error/RMParseRuleError;->ruleType:Ljava/lang/String;

    .line 53
    return-void
.end method

.method public setRulesType(I)V
    .locals 0
    .param p1, "rulesType"    # I

    .prologue
    .line 38
    iput p1, p0, Lcom/belkin/wemo/rules/read/type/error/RMParseRuleError;->rulesType:I

    .line 39
    return-void
.end method
