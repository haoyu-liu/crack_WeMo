.class public Lcom/belkin/wemo/cache/devicelist/DLMGetActionResult;
.super Landroid/os/AsyncTask;
.source "DLMGetActionResult.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Object;",
        "Ljava/lang/Void;",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "DLMGetActionResult"


# instance fields
.field private mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field private propertyList:Lorg/json/JSONObject;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V
    .locals 1
    .param p1, "oDLM"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .prologue
    .line 17
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 15
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DLMGetActionResult;->propertyList:Lorg/json/JSONObject;

    .line 18
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/DLMGetActionResult;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 19
    return-void
.end method


# virtual methods
.method public varargs doInBackground([Ljava/lang/Object;)Ljava/lang/Boolean;
    .locals 12
    .param p1, "params"    # [Ljava/lang/Object;

    .prologue
    .line 23
    const/4 v6, 0x0

    .line 24
    .local v6, "result":Z
    const/4 v9, 0x0

    aget-object v7, p1, v9

    check-cast v7, Ljava/lang/String;

    .line 25
    .local v7, "udn":Ljava/lang/String;
    const/4 v9, 0x1

    aget-object v1, p1, v9

    check-cast v1, Ljava/lang/String;

    .line 26
    .local v1, "actionName":Ljava/lang/String;
    const/4 v9, 0x2

    aget-object v9, p1, v9

    check-cast v9, [Ljava/lang/String;

    move-object v2, v9

    check-cast v2, [Ljava/lang/String;

    .line 27
    .local v2, "arg":[Ljava/lang/String;
    const/4 v9, 0x3

    aget-object v9, p1, v9

    check-cast v9, [Ljava/lang/String;

    move-object v8, v9

    check-cast v8, [Ljava/lang/String;

    .line 30
    .local v8, "values":[Ljava/lang/String;
    :try_start_0
    iget-object v9, p0, Lcom/belkin/wemo/cache/devicelist/DLMGetActionResult;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v9}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v3

    .line 31
    .local v3, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    invoke-virtual {v3, v7}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v9

    invoke-virtual {v9, v1}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 32
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    iget-object v9, p0, Lcom/belkin/wemo/cache/devicelist/DLMGetActionResult;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v9, v0, v2, v8}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)V

    .line 33
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v5

    .line 34
    .local v5, "response":Ljava/lang/String;
    if-eqz v5, :cond_0

    .line 35
    const-string v9, "DLMGetActionResult"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "success from action:"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " resp: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 36
    const/4 v6, 0x1

    .line 46
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v3    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .end local v5    # "response":Ljava/lang/String;
    :goto_0
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    return-object v9

    .line 38
    .restart local v0    # "action":Lorg/cybergarage/upnp/Action;
    .restart local v3    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .restart local v5    # "response":Ljava/lang/String;
    :cond_0
    :try_start_1
    const-string v9, "DLMGetActionResult"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Error in action "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " resp: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 39
    const/4 v6, 0x0

    goto :goto_0

    .line 42
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v3    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .end local v5    # "response":Ljava/lang/String;
    :catch_0
    move-exception v4

    .line 43
    .local v4, "e":Ljava/lang/Exception;
    const-string v9, "DLMGetActionResult"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Error getting action value"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 12
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/cache/devicelist/DLMGetActionResult;->doInBackground([Ljava/lang/Object;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method
