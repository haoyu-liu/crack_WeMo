.class public Lcom/belkin/widgets/WemoWidgetConfigurationActivity;
.super Landroid/app/Activity;
.source "WemoWidgetConfigurationActivity.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private adapter:Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;

.field private appWidgetId:I

.field private cancelButton:Landroid/widget/ImageView;

.field private devicesForWidgetListView:Landroid/widget/ListView;

.field private nextButton:Landroid/widget/ImageView;

.field private noDevicesTextView:Landroid/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 24
    const-class v0, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .prologue
    .line 22
    sget-object v0, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/belkin/widgets/WemoWidgetConfigurationActivity;)Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/widgets/WemoWidgetConfigurationActivity;

    .prologue
    .line 22
    iget-object v0, p0, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->adapter:Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;

    return-object v0
.end method

.method static synthetic access$200(Lcom/belkin/widgets/WemoWidgetConfigurationActivity;)I
    .locals 1
    .param p0, "x0"    # Lcom/belkin/widgets/WemoWidgetConfigurationActivity;

    .prologue
    .line 22
    iget v0, p0, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->appWidgetId:I

    return v0
.end method

.method private toggleDeviceListForWidgetVisibility(Z)V
    .locals 4
    .param p1, "show"    # Z

    .prologue
    const/16 v2, 0x8

    const/4 v1, 0x0

    .line 144
    iget-object v3, p0, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->devicesForWidgetListView:Landroid/widget/ListView;

    if-eqz p1, :cond_0

    move v0, v1

    :goto_0
    invoke-virtual {v3, v0}, Landroid/widget/ListView;->setVisibility(I)V

    .line 145
    iget-object v0, p0, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->noDevicesTextView:Landroid/widget/TextView;

    if-eqz p1, :cond_1

    :goto_1
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 146
    return-void

    :cond_0
    move v0, v2

    .line 144
    goto :goto_0

    :cond_1
    move v2, v1

    .line 145
    goto :goto_1
.end method


# virtual methods
.method public getWidgetProvider()Lcom/belkin/widgets/WemoWidgetProvider;
    .locals 5

    .prologue
    .line 35
    iget v2, p0, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->appWidgetId:I

    invoke-static {p0, v2}, Lcom/belkin/widgets/WidgetUtil;->getProviderClassForWidget(Landroid/content/Context;I)Ljava/lang/Class;

    move-result-object v1

    .line 38
    .local v1, "providerClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/belkin/widgets/WemoWidgetProvider;>;"
    :try_start_0
    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/belkin/widgets/WemoWidgetProvider;
    :try_end_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1

    .line 45
    :goto_0
    return-object v2

    .line 39
    :catch_0
    move-exception v0

    .line 40
    .local v0, "e":Ljava/lang/InstantiationException;
    sget-object v2, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unable to instantiate widget provider: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .end local v0    # "e":Ljava/lang/InstantiationException;
    :goto_1
    new-instance v2, Lcom/belkin/widgets/WemoOneByOneWidgetProvider;

    invoke-direct {v2}, Lcom/belkin/widgets/WemoOneByOneWidgetProvider;-><init>()V

    goto :goto_0

    .line 41
    :catch_1
    move-exception v0

    .line 42
    .local v0, "e":Ljava/lang/IllegalAccessException;
    sget-object v2, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "WidgetProvider constructor is not accessible for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 50
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 51
    sget-object v1, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->TAG:Ljava/lang/String;

    const-string v2, "Activity Lifecycle: onCreate"

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    const v1, 0x7f030008

    invoke-virtual {p0, v1}, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->setContentView(I)V

    .line 59
    const v1, 0x7f090019

    invoke-virtual {p0, v1}, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->cancelButton:Landroid/widget/ImageView;

    .line 60
    iget-object v1, p0, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->cancelButton:Landroid/widget/ImageView;

    new-instance v2, Lcom/belkin/widgets/WemoWidgetConfigurationActivity$1;

    invoke-direct {v2, p0}, Lcom/belkin/widgets/WemoWidgetConfigurationActivity$1;-><init>(Lcom/belkin/widgets/WemoWidgetConfigurationActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 68
    const v1, 0x7f09001a

    invoke-virtual {p0, v1}, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->nextButton:Landroid/widget/ImageView;

    .line 69
    iget-object v1, p0, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->nextButton:Landroid/widget/ImageView;

    new-instance v2, Lcom/belkin/widgets/WemoWidgetConfigurationActivity$2;

    invoke-direct {v2, p0}, Lcom/belkin/widgets/WemoWidgetConfigurationActivity$2;-><init>(Lcom/belkin/widgets/WemoWidgetConfigurationActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 103
    const v1, 0x7f09001b

    invoke-virtual {p0, v1}, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ListView;

    iput-object v1, p0, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->devicesForWidgetListView:Landroid/widget/ListView;

    .line 104
    new-instance v1, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;

    invoke-direct {v1, p0}, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->adapter:Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;

    .line 105
    iget-object v1, p0, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->devicesForWidgetListView:Landroid/widget/ListView;

    iget-object v2, p0, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->adapter:Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 107
    const v1, 0x7f09001c

    invoke-virtual {p0, v1}, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->noDevicesTextView:Landroid/widget/TextView;

    .line 109
    invoke-virtual {p0}, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 110
    .local v0, "extras":Landroid/os/Bundle;
    if-eqz v0, :cond_0

    .line 111
    const-string v1, "appWidgetId"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->appWidgetId:I

    .line 114
    :cond_0
    iget v1, p0, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->appWidgetId:I

    if-nez v1, :cond_1

    .line 115
    sget-object v1, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->TAG:Ljava/lang/String;

    const-string v2, "Invalid appWidget Id"

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    invoke-virtual {p0}, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->finish()V

    .line 120
    :goto_0
    return-void

    .line 118
    :cond_1
    sget-object v1, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "appWidget Id: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->appWidgetId:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected onPause()V
    .locals 2

    .prologue
    .line 138
    sget-object v0, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->TAG:Ljava/lang/String;

    const-string v1, "Activity Lifecycle: onPause"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 139
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->setResult(I)V

    .line 140
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 141
    return-void
.end method

.method protected onResume()V
    .locals 3

    .prologue
    .line 124
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 125
    sget-object v1, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->TAG:Ljava/lang/String;

    const-string v2, "Activity Lifecycle: onResume"

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    invoke-static {p0}, Lcom/belkin/controller/WidgetController;->getInstance(Landroid/content/Context;)Lcom/belkin/controller/WidgetController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/belkin/controller/WidgetController;->getDeviceList()Ljava/util/List;

    move-result-object v0

    .line 128
    .local v0, "deviceList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 129
    iget-object v1, p0, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->adapter:Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;

    invoke-virtual {v1, v0}, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;->setData(Ljava/util/List;)V

    .line 130
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->toggleDeviceListForWidgetVisibility(Z)V

    .line 134
    :goto_0
    return-void

    .line 132
    :cond_0
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->toggleDeviceListForWidgetVisibility(Z)V

    goto :goto_0
.end method
