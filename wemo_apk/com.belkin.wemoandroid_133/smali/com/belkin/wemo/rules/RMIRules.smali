.class public interface abstract Lcom/belkin/wemo/rules/RMIRules;
.super Ljava/lang/Object;
.source "RMIRules.java"


# virtual methods
.method public abstract deleteRule(ILcom/belkin/wemo/rules/callback/RMDeleteRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMDeleteRuleErrorCallback;)V
.end method

.method public abstract deleteRulesFromDevice(Ljava/lang/String;Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesErrorCallback;)V
.end method

.method public abstract disableRule(ILcom/belkin/wemo/rules/callback/RMToggleRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;)V
.end method

.method public abstract editRule(Lcom/belkin/wemo/rules/data/RMRule;Lcom/belkin/wemo/rules/callback/RMEditRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMEditRuleErrorCallback;)V
.end method

.method public abstract enableRule(ILcom/belkin/wemo/rules/callback/RMToggleRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;)V
.end method

.method public abstract fetchRules(Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;)V
.end method

.method public abstract getRule(ILcom/belkin/wemo/rules/callback/RMGetRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMGetRuleErrorCallback;)V
.end method

.method public abstract getRuleFromCache(ILcom/belkin/wemo/rules/callback/RMGetRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMGetRuleErrorCallback;)V
.end method

.method public abstract getRulesListFromCache(Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;)V
.end method

.method public abstract saveRule(Lcom/belkin/wemo/rules/data/RMRule;Lcom/belkin/wemo/rules/callback/RMSaveRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMSaveRuleErrorCallback;)V
.end method
