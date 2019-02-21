.class Lcom/belkin/utils/WemoAP$4;
.super Ljava/lang/Object;
.source "WemoAP.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/utils/WemoAP;->showWemoAPPopup(Landroid/content/Context;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/utils/WemoAP;

.field final synthetic val$ctx:Landroid/content/Context;

.field final synthetic val$mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;


# direct methods
.method constructor <init>(Lcom/belkin/utils/WemoAP;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 110
    iput-object p1, p0, Lcom/belkin/utils/WemoAP$4;->this$0:Lcom/belkin/utils/WemoAP;

    iput-object p2, p0, Lcom/belkin/utils/WemoAP$4;->val$mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iput-object p3, p0, Lcom/belkin/utils/WemoAP$4;->val$ctx:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 113
    invoke-static {}, Lcom/belkin/utils/WemoAP;->access$200()Landroid/app/Dialog;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/belkin/utils/WemoAP$4;->val$mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    if-eqz v0, :cond_0

    .line 114
    iget-object v0, p0, Lcom/belkin/utils/WemoAP$4;->val$ctx:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    .line 115
    invoke-static {}, Lcom/belkin/utils/WemoAP;->access$200()Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 118
    :cond_0
    return-void
.end method
