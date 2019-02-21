.class public Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;
.super Landroid/widget/BaseAdapter;
.source "WemoWidgetConfigurationAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/widgets/WemoWidgetConfigurationAdapter$DeviceViewHolder;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private context:Landroid/content/Context;

.field private data:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;"
        }
    .end annotation
.end field

.field private selectedButton:Landroid/widget/RadioButton;

.field private selectedPosition:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 25
    const-class v0, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 33
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-direct {p0, p1, v0}, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;-><init>(Landroid/content/Context;Ljava/util/List;)V

    .line 34
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/util/List;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 36
    .local p2, "data":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 37
    iput-object p1, p0, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;->context:Landroid/content/Context;

    .line 38
    const/4 v0, -0x1

    iput v0, p0, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;->selectedPosition:I

    .line 39
    invoke-virtual {p0, p2}, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;->setData(Ljava/util/List;)V

    .line 40
    return-void
.end method

.method static synthetic access$100(Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;)I
    .locals 1
    .param p0, "x0"    # Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;

    .prologue
    .line 23
    iget v0, p0, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;->selectedPosition:I

    return v0
.end method

.method static synthetic access$102(Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;I)I
    .locals 0
    .param p0, "x0"    # Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;
    .param p1, "x1"    # I

    .prologue
    .line 23
    iput p1, p0, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;->selectedPosition:I

    return p1
.end method

.method static synthetic access$200(Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;)Landroid/widget/RadioButton;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;

    .prologue
    .line 23
    iget-object v0, p0, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;->selectedButton:Landroid/widget/RadioButton;

    return-object v0
.end method

.method static synthetic access$202(Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;Landroid/widget/RadioButton;)Landroid/widget/RadioButton;
    .locals 0
    .param p0, "x0"    # Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;
    .param p1, "x1"    # Landroid/widget/RadioButton;

    .prologue
    .line 23
    iput-object p1, p0, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;->selectedButton:Landroid/widget/RadioButton;

    return-object p1
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;->data:Ljava/util/List;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;->data:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    goto :goto_0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 59
    iget-object v0, p0, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;->data:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 64
    int-to-long v0, p1

    return-wide v0
.end method

.method public getSelectedDevice()Lcom/belkin/wemo/cache/data/DeviceInformation;
    .locals 3

    .prologue
    .line 149
    const/4 v0, 0x0

    .line 150
    .local v0, "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    iget-object v1, p0, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;->data:Ljava/util/List;

    if-eqz v1, :cond_0

    iget v1, p0, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;->selectedPosition:I

    if-ltz v1, :cond_0

    iget v1, p0, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;->selectedPosition:I

    iget-object v2, p0, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;->data:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 151
    iget-object v1, p0, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;->data:Ljava/util/List;

    iget v2, p0, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;->selectedPosition:I

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    check-cast v0, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 153
    .restart local v0    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_0
    return-object v0
.end method

