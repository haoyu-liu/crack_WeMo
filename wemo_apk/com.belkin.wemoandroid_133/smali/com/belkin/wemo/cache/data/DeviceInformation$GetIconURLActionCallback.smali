.class Lcom/belkin/wemo/cache/data/DeviceInformation$GetIconURLActionCallback;
.super Ljava/lang/Object;
.source "DeviceInformation.java"

# interfaces
.implements Lcom/belkin/wemo/controlaction/callback/ControlActionErrorCallback;
.implements Lcom/belkin/wemo/controlaction/callback/ControlActionSuccessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/cache/data/DeviceInformation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GetIconURLActionCallback"
.end annotation


# instance fields
.field private actionObj:Lorg/cybergarage/upnp/Action;

.field final synthetic this$0:Lcom/belkin/wemo/cache/data/DeviceInformation;


# direct methods
.method private constructor <init>(Lcom/belkin/wemo/cache/data/DeviceInformation;Lorg/cybergarage/upnp/Action;)V
    .locals 0
    .param p2, "action"    # Lorg/cybergarage/upnp/Action;

    .prologue
    .line 1238
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation$GetIconURLActionCallback;->this$0:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1239
    iput-object p2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation$GetIconURLActionCallback;->actionObj:Lorg/cybergarage/upnp/Action;

    .line 1240
    return-void
.end method


# virtual methods
.method public onActionError(Ljava/lang/Exception;)V
    .locals 2
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 1260
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation$GetIconURLActionCallback;->this$0:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const-string v1, ""

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->access$502(Lcom/belkin/wemo/cache/data/DeviceInformation;Ljava/lang/String;)Ljava/lang/String;

    .line 1261
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation$GetIconURLActionCallback;->this$0:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-static {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->access$100(Lcom/belkin/wemo/cache/data/DeviceInformation;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Exception while icon url "

    invoke-static {v0, v1, p1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 1262
    return-void
.end method

.method public onActionSuccess(Ljava/lang/String;)V
    .locals 5
    .param p1, "responseXMLStr"    # Ljava/lang/String;

    .prologue
    .line 1244
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 1245
    const-string v1, ""

    .line 1246
    .local v1, "url":Ljava/lang/String;
    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation$GetIconURLActionCallback;->actionObj:Lorg/cybergarage/upnp/Action;

    invoke-virtual {v2}, Lorg/cybergarage/upnp/Action;->getOutputArgumentList()Lorg/cybergarage/upnp/ArgumentList;

    move-result-object v0

    .line 1247
    .local v0, "argumentList":Lorg/cybergarage/upnp/ArgumentList;
    invoke-virtual {v0}, Lorg/cybergarage/upnp/ArgumentList;->size()I

    move-result v2

    if-lez v2, :cond_0

    .line 1248
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lorg/cybergarage/upnp/ArgumentList;->getArgument(I)Lorg/cybergarage/upnp/Argument;

    move-result-object v2

    invoke-virtual {v2}, Lorg/cybergarage/upnp/Argument;->getValue()Ljava/lang/String;

    move-result-object v1

    .line 1249
    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation$GetIconURLActionCallback;->this$0:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v3, p0, Lcom/belkin/wemo/cache/data/DeviceInformation$GetIconURLActionCallback;->this$0:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-static {v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->access$600(Lcom/belkin/wemo/cache/data/DeviceInformation;)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/wemo/cache/data/DeviceInformation$GetIconURLActionCallback;->this$0:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-static {v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->access$700(Lcom/belkin/wemo/cache/data/DeviceInformation;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v3, v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->saveIconToStorage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->access$502(Lcom/belkin/wemo/cache/data/DeviceInformation;Ljava/lang/String;)Ljava/lang/String;

    .line 1250
    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation$GetIconURLActionCallback;->this$0:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-static {v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->access$100(Lcom/belkin/wemo/cache/data/DeviceInformation;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " iconURL: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/wemo/cache/data/DeviceInformation$GetIconURLActionCallback;->this$0:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-static {v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->access$500(Lcom/belkin/wemo/cache/data/DeviceInformation;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1256
    .end local v0    # "argumentList":Lorg/cybergarage/upnp/ArgumentList;
    .end local v1    # "url":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 1253
    :cond_1
    new-instance v2, Lcom/belkin/wemo/exception/InvalidActionException;

    const-string v3, "ACTION is invalid!"

    invoke-direct {v2, v3}, Lcom/belkin/wemo/exception/InvalidActionException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v2}, Lcom/belkin/wemo/cache/data/DeviceInformation$GetIconURLActionCallback;->onActionError(Ljava/lang/Exception;)V

    goto :goto_0
.end method
