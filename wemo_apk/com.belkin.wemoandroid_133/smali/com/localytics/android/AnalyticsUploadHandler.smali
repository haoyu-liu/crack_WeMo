.class final Lcom/localytics/android/AnalyticsUploadHandler;
.super Lcom/localytics/android/BaseUploadThread;
.source "AnalyticsUploadHandler.java"


# static fields
.field private static final ANALYTICS_URL_HTTP:Ljava/lang/String; = "http://%s/api/v2/applications/%s/uploads"

.field private static final ANALYTICS_URL_HTTPS:Ljava/lang/String; = "https://%s/api/v2/uploads"


# direct methods
.method constructor <init>(Lcom/localytics/android/BaseHandler;Ljava/util/TreeMap;Ljava/lang/String;Lcom/localytics/android/LocalyticsDao;)V
    .locals 0
    .param p1, "sessionHandler"    # Lcom/localytics/android/BaseHandler;
    .param p3, "customerId"    # Ljava/lang/String;
    .param p4, "localyticsDao"    # Lcom/localytics/android/LocalyticsDao;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/localytics/android/BaseHandler;",
            "Ljava/util/TreeMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            "Lcom/localytics/android/LocalyticsDao;",
            ")V"
        }
    .end annotation

    .prologue
    .line 29
    .local p2, "data":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/Integer;Ljava/lang/Object;>;"
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/localytics/android/BaseUploadThread;-><init>(Lcom/localytics/android/BaseHandler;Ljava/util/TreeMap;Ljava/lang/String;Lcom/localytics/android/LocalyticsDao;)V

    .line 30
    return-void
.end method


# virtual methods
.method uploadData()I
    .locals 11

    .prologue
    .line 35
    const/4 v4, 0x0

    .line 39
    .local v4, "rowsToDelete":I
    :try_start_0
    iget-object v6, p0, Lcom/localytics/android/AnalyticsUploadHandler;->mData:Ljava/util/TreeMap;

    invoke-virtual {v6}, Ljava/util/TreeMap;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_1

    .line 41
    iget-object v6, p0, Lcom/localytics/android/AnalyticsUploadHandler;->mData:Ljava/util/TreeMap;

    invoke-virtual {v6}, Ljava/util/TreeMap;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 43
    .local v3, "it":Ljava/util/Iterator;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 44
    .local v1, "builder":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Lcom/localytics/android/AnalyticsUploadHandler;->getApiKey()Ljava/lang/String;

    move-result-object v0

    .line 45
    .local v0, "apiKey":Ljava/lang/String;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 47
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 48
    .local v2, "eventBlob":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/lang/Object;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 49
    const/16 v6, 0xa

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 60
    .end local v0    # "apiKey":Ljava/lang/String;
    .end local v1    # "builder":Ljava/lang/StringBuilder;
    .end local v2    # "eventBlob":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/lang/Object;>;"
    .end local v3    # "it":Ljava/util/Iterator;
    :catchall_0
    move-exception v6

    move v5, v4

    .end local v4    # "rowsToDelete":I
    .local v5, "rowsToDelete":I
    :goto_1
    return v5

    .line 52
    .end local v5    # "rowsToDelete":I
    .restart local v0    # "apiKey":Ljava/lang/String;
    .restart local v1    # "builder":Ljava/lang/StringBuilder;
    .restart local v3    # "it":Ljava/util/Iterator;
    .restart local v4    # "rowsToDelete":I
    :cond_0
    sget-object v7, Lcom/localytics/android/BaseUploadThread$UploadType;->ANALYTICS:Lcom/localytics/android/BaseUploadThread$UploadType;

    sget-boolean v6, Lcom/localytics/android/Constants;->USE_HTTPS:Z

    if-eqz v6, :cond_2

    const-string v6, "https://%s/api/v2/uploads"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    sget-object v10, Lcom/localytics/android/Constants;->ANALYTICS_HOST:Ljava/lang/String;

    aput-object v10, v8, v9

    invoke-static {v6, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    :goto_2
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    invoke-virtual {p0, v7, v6, v8, v9}, Lcom/localytics/android/AnalyticsUploadHandler;->upload(Lcom/localytics/android/BaseUploadThread$UploadType;Ljava/lang/String;Ljava/lang/String;I)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 54
    iget-object v6, p0, Lcom/localytics/android/AnalyticsUploadHandler;->mData:Ljava/util/TreeMap;

    invoke-virtual {v6}, Ljava/util/TreeMap;->lastKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .end local v0    # "apiKey":Ljava/lang/String;
    .end local v1    # "builder":Ljava/lang/StringBuilder;
    .end local v3    # "it":Ljava/util/Iterator;
    :cond_1
    move v5, v4

    .line 60
    .end local v4    # "rowsToDelete":I
    .restart local v5    # "rowsToDelete":I
    goto :goto_1

    .line 52
    .end local v5    # "rowsToDelete":I
    .restart local v0    # "apiKey":Ljava/lang/String;
    .restart local v1    # "builder":Ljava/lang/StringBuilder;
    .restart local v3    # "it":Ljava/util/Iterator;
    .restart local v4    # "rowsToDelete":I
    :cond_2
    const-string v6, "http://%s/api/v2/applications/%s/uploads"

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    sget-object v10, Lcom/localytics/android/Constants;->ANALYTICS_HOST:Ljava/lang/String;

    aput-object v10, v8, v9

    const/4 v9, 0x1

    aput-object v0, v8, v9

    invoke-static {v6, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v6

    goto :goto_2
.end method
