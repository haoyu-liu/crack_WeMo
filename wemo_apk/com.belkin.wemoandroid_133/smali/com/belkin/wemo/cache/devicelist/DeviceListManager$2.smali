.class Lcom/belkin/wemo/cache/devicelist/DeviceListManager$2;
.super Ljava/lang/Object;
.source "DeviceListManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->onResume(Lcom/belkin/wemo/cache/devicelist/DeviceListManager$NotificationListenerDLM;)V
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
    .line 625
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$2;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 628
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$2;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->makeCloudRequestForUpdateDeviceList()V

    .line 629
    return-void
.end method