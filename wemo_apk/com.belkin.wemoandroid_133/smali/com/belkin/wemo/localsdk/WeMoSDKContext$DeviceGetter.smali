.class Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceGetter;
.super Landroid/os/AsyncTask;
.source "WeMoSDKContext.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/localsdk/WeMoSDKContext;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DeviceGetter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/wemo/localsdk/WeMoSDKContext;


# direct methods
.method private constructor <init>(Lcom/belkin/wemo/localsdk/WeMoSDKContext;)V
    .locals 0

    .prologue
    .line 258
    iput-object p1, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceGetter;->this$0:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 258
    check-cast p1, [Ljava/lang/Void;

    .end local p1    # "x0":[Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceGetter;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 15
    .param p1, "param"    # [Ljava/lang/Void;

    .prologue
    .line 266
    :try_start_0
    iget-object v12, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceGetter;->this$0:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    invoke-static {v12}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->access$200(Lcom/belkin/wemo/localsdk/WeMoSDKContext;)Ljava/lang/String;

    move-result-object v12

    const-string v13, " on DeviceGetter is called in WEMOSDKCONTEXT :: "

    invoke-static {v12, v13}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 267
    iget-object v12, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceGetter;->this$0:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    invoke-static {v12}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->access$300(Lcom/belkin/wemo/localsdk/WeMoSDKContext;)Ljava/util/concurrent/CopyOnWriteArrayList;

    move-result-object v12

    invoke-virtual {v12}, Ljava/util/concurrent/CopyOnWriteArrayList;->clone()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 268
    .local v3, "deviceToCheck":Ljava/util/concurrent/CopyOnWriteArrayList;, "Ljava/util/concurrent/CopyOnWriteArrayList<Lcom/belkin/wemo/localsdk/WeMoDevice;>;"
    iget-object v12, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceGetter;->this$0:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    invoke-static {v12}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->access$100(Lcom/belkin/wemo/localsdk/WeMoSDKContext;)Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v12

    invoke-virtual {v12}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v2

    .line 269
    .local v2, "devList":Lorg/cybergarage/upnp/DeviceList;
    invoke-virtual {v2}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v1

    .line 270
    .local v1, "devCnt":I
    const/4 v5, 0x0

    .line 271
    .local v5, "found":Z
    const/4 v10, 0x0

    .local v10, "n":I
    :goto_0
    if-ge v10, v1, :cond_3

    .line 272
    invoke-virtual {v2, v10}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v0

    .line 273
    .local v0, "dev":Lorg/cybergarage/upnp/Device;
    const/4 v5, 0x0

    .line 274
    invoke-virtual {v3}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/belkin/wemo/localsdk/WeMoDevice;

    .line 276
    .local v11, "wemoDevice":Lcom/belkin/wemo/localsdk/WeMoDevice;
    invoke-virtual {v11}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getUDN()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v0}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    .line 278
    const/4 v5, 0x1

    .line 282
    .end local v11    # "wemoDevice":Lcom/belkin/wemo/localsdk/WeMoDevice;
    :cond_1
    iget-object v12, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceGetter;->this$0:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    invoke-static {v12}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->access$200(Lcom/belkin/wemo/localsdk/WeMoSDKContext;)Ljava/lang/String;

    move-result-object v12

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "wemoDeviceinCacheCP udn: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v0}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, " found: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 284
    if-nez v5, :cond_2

    .line 286
    iget-object v12, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceGetter;->this$0:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    invoke-static {v12}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->access$200(Lcom/belkin/wemo/localsdk/WeMoSDKContext;)Ljava/lang/String;

    move-result-object v12

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "wemoDeviceinCacheCP not found in context, removing from CP udn: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v0}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 287
    iget-object v12, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceGetter;->this$0:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    invoke-static {v12}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->access$100(Lcom/belkin/wemo/localsdk/WeMoSDKContext;)Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v12

    invoke-virtual {v0}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Lorg/cybergarage/upnp/ControlPoint;->removeDevice(Ljava/lang/String;)V

    .line 271
    :cond_2
    add-int/lit8 v10, v10, 0x1

    goto/16 :goto_0

    .line 291
    .end local v0    # "dev":Lorg/cybergarage/upnp/Device;
    .end local v6    # "i$":Ljava/util/Iterator;
    :cond_3
    const/4 v8, 0x0

    .line 292
    .local v8, "mSearchIterationCount":I
    const/4 v9, 0x1

    .line 293
    .local v9, "mx":I
    :goto_1
    const/4 v12, 0x3

    if-ge v8, v12, :cond_4

    .line 294
    const/4 v12, 0x2

    if-ne v8, v12, :cond_6

    .line 295
    const/4 v9, 0x2

    .line 296
    const-wide/16 v12, 0x1f4

    invoke-static {v12, v13}, Ljava/lang/Thread;->sleep(J)V

    .line 297
    iget-object v12, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceGetter;->this$0:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    invoke-static {v12}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->access$100(Lcom/belkin/wemo/localsdk/WeMoSDKContext;)Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v12

    invoke-virtual {v12, v9}, Lorg/cybergarage/upnp/ControlPoint;->search(I)Z

    move-result v12

    if-nez v12, :cond_4

    .line 299
    iget-object v12, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceGetter;->this$0:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    invoke-virtual {v12}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->recreateControlPoint()Z

    .line 300
    iget-object v12, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceGetter;->this$0:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    invoke-static {v12}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->access$100(Lcom/belkin/wemo/localsdk/WeMoSDKContext;)Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v12

    invoke-virtual {v12, v9}, Lorg/cybergarage/upnp/ControlPoint;->search(I)Z

    .line 332
    :cond_4
    :goto_2
    invoke-virtual {v3}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .restart local v6    # "i$":Ljava/util/Iterator;
    :goto_3
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_5

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/belkin/wemo/localsdk/WeMoDevice;

    .line 333
    .restart local v11    # "wemoDevice":Lcom/belkin/wemo/localsdk/WeMoDevice;
    iget-object v12, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceGetter;->this$0:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    invoke-static {v12}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->access$200(Lcom/belkin/wemo/localsdk/WeMoSDKContext;)Ljava/lang/String;

    move-result-object v12

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "wemoDeviceinCacheContext udn: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v11}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getUDN()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 334
    new-instance v12, Ljava/lang/Thread;

    new-instance v13, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceGetter$1;

    invoke-direct {v13, p0, v11}, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceGetter$1;-><init>(Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceGetter;Lcom/belkin/wemo/localsdk/WeMoDevice;)V

    invoke-direct {v12, v13}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v12}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    goto :goto_3

    .line 352
    .end local v1    # "devCnt":I
    .end local v2    # "devList":Lorg/cybergarage/upnp/DeviceList;
    .end local v3    # "deviceToCheck":Ljava/util/concurrent/CopyOnWriteArrayList;, "Ljava/util/concurrent/CopyOnWriteArrayList<Lcom/belkin/wemo/localsdk/WeMoDevice;>;"
    .end local v5    # "found":Z
    .end local v6    # "i$":Ljava/util/Iterator;
    .end local v8    # "mSearchIterationCount":I
    .end local v9    # "mx":I
    .end local v10    # "n":I
    .end local v11    # "wemoDevice":Lcom/belkin/wemo/localsdk/WeMoDevice;
    :catch_0
    move-exception v4

    .line 353
    .local v4, "e":Ljava/lang/InterruptedException;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v12

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Device list refresh has been aborted "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v4}, Ljava/lang/InterruptedException;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 359
    .end local v4    # "e":Ljava/lang/InterruptedException;
    :cond_5
    :goto_4
    const/4 v12, 0x0

    return-object v12

    .line 305
    .restart local v1    # "devCnt":I
    .restart local v2    # "devList":Lorg/cybergarage/upnp/DeviceList;
    .restart local v3    # "deviceToCheck":Ljava/util/concurrent/CopyOnWriteArrayList;, "Ljava/util/concurrent/CopyOnWriteArrayList<Lcom/belkin/wemo/localsdk/WeMoDevice;>;"
    .restart local v5    # "found":Z
    .restart local v8    # "mSearchIterationCount":I
    .restart local v9    # "mx":I
    .restart local v10    # "n":I
    :cond_6
    const/4 v7, 0x0

    .line 306
    .local v7, "mSearchConCount":I
    const/4 v9, 0x1

    .line 309
    :goto_5
    const/4 v12, 0x2

    if-ge v7, v12, :cond_8

    .line 311
    const/4 v12, 0x1

    if-ne v7, v12, :cond_7

    const/4 v9, 0x2

    .line 312
    :cond_7
    :try_start_1
    iget-object v12, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceGetter;->this$0:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    invoke-static {v12}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->access$100(Lcom/belkin/wemo/localsdk/WeMoSDKContext;)Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v12

    invoke-virtual {v12, v9}, Lorg/cybergarage/upnp/ControlPoint;->search(I)Z

    move-result v12

    if-nez v12, :cond_9

    .line 314
    iget-object v12, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceGetter;->this$0:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    invoke-virtual {v12}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->recreateControlPoint()Z

    .line 316
    iget-object v12, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceGetter;->this$0:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    invoke-static {v12}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->access$100(Lcom/belkin/wemo/localsdk/WeMoSDKContext;)Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v12

    invoke-virtual {v12, v9}, Lorg/cybergarage/upnp/ControlPoint;->search(I)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    .line 328
    :cond_8
    const-wide/16 v12, 0x258

    :try_start_2
    invoke-static {v12, v13}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 329
    add-int/lit8 v8, v8, 0x1

    .line 330
    goto/16 :goto_1

    .line 319
    :cond_9
    add-int/lit8 v7, v7, 0x1

    .line 320
    const-wide/16 v12, 0xc8

    :try_start_3
    invoke-static {v12, v13}, Ljava/lang/Thread;->sleep(J)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_5

    .line 322
    :catch_1
    move-exception v4

    .line 324
    .local v4, "e":Ljava/lang/Exception;
    :try_start_4
    iget-object v12, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceGetter;->this$0:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    invoke-static {v12}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->access$200(Lcom/belkin/wemo/localsdk/WeMoSDKContext;)Ljava/lang/String;

    move-result-object v12

    const-string v13, "DeviceGetter doInBackground mControlPoint.search Exception: "

    invoke-static {v12, v13, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 325
    iget-object v12, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceGetter;->this$0:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    invoke-virtual {v12}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->recreateControlPoint()Z
    :try_end_4
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    goto/16 :goto_2

    .line 355
    .end local v1    # "devCnt":I
    .end local v2    # "devList":Lorg/cybergarage/upnp/DeviceList;
    .end local v3    # "deviceToCheck":Ljava/util/concurrent/CopyOnWriteArrayList;, "Ljava/util/concurrent/CopyOnWriteArrayList<Lcom/belkin/wemo/localsdk/WeMoDevice;>;"
    .end local v4    # "e":Ljava/lang/Exception;
    .end local v5    # "found":Z
    .end local v7    # "mSearchConCount":I
    .end local v8    # "mSearchIterationCount":I
    .end local v9    # "mx":I
    .end local v10    # "n":I
    :catch_2
    move-exception v4

    .line 357
    .restart local v4    # "e":Ljava/lang/Exception;
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_4
.end method
