.class Lcom/localytics/android/MarketingRulesAdapter$1;
.super Ljava/lang/Object;
.source "MarketingRulesAdapter.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/MarketingRulesAdapter;->updateDataSet()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable",
        "<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/localytics/android/MarketingRulesAdapter;


# direct methods
.method constructor <init>(Lcom/localytics/android/MarketingRulesAdapter;)V
    .locals 0

    .prologue
    .line 45
    iput-object p1, p0, Lcom/localytics/android/MarketingRulesAdapter$1;->this$0:Lcom/localytics/android/MarketingRulesAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call()Ljava/lang/Boolean;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 49
    const/4 v3, 0x0

    .line 51
    .local v3, "updated":Z
    iget-object v4, p0, Lcom/localytics/android/MarketingRulesAdapter$1;->this$0:Lcom/localytics/android/MarketingRulesAdapter;

    invoke-static {v4}, Lcom/localytics/android/MarketingRulesAdapter;->access$000(Lcom/localytics/android/MarketingRulesAdapter;)Lcom/localytics/android/MarketingHandler;

    move-result-object v4

    invoke-virtual {v4}, Lcom/localytics/android/MarketingHandler;->getMarketingMessages()Ljava/util/List;

    move-result-object v2

    .line 52
    .local v2, "marketingRules":Ljava/util/List;, "Ljava/util/List<Lcom/localytics/android/MarketingMessage;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/localytics/android/MarketingMessage;

    .line 54
    .local v1, "marketingRule":Lcom/localytics/android/MarketingMessage;
    const/4 v3, 0x1

    .line 55
    iget-object v4, p0, Lcom/localytics/android/MarketingRulesAdapter$1;->this$0:Lcom/localytics/android/MarketingRulesAdapter;

    invoke-static {v4}, Lcom/localytics/android/MarketingRulesAdapter;->access$100(Lcom/localytics/android/MarketingRulesAdapter;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 58
    .end local v1    # "marketingRule":Lcom/localytics/android/MarketingMessage;
    :cond_0
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    return-object v4
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 45
    invoke-virtual {p0}, Lcom/localytics/android/MarketingRulesAdapter$1;->call()Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method
