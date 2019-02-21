.class public Lcom/synconset/CordovaHttpPlugin;
.super Lorg/apache/cordova/CordovaPlugin;
.source "CordovaHttpPlugin.java"


# instance fields
.field private globalHeaders:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    return-void
.end method

.method private addToMap(Ljava/util/HashMap;Lorg/json/JSONObject;)Ljava/util/HashMap;
    .locals 4
    .param p2, "object"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lorg/json/JSONObject;",
            ")",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 139
    .local p1, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {p1}, Ljava/util/HashMap;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/HashMap;

    .line 140
    .local v2, "newMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {p2}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v0

    .line 142
    .local v0, "i":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 143
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 144
    .local v1, "key":Ljava/lang/String;
    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 146
    .end local v1    # "key":Ljava/lang/String;
    :cond_0
    return-object v2
.end method

.method private enableSSLPinning(Z)V
    .locals 9
    .param p1, "enable"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 113
    if-eqz p1, :cond_3

    .line 114
    iget-object v7, p0, Lcom/synconset/CordovaHttpPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v7}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v7

    invoke-virtual {v7}, Landroid/app/Activity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    .line 115
    .local v0, "assetManager":Landroid/content/res/AssetManager;
    const-string v7, ""

    invoke-virtual {v0, v7}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 117
    .local v3, "files":[Ljava/lang/String;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 118
    .local v2, "cerFiles":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    array-length v7, v3

    if-ge v4, v7, :cond_1

    .line 119
    aget-object v7, v3, v4

    const/16 v8, 0x2e

    invoke-virtual {v7, v8}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v6

    .line 120
    .local v6, "index":I
    const/4 v7, -0x1

    if-eq v6, v7, :cond_0

    .line 121
    aget-object v7, v3, v4

    invoke-virtual {v7, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    const-string v8, ".cer"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 122
    aget-object v7, v3, v4

    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 118
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 127
    .end local v6    # "index":I
    :cond_1
    const/4 v4, 0x0

    :goto_1
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-ge v4, v7, :cond_2

    .line 128
    iget-object v7, p0, Lcom/synconset/CordovaHttpPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v7}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v7

    invoke-virtual {v7}, Landroid/app/Activity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v8

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v8, v7}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v5

    .line 129
    .local v5, "in":Ljava/io/InputStream;
    new-instance v1, Ljava/io/BufferedInputStream;

    invoke-direct {v1, v5}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 130
    .local v1, "caInput":Ljava/io/InputStream;
    invoke-static {v1}, Lcom/synconset/HttpRequest;->addCert(Ljava/io/InputStream;)V

    .line 127
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 132
    .end local v1    # "caInput":Ljava/io/InputStream;
    .end local v5    # "in":Ljava/io/InputStream;
    :cond_2
    const/4 v7, 0x1

    invoke-static {v7}, Lcom/synconset/CordovaHttp;->enableSSLPinning(Z)V

    .line 136
    .end local v0    # "assetManager":Landroid/content/res/AssetManager;
    .end local v2    # "cerFiles":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v3    # "files":[Ljava/lang/String;
    .end local v4    # "i":I
    :goto_2
    return-void

    .line 134
    :cond_3
    const/4 v7, 0x0

    invoke-static {v7}, Lcom/synconset/CordovaHttp;->enableSSLPinning(Z)V

    goto :goto_2
.end method

