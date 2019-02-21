.class Lcom/belkin/widgets/WemoWidgetConfigurationAdapter$DeviceViewHolder;
.super Ljava/lang/Object;
.source "WemoWidgetConfigurationAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DeviceViewHolder"
.end annotation


# instance fields
.field deviceIcon:Landroid/widget/ImageView;

.field name:Landroid/widget/TextView;

.field notSupportedMessage:Landroid/widget/TextView;

.field radioButton:Landroid/widget/RadioButton;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 156
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/belkin/widgets/WemoWidgetConfigurationAdapter$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/belkin/widgets/WemoWidgetConfigurationAdapter$1;

    .prologue
    .line 156
    invoke-direct {p0}, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter$DeviceViewHolder;-><init>()V

    return-void
.end method
