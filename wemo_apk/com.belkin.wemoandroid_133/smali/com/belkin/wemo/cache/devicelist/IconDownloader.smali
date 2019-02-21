.class public Lcom/belkin/wemo/cache/devicelist/IconDownloader;
.super Landroid/os/AsyncTask;
.source "IconDownloader.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Object;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field private devUDN:Ljava/lang/String;

.field private mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 12
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 13
    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/IconDownloader;->devUDN:Ljava/lang/String;

    .line 14
    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/IconDownloader;->mContext:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 12
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/cache/devicelist/IconDownloader;->doInBackground([Ljava/lang/Object;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Object;)Ljava/lang/Void;
    .locals 9
    .param p1, "parameters"    # [Ljava/lang/Object;

    .prologue
    .line 18
    const/4 v0, 0x0

    .line 21
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    const/4 v7, 0x2

    :try_start_0
    aget-object v7, p1, v7

    check-cast v7, Landroid/content/Context;

    iput-object v7, p0, Lcom/belkin/wemo/cache/devicelist/IconDownloader;->mContext:Landroid/content/Context;

    .line 22
    const/4 v7, 0x0

    aget-object v6, p1, v7

    check-cast v6, Ljava/lang/String;

    .line 23
    .local v6, "urlStr":Ljava/lang/String;
    const-string v7, "http://"

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 25
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "http://"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 27
    :cond_0
    new-instance v5, Ljava/net/URL;

    invoke-direct {v5, v6}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 29
    .local v5, "url":Ljava/net/URL;
    const/4 v7, 0x1

    aget-object v7, p1, v7

    check-cast v7, Ljava/lang/String;

    iput-object v7, p0, Lcom/belkin/wemo/cache/devicelist/IconDownloader;->devUDN:Ljava/lang/String;

    .line 30
    invoke-virtual {v5}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    check-cast v1, Ljava/net/HttpURLConnection;

    .line 31
    .local v1, "connection":Ljava/net/HttpURLConnection;
    const-string v7, "GET"

    invoke-virtual {v1, v7}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 32
    invoke-virtual {v5}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_1

    .line 33
    const-string v7, "HOST"

    invoke-virtual {v5}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v7, v8}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    :cond_1
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v4

    .line 36
    .local v4, "inputStream":Ljava/io/InputStream;
    invoke-static {v4}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 37
    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/IconDownloader;->mContext:Landroid/content/Context;

    invoke-static {v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v2

    .line 38
    .local v2, "devMgr":Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    if-eqz v2, :cond_2

    .line 39
    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/IconDownloader;->devUDN:Ljava/lang/String;

    invoke-virtual {v2, v7, v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->updateIconFile(Ljava/lang/String;Landroid/graphics/Bitmap;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    .end local v1    # "connection":Ljava/net/HttpURLConnection;
    .end local v2    # "devMgr":Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    .end local v4    # "inputStream":Ljava/io/InputStream;
    .end local v5    # "url":Ljava/net/URL;
    .end local v6    # "urlStr":Ljava/lang/String;
    :cond_2
    :goto_0
    const/4 v7, 0x0

    return-object v7

    .line 41
    :catch_0
    move-exception v3

    .line 42
    .local v3, "e":Ljava/lang/Exception;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    const-string v8, "Downloading the logo is unsuccessful"

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
