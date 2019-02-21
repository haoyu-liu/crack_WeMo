.class public Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;
.super Ljava/lang/Object;
.source "UnicastDeviceDiscovery.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery$1;,
        Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery$XMLParser;,
        Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery$OnUnicastFailedListener;
    }
.end annotation


# static fields
.field private static final KEY_DEVICE_TAG:Ljava/lang/String; = "device"

.field private static final KEY_UDN:Ljava/lang/String; = "UDN"


# instance fields
.field private final MAX_TRY_COUNTS:I

.field private final TAG:Ljava/lang/String;

.field private devInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

.field private deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field private deviceString:Ljava/lang/String;

.field private onUnicastFailedListenerSet:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery$OnUnicastFailedListener;",
            ">;"
        }
    .end annotation
.end field

.field private triesCompleted:I


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/cache/data/DeviceInformation;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V
    .locals 1
    .param p1, "devInfo"    # Lcom/belkin/wemo/cache/data/DeviceInformation;
    .param p2, "deviceListManager"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    const-class v0, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;->TAG:Ljava/lang/String;

    .line 55
    const/4 v0, 0x3

    iput v0, p0, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;->MAX_TRY_COUNTS:I

    .line 59
    iput-object p2, p0, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 60
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;->devInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 61
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;->onUnicastFailedListenerSet:Ljava/util/Set;

    .line 62
    return-void
.end method

.method private issueUnicastRequest()V
    .locals 4

    .prologue
    .line 65
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unicast Discovery: Issuing unicast request for UDN: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;->devInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; Num of tries completed: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;->triesCompleted:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    new-instance v0, Lcom/belkin/wemo/cache/cloud/HTTPRequestUnicastDiscovery;

    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;->devInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIP()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;->devInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getPort()I

    move-result v2

    invoke-direct {v0, v1, v2, p0}, Lcom/belkin/wemo/cache/cloud/HTTPRequestUnicastDiscovery;-><init>(Ljava/lang/String;ILcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;)V

    .line 67
    .local v0, "request":Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;
    new-instance v1, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    sget-object v2, Lcom/belkin/wemo/WeMo;->INSTANCE:Lcom/belkin/wemo/WeMo;

    invoke-virtual {v2}, Lcom/belkin/wemo/WeMo;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v0}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    .line 68
    return-void
.end method

.method private onDiscoveryFailed(Ljava/lang/String;)V
    .locals 7
    .param p1, "error"    # Ljava/lang/String;

    .prologue
    .line 83
    iget v3, p0, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;->triesCompleted:I

    const/4 v4, 0x3

    if-lt v3, v4, :cond_1

    .line 84
    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;->devInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;->devInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIP()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;->devInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getPort()I

    move-result v6

    invoke-virtual {v3, v4, v5, v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->deviceNotDiscovered(Ljava/lang/String;Ljava/lang/String;I)V

    .line 86
    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;->onUnicastFailedListenerSet:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery$OnUnicastFailedListener;

    .line 87
    .local v1, "listener":Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery$OnUnicastFailedListener;
    invoke-interface {v1}, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery$OnUnicastFailedListener;->OnUnicastFailed()V

    goto :goto_0

    .line 89
    .end local v1    # "listener":Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery$OnUnicastFailedListener;
    :cond_0
    new-instance v2, Lcom/belkin/wemo/cache/utils/SharePreferences;

    sget-object v3, Lcom/belkin/wemo/WeMo;->INSTANCE:Lcom/belkin/wemo/WeMo;

    invoke-virtual {v3}, Lcom/belkin/wemo/WeMo;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    .line 90
    .local v2, "sharePref":Lcom/belkin/wemo/cache/utils/SharePreferences;
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setFullSuccessfulDiscoveryCounter(I)V

    .line 95
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v2    # "sharePref":Lcom/belkin/wemo/cache/utils/SharePreferences;
    :goto_1
    return-void

    .line 92
    :cond_1
    invoke-direct {p0}, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;->issueUnicastRequest()V

    .line 93
    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;->devInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->onDiscoveryRetry(Ljava/lang/String;)V

    goto :goto_1
.end method

.method private parseResponse(Ljava/lang/String;)Z
    .locals 8
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 141
    :try_start_0
    new-instance v6, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery$XMLParser;

    const/4 v7, 0x0

    invoke-direct {v6, p0, v7}, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery$XMLParser;-><init>(Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery$1;)V

    .line 142
    .local v6, "parser":Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery$XMLParser;
    invoke-virtual {v6, p1}, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery$XMLParser;->getDomElement(Ljava/lang/String;)Lorg/w3c/dom/Document;

    move-result-object v1

    .line 143
    .local v1, "doc":Lorg/w3c/dom/Document;
    const-string v7, "device"

    invoke-interface {v1, v7}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v5

    .line 144
    .local v5, "nl":Lorg/w3c/dom/NodeList;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    invoke-interface {v5}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v7

    if-ge v4, v7, :cond_1

    .line 145
    invoke-interface {v5, v4}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v2

    check-cast v2, Lorg/w3c/dom/Element;

    .line 146
    .local v2, "e":Lorg/w3c/dom/Element;
    const-string v7, "UDN"

    invoke-virtual {v6, v2, v7}, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery$XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 148
    .local v0, "UDN":Ljava/lang/String;
    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;->devInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v7}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v7

    if-eqz v7, :cond_0

    .line 149
    const/4 v7, 0x1

    .line 155
    .end local v0    # "UDN":Ljava/lang/String;
    .end local v1    # "doc":Lorg/w3c/dom/Document;
    .end local v2    # "e":Lorg/w3c/dom/Element;
    .end local v4    # "i":I
    .end local v5    # "nl":Lorg/w3c/dom/NodeList;
    .end local v6    # "parser":Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery$XMLParser;
    :goto_1
    return v7

    .line 144
    .restart local v0    # "UDN":Ljava/lang/String;
    .restart local v1    # "doc":Lorg/w3c/dom/Document;
    .restart local v2    # "e":Lorg/w3c/dom/Element;
    .restart local v4    # "i":I
    .restart local v5    # "nl":Lorg/w3c/dom/NodeList;
    .restart local v6    # "parser":Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery$XMLParser;
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 152
    .end local v0    # "UDN":Ljava/lang/String;
    .end local v1    # "doc":Lorg/w3c/dom/Document;
    .end local v2    # "e":Lorg/w3c/dom/Element;
    .end local v4    # "i":I
    .end local v5    # "nl":Lorg/w3c/dom/NodeList;
    .end local v6    # "parser":Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery$XMLParser;
    :catch_0
    move-exception v3

    .line 153
    .local v3, "ex":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    .line 155
    .end local v3    # "ex":Ljava/lang/Exception;
    :cond_1
    const/4 v7, 0x0

    goto :goto_1
