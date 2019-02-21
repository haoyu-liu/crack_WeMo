.class public Lcom/belkin/utils/NativeUtil;
.super Ljava/lang/Object;
.source "NativeUtil.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "NativeUtil"


# instance fields
.field private mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Lcom/belkin/utils/NativeUtil;->mContext:Landroid/content/Context;

    .line 21
    return-void
.end method


# virtual methods
.method public getBase64Image(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 37
    :try_start_0
    iget-object v3, p0, Lcom/belkin/utils/NativeUtil;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/belkin/database/DeviceDatabase;->getDeviceDatabase(Landroid/content/Context;)Lcom/belkin/database/DeviceDatabase;

    move-result-object v0

    .line 38
    .local v0, "deviceDatabase":Lcom/belkin/database/DeviceDatabase;
    invoke-virtual {v0, p1}, Lcom/belkin/database/DeviceDatabase;->getIconByUdn(Ljava/lang/String;)[B

    move-result-object v3

    const/4 v4, 0x0

    invoke-static {v3, v4}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v2

    .line 39
    .local v2, "str":Ljava/lang/String;
    invoke-virtual {v0}, Lcom/belkin/database/DeviceDatabase;->closeDatabse()V

    .line 40
    const-string v3, "NativeUtil"

    const-string v4, "Image found"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Lcom/belkin/exception/DatabaseException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    .end local v0    # "deviceDatabase":Lcom/belkin/database/DeviceDatabase;
    .end local v2    # "str":Ljava/lang/String;
    :goto_0
    return-object v2

    .line 43
    :catch_0
    move-exception v1

    .line 44
    .local v1, "e":Lcom/belkin/exception/DatabaseException;
    :try_start_1
    const-string v3, "NativeUtil"

    const-string v4, "Image not found"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    invoke-virtual {v1}, Lcom/belkin/exception/DatabaseException;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 49
    const-string v2, ""

    goto :goto_0

    .line 46
    .end local v1    # "e":Lcom/belkin/exception/DatabaseException;
    :catchall_0
    move-exception v3

    throw v3
.end method

.method public getLedBase64Image(Ljava/lang/String;)Lorg/json/JSONArray;
    .locals 6
    .param p1, "deviceID"    # Ljava/lang/String;

    .prologue
    .line 54
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    .line 56
    .local v2, "temp":Lorg/json/JSONArray;
    :try_start_0
    iget-object v4, p0, Lcom/belkin/utils/NativeUtil;->mContext:Landroid/content/Context;

    invoke-static {v4}, Lcom/belkin/database/BridgeLocalDatabase;->getLedDeviceDatabase(Landroid/content/Context;)Lcom/belkin/database/BridgeLocalDatabase;

    move-result-object v0

    .line 57
    .local v0, "bridgeDatabase":Lcom/belkin/database/BridgeLocalDatabase;
    invoke-virtual {v0, p1}, Lcom/belkin/database/BridgeLocalDatabase;->getIconByLedDeviceId(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    .line 58
    invoke-virtual {v0}, Lcom/belkin/database/BridgeLocalDatabase;->closeDatabse()V

    .line 59
    const-string v4, "NativeUtil"

    const-string v5, "Led Image found"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Lcom/belkin/exception/DatabaseException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v3, v2

    .line 68
    .end local v0    # "bridgeDatabase":Lcom/belkin/database/BridgeLocalDatabase;
    .end local v2    # "temp":Lorg/json/JSONArray;
    .local v3, "temp":Lorg/json/JSONArray;
    :goto_0
    return-object v3

    .line 62
    .end local v3    # "temp":Lorg/json/JSONArray;
    .restart local v2    # "temp":Lorg/json/JSONArray;
    :catch_0
    move-exception v1

    .line 63
    .local v1, "e":Lcom/belkin/exception/DatabaseException;
    :try_start_1
    const-string v4, "NativeUtil"

    const-string v5, "Led Image not found"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    invoke-virtual {v1}, Lcom/belkin/exception/DatabaseException;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-object v3, v2

    .line 68
    .end local v2    # "temp":Lorg/json/JSONArray;
    .restart local v3    # "temp":Lorg/json/JSONArray;
    goto :goto_0

    .line 65
    .end local v1    # "e":Lcom/belkin/exception/DatabaseException;
    .end local v3    # "temp":Lorg/json/JSONArray;
    .restart local v2    # "temp":Lorg/json/JSONArray;
    :catchall_0
    move-exception v4

    throw v4
.end method

.method public resetLedDeviceImage(Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p1, "deviceID"    # Ljava/lang/String;

    .prologue
    .line 99
    const-string v3, ""

    .line 102
    .local v3, "result":Ljava/lang/String;
    :try_start_0
    iget-object v5, p0, Lcom/belkin/utils/NativeUtil;->mContext:Landroid/content/Context;

    invoke-static {v5}, Lcom/belkin/database/BridgeLocalDatabase;->getLedDeviceDatabase(Landroid/content/Context;)Lcom/belkin/database/BridgeLocalDatabase;

    move-result-object v0

    .line 103
    .local v0, "bridgeDatabase":Lcom/belkin/database/BridgeLocalDatabase;
    invoke-virtual {v0, p1}, Lcom/belkin/database/BridgeLocalDatabase;->checkData(Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 104
    .local v1, "cursor":Landroid/database/Cursor;
    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v5

    if-nez v5, :cond_0

    .line 105
    const-wide/16 v6, -0x1

    .line 109
    .local v6, "tempStr":J
    :goto_0
    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    .line 110
    invoke-virtual {v0}, Lcom/belkin/database/BridgeLocalDatabase;->closeDatabse()V

    .line 111
    const-string v5, "NativeUtil"

    const-string v8, "Led Image deleted"

    invoke-static {v5, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-object v4, v3

    .line 121
    .end local v0    # "bridgeDatabase":Lcom/belkin/database/BridgeLocalDatabase;
    .end local v1    # "cursor":Landroid/database/Cursor;
    .end local v3    # "result":Ljava/lang/String;
    .end local v6    # "tempStr":J
    .local v4, "result":Ljava/lang/String;
    :goto_1
    return-object v4

    .line 107
    .end local v4    # "result":Ljava/lang/String;
    .restart local v0    # "bridgeDatabase":Lcom/belkin/database/BridgeLocalDatabase;
    .restart local v1    # "cursor":Landroid/database/Cursor;
    .restart local v3    # "result":Ljava/lang/String;
    :cond_0
    invoke-virtual {v0, p1}, Lcom/belkin/database/BridgeLocalDatabase;->deleteRecordById(Ljava/lang/String;)I
    :try_end_0
    .catch Lcom/belkin/exception/DatabaseException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v5

    int-to-long v6, v5

    .restart local v6    # "tempStr":J
    goto :goto_0

    .line 115
    .end local v0    # "bridgeDatabase":Lcom/belkin/database/BridgeLocalDatabase;
    .end local v1    # "cursor":Landroid/database/Cursor;
    .end local v6    # "tempStr":J
    :catch_0
    move-exception v2

    .line 116
    .local v2, "e":Lcom/belkin/exception/DatabaseException;
    :try_start_1
    const-string v5, "NativeUtil"

    const-string v8, "Led Image not found"

    invoke-static {v5, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 117
    invoke-virtual {v2}, Lcom/belkin/exception/DatabaseException;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-object v4, v3

    .line 121
    .end local v3    # "result":Ljava/lang/String;
    .restart local v4    # "result":Ljava/lang/String;
    goto :goto_1

    .line 118
    .end local v2    # "e":Lcom/belkin/exception/DatabaseException;
    .end local v4    # "result":Ljava/lang/String;
    .restart local v3    # "result":Ljava/lang/String;
    :catchall_0
    move-exception v5

    throw v5
.end method

.method public setImage(Ljava/lang/String;[B)V
    .locals 4
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "data"    # [B

    .prologue
    .line 26
    :try_start_0
    iget-object v2, p0, Lcom/belkin/utils/NativeUtil;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/belkin/database/DeviceDatabase;->getDeviceDatabase(Landroid/content/Context;)Lcom/belkin/database/DeviceDatabase;

    move-result-object v0

    .line 27
    .local v0, "deviceDatabase":Lcom/belkin/database/DeviceDatabase;
    invoke-virtual {v0, p2, p1}, Lcom/belkin/database/DeviceDatabase;->setIconByUdn([BLjava/lang/String;)I

    .line 28
    invoke-virtual {v0}, Lcom/belkin/database/DeviceDatabase;->closeDatabse()V
    :try_end_0
    .catch Lcom/belkin/exception/DatabaseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    .end local v0    # "deviceDatabase":Lcom/belkin/database/DeviceDatabase;
    :goto_0
    return-void

    .line 29
    :catch_0
    move-exception v1

    .line 30
    .local v1, "e":Lcom/belkin/exception/DatabaseException;
    const-string v2, "NativeUtil"

    const-string v3, "Error during image save to DB"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    invoke-virtual {v1}, Lcom/belkin/exception/DatabaseException;->printStackTrace()V

    goto :goto_0
.end method

.method public setLedDeviceImage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p1, "deviceID"    # Ljava/lang/String;
    .param p2, "imageString"    # Ljava/lang/String;
    .param p3, "cloudId"    # Ljava/lang/String;

    .prologue
    .line 72
    const-string v3, ""

    .line 75
    .local v3, "result":Ljava/lang/String;
    :try_start_0
    iget-object v5, p0, Lcom/belkin/utils/NativeUtil;->mContext:Landroid/content/Context;

    invoke-static {v5}, Lcom/belkin/database/BridgeLocalDatabase;->getLedDeviceDatabase(Landroid/content/Context;)Lcom/belkin/database/BridgeLocalDatabase;

    move-result-object v0

    .line 76
    .local v0, "bridgeDatabase":Lcom/belkin/database/BridgeLocalDatabase;
    invoke-virtual {v0, p1}, Lcom/belkin/database/BridgeLocalDatabase;->checkData(Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 77
    .local v1, "cursor":Landroid/database/Cursor;
    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v5

    if-nez v5, :cond_0

    .line 78
    invoke-virtual {v0, p1, p2, p3}, Lcom/belkin/database/BridgeLocalDatabase;->insertLedDeviceIcon(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide v6

    .line 82
    .local v6, "tempStr":J
    :goto_0
    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    .line 83
    invoke-virtual {v0}, Lcom/belkin/database/BridgeLocalDatabase;->closeDatabse()V

    .line 84
    const-string v5, "NativeUtil"

    const-string v8, "Led Image found"

    invoke-static {v5, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-object v4, v3

    .line 94
    .end local v0    # "bridgeDatabase":Lcom/belkin/database/BridgeLocalDatabase;
    .end local v1    # "cursor":Landroid/database/Cursor;
    .end local v3    # "result":Ljava/lang/String;
    .end local v6    # "tempStr":J
    .local v4, "result":Ljava/lang/String;
    :goto_1
    return-object v4

    .line 80
    .end local v4    # "result":Ljava/lang/String;
    .restart local v0    # "bridgeDatabase":Lcom/belkin/database/BridgeLocalDatabase;
    .restart local v1    # "cursor":Landroid/database/Cursor;
    .restart local v3    # "result":Ljava/lang/String;
    :cond_0
    invoke-virtual {v0, p2, p1, p3}, Lcom/belkin/database/BridgeLocalDatabase;->updateLedIconByDeviceId(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Lcom/belkin/exception/DatabaseException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v5

    int-to-long v6, v5

    .restart local v6    # "tempStr":J
    goto :goto_0

    .line 88
    .end local v0    # "bridgeDatabase":Lcom/belkin/database/BridgeLocalDatabase;
    .end local v1    # "cursor":Landroid/database/Cursor;
    .end local v6    # "tempStr":J
    :catch_0
    move-exception v2

    .line 89
    .local v2, "e":Lcom/belkin/exception/DatabaseException;
    :try_start_1
    const-string v5, "NativeUtil"

    const-string v8, "Led Image not found"

    invoke-static {v5, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 90
    invoke-virtual {v2}, Lcom/belkin/exception/DatabaseException;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-object v4, v3

    .line 94
    .end local v3    # "result":Ljava/lang/String;
    .restart local v4    # "result":Ljava/lang/String;
    goto :goto_1

    .line 91
    .end local v2    # "e":Lcom/belkin/exception/DatabaseException;
    .end local v4    # "result":Ljava/lang/String;
    .restart local v3    # "result":Ljava/lang/String;
    :catchall_0
    move-exception v5

    throw v5
.end method
