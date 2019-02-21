.class public Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "RMGetCacheRuleRunnable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable$ParseRulesCallback;
    }
.end annotation


# instance fields
.field private errorCallback:Lcom/belkin/wemo/rules/callback/RMGetRuleErrorCallback;

.field private ruleId:I

.field private successCallback:Lcom/belkin/wemo/rules/callback/RMGetRuleSuccessCallback;


# direct methods
.method public constructor <init>(ILcom/belkin/wemo/rules/callback/RMGetRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMGetRuleErrorCallback;)V
    .locals 0
    .param p1, "ruleId"    # I
    .param p2, "successCallback"    # Lcom/belkin/wemo/rules/callback/RMGetRuleSuccessCallback;
    .param p3, "errorCallback"    # Lcom/belkin/wemo/rules/callback/RMGetRuleErrorCallback;

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 32
    iput-object p2, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable;->successCallback:Lcom/belkin/wemo/rules/callback/RMGetRuleSuccessCallback;

    .line 33
    iput-object p3, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable;->errorCallback:Lcom/belkin/wemo/rules/callback/RMGetRuleErrorCallback;

    .line 34
    iput p1, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable;->ruleId:I

    .line 35
    return-void
.end method

.method static synthetic access$000(Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable;

    .prologue
    .line 23
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable;

    .prologue
    .line 23
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable;

    .prologue
    .line 23
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable;

    .prologue
    .line 23
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable;->TAG:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 40
    new-instance v0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable$ParseRulesCallback;

    iget v1, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable;->ruleId:I

    iget-object v2, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable;->successCallback:Lcom/belkin/wemo/rules/callback/RMGetRuleSuccessCallback;

    iget-object v3, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable;->errorCallback:Lcom/belkin/wemo/rules/callback/RMGetRuleErrorCallback;

    invoke-direct {v0, p0, v1, v2, v3}, Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable$ParseRulesCallback;-><init>(Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable;ILcom/belkin/wemo/rules/callback/RMGetRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMGetRuleErrorCallback;)V

    .line 41
    .local v0, "parseCallback":Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable$ParseRulesCallback;
    sget-object v1, Lcom/belkin/wemo/rules/read/RMParseRulesManager;->INSTANCE:Lcom/belkin/wemo/rules/read/RMParseRulesManager;

    invoke-virtual {v1, v0, v0}, Lcom/belkin/wemo/rules/read/RMParseRulesManager;->parseRules(Lcom/belkin/wemo/rules/read/callback/RMParseRulesSuccessCallback;Lcom/belkin/wemo/rules/read/callback/RMParseRulesErrorCallback;)V

    .line 44
    sget-object v1, Lcom/belkin/wemo/rules/location/RMLocationInfoManager;->INSTANCE:Lcom/belkin/wemo/rules/location/RMLocationInfoManager;

    invoke-virtual {v1, v0, v0}, Lcom/belkin/wemo/rules/location/RMLocationInfoManager;->read(Lcom/belkin/wemo/rules/location/callback/RMReadLocationSuccessCallback;Lcom/belkin/wemo/rules/location/callback/RMReadLocationErrorCallback;)V

    .line 45
    return-void
.end method
