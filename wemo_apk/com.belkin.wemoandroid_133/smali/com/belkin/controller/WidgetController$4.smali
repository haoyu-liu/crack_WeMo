.class Lcom/belkin/controller/WidgetController$4;
.super Ljava/lang/Object;
.source "WidgetController.java"

# interfaces
.implements Lcom/belkin/controller/WidgetGetDeviceCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/controller/WidgetController;->onNotify(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/controller/WidgetController;

.field private tryGroupIfUnavailable:Z

.field final synthetic val$stateChangedListener:Lcom/belkin/controller/WidgetStateChangedListener;

.field final synthetic val$success:Z

.field final synthetic val$udn:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/belkin/controller/WidgetController;Lcom/belkin/controller/WidgetStateChangedListener;Ljava/lang/String;Z)V
    .locals 1

    .prologue
    .line 213
    iput-object p1, p0, Lcom/belkin/controller/WidgetController$4;->this$0:Lcom/belkin/controller/WidgetController;

    iput-object p2, p0, Lcom/belkin/controller/WidgetController$4;->val$stateChangedListener:Lcom/belkin/controller/WidgetStateChangedListener;

    iput-object p3, p0, Lcom/belkin/controller/WidgetController$4;->val$udn:Ljava/lang/String;

    iput-boolean p4, p0, Lcom/belkin/controller/WidgetController$4;->val$success:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 214
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/belkin/controller/WidgetController$4;->tryGroupIfUnavailable:Z

    return-void
.end method


# virtual methods
.method public onDeviceOffline(Lcom/belkin/wemo/cache/data/DeviceInformation;)V
    .locals 0
    .param p1, "deviceInformation"    # Lcom/belkin/wemo/cache/data/DeviceInformation;

    .prologue
    .line 230
    invoke-virtual {p0, p1}, Lcom/belkin/controller/WidgetController$4;->onDeviceOnline(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 231
    return-void
.end method

.method public onDeviceOnline(Lcom/belkin/wemo/cache/data/DeviceInformation;)V
    .locals 6
    .param p1, "deviceInformation"    # Lcom/belkin/wemo/cache/data/DeviceInformation;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 218
    invoke-static {}, Lcom/belkin/controller/WidgetController;->access$400()Ljava/lang/String;

    move-result-object v0

    const-string v1, "SET_STATE - expected, received: %d, %d"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/belkin/controller/WidgetController$4;->val$stateChangedListener:Lcom/belkin/controller/WidgetStateChangedListener;

    invoke-interface {v3}, Lcom/belkin/controller/WidgetStateChangedListener;->getState()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getState()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 220
    invoke-static {}, Lcom/belkin/controller/WidgetController;->access$400()Ljava/lang/String;

    move-result-object v0

    const-string v1, "SET_STATE - binary_state: %s"

    new-array v2, v5, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getBinaryState()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 222
    iget-object v0, p0, Lcom/belkin/controller/WidgetController$4;->val$stateChangedListener:Lcom/belkin/controller/WidgetStateChangedListener;

    iget-object v1, p0, Lcom/belkin/controller/WidgetController$4;->this$0:Lcom/belkin/controller/WidgetController;

    invoke-static {v1}, Lcom/belkin/controller/WidgetController;->access$100(Lcom/belkin/controller/WidgetController;)Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/controller/WidgetController$4;->val$udn:Ljava/lang/String;

    iget-boolean v3, p0, Lcom/belkin/controller/WidgetController$4;->val$success:Z

    invoke-interface {v0, v1, v2, v3}, Lcom/belkin/controller/WidgetStateChangedListener;->deviceStateChanged(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 223
    return-void
.end method

.method public onDeviceUnavailable()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 235
    iget-boolean v0, p0, Lcom/belkin/controller/WidgetController$4;->tryGroupIfUnavailable:Z

    if-eqz v0, :cond_0

    .line 236
    iput-boolean v4, p0, Lcom/belkin/controller/WidgetController$4;->tryGroupIfUnavailable:Z

    .line 237
    iget-object v0, p0, Lcom/belkin/controller/WidgetController$4;->this$0:Lcom/belkin/controller/WidgetController;

    iget-object v1, p0, Lcom/belkin/controller/WidgetController$4;->val$udn:Ljava/lang/String;

    invoke-virtual {v0, v1, p0}, Lcom/belkin/controller/WidgetController;->getDeviceFromGroup(Ljava/lang/String;Lcom/belkin/controller/WidgetGetDeviceCallback;)V

    .line 242
    :goto_0
    return-void

    .line 239
    :cond_0
    invoke-static {}, Lcom/belkin/controller/WidgetController;->access$400()Ljava/lang/String;

    move-result-object v0

    const-string v1, "SET_STATE - failed to get DeviceInformation for udn/groupId: %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/belkin/controller/WidgetController$4;->val$udn:Ljava/lang/String;

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
