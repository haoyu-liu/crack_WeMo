.class Lcom/localytics/android/MarketingHandler$3;
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

.field final synthetic val$intent:Landroid/content/Intent;


# direct methods
.method constructor <init>(Lcom/localytics/android/MarketingHandler;Landroid/content/Intent;)V
    .locals 0

    .prologue
    .line 457
    iput-object p1, p0, Lcom/localytics/android/MarketingHandler$3;->this$0:Lcom/localytics/android/MarketingHandler;

    iput-object p2, p0, Lcom/localytics/android/MarketingHandler$3;->val$intent:Landroid/content/Intent;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 461
    iget-object v0, p0, Lcom/localytics/android/MarketingHandler$3;->this$0:Lcom/localytics/android/MarketingHandler;

    iget-object v1, p0, Lcom/localytics/android/MarketingHandler$3;->val$intent:Landroid/content/Intent;

    invoke-static {v0, v1}, Lcom/localytics/android/MarketingHandler;->access$200(Lcom/localytics/android/MarketingHandler;Landroid/content/Intent;)V

    .line 462
    return-void
.end method
