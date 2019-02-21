.class Lcom/belkin/wemo/cache/devicelist/DeviceListManager$4;
.super Ljava/util/TimerTask;
.source "DeviceListManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->restartCloudPeriodicUpdate()V
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
    .line 790
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$4;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 793
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$4;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->makeCloudRequestForUpdateDeviceList()V

    .line 794
    return-void
.end method
