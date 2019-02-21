.class Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable$GetSetBlobStorageActionCallback;
.super Ljava/lang/Object;
.source "BlobStorageRunnable.java"

# interfaces
.implements Lcom/belkin/wemo/controlaction/callback/ControlActionErrorCallback;
.implements Lcom/belkin/wemo/controlaction/callback/ControlActionSuccessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GetSetBlobStorageActionCallback"
.end annotation


# instance fields
.field private final TAG:Ljava/lang/String;

.field private actionName:Ljava/lang/String;

.field private actionObj:Lorg/cybergarage/upnp/Action;

.field final synthetic this$0:Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;


# direct methods
.method private constructor <init>(Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;Lorg/cybergarage/upnp/Action;Ljava/lang/String;)V
    .locals 1
    .param p2, "action"    # Lorg/cybergarage/upnp/Action;
    .param p3, "name"    # Ljava/lang/String;

    .prologue
    .line 88
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable$GetSetBlobStorageActionCallback;->this$0:Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 86
    const-string v0, "GetBlobStorageActionCallback"

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable$GetSetBlobStorageActionCallback;->TAG:Ljava/lang/String;

    .line 89
    iput-object p2, p0, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable$GetSetBlobStorageActionCallback;->actionObj:Lorg/cybergarage/upnp/Action;

    .line 90
    iput-object p3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable$GetSetBlobStorageActionCallback;->actionName:Ljava/lang/String;

    .line 91
    return-void
.end method

