.class Lcom/belkin/widgets/WemoWidgetConfigurationAdapter$1;
.super Ljava/lang/Object;
.source "WemoWidgetConfigurationAdapter.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;

.field final synthetic val$position:I


# direct methods
.method constructor <init>(Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;I)V
    .locals 0

    .prologue
    .line 111
    iput-object p1, p0, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter$1;->this$0:Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;

    iput p2, p0, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter$1;->val$position:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 114
    iget-object v1, p0, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter$1;->this$0:Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;

    invoke-static {v1}, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;->access$100(Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;)I

    move-result v1

    iget v2, p0, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter$1;->val$position:I

    if-eq v1, v2, :cond_0

    iget-object v1, p0, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter$1;->this$0:Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;

    invoke-static {v1}, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;->access$200(Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;)Landroid/widget/RadioButton;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 115
    iget-object v1, p0, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter$1;->this$0:Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;

    invoke-static {v1}, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;->access$200(Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;)Landroid/widget/RadioButton;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 117
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter$DeviceViewHolder;

    .line 118
    .local v0, "holder":Lcom/belkin/widgets/WemoWidgetConfigurationAdapter$DeviceViewHolder;
    iget-object v1, v0, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter$DeviceViewHolder;->radioButton:Landroid/widget/RadioButton;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 119
    iget-object v1, p0, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter$1;->this$0:Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;

    iget v2, p0, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter$1;->val$position:I

    invoke-static {v1, v2}, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;->access$102(Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;I)I

    .line 120
    iget-object v1, p0, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter$1;->this$0:Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;

    iget-object v2, v0, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter$DeviceViewHolder;->radioButton:Landroid/widget/RadioButton;

    invoke-static {v1, v2}, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;->access$202(Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;Landroid/widget/RadioButton;)Landroid/widget/RadioButton;

    .line 121
    return-void
.end method
