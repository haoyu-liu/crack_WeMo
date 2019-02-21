.class Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable$GetDBPathActionCallback;
.super Ljava/lang/Object;
.source "FetchDeviceRulesNoFetchSupportRunnable.java"

# interfaces
.implements Lcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionErrorCallback;
.implements Lcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionSuccessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GetDBPathActionCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;


# direct methods
.method private constructor <init>(Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;)V
    .locals 0

    .prologue
    .line 114
    iput-object p1, p0, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable$GetDBPathActionCallback;->this$0:Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;
    .param p2, "x1"    # Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable$1;

    .prologue
    .line 114
    invoke-direct {p0, p1}, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable$GetDBPathActionCallback;-><init>(Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;)V

    return-void
.end method


# virtual methods
.method public onActionError(Ljava/lang/Exception;)V
    .locals 0
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 124
    invoke-virtual {p0}, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable$GetDBPathActionCallback;->onCallbackReveived()V

    .line 125
    return-void
.end method

.method public onActionSuccess(Ljava/lang/String;)V
    .locals 1
    .param p1, "responseXMLStr"    # Ljava/lang/String;

    .prologue
    .line 118
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable$GetDBPathActionCallback;->this$0:Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;

    invoke-static {v0, p1}, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;->access$202(Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;Ljava/lang/String;)Ljava/lang/String;

    .line 119
    invoke-virtual {p0}, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable$GetDBPathActionCallback;->onCallbackReveived()V

    .line 120
    return-void
.end method

.method protected onCallbackReveived()V
    .locals 2

    .prologue
    .line 128
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable$GetDBPathActionCallback;->this$0:Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;->access$300(Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 129
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable$GetDBPathActionCallback;->this$0:Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;->access$400(Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;)V

    .line 131
    :cond_0
    return-void
.end method