.method private getMapFromJSONObject(Lorg/json/JSONObject;)Ljava/util/HashMap;
    .locals 4
    .param p1, "object"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 150
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 151
    .local v2, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual {p1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v0

    .line 153
    .local v0, "i":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 154
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 155
    .local v1, "key":Ljava/lang/String;
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 157
    .end local v1    # "key":Ljava/lang/String;
    :cond_0
    return-object v2
.end method

.method private setHeader(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "header"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 109
    iget-object v0, p0, Lcom/synconset/CordovaHttpPlugin;->globalHeaders:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    return-void
.end method

.method private useBasicAuth(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;

    .prologue
    .line 103
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 104
    .local v0, "loginInfo":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Basic "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    const/4 v3, 0x2

    invoke-static {v2, v3}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 105
    iget-object v1, p0, Lcom/synconset/CordovaHttpPlugin;->globalHeaders:Ljava/util/HashMap;

    const-string v2, "Authorization"

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    return-void
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 27
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 39
    const-string v7, "get"

    move-object/from16 v0, p1

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 40
    const/4 v7, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v7}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 41
    .local v4, "urlString":Ljava/lang/String;
    const/4 v7, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v7}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v22

    .line 42
    .local v22, "params":Lorg/json/JSONObject;
    const/4 v7, 0x2

    move-object/from16 v0, p2

    invoke-virtual {v0, v7}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v21

    .line 43
    .local v21, "headers":Lorg/json/JSONObject;
    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-direct {v0, v1}, Lcom/synconset/CordovaHttpPlugin;->getMapFromJSONObject(Lorg/json/JSONObject;)Ljava/util/HashMap;

    move-result-object v5

    .line 44
    .local v5, "paramsMap":Ljava/util/HashMap;, "Ljava/util/HashMap<**>;"
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/synconset/CordovaHttpPlugin;->globalHeaders:Ljava/util/HashMap;

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-direct {v0, v7, v1}, Lcom/synconset/CordovaHttpPlugin;->addToMap(Ljava/util/HashMap;Lorg/json/JSONObject;)Ljava/util/HashMap;

    move-result-object v6

    .line 45
    .local v6, "headersMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v19, Lcom/synconset/CordovaHttpGet;

    move-object/from16 v0, v19

    move-object/from16 v1, p3

    invoke-direct {v0, v4, v5, v6, v1}, Lcom/synconset/CordovaHttpGet;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;Lorg/apache/cordova/CallbackContext;)V

    .line 46
    .local v19, "get":Lcom/synconset/CordovaHttpGet;
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/synconset/CordovaHttpPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v7}, Lorg/apache/cordova/CordovaInterface;->getThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v7

    move-object/from16 v0, v19

    invoke-interface {v7, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 99
    .end local v4    # "urlString":Ljava/lang/String;
    .end local v5    # "paramsMap":Ljava/util/HashMap;, "Ljava/util/HashMap<**>;"
    .end local v6    # "headersMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v19    # "get":Lcom/synconset/CordovaHttpGet;
    .end local v21    # "headers":Lorg/json/JSONObject;
    .end local v22    # "params":Lorg/json/JSONObject;
    :goto_0
    const/4 v7, 0x1

    :goto_1
    return v7

    .line 47
    :cond_0
    const-string v7, "post"

    move-object/from16 v0, p1

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 48
    const/4 v7, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v7}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 49
    .restart local v4    # "urlString":Ljava/lang/String;
    const/4 v7, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v7}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v22

    .line 50
    .restart local v22    # "params":Lorg/json/JSONObject;
    const/4 v7, 0x2

    move-object/from16 v0, p2

    invoke-virtual {v0, v7}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v21

    .line 51
    .restart local v21    # "headers":Lorg/json/JSONObject;
    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-direct {v0, v1}, Lcom/synconset/CordovaHttpPlugin;->getMapFromJSONObject(Lorg/json/JSONObject;)Ljava/util/HashMap;

    move-result-object v5

    .line 52
    .restart local v5    # "paramsMap":Ljava/util/HashMap;, "Ljava/util/HashMap<**>;"
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/synconset/CordovaHttpPlugin;->globalHeaders:Ljava/util/HashMap;

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-direct {v0, v7, v1}, Lcom/synconset/CordovaHttpPlugin;->addToMap(Ljava/util/HashMap;Lorg/json/JSONObject;)Ljava/util/HashMap;

    move-result-object v6

    .line 53
    .restart local v6    # "headersMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v24, Lcom/synconset/CordovaHttpPost;

    move-object/from16 v0, v24

    move-object/from16 v1, p3

    invoke-direct {v0, v4, v5, v6, v1}, Lcom/synconset/CordovaHttpPost;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;Lorg/apache/cordova/CallbackContext;)V

    .line 54
    .local v24, "post":Lcom/synconset/CordovaHttpPost;
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/synconset/CordovaHttpPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v7}, Lorg/apache/cordova/CordovaInterface;->getThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v7

    move-object/from16 v0, v24

    invoke-interface {v7, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 55
    .end local v4    # "urlString":Ljava/lang/String;
    .end local v5    # "paramsMap":Ljava/util/HashMap;, "Ljava/util/HashMap<**>;"
    .end local v6    # "headersMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v21    # "headers":Lorg/json/JSONObject;
    .end local v22    # "params":Lorg/json/JSONObject;
    .end local v24    # "post":Lcom/synconset/CordovaHttpPost;
    :cond_1
    const-string v7, "useBasicAuth"

    move-object/from16 v0, p1

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 56
    const/4 v7, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v7}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v25

    .line 57
    .local v25, "username":Ljava/lang/String;
    const/4 v7, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v7}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v23

    .line 58
    .local v23, "password":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v25

    move-object/from16 v2, v23

    invoke-direct {v0, v1, v2}, Lcom/synconset/CordovaHttpPlugin;->useBasicAuth(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto :goto_0

    .line 60
    .end local v23    # "password":Ljava/lang/String;
    .end local v25    # "username":Ljava/lang/String;
    :cond_2
    const-string v7, "enableSSLPinning"

    move-object/from16 v0, p1

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 62
    const/4 v7, 0x0

    :try_start_0
    move-object/from16 v0, p2

    invoke-virtual {v0, v7}, Lorg/json/JSONArray;->getBoolean(I)Z

    move-result v18

    .line 63
    .local v18, "enable":Z
    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/synconset/CordovaHttpPlugin;->enableSSLPinning(Z)V

    .line 64
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 65
    .end local v18    # "enable":Z
    :catch_0
    move-exception v17

    .line 66
    .local v17, "e":Ljava/lang/Exception;
    invoke-virtual/range {v17 .. v17}, Ljava/lang/Exception;->printStackTrace()V

    .line 67
    const-string v7, "There was an error setting up ssl pinning"

    move-object/from16 v0, p3

    invoke-virtual {v0, v7}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 69
    .end local v17    # "e":Ljava/lang/Exception;
    :cond_3
    const-string v7, "acceptAllCerts"

    move-object/from16 v0, p1

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 70
    const/4 v7, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v7}, Lorg/json/JSONArray;->getBoolean(I)Z

    move-result v16

    .line 71
    .local v16, "accept":Z
    invoke-static/range {v16 .. v16}, Lcom/synconset/CordovaHttp;->acceptAllCerts(Z)V

    goto/16 :goto_0

    .line 72
    .end local v16    # "accept":Z
    :cond_4
    const-string v7, "setHeader"

    move-object/from16 v0, p1

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 73
    const/4 v7, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v7}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v20

    .line 74
    .local v20, "header":Ljava/lang/String;
    const/4 v7, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v7}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v26

    .line 75
    .local v26, "value":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    move-object/from16 v2, v26

    invoke-direct {v0, v1, v2}, Lcom/synconset/CordovaHttpPlugin;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 77
    .end local v20    # "header":Ljava/lang/String;
    .end local v26    # "value":Ljava/lang/String;
    :cond_5
    const-string v7, "uploadFile"

    move-object/from16 v0, p1

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 78
    const/4 v7, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v7}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 79
    .restart local v4    # "urlString":Ljava/lang/String;
    const/4 v7, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v7}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v22

    .line 80
    .restart local v22    # "params":Lorg/json/JSONObject;
    const/4 v7, 0x2

    move-object/from16 v0, p2

    invoke-virtual {v0, v7}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v21

    .line 81
    .restart local v21    # "headers":Lorg/json/JSONObject;
    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-direct {v0, v1}, Lcom/synconset/CordovaHttpPlugin;->getMapFromJSONObject(Lorg/json/JSONObject;)Ljava/util/HashMap;

    move-result-object v5

    .line 82
    .restart local v5    # "paramsMap":Ljava/util/HashMap;, "Ljava/util/HashMap<**>;"
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/synconset/CordovaHttpPlugin;->globalHeaders:Ljava/util/HashMap;

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-direct {v0, v7, v1}, Lcom/synconset/CordovaHttpPlugin;->addToMap(Ljava/util/HashMap;Lorg/json/JSONObject;)Ljava/util/HashMap;

    move-result-object v6

    .line 83
    .restart local v6    # "headersMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v7, 0x3

    move-object/from16 v0, p2

    invoke-virtual {v0, v7}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 84
    .local v8, "filePath":Ljava/lang/String;
    const/4 v7, 0x4

    move-object/from16 v0, p2

    invoke-virtual {v0, v7}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 85
    .local v9, "name":Ljava/lang/String;
    new-instance v3, Lcom/synconset/CordovaHttpUpload;

    move-object/from16 v7, p3

    invoke-direct/range {v3 .. v9}, Lcom/synconset/CordovaHttpUpload;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;Lorg/apache/cordova/CallbackContext;Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    .local v3, "upload":Lcom/synconset/CordovaHttpUpload;
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/synconset/CordovaHttpPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v7}, Lorg/apache/cordova/CordovaInterface;->getThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v7

    invoke-interface {v7, v3}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    goto/16 :goto_0

    .line 87
    .end local v3    # "upload":Lcom/synconset/CordovaHttpUpload;
    .end local v4    # "urlString":Ljava/lang/String;
    .end local v5    # "paramsMap":Ljava/util/HashMap;, "Ljava/util/HashMap<**>;"
    .end local v6    # "headersMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v8    # "filePath":Ljava/lang/String;
    .end local v9    # "name":Ljava/lang/String;
    .end local v21    # "headers":Lorg/json/JSONObject;
    .end local v22    # "params":Lorg/json/JSONObject;
    :cond_6
    const-string v7, "downloadFile"

    move-object/from16 v0, p1

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_7

    .line 88
    const/4 v7, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v7}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 89
    .restart local v4    # "urlString":Ljava/lang/String;
    const/4 v7, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v7}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v22

    .line 90
    .restart local v22    # "params":Lorg/json/JSONObject;
    const/4 v7, 0x2

    move-object/from16 v0, p2

    invoke-virtual {v0, v7}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v21

    .line 91
    .restart local v21    # "headers":Lorg/json/JSONObject;
    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-direct {v0, v1}, Lcom/synconset/CordovaHttpPlugin;->getMapFromJSONObject(Lorg/json/JSONObject;)Ljava/util/HashMap;

    move-result-object v5

    .line 92
    .restart local v5    # "paramsMap":Ljava/util/HashMap;, "Ljava/util/HashMap<**>;"
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/synconset/CordovaHttpPlugin;->globalHeaders:Ljava/util/HashMap;

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-direct {v0, v7, v1}, Lcom/synconset/CordovaHttpPlugin;->addToMap(Ljava/util/HashMap;Lorg/json/JSONObject;)Ljava/util/HashMap;

    move-result-object v6

    .line 93
    .restart local v6    # "headersMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v7, 0x3

    move-object/from16 v0, p2

    invoke-virtual {v0, v7}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 94
    .restart local v8    # "filePath":Ljava/lang/String;
    new-instance v10, Lcom/synconset/CordovaHttpDownload;

    move-object v11, v4

    move-object v12, v5

    move-object v13, v6

    move-object/from16 v14, p3

    move-object v15, v8

    invoke-direct/range {v10 .. v15}, Lcom/synconset/CordovaHttpDownload;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;Lorg/apache/cordova/CallbackContext;Ljava/lang/String;)V

    .line 95
    .local v10, "download":Lcom/synconset/CordovaHttpDownload;
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/synconset/CordovaHttpPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v7}, Lorg/apache/cordova/CordovaInterface;->getThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v7

    invoke-interface {v7, v10}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    goto/16 :goto_0

    .line 97
    .end local v4    # "urlString":Ljava/lang/String;
    .end local v5    # "paramsMap":Ljava/util/HashMap;, "Ljava/util/HashMap<**>;"
    .end local v6    # "headersMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v8    # "filePath":Ljava/lang/String;
    .end local v10    # "download":Lcom/synconset/CordovaHttpDownload;
    .end local v21    # "headers":Lorg/json/JSONObject;
    .end local v22    # "params":Lorg/json/JSONObject;
    :cond_7
    const/4 v7, 0x0

    goto/16 :goto_1
.end method

.method public initialize(Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V
    .locals 1
    .param p1, "cordova"    # Lorg/apache/cordova/CordovaInterface;
    .param p2, "webView"    # Lorg/apache/cordova/CordovaWebView;

    .prologue
    .line 33
    invoke-super {p0, p1, p2}, Lorg/apache/cordova/CordovaPlugin;->initialize(Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V

    .line 34
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/synconset/CordovaHttpPlugin;->globalHeaders:Ljava/util/HashMap;

    .line 35
    return-void
.end method
