.class Lcom/localytics/android/MarketingHandler$12;
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

.field final synthetic val$adapter:Lcom/localytics/android/MarketingRulesAdapter;


# direct methods
.method constructor <init>(Lcom/localytics/android/MarketingHandler;Lcom/localytics/android/MarketingRulesAdapter;)V
    .locals 0

    .prologue
    .line 2280
    iput-object p1, p0, Lcom/localytics/android/MarketingHandler$12;->this$0:Lcom/localytics/android/MarketingHandler;

    iput-object p2, p0, Lcom/localytics/android/MarketingHandler$12;->val$adapter:Lcom/localytics/android/MarketingRulesAdapter;

    invoke-direct {p0}, Lcom/localytics/android/MarketingCallable;-><init>()V

    return-void
.end method


# virtual methods
.method call([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "params"    # [Ljava/lang/Object;

    .prologue
    .line 2284
    iget-object v0, p0, Lcom/localytics/android/MarketingHandler$12;->this$0:Lcom/localytics/android/MarketingHandler;

    iget-object v0, v0, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    const-string v1, "Test Mode Update Data"

    invoke-interface {v0, v1}, Lcom/localytics/android/LocalyticsDao;->tagEvent(Ljava/lang/String;)V

    .line 2285
    iget-object v0, p0, Lcom/localytics/android/MarketingHandler$12;->this$0:Lcom/localytics/android/MarketingHandler;

    iget-object v1, p0, Lcom/localytics/android/MarketingHandler$12;->val$adapter:Lcom/localytics/android/MarketingRulesAdapter;

    invoke-static {v0, v1}, Lcom/localytics/android/MarketingHandler;->access$602(Lcom/localytics/android/MarketingHandler;Lcom/localytics/android/MarketingRulesAdapter;)Lcom/localytics/android/MarketingRulesAdapter;

    .line 2286
    iget-object v0, p0, Lcom/localytics/android/MarketingHandler$12;->this$0:Lcom/localytics/android/MarketingHandler;

    iget-object v1, p0, Lcom/localytics/android/MarketingHandler$12;->this$0:Lcom/localytics/android/MarketingHandler;

    iget-object v1, v1, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v1}, Lcom/localytics/android/LocalyticsDao;->getCustomerIdInMemory()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/localytics/android/MarketingHandler;->upload(Ljava/lang/String;)V

    .line 2287
    const/4 v0, 0x0

    return-object v0
.end method
