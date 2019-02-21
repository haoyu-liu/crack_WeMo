.class public Lcom/belkin/cybergarage/wrapper/ControlActionHandler;
.super Ljava/lang/Object;
.source "ControlActionHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionErrorCallback;,
        Lcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionSuccessCallback;
    }
.end annotation


# static fields
.field public static final TAG:Ljava/lang/String; = "ControlActionHandler"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    return-void
.end method

.method public static newInstance()Lcom/belkin/cybergarage/wrapper/ControlActionHandler;
    .locals 1

    .prologue
    .line 89
    new-instance v0, Lcom/belkin/cybergarage/wrapper/ControlActionHandler;

    invoke-direct {v0}, Lcom/belkin/cybergarage/wrapper/ControlActionHandler;-><init>()V

    return-object v0
.end method


# virtual methods
.method public declared-synchronized postControlAction(Lorg/cybergarage/upnp/Action;IILcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionErrorCallback;Lcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionSuccessCallback;)V
    .locals 7
    .param p1, "action"    # Lorg/cybergarage/upnp/Action;
    .param p2, "soTimeout"    # I
    .param p3, "connectTimeout"    # I
    .param p4, "errorCallback"    # Lcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionErrorCallback;
    .param p5, "successCallback"    # Lcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionSuccessCallback;

    .prologue
    .line 119
    monitor-enter p0

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    move-object v5, p5

    :try_start_0
    invoke-virtual/range {v0 .. v6}, Lcom/belkin/cybergarage/wrapper/ControlActionHandler;->postControlAction(Lorg/cybergarage/upnp/Action;IILcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionErrorCallback;Lcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionSuccessCallback;Ljava/util/HashMap;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 120
    monitor-exit p0

    return-void

    .line 119
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized postControlAction(Lorg/cybergarage/upnp/Action;IILcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionErrorCallback;Lcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionSuccessCallback;Ljava/util/HashMap;)V
    .locals 7
    .param p1, "action"    # Lorg/cybergarage/upnp/Action;
    .param p2, "soTimeout"    # I
    .param p3, "connectTimeout"    # I
    .param p4, "errorCallback"    # Lcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionErrorCallback;
    .param p5, "successCallback"    # Lcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionSuccessCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/cybergarage/upnp/Action;",
            "II",
            "Lcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionErrorCallback;",
            "Lcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionSuccessCallback;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 126
    .local p6, "argumentsHashMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    monitor-enter p0

    if-eqz p1, :cond_3

    .line 127
    if-eqz p6, :cond_0

    .line 128
    :try_start_0
    invoke-virtual {p6}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 129
    .local v0, "argument":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {p1, v4, v5}, Lorg/cybergarage/upnp/Action;->setArgumentValue(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 126
    .end local v0    # "argument":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v2    # "i$":Ljava/util/Iterator;
    :catchall_0
    move-exception v4

    monitor-exit p0

    throw v4

    .line 135
    :cond_0
    :try_start_1
    invoke-virtual {p1, p2, p3}, Lorg/cybergarage/upnp/Action;->postControlAction(II)Ljava/lang/String;

    move-result-object v3

    .line 136
    .local v3, "responseXMLStr":Ljava/lang/String;
    const-string v4, "ControlActionHandler"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "XML response received after posting uPnP action: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 137
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 138
    if-eqz p4, :cond_1

    .line 139
    new-instance v4, Lcom/belkin/exception/WemoException;

    const-string v5, "Socket connection error while trying to post uPnP Action."

    invoke-direct {v4, v5}, Lcom/belkin/exception/WemoException;-><init>(Ljava/lang/String;)V

    invoke-interface {p4, v4}, Lcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionErrorCallback;->onActionError(Ljava/lang/Exception;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 159
    .end local v3    # "responseXMLStr":Ljava/lang/String;
    :cond_1
    :goto_1
    monitor-exit p0

    return-void

    .line 142
    .restart local v3    # "responseXMLStr":Ljava/lang/String;
    :cond_2
    if-eqz p5, :cond_1

    .line 143
    :try_start_2
    invoke-interface {p5, v3}, Lcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionSuccessCallback;->onActionSuccess(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 146
    .end local v3    # "responseXMLStr":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 147
    .local v1, "e":Ljava/lang/Exception;
    :try_start_3
    const-string v4, "ControlActionHandler"

    const-string v5, "Exception while posting control action: "

    invoke-static {v4, v5, v1}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 149
    if-eqz p4, :cond_1

    if-eqz v1, :cond_1

    .line 150
    invoke-interface {p4, v1}, Lcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionErrorCallback;->onActionError(Ljava/lang/Exception;)V

    goto :goto_1

    .line 155
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_3
    if-eqz p4, :cond_1

    .line 156
    new-instance v4, Lcom/belkin/wemo/exception/InvalidArgumentsException;

    const-string v5, "ACTION is invalid!"

    invoke-direct {v4, v5}, Lcom/belkin/wemo/exception/InvalidArgumentsException;-><init>(Ljava/lang/String;)V

    invoke-interface {p4, v4}, Lcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionErrorCallback;->onActionError(Ljava/lang/Exception;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1
.end method

.method public declared-synchronized postControlAction(Lorg/cybergarage/upnp/Action;Lcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionErrorCallback;Lcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionSuccessCallback;)V
    .locals 7
    .param p1, "action"    # Lorg/cybergarage/upnp/Action;
    .param p2, "errorCallback"    # Lcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionErrorCallback;
    .param p3, "successCallback"    # Lcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionSuccessCallback;

    .prologue
    .line 102
    monitor-enter p0

    const v2, 0x2bf20

    const/16 v3, 0x7530

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v4, p2

    move-object v5, p3

    :try_start_0
    invoke-virtual/range {v0 .. v6}, Lcom/belkin/cybergarage/wrapper/ControlActionHandler;->postControlAction(Lorg/cybergarage/upnp/Action;IILcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionErrorCallback;Lcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionSuccessCallback;Ljava/util/HashMap;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 103
    monitor-exit p0

    return-void

    .line 102
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
