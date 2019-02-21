.class final Lcom/belkin/utils/RateMe$1;
.super Ljava/lang/Object;
.source "RateMe.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/utils/RateMe;->handleRateMePopup(Landroid/content/Context;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V
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
    .line 55
    iput-object p1, p0, Lcom/belkin/utils/RateMe$1;->val$ctx:Landroid/content/Context;

    iput-object p2, p0, Lcom/belkin/utils/RateMe$1;->val$mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 58
    new-instance v0, Lcom/belkin/utils/RateMe;

    invoke-direct {v0}, Lcom/belkin/utils/RateMe;-><init>()V

    .line 59
    .local v0, "rm":Lcom/belkin/utils/RateMe;
    iget-object v1, p0, Lcom/belkin/utils/RateMe$1;->val$ctx:Landroid/content/Context;

    iget-object v2, p0, Lcom/belkin/utils/RateMe$1;->val$mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-static {v0, v1, v2}, Lcom/belkin/utils/RateMe;->access$000(Lcom/belkin/utils/RateMe;Landroid/content/Context;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V

    .line 60
    return-void
.end method
