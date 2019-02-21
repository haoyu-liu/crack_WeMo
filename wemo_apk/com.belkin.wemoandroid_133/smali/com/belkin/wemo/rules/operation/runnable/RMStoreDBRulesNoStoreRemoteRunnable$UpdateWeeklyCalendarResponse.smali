.class Lcom/belkin/wemo/rules/operation/runnable/RMStoreDBRulesNoStoreRemoteRunnable$UpdateWeeklyCalendarResponse;
.super Ljava/lang/Object;
.source "RMStoreDBRulesNoStoreRemoteRunnable.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/rules/operation/runnable/RMStoreDBRulesNoStoreRemoteRunnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "UpdateWeeklyCalendarResponse"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/wemo/rules/operation/runnable/RMStoreDBRulesNoStoreRemoteRunnable;


# direct methods
.method private constructor <init>(Lcom/belkin/wemo/rules/operation/runnable/RMStoreDBRulesNoStoreRemoteRunnable;)V
    .locals 0

    .prologue
    .line 103
    iput-object p1, p0, Lcom/belkin/wemo/rules/operation/runnable/RMStoreDBRulesNoStoreRemoteRunnable$UpdateWeeklyCalendarResponse;->this$0:Lcom/belkin/wemo/rules/operation/runnable/RMStoreDBRulesNoStoreRemoteRunnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/belkin/wemo/rules/operation/runnable/RMStoreDBRulesNoStoreRemoteRunnable;Lcom/belkin/wemo/rules/operation/runnable/RMStoreDBRulesNoStoreRemoteRunnable$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/belkin/wemo/rules/operation/runnable/RMStoreDBRulesNoStoreRemoteRunnable;
    .param p2, "x1"    # Lcom/belkin/wemo/rules/operation/runnable/RMStoreDBRulesNoStoreRemoteRunnable$1;

    .prologue
    .line 103
    invoke-direct {p0, p1}, Lcom/belkin/wemo/rules/operation/runnable/RMStoreDBRulesNoStoreRemoteRunnable$UpdateWeeklyCalendarResponse;-><init>(Lcom/belkin/wemo/rules/operation/runnable/RMStoreDBRulesNoStoreRemoteRunnable;)V

    return-void
.end method


# virtual methods
.method public onRequestComplete(ZI[B)V
    .locals 4
    .param p1, "success"    # Z
    .param p2, "statusCode"    # I
    .param p3, "resp"    # [B

    .prologue
    .line 109
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/runnable/RMStoreDBRulesNoStoreRemoteRunnable$UpdateWeeklyCalendarResponse;->this$0:Lcom/belkin/wemo/rules/operation/runnable/RMStoreDBRulesNoStoreRemoteRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/rules/operation/runnable/RMStoreDBRulesNoStoreRemoteRunnable;->access$100(Lcom/belkin/wemo/rules/operation/runnable/RMStoreDBRulesNoStoreRemoteRunnable;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Store Rules (No Store): updateWeeklyCalendar remote call response. status = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    const/16 v0, 0xc8

    if-eq p2, v0, :cond_1

    .line 112
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/runnable/RMStoreDBRulesNoStoreRemoteRunnable$UpdateWeeklyCalendarResponse;->this$0:Lcom/belkin/wemo/rules/operation/runnable/RMStoreDBRulesNoStoreRemoteRunnable;

    iget-object v0, v0, Lcom/belkin/wemo/rules/operation/runnable/RMStoreDBRulesNoStoreRemoteRunnable;->errorCallback:Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteErrorCallback;

    if-eqz v0, :cond_0

    .line 113
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/runnable/RMStoreDBRulesNoStoreRemoteRunnable$UpdateWeeklyCalendarResponse;->this$0:Lcom/belkin/wemo/rules/operation/runnable/RMStoreDBRulesNoStoreRemoteRunnable;

    iget-object v0, v0, Lcom/belkin/wemo/rules/operation/runnable/RMStoreDBRulesNoStoreRemoteRunnable;->errorCallback:Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteErrorCallback;

    new-instance v1, Lcom/belkin/wemo/rules/error/RMRulesError;

    invoke-direct {v1}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>()V

    iget-object v2, p0, Lcom/belkin/wemo/rules/operation/runnable/RMStoreDBRulesNoStoreRemoteRunnable$UpdateWeeklyCalendarResponse;->this$0:Lcom/belkin/wemo/rules/operation/runnable/RMStoreDBRulesNoStoreRemoteRunnable;

    iget-object v2, v2, Lcom/belkin/wemo/rules/operation/runnable/RMStoreDBRulesNoStoreRemoteRunnable;->devicesList:Ljava/util/List;

    const/4 v3, 0x1

    invoke-interface {v0, v1, v2, v3}, Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteErrorCallback;->onError(Lcom/belkin/wemo/rules/error/RMRulesError;Ljava/util/List;I)V

    .line 119
    :cond_0
    :goto_0
    return-void

    .line 117
    :cond_1
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/runnable/RMStoreDBRulesNoStoreRemoteRunnable$UpdateWeeklyCalendarResponse;->this$0:Lcom/belkin/wemo/rules/operation/runnable/RMStoreDBRulesNoStoreRemoteRunnable;

    invoke-virtual {v0}, Lcom/belkin/wemo/rules/operation/runnable/RMStoreDBRulesNoStoreRemoteRunnable;->sendDBFileToCloud()V

    goto :goto_0
.end method
