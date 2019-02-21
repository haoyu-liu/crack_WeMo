.class public interface abstract Lcom/belkin/wemo/rules/read/callback/RMParseRulesSuccessCallback;
.super Ljava/lang/Object;
.source "RMParseRulesSuccessCallback.java"

# interfaces
.implements Lcom/belkin/wemo/rules/callback/RMWeMoRulesSuccessCallback;


# virtual methods
.method public abstract onRulesParsed(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/rules/data/RMRule;",
            ">;)V"
        }
    .end annotation
.end method
