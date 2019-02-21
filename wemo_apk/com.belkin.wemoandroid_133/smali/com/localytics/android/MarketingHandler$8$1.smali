.class Lcom/localytics/android/MarketingHandler$8$1;
.super Landroid/os/AsyncTask;
.source "MarketingHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/MarketingHandler$8;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/localytics/android/MarketingHandler$8;

.field final synthetic val$campaignId:I


# direct methods
.method constructor <init>(Lcom/localytics/android/MarketingHandler$8;I)V
    .locals 0

    .prologue
    .line 2069
    iput-object p1, p0, Lcom/localytics/android/MarketingHandler$8$1;->this$1:Lcom/localytics/android/MarketingHandler$8;

    iput p2, p0, Lcom/localytics/android/MarketingHandler$8$1;->val$campaignId:I

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Boolean;
    .locals 2
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    .line 2073
    iget-object v0, p0, Lcom/localytics/android/MarketingHandler$8$1;->this$1:Lcom/localytics/android/MarketingHandler$8;

    iget-object v0, v0, Lcom/localytics/android/MarketingHandler$8;->this$0:Lcom/localytics/android/MarketingHandler;

    iget v1, p0, Lcom/localytics/android/MarketingHandler$8$1;->val$campaignId:I

    invoke-virtual {v0, v1}, Lcom/localytics/android/MarketingHandler;->setMarketingMessageAsDisplayed(I)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 2069
    check-cast p1, [Ljava/lang/Void;

    .end local p1    # "x0":[Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/localytics/android/MarketingHandler$8$1;->doInBackground([Ljava/lang/Void;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Ljava/lang/Boolean;)V
    .locals 4
    .param p1, "readyToDisplay"    # Ljava/lang/Boolean;

    .prologue
    .line 2079
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 2081
    iget-object v1, p0, Lcom/localytics/android/MarketingHandler$8$1;->this$1:Lcom/localytics/android/MarketingHandler$8;

    iget-object v1, v1, Lcom/localytics/android/MarketingHandler$8;->this$0:Lcom/localytics/android/MarketingHandler;

    invoke-static {v1}, Lcom/localytics/android/MarketingHandler;->access$300(Lcom/localytics/android/MarketingHandler;)Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 2083
    invoke-static {}, Lcom/localytics/android/MarketingDialogFragment;->newInstance()Lcom/localytics/android/MarketingDialogFragment;

    move-result-object v0

    .line 2084
    .local v0, "fragment":Lcom/localytics/android/MarketingDialogFragment;
    iget-object v1, p0, Lcom/localytics/android/MarketingHandler$8$1;->this$1:Lcom/localytics/android/MarketingHandler$8;

    iget-object v1, v1, Lcom/localytics/android/MarketingHandler$8;->val$marketingMessage:Lcom/localytics/android/MarketingMessage;

    invoke-virtual {v0, v1}, Lcom/localytics/android/MarketingDialogFragment;->setData(Lcom/localytics/android/MarketingMessage;)Lcom/localytics/android/MarketingDialogFragment;

    move-result-object v1

    iget-object v2, p0, Lcom/localytics/android/MarketingHandler$8$1;->this$1:Lcom/localytics/android/MarketingHandler$8;

    iget-object v2, v2, Lcom/localytics/android/MarketingHandler$8;->this$0:Lcom/localytics/android/MarketingHandler;

    invoke-virtual {v2}, Lcom/localytics/android/MarketingHandler;->getDialogCallbacks()Landroid/util/SparseArray;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/localytics/android/MarketingDialogFragment;->setCallbacks(Landroid/util/SparseArray;)Lcom/localytics/android/MarketingDialogFragment;

    move-result-object v1

    new-instance v2, Lcom/localytics/android/JavaScriptClient;

    iget-object v3, p0, Lcom/localytics/android/MarketingHandler$8$1;->this$1:Lcom/localytics/android/MarketingHandler$8;

    iget-object v3, v3, Lcom/localytics/android/MarketingHandler$8;->val$jsCallbacks:Landroid/util/SparseArray;

    invoke-direct {v2, v3}, Lcom/localytics/android/JavaScriptClient;-><init>(Landroid/util/SparseArray;)V

    invoke-virtual {v1, v2}, Lcom/localytics/android/MarketingDialogFragment;->setJavaScriptClient(Lcom/localytics/android/JavaScriptClient;)Lcom/localytics/android/MarketingDialogFragment;

    move-result-object v1

    iget-object v2, p0, Lcom/localytics/android/MarketingHandler$8$1;->this$1:Lcom/localytics/android/MarketingHandler$8;

    iget-object v2, v2, Lcom/localytics/android/MarketingHandler$8;->this$0:Lcom/localytics/android/MarketingHandler;

    invoke-static {v2}, Lcom/localytics/android/MarketingHandler;->access$300(Lcom/localytics/android/MarketingHandler;)Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    const-string v3, "marketing_dialog"

    invoke-virtual {v1, v2, v3}, Lcom/localytics/android/MarketingDialogFragment;->show(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V

    .line 2089
    invoke-static {}, Lcom/localytics/android/Constants;->isTestModeEnabled()Z

    move-result v1

    if-nez v1, :cond_0

    .line 2091
    iget-object v1, p0, Lcom/localytics/android/MarketingHandler$8$1;->this$1:Lcom/localytics/android/MarketingHandler$8;

    iget-object v1, v1, Lcom/localytics/android/MarketingHandler$8;->this$0:Lcom/localytics/android/MarketingHandler;

    iget-object v1, v1, Lcom/localytics/android/MarketingHandler;->listeners:Lcom/localytics/android/BaseHandler$ListenersSet;

    check-cast v1, Lcom/localytics/android/MessagingListener;

    invoke-interface {v1}, Lcom/localytics/android/MessagingListener;->localyticsWillDisplayInAppMessage()V

    .line 2098
    :cond_0
    iget-object v1, p0, Lcom/localytics/android/MarketingHandler$8$1;->this$1:Lcom/localytics/android/MarketingHandler$8;

    iget-object v1, v1, Lcom/localytics/android/MarketingHandler$8;->this$0:Lcom/localytics/android/MarketingHandler;

    invoke-static {v1}, Lcom/localytics/android/MarketingHandler;->access$300(Lcom/localytics/android/MarketingHandler;)Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentManager;->executePendingTransactions()Z

    .line 2107
    .end local v0    # "fragment":Lcom/localytics/android/MarketingDialogFragment;
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/localytics/android/MarketingHandler$8$1;->this$1:Lcom/localytics/android/MarketingHandler$8;

    iget-object v1, v1, Lcom/localytics/android/MarketingHandler$8;->this$0:Lcom/localytics/android/MarketingHandler;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/localytics/android/MarketingHandler;->access$402(Lcom/localytics/android/MarketingHandler;Z)Z

    .line 2108
    return-void

    .line 2104
    :cond_2
    iget-object v1, p0, Lcom/localytics/android/MarketingHandler$8$1;->this$1:Lcom/localytics/android/MarketingHandler$8;

    iget-object v1, v1, Lcom/localytics/android/MarketingHandler$8;->this$0:Lcom/localytics/android/MarketingHandler;

    iget v2, p0, Lcom/localytics/android/MarketingHandler$8$1;->val$campaignId:I

    invoke-static {v1, v2}, Lcom/localytics/android/MarketingHandler;->access$500(Lcom/localytics/android/MarketingHandler;I)V

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 2069
    check-cast p1, Ljava/lang/Boolean;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/localytics/android/MarketingHandler$8$1;->onPostExecute(Ljava/lang/Boolean;)V

    return-void
.end method
