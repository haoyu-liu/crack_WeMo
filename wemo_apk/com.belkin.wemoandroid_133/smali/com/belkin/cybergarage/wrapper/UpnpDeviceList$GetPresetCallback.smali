.class Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$GetPresetCallback;
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
    name = "GetPresetCallback"
.end annotation


# instance fields
.field private callback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

.field final synthetic this$0:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;


# direct methods
.method public constructor <init>(Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;Lcom/belkin/wemo/callback/SetAndGetActionCallBack;)V
    .locals 0
    .param p2, "callback"    # Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    .prologue
    .line 4643
    iput-object p1, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$GetPresetCallback;->this$0:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4644
    iput-object p2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$GetPresetCallback;->callback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    .line 4645
    return-void
.end method


# virtual methods
.method public onActionError(Ljava/lang/Exception;)V
    .locals 2
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 4661
    const-string v0, "UpnpDeviceList"

    const-string v1, "GetPresetCallback: onActionError"

    invoke-static {v0, v1, p1}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 4662
    iget-object v0, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$GetPresetCallback;->callback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    if-eqz v0, :cond_0

    .line 4663
    iget-object v0, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$GetPresetCallback;->callback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    invoke-interface {v0}, Lcom/belkin/wemo/callback/SetAndGetActionCallBack;->onError()V

    .line 4665
    :cond_0
    return-void
.end method

.method public onActionSuccess(Ljava/lang/String;)V
    .locals 4
    .param p1, "responseXML"    # Ljava/lang/String;

    .prologue
    .line 4648
    const-string v1, "UpnpDeviceList"

    const-string v2, "GetPresetCallback: onActionSuccess"

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 4649
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 4650
    new-instance v0, Lcom/belkin/upnp/parser/GetPresetResponseParser;

    invoke-direct {v0}, Lcom/belkin/upnp/parser/GetPresetResponseParser;-><init>()V

    .line 4651
    .local v0, "response":Lcom/belkin/upnp/parser/GetPresetResponseParser;
    const-string v1, "UpnpDeviceList"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "response: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0, p1}, Lcom/belkin/upnp/parser/GetPresetResponseParser;->parseResponse(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 4652
    iget-object v1, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$GetPresetCallback;->callback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    if-eqz v1, :cond_0

    .line 4653
    iget-object v1, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$GetPresetCallback;->callback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    invoke-virtual {v0, p1}, Lcom/belkin/upnp/parser/GetPresetResponseParser;->parseResponse(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/belkin/wemo/callback/SetAndGetActionCallBack;->onSuccess(Ljava/lang/String;)V

    .line 4658
    .end local v0    # "response":Lcom/belkin/upnp/parser/GetPresetResponseParser;
    :cond_0
    :goto_0
    return-void

    .line 4656
    :cond_1
    iget-object v1, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$GetPresetCallback;->callback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    invoke-interface {v1}, Lcom/belkin/wemo/callback/SetAndGetActionCallBack;->onError()V

    goto :goto_0
.end method
