.class Lcom/belkin/utils/RateMe$5;
.super Ljava/lang/Object;
.source "RateMe.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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


# direct methods
.method constructor <init>(Lcom/belkin/utils/RateMe;Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 252
    iput-object p1, p0, Lcom/belkin/utils/RateMe$5;->this$0:Lcom/belkin/utils/RateMe;

    iput-object p2, p0, Lcom/belkin/utils/RateMe$5;->val$ctx:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 254
    invoke-static {}, Lcom/belkin/utils/RateMe;->dismiss()V

    .line 255
    iget-object v0, p0, Lcom/belkin/utils/RateMe$5;->val$ctx:Landroid/content/Context;

    invoke-static {v0}, Lcom/belkin/utils/RateMe;->resetFullSuccessfulDiscoveryCounter(Landroid/content/Context;)V

    .line 257
    iget-object v0, p0, Lcom/belkin/utils/RateMe$5;->this$0:Lcom/belkin/utils/RateMe;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/belkin/utils/RateMe;->access$300(Lcom/belkin/utils/RateMe;I)V

    .line 258
    return-void
.end method
