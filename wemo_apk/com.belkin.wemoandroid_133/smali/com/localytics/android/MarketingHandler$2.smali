.class Lcom/localytics/android/MarketingHandler$2;
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


# direct methods
.method constructor <init>(Lcom/localytics/android/MarketingHandler;)V
    .locals 0

    .prologue
    .line 441
    iput-object p1, p0, Lcom/localytics/android/MarketingHandler$2;->this$0:Lcom/localytics/android/MarketingHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 445
    iget-object v0, p0, Lcom/localytics/android/MarketingHandler$2;->this$0:Lcom/localytics/android/MarketingHandler;

    invoke-static {v0}, Lcom/localytics/android/MarketingHandler;->access$100(Lcom/localytics/android/MarketingHandler;)V

    .line 446
    return-void
.end method
