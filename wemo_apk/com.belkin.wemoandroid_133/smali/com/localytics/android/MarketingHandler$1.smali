.class Lcom/localytics/android/MarketingHandler$1;
.super Ljava/lang/Object;
.source "MarketingHandler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/MarketingHandler;->handleMessageExtended(Landroid/os/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/localytics/android/MarketingHandler;

.field final synthetic val$attributes:Ljava/util/Map;

.field final synthetic val$event:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/localytics/android/MarketingHandler;Ljava/lang/String;Ljava/util/Map;)V
    .locals 0

    .prologue
    .line 422
    iput-object p1, p0, Lcom/localytics/android/MarketingHandler$1;->this$0:Lcom/localytics/android/MarketingHandler;

    iput-object p2, p0, Lcom/localytics/android/MarketingHandler$1;->val$event:Ljava/lang/String;

    iput-object p3, p0, Lcom/localytics/android/MarketingHandler$1;->val$attributes:Ljava/util/Map;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 426
    iget-object v0, p0, Lcom/localytics/android/MarketingHandler$1;->this$0:Lcom/localytics/android/MarketingHandler;

    iget-object v1, p0, Lcom/localytics/android/MarketingHandler$1;->val$event:Ljava/lang/String;

    iget-object v2, p0, Lcom/localytics/android/MarketingHandler$1;->val$attributes:Ljava/util/Map;

    invoke-virtual {v0, v1, v2}, Lcom/localytics/android/MarketingHandler;->_marketingTrigger(Ljava/lang/String;Ljava/util/Map;)V

    .line 427
    return-void
.end method