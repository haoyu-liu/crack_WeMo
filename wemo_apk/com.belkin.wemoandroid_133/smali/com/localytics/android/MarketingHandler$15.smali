.class Lcom/localytics/android/MarketingHandler$15;
.super Lcom/localytics/android/MarketingCallable;
.source "MarketingHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/MarketingHandler;->__showMarketingTest()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/localytics/android/MarketingHandler;

.field final synthetic val$appContext:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/localytics/android/MarketingHandler;Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 2368
    iput-object p1, p0, Lcom/localytics/android/MarketingHandler$15;->this$0:Lcom/localytics/android/MarketingHandler;

    iput-object p2, p0, Lcom/localytics/android/MarketingHandler$15;->val$appContext:Landroid/content/Context;

    invoke-direct {p0}, Lcom/localytics/android/MarketingCallable;-><init>()V

    return-void
.end method


# virtual methods
.method call([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .param p1, "params"    # [Ljava/lang/Object;

    .prologue
    const/4 v3, 0x0

    .line 2372
    aget-object v0, p1, v3

    check-cast v0, Lcom/localytics/android/MarketingMessage;

    .line 2374
    .local v0, "marketingMessage":Lcom/localytics/android/MarketingMessage;
    new-instance v1, Lcom/localytics/android/MarketingHandler$15$1;

    invoke-direct {v1, p0, v0}, Lcom/localytics/android/MarketingHandler$15$1;-><init>(Lcom/localytics/android/MarketingHandler$15;Lcom/localytics/android/MarketingMessage;)V

    const/4 v2, 0x1

    new-array v2, v2, [Lcom/localytics/android/MarketingMessage;

    aput-object v0, v2, v3

    invoke-virtual {v1, v2}, Lcom/localytics/android/MarketingHandler$15$1;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 2427
    const/4 v1, 0x0

    return-object v1
.end method
