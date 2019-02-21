.class Lcom/belkin/widgets/WemoWidgetConfigurationActivity$1;
.super Ljava/lang/Object;
.source "WemoWidgetConfigurationActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/widgets/WemoWidgetConfigurationActivity;


# direct methods
.method constructor <init>(Lcom/belkin/widgets/WemoWidgetConfigurationActivity;)V
    .locals 0

    .prologue
    .line 60
    iput-object p1, p0, Lcom/belkin/widgets/WemoWidgetConfigurationActivity$1;->this$0:Lcom/belkin/widgets/WemoWidgetConfigurationActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 63
    invoke-static {}, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->access$000()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Cancel button clicked"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    iget-object v0, p0, Lcom/belkin/widgets/WemoWidgetConfigurationActivity$1;->this$0:Lcom/belkin/widgets/WemoWidgetConfigurationActivity;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->setResult(I)V

    .line 65
    iget-object v0, p0, Lcom/belkin/widgets/WemoWidgetConfigurationActivity$1;->this$0:Lcom/belkin/widgets/WemoWidgetConfigurationActivity;

    invoke-virtual {v0}, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->finish()V

    .line 66
    return-void
.end method
