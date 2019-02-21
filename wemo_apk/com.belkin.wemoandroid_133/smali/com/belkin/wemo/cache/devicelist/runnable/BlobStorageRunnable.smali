.class public Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "BlobStorageRunnable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable$1;,
        Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable$GetSetBlobStorageActionCallback;
    }
.end annotation


# static fields
.field private static final ACTION_GET_BLOB_STORAGE:Ljava/lang/String; = "GetBlobStorage"

.field private static final ACTION_SET_BLOB_STORAGE:Ljava/lang/String; = "SetBlobStorage"


# instance fields
.field private mBlobStorageOpType:Ljava/lang/String;

.field private mCallback:Lcom/belkin/wemo/cache/devicelist/callback/GetSetBlobStorageCallback;

.field private mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field private mData:Lorg/json/JSONObject;

.field private mLocalDevice:Lorg/cybergarage/upnp/Device;

.field private mUdn:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/belkin/wemo/cache/devicelist/callback/GetSetBlobStorageCallback;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Ljava/lang/String;Lorg/json/JSONObject;Lorg/cybergarage/upnp/Device;)V
    .locals 0
    .param p1, "blobStorageOptype"    # Ljava/lang/String;
    .param p2, "callback"    # Lcom/belkin/wemo/cache/devicelist/callback/GetSetBlobStorageCallback;
    .param p3, "deviceListManager"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    .param p4, "udn"    # Ljava/lang/String;
    .param p5, "data"    # Lorg/json/JSONObject;
    .param p6, "localDevice"    # Lorg/cybergarage/upnp/Device;

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 37
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;->mBlobStorageOpType:Ljava/lang/String;

    .line 38
    iput-object p2, p0, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;->mCallback:Lcom/belkin/wemo/cache/devicelist/callback/GetSetBlobStorageCallback;

    .line 39
    iput-object p3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 40
    iput-object p4, p0, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;->mUdn:Ljava/lang/String;

    .line 41
    iput-object p5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;->mData:Lorg/json/JSONObject;

    .line 42
    iput-object p6, p0, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;->mLocalDevice:Lorg/cybergarage/upnp/Device;

    .line 43
    return-void
.end method

.method static synthetic access$100(Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;

    .prologue
    .line 22
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;->mUdn:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;

    .prologue
    .line 22
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    return-object v0
.end method

.method static synthetic access$300(Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;

    .prologue
    .line 22
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;->mBlobStorageOpType:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$400(Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;)Lcom/belkin/wemo/cache/devicelist/callback/GetSetBlobStorageCallback;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;

    .prologue
    .line 22
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;->mCallback:Lcom/belkin/wemo/cache/devicelist/callback/GetSetBlobStorageCallback;

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 9

    .prologue
    .line 48
    :try_start_0
    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;->mData:Lorg/json/JSONObject;

    invoke-static {v7}, Lcom/belkin/wemo/cache/utils/BlobStorageParser;->createArgumentList(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v6

    .line 49
    .local v6, "parsedArgument":Ljava/lang/String;
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    const-string v8, "attributeList"

    invoke-virtual {v7, v8, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    .line 52
    .local v1, "arguments":Lorg/json/JSONObject;
    const/4 v0, 0x0

    .line 54
    .local v0, "actionObj":Lorg/cybergarage/upnp/Action;
    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;->mBlobStorageOpType:Ljava/lang/String;

    const-string v8, "getBlobStorage"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 55
    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;->mLocalDevice:Lorg/cybergarage/upnp/Device;

    const-string v8, "GetBlobStorage"

    invoke-virtual {v7, v8}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 61
    :cond_0
    :goto_0
    if-eqz v1, :cond_2

    invoke-virtual {v1}, Lorg/json/JSONObject;->length()I

    move-result v7

    if-lez v7, :cond_2

    .line 62
    invoke-virtual {v1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v5

    .line 63
    .local v5, "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 64
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    .line 65
    .local v4, "key":Ljava/lang/String;
    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v4, v7}, Lorg/cybergarage/upnp/Action;->setArgumentValue(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 75
    .end local v0    # "actionObj":Lorg/cybergarage/upnp/Action;
    .end local v1    # "arguments":Lorg/json/JSONObject;
    .end local v4    # "key":Ljava/lang/String;
    .end local v5    # "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    .end local v6    # "parsedArgument":Ljava/lang/String;
    :catch_0
    move-exception v3

    .line 76
    .local v3, "ex":Ljava/lang/Exception;
    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;->TAG:Ljava/lang/String;

    const-string v8, "Exception in BlobStorageRunnable"

    invoke-static {v7, v8, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 78
    .end local v3    # "ex":Ljava/lang/Exception;
    :goto_2
    return-void

    .line 56
    .restart local v0    # "actionObj":Lorg/cybergarage/upnp/Action;
    .restart local v1    # "arguments":Lorg/json/JSONObject;
    .restart local v6    # "parsedArgument":Ljava/lang/String;
    :cond_1
    :try_start_1
    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;->mBlobStorageOpType:Ljava/lang/String;

    const-string v8, "setBlobStorage"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 57
    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;->mLocalDevice:Lorg/cybergarage/upnp/Device;

    const-string v8, "SetBlobStorage"

    invoke-virtual {v7, v8}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    goto :goto_0

    .line 70
    :cond_2
    new-instance v2, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable$GetSetBlobStorageActionCallback;

    const-string v7, "SetBlobStorage"

    const/4 v8, 0x0

    invoke-direct {v2, p0, v0, v7, v8}, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable$GetSetBlobStorageActionCallback;-><init>(Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;Lorg/cybergarage/upnp/Action;Ljava/lang/String;Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable$1;)V

    .line 71
    .local v2, "callback":Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable$GetSetBlobStorageActionCallback;
    invoke-static {}, Lcom/belkin/wemo/controlaction/ControlActionHandler;->newInstance()Lcom/belkin/wemo/controlaction/ControlActionHandler;

    move-result-object v7

    invoke-virtual {v7, v0, v2, v2}, Lcom/belkin/wemo/controlaction/ControlActionHandler;->postControlAction(Lorg/cybergarage/upnp/Action;Lcom/belkin/wemo/controlaction/callback/ControlActionErrorCallback;Lcom/belkin/wemo/controlaction/callback/ControlActionSuccessCallback;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2
.end method
