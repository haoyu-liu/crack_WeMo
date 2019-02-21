.class Lorg/apache/cordova/inappbrowser/InAppBrowser$4;
.super Ljava/lang/Object;
.source "InAppBrowser.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/inappbrowser/InAppBrowser;->closeDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;


# direct methods
.method constructor <init>(Lorg/apache/cordova/inappbrowser/InAppBrowser;)V
    .locals 0

    .prologue
    .line 368
    iput-object p1, p0, Lorg/apache/cordova/inappbrowser/InAppBrowser$4;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 371
    iget-object v3, p0, Lorg/apache/cordova/inappbrowser/InAppBrowser$4;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {v3}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$100(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Landroid/webkit/WebView;

    move-result-object v0

    .line 374
    .local v0, "childView":Landroid/webkit/WebView;
    if-nez v0, :cond_0

    .line 399
    :goto_0
    return-void

    .line 378
    :cond_0
    new-instance v3, Lorg/apache/cordova/inappbrowser/InAppBrowser$4$1;

    invoke-direct {v3, p0}, Lorg/apache/cordova/inappbrowser/InAppBrowser$4$1;-><init>(Lorg/apache/cordova/inappbrowser/InAppBrowser$4;)V

    invoke-virtual {v0, v3}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 390
    const-string v3, "about:blank"

    invoke-virtual {v0, v3}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 393
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 394
    .local v2, "obj":Lorg/json/JSONObject;
    const-string v3, "type"

    const-string v4, "exit"

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 395
    iget-object v3, p0, Lorg/apache/cordova/inappbrowser/InAppBrowser$4;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    const/4 v4, 0x0

    invoke-static {v3, v2, v4}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$200(Lorg/apache/cordova/inappbrowser/InAppBrowser;Lorg/json/JSONObject;Z)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 396
    .end local v2    # "obj":Lorg/json/JSONObject;
    :catch_0
    move-exception v1

    .line 397
    .local v1, "ex":Lorg/json/JSONException;
    const-string v3, "InAppBrowser"

    const-string v4, "Should never happen"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
