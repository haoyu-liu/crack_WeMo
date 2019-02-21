.class Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon$IconDownloader;
.super Landroid/os/AsyncTask;
.source "CloudRequestGetLEDGroupIcon.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "IconDownloader"
.end annotation

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
.field final synthetic this$0:Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon;


# direct methods
.method private constructor <init>(Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon;)V
    .locals 0

    .prologue
    .line 120
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon$IconDownloader;->this$0:Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon;Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon;
    .param p2, "x1"    # Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon$1;

    .prologue
    .line 120
    invoke-direct {p0, p1}, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon$IconDownloader;-><init>(Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon;)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 120
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon$IconDownloader;->doInBackground([Ljava/lang/Object;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Object;)Ljava/lang/Void;
    .locals 11
    .param p1, "parameters"    # [Ljava/lang/Object;

    .prologue
    .line 124
    const/4 v0, 0x0

    .line 127
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    const/4 v8, 0x0

    :try_start_0
    aget-object v7, p1, v8

    check-cast v7, Ljava/lang/String;

    .line 128
    .local v7, "urlStr":Ljava/lang/String;
    new-instance v6, Ljava/net/URL;

    invoke-direct {v6, v7}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 130
    .local v6, "url":Ljava/net/URL;
    const/4 v8, 0x1

    aget-object v4, p1, v8

    check-cast v4, Ljava/lang/String;

    .line 131
    .local v4, "ledDeviceID":Ljava/lang/String;
    const/4 v8, 0x2

    aget-object v5, p1, v8

    check-cast v5, Ljava/lang/String;

    .line 132
    .local v5, "uploadId":Ljava/lang/String;
    const-string v8, "SDK_CloudRequestGetLEDGroupIcon"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "LED ICONINFO: ledDeviceID: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 134
    invoke-virtual {v6}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    check-cast v1, Ljava/net/HttpURLConnection;

    .line 135
    .local v1, "connection":Ljava/net/HttpURLConnection;
    const-string v8, "GET"

    invoke-virtual {v1, v8}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 136
    invoke-virtual {v6}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_0

    .line 137
    const-string v8, "HOST"

    invoke-virtual {v6}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v1, v8, v9}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 139
    :cond_0
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v3

    .line 140
    .local v3, "inputStream":Ljava/io/InputStream;
    invoke-static {v3}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 141
    const-string v8, "SDK_CloudRequestGetLEDGroupIcon"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "LED ICONINFO: bitmap: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " :ledDeviceID: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " :udnList: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon$IconDownloader;->this$0:Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon;

    invoke-static {v10}, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon;->access$100(Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon;)Ljava/util/List;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    iget-object v8, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon$IconDownloader;->this$0:Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon;

    invoke-static {v8}, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon;->access$200(Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v8

    invoke-static {v0, v4, v5}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->saveRemoteIconToStorage(Landroid/graphics/Bitmap;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    iget-object v10, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon$IconDownloader;->this$0:Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon;

    invoke-static {v10}, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon;->access$100(Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon;)Ljava/util/List;

    move-result-object v10

    invoke-virtual {v8, v9, v5, v10}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->updateGroupLedIconFile(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 146
    .end local v1    # "connection":Ljava/net/HttpURLConnection;
    .end local v3    # "inputStream":Ljava/io/InputStream;
    .end local v4    # "ledDeviceID":Ljava/lang/String;
    .end local v5    # "uploadId":Ljava/lang/String;
    .end local v6    # "url":Ljava/net/URL;
    .end local v7    # "urlStr":Ljava/lang/String;
    :goto_0
    const/4 v8, 0x0

    return-object v8

    .line 143
    :catch_0
    move-exception v2

    .line 144
    .local v2, "e":Ljava/lang/Exception;
    const-string v8, "SDK_CloudRequestGetLEDGroupIcon"

    const-string v9, "Downloading the Group logo is unsuccessful"

    invoke-static {v8, v9, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0
.end method
