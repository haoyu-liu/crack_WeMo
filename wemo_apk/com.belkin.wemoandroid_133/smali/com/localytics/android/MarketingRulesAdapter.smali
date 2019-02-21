.class final Lcom/localytics/android/MarketingRulesAdapter;
.super Landroid/widget/BaseAdapter;
.source "MarketingRulesAdapter.java"


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mHandler:Lcom/localytics/android/MarketingHandler;

.field private final mMarketingRules:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/localytics/android/MarketingMessage;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/localytics/android/MarketingHandler;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "handler"    # Lcom/localytics/android/MarketingHandler;

    .prologue
    .line 34
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 35
    iput-object p1, p0, Lcom/localytics/android/MarketingRulesAdapter;->mContext:Landroid/content/Context;

    .line 36
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/localytics/android/MarketingRulesAdapter;->mMarketingRules:Ljava/util/List;

    .line 37
    iput-object p2, p0, Lcom/localytics/android/MarketingRulesAdapter;->mHandler:Lcom/localytics/android/MarketingHandler;

    .line 38
    return-void
.end method

.method static synthetic access$000(Lcom/localytics/android/MarketingRulesAdapter;)Lcom/localytics/android/MarketingHandler;
    .locals 1
    .param p0, "x0"    # Lcom/localytics/android/MarketingRulesAdapter;

    .prologue
    .line 24
    iget-object v0, p0, Lcom/localytics/android/MarketingRulesAdapter;->mHandler:Lcom/localytics/android/MarketingHandler;

    return-object v0
.end method

