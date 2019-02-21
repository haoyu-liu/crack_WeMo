.class public Lcom/belkin/wemo/rules/data/error/RMRuleConflictError;
.super Lcom/belkin/wemo/rules/error/RMRulesError;
.source "RMRuleConflictError.java"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 12
    invoke-direct {p0}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>()V

    .line 13
    const/16 v0, 0x1f8

    iput v0, p0, Lcom/belkin/wemo/rules/data/error/RMRuleConflictError;->errorCode:I

    .line 14
    const-string v0, "Rule is conflicting with an already existing rule."

    iput-object v0, p0, Lcom/belkin/wemo/rules/data/error/RMRuleConflictError;->errorMessage:Ljava/lang/String;

    .line 15
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .locals 0
    .param p1, "errorCode"    # I
    .param p2, "errorMessage"    # Ljava/lang/String;

    .prologue
    .line 9
    invoke-direct {p0, p1, p2}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>(ILjava/lang/String;)V

    .line 10
    return-void
.end method
