.class Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$WeeklyCalendarActionCallback;
.super Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$StoreDeviceRuleActionCallback;
.source "StoreDeviceRulesNoStoreSupportRunnable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "WeeklyCalendarActionCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;Ljava/lang/String;)V
    .locals 0
    .param p2, "deviceUdn"    # Ljava/lang/String;

    .prologue
    .line 266
    iput-object p1, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$WeeklyCalendarActionCallback;->this$0:Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;

    .line 267
    invoke-direct {p0, p1, p2}, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$StoreDeviceRuleActionCallback;-><init>(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;Ljava/lang/String;)V

    .line 268
    return-void
.end method


# virtual methods
.method public onActionSuccess(Ljava/lang/String;)V
    .locals 3
    .param p1, "responseXMLStr"    # Ljava/lang/String;

    .prologue
    .line 272
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 273
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$WeeklyCalendarActionCallback;->this$0:Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->access$100(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;)V

    .line 280
    :cond_0
    :goto_0
    return-void

    .line 275
    :cond_1
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$WeeklyCalendarActionCallback;->this$0:Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->access$000(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;)Lcom/belkin/wemo/rules/device/callback/StoreDeviceRulesCallback;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 276
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$WeeklyCalendarActionCallback;->this$0:Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->access$000(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;)Lcom/belkin/wemo/rules/device/callback/StoreDeviceRulesCallback;

    move-result-object v0

    new-instance v1, Lcom/belkin/wemo/rules/device/error/RuleDeviceError;

    iget-object v2, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$WeeklyCalendarActionCallback;->deviceUdn:Ljava/lang/String;

    invoke-direct {v1, v2}, Lcom/belkin/wemo/rules/device/error/RuleDeviceError;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/belkin/wemo/rules/device/callback/StoreDeviceRulesCallback;->onError(Lcom/belkin/wemo/rules/device/error/RuleDeviceError;)V

    goto :goto_0
.end method

.method protected onExceptionEncountered(Ljava/lang/Exception;)V
    .locals 3
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 285
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$WeeklyCalendarActionCallback;->this$0:Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->access$200(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "STORE RULES (No Store): Update Weekly calendar call failed, device: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$WeeklyCalendarActionCallback;->deviceUdn:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; Exception: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p1}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 286
    return-void
.end method
