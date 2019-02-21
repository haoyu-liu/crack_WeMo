.class Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$GetPostActionCallback;
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
    name = "GetPostActionCallback"
.end annotation


# instance fields
.field private callback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

.field final synthetic this$0:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;


# direct methods
.method public constructor <init>(Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;Lcom/belkin/wemo/callback/SetAndGetActionCallBack;)V
    .locals 0
    .param p2, "callback"    # Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    .prologue
    .line 4525
    iput-object p1, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$GetPostActionCallback;->this$0:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4526
    iput-object p2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$GetPostActionCallback;->callback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    .line 4527
    return-void
.end method


# virtual methods
.method public onActionError(Ljava/lang/Exception;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 4544
    iget-object v0, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$GetPostActionCallback;->callback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    if-eqz v0, :cond_0

    .line 4545
    iget-object v0, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$GetPostActionCallback;->callback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    invoke-interface {v0}, Lcom/belkin/wemo/callback/SetAndGetActionCallBack;->onError()V

    .line 4548
    :cond_0
    return-void
.end method

.method public onActionSuccess(Ljava/lang/String;)V
    .locals 3
    .param p1, "responseXML"    # Ljava/lang/String;

    .prologue
    .line 4530
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 4532
    new-instance v0, Lcom/belkin/upnp/parser/GetDataStoreResponseParser;

    invoke-direct {v0}, Lcom/belkin/upnp/parser/GetDataStoreResponseParser;-><init>()V

    .line 4534
    .local v0, "response":Lcom/belkin/upnp/parser/GetDataStoreResponseParser;
    iget-object v1, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$GetPostActionCallback;->callback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    if-eqz v1, :cond_0

    .line 4535
    iget-object v1, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$GetPostActionCallback;->callback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    invoke-virtual {v0, p1}, Lcom/belkin/upnp/parser/GetDataStoreResponseParser;->parseResponse(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/belkin/wemo/callback/SetAndGetActionCallBack;->onSuccess(Ljava/lang/String;)V

    .line 4540
    .end local v0    # "response":Lcom/belkin/upnp/parser/GetDataStoreResponseParser;
    :cond_0
    :goto_0
    return-void

    .line 4538
    :cond_1
    iget-object v1, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$GetPostActionCallback;->callback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    invoke-interface {v1}, Lcom/belkin/wemo/callback/SetAndGetActionCallBack;->onError()V

    goto :goto_0
.end method