.method synthetic constructor <init>(Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;Lorg/cybergarage/upnp/Action;Ljava/lang/String;Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;
    .param p2, "x1"    # Lorg/cybergarage/upnp/Action;
    .param p3, "x2"    # Ljava/lang/String;
    .param p4, "x3"    # Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable$1;

    .prologue
    .line 82
    invoke-direct {p0, p1, p2, p3}, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable$GetSetBlobStorageActionCallback;-><init>(Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;Lorg/cybergarage/upnp/Action;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public onActionError(Ljava/lang/Exception;)V
    .locals 4
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 128
    const-string v0, "GetBlobStorageActionCallback"

    const-string v1, "Exception in GetBlobStorageActionCallback "

    invoke-static {v0, v1, p1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 129
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable$GetSetBlobStorageActionCallback;->this$0:Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;->access$300(Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "getBlobStorage"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 130
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable$GetSetBlobStorageActionCallback;->this$0:Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;->access$200(Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable$GetSetBlobStorageActionCallback;->this$0:Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;

    invoke-static {v1}, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;->access$200(Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v1, "get_blob_storage"

    const-string v2, "false"

    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable$GetSetBlobStorageActionCallback;->this$0:Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;

    invoke-static {v3}, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;->access$100(Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 134
    :goto_0
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable$GetSetBlobStorageActionCallback;->this$0:Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;->access$400(Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;)Lcom/belkin/wemo/cache/devicelist/callback/GetSetBlobStorageCallback;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/devicelist/callback/GetSetBlobStorageCallback;->onError(Ljava/lang/String;)V

    .line 135
    return-void

    .line 132
    :cond_0
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable$GetSetBlobStorageActionCallback;->this$0:Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;->access$200(Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable$GetSetBlobStorageActionCallback;->this$0:Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;

    invoke-static {v1}, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;->access$200(Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v1, "set_blob_storage"

    const-string v2, "false"

    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable$GetSetBlobStorageActionCallback;->this$0:Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;

    invoke-static {v3}, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;->access$100(Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onActionSuccess(Ljava/lang/String;)V
    .locals 10
    .param p1, "responseXMLStr"    # Ljava/lang/String;

    .prologue
    .line 96
    :try_start_0
    const-string v6, "GetBlobStorageActionCallback"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Success in GetBlobStorageActionCallback responseXMLStr: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "PARSED STRING: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    new-instance v8, Lcom/belkin/wemo/localsdk/parser/GetAttributeResponseParser;

    invoke-direct {v8}, Lcom/belkin/wemo/localsdk/parser/GetAttributeResponseParser;-><init>()V

    invoke-virtual {v8, p1}, Lcom/belkin/wemo/localsdk/parser/GetAttributeResponseParser;->parseGetAttributeResponse(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v8

    invoke-virtual {v8}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable$GetSetBlobStorageActionCallback;->this$0:Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;

    invoke-static {v6}, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;->access$200(Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable$GetSetBlobStorageActionCallback;->this$0:Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;

    invoke-static {v7}, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;->access$100(Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDevice(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v3

    .line 100
    .local v3, "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual {v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getAttributeList()Lorg/json/JSONObject;

    move-result-object v1

    .line 102
    .local v1, "attrList":Lorg/json/JSONObject;
    new-instance v6, Lcom/belkin/wemo/localsdk/parser/GetAttributeResponseParser;

    invoke-direct {v6}, Lcom/belkin/wemo/localsdk/parser/GetAttributeResponseParser;-><init>()V

    invoke-virtual {v6, p1}, Lcom/belkin/wemo/localsdk/parser/GetAttributeResponseParser;->parseGetAttributeResponse(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 103
    .local v0, "actionResponse":Lorg/json/JSONObject;
    invoke-virtual {v0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v5

    .line 104
    .local v5, "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    const-string v2, ""

    .line 106
    .local v2, "currentKey":Ljava/lang/String;
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 107
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "currentKey":Ljava/lang/String;
    check-cast v2, Ljava/lang/String;

    .line 108
    .restart local v2    # "currentKey":Ljava/lang/String;
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    invoke-virtual {v1, v2, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 121
    .end local v0    # "actionResponse":Lorg/json/JSONObject;
    .end local v1    # "attrList":Lorg/json/JSONObject;
    .end local v2    # "currentKey":Ljava/lang/String;
    .end local v3    # "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v5    # "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :catch_0
    move-exception v4

    .line 122
    .local v4, "ex":Ljava/lang/Exception;
    const-string v6, "GetBlobStorageActionCallback"

    const-string v7, "Exception in onActionSuccess"

    invoke-static {v6, v7, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 124
    .end local v4    # "ex":Ljava/lang/Exception;
    :goto_1
    return-void

    .line 110
    .restart local v0    # "actionResponse":Lorg/json/JSONObject;
    .restart local v1    # "attrList":Lorg/json/JSONObject;
    .restart local v2    # "currentKey":Ljava/lang/String;
    .restart local v3    # "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .restart local v5    # "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_0
    :try_start_1
    const-string v6, "GetBlobStorageActionCallback"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Attribute list to set: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    invoke-virtual {v3, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeList(Lorg/json/JSONObject;)V

    .line 112
    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable$GetSetBlobStorageActionCallback;->this$0:Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;

    invoke-static {v6}, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;->access$200(Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v6, v3, v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setDeviceInformationToDevicesArrayLocal(Lcom/belkin/wemo/cache/data/DeviceInformation;Z)V

    .line 114
    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable$GetSetBlobStorageActionCallback;->this$0:Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;

    invoke-static {v6}, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;->access$300(Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "getBlobStorage"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 115
    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable$GetSetBlobStorageActionCallback;->this$0:Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;

    invoke-static {v6}, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;->access$200(Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable$GetSetBlobStorageActionCallback;->this$0:Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;

    invoke-static {v7}, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;->access$200(Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v7, "get_blob_storage"

    const-string v8, "true"

    iget-object v9, p0, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable$GetSetBlobStorageActionCallback;->this$0:Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;

    invoke-static {v9}, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;->access$100(Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v7, v8, v9}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    :goto_2
    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable$GetSetBlobStorageActionCallback;->this$0:Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;

    invoke-static {v6}, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;->access$400(Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;)Lcom/belkin/wemo/cache/devicelist/callback/GetSetBlobStorageCallback;

    move-result-object v6

    invoke-virtual {v6, p1}, Lcom/belkin/wemo/cache/devicelist/callback/GetSetBlobStorageCallback;->onSuccess(Ljava/lang/String;)V

    goto :goto_1

    .line 117
    :cond_1
    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable$GetSetBlobStorageActionCallback;->this$0:Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;

    invoke-static {v6}, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;->access$200(Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable$GetSetBlobStorageActionCallback;->this$0:Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;

    invoke-static {v7}, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;->access$200(Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v7, "set_blob_storage"

    const-string v8, "true"

    iget-object v9, p0, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable$GetSetBlobStorageActionCallback;->this$0:Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;

    invoke-static {v9}, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;->access$100(Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v7, v8, v9}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2
.end method
