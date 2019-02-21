.class Lcom/belkin/utils/RateMe$6;
.super Ljava/lang/Object;
.source "RateMe.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/utils/RateMe;->showRateMePopup(Landroid/content/Context;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/utils/RateMe;

.field final synthetic val$ctx:Landroid/content/Context;

.field final synthetic val$mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;


# direct methods
.method constructor <init>(Lcom/belkin/utils/RateMe;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 262
    iput-object p1, p0, Lcom/belkin/utils/RateMe$6;->this$0:Lcom/belkin/utils/RateMe;

    iput-object p2, p0, Lcom/belkin/utils/RateMe$6;->val$mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iput-object p3, p0, Lcom/belkin/utils/RateMe$6;->val$ctx:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 266
    invoke-static {}, Lcom/belkin/utils/RateMe;->access$500()Landroid/app/Dialog;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/belkin/utils/RateMe$6;->val$mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    if-eqz v0, :cond_0

    .line 270
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/belkin/utils/RateMe$6;->val$mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->didUnicastFailForAnyDevice()Z

    move-result v0

    if-nez v0, :cond_1

    .line 271
    iget-object v0, p0, Lcom/belkin/utils/RateMe$6;->val$ctx:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    .line 272
    invoke-static {}, Lcom/belkin/utils/RateMe;->access$500()Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 278
    :cond_0
    :goto_0
    return-void

    .line 275
    :cond_1
    invoke-static {}, Lcom/belkin/utils/RateMe;->dismiss()V

    goto :goto_0
.end method
