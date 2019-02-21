.class Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$GetRulesDBPathActionCallback;
.super Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$StoreDeviceRuleActionCallback;
.source "StoreDeviceRulesNoStoreSupportRunnable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GetRulesDBPathActionCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;Ljava/lang/String;)V
    .locals 0
    .param p2, "deviceUdn"    # Ljava/lang/String;

    .prologue
    .line 291
    iput-object p1, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$GetRulesDBPathActionCallback;->this$0:Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;

    .line 292
    invoke-direct {p0, p1, p2}, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$StoreDeviceRuleActionCallback;-><init>(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;Ljava/lang/String;)V

    .line 293
    return-void
.end method


# virtual methods
.method public onActionSuccess(Ljava/lang/String;)V
    .locals 4
    .param p1, "responseXMLStr"    # Ljava/lang/String;

    .prologue
    .line 297
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, "app_error"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 300
    iget-object v1, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$GetRulesDBPathActionCallback;->this$0:Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;

    invoke-static {v1, p1}, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->access$300(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 301
    .local v0, "deviceDBPath":Ljava/lang/String;
    iget-object v1, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$GetRulesDBPathActionCallback;->this$0:Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;

    invoke-static {v1}, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->access$400(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "STORE RULES (No Store): Extracted DB Path of device: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 303
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 306
    iget-object v1, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$GetRulesDBPathActionCallback;->this$0:Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;

    invoke-static {v1}, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->access$500(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/belkin/utils/UploadFileUtil;->writeDBToDevice(Ljava/lang/String;Ljava/lang/String;)V

    .line 307
    iget-object v1, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$GetRulesDBPathActionCallback;->this$0:Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;

    invoke-static {v1}, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->access$600(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "STORE RULES (No Store): Write DB File to Device SUCCESS"

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 308
    iget-object v1, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$GetRulesDBPathActionCallback;->this$0:Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;

    invoke-static {v1}, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->access$700(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;)V

    .line 323
    .end local v0    # "deviceDBPath":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 312
    .restart local v0    # "deviceDBPath":Ljava/lang/String;
    :cond_1
    iget-object v1, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$GetRulesDBPathActionCallback;->this$0:Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;

    invoke-static {v1}, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->access$800(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "STORE RULES (No Store): GetRulesDBPath received is empty."

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 313
    iget-object v1, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$GetRulesDBPathActionCallback;->this$0:Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;

    invoke-static {v1}, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->access$000(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;)Lcom/belkin/wemo/rules/device/callback/StoreDeviceRulesCallback;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 314
    iget-object v1, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$GetRulesDBPathActionCallback;->this$0:Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;

    invoke-static {v1}, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->access$000(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;)Lcom/belkin/wemo/rules/device/callback/StoreDeviceRulesCallback;

    move-result-object v1

    new-instance v2, Lcom/belkin/wemo/rules/device/error/RuleDeviceError;

    iget-object v3, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$GetRulesDBPathActionCallback;->deviceUdn:Ljava/lang/String;

    invoke-direct {v2, v3}, Lcom/belkin/wemo/rules/device/error/RuleDeviceError;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v2}, Lcom/belkin/wemo/rules/device/callback/StoreDeviceRulesCallback;->onError(Lcom/belkin/wemo/rules/device/error/RuleDeviceError;)V

    goto :goto_0

    .line 318
    .end local v0    # "deviceDBPath":Ljava/lang/String;
    :cond_2
    iget-object v1, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$GetRulesDBPathActionCallback;->this$0:Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;

    invoke-static {v1}, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->access$900(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "STORE RULES (No Store): Error response received for Action: GetRulesDBPath"

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 319
    iget-object v1, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$GetRulesDBPathActionCallback;->this$0:Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;

    invoke-static {v1}, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->access$000(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;)Lcom/belkin/wemo/rules/device/callback/StoreDeviceRulesCallback;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 320
    iget-object v1, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$GetRulesDBPathActionCallback;->this$0:Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;

    invoke-static {v1}, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->access$000(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;)Lcom/belkin/wemo/rules/device/callback/StoreDeviceRulesCallback;

    move-result-object v1

    new-instance v2, Lcom/belkin/wemo/rules/device/error/RuleDeviceError;

    iget-object v3, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$GetRulesDBPathActionCallback;->deviceUdn:Ljava/lang/String;

    invoke-direct {v2, v3}, Lcom/belkin/wemo/rules/device/error/RuleDeviceError;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v2}, Lcom/belkin/wemo/rules/device/callback/StoreDeviceRulesCallback;->onError(Lcom/belkin/wemo/rules/device/error/RuleDeviceError;)V

    goto :goto_0
.end method

.method protected onExceptionEncountered(Ljava/lang/Exception;)V
    .locals 3
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 328
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$GetRulesDBPathActionCallback;->this$0:Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->access$1000(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "STORE RULES (No Store): Write DB File to Device FAILED. Device: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$GetRulesDBPathActionCallback;->deviceUdn:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 329
    return-void
.end method
