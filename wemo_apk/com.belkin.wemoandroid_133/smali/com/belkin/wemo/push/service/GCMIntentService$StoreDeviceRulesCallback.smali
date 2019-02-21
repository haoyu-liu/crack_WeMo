.class Lcom/belkin/wemo/push/service/GCMIntentService$StoreDeviceRulesCallback;
.super Ljava/lang/Object;
.source "GCMIntentService.java"

# interfaces
.implements Lcom/belkin/wemo/rules/callback/StoreRulesErrorCallback;
.implements Lcom/belkin/wemo/rules/callback/StoreRulesSuccessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/push/service/GCMIntentService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "StoreDeviceRulesCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/wemo/push/service/GCMIntentService;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/push/service/GCMIntentService;)V
    .locals 0

    .prologue
    .line 326
    iput-object p1, p0, Lcom/belkin/wemo/push/service/GCMIntentService$StoreDeviceRulesCallback;->this$0:Lcom/belkin/wemo/push/service/GCMIntentService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 327
    return-void
.end method


# virtual methods
.method public onError(Lcom/belkin/wemo/rules/error/RMRulesError;)V
    .locals 2
    .param p1, "error"    # Lcom/belkin/wemo/rules/error/RMRulesError;

    .prologue
    .line 340
    iget-object v0, p0, Lcom/belkin/wemo/push/service/GCMIntentService$StoreDeviceRulesCallback;->this$0:Lcom/belkin/wemo/push/service/GCMIntentService;

    iget-object v0, v0, Lcom/belkin/wemo/push/service/GCMIntentService;->TAG:Ljava/lang/String;

    const-string v1, "Store Device Rules Callback on Error."

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 341
    iget-object v0, p0, Lcom/belkin/wemo/push/service/GCMIntentService$StoreDeviceRulesCallback;->this$0:Lcom/belkin/wemo/push/service/GCMIntentService;

    iget-object v0, v0, Lcom/belkin/wemo/push/service/GCMIntentService;->weeklyRecordsHashMap:Ljava/util/HashMap;

    if-eqz v0, :cond_0

    .line 342
    iget-object v0, p0, Lcom/belkin/wemo/push/service/GCMIntentService$StoreDeviceRulesCallback;->this$0:Lcom/belkin/wemo/push/service/GCMIntentService;

    iget-object v0, v0, Lcom/belkin/wemo/push/service/GCMIntentService;->weeklyRecordsHashMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 344
    :cond_0
    return-void
.end method

.method public onSuccess()V
    .locals 4

    .prologue
    .line 331
    iget-object v0, p0, Lcom/belkin/wemo/push/service/GCMIntentService$StoreDeviceRulesCallback;->this$0:Lcom/belkin/wemo/push/service/GCMIntentService;

    iget-object v0, v0, Lcom/belkin/wemo/push/service/GCMIntentService;->TAG:Ljava/lang/String;

    const-string v1, "Store Device Rules Callback on Success."

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 332
    sget-object v0, Lcom/belkin/wemo/push/service/GCMIntentService;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v1, "nest_deauthorized"

    const-string v2, ""

    const-string v3, ""

    invoke-virtual {v0, v1, v2, v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 333
    iget-object v0, p0, Lcom/belkin/wemo/push/service/GCMIntentService$StoreDeviceRulesCallback;->this$0:Lcom/belkin/wemo/push/service/GCMIntentService;

    iget-object v0, v0, Lcom/belkin/wemo/push/service/GCMIntentService;->weeklyRecordsHashMap:Ljava/util/HashMap;

    if-eqz v0, :cond_0

    .line 334
    iget-object v0, p0, Lcom/belkin/wemo/push/service/GCMIntentService$StoreDeviceRulesCallback;->this$0:Lcom/belkin/wemo/push/service/GCMIntentService;

    iget-object v0, v0, Lcom/belkin/wemo/push/service/GCMIntentService;->weeklyRecordsHashMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 336
    :cond_0
    return-void
.end method
