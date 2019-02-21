.class Lcom/belkin/utils/WemoAP$2;
.super Ljava/lang/Object;
.source "WemoAP.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/utils/WemoAP;->showWemoAPPopup(Landroid/content/Context;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/utils/WemoAP;

.field final synthetic val$ctx:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/belkin/utils/WemoAP;Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 95
    iput-object p1, p0, Lcom/belkin/utils/WemoAP$2;->this$0:Lcom/belkin/utils/WemoAP;

    iput-object p2, p0, Lcom/belkin/utils/WemoAP$2;->val$ctx:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 97
    invoke-static {}, Lcom/belkin/utils/WemoAP;->dismiss()V

    .line 98
    iget-object v0, p0, Lcom/belkin/utils/WemoAP$2;->this$0:Lcom/belkin/utils/WemoAP;

    iget-object v1, p0, Lcom/belkin/utils/WemoAP$2;->val$ctx:Landroid/content/Context;

    invoke-static {v0, v1}, Lcom/belkin/utils/WemoAP;->access$100(Lcom/belkin/utils/WemoAP;Landroid/content/Context;)V

    .line 99
    return-void
.end method
