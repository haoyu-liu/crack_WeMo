.class Lcom/belkin/utils/RateMe$4;
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
    .line 241
    iput-object p1, p0, Lcom/belkin/utils/RateMe$4;->this$0:Lcom/belkin/utils/RateMe;

    iput-object p2, p0, Lcom/belkin/utils/RateMe$4;->val$ctx:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 243
    invoke-static {}, Lcom/belkin/utils/RateMe;->dismiss()V

    .line 244
    iget-object v0, p0, Lcom/belkin/utils/RateMe$4;->this$0:Lcom/belkin/utils/RateMe;

    iget-object v1, p0, Lcom/belkin/utils/RateMe$4;->val$ctx:Landroid/content/Context;

    invoke-static {v0, v1}, Lcom/belkin/utils/RateMe;->access$400(Lcom/belkin/utils/RateMe;Landroid/content/Context;)V

    .line 246
    iget-object v0, p0, Lcom/belkin/utils/RateMe$4;->this$0:Lcom/belkin/utils/RateMe;

    const/4 v1, 0x3

    invoke-static {v0, v1}, Lcom/belkin/utils/RateMe;->access$300(Lcom/belkin/utils/RateMe;I)V

    .line 247
    iget-object v0, p0, Lcom/belkin/utils/RateMe$4;->val$ctx:Landroid/content/Context;

    check-cast v0, Lorg/apache/cordova/CordovaActivity;

    const-string v1, "file:///android_asset/www/more/more_menu.html"

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CordovaActivity;->loadUrl(Ljava/lang/String;)V

    .line 248
    return-void
.end method
