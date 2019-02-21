.class Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceBlobStorageTask;
.super Landroid/os/AsyncTask;
.source "WeMoSDKContext.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/localsdk/WeMoSDKContext;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DeviceBlobStorageTask"
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
.field private mWeMoDevice:Lcom/belkin/wemo/localsdk/WeMoDevice;

.field private sensortype:Ljava/lang/String;

.field final synthetic this$0:Lcom/belkin/wemo/localsdk/WeMoSDKContext;


# direct methods
.method private constructor <init>(Lcom/belkin/wemo/localsdk/WeMoSDKContext;)V
    .locals 0

    .prologue
    .line 651
    iput-object p1, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceBlobStorageTask;->this$0:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/belkin/wemo/localsdk/WeMoSDKContext;Lcom/belkin/wemo/localsdk/WeMoSDKContext$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/belkin/wemo/localsdk/WeMoSDKContext;
    .param p2, "x1"    # Lcom/belkin/wemo/localsdk/WeMoSDKContext$1;

    .prologue
    .line 651
    invoke-direct {p0, p1}, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceBlobStorageTask;-><init>(Lcom/belkin/wemo/localsdk/WeMoSDKContext;)V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Object;)Ljava/lang/Boolean;
    .locals 10
    .param p1, "params"    # [Ljava/lang/Object;

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 657
    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    .line 658
    .local v3, "result":Ljava/lang/Boolean;
    aget-object v4, p1, v8

    check-cast v4, Lcom/belkin/wemo/localsdk/WeMoDevice;

    iput-object v4, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceBlobStorageTask;->mWeMoDevice:Lcom/belkin/wemo/localsdk/WeMoDevice;

    .line 659
    aget-object v4, p1, v9

    check-cast v4, Ljava/lang/String;

    iput-object v4, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceBlobStorageTask;->sensortype:Ljava/lang/String;

    .line 660
    iget-object v4, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceBlobStorageTask;->mWeMoDevice:Lcom/belkin/wemo/localsdk/WeMoDevice;

    invoke-virtual {v4}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v2

    .line 662
    .local v2, "device":Lorg/cybergarage/upnp/Device;
    const-string v4, "SetBlobStorage"

    invoke-virtual {v2, v4}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 663
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    iget-object v4, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceBlobStorageTask;->this$0:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    sget-object v5, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->SET_BLOB_STORAGE_DATA:[Ljava/lang/String;

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/String;

    const-string v7, "Sensor"

    aput-object v7, v6, v8

    iget-object v7, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceBlobStorageTask;->sensortype:Ljava/lang/String;

    aput-object v7, v6, v9

    invoke-static {v4, v0, v5, v6}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->access$800(Lcom/belkin/wemo/localsdk/WeMoSDKContext;Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)V

    .line 664
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v1

    .line 665
    .local v1, "actionResult":Ljava/lang/String;
    if-nez v1, :cond_1

    .line 667
    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    .line 673
    :cond_0
    :goto_0
    return-object v3

    .line 668
    :cond_1
    sget-object v4, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->ERROR:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 670
    iget-object v4, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceBlobStorageTask;->this$0:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    iget-object v5, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceBlobStorageTask;->mWeMoDevice:Lcom/belkin/wemo/localsdk/WeMoDevice;

    invoke-static {v4, v5}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->access$400(Lcom/belkin/wemo/localsdk/WeMoSDKContext;Lcom/belkin/wemo/localsdk/WeMoDevice;)Z

    move-result v4

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    goto :goto_0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 651
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceBlobStorageTask;->doInBackground([Ljava/lang/Object;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Ljava/lang/Boolean;)V
    .locals 4
    .param p1, "result"    # Ljava/lang/Boolean;

    .prologue
    .line 678
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    .line 679
    iget-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceBlobStorageTask;->mWeMoDevice:Lcom/belkin/wemo/localsdk/WeMoDevice;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/localsdk/WeMoDevice;->setAvailability(Z)V

    .line 682
    :cond_0
    iget-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceBlobStorageTask;->mWeMoDevice:Lcom/belkin/wemo/localsdk/WeMoDevice;

    iget-object v1, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceBlobStorageTask;->sensortype:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/localsdk/WeMoDevice;->setBlobStrage(Ljava/lang/String;)V

    .line 683
    iget-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceBlobStorageTask;->this$0:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    const-string v1, "set_attribute"

    const-string v2, ""

    iget-object v3, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceBlobStorageTask;->mWeMoDevice:Lcom/belkin/wemo/localsdk/WeMoDevice;

    invoke-virtual {v3}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->access$500(Lcom/belkin/wemo/localsdk/WeMoSDKContext;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 684
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 651
    check-cast p1, Ljava/lang/Boolean;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceBlobStorageTask;->onPostExecute(Ljava/lang/Boolean;)V

    return-void
.end method
