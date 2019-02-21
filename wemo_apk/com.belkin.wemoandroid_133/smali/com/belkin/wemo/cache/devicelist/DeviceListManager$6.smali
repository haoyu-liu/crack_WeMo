.class Lcom/belkin/wemo/cache/devicelist/DeviceListManager$6;
.super Ljava/lang/Object;
.source "DeviceListManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->stop()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;


# direct methods
.method constructor <init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V
    .locals 0

    .prologue
    .line 1121
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$6;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 1125
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$6;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-static {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->access$200(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1126
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$6;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-static {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->access$200(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v0

    invoke-virtual {v0}, Lorg/cybergarage/upnp/ControlPoint;->finalizeCP()V

    .line 1127
    :cond_0
    const/4 v0, 0x0

    sput-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 1128
    return-void
.end method
