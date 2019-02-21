.class public Lcom/belkin/database/StoreDeviceData;
.super Landroid/os/AsyncTask;
.source "StoreDeviceData.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/database/StoreDeviceData$PatchInputStream;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Lorg/json/JSONObject;",
        "Ljava/lang/Integer;",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "StoreDeviceData"


# instance fields
.field private mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 26
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 27
    iput-object p1, p0, Lcom/belkin/database/StoreDeviceData;->mContext:Landroid/content/Context;

    .line 28
    return-void
.end method

.method public static DownloadImage(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 5
    .param p0, "URL"    # Ljava/lang/String;

    .prologue
    .line 76
    const/4 v0, 0x0

    .line 77
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    const/4 v2, 0x0

    .line 79
    .local v2, "in":Ljava/io/InputStream;
    :try_start_0
    const-string v3, "Download"

    invoke-static {v3, p0}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 82
    :try_start_1
    new-instance v3, Ljava/net/URL;

    invoke-direct {v3, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/net/URL;->openStream()Ljava/io/InputStream;
    :try_end_1
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v2

    .line 89
    :goto_0
    :try_start_2
    new-instance v3, Lcom/belkin/database/StoreDeviceData$PatchInputStream;

    invoke-direct {v3, v2}, Lcom/belkin/database/StoreDeviceData$PatchInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-static {v3}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v0

    .line 95
    if-eqz v2, :cond_0

    .line 96
    :try_start_3
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_4

    .line 101
    :cond_0
    :goto_1
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 102
    return-object v0

    .line 83
    :catch_0
    move-exception v1

    .line 84
    .local v1, "e":Ljava/net/MalformedURLException;
    :try_start_4
    invoke-virtual {v1}, Ljava/net/MalformedURLException;->printStackTrace()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0

    .line 91
    .end local v1    # "e":Ljava/net/MalformedURLException;
    :catch_1
    move-exception v1

    .line 92
    .local v1, "e":Ljava/lang/Exception;
    :try_start_5
    const-string v3, "StoreDeviceData"

    const-string v4, "Exception in DownloadImage(URL) : "

    invoke-static {v3, v4, v1}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 95
    if-eqz v2, :cond_0

    .line 96
    :try_start_6
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2

    goto :goto_1

    .line 97
    :catch_2
    move-exception v1

    .line 98
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 85
    .end local v1    # "e":Ljava/lang/Exception;
    :catch_3
    move-exception v1

    .line 86
    .local v1, "e":Ljava/io/IOException;
    :try_start_7
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto :goto_0

    .line 94
    .end local v1    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v3

    .line 95
    if-eqz v2, :cond_1

    .line 96
    :try_start_8
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_5

    .line 99
    :cond_1
    :goto_2
    throw v3

    .line 97
    :catch_4
    move-exception v1

    .line 98
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 97
    .end local v1    # "e":Ljava/lang/Exception;
    :catch_5
    move-exception v1

    .line 98
    .restart local v1    # "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2
.end method


# virtual methods
.method protected varargs doInBackground([Lorg/json/JSONObject;)Ljava/lang/Boolean;
    .locals 9
    .param p1, "params"    # [Lorg/json/JSONObject;

    .prologue
    .line 34
    const/4 v7, 0x0

    :try_start_0
    aget-object v3, p1, v7

    .line 36
    .local v3, "deviceJsonObject":Lorg/json/JSONObject;
    const-string v7, "iconUrl"

    invoke-virtual {v3, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/belkin/database/StoreDeviceData;->DownloadImage(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 37
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    new-instance v5, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v5}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 38
    .local v5, "stream":Ljava/io/ByteArrayOutputStream;
    sget-object v7, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v8, 0x64

    invoke-virtual {v0, v7, v8, v5}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 39
    invoke-virtual {v5}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    .line 41
    .local v1, "byteArray":[B
    iget-object v7, p0, Lcom/belkin/database/StoreDeviceData;->mContext:Landroid/content/Context;

    invoke-static {v7}, Lcom/belkin/database/DeviceDatabase;->getDeviceDatabase(Landroid/content/Context;)Lcom/belkin/database/DeviceDatabase;

    move-result-object v2

    .line 42
    .local v2, "database":Lcom/belkin/database/DeviceDatabase;
    new-instance v6, Landroid/content/ContentValues;

    invoke-direct {v6}, Landroid/content/ContentValues;-><init>()V

    .line 43
    .local v6, "values":Landroid/content/ContentValues;
    const-string v7, "friendlyname"

    const-string v8, "friendlyName"

    invoke-virtual {v3, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    const-string v7, "deviceudn"

    const-string v8, "udn"

    invoke-virtual {v3, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    const-string v7, "image_raw"

    invoke-virtual {v6, v7, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 46
    const-string v7, "status"

    const-string v8, "1"

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    const-string v7, "device_type"

    const-string v8, "type"

    invoke-virtual {v3, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    const-string v7, "udn"

    invoke-virtual {v3, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Lcom/belkin/database/DeviceDatabase;->checkData(Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    invoke-interface {v7}, Landroid/database/Cursor;->getCount()I

    move-result v7

    if-eqz v7, :cond_0

    const-string v7, "udn"

    invoke-virtual {v3, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Lcom/belkin/database/DeviceDatabase;->checkData(Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    if-nez v7, :cond_1

    .line 52
    :cond_0
    invoke-virtual {v2, v6}, Lcom/belkin/database/DeviceDatabase;->insertSwitches(Landroid/content/ContentValues;)J

    .line 56
    :goto_0
    invoke-virtual {v2}, Lcom/belkin/database/DeviceDatabase;->closeDatabse()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 61
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v1    # "byteArray":[B
    .end local v2    # "database":Lcom/belkin/database/DeviceDatabase;
    .end local v3    # "deviceJsonObject":Lorg/json/JSONObject;
    .end local v5    # "stream":Ljava/io/ByteArrayOutputStream;
    .end local v6    # "values":Landroid/content/ContentValues;
    :goto_1
    const/4 v7, 0x1

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    return-object v7

    .line 54
    .restart local v0    # "bitmap":Landroid/graphics/Bitmap;
    .restart local v1    # "byteArray":[B
    .restart local v2    # "database":Lcom/belkin/database/DeviceDatabase;
    .restart local v3    # "deviceJsonObject":Lorg/json/JSONObject;
    .restart local v5    # "stream":Ljava/io/ByteArrayOutputStream;
    .restart local v6    # "values":Landroid/content/ContentValues;
    :cond_1
    :try_start_1
    invoke-virtual {v2, v6}, Lcom/belkin/database/DeviceDatabase;->updateSwitches(Landroid/content/ContentValues;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 58
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v1    # "byteArray":[B
    .end local v2    # "database":Lcom/belkin/database/DeviceDatabase;
    .end local v3    # "deviceJsonObject":Lorg/json/JSONObject;
    .end local v5    # "stream":Ljava/io/ByteArrayOutputStream;
    .end local v6    # "values":Landroid/content/ContentValues;
    :catch_0
    move-exception v4

    .line 59
    .local v4, "e":Ljava/lang/Exception;
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 21
    check-cast p1, [Lorg/json/JSONObject;

    .end local p1    # "x0":[Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/belkin/database/StoreDeviceData;->doInBackground([Lorg/json/JSONObject;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Ljava/lang/Boolean;)V
    .locals 0
    .param p1, "result"    # Ljava/lang/Boolean;

    .prologue
    .line 71
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 73
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 21
    check-cast p1, Ljava/lang/Boolean;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/belkin/database/StoreDeviceData;->onPostExecute(Ljava/lang/Boolean;)V

    return-void
.end method

.method protected onPreExecute()V
    .locals 0

    .prologue
    .line 66
    invoke-super {p0}, Landroid/os/AsyncTask;->onPreExecute()V

    .line 67
    return-void
.end method
