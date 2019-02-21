.class Lcom/localytics/android/MarketingHandler$13;
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
    .line 2293
    iput-object p1, p0, Lcom/localytics/android/MarketingHandler$13;->this$0:Lcom/localytics/android/MarketingHandler;

    iput-object p2, p0, Lcom/localytics/android/MarketingHandler$13;->val$appContext:Landroid/content/Context;

    invoke-direct {p0}, Lcom/localytics/android/MarketingCallable;-><init>()V

    return-void
.end method


# virtual methods
.method call([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "params"    # [Ljava/lang/Object;

    .prologue
    .line 2297
    new-instance v0, Lcom/localytics/android/MarketingHandler$13$1;

    invoke-direct {v0, p0}, Lcom/localytics/android/MarketingHandler$13$1;-><init>(Lcom/localytics/android/MarketingHandler$13;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/localytics/android/MarketingHandler$13$1;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 2331
    const/4 v0, 0x0

    return-object v0
.end method