.method static synthetic access$100(Lcom/localytics/android/MarketingRulesAdapter;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/localytics/android/MarketingRulesAdapter;

    .prologue
    .line 24
    iget-object v0, p0, Lcom/localytics/android/MarketingRulesAdapter;->mMarketingRules:Ljava/util/List;

    return-object v0
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 90
    iget-object v0, p0, Lcom/localytics/android/MarketingRulesAdapter;->mMarketingRules:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # I

    .prologue
    .line 24
    invoke-virtual {p0, p1}, Lcom/localytics/android/MarketingRulesAdapter;->getItem(I)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getItem(I)Ljava/util/Map;
    .locals 1
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 96
    iget-object v0, p0, Lcom/localytics/android/MarketingRulesAdapter;->mMarketingRules:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    return-object v0
.end method

.method public getItemId(I)J
    .locals 4
    .param p1, "position"    # I

    .prologue
    .line 102
    iget-object v1, p0, Lcom/localytics/android/MarketingRulesAdapter;->mMarketingRules:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/localytics/android/MarketingMessage;

    const-string v2, "campaign_id"

    invoke-virtual {v1, v2}, Lcom/localytics/android/MarketingMessage;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 103
    .local v0, "id":I
    int-to-long v2, v0

    return-wide v2
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 12
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v11, 0x0

    const/4 v10, -0x1

    const/4 v7, -0x2

    const/high16 v9, -0x1000000

    const/4 v8, 0x1

    .line 109
    move-object v5, p2

    .line 111
    .local v5, "view":Landroid/view/View;
    if-nez v5, :cond_0

    .line 114
    new-instance v2, Landroid/widget/LinearLayout;

    iget-object v6, p0, Lcom/localytics/android/MarketingRulesAdapter;->mContext:Landroid/content/Context;

    invoke-direct {v2, v6}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 115
    .local v2, "rootLayout":Landroid/widget/LinearLayout;
    new-instance v6, Landroid/widget/AbsListView$LayoutParams;

    invoke-direct {v6, v10, v7}, Landroid/widget/AbsListView$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v6}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 116
    invoke-virtual {v2, v11}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 119
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v6, p0, Lcom/localytics/android/MarketingRulesAdapter;->mContext:Landroid/content/Context;

    invoke-direct {v0, v6}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 120
    .local v0, "layout":Landroid/widget/LinearLayout;
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v6, v10, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 121
    const/16 v6, 0x10

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 122
    invoke-virtual {v0, v8}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 123
    iget-object v6, p0, Lcom/localytics/android/MarketingRulesAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v6

    iget v6, v6, Landroid/util/DisplayMetrics;->density:F

    const/high16 v7, 0x41000000    # 8.0f

    mul-float/2addr v6, v7

    const/high16 v7, 0x3f000000    # 0.5f

    add-float/2addr v6, v7

    float-to-int v1, v6

    .line 124
    .local v1, "padding":I
    shl-int/lit8 v6, v1, 0x1

    shl-int/lit8 v7, v1, 0x1

    invoke-virtual {v0, v6, v1, v7, v1}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 125
    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 128
    new-instance v3, Landroid/widget/TextView;

    iget-object v6, p0, Lcom/localytics/android/MarketingRulesAdapter;->mContext:Landroid/content/Context;

    invoke-direct {v3, v6}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 129
    .local v3, "ruleId":Landroid/widget/TextView;
    invoke-virtual {v3, v8}, Landroid/widget/TextView;->setId(I)V

    .line 130
    const/high16 v6, 0x41800000    # 16.0f

    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setTextSize(F)V

    .line 131
    invoke-virtual {v3, v9}, Landroid/widget/TextView;->setTextColor(I)V

    .line 132
    new-instance v4, Landroid/widget/TextView;

    iget-object v6, p0, Lcom/localytics/android/MarketingRulesAdapter;->mContext:Landroid/content/Context;

    invoke-direct {v4, v6}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 133
    .local v4, "ruleName":Landroid/widget/TextView;
    const/4 v6, 0x2

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setId(I)V

    .line 134
    const/high16 v6, 0x41c00000    # 24.0f

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setTextSize(F)V

    .line 135
    invoke-virtual {v4, v9}, Landroid/widget/TextView;->setTextColor(I)V

    .line 138
    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 139
    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 142
    move-object v5, v2

    .line 146
    .end local v0    # "layout":Landroid/widget/LinearLayout;
    .end local v1    # "padding":I
    .end local v2    # "rootLayout":Landroid/widget/LinearLayout;
    .end local v3    # "ruleId":Landroid/widget/TextView;
    .end local v4    # "ruleName":Landroid/widget/TextView;
    :cond_0
    invoke-virtual {v5, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 147
    .restart local v3    # "ruleId":Landroid/widget/TextView;
    const/4 v6, 0x2

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 149
    .restart local v4    # "ruleName":Landroid/widget/TextView;
    const-string v6, "Campaign ID: %d"

    new-array v7, v8, [Ljava/lang/Object;

    invoke-virtual {p0, p1}, Lcom/localytics/android/MarketingRulesAdapter;->getItemId(I)J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    aput-object v8, v7, v11

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 150
    invoke-virtual {p0, p1}, Lcom/localytics/android/MarketingRulesAdapter;->getItem(I)Ljava/util/Map;

    move-result-object v6

    const-string v7, "rule_name_non_unique"

    invoke-interface {v6, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 152
    return-object v5
.end method

.method updateDataSet()Z
    .locals 3

    .prologue
    .line 42
    iget-object v2, p0, Lcom/localytics/android/MarketingRulesAdapter;->mMarketingRules:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 44
    new-instance v1, Ljava/util/concurrent/FutureTask;

    new-instance v2, Lcom/localytics/android/MarketingRulesAdapter$1;

    invoke-direct {v2, p0}, Lcom/localytics/android/MarketingRulesAdapter$1;-><init>(Lcom/localytics/android/MarketingRulesAdapter;)V

    invoke-direct {v1, v2}, Ljava/util/concurrent/FutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    .line 62
    .local v1, "fTask":Ljava/util/concurrent/FutureTask;, "Ljava/util/concurrent/FutureTask<Ljava/lang/Boolean;>;"
    new-instance v2, Lcom/localytics/android/MarketingRulesAdapter$2;

    invoke-direct {v2, p0, v1}, Lcom/localytics/android/MarketingRulesAdapter$2;-><init>(Lcom/localytics/android/MarketingRulesAdapter;Ljava/util/concurrent/FutureTask;)V

    invoke-virtual {v2}, Lcom/localytics/android/MarketingRulesAdapter$2;->start()V

    .line 79
    :try_start_0
    invoke-virtual {v1}, Ljava/util/concurrent/FutureTask;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 83
    :goto_0
    return v2

    .line 81
    :catch_0
    move-exception v0

    .line 83
    .local v0, "e":Ljava/lang/Exception;
    const/4 v2, 0x0

    goto :goto_0
.end method
