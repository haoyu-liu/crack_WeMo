.class Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$DeletePresetCallback;
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
    name = "DeletePresetCallback"
.end annotation


# instance fields
.field private callback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

.field final synthetic this$0:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;


# direct methods
.method public constructor <init>(Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;Lcom/belkin/wemo/callback/SetAndGetActionCallBack;)V
    .locals 0
    .param p2, "callback"    # Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    .prologue
    .line 4669
    iput-object p1, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$DeletePresetCallback;->this$0:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4670
    iput-object p2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$DeletePresetCallback;->callback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    .line 4671
    return-void
.end method


# virtual methods
.method public onActionError(Ljava/lang/Exception;)V
    .locals 2
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 4689
    const-string v0, "UpnpDeviceList"

    const-string v1, "DeletePresetCallback: onActionError"

    invoke-static {v0, v1, p1}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 4690
    iget-object v0, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$DeletePresetCallback;->callback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    if-eqz v0, :cond_0

    .line 4691
    iget-object v0, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$DeletePresetCallback;->callback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    invoke-interface {v0}, Lcom/belkin/wemo/callback/SetAndGetActionCallBack;->onError()V

    .line 4693
    :cond_0
    return-void
.end method

.method public onActionSuccess(Ljava/lang/String;)V
    .locals 3
    .param p1, "responseXML"    # Ljava/lang/String;

    .prologue
    .line 4674
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 4675
    new-instance v0, Lcom/belkin/upnp/parser/DeletePresetResponseParser;

    invoke-direct {v0}, Lcom/belkin/upnp/parser/DeletePresetResponseParser;-><init>()V

    .line 4676
    .local v0, "response":Lcom/belkin/upnp/parser/DeletePresetResponseParser;
    invoke-virtual {v0, p1}, Lcom/belkin/upnp/parser/DeletePresetResponseParser;->parseResponse(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "Success"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$DeletePresetCallback;->callback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    if-eqz v1, :cond_1

    .line 4677
    iget-object v1, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$DeletePresetCallback;->callback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    const-string v2, "Success"

    invoke-interface {v1, v2}, Lcom/belkin/wemo/callback/SetAndGetActionCallBack;->onSuccess(Ljava/lang/String;)V

    .line 4686
    .end local v0    # "response":Lcom/belkin/upnp/parser/DeletePresetResponseParser;
    :cond_0
    :goto_0
    return-void

    .line 4679
    .restart local v0    # "response":Lcom/belkin/upnp/parser/DeletePresetResponseParser;
    :cond_1
    iget-object v1, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$DeletePresetCallback;->callback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    if-eqz v1, :cond_0

    .line 4680
    iget-object v1, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$DeletePresetCallback;->callback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    invoke-interface {v1}, Lcom/belkin/wemo/callback/SetAndGetActionCallBack;->onError()V

    goto :goto_0

    .line 4683
    .end local v0    # "response":Lcom/belkin/upnp/parser/DeletePresetResponseParser;
    :cond_2
    iget-object v1, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$DeletePresetCallback;->callback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    if-eqz v1, :cond_0

    .line 4684
    iget-object v1, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$DeletePresetCallback;->callback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    invoke-interface {v1}, Lcom/belkin/wemo/callback/SetAndGetActionCallBack;->onError()V

    goto :goto_0
.end method
