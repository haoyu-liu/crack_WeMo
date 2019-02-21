.class Lcom/belkin/wemo/cache/devicelist/DeviceListManager$20;
.super Ljava/lang/Object;
.source "DeviceListManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setDeviceListFromCloud(Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Z)V
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
    .line 3155
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$20;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 3158
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$20;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-static {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->access$200(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 3159
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$20;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-static {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->access$200(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v0

    invoke-virtual {v0}, Lorg/cybergarage/upnp/ControlPoint;->finalizeCP()V

    .line 3161
    :cond_0
    return-void
.end method
