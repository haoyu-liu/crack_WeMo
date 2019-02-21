.class Lcom/belkin/wemo/push/service/GCMIntentService$1;
.super Ljava/lang/Object;
.source "GCMIntentService.java"

# interfaces
.implements Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/wemo/push/service/GCMIntentService;->getNotificationMessage(Landroid/content/Intent;)Lcom/belkin/wemo/push/PushNotificationInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/wemo/push/service/GCMIntentService;

.field final synthetic val$dimmerUdn:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/belkin/wemo/push/service/GCMIntentService;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 137
    iput-object p1, p0, Lcom/belkin/wemo/push/service/GCMIntentService$1;->this$0:Lcom/belkin/wemo/push/service/GCMIntentService;

    iput-object p2, p0, Lcom/belkin/wemo/push/service/GCMIntentService$1;->val$dimmerUdn:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSuccess(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/rules/data/RMRule;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 141
    .local p1, "rulesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/rules/data/RMRule;>;"
    iget-object v0, p0, Lcom/belkin/wemo/push/service/GCMIntentService$1;->this$0:Lcom/belkin/wemo/push/service/GCMIntentService;

    invoke-virtual {v0}, Lcom/belkin/wemo/push/service/GCMIntentService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/wemo/push/service/GCMIntentService$1;->val$dimmerUdn:Ljava/lang/String;

    invoke-virtual {v0, v1, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->refreshLongPressRuleDetails(Ljava/lang/String;Ljava/util/List;)V

    .line 142
    return-void
.end method
