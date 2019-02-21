.class public abstract Lcom/belkin/wemo/rules/composer/RMAbstractRuleComposer;
.super Ljava/lang/Object;
.source "RMAbstractRuleComposer.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/belkin/wemo/rules/data/RMRule;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field protected final TAG:Ljava/lang/String;

.field protected rule:Lcom/belkin/wemo/rules/data/RMRule;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/data/RMRule;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 13
    .local p0, "this":Lcom/belkin/wemo/rules/composer/RMAbstractRuleComposer;, "Lcom/belkin/wemo/rules/composer/RMAbstractRuleComposer<TT;>;"
    .local p1, "rule":Lcom/belkin/wemo/rules/data/RMRule;, "TT;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lcom/belkin/wemo/rules/composer/RMAbstractRuleComposer;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    .line 15
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/rules/composer/RMAbstractRuleComposer;->TAG:Ljava/lang/String;

    .line 16
    return-void
.end method


# virtual methods
.method public abstract add(Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesSuccessCallback;Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesErrorCallback;)V
.end method

.method public abstract delete(Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesSuccessCallback;Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesErrorCallback;)V
.end method

.method public abstract disable(Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesSuccessCallback;Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesErrorCallback;)V
.end method

.method public abstract edit(Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesSuccessCallback;Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesErrorCallback;)V
.end method

.method public abstract enable(Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesSuccessCallback;Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesErrorCallback;)V
.end method

.method public abstract reset(Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesSuccessCallback;Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesErrorCallback;)V
.end method
