.class public Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal;
.super Ljava/lang/Object;
.source "RMFetchDevRulesNoFetchSupportLocal.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal$GetDBVersionActionCallback;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private device:Lorg/cybergarage/upnp/Device;

.field private errorCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;

.field private rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

.field private successCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesSuccesCallback;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 23
    const-class v0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lorg/cybergarage/upnp/Device;Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesSuccesCallback;Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;Lcom/belkin/wemo/rules/util/RMIRulesUtils;)V
    .locals 0
    .param p1, "device"    # Lorg/cybergarage/upnp/Device;
    .param p2, "successCallback"    # Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesSuccesCallback;
    .param p3, "errorCallback"    # Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;
    .param p4, "rulesUtils"    # Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p2, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal;->successCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesSuccesCallback;

    .line 35
    iput-object p3, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal;->errorCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;

    .line 40
    iput-object p1, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal;->device:Lorg/cybergarage/upnp/Device;

    .line 41
    iput-object p4, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    .line 42
    return-void
.end method

.method static synthetic access$000(Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal;)Lorg/cybergarage/upnp/Device;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal;

    .prologue
    .line 21
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal;->device:Lorg/cybergarage/upnp/Device;

    return-object v0
.end method

.method static synthetic access$100(Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal;Lcom/belkin/wemo/upnp/parser/RMParser;Ljava/lang/String;)I
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal;
    .param p1, "x1"    # Lcom/belkin/wemo/upnp/parser/RMParser;
    .param p2, "x2"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .prologue
    .line 21
    invoke-direct {p0, p1, p2}, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal;->getDBVersion(Lcom/belkin/wemo/upnp/parser/RMParser;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method static synthetic access$200()Ljava/lang/String;
    .locals 1

    .prologue
    .line 21
    sget-object v0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method private getDBVersion(Lcom/belkin/wemo/upnp/parser/RMParser;Ljava/lang/String;)I
    .locals 2
    .param p1, "parser"    # Lcom/belkin/wemo/upnp/parser/RMParser;
    .param p2, "dbPathXMLStr"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .prologue
    .line 109
    new-instance v0, Lcom/belkin/wemo/upnp/response/RMRulesDBVersionResponse;

    invoke-direct {v0}, Lcom/belkin/wemo/upnp/response/RMRulesDBVersionResponse;-><init>()V

    .line 110
    .local v0, "response":Lcom/belkin/wemo/upnp/response/RMRulesDBVersionResponse;
    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1, p2}, Lcom/belkin/wemo/upnp/parser/RMParser;->uPnPResponseParser(Lcom/belkin/wemo/upnp/response/RMBaseUpnpResponse;ILjava/lang/String;)V

    .line 111
    invoke-virtual {v0}, Lcom/belkin/wemo/upnp/response/RMRulesDBVersionResponse;->getRulesDBVersion()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    return v1
.end method


# virtual methods
.method public fetch()V
    .locals 8

    .prologue
    .line 45
    sget-object v1, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Fetch Rules: Device does NOT suport FetchRules API. udn: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal;->device:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v3}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    iget-object v1, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal;->device:Lorg/cybergarage/upnp/Device;

    const-string v2, "GetRulesDBVersion"

    invoke-virtual {v1, v2}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v7

    .line 48
    .local v7, "action":Lorg/cybergarage/upnp/Action;
    new-instance v0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal$GetDBVersionActionCallback;

    iget-object v2, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    iget-object v3, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal;->successCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesSuccesCallback;

    iget-object v4, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal;->errorCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;

    iget-object v1, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal;->device:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v1}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v5

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal$GetDBVersionActionCallback;-><init>(Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal;Lcom/belkin/wemo/rules/util/RMIRulesUtils;Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesSuccesCallback;Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;Ljava/lang/String;)V

    .line 49
    .local v0, "getDBVersionActionCallback":Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal$GetDBVersionActionCallback;
    invoke-static {}, Lcom/belkin/wemo/controlaction/ControlActionHandler;->newInstance()Lcom/belkin/wemo/controlaction/ControlActionHandler;

    move-result-object v1

    const/16 v3, 0x3a98

    const/16 v4, 0xfa0

    move-object v2, v7

    move-object v5, v0

    move-object v6, v0

    invoke-virtual/range {v1 .. v6}, Lcom/belkin/wemo/controlaction/ControlActionHandler;->postControlAction(Lorg/cybergarage/upnp/Action;IILcom/belkin/wemo/controlaction/callback/ControlActionErrorCallback;Lcom/belkin/wemo/controlaction/callback/ControlActionSuccessCallback;)V

    .line 54
    return-void
.end method
