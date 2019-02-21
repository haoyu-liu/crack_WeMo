.class Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$SetDeviceNamePostActionCallback;
.super Ljava/lang/Object;
.source "UpnpDeviceList.java"

# interfaces
.implements Lcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionErrorCallback;
.implements Lcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionSuccessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SetDeviceNamePostActionCallback"
.end annotation


# instance fields
.field private callback:Lcom/belkin/devices/callback/SetDeviceNameOnLinkCallBack;

.field final synthetic this$0:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;


# direct methods
.method public constructor <init>(Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;Lcom/belkin/devices/callback/SetDeviceNameOnLinkCallBack;)V
    .locals 0
    .param p2, "callback"    # Lcom/belkin/devices/callback/SetDeviceNameOnLinkCallBack;

    .prologue
    .line 4583
    iput-object p1, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$SetDeviceNamePostActionCallback;->this$0:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4584
    iput-object p2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$SetDeviceNamePostActionCallback;->callback:Lcom/belkin/devices/callback/SetDeviceNameOnLinkCallBack;

    .line 4585
    return-void
.end method


# virtual methods
.method public onActionError(Ljava/lang/Exception;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 4604
    iget-object v0, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$SetDeviceNamePostActionCallback;->callback:Lcom/belkin/devices/callback/SetDeviceNameOnLinkCallBack;

    if-eqz v0, :cond_0

    .line 4605
    iget-object v0, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$SetDeviceNamePostActionCallback;->callback:Lcom/belkin/devices/callback/SetDeviceNameOnLinkCallBack;

    invoke-virtual {v0}, Lcom/belkin/devices/callback/SetDeviceNameOnLinkCallBack;->onError()V

    .line 4608
    :cond_0
    return-void
.end method

.method public onActionSuccess(Ljava/lang/String;)V
    .locals 3
    .param p1, "responseXML"    # Ljava/lang/String;

    .prologue
    .line 4588
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 4590
    new-instance v0, Lcom/belkin/upnp/parser/SetMultipleDeviceNameResponseParser;

    invoke-direct {v0}, Lcom/belkin/upnp/parser/SetMultipleDeviceNameResponseParser;-><init>()V

    .line 4591
    .local v0, "response":Lcom/belkin/upnp/parser/SetMultipleDeviceNameResponseParser;
    iget-object v1, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$SetDeviceNamePostActionCallback;->callback:Lcom/belkin/devices/callback/SetDeviceNameOnLinkCallBack;

    if-eqz v1, :cond_1

    .line 4592
    iget-object v1, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$SetDeviceNamePostActionCallback;->callback:Lcom/belkin/devices/callback/SetDeviceNameOnLinkCallBack;

    invoke-virtual {v0, p1}, Lcom/belkin/upnp/parser/SetMultipleDeviceNameResponseParser;->parseResponse(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/belkin/devices/callback/SetDeviceNameOnLinkCallBack;->onSuccess(Ljava/lang/String;)V

    .line 4600
    .end local v0    # "response":Lcom/belkin/upnp/parser/SetMultipleDeviceNameResponseParser;
    :cond_0
    :goto_0
    return-void

    .line 4593
    .restart local v0    # "response":Lcom/belkin/upnp/parser/SetMultipleDeviceNameResponseParser;
    :cond_1
    iget-object v1, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$SetDeviceNamePostActionCallback;->callback:Lcom/belkin/devices/callback/SetDeviceNameOnLinkCallBack;

    if-eqz v1, :cond_0

    .line 4594
    iget-object v1, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$SetDeviceNamePostActionCallback;->callback:Lcom/belkin/devices/callback/SetDeviceNameOnLinkCallBack;

    invoke-virtual {v1}, Lcom/belkin/devices/callback/SetDeviceNameOnLinkCallBack;->onError()V

    goto :goto_0

    .line 4598
    .end local v0    # "response":Lcom/belkin/upnp/parser/SetMultipleDeviceNameResponseParser;
    :cond_2
    iget-object v1, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$SetDeviceNamePostActionCallback;->callback:Lcom/belkin/devices/callback/SetDeviceNameOnLinkCallBack;

    invoke-virtual {v1}, Lcom/belkin/devices/callback/SetDeviceNameOnLinkCallBack;->onError()V

    goto :goto_0
.end method
