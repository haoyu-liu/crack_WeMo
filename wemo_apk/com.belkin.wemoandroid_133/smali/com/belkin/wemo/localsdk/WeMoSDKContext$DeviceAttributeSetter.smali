.class Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceAttributeSetter;
.super Landroid/os/AsyncTask;
.source "WeMoSDKContext.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/localsdk/WeMoSDKContext;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DeviceAttributeSetter"
.end annotation

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


# instance fields
.field private argumetList:[Ljava/lang/String;

.field private attributeList:Lorg/json/JSONObject;

.field private mWeMoDevice:Lcom/belkin/wemo/localsdk/WeMoDevice;

.field final synthetic this$0:Lcom/belkin/wemo/localsdk/WeMoSDKContext;


# direct methods
.method private constructor <init>(Lcom/belkin/wemo/localsdk/WeMoSDKContext;)V
    .locals 1

    .prologue
    .line 557
    iput-object p1, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceAttributeSetter;->this$0:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 560
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceAttributeSetter;->attributeList:Lorg/json/JSONObject;

    return-void
.end method

.method synthetic constructor <init>(Lcom/belkin/wemo/localsdk/WeMoSDKContext;Lcom/belkin/wemo/localsdk/WeMoSDKContext$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/belkin/wemo/localsdk/WeMoSDKContext;
    .param p2, "x1"    # Lcom/belkin/wemo/localsdk/WeMoSDKContext$1;

    .prologue
    .line 557
    invoke-direct {p0, p1}, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceAttributeSetter;-><init>(Lcom/belkin/wemo/localsdk/WeMoSDKContext;)V

    return-void
.end method

.method private updateAttributeList()V
    .locals 10

    .prologue
    const/4 v8, 0x0

    .line 594
    const/4 v4, 0x0

    .line 596
    .local v4, "prevAttributeList":Lorg/json/JSONObject;
    :try_start_0
    new-instance v5, Lorg/json/JSONObject;

    iget-object v7, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceAttributeSetter;->mWeMoDevice:Lcom/belkin/wemo/localsdk/WeMoDevice;

    invoke-virtual {v7}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getAttribute()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v7}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    .line 597
    .end local v4    # "prevAttributeList":Lorg/json/JSONObject;
    .local v5, "prevAttributeList":Lorg/json/JSONObject;
    :try_start_1
    invoke-virtual {v5}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v3

    .line 598
    .local v3, "getterKeyIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 600
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 601
    .local v0, "attributeKey":Ljava/lang/String;
    iget-object v7, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceAttributeSetter;->attributeList:Lorg/json/JSONObject;

    invoke-virtual {v7, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 603
    iget-object v7, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceAttributeSetter;->attributeList:Lorg/json/JSONObject;

    invoke-virtual {v7, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 604
    .local v6, "value":Ljava/lang/String;
    if-eqz v6, :cond_0

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_0

    const-string v7, "null"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_0

    const-string v7, ""

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 606
    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 607
    .local v1, "attributeObejct":Lorg/json/JSONObject;
    const-string v7, "value"

    invoke-virtual {v1, v7, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 608
    const-string v7, "Switch"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 609
    iget-object v7, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceAttributeSetter;->mWeMoDevice:Lcom/belkin/wemo/localsdk/WeMoDevice;

    invoke-virtual {v7, v6}, Lcom/belkin/wemo/localsdk/WeMoDevice;->setState(Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 616
    .end local v0    # "attributeKey":Ljava/lang/String;
    .end local v1    # "attributeObejct":Lorg/json/JSONObject;
    .end local v3    # "getterKeyIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    .end local v6    # "value":Ljava/lang/String;
    :catch_0
    move-exception v2

    move-object v4, v5

    .line 618
    .end local v5    # "prevAttributeList":Lorg/json/JSONObject;
    .local v2, "e":Lorg/json/JSONException;
    .restart local v4    # "prevAttributeList":Lorg/json/JSONObject;
    :goto_1
    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    .line 620
    .end local v2    # "e":Lorg/json/JSONException;
    :goto_2
    if-eqz v4, :cond_1

    invoke-virtual {v4, v8}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_1

    const-string v7, ""

    invoke-virtual {v4, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_1

    .line 621
    iget-object v7, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceAttributeSetter;->mWeMoDevice:Lcom/belkin/wemo/localsdk/WeMoDevice;

    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/belkin/wemo/localsdk/WeMoDevice;->setAttribute(Ljava/lang/String;)V

    .line 623
    :cond_1
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v8, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceAttributeSetter;->this$0:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    invoke-static {v8}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->access$200(Lcom/belkin/wemo/localsdk/WeMoSDKContext;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ".SetDeviceAttributeRunnable"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "updateAttributeList attributeList "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 624
    return-void

    .end local v4    # "prevAttributeList":Lorg/json/JSONObject;
    .restart local v3    # "getterKeyIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    .restart local v5    # "prevAttributeList":Lorg/json/JSONObject;
    :cond_2
    move-object v4, v5

    .line 619
    .end local v5    # "prevAttributeList":Lorg/json/JSONObject;
    .restart local v4    # "prevAttributeList":Lorg/json/JSONObject;
    goto :goto_2

    .line 616
    .end local v3    # "getterKeyIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :catch_1
    move-exception v2

    goto :goto_1
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Object;)Ljava/lang/Boolean;
    .locals 8
    .param p1, "params"    # [Ljava/lang/Object;

    .prologue
    const/4 v5, 0x1

    const/4 v7, 0x0

    .line 563
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    .line 564
    .local v3, "result":Ljava/lang/Boolean;
    aget-object v4, p1, v7

    check-cast v4, [Ljava/lang/String;

    check-cast v4, [Ljava/lang/String;

    iput-object v4, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceAttributeSetter;->argumetList:[Ljava/lang/String;

    .line 565
    aget-object v4, p1, v5

    check-cast v4, Lcom/belkin/wemo/localsdk/WeMoDevice;

    iput-object v4, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceAttributeSetter;->mWeMoDevice:Lcom/belkin/wemo/localsdk/WeMoDevice;

    .line 566
    const/4 v4, 0x2

    aget-object v4, p1, v4

    check-cast v4, Lorg/json/JSONObject;

    iput-object v4, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceAttributeSetter;->attributeList:Lorg/json/JSONObject;

    .line 567
    iget-object v4, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceAttributeSetter;->mWeMoDevice:Lcom/belkin/wemo/localsdk/WeMoDevice;

    invoke-virtual {v4}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v2

    .line 568
    .local v2, "device":Lorg/cybergarage/upnp/Device;
    const-string v4, "SetAttributes"

    invoke-virtual {v2, v4}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 569
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    iget-object v4, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceAttributeSetter;->this$0:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    sget-object v5, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->SET_ATTRIBUTE_KEYS:[Ljava/lang/String;

    iget-object v6, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceAttributeSetter;->argumetList:[Ljava/lang/String;

    invoke-static {v4, v0, v5, v6}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->access$800(Lcom/belkin/wemo/localsdk/WeMoSDKContext;Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)V

    .line 570
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v1

    .line 572
    .local v1, "actionResult":Ljava/lang/String;
    if-nez v1, :cond_0

    .line 573
    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    .line 578
    :goto_0
    return-object v3

    .line 575
    :cond_0
    new-instance v4, Lorg/cybergarage/xml/SetAttributeResponseParser;

    invoke-direct {v4}, Lorg/cybergarage/xml/SetAttributeResponseParser;-><init>()V

    invoke-virtual {v4, v1}, Lorg/cybergarage/xml/SetAttributeResponseParser;->parseSetAttributeRespone(Ljava/lang/String;)Z

    move-result v4

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    goto :goto_0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 557
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceAttributeSetter;->doInBackground([Ljava/lang/Object;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Ljava/lang/Boolean;)V
    .locals 4
    .param p1, "result"    # Ljava/lang/Boolean;

    .prologue
    .line 583
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceAttributeSetter;->this$0:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    invoke-static {v1}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->access$200(Lcom/belkin/wemo/localsdk/WeMoSDKContext;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".SetDeviceAttributeRunnable"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Result "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 584
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 585
    invoke-direct {p0}, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceAttributeSetter;->updateAttributeList()V

    .line 590
    :goto_0
    iget-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceAttributeSetter;->this$0:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    const-string v1, "set_attribute"

    const-string v2, ""

    iget-object v3, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceAttributeSetter;->mWeMoDevice:Lcom/belkin/wemo/localsdk/WeMoDevice;

    invoke-virtual {v3}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->access$500(Lcom/belkin/wemo/localsdk/WeMoSDKContext;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 591
    return-void

    .line 588
    :cond_0
    iget-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceAttributeSetter;->mWeMoDevice:Lcom/belkin/wemo/localsdk/WeMoDevice;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/localsdk/WeMoDevice;->setAvailability(Z)V

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 557
    check-cast p1, Ljava/lang/Boolean;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceAttributeSetter;->onPostExecute(Ljava/lang/Boolean;)V

    return-void
.end method
