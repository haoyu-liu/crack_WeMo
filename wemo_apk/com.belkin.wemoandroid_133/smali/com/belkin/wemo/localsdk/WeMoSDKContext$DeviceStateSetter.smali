.class Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceStateSetter;
.super Landroid/os/AsyncTask;
.source "WeMoSDKContext.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/localsdk/WeMoSDKContext;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DeviceStateSetter"
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

.field final synthetic this$0:Lcom/belkin/wemo/localsdk/WeMoSDKContext;


# direct methods
.method private constructor <init>(Lcom/belkin/wemo/localsdk/WeMoSDKContext;)V
    .locals 0

    .prologue
    .line 687
    iput-object p1, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceStateSetter;->this$0:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/belkin/wemo/localsdk/WeMoSDKContext;Lcom/belkin/wemo/localsdk/WeMoSDKContext$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/belkin/wemo/localsdk/WeMoSDKContext;
    .param p2, "x1"    # Lcom/belkin/wemo/localsdk/WeMoSDKContext$1;

    .prologue
    .line 687
    invoke-direct {p0, p1}, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceStateSetter;-><init>(Lcom/belkin/wemo/localsdk/WeMoSDKContext;)V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Object;)Ljava/lang/Boolean;
    .locals 9
    .param p1, "params"    # [Ljava/lang/Object;

    .prologue
    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 692
    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    .line 693
    .local v3, "result":Ljava/lang/Boolean;
    aget-object v5, p1, v7

    check-cast v5, Lcom/belkin/wemo/localsdk/WeMoDevice;

    iput-object v5, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceStateSetter;->mWeMoDevice:Lcom/belkin/wemo/localsdk/WeMoDevice;

    .line 694
    aget-object v4, p1, v8

    check-cast v4, Ljava/lang/String;

    .line 695
    .local v4, "state":Ljava/lang/String;
    iget-object v5, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceStateSetter;->mWeMoDevice:Lcom/belkin/wemo/localsdk/WeMoDevice;

    invoke-virtual {v5}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v2

    .line 697
    .local v2, "device":Lorg/cybergarage/upnp/Device;
    const-string v5, "SetBinaryState"

    invoke-virtual {v2, v5}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 698
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    iget-object v5, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceStateSetter;->this$0:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    sget-object v6, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->SET_BINARY_STATE_ARGS:[Ljava/lang/String;

    new-array v7, v7, [Ljava/lang/String;

    aput-object v4, v7, v8

    invoke-static {v5, v0, v6, v7}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->access$800(Lcom/belkin/wemo/localsdk/WeMoSDKContext;Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)V

    .line 699
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v1

    .line 700
    .local v1, "actionResult":Ljava/lang/String;
    :goto_0
    if-nez v1, :cond_1

    .line 702
    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    .line 711
    :goto_1
    return-object v3

    .line 699
    .end local v1    # "actionResult":Ljava/lang/String;
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 703
    .restart local v1    # "actionResult":Ljava/lang/String;
    :cond_1
    sget-object v5, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->ERROR:Ljava/lang/String;

    invoke-virtual {v1, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 705
    iget-object v5, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceStateSetter;->mWeMoDevice:Lcom/belkin/wemo/localsdk/WeMoDevice;

    invoke-virtual {v5, v8}, Lcom/belkin/wemo/localsdk/WeMoDevice;->setSubscribed(Z)V

    .line 706
    iget-object v5, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceStateSetter;->this$0:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    iget-object v6, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceStateSetter;->mWeMoDevice:Lcom/belkin/wemo/localsdk/WeMoDevice;

    invoke-static {v5, v6}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->access$400(Lcom/belkin/wemo/localsdk/WeMoSDKContext;Lcom/belkin/wemo/localsdk/WeMoDevice;)Z

    move-result v5

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    goto :goto_1

    .line 708
    :cond_2
    iget-object v5, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceStateSetter;->mWeMoDevice:Lcom/belkin/wemo/localsdk/WeMoDevice;

    invoke-virtual {v5, v4}, Lcom/belkin/wemo/localsdk/WeMoDevice;->setState(Ljava/lang/String;)V

    goto :goto_1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 687
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceStateSetter;->doInBackground([Ljava/lang/Object;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Ljava/lang/Boolean;)V
    .locals 4
    .param p1, "result"    # Ljava/lang/Boolean;

    .prologue
    .line 716
    iget-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceStateSetter;->this$0:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    invoke-static {v0}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->access$200(Lcom/belkin/wemo/localsdk/WeMoSDKContext;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onPostExecute >>> result is:: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 717
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    .line 718
    iget-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceStateSetter;->mWeMoDevice:Lcom/belkin/wemo/localsdk/WeMoDevice;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/localsdk/WeMoDevice;->setAvailability(Z)V

    .line 719
    iget-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceStateSetter;->mWeMoDevice:Lcom/belkin/wemo/localsdk/WeMoDevice;

    const-string v1, "-1"

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/localsdk/WeMoDevice;->setState(Ljava/lang/String;)V

    .line 721
    :cond_0
    iget-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceStateSetter;->this$0:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    const-string v1, "set_state"

    const-string v2, ""

    iget-object v3, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceStateSetter;->mWeMoDevice:Lcom/belkin/wemo/localsdk/WeMoDevice;

    invoke-virtual {v3}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->access$500(Lcom/belkin/wemo/localsdk/WeMoSDKContext;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 722
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 687
    check-cast p1, Ljava/lang/Boolean;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceStateSetter;->onPostExecute(Ljava/lang/Boolean;)V

    return-void
.end method
