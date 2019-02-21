.class abstract Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$FetchRulesCallback;
.super Ljava/lang/Object;
.source "RMShowRulesRunnable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "FetchRulesCallback"
.end annotation


# instance fields
.field protected errorCallback:Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;

.field protected successCallback:Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;

.field final synthetic this$0:Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable;Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;)V
    .locals 0
    .param p2, "successCallback"    # Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;
    .param p3, "errorCallback"    # Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;

    .prologue
    .line 55
    iput-object p1, p0, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$FetchRulesCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    iput-object p2, p0, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$FetchRulesCallback;->successCallback:Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;

    .line 57
    iput-object p3, p0, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$FetchRulesCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;

    .line 58
    return-void
.end method
