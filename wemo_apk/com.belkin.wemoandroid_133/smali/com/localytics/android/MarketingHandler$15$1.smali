.class Lcom/localytics/android/MarketingHandler$15$1;
.super Landroid/os/AsyncTask;
.source "MarketingHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/MarketingHandler$15;->call([Ljava/lang/Object;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Lcom/localytics/android/MarketingMessage;",
        "Ljava/lang/Void;",
        "[",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/localytics/android/MarketingHandler$15;

.field final synthetic val$marketingMessage:Lcom/localytics/android/MarketingMessage;


# direct methods
.method constructor <init>(Lcom/localytics/android/MarketingHandler$15;Lcom/localytics/android/MarketingMessage;)V
    .locals 0

    .prologue
    .line 2375
    iput-object p1, p0, Lcom/localytics/android/MarketingHandler$15$1;->this$1:Lcom/localytics/android/MarketingHandler$15;

    iput-object p2, p0, Lcom/localytics/android/MarketingHandler$15$1;->val$marketingMessage:Lcom/localytics/android/MarketingMessage;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 2375
    check-cast p1, [Lcom/localytics/android/MarketingMessage;

    .end local p1    # "x0":[Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/localytics/android/MarketingHandler$15$1;->doInBackground([Lcom/localytics/android/MarketingMessage;)[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Lcom/localytics/android/MarketingMessage;)[Ljava/lang/Object;
    .locals 5
    .param p1, "params"    # [Lcom/localytics/android/MarketingMessage;

    .prologue
    const/4 v1, 0x0

    const/4 v4, 0x0

    .line 2390
    const/4 v0, 0x2

    new-array v2, v0, [Ljava/lang/Object;

    iget-object v0, p0, Lcom/localytics/android/MarketingHandler$15$1;->this$1:Lcom/localytics/android/MarketingHandler$15;

    iget-object v0, v0, Lcom/localytics/android/MarketingHandler$15;->this$0:Lcom/localytics/android/MarketingHandler;

    aget-object v3, p1, v4

    invoke-static {v0, v3}, Lcom/localytics/android/MarketingHandler;->access$900(Lcom/localytics/android/MarketingHandler;Lcom/localytics/android/MarketingMessage;)Z

    move-result v0

    if-eqz v0, :cond_0

    aget-object v0, p1, v4

    :goto_0
    aput-object v0, v2, v4

    const/4 v0, 0x1

    iget-object v3, p0, Lcom/localytics/android/MarketingHandler$15$1;->this$1:Lcom/localytics/android/MarketingHandler$15;

    iget-object v3, v3, Lcom/localytics/android/MarketingHandler$15;->this$0:Lcom/localytics/android/MarketingHandler;

    invoke-static {v3, v1}, Lcom/localytics/android/MarketingHandler;->access$1000(Lcom/localytics/android/MarketingHandler;Ljava/util/Map;)Landroid/util/SparseArray;

    move-result-object v1

    aput-object v1, v2, v0

    return-object v2

    :cond_0
    move-object v0, v1

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 2375
    check-cast p1, [Ljava/lang/Object;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/localytics/android/MarketingHandler$15$1;->onPostExecute([Ljava/lang/Object;)V

    return-void
.end method

.method protected onPostExecute([Ljava/lang/Object;)V
    .locals 8
    .param p1, "results"    # [Ljava/lang/Object;

    .prologue
    const/4 v4, 0x0

    .line 2396
    aget-object v3, p1, v4

    check-cast v3, Lcom/localytics/android/MarketingMessage;

    .line 2397
    .local v3, "marketingMessage":Lcom/localytics/android/MarketingMessage;
    const/4 v4, 0x1

    aget-object v2, p1, v4

    check-cast v2, Landroid/util/SparseArray;

    .line 2400
    .local v2, "jsCallbacks":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/localytics/android/MarketingCallable;>;"
    if-nez v3, :cond_1

    .line 2402
    :try_start_0
    iget-object v4, p0, Lcom/localytics/android/MarketingHandler$15$1;->this$1:Lcom/localytics/android/MarketingHandler$15;

    iget-object v4, v4, Lcom/localytics/android/MarketingHandler$15;->val$appContext:Landroid/content/Context;

    const-string v5, "The downloaded campaign file is broken."

    const/4 v6, 0x0

    invoke-static {v4, v5, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    .line 2425
    :cond_0
    :goto_0
    return-void

    .line 2406
    :cond_1
    iget-object v4, p0, Lcom/localytics/android/MarketingHandler$15$1;->this$1:Lcom/localytics/android/MarketingHandler$15;

    iget-object v4, v4, Lcom/localytics/android/MarketingHandler$15;->this$0:Lcom/localytics/android/MarketingHandler;

    invoke-static {v4}, Lcom/localytics/android/MarketingHandler;->access$300(Lcom/localytics/android/MarketingHandler;)Landroid/support/v4/app/FragmentManager;

    move-result-object v4

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/localytics/android/MarketingHandler$15$1;->this$1:Lcom/localytics/android/MarketingHandler$15;

    iget-object v4, v4, Lcom/localytics/android/MarketingHandler$15;->this$0:Lcom/localytics/android/MarketingHandler;

    invoke-static {v4}, Lcom/localytics/android/MarketingHandler;->access$300(Lcom/localytics/android/MarketingHandler;)Landroid/support/v4/app/FragmentManager;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "marketing_dialog"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "campaign_id"

    invoke-virtual {v3, v6}, Lcom/localytics/android/MarketingMessage;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v4

    if-nez v4, :cond_0

    .line 2411
    invoke-static {}, Lcom/localytics/android/MarketingDialogFragment;->newInstance()Lcom/localytics/android/MarketingDialogFragment;

    move-result-object v1

    .line 2412
    .local v1, "fragment":Lcom/localytics/android/MarketingDialogFragment;
    const/4 v4, 0x0

    invoke-virtual {v1, v4}, Lcom/localytics/android/MarketingDialogFragment;->setRetainInstance(Z)V

    .line 2413
    invoke-virtual {v1, v3}, Lcom/localytics/android/MarketingDialogFragment;->setData(Lcom/localytics/android/MarketingMessage;)Lcom/localytics/android/MarketingDialogFragment;

    move-result-object v4

    iget-object v5, p0, Lcom/localytics/android/MarketingHandler$15$1;->this$1:Lcom/localytics/android/MarketingHandler$15;

    iget-object v5, v5, Lcom/localytics/android/MarketingHandler$15;->this$0:Lcom/localytics/android/MarketingHandler;

    invoke-virtual {v5}, Lcom/localytics/android/MarketingHandler;->getDialogCallbacks()Landroid/util/SparseArray;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/localytics/android/MarketingDialogFragment;->setCallbacks(Landroid/util/SparseArray;)Lcom/localytics/android/MarketingDialogFragment;

    move-result-object v4

    new-instance v5, Lcom/localytics/android/JavaScriptClient;

    invoke-direct {v5, v2}, Lcom/localytics/android/JavaScriptClient;-><init>(Landroid/util/SparseArray;)V

    invoke-virtual {v4, v5}, Lcom/localytics/android/MarketingDialogFragment;->setJavaScriptClient(Lcom/localytics/android/JavaScriptClient;)Lcom/localytics/android/MarketingDialogFragment;

    move-result-object v4

    iget-object v5, p0, Lcom/localytics/android/MarketingHandler$15$1;->this$1:Lcom/localytics/android/MarketingHandler$15;

    iget-object v5, v5, Lcom/localytics/android/MarketingHandler$15;->this$0:Lcom/localytics/android/MarketingHandler;

    invoke-static {v5}, Lcom/localytics/android/MarketingHandler;->access$300(Lcom/localytics/android/MarketingHandler;)Landroid/support/v4/app/FragmentManager;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "marketing_dialog"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "campaign_id"

    invoke-virtual {v3, v7}, Lcom/localytics/android/MarketingMessage;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lcom/localytics/android/MarketingDialogFragment;->show(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V

    .line 2419
    iget-object v4, p0, Lcom/localytics/android/MarketingHandler$15$1;->this$1:Lcom/localytics/android/MarketingHandler$15;

    iget-object v4, v4, Lcom/localytics/android/MarketingHandler$15;->this$0:Lcom/localytics/android/MarketingHandler;

    invoke-static {v4}, Lcom/localytics/android/MarketingHandler;->access$300(Lcom/localytics/android/MarketingHandler;)Landroid/support/v4/app/FragmentManager;

    move-result-object v4

    invoke-virtual {v4}, Landroid/support/v4/app/FragmentManager;->executePendingTransactions()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 2421
    .end local v1    # "fragment":Lcom/localytics/android/MarketingDialogFragment;
    :catch_0
    move-exception v0

    .line 2423
    .local v0, "e":Ljava/lang/Exception;
    const-class v4, Ljava/lang/RuntimeException;

    const-string v5, "Localytics library threw an uncaught exception"

    invoke-static {v4, v5, v0}, Lcom/localytics/android/LocalyticsManager;->throwOrLogError(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Exception;)Ljava/lang/Object;

    goto/16 :goto_0
.end method

.method protected onPreExecute()V
    .locals 5

    .prologue
    .line 2379
    iget-object v2, p0, Lcom/localytics/android/MarketingHandler$15$1;->val$marketingMessage:Lcom/localytics/android/MarketingMessage;

    const-string v3, "_id"

    invoke-virtual {v2, v3}, Lcom/localytics/android/MarketingMessage;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 2380
    .local v1, "ruleId":I
    iget-object v2, p0, Lcom/localytics/android/MarketingHandler$15$1;->this$1:Lcom/localytics/android/MarketingHandler$15;

    iget-object v2, v2, Lcom/localytics/android/MarketingHandler$15;->this$0:Lcom/localytics/android/MarketingHandler;

    iget-object v3, p0, Lcom/localytics/android/MarketingHandler$15$1;->val$marketingMessage:Lcom/localytics/android/MarketingMessage;

    invoke-static {v2, v3}, Lcom/localytics/android/MarketingHandler;->access$700(Lcom/localytics/android/MarketingHandler;Lcom/localytics/android/MarketingMessage;)Ljava/lang/String;

    move-result-object v2

    const-string v3, ".zip"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    .line 2381
    .local v0, "isZipped":Z
    iget-object v2, p0, Lcom/localytics/android/MarketingHandler$15$1;->this$1:Lcom/localytics/android/MarketingHandler$15;

    iget-object v2, v2, Lcom/localytics/android/MarketingHandler$15;->this$0:Lcom/localytics/android/MarketingHandler;

    invoke-static {v2, v1, v0}, Lcom/localytics/android/MarketingHandler;->access$800(Lcom/localytics/android/MarketingHandler;IZ)Z

    move-result v2

    if-nez v2, :cond_0

    .line 2383
    iget-object v2, p0, Lcom/localytics/android/MarketingHandler$15$1;->this$1:Lcom/localytics/android/MarketingHandler$15;

    iget-object v2, v2, Lcom/localytics/android/MarketingHandler$15;->val$appContext:Landroid/content/Context;

    const-string v3, "Downloading the campaign...\nIt\'ll be shown in few seconds."

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 2385
    :cond_0
    return-void
.end method