.end method


# virtual methods
.method public addOnUnicastFailedListener(Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery$OnUnicastFailedListener;)Z
    .locals 1
    .param p1, "listener"    # Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery$OnUnicastFailedListener;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;->onUnicastFailedListenerSet:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public deviceDiscoverCallback([B)V
    .locals 5
    .param p1, "resp"    # [B

    .prologue
    .line 110
    :try_start_0
    new-instance v2, Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-direct {v2, p1, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    iput-object v2, p0, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;->deviceString:Ljava/lang/String;

    .line 111
    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unicast Discovery callback response: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;->deviceString:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;->deviceString:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;->parseResponse(Ljava/lang/String;)Z

    move-result v1

    .line 114
    .local v1, "responseParse":Z
    if-eqz v1, :cond_0

    .line 115
    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Device discovered over unicast: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;->devInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;->devInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;->deviceString:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->deviceDiscovered(Lcom/belkin/wemo/cache/data/DeviceInformation;Ljava/lang/String;)V

    .line 126
    .end local v1    # "responseParse":Z
    :goto_0
    return-void

    .line 120
    .restart local v1    # "responseParse":Z
    :cond_0
    const-string v2, "Can\'t parse response"

    invoke-direct {p0, v2}, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;->onDiscoveryFailed(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 122
    .end local v1    # "responseParse":Z
    :catch_0
    move-exception v0

    .line 123
    .local v0, "e":Ljava/lang/Exception;
    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;->TAG:Ljava/lang/String;

    const-string v3, "Exception while parsing unicast discovery response: "

    invoke-static {v2, v3, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 124
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;->onDiscoveryFailed(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onRequestComplete(ZI[B)V
    .locals 3
    .param p1, "success"    # Z
    .param p2, "statusCode"    # I
    .param p3, "resp"    # [B

    .prologue
    .line 72
    iget v0, p0, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;->triesCompleted:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;->triesCompleted:I

    .line 73
    if-eqz p1, :cond_0

    .line 74
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unicast Discovery: Request SUCCESS of UDN: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;->devInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; Number of tries completed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;->triesCompleted:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; status code: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; response: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    invoke-virtual {p0, p3}, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;->deviceDiscoverCallback([B)V

    .line 80
    :goto_0
    return-void

    .line 77
    :cond_0
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unicast Discovery: Request FALIED of UDN: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;->devInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; Number of tries completed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;->triesCompleted:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; status code: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; response: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unicast Discovery Failed. status code: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;->onDiscoveryFailed(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public removeOnUnicastFailedListener(Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery$OnUnicastFailedListener;)Z
    .locals 1
    .param p1, "listener"    # Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery$OnUnicastFailedListener;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;->onUnicastFailedListenerSet:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public runUnicastDiscovery(Lcom/belkin/wemo/cache/devicelist/listener/UnicastListener;)V
    .locals 2
    .param p1, "unicastListener"    # Lcom/belkin/wemo/cache/devicelist/listener/UnicastListener;

    .prologue
    .line 98
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;->devInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIP()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;->devInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIP()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 99
    invoke-direct {p0}, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;->issueUnicastRequest()V

    .line 106
    :cond_0
    :goto_0
    return-void

    .line 101
    :cond_1
    const-string v0, "NestThermostat"

    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;->devInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getProductType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 104
    const-string v0, "Invalid IP"

    invoke-direct {p0, v0}, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;->onDiscoveryFailed(Ljava/lang/String;)V

    goto :goto_0
.end method
