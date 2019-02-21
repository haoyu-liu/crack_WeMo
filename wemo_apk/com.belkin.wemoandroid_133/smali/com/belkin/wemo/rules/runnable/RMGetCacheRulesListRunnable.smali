.class public Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "RMGetCacheRulesListRunnable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable$ParseRulesCallback;
    }
.end annotation


# instance fields
.field private errorCallback:Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;

.field private successCallback:Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;)V
    .locals 0
    .param p1, "successCallback"    # Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;
    .param p2, "errorCallback"    # Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 29
    iput-object p1, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable;->successCallback:Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;

    .line 30
    iput-object p2, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable;->errorCallback:Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;

    .line 31
    return-void
.end method

.method static synthetic access$000(Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable;

    .prologue
    .line 22
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable;

    .prologue
    .line 22
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable;

    .prologue
    .line 22
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable;

    .prologue
    .line 22
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable;->TAG:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 36
    new-instance v0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable$ParseRulesCallback;

    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable;->successCallback:Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;

    iget-object v2, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable;->errorCallback:Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;

    invoke-direct {v0, p0, v1, v2}, Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable$ParseRulesCallback;-><init>(Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable;Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;)V

    .line 37
    .local v0, "parseCallback":Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable$ParseRulesCallback;
    sget-object v1, Lcom/belkin/wemo/rules/read/RMParseRulesManager;->INSTANCE:Lcom/belkin/wemo/rules/read/RMParseRulesManager;

    invoke-virtual {v1, v0, v0}, Lcom/belkin/wemo/rules/read/RMParseRulesManager;->parseRules(Lcom/belkin/wemo/rules/read/callback/RMParseRulesSuccessCallback;Lcom/belkin/wemo/rules/read/callback/RMParseRulesErrorCallback;)V

    .line 40
    sget-object v1, Lcom/belkin/wemo/rules/location/RMLocationInfoManager;->INSTANCE:Lcom/belkin/wemo/rules/location/RMLocationInfoManager;

    invoke-virtual {v1, v0, v0}, Lcom/belkin/wemo/rules/location/RMLocationInfoManager;->read(Lcom/belkin/wemo/rules/location/callback/RMReadLocationSuccessCallback;Lcom/belkin/wemo/rules/location/callback/RMReadLocationErrorCallback;)V

    .line 41
    return-void
.end method
