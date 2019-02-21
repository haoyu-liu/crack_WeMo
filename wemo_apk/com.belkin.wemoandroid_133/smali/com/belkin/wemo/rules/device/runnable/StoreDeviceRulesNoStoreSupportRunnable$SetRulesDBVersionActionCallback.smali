.class Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$SetRulesDBVersionActionCallback;
.super Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$StoreDeviceRuleActionCallback;
.source "StoreDeviceRulesNoStoreSupportRunnable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SetRulesDBVersionActionCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;Ljava/lang/String;)V
    .locals 0
    .param p2, "deviceUdn"    # Ljava/lang/String;

    .prologue
    .line 334
    iput-object p1, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$SetRulesDBVersionActionCallback;->this$0:Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;

    .line 335
    invoke-direct {p0, p1, p2}, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$StoreDeviceRuleActionCallback;-><init>(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;Ljava/lang/String;)V

    .line 336
    return-void
.end method


# virtual methods
.method public onActionSuccess(Ljava/lang/String;)V
    .locals 2
    .param p1, "responseXMLStr"    # Ljava/lang/String;

    .prologue
    .line 340
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$SetRulesDBVersionActionCallback;->this$0:Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->access$000(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;)Lcom/belkin/wemo/rules/device/callback/StoreDeviceRulesCallback;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 341
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$SetRulesDBVersionActionCallback;->this$0:Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->access$000(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;)Lcom/belkin/wemo/rules/device/callback/StoreDeviceRulesCallback;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$SetRulesDBVersionActionCallback;->deviceUdn:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/belkin/wemo/rules/device/callback/StoreDeviceRulesCallback;->onSuccess(Ljava/lang/String;)V

    .line 343
    :cond_0
    return-void
.end method

.method protected onExceptionEncountered(Ljava/lang/Exception;)V
    .locals 3
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 348
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$SetRulesDBVersionActionCallback;->this$0:Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->access$1100(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "STORE RULES (No Store): Setting Rules DB version to Device FAILED. Device: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$SetRulesDBVersionActionCallback;->deviceUdn:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 349
    return-void
.end method
