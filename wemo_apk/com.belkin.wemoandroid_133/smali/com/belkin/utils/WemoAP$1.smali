.class final Lcom/belkin/utils/WemoAP$1;
.super Ljava/lang/Object;
.source "WemoAP.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/utils/WemoAP;->handleWemoAPPopup(Landroid/content/Context;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$ctx:Landroid/content/Context;

.field final synthetic val$mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V
    .locals 0

    .prologue
    .line 36
    iput-object p1, p0, Lcom/belkin/utils/WemoAP$1;->val$ctx:Landroid/content/Context;

    iput-object p2, p0, Lcom/belkin/utils/WemoAP$1;->val$mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 39
    new-instance v0, Lcom/belkin/utils/WemoAP;

    invoke-direct {v0}, Lcom/belkin/utils/WemoAP;-><init>()V

    .line 40
    .local v0, "rm":Lcom/belkin/utils/WemoAP;
    iget-object v1, p0, Lcom/belkin/utils/WemoAP$1;->val$ctx:Landroid/content/Context;

    iget-object v2, p0, Lcom/belkin/utils/WemoAP$1;->val$mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-static {v0, v1, v2}, Lcom/belkin/utils/WemoAP;->access$000(Lcom/belkin/utils/WemoAP;Landroid/content/Context;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V

    .line 41
    return-void
.end method