.method public getSelectedPosition()I
    .locals 1

    .prologue
    .line 145
    iget v0, p0, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;->selectedPosition:I

    return v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 12
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 69
    const/4 v6, 0x0

    .line 70
    .local v6, "viewHolder":Lcom/belkin/widgets/WemoWidgetConfigurationAdapter$DeviceViewHolder;
    if-nez p2, :cond_0

    .line 71
    iget-object v7, p0, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;->context:Landroid/content/Context;

    invoke-static {v7}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v4

    .line 72
    .local v4, "inflater":Landroid/view/LayoutInflater;
    const v7, 0x7f030009

    const/4 v8, 0x0

    invoke-virtual {v4, v7, p3, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    .line 73
    new-instance v6, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter$DeviceViewHolder;

    .end local v6    # "viewHolder":Lcom/belkin/widgets/WemoWidgetConfigurationAdapter$DeviceViewHolder;
    const/4 v7, 0x0

    invoke-direct {v6, v7}, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter$DeviceViewHolder;-><init>(Lcom/belkin/widgets/WemoWidgetConfigurationAdapter$1;)V

    .line 74
    .restart local v6    # "viewHolder":Lcom/belkin/widgets/WemoWidgetConfigurationAdapter$DeviceViewHolder;
    const v7, 0x7f09001e

    invoke-virtual {p2, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    iput-object v7, v6, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter$DeviceViewHolder;->name:Landroid/widget/TextView;

    .line 75
    const v7, 0x7f09001f

    invoke-virtual {p2, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/RadioButton;

    iput-object v7, v6, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter$DeviceViewHolder;->radioButton:Landroid/widget/RadioButton;

    .line 76
    const v7, 0x7f09001d

    invoke-virtual {p2, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/ImageView;

    iput-object v7, v6, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter$DeviceViewHolder;->deviceIcon:Landroid/widget/ImageView;

    .line 77
    const v7, 0x7f090020

    invoke-virtual {p2, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    iput-object v7, v6, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter$DeviceViewHolder;->notSupportedMessage:Landroid/widget/TextView;

    .line 78
    invoke-virtual {p2, v6}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 83
    .end local v4    # "inflater":Landroid/view/LayoutInflater;
    :goto_0
    iget-object v7, p0, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;->data:Ljava/util/List;

    invoke-interface {v7, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 85
    .local v0, "deviceInformation":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getGroupID()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFriendlyName()Ljava/lang/String;

    move-result-object v5

    .line 87
    .local v5, "name":Ljava/lang/String;
    :goto_1
    iget-object v7, v6, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter$DeviceViewHolder;->name:Landroid/widget/TextView;

    invoke-virtual {v7, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 89
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getGroupID()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIcon()Ljava/lang/String;

    move-result-object v1

    .line 91
    .local v1, "icon":Ljava/lang/String;
    :goto_2
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_3

    const/4 v3, 0x0

    .line 92
    .local v3, "iconFile":Ljava/io/File;
    :goto_3
    if-eqz v3, :cond_4

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v7

    if-eqz v7, :cond_4

    .line 93
    iget-object v7, v6, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter$DeviceViewHolder;->deviceIcon:Landroid/widget/ImageView;

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/ImageView;->setImageURI(Landroid/net/Uri;)V

    .line 107
    :goto_4
    invoke-static {v0}, Lcom/belkin/widgets/WidgetUtil;->supportsWidgets(Lcom/belkin/wemo/cache/data/DeviceInformation;)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 108
    iget-object v7, v6, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter$DeviceViewHolder;->notSupportedMessage:Landroid/widget/TextView;

    const/16 v8, 0x8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 109
    iget-object v7, v6, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter$DeviceViewHolder;->radioButton:Landroid/widget/RadioButton;

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Landroid/widget/RadioButton;->setVisibility(I)V

    .line 110
    iget-object v7, v6, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter$DeviceViewHolder;->deviceIcon:Landroid/widget/ImageView;

    const/high16 v8, 0x3f800000    # 1.0f

    invoke-virtual {v7, v8}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 111
    new-instance v7, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter$1;

    invoke-direct {v7, p0, p1}, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter$1;-><init>(Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;I)V

    invoke-virtual {p2, v7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 132
    :goto_5
    iget-object v7, v6, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter$DeviceViewHolder;->radioButton:Landroid/widget/RadioButton;

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Landroid/widget/RadioButton;->setClickable(Z)V

    .line 134
    iget v7, p0, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;->selectedPosition:I

    if-eq v7, p1, :cond_7

    .line 135
    iget-object v7, v6, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter$DeviceViewHolder;->radioButton:Landroid/widget/RadioButton;

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 141
    :goto_6
    return-object p2

    .line 80
    .end local v0    # "deviceInformation":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v1    # "icon":Ljava/lang/String;
    .end local v3    # "iconFile":Ljava/io/File;
    .end local v5    # "name":Ljava/lang/String;
    :cond_0
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v6

    .end local v6    # "viewHolder":Lcom/belkin/widgets/WemoWidgetConfigurationAdapter$DeviceViewHolder;
    check-cast v6, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter$DeviceViewHolder;

    .restart local v6    # "viewHolder":Lcom/belkin/widgets/WemoWidgetConfigurationAdapter$DeviceViewHolder;
    goto :goto_0

    .line 85
    .restart local v0    # "deviceInformation":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_1
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getGroupName()Ljava/lang/String;

    move-result-object v5

    goto :goto_1

    .line 89
    .restart local v5    # "name":Ljava/lang/String;
    :cond_2
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getGroupIcon()Ljava/lang/String;

    move-result-object v1

    goto :goto_2

    .line 91
    .restart local v1    # "icon":Ljava/lang/String;
    :cond_3
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    goto :goto_3

    .line 96
    .restart local v3    # "iconFile":Ljava/io/File;
    :cond_4
    iget-object v7, p0, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;->context:Landroid/content/Context;

    invoke-static {v7, v0}, Lcom/belkin/widgets/WidgetUtil;->getDefaultDeviceIcon(Landroid/content/Context;Lcom/belkin/wemo/cache/data/DeviceInformation;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 97
    .local v2, "iconDrawable":Landroid/graphics/drawable/Drawable;
    if-eqz v2, :cond_5

    .line 98
    iget-object v7, v6, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter$DeviceViewHolder;->deviceIcon:Landroid/widget/ImageView;

    invoke-virtual {v7, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_4

    .line 100
    :cond_5
    sget-object v7, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;->TAG:Ljava/lang/String;

    const-string v8, "Unable to find default icon for device with udn, type: %s, %s"

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    const/4 v10, 0x1

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getType()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4

    .line 124
    .end local v2    # "iconDrawable":Landroid/graphics/drawable/Drawable;
    :cond_6
    iget-object v7, v6, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter$DeviceViewHolder;->notSupportedMessage:Landroid/widget/TextView;

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 125
    iget-object v7, v6, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter$DeviceViewHolder;->radioButton:Landroid/widget/RadioButton;

    const/16 v8, 0x8

    invoke-virtual {v7, v8}, Landroid/widget/RadioButton;->setVisibility(I)V

    .line 126
    iget-object v7, v6, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter$DeviceViewHolder;->deviceIcon:Landroid/widget/ImageView;

    const v8, 0x3f266666    # 0.65f

    invoke-virtual {v7, v8}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 127
    const/4 v7, 0x0

    invoke-virtual {p2, v7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_5

    .line 137
    :cond_7
    iget-object v7, v6, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter$DeviceViewHolder;->radioButton:Landroid/widget/RadioButton;

    const/4 v8, 0x1

    invoke-virtual {v7, v8}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 138
    iget-object v7, v6, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter$DeviceViewHolder;->radioButton:Landroid/widget/RadioButton;

    iput-object v7, p0, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;->selectedButton:Landroid/widget/RadioButton;

    goto :goto_6
.end method

.method public setData(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 43
    .local p1, "data":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    iput-object p1, p0, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;->data:Ljava/util/List;

    .line 46
    iget v0, p0, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;->selectedPosition:I

    if-ltz v0, :cond_0

    iget v0, p0, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;->selectedPosition:I

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    iget v0, p0, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;->selectedPosition:I

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-static {v0}, Lcom/belkin/widgets/WidgetUtil;->supportsWidgets(Lcom/belkin/wemo/cache/data/DeviceInformation;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 47
    :cond_0
    invoke-static {p1}, Lcom/belkin/widgets/WidgetUtil;->getFirstSupportedDeviceIndex(Ljava/util/List;)I

    move-result v0

    iput v0, p0, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;->selectedPosition:I

    .line 49
    :cond_1
    invoke-virtual {p0}, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;->notifyDataSetChanged()V

    .line 50
    return-void
.end method
