.class Lcom/belkin/wemo/cache/devicelist/DeviceListManager$19;
.super Ljava/lang/Object;
.source "DeviceListManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->initiateScanZigBeeDevice(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field final synthetic val$bridgeDevice:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 2232
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$19;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iput-object p2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$19;->val$bridgeDevice:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 2235
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$19;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$19;->val$bridgeDevice:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->access$600(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Ljava/lang/String;)V

    .line 2237
    return-void
.end method
