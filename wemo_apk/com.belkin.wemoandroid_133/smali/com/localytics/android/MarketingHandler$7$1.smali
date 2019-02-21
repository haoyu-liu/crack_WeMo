.class Lcom/localytics/android/MarketingHandler$7$1;
.super Landroid/os/AsyncTask;
.source "MarketingHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/MarketingHandler$7;->onPostExecute(Ljava/lang/String;)V
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
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/localytics/android/MarketingHandler$7;

.field final synthetic val$pushRegID:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/localytics/android/MarketingHandler$7;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1806
    iput-object p1, p0, Lcom/localytics/android/MarketingHandler$7$1;->this$1:Lcom/localytics/android/MarketingHandler$7;

    iput-object p2, p0, Lcom/localytics/android/MarketingHandler$7$1;->val$pushRegID:Ljava/lang/String;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 1806
    check-cast p1, [Ljava/lang/Void;

    .end local p1    # "x0":[Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/localytics/android/MarketingHandler$7$1;->doInBackground([Ljava/lang/Void;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/String;
    .locals 16
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    const/4 v11, 0x0

    .line 1823
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/localytics/android/MarketingHandler$7$1;->val$pushRegID:Ljava/lang/String;

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 1825
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/localytics/android/MarketingHandler$7$1;->this$1:Lcom/localytics/android/MarketingHandler$7;

    iget-object v8, v8, Lcom/localytics/android/MarketingHandler$7;->this$0:Lcom/localytics/android/MarketingHandler;

    iget-object v8, v8, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v8}, Lcom/localytics/android/LocalyticsDao;->getInstallationId()Ljava/lang/String;

    move-result-object v5

    .line 1826
    .local v5, "installID":Ljava/lang/String;
    const-string v8, "http://pushapi.localytics.com/push_test?platform=android&type=prod&campaign=%s&creative=%s&token=%s&install_id=%s&client_ts=%s"

    const/4 v9, 0x5

    new-array v9, v9, [Ljava/lang/Object;

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/localytics/android/MarketingHandler$7$1;->this$1:Lcom/localytics/android/MarketingHandler$7;

    iget-object v10, v10, Lcom/localytics/android/MarketingHandler$7;->val$campaign:Ljava/lang/String;

    aput-object v10, v9, v11

    const/4 v10, 0x1

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/localytics/android/MarketingHandler$7$1;->this$1:Lcom/localytics/android/MarketingHandler$7;

    iget-object v11, v11, Lcom/localytics/android/MarketingHandler$7;->val$creative:Ljava/lang/String;

    aput-object v11, v9, v10

    const/4 v10, 0x2

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/localytics/android/MarketingHandler$7$1;->val$pushRegID:Ljava/lang/String;

    aput-object v11, v9, v10

    const/4 v10, 0x3

    aput-object v5, v9, v10

    const/4 v10, 0x4

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/localytics/android/MarketingHandler$7$1;->this$1:Lcom/localytics/android/MarketingHandler$7;

    iget-object v11, v11, Lcom/localytics/android/MarketingHandler$7;->this$0:Lcom/localytics/android/MarketingHandler;

    iget-object v11, v11, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v11}, Lcom/localytics/android/LocalyticsDao;->getCurrentTimeMillis()J

    move-result-wide v12

    long-to-double v12, v12

    const-wide v14, 0x408f400000000000L    # 1000.0

    div-double/2addr v12, v14

    invoke-static {v12, v13}, Ljava/lang/Math;->round(D)J

    move-result-wide v12

    invoke-static {v12, v13}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    .line 1827
    .local v7, "url":Ljava/lang/String;
    const/4 v2, 0x0

    .line 1830
    .local v2, "connection":Ljava/net/HttpURLConnection;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/localytics/android/MarketingHandler$7$1;->this$1:Lcom/localytics/android/MarketingHandler$7;

    iget-object v8, v8, Lcom/localytics/android/MarketingHandler$7;->this$0:Lcom/localytics/android/MarketingHandler;

    iget-object v8, v8, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v8}, Lcom/localytics/android/LocalyticsDao;->getProxy()Ljava/net/Proxy;

    move-result-object v6

    .line 1831
    .local v6, "proxy":Ljava/net/Proxy;
    new-instance v8, Ljava/net/URL;

    invoke-direct {v8, v7}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-static {v8, v6}, Lcom/localytics/android/BaseUploadThread;->createURLConnection(Ljava/net/URL;Ljava/net/Proxy;)Ljava/net/URLConnection;

    move-result-object v8

    move-object v0, v8

    check-cast v0, Ljava/net/HttpURLConnection;

    move-object v2, v0

    .line 1832
    const/16 v8, 0x1388

    invoke-virtual {v2, v8}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 1833
    const/16 v8, 0x1388

    invoke-virtual {v2, v8}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 1834
    const/4 v8, 0x0

    invoke-virtual {v2, v8}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 1835
    const-string v8, "x-install-id"

    invoke-virtual {v2, v8, v5}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 1836
    const-string v8, "x-app-id"

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/localytics/android/MarketingHandler$7$1;->this$1:Lcom/localytics/android/MarketingHandler$7;

    iget-object v9, v9, Lcom/localytics/android/MarketingHandler$7;->this$0:Lcom/localytics/android/MarketingHandler;

    iget-object v9, v9, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v9}, Lcom/localytics/android/LocalyticsDao;->getAppContext()Landroid/content/Context;

    move-result-object v9

    invoke-static {v9}, Lcom/localytics/android/DatapointHelper;->getAppVersion(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v2, v8, v9}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 1837
    const-string v8, "x-client-version"

    const-string v9, "androida_3.4.0"

    invoke-virtual {v2, v8, v9}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 1838
    const-string v8, "x-app-version"

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/localytics/android/MarketingHandler$7$1;->this$1:Lcom/localytics/android/MarketingHandler$7;

    iget-object v9, v9, Lcom/localytics/android/MarketingHandler$7;->this$0:Lcom/localytics/android/MarketingHandler;

    iget-object v9, v9, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v9}, Lcom/localytics/android/LocalyticsDao;->getAppContext()Landroid/content/Context;

    move-result-object v9

    invoke-static {v9}, Lcom/localytics/android/DatapointHelper;->getAppVersion(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v2, v8, v9}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 1839
    const-string v8, "x-customer-id"

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/localytics/android/MarketingHandler$7$1;->this$1:Lcom/localytics/android/MarketingHandler$7;

    iget-object v9, v9, Lcom/localytics/android/MarketingHandler$7;->val$customerID:Ljava/lang/String;

    invoke-virtual {v2, v8, v9}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 1840
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1855
    if-eqz v2, :cond_0

    .line 1857
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 1858
    const/4 v2, 0x0

    .line 1862
    .end local v2    # "connection":Ljava/net/HttpURLConnection;
    .end local v5    # "installID":Ljava/lang/String;
    .end local v6    # "proxy":Ljava/net/Proxy;
    .end local v7    # "url":Ljava/lang/String;
    :cond_0
    const/4 v8, 0x0

    :cond_1
    :goto_0
    return-object v8

    .line 1842
    .restart local v2    # "connection":Ljava/net/HttpURLConnection;
    .restart local v5    # "installID":Ljava/lang/String;
    .restart local v7    # "url":Ljava/lang/String;
    :catch_0
    move-exception v3

    .line 1844
    .local v3, "e":Ljava/lang/Exception;
    :try_start_1
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v8, "Unfortunately, something went wrong. Push test activation was unsuccessful."

    invoke-direct {v4, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1845
    .local v4, "errorMessageBuilder":Ljava/lang/StringBuilder;
    invoke-static {}, Lcom/localytics/android/Localytics;->isLoggingEnabled()Z

    move-result v8

    if-eqz v8, :cond_2

    instance-of v8, v3, Ljava/io/FileNotFoundException;

    if-eqz v8, :cond_2

    .line 1847
    const-string v8, "\n\nCause:\nPush registration token has not yet been processed. Please wait a few minutes and try again."

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1848
    const-string v8, "Activating push test has failed"

    invoke-static {v8, v3}, Lcom/localytics/android/Localytics$Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1851
    :cond_2
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v8

    .line 1855
    if-eqz v2, :cond_1

    .line 1857
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 1858
    const/4 v2, 0x0

    goto :goto_0

    .line 1855
    .end local v3    # "e":Ljava/lang/Exception;
    .end local v4    # "errorMessageBuilder":Ljava/lang/StringBuilder;
    :catchall_0
    move-exception v8

    if-eqz v2, :cond_3

    .line 1857
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 1858
    const/4 v2, 0x0

    :cond_3
    throw v8
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 1806
    check-cast p1, Ljava/lang/String;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/localytics/android/MarketingHandler$7$1;->onPostExecute(Ljava/lang/String;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/String;)V
    .locals 2
    .param p1, "result"    # Ljava/lang/String;

    .prologue
    .line 1868
    if-eqz p1, :cond_0

    .line 1870
    iget-object v0, p0, Lcom/localytics/android/MarketingHandler$7$1;->this$1:Lcom/localytics/android/MarketingHandler$7;

    iget-object v0, v0, Lcom/localytics/android/MarketingHandler$7;->val$appContext:Landroid/content/Context;

    const/4 v1, 0x1

    invoke-static {v0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 1872
    :cond_0
    return-void
.end method

.method protected onPreExecute()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 1810
    iget-object v0, p0, Lcom/localytics/android/MarketingHandler$7$1;->val$pushRegID:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1812
    iget-object v0, p0, Lcom/localytics/android/MarketingHandler$7$1;->this$1:Lcom/localytics/android/MarketingHandler$7;

    iget-object v0, v0, Lcom/localytics/android/MarketingHandler$7;->val$appContext:Landroid/content/Context;

    const-string v1, "Push Test Activated\nYou should receive a notification soon."

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 1818
    :goto_0
    return-void

    .line 1816
    :cond_0
    iget-object v0, p0, Lcom/localytics/android/MarketingHandler$7$1;->this$1:Lcom/localytics/android/MarketingHandler$7;

    iget-object v0, v0, Lcom/localytics/android/MarketingHandler$7;->val$appContext:Landroid/content/Context;

    const-string v1, "App isn\'t registered with GCM to receive push notifications. Please make sure that Localytics.registerPush(<PROJECT_ID>) has been called."

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method
