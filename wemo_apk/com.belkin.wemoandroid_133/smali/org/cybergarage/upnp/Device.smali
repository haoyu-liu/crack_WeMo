.class public Lorg/cybergarage/upnp/Device;
.super Ljava/lang/Object;
.source "Device.java"

# interfaces
.implements Lorg/cybergarage/http/HTTPRequestListener;
.implements Lorg/cybergarage/upnp/device/SearchListener;


# static fields
.field private static final BRAND_NAME:Ljava/lang/String; = "brandName"

.field private static final CONFIGURE_STATE:Ljava/lang/String; = "CONFIGURE_STATE"

.field public static final DEFAULT_DESCRIPTION_URI:Ljava/lang/String; = "/description.xml"

.field public static final DEFAULT_DISCOVERY_WAIT_TIME:I = 0x12c

.field public static final DEFAULT_LEASE_TIME:I = 0x708

.field public static final DEFAULT_STARTUP_WAIT_TIME:I = 0x3e8

.field private static final DEVICE_TYPE:Ljava/lang/String; = "deviceType"

.field public static final ELEM_NAME:Ljava/lang/String; = "device"

.field private static final FIRMWARE_VERSION:Ljava/lang/String; = "firmwareVersion"

.field private static final FRIENDLY_NAME:Ljava/lang/String; = "friendlyName"

.field public static final HTTP_DEFAULT_PORT:I = 0xfa4

.field private static final MAC_ADDRESS:Ljava/lang/String; = "macAddress"

.field private static final MANUFACTURE:Ljava/lang/String; = "manufacturer"

.field private static final MANUFACTURE_URL:Ljava/lang/String; = "manufacturerURL"

.field private static final MODEL_DESCRIPTION:Ljava/lang/String; = "modelDescription"

.field private static final MODEL_NAME:Ljava/lang/String; = "modelName"

.field private static final MODEL_NUMBER:Ljava/lang/String; = "modelNumber"

.field private static final MODEL_URL:Ljava/lang/String; = "modelURL"

.field private static final PRODUCT_NAME:Ljava/lang/String; = "productName"

.field private static final PRODUCT_TYPE:Ljava/lang/String; = "productType"

.field private static final SERIAL_NUMBER:Ljava/lang/String; = "serialNumber"

.field private static final UDN:Ljava/lang/String; = "UDN"

.field private static final UPC:Ljava/lang/String; = "UPC"

.field public static final UPNP_ROOTDEVICE:Ljava/lang/String; = "upnp:rootdevice"

.field public static final URLBASE_NAME:Ljava/lang/String; = "URLBase"

.field private static cal:Ljava/util/Calendar; = null

.field private static final presentationURL:Ljava/lang/String; = "presentationURL"


# instance fields
.field attributeListJSON:Lorg/json/JSONObject;

.field private available:Z

.field private devUUID:Ljava/lang/String;

.field private deviceNode:Lorg/cybergarage/xml/Node;

.field private locationChange:Z

.field private mutex:Lorg/cybergarage/util/Mutex;

.field private rootNode:Lorg/cybergarage/xml/Node;

.field private userData:Ljava/lang/Object;

.field private wirelessMode:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 216
    invoke-static {}, Lorg/cybergarage/upnp/UPnP;->initialize()V

    .line 1583
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    sput-object v0, Lorg/cybergarage/upnp/Device;->cal:Ljava/util/Calendar;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 231
    invoke-direct {p0, v0, v0}, Lorg/cybergarage/upnp/Device;-><init>(Lorg/cybergarage/xml/Node;Lorg/cybergarage/xml/Node;)V

    .line 232
    return-void
.end method

.method public constructor <init>(Ljava/io/File;)V
    .locals 1
    .param p1, "descriptionFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/cybergarage/upnp/device/InvalidDescriptionException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 239
    invoke-direct {p0, v0, v0}, Lorg/cybergarage/upnp/Device;-><init>(Lorg/cybergarage/xml/Node;Lorg/cybergarage/xml/Node;)V

    .line 240
    invoke-virtual {p0, p1}, Lorg/cybergarage/upnp/Device;->loadDescription(Ljava/io/File;)Z

    .line 241
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 1
    .param p1, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/cybergarage/upnp/device/InvalidDescriptionException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 247
    invoke-direct {p0, v0, v0}, Lorg/cybergarage/upnp/Device;-><init>(Lorg/cybergarage/xml/Node;Lorg/cybergarage/xml/Node;)V

    .line 248
    invoke-virtual {p0, p1}, Lorg/cybergarage/upnp/Device;->loadDescription(Ljava/io/InputStream;)Z

    .line 249
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "descriptionFileName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/cybergarage/upnp/device/InvalidDescriptionException;
        }
    .end annotation

    .prologue
    .line 253
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lorg/cybergarage/upnp/Device;-><init>(Ljava/io/File;)V

    .line 254
    return-void
.end method

.method public constructor <init>(Lorg/cybergarage/xml/Node;)V
    .locals 1
    .param p1, "device"    # Lorg/cybergarage/xml/Node;

    .prologue
    .line 235
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lorg/cybergarage/upnp/Device;-><init>(Lorg/cybergarage/xml/Node;Lorg/cybergarage/xml/Node;)V

    .line 236
    return-void
.end method

.method public constructor <init>(Lorg/cybergarage/xml/Node;Lorg/cybergarage/xml/Node;)V
    .locals 3
    .param p1, "root"    # Lorg/cybergarage/xml/Node;
    .param p2, "device"    # Lorg/cybergarage/xml/Node;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 223
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 178
    iput-boolean v1, p0, Lorg/cybergarage/upnp/Device;->locationChange:Z

    .line 180
    iput-boolean v1, p0, Lorg/cybergarage/upnp/Device;->available:Z

    .line 189
    iput-object v2, p0, Lorg/cybergarage/upnp/Device;->attributeListJSON:Lorg/json/JSONObject;

    .line 260
    new-instance v0, Lorg/cybergarage/util/Mutex;

    invoke-direct {v0}, Lorg/cybergarage/util/Mutex;-><init>()V

    iput-object v0, p0, Lorg/cybergarage/upnp/Device;->mutex:Lorg/cybergarage/util/Mutex;

    .line 2220
    iput-object v2, p0, Lorg/cybergarage/upnp/Device;->userData:Ljava/lang/Object;

    .line 224
    iput-object p1, p0, Lorg/cybergarage/upnp/Device;->rootNode:Lorg/cybergarage/xml/Node;

    .line 225
    iput-object p2, p0, Lorg/cybergarage/upnp/Device;->deviceNode:Lorg/cybergarage/xml/Node;

    .line 226
    invoke-static {}, Lorg/cybergarage/upnp/UPnP;->createUUID()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/cybergarage/upnp/Device;->setUUID(Ljava/lang/String;)V

    .line 227
    invoke-virtual {p0, v1}, Lorg/cybergarage/upnp/Device;->setWirelessMode(Z)V

    .line 228
    return-void
.end method

.method private deviceActionControlRecieved(Lorg/cybergarage/upnp/control/ActionRequest;Lorg/cybergarage/upnp/Service;)V
    .locals 7
    .param p1, "ctlReq"    # Lorg/cybergarage/upnp/control/ActionRequest;
    .param p2, "service"    # Lorg/cybergarage/upnp/Service;

    .prologue
    .line 1843
    invoke-static {}, Lorg/cybergarage/util/Debug;->isOn()Z

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v6, :cond_0

    .line 1844
    invoke-virtual {p1}, Lorg/cybergarage/upnp/control/ActionRequest;->print()V

    .line 1846
    :cond_0
    invoke-virtual {p1}, Lorg/cybergarage/upnp/control/ActionRequest;->getActionName()Ljava/lang/String;

    move-result-object v2

    .line 1847
    .local v2, "actionName":Ljava/lang/String;
    invoke-virtual {p2, v2}, Lorg/cybergarage/upnp/Service;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 1848
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    if-nez v0, :cond_2

    .line 1849
    invoke-direct {p0, p1}, Lorg/cybergarage/upnp/Device;->invalidActionControlRecieved(Lorg/cybergarage/upnp/control/ControlRequest;)V

    .line 1862
    :cond_1
    :goto_0
    return-void

    .line 1852
    :cond_2
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->getArgumentList()Lorg/cybergarage/upnp/ArgumentList;

    move-result-object v1

    .line 1853
    .local v1, "actionArgList":Lorg/cybergarage/upnp/ArgumentList;
    invoke-virtual {p1}, Lorg/cybergarage/upnp/control/ActionRequest;->getArgumentList()Lorg/cybergarage/upnp/ArgumentList;

    move-result-object v4

    .line 1855
    .local v4, "reqArgList":Lorg/cybergarage/upnp/ArgumentList;
    :try_start_0
    invoke-virtual {v1, v4}, Lorg/cybergarage/upnp/ArgumentList;->setReqArgs(Lorg/cybergarage/upnp/ArgumentList;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1860
    invoke-virtual {v0, p1}, Lorg/cybergarage/upnp/Action;->performActionListener(Lorg/cybergarage/upnp/control/ActionRequest;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 1861
    invoke-direct {p0, p1}, Lorg/cybergarage/upnp/Device;->invalidActionControlRecieved(Lorg/cybergarage/upnp/control/ControlRequest;)V

    goto :goto_0

    .line 1856
    :catch_0
    move-exception v3

    .line 1857
    .local v3, "ex":Ljava/lang/IllegalArgumentException;
    invoke-direct {p0, p1}, Lorg/cybergarage/upnp/Device;->invalidArgumentsControlRecieved(Lorg/cybergarage/upnp/control/ControlRequest;)V

    goto :goto_0
.end method

.method private deviceControlRequestRecieved(Lorg/cybergarage/upnp/control/ControlRequest;Lorg/cybergarage/upnp/Service;)V
    .locals 2
    .param p1, "ctlReq"    # Lorg/cybergarage/upnp/control/ControlRequest;
    .param p2, "service"    # Lorg/cybergarage/upnp/Service;

    .prologue
    .line 1824
    invoke-virtual {p1}, Lorg/cybergarage/upnp/control/ControlRequest;->isQueryControl()Z

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 1825
    new-instance v0, Lorg/cybergarage/upnp/control/QueryRequest;

    invoke-direct {v0, p1}, Lorg/cybergarage/upnp/control/QueryRequest;-><init>(Lorg/cybergarage/http/HTTPRequest;)V

    invoke-direct {p0, v0, p2}, Lorg/cybergarage/upnp/Device;->deviceQueryControlRecieved(Lorg/cybergarage/upnp/control/QueryRequest;Lorg/cybergarage/upnp/Service;)V

    .line 1828
    :goto_0
    return-void

    .line 1827
    :cond_0
    new-instance v0, Lorg/cybergarage/upnp/control/ActionRequest;

    invoke-direct {v0, p1}, Lorg/cybergarage/upnp/control/ActionRequest;-><init>(Lorg/cybergarage/http/HTTPRequest;)V

    invoke-direct {p0, v0, p2}, Lorg/cybergarage/upnp/Device;->deviceActionControlRecieved(Lorg/cybergarage/upnp/control/ActionRequest;Lorg/cybergarage/upnp/Service;)V

    goto :goto_0
.end method

.method private deviceEventNewSubscriptionRecieved(Lorg/cybergarage/upnp/Service;Lorg/cybergarage/upnp/event/SubscriptionRequest;)V
    .locals 9
    .param p1, "service"    # Lorg/cybergarage/upnp/Service;
    .param p2, "subReq"    # Lorg/cybergarage/upnp/event/SubscriptionRequest;

    .prologue
    const/4 v8, 0x1

    .line 1921
    invoke-virtual {p2}, Lorg/cybergarage/upnp/event/SubscriptionRequest;->getCallback()Ljava/lang/String;

    move-result-object v0

    .line 1923
    .local v0, "callback":Ljava/lang/String;
    :try_start_0
    new-instance v5, Ljava/net/URL;

    invoke-direct {v5, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1929
    invoke-virtual {p2}, Lorg/cybergarage/upnp/event/SubscriptionRequest;->getTimeout()J

    move-result-wide v6

    .line 1930
    .local v6, "timeOut":J
    invoke-static {}, Lorg/cybergarage/upnp/event/Subscription;->createSID()Ljava/lang/String;

    move-result-object v2

    .line 1932
    .local v2, "sid":Ljava/lang/String;
    new-instance v3, Lorg/cybergarage/upnp/event/Subscriber;

    invoke-direct {v3}, Lorg/cybergarage/upnp/event/Subscriber;-><init>()V

    .line 1933
    .local v3, "sub":Lorg/cybergarage/upnp/event/Subscriber;
    invoke-virtual {v3, v0}, Lorg/cybergarage/upnp/event/Subscriber;->setDeliveryURL(Ljava/lang/String;)V

    .line 1934
    invoke-virtual {v3, v6, v7}, Lorg/cybergarage/upnp/event/Subscriber;->setTimeOut(J)V

    .line 1935
    invoke-virtual {v3, v2}, Lorg/cybergarage/upnp/event/Subscriber;->setSID(Ljava/lang/String;)V

    .line 1936
    invoke-virtual {p1, v3}, Lorg/cybergarage/upnp/Service;->addSubscriber(Lorg/cybergarage/upnp/event/Subscriber;)V

    .line 1938
    new-instance v4, Lorg/cybergarage/upnp/event/SubscriptionResponse;

    invoke-direct {v4}, Lorg/cybergarage/upnp/event/SubscriptionResponse;-><init>()V

    .line 1939
    .local v4, "subRes":Lorg/cybergarage/upnp/event/SubscriptionResponse;
    const/16 v5, 0xc8

    invoke-virtual {v4, v5}, Lorg/cybergarage/upnp/event/SubscriptionResponse;->setStatusCode(I)V

    .line 1940
    invoke-virtual {v4, v2}, Lorg/cybergarage/upnp/event/SubscriptionResponse;->setSID(Ljava/lang/String;)V

    .line 1941
    invoke-virtual {v4, v6, v7}, Lorg/cybergarage/upnp/event/SubscriptionResponse;->setTimeout(J)V

    .line 1942
    invoke-static {}, Lorg/cybergarage/util/Debug;->isOn()Z

    move-result v5

    if-ne v5, v8, :cond_0

    .line 1943
    invoke-virtual {v4}, Lorg/cybergarage/upnp/event/SubscriptionResponse;->print()V

    .line 1944
    :cond_0
    invoke-virtual {p2, v4}, Lorg/cybergarage/upnp/event/SubscriptionRequest;->post(Lorg/cybergarage/upnp/event/SubscriptionResponse;)V

    .line 1946
    invoke-static {}, Lorg/cybergarage/util/Debug;->isOn()Z

    move-result v5

    if-ne v5, v8, :cond_1

    .line 1947
    invoke-virtual {v4}, Lorg/cybergarage/upnp/event/SubscriptionResponse;->print()V

    .line 1949
    :cond_1
    invoke-virtual {p1}, Lorg/cybergarage/upnp/Service;->notifyAllStateVariables()V

    .line 1950
    .end local v2    # "sid":Ljava/lang/String;
    .end local v3    # "sub":Lorg/cybergarage/upnp/event/Subscriber;
    .end local v4    # "subRes":Lorg/cybergarage/upnp/event/SubscriptionResponse;
    .end local v6    # "timeOut":J
    :goto_0
    return-void

    .line 1924
    :catch_0
    move-exception v1

    .line 1925
    .local v1, "e":Ljava/lang/Exception;
    const/16 v5, 0x19c

    invoke-direct {p0, p2, v5}, Lorg/cybergarage/upnp/Device;->upnpBadSubscriptionRecieved(Lorg/cybergarage/upnp/event/SubscriptionRequest;I)V

    goto :goto_0
.end method

.method private deviceEventRenewSubscriptionRecieved(Lorg/cybergarage/upnp/Service;Lorg/cybergarage/upnp/event/SubscriptionRequest;)V
    .locals 7
    .param p1, "service"    # Lorg/cybergarage/upnp/Service;
    .param p2, "subReq"    # Lorg/cybergarage/upnp/event/SubscriptionRequest;

    .prologue
    .line 1953
    invoke-virtual {p2}, Lorg/cybergarage/upnp/event/SubscriptionRequest;->getSID()Ljava/lang/String;

    move-result-object v0

    .line 1954
    .local v0, "sid":Ljava/lang/String;
    invoke-virtual {p1, v0}, Lorg/cybergarage/upnp/Service;->getSubscriber(Ljava/lang/String;)Lorg/cybergarage/upnp/event/Subscriber;

    move-result-object v1

    .line 1956
    .local v1, "sub":Lorg/cybergarage/upnp/event/Subscriber;
    if-nez v1, :cond_1

    .line 1957
    const/16 v3, 0x19c

    invoke-direct {p0, p2, v3}, Lorg/cybergarage/upnp/Device;->upnpBadSubscriptionRecieved(Lorg/cybergarage/upnp/event/SubscriptionRequest;I)V

    .line 1973
    :cond_0
    :goto_0
    return-void

    .line 1961
    :cond_1
    invoke-virtual {p2}, Lorg/cybergarage/upnp/event/SubscriptionRequest;->getTimeout()J

    move-result-wide v4

    .line 1962
    .local v4, "timeOut":J
    invoke-virtual {v1, v4, v5}, Lorg/cybergarage/upnp/event/Subscriber;->setTimeOut(J)V

    .line 1963
    invoke-virtual {v1}, Lorg/cybergarage/upnp/event/Subscriber;->renew()V

    .line 1965
    new-instance v2, Lorg/cybergarage/upnp/event/SubscriptionResponse;

    invoke-direct {v2}, Lorg/cybergarage/upnp/event/SubscriptionResponse;-><init>()V

    .line 1966
    .local v2, "subRes":Lorg/cybergarage/upnp/event/SubscriptionResponse;
    const/16 v3, 0xc8

    invoke-virtual {v2, v3}, Lorg/cybergarage/upnp/event/SubscriptionResponse;->setStatusCode(I)V

    .line 1967
    invoke-virtual {v2, v0}, Lorg/cybergarage/upnp/event/SubscriptionResponse;->setSID(Ljava/lang/String;)V

    .line 1968
    invoke-virtual {v2, v4, v5}, Lorg/cybergarage/upnp/event/SubscriptionResponse;->setTimeout(J)V

    .line 1969
    invoke-virtual {p2, v2}, Lorg/cybergarage/upnp/event/SubscriptionRequest;->post(Lorg/cybergarage/upnp/event/SubscriptionResponse;)V

    .line 1971
    invoke-static {}, Lorg/cybergarage/util/Debug;->isOn()Z

    move-result v3

    const/4 v6, 0x1

    if-ne v3, v6, :cond_0

    .line 1972
    invoke-virtual {v2}, Lorg/cybergarage/upnp/event/SubscriptionResponse;->print()V

    goto :goto_0
.end method

.method private deviceEventSubscriptionRecieved(Lorg/cybergarage/upnp/event/SubscriptionRequest;)V
    .locals 5
    .param p1, "subReq"    # Lorg/cybergarage/upnp/event/SubscriptionRequest;

    .prologue
    const/16 v4, 0x19c

    const/4 v3, 0x1

    .line 1888
    invoke-virtual {p1}, Lorg/cybergarage/upnp/event/SubscriptionRequest;->getURI()Ljava/lang/String;

    move-result-object v1

    .line 1889
    .local v1, "uri":Ljava/lang/String;
    invoke-virtual {p0, v1}, Lorg/cybergarage/upnp/Device;->getServiceByEventSubURL(Ljava/lang/String;)Lorg/cybergarage/upnp/Service;

    move-result-object v0

    .line 1890
    .local v0, "service":Lorg/cybergarage/upnp/Service;
    if-nez v0, :cond_0

    .line 1891
    invoke-virtual {p1}, Lorg/cybergarage/upnp/event/SubscriptionRequest;->returnBadRequest()Z

    .line 1918
    :goto_0
    return-void

    .line 1894
    :cond_0
    invoke-virtual {p1}, Lorg/cybergarage/upnp/event/SubscriptionRequest;->hasCallback()Z

    move-result v2

    if-nez v2, :cond_1

    invoke-virtual {p1}, Lorg/cybergarage/upnp/event/SubscriptionRequest;->hasSID()Z

    move-result v2

    if-nez v2, :cond_1

    .line 1895
    invoke-direct {p0, p1, v4}, Lorg/cybergarage/upnp/Device;->upnpBadSubscriptionRecieved(Lorg/cybergarage/upnp/event/SubscriptionRequest;I)V

    goto :goto_0

    .line 1900
    :cond_1
    invoke-virtual {p1}, Lorg/cybergarage/upnp/event/SubscriptionRequest;->isUnsubscribeRequest()Z

    move-result v2

    if-ne v2, v3, :cond_2

    .line 1901
    invoke-direct {p0, v0, p1}, Lorg/cybergarage/upnp/Device;->deviceEventUnsubscriptionRecieved(Lorg/cybergarage/upnp/Service;Lorg/cybergarage/upnp/event/SubscriptionRequest;)V

    goto :goto_0

    .line 1906
    :cond_2
    invoke-virtual {p1}, Lorg/cybergarage/upnp/event/SubscriptionRequest;->hasCallback()Z

    move-result v2

    if-ne v2, v3, :cond_3

    .line 1907
    invoke-direct {p0, v0, p1}, Lorg/cybergarage/upnp/Device;->deviceEventNewSubscriptionRecieved(Lorg/cybergarage/upnp/Service;Lorg/cybergarage/upnp/event/SubscriptionRequest;)V

    goto :goto_0

    .line 1912
    :cond_3
    invoke-virtual {p1}, Lorg/cybergarage/upnp/event/SubscriptionRequest;->hasSID()Z

    move-result v2

    if-ne v2, v3, :cond_4

    .line 1913
    invoke-direct {p0, v0, p1}, Lorg/cybergarage/upnp/Device;->deviceEventRenewSubscriptionRecieved(Lorg/cybergarage/upnp/Service;Lorg/cybergarage/upnp/event/SubscriptionRequest;)V

    goto :goto_0

    .line 1917
    :cond_4
    invoke-direct {p0, p1, v4}, Lorg/cybergarage/upnp/Device;->upnpBadSubscriptionRecieved(Lorg/cybergarage/upnp/event/SubscriptionRequest;I)V

    goto :goto_0
.end method

.method private deviceEventUnsubscriptionRecieved(Lorg/cybergarage/upnp/Service;Lorg/cybergarage/upnp/event/SubscriptionRequest;)V
    .locals 5
    .param p1, "service"    # Lorg/cybergarage/upnp/Service;
    .param p2, "subReq"    # Lorg/cybergarage/upnp/event/SubscriptionRequest;

    .prologue
    .line 1976
    invoke-virtual {p2}, Lorg/cybergarage/upnp/event/SubscriptionRequest;->getSID()Ljava/lang/String;

    move-result-object v0

    .line 1977
    .local v0, "sid":Ljava/lang/String;
    invoke-virtual {p1, v0}, Lorg/cybergarage/upnp/Service;->getSubscriber(Ljava/lang/String;)Lorg/cybergarage/upnp/event/Subscriber;

    move-result-object v1

    .line 1979
    .local v1, "sub":Lorg/cybergarage/upnp/event/Subscriber;
    if-nez v1, :cond_1

    .line 1980
    const/16 v3, 0x19c

    invoke-direct {p0, p2, v3}, Lorg/cybergarage/upnp/Device;->upnpBadSubscriptionRecieved(Lorg/cybergarage/upnp/event/SubscriptionRequest;I)V

    .line 1992
    :cond_0
    :goto_0
    return-void

    .line 1984
    :cond_1
    invoke-virtual {p1, v1}, Lorg/cybergarage/upnp/Service;->removeSubscriber(Lorg/cybergarage/upnp/event/Subscriber;)V

    .line 1986
    new-instance v2, Lorg/cybergarage/upnp/event/SubscriptionResponse;

    invoke-direct {v2}, Lorg/cybergarage/upnp/event/SubscriptionResponse;-><init>()V

    .line 1987
    .local v2, "subRes":Lorg/cybergarage/upnp/event/SubscriptionResponse;
    const/16 v3, 0xc8

    invoke-virtual {v2, v3}, Lorg/cybergarage/upnp/event/SubscriptionResponse;->setStatusCode(I)V

    .line 1988
    invoke-virtual {p2, v2}, Lorg/cybergarage/upnp/event/SubscriptionRequest;->post(Lorg/cybergarage/upnp/event/SubscriptionResponse;)V

    .line 1990
    invoke-static {}, Lorg/cybergarage/util/Debug;->isOn()Z

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 1991
    invoke-virtual {v2}, Lorg/cybergarage/upnp/event/SubscriptionResponse;->print()V

    goto :goto_0
.end method

.method private deviceQueryControlRecieved(Lorg/cybergarage/upnp/control/QueryRequest;Lorg/cybergarage/upnp/Service;)V
    .locals 4
    .param p1, "ctlReq"    # Lorg/cybergarage/upnp/control/QueryRequest;
    .param p2, "service"    # Lorg/cybergarage/upnp/Service;

    .prologue
    .line 1865
    invoke-static {}, Lorg/cybergarage/util/Debug;->isOn()Z

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    .line 1866
    invoke-virtual {p1}, Lorg/cybergarage/upnp/control/QueryRequest;->print()V

    .line 1867
    :cond_0
    invoke-virtual {p1}, Lorg/cybergarage/upnp/control/QueryRequest;->getVarName()Ljava/lang/String;

    move-result-object v1

    .line 1868
    .local v1, "varName":Ljava/lang/String;
    invoke-virtual {p2, v1}, Lorg/cybergarage/upnp/Service;->hasStateVariable(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 1869
    invoke-direct {p0, p1}, Lorg/cybergarage/upnp/Device;->invalidActionControlRecieved(Lorg/cybergarage/upnp/control/ControlRequest;)V

    .line 1875
    :cond_1
    :goto_0
    return-void

    .line 1872
    :cond_2
    invoke-virtual {p0, v1}, Lorg/cybergarage/upnp/Device;->getStateVariable(Ljava/lang/String;)Lorg/cybergarage/upnp/StateVariable;

    move-result-object v0

    .line 1873
    .local v0, "stateVar":Lorg/cybergarage/upnp/StateVariable;
    invoke-virtual {v0, p1}, Lorg/cybergarage/upnp/StateVariable;->performQueryListener(Lorg/cybergarage/upnp/control/QueryRequest;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 1874
    invoke-direct {p0, p1}, Lorg/cybergarage/upnp/Device;->invalidActionControlRecieved(Lorg/cybergarage/upnp/control/ControlRequest;)V

    goto :goto_0
.end method

.method private getAdvertiser()Lorg/cybergarage/upnp/device/Advertiser;
    .locals 1

    .prologue
    .line 2072
    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->getDeviceData()Lorg/cybergarage/upnp/xml/DeviceData;

    move-result-object v0

    invoke-virtual {v0}, Lorg/cybergarage/upnp/xml/DeviceData;->getAdvertiser()Lorg/cybergarage/upnp/device/Advertiser;

    move-result-object v0

    return-object v0
.end method

.method private declared-synchronized getDescriptionData(Ljava/lang/String;)[B
    .locals 4
    .param p1, "host"    # Ljava/lang/String;

    .prologue
    .line 1741
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->isNMPRMode()Z

    move-result v2

    if-nez v2, :cond_0

    .line 1742
    invoke-direct {p0, p1}, Lorg/cybergarage/upnp/Device;->updateURLBase(Ljava/lang/String;)V

    .line 1743
    :cond_0
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getRootNode()Lorg/cybergarage/xml/Node;

    move-result-object v1

    .line 1744
    .local v1, "rootNode":Lorg/cybergarage/xml/Node;
    if-nez v1, :cond_1

    .line 1745
    const/4 v2, 0x0

    new-array v2, v2, [B
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1751
    :goto_0
    monitor-exit p0

    return-object v2

    .line 1747
    :cond_1
    :try_start_1
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0}, Ljava/lang/String;-><init>()V

    .line 1748
    .local v0, "desc":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "<?xml version=\"1.0\" encoding=\"utf-8\"?>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1749
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1750
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Lorg/cybergarage/xml/Node;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1751
    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v2

    goto :goto_0

    .line 1741
    .end local v0    # "desc":Ljava/lang/String;
    .end local v1    # "rootNode":Lorg/cybergarage/xml/Node;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method private getDescriptionURI()Ljava/lang/String;
    .locals 1

    .prologue
    .line 487
    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->getDeviceData()Lorg/cybergarage/upnp/xml/DeviceData;

    move-result-object v0

    invoke-virtual {v0}, Lorg/cybergarage/upnp/xml/DeviceData;->getDescriptionURI()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getDeviceData()Lorg/cybergarage/upnp/xml/DeviceData;
    .locals 2

    .prologue
    .line 460
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    .line 461
    .local v0, "node":Lorg/cybergarage/xml/Node;
    invoke-virtual {v0}, Lorg/cybergarage/xml/Node;->getUserData()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/cybergarage/upnp/xml/DeviceData;

    .line 462
    .local v1, "userData":Lorg/cybergarage/upnp/xml/DeviceData;
    if-nez v1, :cond_0

    .line 463
    new-instance v1, Lorg/cybergarage/upnp/xml/DeviceData;

    .end local v1    # "userData":Lorg/cybergarage/upnp/xml/DeviceData;
    invoke-direct {v1}, Lorg/cybergarage/upnp/xml/DeviceData;-><init>()V

    .line 464
    .restart local v1    # "userData":Lorg/cybergarage/upnp/xml/DeviceData;
    invoke-virtual {v0, v1}, Lorg/cybergarage/xml/Node;->setUserData(Ljava/lang/Object;)V

    .line 465
    invoke-virtual {v1, v0}, Lorg/cybergarage/upnp/xml/DeviceData;->setNode(Lorg/cybergarage/xml/Node;)V

    .line 467
    :cond_0
    return-object v1
.end method

.method private getHTTPServerList()Lorg/cybergarage/http/HTTPServerList;
    .locals 1

    .prologue
    .line 1999
    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->getDeviceData()Lorg/cybergarage/upnp/xml/DeviceData;

    move-result-object v0

    invoke-virtual {v0}, Lorg/cybergarage/upnp/xml/DeviceData;->getHTTPServerList()Lorg/cybergarage/http/HTTPServerList;

    move-result-object v0

    return-object v0
.end method

.method private getNotifyDeviceNT()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1415
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->isRootDevice()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1416
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v0

    .line 1417
    :goto_0
    return-object v0

    :cond_0
    const-string v0, "upnp:rootdevice"

    goto :goto_0
.end method

.method private getNotifyDeviceTypeNT()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1427
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getNotifyDeviceTypeUSN()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1431
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "::"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getNotifyDeviceUSN()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1421
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->isRootDevice()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1422
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v0

    .line 1423
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "::"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "upnp:rootdevice"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private getParameterFromDevice(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 790
    const-string v2, ""

    .line 791
    .local v2, "parameter":Ljava/lang/String;
    invoke-virtual {p0, p1}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 792
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    new-instance v1, Lorg/cybergarage/upnp/ArgumentList;

    invoke-direct {v1}, Lorg/cybergarage/upnp/ArgumentList;-><init>()V

    .line 794
    .local v1, "argumentList":Lorg/cybergarage/upnp/ArgumentList;
    if-eqz v0, :cond_3

    .line 795
    const-string v3, "GetInformation"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    const-string v3, "GetDeviceInformation"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 796
    :cond_0
    sget-object v3, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->SET_TIME_SYNC_ARGS:[Ljava/lang/String;

    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->timeSync()[Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v0, v3, v4}, Lorg/cybergarage/upnp/Device;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 797
    :cond_1
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->getOutputArgumentList()Lorg/cybergarage/upnp/ArgumentList;

    move-result-object v1

    .line 798
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_2

    .line 799
    const/4 v3, 0x0

    .line 809
    :goto_0
    return-object v3

    .line 801
    :cond_2
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v2

    .line 805
    :cond_3
    const-string v3, ""

    if-ne v2, v3, :cond_4

    invoke-virtual {v1}, Lorg/cybergarage/upnp/ArgumentList;->size()I

    move-result v3

    if-lez v3, :cond_4

    .line 806
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Lorg/cybergarage/upnp/ArgumentList;->getArgument(I)Lorg/cybergarage/upnp/Argument;

    move-result-object v3

    invoke-virtual {v3}, Lorg/cybergarage/upnp/Argument;->getValue()Ljava/lang/String;

    move-result-object v2

    :cond_4
    move-object v3, v2

    .line 809
    goto :goto_0
.end method

.method private getSSDPSearchSocketList()Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;
    .locals 1

    .prologue
    .line 2064
    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->getDeviceData()Lorg/cybergarage/upnp/xml/DeviceData;

    move-result-object v0

    invoke-virtual {v0}, Lorg/cybergarage/upnp/xml/DeviceData;->getSSDPSearchSocketList()Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;

    move-result-object v0

    return-object v0
.end method

.method private getUUID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 364
    iget-object v0, p0, Lorg/cybergarage/upnp/Device;->devUUID:Ljava/lang/String;

    return-object v0
.end method

.method private getUrlBaseStr()Ljava/lang/String;
    .locals 4

    .prologue
    .line 1282
    const-string v2, ""

    .line 1283
    .local v2, "urlBaseStr":Ljava/lang/String;
    move-object v0, p0

    .line 1285
    .local v0, "dev":Lorg/cybergarage/upnp/Device;
    if-eqz v0, :cond_0

    .line 1286
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Device;->getURLBase()Ljava/lang/String;

    move-result-object v2

    .line 1288
    :cond_0
    if-eqz v2, :cond_1

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-gtz v3, :cond_2

    .line 1289
    :cond_1
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getRootDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v1

    .line 1290
    .local v1, "rootDev":Lorg/cybergarage/upnp/Device;
    if-eqz v1, :cond_2

    .line 1291
    invoke-virtual {v1}, Lorg/cybergarage/upnp/Device;->getURLBase()Ljava/lang/String;

    move-result-object v2

    .line 1295
    .end local v1    # "rootDev":Lorg/cybergarage/upnp/Device;
    :cond_2
    if-eqz v2, :cond_3

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-gtz v3, :cond_4

    .line 1296
    :cond_3
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getRootDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v1

    .line 1297
    .restart local v1    # "rootDev":Lorg/cybergarage/upnp/Device;
    if-eqz v1, :cond_4

    .line 1298
    invoke-virtual {v1}, Lorg/cybergarage/upnp/Device;->getLocation()Ljava/lang/String;

    move-result-object v2

    .line 1301
    .end local v1    # "rootDev":Lorg/cybergarage/upnp/Device;
    :cond_4
    return-object v2
.end method

.method private httpGetRequestRecieved(Lorg/cybergarage/http/HTTPRequest;)V
    .locals 9
    .param p1, "httpReq"    # Lorg/cybergarage/http/HTTPRequest;

    .prologue
    const/4 v8, 0x1

    .line 1755
    invoke-virtual {p1}, Lorg/cybergarage/http/HTTPRequest;->getURI()Ljava/lang/String;

    move-result-object v5

    .line 1756
    .local v5, "uri":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "httpGetRequestRecieved = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lorg/cybergarage/util/Debug;->message(Ljava/lang/String;)V

    .line 1757
    if-nez v5, :cond_0

    .line 1758
    invoke-virtual {p1}, Lorg/cybergarage/http/HTTPRequest;->returnBadRequest()Z

    .line 1787
    :goto_0
    return-void

    .line 1765
    :cond_0
    const/4 v6, 0x0

    new-array v2, v6, [B

    .line 1766
    .local v2, "fileByte":[B
    invoke-direct {p0, v5}, Lorg/cybergarage/upnp/Device;->isDescriptionURI(Ljava/lang/String;)Z

    move-result v6

    if-ne v6, v8, :cond_2

    .line 1767
    invoke-virtual {p1}, Lorg/cybergarage/http/HTTPRequest;->getLocalAddress()Ljava/lang/String;

    move-result-object v4

    .line 1768
    .local v4, "localAddr":Ljava/lang/String;
    invoke-static {}, Lorg/cybergarage/net/HostInterface;->getInterface()Ljava/lang/String;

    move-result-object v4

    .line 1769
    invoke-direct {p0, v4}, Lorg/cybergarage/upnp/Device;->getDescriptionData(Ljava/lang/String;)[B

    move-result-object v2

    .line 1780
    .end local v4    # "localAddr":Ljava/lang/String;
    :goto_1
    new-instance v3, Lorg/cybergarage/http/HTTPResponse;

    invoke-direct {v3}, Lorg/cybergarage/http/HTTPResponse;-><init>()V

    .line 1781
    .local v3, "httpRes":Lorg/cybergarage/http/HTTPResponse;
    invoke-static {v5}, Lorg/cybergarage/util/FileUtil;->isXMLFileName(Ljava/lang/String;)Z

    move-result v6

    if-ne v6, v8, :cond_1

    .line 1782
    const-string v6, "text/xml; charset=\"utf-8\""

    invoke-virtual {v3, v6}, Lorg/cybergarage/http/HTTPResponse;->setContentType(Ljava/lang/String;)V

    .line 1783
    :cond_1
    const/16 v6, 0xc8

    invoke-virtual {v3, v6}, Lorg/cybergarage/http/HTTPResponse;->setStatusCode(I)V

    .line 1784
    invoke-virtual {v3, v2}, Lorg/cybergarage/http/HTTPResponse;->setContent([B)V

    .line 1786
    invoke-virtual {p1, v3}, Lorg/cybergarage/http/HTTPRequest;->post(Lorg/cybergarage/http/HTTPResponse;)Z

    goto :goto_0

    .line 1770
    .end local v3    # "httpRes":Lorg/cybergarage/http/HTTPResponse;
    :cond_2
    invoke-virtual {p0, v5}, Lorg/cybergarage/upnp/Device;->getDeviceByDescriptionURI(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v0

    .local v0, "embDev":Lorg/cybergarage/upnp/Device;
    if-eqz v0, :cond_3

    .line 1771
    invoke-virtual {p1}, Lorg/cybergarage/http/HTTPRequest;->getLocalAddress()Ljava/lang/String;

    move-result-object v4

    .line 1772
    .restart local v4    # "localAddr":Ljava/lang/String;
    invoke-direct {v0, v4}, Lorg/cybergarage/upnp/Device;->getDescriptionData(Ljava/lang/String;)[B

    move-result-object v2

    .line 1773
    goto :goto_1

    .end local v4    # "localAddr":Ljava/lang/String;
    :cond_3
    invoke-virtual {p0, v5}, Lorg/cybergarage/upnp/Device;->getServiceBySCPDURL(Ljava/lang/String;)Lorg/cybergarage/upnp/Service;

    move-result-object v1

    .local v1, "embService":Lorg/cybergarage/upnp/Service;
    if-eqz v1, :cond_4

    .line 1774
    invoke-virtual {v1}, Lorg/cybergarage/upnp/Service;->getSCPDData()[B

    move-result-object v2

    goto :goto_1

    .line 1776
    :cond_4
    invoke-virtual {p1}, Lorg/cybergarage/http/HTTPRequest;->returnBadRequest()Z

    goto :goto_0
.end method

.method private httpPostRequestRecieved(Lorg/cybergarage/http/HTTPRequest;)V
    .locals 2
    .param p1, "httpReq"    # Lorg/cybergarage/http/HTTPRequest;

    .prologue
    .line 1790
    invoke-virtual {p1}, Lorg/cybergarage/http/HTTPRequest;->isSOAPAction()Z

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 1792
    invoke-direct {p0, p1}, Lorg/cybergarage/upnp/Device;->soapActionRecieved(Lorg/cybergarage/http/HTTPRequest;)V

    .line 1796
    :goto_0
    return-void

    .line 1795
    :cond_0
    invoke-virtual {p1}, Lorg/cybergarage/http/HTTPRequest;->returnBadRequest()Z

    goto :goto_0
.end method

.method private initializeLoadedDescription()Z
    .locals 1

    .prologue
    .line 571
    const-string v0, "/description.xml"

    invoke-direct {p0, v0}, Lorg/cybergarage/upnp/Device;->setDescriptionURI(Ljava/lang/String;)V

    .line 572
    const/16 v0, 0x708

    invoke-virtual {p0, v0}, Lorg/cybergarage/upnp/Device;->setLeaseTime(I)V

    .line 573
    const/16 v0, 0xfa4

    invoke-virtual {p0, v0}, Lorg/cybergarage/upnp/Device;->setHTTPPort(I)V

    .line 576
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->hasUDN()Z

    move-result v0

    if-nez v0, :cond_0

    .line 577
    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->updateUDN()V

    .line 579
    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method private invalidActionControlRecieved(Lorg/cybergarage/upnp/control/ControlRequest;)V
    .locals 2
    .param p1, "ctlReq"    # Lorg/cybergarage/upnp/control/ControlRequest;

    .prologue
    .line 1831
    new-instance v0, Lorg/cybergarage/upnp/control/ActionResponse;

    invoke-direct {v0}, Lorg/cybergarage/upnp/control/ActionResponse;-><init>()V

    .line 1832
    .local v0, "actRes":Lorg/cybergarage/upnp/control/ControlResponse;
    const/16 v1, 0x191

    invoke-virtual {v0, v1}, Lorg/cybergarage/upnp/control/ControlResponse;->setFaultResponse(I)V

    .line 1833
    invoke-virtual {p1, v0}, Lorg/cybergarage/upnp/control/ControlRequest;->post(Lorg/cybergarage/http/HTTPResponse;)Z

    .line 1834
    return-void
.end method

.method private invalidArgumentsControlRecieved(Lorg/cybergarage/upnp/control/ControlRequest;)V
    .locals 2
    .param p1, "ctlReq"    # Lorg/cybergarage/upnp/control/ControlRequest;

    .prologue
    .line 1837
    new-instance v0, Lorg/cybergarage/upnp/control/ActionResponse;

    invoke-direct {v0}, Lorg/cybergarage/upnp/control/ActionResponse;-><init>()V

    .line 1838
    .local v0, "actRes":Lorg/cybergarage/upnp/control/ControlResponse;
    const/16 v1, 0x192

    invoke-virtual {v0, v1}, Lorg/cybergarage/upnp/control/ControlResponse;->setFaultResponse(I)V

    .line 1839
    invoke-virtual {p1, v0}, Lorg/cybergarage/upnp/control/ControlRequest;->post(Lorg/cybergarage/http/HTTPResponse;)Z

    .line 1840
    return-void
.end method

.method private isDescriptionURI(Ljava/lang/String;)Z
    .locals 2
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 491
    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->getDescriptionURI()Ljava/lang/String;

    move-result-object v0

    .line 492
    .local v0, "descriptionURI":Ljava/lang/String;
    if-eqz p1, :cond_0

    if-nez v0, :cond_1

    .line 493
    :cond_0
    const/4 v1, 0x0

    .line 494
    :goto_0
    return v1

    :cond_1
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_0
.end method

.method public static isDeviceNode(Lorg/cybergarage/xml/Node;)Z
    .locals 2
    .param p0, "node"    # Lorg/cybergarage/xml/Node;

    .prologue
    .line 587
    const-string v0, "device"

    invoke-virtual {p0}, Lorg/cybergarage/xml/Node;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static final notifyWait()V
    .locals 1

    .prologue
    .line 1435
    const/16 v0, 0x12c

    invoke-static {v0}, Lorg/cybergarage/util/TimerUtil;->waitRandom(I)V

    .line 1436
    return-void
.end method

.method private setAdvertiser(Lorg/cybergarage/upnp/device/Advertiser;)V
    .locals 1
    .param p1, "adv"    # Lorg/cybergarage/upnp/device/Advertiser;

    .prologue
    .line 2068
    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->getDeviceData()Lorg/cybergarage/upnp/xml/DeviceData;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/cybergarage/upnp/xml/DeviceData;->setAdvertiser(Lorg/cybergarage/upnp/device/Advertiser;)V

    .line 2069
    return-void
.end method

.method private setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z
    .locals 3
    .param p1, "action"    # Lorg/cybergarage/upnp/Action;
    .param p2, "keyList"    # [Ljava/lang/String;
    .param p3, "argList"    # [Ljava/lang/String;

    .prologue
    .line 2333
    if-eqz p3, :cond_0

    if-eqz p2, :cond_0

    .line 2334
    const/4 v0, 0x0

    .local v0, "counter":I
    :goto_0
    array-length v1, p2

    if-ge v0, v1, :cond_1

    .line 2335
    aget-object v1, p2, v0

    aget-object v2, p3, v0

    invoke-virtual {p1, v1, v2}, Lorg/cybergarage/upnp/Action;->setArgumentValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 2334
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2338
    .end local v0    # "counter":I
    :cond_0
    const/4 v1, 0x0

    .line 2340
    :goto_1
    return v1

    .restart local v0    # "counter":I
    :cond_1
    const/4 v1, 0x1

    goto :goto_1
.end method

.method private setDescriptionFile(Ljava/io/File;)V
    .locals 1
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 475
    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->getDeviceData()Lorg/cybergarage/upnp/xml/DeviceData;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/cybergarage/upnp/xml/DeviceData;->setDescriptionFile(Ljava/io/File;)V

    .line 476
    return-void
.end method

.method private setDescriptionURI(Ljava/lang/String;)V
    .locals 1
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 483
    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->getDeviceData()Lorg/cybergarage/upnp/xml/DeviceData;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/cybergarage/upnp/xml/DeviceData;->setDescriptionURI(Ljava/lang/String;)V

    .line 484
    return-void
.end method

.method private setURLBase(Ljava/lang/String;)V
    .locals 4
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 677
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->isRootDevice()Z

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    .line 678
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getRootNode()Lorg/cybergarage/xml/Node;

    move-result-object v2

    const-string v3, "URLBase"

    invoke-virtual {v2, v3}, Lorg/cybergarage/xml/Node;->getNode(Ljava/lang/String;)Lorg/cybergarage/xml/Node;

    move-result-object v1

    .line 679
    .local v1, "node":Lorg/cybergarage/xml/Node;
    if-eqz v1, :cond_1

    .line 680
    invoke-virtual {v1, p1}, Lorg/cybergarage/xml/Node;->setValue(Ljava/lang/String;)V

    .line 690
    .end local v1    # "node":Lorg/cybergarage/xml/Node;
    :cond_0
    :goto_0
    return-void

    .line 683
    .restart local v1    # "node":Lorg/cybergarage/xml/Node;
    :cond_1
    new-instance v1, Lorg/cybergarage/xml/Node;

    .end local v1    # "node":Lorg/cybergarage/xml/Node;
    const-string v2, "URLBase"

    invoke-direct {v1, v2}, Lorg/cybergarage/xml/Node;-><init>(Ljava/lang/String;)V

    .line 684
    .restart local v1    # "node":Lorg/cybergarage/xml/Node;
    invoke-virtual {v1, p1}, Lorg/cybergarage/xml/Node;->setValue(Ljava/lang/String;)V

    .line 685
    const/4 v0, 0x1

    .line 686
    .local v0, "index":I
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getRootNode()Lorg/cybergarage/xml/Node;

    move-result-object v2

    invoke-virtual {v2}, Lorg/cybergarage/xml/Node;->hasNodes()Z

    move-result v2

    if-nez v2, :cond_2

    .line 687
    const/4 v0, 0x1

    .line 688
    :cond_2
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getRootNode()Lorg/cybergarage/xml/Node;

    move-result-object v2

    invoke-virtual {v2, v1, v0}, Lorg/cybergarage/xml/Node;->insertNode(Lorg/cybergarage/xml/Node;I)V

    goto :goto_0
.end method

.method private setUUID(Ljava/lang/String;)V
    .locals 0
    .param p1, "uuid"    # Ljava/lang/String;

    .prologue
    .line 360
    iput-object p1, p0, Lorg/cybergarage/upnp/Device;->devUUID:Ljava/lang/String;

    .line 361
    return-void
.end method

.method private soapActionRecieved(Lorg/cybergarage/http/HTTPRequest;)V
    .locals 3
    .param p1, "soapReq"    # Lorg/cybergarage/http/HTTPRequest;

    .prologue
    .line 1809
    invoke-virtual {p1}, Lorg/cybergarage/http/HTTPRequest;->getURI()Ljava/lang/String;

    move-result-object v2

    .line 1810
    .local v2, "uri":Ljava/lang/String;
    invoke-virtual {p0, v2}, Lorg/cybergarage/upnp/Device;->getServiceByControlURL(Ljava/lang/String;)Lorg/cybergarage/upnp/Service;

    move-result-object v1

    .line 1811
    .local v1, "ctlService":Lorg/cybergarage/upnp/Service;
    if-eqz v1, :cond_0

    .line 1812
    new-instance v0, Lorg/cybergarage/upnp/control/ActionRequest;

    invoke-direct {v0, p1}, Lorg/cybergarage/upnp/control/ActionRequest;-><init>(Lorg/cybergarage/http/HTTPRequest;)V

    .line 1813
    .local v0, "crlReq":Lorg/cybergarage/upnp/control/ActionRequest;
    invoke-direct {p0, v0, v1}, Lorg/cybergarage/upnp/Device;->deviceControlRequestRecieved(Lorg/cybergarage/upnp/control/ControlRequest;Lorg/cybergarage/upnp/Service;)V

    .line 1817
    .end local v0    # "crlReq":Lorg/cybergarage/upnp/control/ActionRequest;
    :goto_0
    return-void

    .line 1816
    :cond_0
    invoke-direct {p0, p1}, Lorg/cybergarage/upnp/Device;->soapBadActionRecieved(Lorg/cybergarage/http/HTTPRequest;)V

    goto :goto_0
.end method

.method private soapBadActionRecieved(Lorg/cybergarage/http/HTTPRequest;)V
    .locals 2
    .param p1, "soapReq"    # Lorg/cybergarage/http/HTTPRequest;

    .prologue
    .line 1803
    new-instance v0, Lorg/cybergarage/soap/SOAPResponse;

    invoke-direct {v0}, Lorg/cybergarage/soap/SOAPResponse;-><init>()V

    .line 1804
    .local v0, "soapRes":Lorg/cybergarage/soap/SOAPResponse;
    const/16 v1, 0x190

    invoke-virtual {v0, v1}, Lorg/cybergarage/soap/SOAPResponse;->setStatusCode(I)V

    .line 1805
    invoke-virtual {p1, v0}, Lorg/cybergarage/http/HTTPRequest;->post(Lorg/cybergarage/http/HTTPResponse;)Z

    .line 1806
    return-void
.end method

.method private stop(Z)Z
    .locals 5
    .param p1, "doByeBye"    # Z

    .prologue
    const/4 v4, 0x1

    .line 2123
    if-ne p1, v4, :cond_0

    .line 2124
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->byebye()V

    .line 2126
    :cond_0
    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->getHTTPServerList()Lorg/cybergarage/http/HTTPServerList;

    move-result-object v1

    .line 2127
    .local v1, "httpServerList":Lorg/cybergarage/http/HTTPServerList;
    invoke-virtual {v1}, Lorg/cybergarage/http/HTTPServerList;->stop()V

    .line 2128
    invoke-virtual {v1}, Lorg/cybergarage/http/HTTPServerList;->close()V

    .line 2129
    invoke-virtual {v1}, Lorg/cybergarage/http/HTTPServerList;->clear()V

    .line 2131
    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->getSSDPSearchSocketList()Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;

    move-result-object v2

    .line 2132
    .local v2, "ssdpSearchSockList":Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;
    invoke-virtual {v2}, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;->stop()V

    .line 2133
    invoke-virtual {v2}, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;->close()V

    .line 2134
    invoke-virtual {v2}, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;->clear()V

    .line 2136
    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->getAdvertiser()Lorg/cybergarage/upnp/device/Advertiser;

    move-result-object v0

    .line 2137
    .local v0, "adv":Lorg/cybergarage/upnp/device/Advertiser;
    if-eqz v0, :cond_1

    .line 2138
    invoke-virtual {v0}, Lorg/cybergarage/upnp/device/Advertiser;->stop()V

    .line 2139
    const/4 v3, 0x0

    invoke-direct {p0, v3}, Lorg/cybergarage/upnp/Device;->setAdvertiser(Lorg/cybergarage/upnp/device/Advertiser;)V

    .line 2142
    :cond_1
    return v4
.end method

.method private timeSync()[Ljava/lang/String;
    .locals 12

    .prologue
    const/4 v10, 0x3

    const/4 v9, 0x2

    const/4 v8, 0x1

    .line 2373
    const/4 v6, 0x4

    new-array v0, v6, [Ljava/lang/String;

    .line 2374
    .local v0, "argList":[Ljava/lang/String;
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v5

    .line 2375
    .local v5, "t":Ljava/util/TimeZone;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Ljava/util/TimeZone;->getOffset(J)I

    move-result v2

    .line 2376
    .local v2, "offset":I
    div-int/lit16 v6, v2, 0x3e8

    div-int/lit8 v6, v6, 0x3c

    div-int/lit8 v3, v6, 0x3c

    .line 2377
    .local v3, "offsetHrs":I
    div-int/lit16 v6, v2, 0x3e8

    div-int/lit8 v6, v6, 0x3c

    rem-int/lit8 v4, v6, 0x3c

    .line 2378
    .local v4, "offsetMins":I
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, ""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v0, v8

    .line 2379
    const/16 v6, 0x1e

    if-ne v4, v6, :cond_0

    .line 2380
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    aget-object v7, v0, v8

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ".5"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v0, v8

    .line 2383
    :cond_0
    new-instance v1, Ljava/util/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-direct {v1, v6, v7}, Ljava/util/Date;-><init>(J)V

    .line 2384
    .local v1, "date":Ljava/util/Date;
    invoke-virtual {v5, v1}, Ljava/util/TimeZone;->inDaylightTime(Ljava/util/Date;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 2385
    const-string v6, "1"

    aput-object v6, v0, v9

    .line 2390
    :goto_0
    invoke-virtual {v5}, Ljava/util/TimeZone;->useDaylightTime()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 2391
    const-string v6, "1"

    aput-object v6, v0, v10

    .line 2395
    :goto_1
    const/4 v6, 0x0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    const-wide/16 v10, 0x3e8

    div-long/2addr v8, v10

    invoke-static {v8, v9}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v0, v6

    .line 2396
    return-object v0

    .line 2387
    :cond_1
    const-string v6, "0"

    aput-object v6, v0, v9

    goto :goto_0

    .line 2393
    :cond_2
    const-string v6, "0"

    aput-object v6, v0, v10

    goto :goto_1
.end method

.method private updateUDN()V
    .locals 2

    .prologue
    .line 368
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "uuid:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->getUUID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/cybergarage/upnp/Device;->setUDN(Ljava/lang/String;)V

    .line 369
    return-void
.end method

.method private updateURLBase(Ljava/lang/String;)V
    .locals 3
    .param p1, "host"    # Ljava/lang/String;

    .prologue
    .line 693
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getHTTPPort()I

    move-result v1

    const-string v2, ""

    invoke-static {p1, v1, v2}, Lorg/cybergarage/net/HostInterface;->getHostURL(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 694
    .local v0, "urlBase":Ljava/lang/String;
    invoke-direct {p0, v0}, Lorg/cybergarage/upnp/Device;->setURLBase(Ljava/lang/String;)V

    .line 695
    return-void
.end method

.method private upnpBadSubscriptionRecieved(Lorg/cybergarage/upnp/event/SubscriptionRequest;I)V
    .locals 1
    .param p1, "subReq"    # Lorg/cybergarage/upnp/event/SubscriptionRequest;
    .param p2, "code"    # I

    .prologue
    .line 1882
    new-instance v0, Lorg/cybergarage/upnp/event/SubscriptionResponse;

    invoke-direct {v0}, Lorg/cybergarage/upnp/event/SubscriptionResponse;-><init>()V

    .line 1883
    .local v0, "subRes":Lorg/cybergarage/upnp/event/SubscriptionResponse;
    invoke-virtual {v0, p2}, Lorg/cybergarage/upnp/event/SubscriptionResponse;->setErrorResponse(I)V

    .line 1884
    invoke-virtual {p1, v0}, Lorg/cybergarage/upnp/event/SubscriptionRequest;->post(Lorg/cybergarage/upnp/event/SubscriptionResponse;)V

    .line 1885
    return-void
.end method


# virtual methods
.method public addDevice(Lorg/cybergarage/upnp/Device;)V
    .locals 7
    .param p1, "d"    # Lorg/cybergarage/upnp/Device;

    .prologue
    .line 431
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceNode()Lorg/cybergarage/xml/Node;

    move-result-object v5

    const-string v6, "deviceList"

    invoke-virtual {v5, v6}, Lorg/cybergarage/xml/Node;->getNode(Ljava/lang/String;)Lorg/cybergarage/xml/Node;

    move-result-object v0

    .line 432
    .local v0, "deviceListNode":Lorg/cybergarage/xml/Node;
    if-nez v0, :cond_0

    .line 434
    new-instance v0, Lorg/cybergarage/xml/Node;

    .end local v0    # "deviceListNode":Lorg/cybergarage/xml/Node;
    const-string v5, "deviceList"

    invoke-direct {v0, v5}, Lorg/cybergarage/xml/Node;-><init>(Ljava/lang/String;)V

    .line 435
    .restart local v0    # "deviceListNode":Lorg/cybergarage/xml/Node;
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceNode()Lorg/cybergarage/xml/Node;

    move-result-object v5

    invoke-virtual {v5, v0}, Lorg/cybergarage/xml/Node;->addNode(Lorg/cybergarage/xml/Node;)V

    .line 437
    :cond_0
    invoke-virtual {p1}, Lorg/cybergarage/upnp/Device;->getDeviceNode()Lorg/cybergarage/xml/Node;

    move-result-object v5

    invoke-virtual {v0, v5}, Lorg/cybergarage/xml/Node;->addNode(Lorg/cybergarage/xml/Node;)V

    .line 438
    const/4 v5, 0x0

    invoke-virtual {p1, v5}, Lorg/cybergarage/upnp/Device;->setRootNode(Lorg/cybergarage/xml/Node;)V

    .line 439
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getRootNode()Lorg/cybergarage/xml/Node;

    move-result-object v5

    if-nez v5, :cond_1

    .line 440
    new-instance v3, Lorg/cybergarage/xml/Node;

    const-string v5, "root"

    invoke-direct {v3, v5}, Lorg/cybergarage/xml/Node;-><init>(Ljava/lang/String;)V

    .line 441
    .local v3, "root":Lorg/cybergarage/xml/Node;
    const-string v5, ""

    const-string v6, "urn:schemas-upnp-org:device-1-0"

    invoke-virtual {v3, v5, v6}, Lorg/cybergarage/xml/Node;->setNameSpace(Ljava/lang/String;Ljava/lang/String;)V

    .line 442
    new-instance v4, Lorg/cybergarage/xml/Node;

    const-string v5, "specVersion"

    invoke-direct {v4, v5}, Lorg/cybergarage/xml/Node;-><init>(Ljava/lang/String;)V

    .line 443
    .local v4, "spec":Lorg/cybergarage/xml/Node;
    new-instance v1, Lorg/cybergarage/xml/Node;

    const-string v5, "major"

    invoke-direct {v1, v5}, Lorg/cybergarage/xml/Node;-><init>(Ljava/lang/String;)V

    .line 444
    .local v1, "maj":Lorg/cybergarage/xml/Node;
    const-string v5, "1"

    invoke-virtual {v1, v5}, Lorg/cybergarage/xml/Node;->setValue(Ljava/lang/String;)V

    .line 445
    new-instance v2, Lorg/cybergarage/xml/Node;

    const-string v5, "minor"

    invoke-direct {v2, v5}, Lorg/cybergarage/xml/Node;-><init>(Ljava/lang/String;)V

    .line 446
    .local v2, "min":Lorg/cybergarage/xml/Node;
    const-string v5, "0"

    invoke-virtual {v2, v5}, Lorg/cybergarage/xml/Node;->setValue(Ljava/lang/String;)V

    .line 447
    invoke-virtual {v4, v1}, Lorg/cybergarage/xml/Node;->addNode(Lorg/cybergarage/xml/Node;)V

    .line 448
    invoke-virtual {v4, v2}, Lorg/cybergarage/xml/Node;->addNode(Lorg/cybergarage/xml/Node;)V

    .line 449
    invoke-virtual {v3, v4}, Lorg/cybergarage/xml/Node;->addNode(Lorg/cybergarage/xml/Node;)V

    .line 450
    invoke-virtual {p0, v3}, Lorg/cybergarage/upnp/Device;->setRootNode(Lorg/cybergarage/xml/Node;)V

    .line 452
    .end local v1    # "maj":Lorg/cybergarage/xml/Node;
    .end local v2    # "min":Lorg/cybergarage/xml/Node;
    .end local v3    # "root":Lorg/cybergarage/xml/Node;
    .end local v4    # "spec":Lorg/cybergarage/xml/Node;
    :cond_1
    return-void
.end method

.method public addService(Lorg/cybergarage/upnp/Service;)V
    .locals 3
    .param p1, "s"    # Lorg/cybergarage/upnp/Service;

    .prologue
    .line 412
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceNode()Lorg/cybergarage/xml/Node;

    move-result-object v1

    const-string v2, "serviceList"

    invoke-virtual {v1, v2}, Lorg/cybergarage/xml/Node;->getNode(Ljava/lang/String;)Lorg/cybergarage/xml/Node;

    move-result-object v0

    .line 413
    .local v0, "serviceListNode":Lorg/cybergarage/xml/Node;
    if-nez v0, :cond_0

    .line 414
    new-instance v0, Lorg/cybergarage/xml/Node;

    .end local v0    # "serviceListNode":Lorg/cybergarage/xml/Node;
    const-string v1, "serviceList"

    invoke-direct {v0, v1}, Lorg/cybergarage/xml/Node;-><init>(Ljava/lang/String;)V

    .line 415
    .restart local v0    # "serviceListNode":Lorg/cybergarage/xml/Node;
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceNode()Lorg/cybergarage/xml/Node;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/cybergarage/xml/Node;->addNode(Lorg/cybergarage/xml/Node;)V

    .line 417
    :cond_0
    invoke-virtual {p1}, Lorg/cybergarage/upnp/Service;->getServiceNode()Lorg/cybergarage/xml/Node;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/cybergarage/xml/Node;->addNode(Lorg/cybergarage/xml/Node;)V

    .line 418
    return-void
.end method

.method public announce()V
    .locals 8

    .prologue
    .line 1489
    invoke-static {}, Lorg/cybergarage/upnp/Device;->notifyWait()V

    .line 1490
    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->getDeviceData()Lorg/cybergarage/upnp/xml/DeviceData;

    move-result-object v7

    invoke-virtual {v7}, Lorg/cybergarage/upnp/xml/DeviceData;->getHTTPBindAddress()[Ljava/net/InetAddress;

    move-result-object v1

    .line 1492
    .local v1, "binds":[Ljava/net/InetAddress;
    if-eqz v1, :cond_0

    .line 1493
    array-length v7, v1

    new-array v0, v7, [Ljava/lang/String;

    .line 1494
    .local v0, "bindAddresses":[Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v7, v1

    if-ge v2, v7, :cond_1

    .line 1495
    aget-object v7, v1, v2

    invoke-virtual {v7}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v0, v2

    .line 1494
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1498
    .end local v0    # "bindAddresses":[Ljava/lang/String;
    .end local v2    # "i":I
    :cond_0
    invoke-static {}, Lorg/cybergarage/net/HostInterface;->getNHostAddresses()I

    move-result v5

    .line 1499
    .local v5, "nHostAddrs":I
    new-array v0, v5, [Ljava/lang/String;

    .line 1500
    .restart local v0    # "bindAddresses":[Ljava/lang/String;
    const/4 v4, 0x0

    .local v4, "n":I
    :goto_1
    if-ge v4, v5, :cond_1

    .line 1501
    invoke-static {v4}, Lorg/cybergarage/net/HostInterface;->getHostAddress(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v0, v4

    .line 1500
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 1504
    .end local v4    # "n":I
    .end local v5    # "nHostAddrs":I
    :cond_1
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_2
    array-length v7, v0

    if-ge v3, v7, :cond_4

    .line 1505
    aget-object v7, v0, v3

    if-eqz v7, :cond_2

    aget-object v7, v0, v3

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    if-nez v7, :cond_3

    .line 1504
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 1507
    :cond_3
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getSSDPAnnounceCount()I

    move-result v6

    .line 1508
    .local v6, "ssdpCount":I
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_3
    if-ge v2, v6, :cond_2

    .line 1509
    aget-object v7, v0, v3

    invoke-virtual {p0, v7}, Lorg/cybergarage/upnp/Device;->announce(Ljava/lang/String;)V

    .line 1508
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 1512
    .end local v2    # "i":I
    .end local v6    # "ssdpCount":I
    :cond_4
    return-void
.end method

.method public announce(Ljava/lang/String;)V
    .locals 16
    .param p1, "bindAddr"    # Ljava/lang/String;

    .prologue
    .line 1439
    invoke-virtual/range {p0 .. p1}, Lorg/cybergarage/upnp/Device;->getLocationURL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1441
    .local v4, "devLocation":Ljava/lang/String;
    new-instance v13, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;

    move-object/from16 v0, p1

    invoke-direct {v13, v0}, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;-><init>(Ljava/lang/String;)V

    .line 1443
    .local v13, "ssdpSock":Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;
    new-instance v12, Lorg/cybergarage/upnp/ssdp/SSDPNotifyRequest;

    invoke-direct {v12}, Lorg/cybergarage/upnp/ssdp/SSDPNotifyRequest;-><init>()V

    .line 1444
    .local v12, "ssdpReq":Lorg/cybergarage/upnp/ssdp/SSDPNotifyRequest;
    invoke-static {}, Lorg/cybergarage/upnp/UPnP;->getServerName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12, v14}, Lorg/cybergarage/upnp/ssdp/SSDPNotifyRequest;->setServer(Ljava/lang/String;)V

    .line 1445
    invoke-virtual/range {p0 .. p0}, Lorg/cybergarage/upnp/Device;->getLeaseTime()I

    move-result v14

    invoke-virtual {v12, v14}, Lorg/cybergarage/upnp/ssdp/SSDPNotifyRequest;->setLeaseTime(I)V

    .line 1446
    invoke-virtual {v12, v4}, Lorg/cybergarage/upnp/ssdp/SSDPNotifyRequest;->setLocation(Ljava/lang/String;)V

    .line 1447
    const-string v14, "ssdp:alive"

    invoke-virtual {v12, v14}, Lorg/cybergarage/upnp/ssdp/SSDPNotifyRequest;->setNTS(Ljava/lang/String;)V

    .line 1450
    invoke-virtual/range {p0 .. p0}, Lorg/cybergarage/upnp/Device;->isRootDevice()Z

    move-result v14

    const/4 v15, 0x1

    if-ne v14, v15, :cond_0

    .line 1451
    invoke-direct/range {p0 .. p0}, Lorg/cybergarage/upnp/Device;->getNotifyDeviceNT()Ljava/lang/String;

    move-result-object v5

    .line 1452
    .local v5, "devNT":Ljava/lang/String;
    invoke-direct/range {p0 .. p0}, Lorg/cybergarage/upnp/Device;->getNotifyDeviceUSN()Ljava/lang/String;

    move-result-object v7

    .line 1453
    .local v7, "devUSN":Ljava/lang/String;
    invoke-virtual {v12, v5}, Lorg/cybergarage/upnp/ssdp/SSDPNotifyRequest;->setNT(Ljava/lang/String;)V

    .line 1454
    invoke-virtual {v12, v7}, Lorg/cybergarage/upnp/ssdp/SSDPNotifyRequest;->setUSN(Ljava/lang/String;)V

    .line 1455
    invoke-virtual {v13, v12}, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;->post(Lorg/cybergarage/upnp/ssdp/SSDPNotifyRequest;)Z

    .line 1457
    invoke-virtual/range {p0 .. p0}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v6

    .line 1458
    .local v6, "devUDN":Ljava/lang/String;
    invoke-virtual {v12, v6}, Lorg/cybergarage/upnp/ssdp/SSDPNotifyRequest;->setNT(Ljava/lang/String;)V

    .line 1459
    invoke-virtual {v12, v6}, Lorg/cybergarage/upnp/ssdp/SSDPNotifyRequest;->setUSN(Ljava/lang/String;)V

    .line 1460
    invoke-virtual {v13, v12}, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;->post(Lorg/cybergarage/upnp/ssdp/SSDPNotifyRequest;)Z

    .line 1464
    .end local v5    # "devNT":Ljava/lang/String;
    .end local v6    # "devUDN":Ljava/lang/String;
    .end local v7    # "devUSN":Ljava/lang/String;
    :cond_0
    invoke-direct/range {p0 .. p0}, Lorg/cybergarage/upnp/Device;->getNotifyDeviceTypeNT()Ljava/lang/String;

    move-result-object v5

    .line 1465
    .restart local v5    # "devNT":Ljava/lang/String;
    invoke-direct/range {p0 .. p0}, Lorg/cybergarage/upnp/Device;->getNotifyDeviceTypeUSN()Ljava/lang/String;

    move-result-object v7

    .line 1466
    .restart local v7    # "devUSN":Ljava/lang/String;
    invoke-virtual {v12, v5}, Lorg/cybergarage/upnp/ssdp/SSDPNotifyRequest;->setNT(Ljava/lang/String;)V

    .line 1467
    invoke-virtual {v12, v7}, Lorg/cybergarage/upnp/ssdp/SSDPNotifyRequest;->setUSN(Ljava/lang/String;)V

    .line 1468
    invoke-virtual {v13, v12}, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;->post(Lorg/cybergarage/upnp/ssdp/SSDPNotifyRequest;)Z

    .line 1471
    invoke-virtual {v13}, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;->close()Z

    .line 1473
    invoke-virtual/range {p0 .. p0}, Lorg/cybergarage/upnp/Device;->getServiceList()Lorg/cybergarage/upnp/ServiceList;

    move-result-object v11

    .line 1474
    .local v11, "serviceList":Lorg/cybergarage/upnp/ServiceList;
    invoke-virtual {v11}, Lorg/cybergarage/upnp/ServiceList;->size()I

    move-result v10

    .line 1475
    .local v10, "serviceCnt":I
    const/4 v8, 0x0

    .local v8, "n":I
    :goto_0
    if-ge v8, v10, :cond_1

    .line 1476
    invoke-virtual {v11, v8}, Lorg/cybergarage/upnp/ServiceList;->getService(I)Lorg/cybergarage/upnp/Service;

    move-result-object v9

    .line 1477
    .local v9, "service":Lorg/cybergarage/upnp/Service;
    move-object/from16 v0, p1

    invoke-virtual {v9, v0}, Lorg/cybergarage/upnp/Service;->announce(Ljava/lang/String;)V

    .line 1475
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 1480
    .end local v9    # "service":Lorg/cybergarage/upnp/Service;
    :cond_1
    invoke-virtual/range {p0 .. p0}, Lorg/cybergarage/upnp/Device;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v3

    .line 1481
    .local v3, "childDeviceList":Lorg/cybergarage/upnp/DeviceList;
    invoke-virtual {v3}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v2

    .line 1482
    .local v2, "childDeviceCnt":I
    const/4 v8, 0x0

    :goto_1
    if-ge v8, v2, :cond_2

    .line 1483
    invoke-virtual {v3, v8}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v1

    .line 1484
    .local v1, "childDevice":Lorg/cybergarage/upnp/Device;
    move-object/from16 v0, p1

    invoke-virtual {v1, v0}, Lorg/cybergarage/upnp/Device;->announce(Ljava/lang/String;)V

    .line 1482
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 1486
    .end local v1    # "childDevice":Lorg/cybergarage/upnp/Device;
    :cond_2
    return-void
.end method

.method public byebye()V
    .locals 8

    .prologue
    .line 1555
    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->getDeviceData()Lorg/cybergarage/upnp/xml/DeviceData;

    move-result-object v7

    invoke-virtual {v7}, Lorg/cybergarage/upnp/xml/DeviceData;->getHTTPBindAddress()[Ljava/net/InetAddress;

    move-result-object v1

    .line 1557
    .local v1, "binds":[Ljava/net/InetAddress;
    if-eqz v1, :cond_0

    .line 1558
    array-length v7, v1

    new-array v0, v7, [Ljava/lang/String;

    .line 1559
    .local v0, "bindAddresses":[Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v7, v1

    if-ge v2, v7, :cond_1

    .line 1560
    aget-object v7, v1, v2

    invoke-virtual {v7}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v0, v2

    .line 1559
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1563
    .end local v0    # "bindAddresses":[Ljava/lang/String;
    .end local v2    # "i":I
    :cond_0
    invoke-static {}, Lorg/cybergarage/net/HostInterface;->getNHostAddresses()I

    move-result v5

    .line 1564
    .local v5, "nHostAddrs":I
    new-array v0, v5, [Ljava/lang/String;

    .line 1565
    .restart local v0    # "bindAddresses":[Ljava/lang/String;
    const/4 v4, 0x0

    .local v4, "n":I
    :goto_1
    if-ge v4, v5, :cond_1

    .line 1566
    invoke-static {v4}, Lorg/cybergarage/net/HostInterface;->getHostAddress(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v0, v4

    .line 1565
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 1570
    .end local v4    # "n":I
    .end local v5    # "nHostAddrs":I
    :cond_1
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_2
    array-length v7, v0

    if-ge v3, v7, :cond_4

    .line 1571
    aget-object v7, v0, v3

    if-eqz v7, :cond_2

    aget-object v7, v0, v3

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    if-gtz v7, :cond_3

    .line 1570
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 1573
    :cond_3
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getSSDPAnnounceCount()I

    move-result v6

    .line 1574
    .local v6, "ssdpCount":I
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_3
    if-ge v2, v6, :cond_2

    .line 1575
    aget-object v7, v0, v3

    invoke-virtual {p0, v7}, Lorg/cybergarage/upnp/Device;->byebye(Ljava/lang/String;)V

    .line 1574
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 1577
    .end local v2    # "i":I
    .end local v6    # "ssdpCount":I
    :cond_4
    return-void
.end method

.method public byebye(Ljava/lang/String;)V
    .locals 13
    .param p1, "bindAddr"    # Ljava/lang/String;

    .prologue
    .line 1515
    new-instance v10, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;

    invoke-direct {v10, p1}, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;-><init>(Ljava/lang/String;)V

    .line 1517
    .local v10, "ssdpSock":Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;
    new-instance v9, Lorg/cybergarage/upnp/ssdp/SSDPNotifyRequest;

    invoke-direct {v9}, Lorg/cybergarage/upnp/ssdp/SSDPNotifyRequest;-><init>()V

    .line 1518
    .local v9, "ssdpReq":Lorg/cybergarage/upnp/ssdp/SSDPNotifyRequest;
    const-string v11, "ssdp:byebye"

    invoke-virtual {v9, v11}, Lorg/cybergarage/upnp/ssdp/SSDPNotifyRequest;->setNTS(Ljava/lang/String;)V

    .line 1521
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->isRootDevice()Z

    move-result v11

    const/4 v12, 0x1

    if-ne v11, v12, :cond_0

    .line 1522
    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->getNotifyDeviceNT()Ljava/lang/String;

    move-result-object v3

    .line 1523
    .local v3, "devNT":Ljava/lang/String;
    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->getNotifyDeviceUSN()Ljava/lang/String;

    move-result-object v4

    .line 1524
    .local v4, "devUSN":Ljava/lang/String;
    invoke-virtual {v9, v3}, Lorg/cybergarage/upnp/ssdp/SSDPNotifyRequest;->setNT(Ljava/lang/String;)V

    .line 1525
    invoke-virtual {v9, v4}, Lorg/cybergarage/upnp/ssdp/SSDPNotifyRequest;->setUSN(Ljava/lang/String;)V

    .line 1526
    invoke-virtual {v10, v9}, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;->post(Lorg/cybergarage/upnp/ssdp/SSDPNotifyRequest;)Z

    .line 1530
    .end local v3    # "devNT":Ljava/lang/String;
    .end local v4    # "devUSN":Ljava/lang/String;
    :cond_0
    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->getNotifyDeviceTypeNT()Ljava/lang/String;

    move-result-object v3

    .line 1531
    .restart local v3    # "devNT":Ljava/lang/String;
    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->getNotifyDeviceTypeUSN()Ljava/lang/String;

    move-result-object v4

    .line 1532
    .restart local v4    # "devUSN":Ljava/lang/String;
    invoke-virtual {v9, v3}, Lorg/cybergarage/upnp/ssdp/SSDPNotifyRequest;->setNT(Ljava/lang/String;)V

    .line 1533
    invoke-virtual {v9, v4}, Lorg/cybergarage/upnp/ssdp/SSDPNotifyRequest;->setUSN(Ljava/lang/String;)V

    .line 1534
    invoke-virtual {v10, v9}, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;->post(Lorg/cybergarage/upnp/ssdp/SSDPNotifyRequest;)Z

    .line 1536
    invoke-virtual {v10}, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;->close()Z

    .line 1538
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getServiceList()Lorg/cybergarage/upnp/ServiceList;

    move-result-object v8

    .line 1539
    .local v8, "serviceList":Lorg/cybergarage/upnp/ServiceList;
    invoke-virtual {v8}, Lorg/cybergarage/upnp/ServiceList;->size()I

    move-result v7

    .line 1540
    .local v7, "serviceCnt":I
    const/4 v5, 0x0

    .local v5, "n":I
    :goto_0
    if-ge v5, v7, :cond_1

    .line 1541
    invoke-virtual {v8, v5}, Lorg/cybergarage/upnp/ServiceList;->getService(I)Lorg/cybergarage/upnp/Service;

    move-result-object v6

    .line 1542
    .local v6, "service":Lorg/cybergarage/upnp/Service;
    invoke-virtual {v6, p1}, Lorg/cybergarage/upnp/Service;->byebye(Ljava/lang/String;)V

    .line 1540
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 1545
    .end local v6    # "service":Lorg/cybergarage/upnp/Service;
    :cond_1
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v2

    .line 1546
    .local v2, "childDeviceList":Lorg/cybergarage/upnp/DeviceList;
    invoke-virtual {v2}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v1

    .line 1547
    .local v1, "childDeviceCnt":I
    const/4 v5, 0x0

    :goto_1
    if-ge v5, v1, :cond_2

    .line 1548
    invoke-virtual {v2, v5}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v0

    .line 1549
    .local v0, "childDevice":Lorg/cybergarage/upnp/Device;
    invoke-virtual {v0, p1}, Lorg/cybergarage/upnp/Device;->byebye(Ljava/lang/String;)V

    .line 1547
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 1551
    .end local v0    # "childDevice":Lorg/cybergarage/upnp/Device;
    :cond_2
    return-void
.end method

.method public deviceSearchReceived(Lorg/cybergarage/upnp/ssdp/SSDPPacket;)V
    .locals 0
    .param p1, "ssdpPacket"    # Lorg/cybergarage/upnp/ssdp/SSDPPacket;

    .prologue
    .line 1663
    invoke-virtual {p0, p1}, Lorg/cybergarage/upnp/Device;->deviceSearchResponse(Lorg/cybergarage/upnp/ssdp/SSDPPacket;)V

    .line 1664
    return-void
.end method

.method public deviceSearchResponse(Lorg/cybergarage/upnp/ssdp/SSDPPacket;)V
    .locals 19
    .param p1, "ssdpPacket"    # Lorg/cybergarage/upnp/ssdp/SSDPPacket;

    .prologue
    .line 1615
    invoke-virtual/range {p1 .. p1}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->getST()Ljava/lang/String;

    move-result-object v16

    .line 1617
    .local v16, "ssdpST":Ljava/lang/String;
    if-nez v16, :cond_1

    .line 1660
    :cond_0
    return-void

    .line 1620
    :cond_1
    invoke-virtual/range {p0 .. p0}, Lorg/cybergarage/upnp/Device;->isRootDevice()Z

    move-result v10

    .line 1622
    .local v10, "isRootDevice":Z
    invoke-virtual/range {p0 .. p0}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v9

    .line 1623
    .local v9, "devUSN":Ljava/lang/String;
    const/16 v17, 0x1

    move/from16 v0, v17

    if-ne v10, v0, :cond_2

    .line 1624
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v17

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, "::upnp:rootdevice"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 1626
    :cond_2
    invoke-static/range {v16 .. v16}, Lorg/cybergarage/upnp/device/ST;->isAllDevice(Ljava/lang/String;)Z

    move-result v17

    const/16 v18, 0x1

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_4

    .line 1627
    invoke-direct/range {p0 .. p0}, Lorg/cybergarage/upnp/Device;->getNotifyDeviceNT()Ljava/lang/String;

    move-result-object v6

    .line 1628
    .local v6, "devNT":Ljava/lang/String;
    const/16 v17, 0x1

    move/from16 v0, v17

    if-ne v10, v0, :cond_3

    const/4 v12, 0x3

    .line 1629
    .local v12, "repeatCnt":I
    :goto_0
    const/4 v11, 0x0

    .local v11, "n":I
    :goto_1
    if-ge v11, v12, :cond_5

    .line 1630
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v6, v9}, Lorg/cybergarage/upnp/Device;->postSearchResponse(Lorg/cybergarage/upnp/ssdp/SSDPPacket;Ljava/lang/String;Ljava/lang/String;)Z

    .line 1629
    add-int/lit8 v11, v11, 0x1

    goto :goto_1

    .line 1628
    .end local v11    # "n":I
    .end local v12    # "repeatCnt":I
    :cond_3
    const/4 v12, 0x2

    goto :goto_0

    .line 1631
    .end local v6    # "devNT":Ljava/lang/String;
    :cond_4
    invoke-static/range {v16 .. v16}, Lorg/cybergarage/upnp/device/ST;->isRootDevice(Ljava/lang/String;)Z

    move-result v17

    const/16 v18, 0x1

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_6

    .line 1632
    const/16 v17, 0x1

    move/from16 v0, v17

    if-ne v10, v0, :cond_5

    .line 1633
    const-string v17, "urn:Belkin:service:basicevent:1"

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v17

    invoke-virtual {v0, v1, v2, v9}, Lorg/cybergarage/upnp/Device;->postSearchResponse(Lorg/cybergarage/upnp/ssdp/SSDPPacket;Ljava/lang/String;Ljava/lang/String;)Z

    .line 1647
    :cond_5
    :goto_2
    invoke-virtual/range {p0 .. p0}, Lorg/cybergarage/upnp/Device;->getServiceList()Lorg/cybergarage/upnp/ServiceList;

    move-result-object v15

    .line 1648
    .local v15, "serviceList":Lorg/cybergarage/upnp/ServiceList;
    invoke-virtual {v15}, Lorg/cybergarage/upnp/ServiceList;->size()I

    move-result v14

    .line 1649
    .local v14, "serviceCnt":I
    const/4 v11, 0x0

    .restart local v11    # "n":I
    :goto_3
    if-ge v11, v14, :cond_8

    .line 1650
    invoke-virtual {v15, v11}, Lorg/cybergarage/upnp/ServiceList;->getService(I)Lorg/cybergarage/upnp/Service;

    move-result-object v13

    .line 1651
    .local v13, "service":Lorg/cybergarage/upnp/Service;
    move-object/from16 v0, p1

    invoke-virtual {v13, v0}, Lorg/cybergarage/upnp/Service;->serviceSearchResponse(Lorg/cybergarage/upnp/ssdp/SSDPPacket;)Z

    .line 1649
    add-int/lit8 v11, v11, 0x1

    goto :goto_3

    .line 1634
    .end local v11    # "n":I
    .end local v13    # "service":Lorg/cybergarage/upnp/Service;
    .end local v14    # "serviceCnt":I
    .end local v15    # "serviceList":Lorg/cybergarage/upnp/ServiceList;
    :cond_6
    invoke-static/range {v16 .. v16}, Lorg/cybergarage/upnp/device/ST;->isUUIDDevice(Ljava/lang/String;)Z

    move-result v17

    const/16 v18, 0x1

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_7

    .line 1635
    invoke-virtual/range {p0 .. p0}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v8

    .line 1636
    .local v8, "devUDN":Ljava/lang/String;
    move-object/from16 v0, v16

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    const/16 v18, 0x1

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_5

    .line 1637
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v8, v9}, Lorg/cybergarage/upnp/Device;->postSearchResponse(Lorg/cybergarage/upnp/ssdp/SSDPPacket;Ljava/lang/String;Ljava/lang/String;)Z

    goto :goto_2

    .line 1638
    .end local v8    # "devUDN":Ljava/lang/String;
    :cond_7
    invoke-static/range {v16 .. v16}, Lorg/cybergarage/upnp/device/ST;->isURNDevice(Ljava/lang/String;)Z

    move-result v17

    const/16 v18, 0x1

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_5

    .line 1639
    invoke-virtual/range {p0 .. p0}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v7

    .line 1640
    .local v7, "devType":Ljava/lang/String;
    move-object/from16 v0, v16

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    const/16 v18, 0x1

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_5

    .line 1642
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {p0 .. p0}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, "::"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 1643
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v7, v9}, Lorg/cybergarage/upnp/Device;->postSearchResponse(Lorg/cybergarage/upnp/ssdp/SSDPPacket;Ljava/lang/String;Ljava/lang/String;)Z

    goto :goto_2

    .line 1654
    .end local v7    # "devType":Ljava/lang/String;
    .restart local v11    # "n":I
    .restart local v14    # "serviceCnt":I
    .restart local v15    # "serviceList":Lorg/cybergarage/upnp/ServiceList;
    :cond_8
    invoke-virtual/range {p0 .. p0}, Lorg/cybergarage/upnp/Device;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v5

    .line 1655
    .local v5, "childDeviceList":Lorg/cybergarage/upnp/DeviceList;
    invoke-virtual {v5}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v4

    .line 1656
    .local v4, "childDeviceCnt":I
    const/4 v11, 0x0

    :goto_4
    if-ge v11, v4, :cond_0

    .line 1657
    invoke-virtual {v5, v11}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v3

    .line 1658
    .local v3, "childDevice":Lorg/cybergarage/upnp/Device;
    move-object/from16 v0, p1

    invoke-virtual {v3, v0}, Lorg/cybergarage/upnp/Device;->deviceSearchResponse(Lorg/cybergarage/upnp/ssdp/SSDPPacket;)V

    .line 1656
    add-int/lit8 v11, v11, 0x1

    goto :goto_4
.end method

.method public getAbsoluteURL(Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p1, "urlString"    # Ljava/lang/String;

    .prologue
    .line 276
    :try_start_0
    new-instance v5, Ljava/net/URL;

    invoke-direct {v5, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 277
    .local v5, "url":Ljava/net/URL;
    invoke-virtual {v5}, Ljava/net/URL;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v7

    .line 307
    .end local v5    # "url":Ljava/net/URL;
    :goto_0
    return-object v7

    .line 278
    :catch_0
    move-exception v7

    .line 281
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getRootDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v4

    .line 282
    .local v4, "rootDev":Lorg/cybergarage/upnp/Device;
    invoke-virtual {v4}, Lorg/cybergarage/upnp/Device;->getURLBase()Ljava/lang/String;

    move-result-object v6

    .line 285
    .local v6, "urlBaseStr":Ljava/lang/String;
    if-eqz v6, :cond_0

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v7

    if-gtz v7, :cond_1

    .line 286
    :cond_0
    invoke-virtual {v4}, Lorg/cybergarage/upnp/Device;->getLocation()Ljava/lang/String;

    move-result-object v1

    .line 287
    .local v1, "location":Ljava/lang/String;
    invoke-static {v1}, Lorg/cybergarage/http/HTTP;->getHost(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 288
    .local v2, "locationHost":Ljava/lang/String;
    invoke-static {v1}, Lorg/cybergarage/http/HTTP;->getPort(Ljava/lang/String;)I

    move-result v3

    .line 289
    .local v3, "locationPort":I
    invoke-static {v2, v3}, Lorg/cybergarage/http/HTTP;->getRequestHostURL(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v6

    .line 292
    .end local v1    # "location":Ljava/lang/String;
    .end local v2    # "locationHost":Ljava/lang/String;
    .end local v3    # "locationPort":I
    :cond_1
    invoke-static {p1}, Lorg/cybergarage/http/HTTP;->toRelativeURL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 293
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 295
    .local v0, "absUrl":Ljava/lang/String;
    :try_start_1
    new-instance v5, Ljava/net/URL;

    invoke-direct {v5, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 296
    .restart local v5    # "url":Ljava/net/URL;
    invoke-virtual {v5}, Ljava/net/URL;->toString()Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v7

    goto :goto_0

    .line 297
    .end local v5    # "url":Ljava/net/URL;
    :catch_1
    move-exception v7

    .line 300
    invoke-static {v6, p1}, Lorg/cybergarage/http/HTTP;->getAbsoluteURL(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 302
    :try_start_2
    new-instance v5, Ljava/net/URL;

    invoke-direct {v5, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 303
    .restart local v5    # "url":Ljava/net/URL;
    invoke-virtual {v5}, Ljava/net/URL;->toString()Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    move-result-object v7

    goto :goto_0

    .line 304
    .end local v5    # "url":Ljava/net/URL;
    :catch_2
    move-exception v7

    .line 307
    const-string v7, ""

    goto :goto_0
.end method

.method public getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;
    .locals 14
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 1333
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getServiceList()Lorg/cybergarage/upnp/ServiceList;

    move-result-object v11

    .line 1334
    .local v11, "serviceList":Lorg/cybergarage/upnp/ServiceList;
    invoke-virtual {v11}, Lorg/cybergarage/upnp/ServiceList;->size()I

    move-result v10

    .line 1335
    .local v10, "serviceCnt":I
    const/4 v8, 0x0

    .local v8, "n":I
    :goto_0
    if-ge v8, v10, :cond_4

    .line 1336
    invoke-virtual {v11, v8}, Lorg/cybergarage/upnp/ServiceList;->getService(I)Lorg/cybergarage/upnp/Service;

    move-result-object v9

    .line 1337
    .local v9, "service":Lorg/cybergarage/upnp/Service;
    invoke-virtual {v9}, Lorg/cybergarage/upnp/Service;->getActionList()Lorg/cybergarage/upnp/ActionList;

    move-result-object v2

    .line 1338
    .local v2, "actionList":Lorg/cybergarage/upnp/ActionList;
    invoke-virtual {v2}, Lorg/cybergarage/upnp/ActionList;->size()I

    move-result v1

    .line 1339
    .local v1, "actionCnt":I
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_1
    if-ge v7, v1, :cond_3

    .line 1340
    invoke-virtual {v2, v7}, Lorg/cybergarage/upnp/ActionList;->getAction(I)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 1341
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->getName()Ljava/lang/String;

    move-result-object v3

    .line 1342
    .local v3, "actionName":Ljava/lang/String;
    if-nez v3, :cond_1

    .line 1339
    :cond_0
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 1344
    :cond_1
    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    const/4 v13, 0x1

    if-ne v12, v13, :cond_0

    .line 1358
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "actionCnt":I
    .end local v2    # "actionList":Lorg/cybergarage/upnp/ActionList;
    .end local v3    # "actionName":Ljava/lang/String;
    .end local v7    # "i":I
    .end local v9    # "service":Lorg/cybergarage/upnp/Service;
    :cond_2
    :goto_2
    return-object v0

    .line 1335
    .restart local v1    # "actionCnt":I
    .restart local v2    # "actionList":Lorg/cybergarage/upnp/ActionList;
    .restart local v7    # "i":I
    .restart local v9    # "service":Lorg/cybergarage/upnp/Service;
    :cond_3
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 1349
    .end local v1    # "actionCnt":I
    .end local v2    # "actionList":Lorg/cybergarage/upnp/ActionList;
    .end local v7    # "i":I
    .end local v9    # "service":Lorg/cybergarage/upnp/Service;
    :cond_4
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v6

    .line 1350
    .local v6, "devList":Lorg/cybergarage/upnp/DeviceList;
    invoke-virtual {v6}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v5

    .line 1351
    .local v5, "devCnt":I
    const/4 v8, 0x0

    :goto_3
    if-ge v8, v5, :cond_5

    .line 1352
    invoke-virtual {v6, v8}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v4

    .line 1353
    .local v4, "dev":Lorg/cybergarage/upnp/Device;
    invoke-virtual {v4, p1}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 1354
    .restart local v0    # "action":Lorg/cybergarage/upnp/Action;
    if-nez v0, :cond_2

    .line 1351
    add-int/lit8 v8, v8, 0x1

    goto :goto_3

    .line 1358
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v4    # "dev":Lorg/cybergarage/upnp/Device;
    :cond_5
    const/4 v0, 0x0

    goto :goto_2
.end method

.method public getAttributeList()Lorg/json/JSONObject;
    .locals 1

    .prologue
    .line 2263
    iget-object v0, p0, Lorg/cybergarage/upnp/Device;->attributeListJSON:Lorg/json/JSONObject;

    return-object v0
.end method

.method public getAttributeListParameterFromDevice()Lorg/json/JSONObject;
    .locals 6

    .prologue
    .line 2244
    const/4 v2, 0x0

    .line 2246
    .local v2, "jsonObject":Lorg/json/JSONObject;
    :try_start_0
    const-string v5, "GetAttributeList"

    invoke-virtual {p0, v5}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 2247
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    if-eqz v0, :cond_1

    .line 2248
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v4

    .line 2249
    .local v4, "response":Ljava/lang/String;
    if-nez v4, :cond_0

    move-object v3, v2

    .line 2260
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v2    # "jsonObject":Lorg/json/JSONObject;
    .end local v4    # "response":Ljava/lang/String;
    .local v3, "jsonObject":Lorg/json/JSONObject;
    :goto_0
    return-object v3

    .line 2252
    .end local v3    # "jsonObject":Lorg/json/JSONObject;
    .restart local v0    # "action":Lorg/cybergarage/upnp/Action;
    .restart local v2    # "jsonObject":Lorg/json/JSONObject;
    .restart local v4    # "response":Ljava/lang/String;
    :cond_0
    new-instance v5, Lcom/belkin/wemo/localsdk/parser/GetAttributeListResponseParser;

    invoke-direct {v5}, Lcom/belkin/wemo/localsdk/parser/GetAttributeListResponseParser;-><init>()V

    invoke-virtual {v5, v4}, Lcom/belkin/wemo/localsdk/parser/GetAttributeListResponseParser;->parseGetAttributeListResponse(Ljava/lang/String;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    move-object v3, v2

    .line 2253
    .end local v2    # "jsonObject":Lorg/json/JSONObject;
    .restart local v3    # "jsonObject":Lorg/json/JSONObject;
    goto :goto_0

    .line 2256
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v3    # "jsonObject":Lorg/json/JSONObject;
    .end local v4    # "response":Ljava/lang/String;
    .restart local v2    # "jsonObject":Lorg/json/JSONObject;
    :catch_0
    move-exception v1

    .line 2257
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 2259
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_1
    iput-object v2, p0, Lorg/cybergarage/upnp/Device;->attributeListJSON:Lorg/json/JSONObject;

    move-object v3, v2

    .line 2260
    .end local v2    # "jsonObject":Lorg/json/JSONObject;
    .restart local v3    # "jsonObject":Lorg/json/JSONObject;
    goto :goto_0
.end method

.method public getAttributetParameterFromDevice()Lorg/json/JSONObject;
    .locals 6

    .prologue
    .line 2266
    const/4 v2, 0x0

    .line 2268
    .local v2, "jsonObject":Lorg/json/JSONObject;
    :try_start_0
    const-string v5, "GetAttributes"

    invoke-virtual {p0, v5}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 2269
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v4

    .line 2270
    .local v4, "response":Ljava/lang/String;
    if-nez v4, :cond_0

    move-object v3, v2

    .line 2279
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v2    # "jsonObject":Lorg/json/JSONObject;
    .end local v4    # "response":Ljava/lang/String;
    .local v3, "jsonObject":Lorg/json/JSONObject;
    :goto_0
    return-object v3

    .line 2273
    .end local v3    # "jsonObject":Lorg/json/JSONObject;
    .restart local v0    # "action":Lorg/cybergarage/upnp/Action;
    .restart local v2    # "jsonObject":Lorg/json/JSONObject;
    .restart local v4    # "response":Ljava/lang/String;
    :cond_0
    new-instance v5, Lcom/belkin/wemo/localsdk/parser/GetAttributeResponseParser;

    invoke-direct {v5}, Lcom/belkin/wemo/localsdk/parser/GetAttributeResponseParser;-><init>()V

    invoke-virtual {v5, v4}, Lcom/belkin/wemo/localsdk/parser/GetAttributeResponseParser;->parseGetAttributeResponse(Ljava/lang/String;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    move-object v3, v2

    .line 2274
    .end local v2    # "jsonObject":Lorg/json/JSONObject;
    .restart local v3    # "jsonObject":Lorg/json/JSONObject;
    goto :goto_0

    .line 2276
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v3    # "jsonObject":Lorg/json/JSONObject;
    .end local v4    # "response":Ljava/lang/String;
    .restart local v2    # "jsonObject":Lorg/json/JSONObject;
    :catch_0
    move-exception v1

    .line 2277
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    move-object v3, v2

    .line 2279
    .end local v2    # "jsonObject":Lorg/json/JSONObject;
    .restart local v3    # "jsonObject":Lorg/json/JSONObject;
    goto :goto_0
.end method

.method public getAttriuteListFromDevice()Lorg/json/JSONObject;
    .locals 3

    .prologue
    .line 2237
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getAttributeListParameterFromDevice()Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getAttributetParameterFromDevice()Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lorg/cybergarage/upnp/Device;->updateAttributesList(Lorg/json/JSONObject;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v0

    .line 2238
    .local v0, "updateAttributeList":Lorg/json/JSONObject;
    return-object v0
.end method

.method public getBinaryStateFromDevice()Ljava/lang/String;
    .locals 1

    .prologue
    .line 776
    const-string v0, "GetBinaryState"

    invoke-direct {p0, v0}, Lorg/cybergarage/upnp/Device;->getParameterFromDevice(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getBlobStorageFromDevice()Ljava/lang/String;
    .locals 6

    .prologue
    .line 2318
    const/4 v4, 0x1

    new-array v1, v4, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "Sensor"

    aput-object v5, v1, v4

    .line 2319
    .local v1, "ar":[Ljava/lang/String;
    const-string v4, "GetBlobStorage"

    invoke-virtual {p0, v4}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 2320
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    sget-object v4, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->GET_BLOB_STORAGE_DATA:[Ljava/lang/String;

    invoke-direct {p0, v0, v4, v1}, Lorg/cybergarage/upnp/Device;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 2321
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v2

    .line 2322
    .local v2, "response":Ljava/lang/String;
    new-instance v4, Lcom/belkin/wemo/localsdk/parser/GetBlobStorageParser;

    invoke-direct {v4}, Lcom/belkin/wemo/localsdk/parser/GetBlobStorageParser;-><init>()V

    invoke-virtual {v4, v2}, Lcom/belkin/wemo/localsdk/parser/GetBlobStorageParser;->parseGetBlobStorageRespone(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 2323
    .local v3, "sensorState":Ljava/lang/String;
    return-object v3
.end method

.method public getBrandName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 864
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    const-string v1, "brandName"

    invoke-virtual {v0, v1}, Lorg/cybergarage/xml/Node;->getNodeValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getConfigureState()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1011
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    const-string v1, "CONFIGURE_STATE"

    invoke-virtual {v0, v1}, Lorg/cybergarage/xml/Node;->getNodeValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCustomizedInformationFromDevice()Ljava/util/Map;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 2347
    const-string v3, "GetInformation"

    invoke-direct {p0, v3}, Lorg/cybergarage/upnp/Device;->getParameterFromDevice(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 2348
    .local v1, "info":Ljava/lang/String;
    const-string v3, "WeMoSDK"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "getCustomizedInformationFromDevice info: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " location: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getLocation()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2350
    if-eqz v1, :cond_0

    const-string v3, ""

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 2351
    :cond_0
    const/4 v3, 0x0

    .line 2363
    :goto_0
    return-object v3

    .line 2354
    :cond_1
    const-string v3, "&lt;"

    const-string v4, "<"

    invoke-virtual {v1, v3, v4}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 2355
    const-string v3, "&gt;"

    const-string v4, ">"

    invoke-virtual {v1, v3, v4}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 2356
    new-instance v2, Lcom/belkin/wemo/localsdk/parser/CustomizedDeviceInfoParser;

    invoke-direct {v2}, Lcom/belkin/wemo/localsdk/parser/CustomizedDeviceInfoParser;-><init>()V

    .line 2358
    .local v2, "parser":Lcom/belkin/wemo/localsdk/parser/CustomizedDeviceInfoParser;
    :try_start_0
    invoke-static {v1, v2}, Landroid/util/Xml;->parse(Ljava/lang/String;Lorg/xml/sax/ContentHandler;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2363
    :goto_1
    invoke-virtual {v2}, Lcom/belkin/wemo/localsdk/parser/CustomizedDeviceInfoParser;->getCustomizedDeviceInfoArray()Ljava/util/Map;

    move-result-object v3

    goto :goto_0

    .line 2359
    :catch_0
    move-exception v0

    .line 2360
    .local v0, "e":Ljava/lang/Exception;
    const-string v3, "WeMoSDK"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "getCustomizedInformationFromDevice Exception: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " info: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method public getDescriptionFile()Ljava/io/File;
    .locals 1

    .prologue
    .line 479
    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->getDeviceData()Lorg/cybergarage/upnp/xml/DeviceData;

    move-result-object v0

    invoke-virtual {v0}, Lorg/cybergarage/upnp/xml/DeviceData;->getDescriptionFile()Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public getDescriptionFilePath()Ljava/lang/String;
    .locals 2

    .prologue
    .line 498
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDescriptionFile()Ljava/io/File;

    move-result-object v0

    .line 499
    .local v0, "descriptionFile":Ljava/io/File;
    if-nez v0, :cond_0

    .line 500
    const-string v1, ""

    .line 501
    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;
    .locals 7
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 1088
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v3

    .line 1089
    .local v3, "devList":Lorg/cybergarage/upnp/DeviceList;
    invoke-virtual {v3}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v2

    .line 1090
    .local v2, "devCnt":I
    const/4 v4, 0x0

    .local v4, "n":I
    :goto_0
    if-ge v4, v2, :cond_2

    .line 1091
    invoke-virtual {v3, v4}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v1

    .line 1092
    .local v1, "dev":Lorg/cybergarage/upnp/Device;
    invoke-virtual {v1, p1}, Lorg/cybergarage/upnp/Device;->isDevice(Ljava/lang/String;)Z

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v6, :cond_0

    .line 1098
    .end local v1    # "dev":Lorg/cybergarage/upnp/Device;
    :goto_1
    return-object v1

    .line 1094
    .restart local v1    # "dev":Lorg/cybergarage/upnp/Device;
    :cond_0
    invoke-virtual {v1, p1}, Lorg/cybergarage/upnp/Device;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v0

    .line 1095
    .local v0, "cdev":Lorg/cybergarage/upnp/Device;
    if-eqz v0, :cond_1

    move-object v1, v0

    .line 1096
    goto :goto_1

    .line 1090
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 1098
    .end local v0    # "cdev":Lorg/cybergarage/upnp/Device;
    .end local v1    # "dev":Lorg/cybergarage/upnp/Device;
    :cond_2
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public getDeviceByDescriptionURI(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;
    .locals 7
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 1102
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v3

    .line 1103
    .local v3, "devList":Lorg/cybergarage/upnp/DeviceList;
    invoke-virtual {v3}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v2

    .line 1104
    .local v2, "devCnt":I
    const/4 v4, 0x0

    .local v4, "n":I
    :goto_0
    if-ge v4, v2, :cond_2

    .line 1105
    invoke-virtual {v3, v4}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v1

    .line 1106
    .local v1, "dev":Lorg/cybergarage/upnp/Device;
    invoke-direct {v1, p1}, Lorg/cybergarage/upnp/Device;->isDescriptionURI(Ljava/lang/String;)Z

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v6, :cond_0

    .line 1112
    .end local v1    # "dev":Lorg/cybergarage/upnp/Device;
    :goto_1
    return-object v1

    .line 1108
    .restart local v1    # "dev":Lorg/cybergarage/upnp/Device;
    :cond_0
    invoke-virtual {v1, p1}, Lorg/cybergarage/upnp/Device;->getDeviceByDescriptionURI(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v0

    .line 1109
    .local v0, "cdev":Lorg/cybergarage/upnp/Device;
    if-eqz v0, :cond_1

    move-object v1, v0

    .line 1110
    goto :goto_1

    .line 1104
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 1112
    .end local v0    # "cdev":Lorg/cybergarage/upnp/Device;
    .end local v1    # "dev":Lorg/cybergarage/upnp/Device;
    :cond_2
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public getDeviceInformationFromDevice()[Ljava/lang/String;
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 751
    :try_start_0
    const-string v2, "GetDeviceInformation"

    invoke-direct {p0, v2}, Lorg/cybergarage/upnp/Device;->getParameterFromDevice(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 752
    .local v0, "info":Ljava/lang/String;
    const-string v2, ""

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 756
    .end local v0    # "info":Ljava/lang/String;
    :goto_0
    return-object v1

    .line 752
    .restart local v0    # "info":Ljava/lang/String;
    :cond_0
    const-string v2, "\\|"

    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto :goto_0

    .line 753
    .end local v0    # "info":Ljava/lang/String;
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public getDeviceList()Lorg/cybergarage/upnp/DeviceList;
    .locals 8

    .prologue
    .line 1060
    new-instance v1, Lorg/cybergarage/upnp/DeviceList;

    invoke-direct {v1}, Lorg/cybergarage/upnp/DeviceList;-><init>()V

    .line 1061
    .local v1, "devList":Lorg/cybergarage/upnp/DeviceList;
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceNode()Lorg/cybergarage/xml/Node;

    move-result-object v6

    const-string v7, "deviceList"

    invoke-virtual {v6, v7}, Lorg/cybergarage/xml/Node;->getNode(Ljava/lang/String;)Lorg/cybergarage/xml/Node;

    move-result-object v2

    .line 1062
    .local v2, "devListNode":Lorg/cybergarage/xml/Node;
    if-nez v2, :cond_1

    .line 1072
    :cond_0
    return-object v1

    .line 1064
    :cond_1
    invoke-virtual {v2}, Lorg/cybergarage/xml/Node;->getNNodes()I

    move-result v4

    .line 1065
    .local v4, "nNode":I
    const/4 v3, 0x0

    .local v3, "n":I
    :goto_0
    if-ge v3, v4, :cond_0

    .line 1066
    invoke-virtual {v2, v3}, Lorg/cybergarage/xml/Node;->getNode(I)Lorg/cybergarage/xml/Node;

    move-result-object v5

    .line 1067
    .local v5, "node":Lorg/cybergarage/xml/Node;
    invoke-static {v5}, Lorg/cybergarage/upnp/Device;->isDeviceNode(Lorg/cybergarage/xml/Node;)Z

    move-result v6

    if-nez v6, :cond_2

    .line 1065
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1069
    :cond_2
    new-instance v0, Lorg/cybergarage/upnp/Device;

    invoke-direct {v0, v5}, Lorg/cybergarage/upnp/Device;-><init>(Lorg/cybergarage/xml/Node;)V

    .line 1070
    .local v0, "dev":Lorg/cybergarage/upnp/Device;
    invoke-virtual {v1, v0}, Lorg/cybergarage/upnp/DeviceList;->add(Ljava/lang/Object;)Z

    goto :goto_1
.end method

.method public getDeviceNode()Lorg/cybergarage/xml/Node;
    .locals 1

    .prologue
    .line 200
    iget-object v0, p0, Lorg/cybergarage/upnp/Device;->deviceNode:Lorg/cybergarage/xml/Node;

    return-object v0
.end method

.method public getDeviceType()Ljava/lang/String;
    .locals 2

    .prologue
    .line 823
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    const-string v1, "deviceType"

    invoke-virtual {v0, v1}, Lorg/cybergarage/xml/Node;->getNodeValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getElapsedTime()J
    .locals 4

    .prologue
    .line 659
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getTimeStamp()J

    move-result-wide v2

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    return-wide v0
.end method

.method public getFirmwareVersion()Ljava/lang/String;
    .locals 2

    .prologue
    .line 709
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    const-string v1, "firmwareVersion"

    invoke-virtual {v0, v1}, Lorg/cybergarage/xml/Node;->getNodeValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFirmwareVersionFromDevice()Ljava/lang/String;
    .locals 11

    .prologue
    .line 713
    const/4 v2, 0x0

    .line 715
    .local v2, "currentFW":Ljava/lang/String;
    :try_start_0
    const-string v8, "GetFirmwareVersion"

    invoke-virtual {p0, v8}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 716
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v7

    .line 717
    .local v7, "response":Ljava/lang/String;
    if-eqz v7, :cond_0

    .line 718
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->getOutputArgumentList()Lorg/cybergarage/upnp/ArgumentList;

    move-result-object v1

    .line 719
    .local v1, "argumentList":Lorg/cybergarage/upnp/ArgumentList;
    const/4 v5, 0x0

    .local v5, "k":I
    :goto_0
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ArgumentList;->size()I

    move-result v8

    if-ge v5, v8, :cond_0

    .line 720
    invoke-virtual {v1, v5}, Lorg/cybergarage/upnp/ArgumentList;->getArgument(I)Lorg/cybergarage/upnp/Argument;

    move-result-object v8

    invoke-virtual {v8}, Lorg/cybergarage/upnp/Argument;->getValue()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v8

    const-string v9, "\\|"

    invoke-virtual {v8, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    .line 721
    .local v6, "respStrings":[Ljava/lang/String;
    const/4 v8, 0x0

    aget-object v8, v6, v8

    invoke-virtual {v8}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v8

    const-string v9, ":"

    invoke-virtual {v8, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 722
    .local v4, "firmware":[Ljava/lang/String;
    const-string v8, "WeMoSDK"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "getFirmwareVersionFromDevice >> currentFW is: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const/4 v10, 0x1

    aget-object v10, v4, v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 723
    const/4 v8, 0x1

    aget-object v2, v4, v8
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 719
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 726
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "argumentList":Lorg/cybergarage/upnp/ArgumentList;
    .end local v4    # "firmware":[Ljava/lang/String;
    .end local v5    # "k":I
    .end local v6    # "respStrings":[Ljava/lang/String;
    .end local v7    # "response":Ljava/lang/String;
    :catch_0
    move-exception v3

    .line 727
    .local v3, "e":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    .line 729
    .end local v3    # "e":Ljava/lang/Exception;
    :cond_0
    return-object v2
.end method

.method public getFriendlyName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 850
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    const-string v1, "friendlyName"

    invoke-virtual {v0, v1}, Lorg/cybergarage/xml/Node;->getNodeValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFriendlyNameFromDevice()Ljava/lang/String;
    .locals 4

    .prologue
    .line 761
    const/4 v1, 0x0

    .line 763
    .local v1, "str":Ljava/lang/String;
    :try_start_0
    const-string v2, "GetFriendlyName"

    invoke-virtual {p0, v2}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 764
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    if-eqz v0, :cond_0

    .line 765
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v1

    .line 767
    :cond_0
    const-string v2, "<FriendlyName>"

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    const-string v3, "<FriendlyName>"

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/2addr v2, v3

    const-string v3, "</FriendlyName>"

    invoke-virtual {v1, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 770
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    :goto_0
    return-object v1

    .line 768
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public getHTTPBindAddress()[Ljava/net/InetAddress;
    .locals 1

    .prologue
    .line 1683
    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->getDeviceData()Lorg/cybergarage/upnp/xml/DeviceData;

    move-result-object v0

    invoke-virtual {v0}, Lorg/cybergarage/upnp/xml/DeviceData;->getHTTPBindAddress()[Ljava/net/InetAddress;

    move-result-object v0

    return-object v0
.end method

.method public getHTTPPort()I
    .locals 1

    .prologue
    .line 1675
    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->getDeviceData()Lorg/cybergarage/upnp/xml/DeviceData;

    move-result-object v0

    invoke-virtual {v0}, Lorg/cybergarage/upnp/xml/DeviceData;->getHTTPPort()I

    move-result v0

    return v0
.end method

.method public getIPAddress()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1306
    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->getUrlBaseStr()Ljava/lang/String;

    move-result-object v0

    .line 1308
    .local v0, "urlBaseStr":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 1310
    invoke-static {v0}, Lorg/cybergarage/http/HTTP;->getHost(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1313
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getIcon(I)Lorg/cybergarage/upnp/Icon;
    .locals 2
    .param p1, "n"    # I

    .prologue
    .line 1383
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getIconList()Lorg/cybergarage/upnp/IconList;

    move-result-object v0

    .line 1384
    .local v0, "iconList":Lorg/cybergarage/upnp/IconList;
    if-gez p1, :cond_0

    invoke-virtual {v0}, Lorg/cybergarage/upnp/IconList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ge v1, p1, :cond_0

    .line 1385
    const/4 v1, 0x0

    .line 1386
    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {v0, p1}, Lorg/cybergarage/upnp/IconList;->getIcon(I)Lorg/cybergarage/upnp/Icon;

    move-result-object v1

    goto :goto_0
.end method

.method public getIconList()Lorg/cybergarage/upnp/IconList;
    .locals 8

    .prologue
    .line 1367
    new-instance v1, Lorg/cybergarage/upnp/IconList;

    invoke-direct {v1}, Lorg/cybergarage/upnp/IconList;-><init>()V

    .line 1368
    .local v1, "iconList":Lorg/cybergarage/upnp/IconList;
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceNode()Lorg/cybergarage/xml/Node;

    move-result-object v6

    const-string v7, "iconList"

    invoke-virtual {v6, v7}, Lorg/cybergarage/xml/Node;->getNode(Ljava/lang/String;)Lorg/cybergarage/xml/Node;

    move-result-object v2

    .line 1369
    .local v2, "iconListNode":Lorg/cybergarage/xml/Node;
    if-nez v2, :cond_1

    .line 1379
    :cond_0
    return-object v1

    .line 1371
    :cond_1
    invoke-virtual {v2}, Lorg/cybergarage/xml/Node;->getNNodes()I

    move-result v4

    .line 1372
    .local v4, "nNode":I
    const/4 v3, 0x0

    .local v3, "n":I
    :goto_0
    if-ge v3, v4, :cond_0

    .line 1373
    invoke-virtual {v2, v3}, Lorg/cybergarage/xml/Node;->getNode(I)Lorg/cybergarage/xml/Node;

    move-result-object v5

    .line 1374
    .local v5, "node":Lorg/cybergarage/xml/Node;
    invoke-static {v5}, Lorg/cybergarage/upnp/Icon;->isIconNode(Lorg/cybergarage/xml/Node;)Z

    move-result v6

    if-nez v6, :cond_2

    .line 1372
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1376
    :cond_2
    new-instance v0, Lorg/cybergarage/upnp/Icon;

    invoke-direct {v0, v5}, Lorg/cybergarage/upnp/Icon;-><init>(Lorg/cybergarage/xml/Node;)V

    .line 1377
    .local v0, "icon":Lorg/cybergarage/upnp/Icon;
    invoke-virtual {v1, v0}, Lorg/cybergarage/upnp/IconList;->add(Ljava/lang/Object;)Z

    goto :goto_1
.end method

.method public getInterfaceAddress()Ljava/lang/String;
    .locals 2

    .prologue
    .line 2158
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getSSDPPacket()Lorg/cybergarage/upnp/ssdp/SSDPPacket;

    move-result-object v0

    .line 2159
    .local v0, "ssdpPacket":Lorg/cybergarage/upnp/ssdp/SSDPPacket;
    if-nez v0, :cond_0

    .line 2160
    const-string v1, ""

    .line 2161
    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {v0}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->getLocalAddress()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public getLeaseTime()I
    .locals 2

    .prologue
    .line 641
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getSSDPPacket()Lorg/cybergarage/upnp/ssdp/SSDPPacket;

    move-result-object v0

    .line 642
    .local v0, "packet":Lorg/cybergarage/upnp/ssdp/SSDPPacket;
    if-eqz v0, :cond_0

    .line 643
    invoke-virtual {v0}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->getLeaseTime()I

    move-result v1

    .line 644
    :goto_0
    return v1

    :cond_0
    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->getDeviceData()Lorg/cybergarage/upnp/xml/DeviceData;

    move-result-object v1

    invoke-virtual {v1}, Lorg/cybergarage/upnp/xml/DeviceData;->getLeaseTime()I

    move-result v1

    goto :goto_0
.end method

.method public getLocation()Ljava/lang/String;
    .locals 2

    .prologue
    .line 621
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getSSDPPacket()Lorg/cybergarage/upnp/ssdp/SSDPPacket;

    move-result-object v0

    .line 622
    .local v0, "packet":Lorg/cybergarage/upnp/ssdp/SSDPPacket;
    if-eqz v0, :cond_0

    .line 623
    invoke-virtual {v0}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->getLocation()Ljava/lang/String;

    move-result-object v1

    .line 624
    :goto_0
    return-object v1

    :cond_0
    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->getDeviceData()Lorg/cybergarage/upnp/xml/DeviceData;

    move-result-object v1

    invoke-virtual {v1}, Lorg/cybergarage/upnp/xml/DeviceData;->getLocation()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public getLocationURL(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "host"    # Ljava/lang/String;

    .prologue
    .line 1411
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getHTTPPort()I

    move-result v0

    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->getDescriptionURI()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lorg/cybergarage/net/HostInterface;->getHostURL(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLogoURLFromDevice()Ljava/lang/String;
    .locals 3

    .prologue
    .line 781
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getLocation()Ljava/lang/String;

    move-result-object v0

    .line 782
    .local v0, "loc":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 783
    const-string v1, "setup.xml"

    const-string v2, "icon.jpg"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    .line 785
    :goto_0
    return-object v1

    :cond_0
    const-string v1, "GetIconURL"

    invoke-direct {p0, v1}, Lorg/cybergarage/upnp/Device;->getParameterFromDevice(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public getMacAddress()Ljava/lang/String;
    .locals 2

    .prologue
    .line 841
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    const-string v1, "macAddress"

    invoke-virtual {v0, v1}, Lorg/cybergarage/xml/Node;->getNodeValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getManufacture()Ljava/lang/String;
    .locals 2

    .prologue
    .line 879
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    const-string v1, "manufacturer"

    invoke-virtual {v0, v1}, Lorg/cybergarage/xml/Node;->getNodeValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getManufactureURL()Ljava/lang/String;
    .locals 2

    .prologue
    .line 893
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    const-string v1, "manufacturerURL"

    invoke-virtual {v0, v1}, Lorg/cybergarage/xml/Node;->getNodeValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMetaInfoFromDevice()[Ljava/lang/String;
    .locals 6

    .prologue
    .line 734
    const-string v4, "GetMetaInfo"

    invoke-virtual {p0, v4}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 735
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v2

    .line 736
    .local v2, "info":Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 737
    const-string v4, "<MetaInfo>"

    invoke-virtual {v2, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    const-string v5, "<MetaInfo>"

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    add-int v1, v4, v5

    .line 738
    .local v1, "firstIndex":I
    const-string v4, "</MetaInfo>"

    invoke-virtual {v2, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    .line 739
    .local v3, "lastIndex":I
    if-ge v1, v3, :cond_0

    .line 740
    invoke-virtual {v2, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    const-string v5, "\\|"

    invoke-virtual {v4, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 743
    .end local v1    # "firstIndex":I
    .end local v3    # "lastIndex":I
    :goto_0
    return-object v4

    :cond_0
    const/4 v4, 0x0

    goto :goto_0
.end method

.method public getModelDescription()Ljava/lang/String;
    .locals 2

    .prologue
    .line 907
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    const-string v1, "modelDescription"

    invoke-virtual {v0, v1}, Lorg/cybergarage/xml/Node;->getNodeValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getModelName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 921
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    const-string v1, "modelName"

    invoke-virtual {v0, v1}, Lorg/cybergarage/xml/Node;->getNodeValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getModelNumber()Ljava/lang/String;
    .locals 2

    .prologue
    .line 935
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    const-string v1, "modelNumber"

    invoke-virtual {v0, v1}, Lorg/cybergarage/xml/Node;->getNodeValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getModelURL()Ljava/lang/String;
    .locals 2

    .prologue
    .line 949
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    const-string v1, "modelURL"

    invoke-virtual {v0, v1}, Lorg/cybergarage/xml/Node;->getNodeValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMulticastIPv4Address()Ljava/lang/String;
    .locals 1

    .prologue
    .line 2045
    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->getDeviceData()Lorg/cybergarage/upnp/xml/DeviceData;

    move-result-object v0

    invoke-virtual {v0}, Lorg/cybergarage/upnp/xml/DeviceData;->getMulticastIPv4Address()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMulticastIPv6Address()Ljava/lang/String;
    .locals 1

    .prologue
    .line 2059
    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->getDeviceData()Lorg/cybergarage/upnp/xml/DeviceData;

    move-result-object v0

    invoke-virtual {v0}, Lorg/cybergarage/upnp/xml/DeviceData;->getMulticastIPv6Address()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getParentDevice()Lorg/cybergarage/upnp/Device;
    .locals 3

    .prologue
    .line 397
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->isRootDevice()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 398
    const/4 v2, 0x0

    .line 403
    :goto_0
    return-object v2

    .line 399
    :cond_0
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceNode()Lorg/cybergarage/xml/Node;

    move-result-object v1

    .line 400
    .local v1, "devNode":Lorg/cybergarage/xml/Node;
    const/4 v0, 0x0

    .line 402
    .local v0, "aux":Lorg/cybergarage/xml/Node;
    invoke-virtual {v1}, Lorg/cybergarage/xml/Node;->getParentNode()Lorg/cybergarage/xml/Node;

    move-result-object v2

    invoke-virtual {v2}, Lorg/cybergarage/xml/Node;->getParentNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    .line 403
    new-instance v2, Lorg/cybergarage/upnp/Device;

    invoke-direct {v2, v0}, Lorg/cybergarage/upnp/Device;-><init>(Lorg/cybergarage/xml/Node;)V

    goto :goto_0
.end method

.method public getPort()I
    .locals 2

    .prologue
    .line 1318
    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->getUrlBaseStr()Ljava/lang/String;

    move-result-object v0

    .line 1320
    .local v0, "urlBaseStr":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 1322
    invoke-static {v0}, Lorg/cybergarage/http/HTTP;->getPort(Ljava/lang/String;)I

    move-result v1

    .line 1325
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getPresentationURL()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1023
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    const-string v1, "presentationURL"

    invoke-virtual {v0, v1}, Lorg/cybergarage/xml/Node;->getNodeValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getProductName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1051
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    const-string v1, "productName"

    invoke-virtual {v0, v1}, Lorg/cybergarage/xml/Node;->getNodeValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getProductType()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1037
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    const-string v1, "productType"

    invoke-virtual {v0, v1}, Lorg/cybergarage/xml/Node;->getNodeValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getRootDevice()Lorg/cybergarage/upnp/Device;
    .locals 4

    .prologue
    const/4 v2, 0x0

    .line 376
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getRootNode()Lorg/cybergarage/xml/Node;

    move-result-object v1

    .line 377
    .local v1, "rootNode":Lorg/cybergarage/xml/Node;
    if-nez v1, :cond_1

    .line 382
    :cond_0
    :goto_0
    return-object v2

    .line 379
    :cond_1
    const-string v3, "device"

    invoke-virtual {v1, v3}, Lorg/cybergarage/xml/Node;->getNode(Ljava/lang/String;)Lorg/cybergarage/xml/Node;

    move-result-object v0

    .line 380
    .local v0, "devNode":Lorg/cybergarage/xml/Node;
    if-eqz v0, :cond_0

    .line 382
    new-instance v2, Lorg/cybergarage/upnp/Device;

    invoke-direct {v2, v1, v0}, Lorg/cybergarage/upnp/Device;-><init>(Lorg/cybergarage/xml/Node;Lorg/cybergarage/xml/Node;)V

    goto :goto_0
.end method

.method public getRootNode()Lorg/cybergarage/xml/Node;
    .locals 1

    .prologue
    .line 192
    iget-object v0, p0, Lorg/cybergarage/upnp/Device;->rootNode:Lorg/cybergarage/xml/Node;

    if-eqz v0, :cond_0

    .line 193
    iget-object v0, p0, Lorg/cybergarage/upnp/Device;->rootNode:Lorg/cybergarage/xml/Node;

    .line 196
    :goto_0
    return-object v0

    .line 194
    :cond_0
    iget-object v0, p0, Lorg/cybergarage/upnp/Device;->deviceNode:Lorg/cybergarage/xml/Node;

    if-nez v0, :cond_1

    .line 195
    const/4 v0, 0x0

    goto :goto_0

    .line 196
    :cond_1
    iget-object v0, p0, Lorg/cybergarage/upnp/Device;->deviceNode:Lorg/cybergarage/xml/Node;

    invoke-virtual {v0}, Lorg/cybergarage/xml/Node;->getRootNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    goto :goto_0
.end method

.method public getSSDPAnnounceCount()I
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 348
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->isNMPRMode()Z

    move-result v1

    if-ne v1, v0, :cond_0

    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->isWirelessMode()Z

    move-result v1

    if-ne v1, v0, :cond_0

    .line 349
    const/4 v0, 0x4

    .line 350
    :cond_0
    return v0
.end method

.method public getSSDPBindAddress()[Ljava/net/InetAddress;
    .locals 1

    .prologue
    .line 2031
    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->getDeviceData()Lorg/cybergarage/upnp/xml/DeviceData;

    move-result-object v0

    invoke-virtual {v0}, Lorg/cybergarage/upnp/xml/DeviceData;->getSSDPBindAddress()[Ljava/net/InetAddress;

    move-result-object v0

    return-object v0
.end method

.method public getSSDPIPv4MulticastAddress()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1691
    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->getDeviceData()Lorg/cybergarage/upnp/xml/DeviceData;

    move-result-object v0

    invoke-virtual {v0}, Lorg/cybergarage/upnp/xml/DeviceData;->getMulticastIPv4Address()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSSDPIPv4MulticastAddress(Ljava/lang/String;)V
    .locals 1
    .param p1, "ip"    # Ljava/lang/String;

    .prologue
    .line 1699
    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->getDeviceData()Lorg/cybergarage/upnp/xml/DeviceData;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/cybergarage/upnp/xml/DeviceData;->setMulticastIPv4Address(Ljava/lang/String;)V

    .line 1700
    return-void
.end method

.method public getSSDPIPv6MulticastAddress()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1707
    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->getDeviceData()Lorg/cybergarage/upnp/xml/DeviceData;

    move-result-object v0

    invoke-virtual {v0}, Lorg/cybergarage/upnp/xml/DeviceData;->getMulticastIPv6Address()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSSDPIPv6MulticastAddress(Ljava/lang/String;)V
    .locals 1
    .param p1, "ip"    # Ljava/lang/String;

    .prologue
    .line 1715
    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->getDeviceData()Lorg/cybergarage/upnp/xml/DeviceData;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/cybergarage/upnp/xml/DeviceData;->setMulticastIPv6Address(Ljava/lang/String;)V

    .line 1716
    return-void
.end method

.method public getSSDPPacket()Lorg/cybergarage/upnp/ssdp/SSDPPacket;
    .locals 1

    .prologue
    .line 607
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->isRootDevice()Z

    move-result v0

    if-nez v0, :cond_0

    .line 608
    const/4 v0, 0x0

    .line 609
    :goto_0
    return-object v0

    :cond_0
    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->getDeviceData()Lorg/cybergarage/upnp/xml/DeviceData;

    move-result-object v0

    invoke-virtual {v0}, Lorg/cybergarage/upnp/xml/DeviceData;->getSSDPPacket()Lorg/cybergarage/upnp/ssdp/SSDPPacket;

    move-result-object v0

    goto :goto_0
.end method

.method public getSSDPPort()I
    .locals 1

    .prologue
    .line 2013
    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->getDeviceData()Lorg/cybergarage/upnp/xml/DeviceData;

    move-result-object v0

    invoke-virtual {v0}, Lorg/cybergarage/upnp/xml/DeviceData;->getSSDPPort()I

    move-result v0

    return v0
.end method

.method public getSerialNumber()Ljava/lang/String;
    .locals 2

    .prologue
    .line 963
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    const-string v1, "serialNumber"

    invoke-virtual {v0, v1}, Lorg/cybergarage/xml/Node;->getNodeValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getService(Ljava/lang/String;)Lorg/cybergarage/upnp/Service;
    .locals 9
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 1137
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getServiceList()Lorg/cybergarage/upnp/ServiceList;

    move-result-object v6

    .line 1138
    .local v6, "serviceList":Lorg/cybergarage/upnp/ServiceList;
    invoke-virtual {v6}, Lorg/cybergarage/upnp/ServiceList;->size()I

    move-result v5

    .line 1139
    .local v5, "serviceCnt":I
    const/4 v3, 0x0

    .local v3, "n":I
    :goto_0
    if-ge v3, v5, :cond_2

    .line 1140
    invoke-virtual {v6, v3}, Lorg/cybergarage/upnp/ServiceList;->getService(I)Lorg/cybergarage/upnp/Service;

    move-result-object v4

    .line 1141
    .local v4, "service":Lorg/cybergarage/upnp/Service;
    invoke-virtual {v4, p1}, Lorg/cybergarage/upnp/Service;->isService(Ljava/lang/String;)Z

    move-result v7

    const/4 v8, 0x1

    if-ne v7, v8, :cond_1

    .line 1154
    .end local v4    # "service":Lorg/cybergarage/upnp/Service;
    :cond_0
    :goto_1
    return-object v4

    .line 1139
    .restart local v4    # "service":Lorg/cybergarage/upnp/Service;
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1145
    .end local v4    # "service":Lorg/cybergarage/upnp/Service;
    :cond_2
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v2

    .line 1146
    .local v2, "devList":Lorg/cybergarage/upnp/DeviceList;
    invoke-virtual {v2}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v1

    .line 1147
    .local v1, "devCnt":I
    const/4 v3, 0x0

    :goto_2
    if-ge v3, v1, :cond_3

    .line 1148
    invoke-virtual {v2, v3}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v0

    .line 1149
    .local v0, "dev":Lorg/cybergarage/upnp/Device;
    invoke-virtual {v0, p1}, Lorg/cybergarage/upnp/Device;->getService(Ljava/lang/String;)Lorg/cybergarage/upnp/Service;

    move-result-object v4

    .line 1150
    .restart local v4    # "service":Lorg/cybergarage/upnp/Service;
    if-nez v4, :cond_0

    .line 1147
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 1154
    .end local v0    # "dev":Lorg/cybergarage/upnp/Device;
    .end local v4    # "service":Lorg/cybergarage/upnp/Service;
    :cond_3
    const/4 v4, 0x0

    goto :goto_1
.end method

.method public getServiceByControlURL(Ljava/lang/String;)Lorg/cybergarage/upnp/Service;
    .locals 9
    .param p1, "searchUrl"    # Ljava/lang/String;

    .prologue
    .line 1179
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getServiceList()Lorg/cybergarage/upnp/ServiceList;

    move-result-object v6

    .line 1180
    .local v6, "serviceList":Lorg/cybergarage/upnp/ServiceList;
    invoke-virtual {v6}, Lorg/cybergarage/upnp/ServiceList;->size()I

    move-result v5

    .line 1181
    .local v5, "serviceCnt":I
    const/4 v3, 0x0

    .local v3, "n":I
    :goto_0
    if-ge v3, v5, :cond_2

    .line 1182
    invoke-virtual {v6, v3}, Lorg/cybergarage/upnp/ServiceList;->getService(I)Lorg/cybergarage/upnp/Service;

    move-result-object v4

    .line 1183
    .local v4, "service":Lorg/cybergarage/upnp/Service;
    invoke-virtual {v4, p1}, Lorg/cybergarage/upnp/Service;->isControlURL(Ljava/lang/String;)Z

    move-result v7

    const/4 v8, 0x1

    if-ne v7, v8, :cond_1

    .line 1196
    .end local v4    # "service":Lorg/cybergarage/upnp/Service;
    :cond_0
    :goto_1
    return-object v4

    .line 1181
    .restart local v4    # "service":Lorg/cybergarage/upnp/Service;
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1187
    .end local v4    # "service":Lorg/cybergarage/upnp/Service;
    :cond_2
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v2

    .line 1188
    .local v2, "devList":Lorg/cybergarage/upnp/DeviceList;
    invoke-virtual {v2}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v1

    .line 1189
    .local v1, "devCnt":I
    const/4 v3, 0x0

    :goto_2
    if-ge v3, v1, :cond_3

    .line 1190
    invoke-virtual {v2, v3}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v0

    .line 1191
    .local v0, "dev":Lorg/cybergarage/upnp/Device;
    invoke-virtual {v0, p1}, Lorg/cybergarage/upnp/Device;->getServiceByControlURL(Ljava/lang/String;)Lorg/cybergarage/upnp/Service;

    move-result-object v4

    .line 1192
    .restart local v4    # "service":Lorg/cybergarage/upnp/Service;
    if-nez v4, :cond_0

    .line 1189
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 1196
    .end local v0    # "dev":Lorg/cybergarage/upnp/Device;
    .end local v4    # "service":Lorg/cybergarage/upnp/Service;
    :cond_3
    const/4 v4, 0x0

    goto :goto_1
.end method

.method public getServiceByEventSubURL(Ljava/lang/String;)Lorg/cybergarage/upnp/Service;
    .locals 9
    .param p1, "searchUrl"    # Ljava/lang/String;

    .prologue
    .line 1200
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getServiceList()Lorg/cybergarage/upnp/ServiceList;

    move-result-object v6

    .line 1201
    .local v6, "serviceList":Lorg/cybergarage/upnp/ServiceList;
    invoke-virtual {v6}, Lorg/cybergarage/upnp/ServiceList;->size()I

    move-result v5

    .line 1202
    .local v5, "serviceCnt":I
    const/4 v3, 0x0

    .local v3, "n":I
    :goto_0
    if-ge v3, v5, :cond_2

    .line 1203
    invoke-virtual {v6, v3}, Lorg/cybergarage/upnp/ServiceList;->getService(I)Lorg/cybergarage/upnp/Service;

    move-result-object v4

    .line 1204
    .local v4, "service":Lorg/cybergarage/upnp/Service;
    invoke-virtual {v4, p1}, Lorg/cybergarage/upnp/Service;->isEventSubURL(Ljava/lang/String;)Z

    move-result v7

    const/4 v8, 0x1

    if-ne v7, v8, :cond_1

    .line 1217
    .end local v4    # "service":Lorg/cybergarage/upnp/Service;
    :cond_0
    :goto_1
    return-object v4

    .line 1202
    .restart local v4    # "service":Lorg/cybergarage/upnp/Service;
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1208
    .end local v4    # "service":Lorg/cybergarage/upnp/Service;
    :cond_2
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v2

    .line 1209
    .local v2, "devList":Lorg/cybergarage/upnp/DeviceList;
    invoke-virtual {v2}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v1

    .line 1210
    .local v1, "devCnt":I
    const/4 v3, 0x0

    :goto_2
    if-ge v3, v1, :cond_3

    .line 1211
    invoke-virtual {v2, v3}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v0

    .line 1212
    .local v0, "dev":Lorg/cybergarage/upnp/Device;
    invoke-virtual {v0, p1}, Lorg/cybergarage/upnp/Device;->getServiceByEventSubURL(Ljava/lang/String;)Lorg/cybergarage/upnp/Service;

    move-result-object v4

    .line 1213
    .restart local v4    # "service":Lorg/cybergarage/upnp/Service;
    if-nez v4, :cond_0

    .line 1210
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 1217
    .end local v0    # "dev":Lorg/cybergarage/upnp/Device;
    .end local v4    # "service":Lorg/cybergarage/upnp/Service;
    :cond_3
    const/4 v4, 0x0

    goto :goto_1
.end method

.method public getServiceBySCPDURL(Ljava/lang/String;)Lorg/cybergarage/upnp/Service;
    .locals 9
    .param p1, "searchUrl"    # Ljava/lang/String;

    .prologue
    .line 1158
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getServiceList()Lorg/cybergarage/upnp/ServiceList;

    move-result-object v6

    .line 1159
    .local v6, "serviceList":Lorg/cybergarage/upnp/ServiceList;
    invoke-virtual {v6}, Lorg/cybergarage/upnp/ServiceList;->size()I

    move-result v5

    .line 1160
    .local v5, "serviceCnt":I
    const/4 v3, 0x0

    .local v3, "n":I
    :goto_0
    if-ge v3, v5, :cond_2

    .line 1161
    invoke-virtual {v6, v3}, Lorg/cybergarage/upnp/ServiceList;->getService(I)Lorg/cybergarage/upnp/Service;

    move-result-object v4

    .line 1162
    .local v4, "service":Lorg/cybergarage/upnp/Service;
    invoke-virtual {v4, p1}, Lorg/cybergarage/upnp/Service;->isSCPDURL(Ljava/lang/String;)Z

    move-result v7

    const/4 v8, 0x1

    if-ne v7, v8, :cond_1

    .line 1175
    .end local v4    # "service":Lorg/cybergarage/upnp/Service;
    :cond_0
    :goto_1
    return-object v4

    .line 1160
    .restart local v4    # "service":Lorg/cybergarage/upnp/Service;
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1166
    .end local v4    # "service":Lorg/cybergarage/upnp/Service;
    :cond_2
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v2

    .line 1167
    .local v2, "devList":Lorg/cybergarage/upnp/DeviceList;
    invoke-virtual {v2}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v1

    .line 1168
    .local v1, "devCnt":I
    const/4 v3, 0x0

    :goto_2
    if-ge v3, v1, :cond_3

    .line 1169
    invoke-virtual {v2, v3}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v0

    .line 1170
    .local v0, "dev":Lorg/cybergarage/upnp/Device;
    invoke-virtual {v0, p1}, Lorg/cybergarage/upnp/Device;->getServiceBySCPDURL(Ljava/lang/String;)Lorg/cybergarage/upnp/Service;

    move-result-object v4

    .line 1171
    .restart local v4    # "service":Lorg/cybergarage/upnp/Service;
    if-nez v4, :cond_0

    .line 1168
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 1175
    .end local v0    # "dev":Lorg/cybergarage/upnp/Device;
    .end local v4    # "service":Lorg/cybergarage/upnp/Service;
    :cond_3
    const/4 v4, 0x0

    goto :goto_1
.end method

.method public getServiceList()Lorg/cybergarage/upnp/ServiceList;
    .locals 8

    .prologue
    .line 1121
    new-instance v4, Lorg/cybergarage/upnp/ServiceList;

    invoke-direct {v4}, Lorg/cybergarage/upnp/ServiceList;-><init>()V

    .line 1122
    .local v4, "serviceList":Lorg/cybergarage/upnp/ServiceList;
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceNode()Lorg/cybergarage/xml/Node;

    move-result-object v6

    const-string v7, "serviceList"

    invoke-virtual {v6, v7}, Lorg/cybergarage/xml/Node;->getNode(Ljava/lang/String;)Lorg/cybergarage/xml/Node;

    move-result-object v5

    .line 1123
    .local v5, "serviceListNode":Lorg/cybergarage/xml/Node;
    if-nez v5, :cond_1

    .line 1133
    :cond_0
    return-object v4

    .line 1125
    :cond_1
    invoke-virtual {v5}, Lorg/cybergarage/xml/Node;->getNNodes()I

    move-result v1

    .line 1126
    .local v1, "nNode":I
    const/4 v0, 0x0

    .local v0, "n":I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 1127
    invoke-virtual {v5, v0}, Lorg/cybergarage/xml/Node;->getNode(I)Lorg/cybergarage/xml/Node;

    move-result-object v2

    .line 1128
    .local v2, "node":Lorg/cybergarage/xml/Node;
    invoke-static {v2}, Lorg/cybergarage/upnp/Service;->isServiceNode(Lorg/cybergarage/xml/Node;)Z

    move-result v6

    if-nez v6, :cond_2

    .line 1126
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1130
    :cond_2
    new-instance v3, Lorg/cybergarage/upnp/Service;

    invoke-direct {v3, v2}, Lorg/cybergarage/upnp/Service;-><init>(Lorg/cybergarage/xml/Node;)V

    .line 1131
    .local v3, "service":Lorg/cybergarage/upnp/Service;
    invoke-virtual {v4, v3}, Lorg/cybergarage/upnp/ServiceList;->add(Ljava/lang/Object;)Z

    goto :goto_1
.end method

.method public getSmallestIcon()Lorg/cybergarage/upnp/Icon;
    .locals 7

    .prologue
    .line 1390
    const/4 v4, 0x0

    .line 1391
    .local v4, "smallestIcon":Lorg/cybergarage/upnp/Icon;
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getIconList()Lorg/cybergarage/upnp/IconList;

    move-result-object v2

    .line 1392
    .local v2, "iconList":Lorg/cybergarage/upnp/IconList;
    invoke-virtual {v2}, Lorg/cybergarage/upnp/IconList;->size()I

    move-result v1

    .line 1393
    .local v1, "iconCount":I
    const/4 v3, 0x0

    .local v3, "n":I
    :goto_0
    if-ge v3, v1, :cond_2

    .line 1394
    invoke-virtual {v2, v3}, Lorg/cybergarage/upnp/IconList;->getIcon(I)Lorg/cybergarage/upnp/Icon;

    move-result-object v0

    .line 1395
    .local v0, "icon":Lorg/cybergarage/upnp/Icon;
    if-nez v4, :cond_1

    .line 1396
    move-object v4, v0

    .line 1393
    :cond_0
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1399
    :cond_1
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Icon;->getWidth()I

    move-result v5

    invoke-virtual {v4}, Lorg/cybergarage/upnp/Icon;->getWidth()I

    move-result v6

    if-ge v5, v6, :cond_0

    .line 1400
    move-object v4, v0

    goto :goto_1

    .line 1403
    .end local v0    # "icon":Lorg/cybergarage/upnp/Icon;
    :cond_2
    return-object v4
.end method

.method public getStateVariable(Ljava/lang/String;)Lorg/cybergarage/upnp/StateVariable;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 1277
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lorg/cybergarage/upnp/Device;->getStateVariable(Ljava/lang/String;Ljava/lang/String;)Lorg/cybergarage/upnp/StateVariable;

    move-result-object v0

    return-object v0
.end method

.method public getStateVariable(Ljava/lang/String;Ljava/lang/String;)Lorg/cybergarage/upnp/StateVariable;
    .locals 10
    .param p1, "serviceType"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x0

    .line 1247
    if-nez p1, :cond_1

    if-nez p2, :cond_1

    move-object v7, v8

    .line 1273
    :cond_0
    :goto_0
    return-object v7

    .line 1250
    :cond_1
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getServiceList()Lorg/cybergarage/upnp/ServiceList;

    move-result-object v6

    .line 1251
    .local v6, "serviceList":Lorg/cybergarage/upnp/ServiceList;
    invoke-virtual {v6}, Lorg/cybergarage/upnp/ServiceList;->size()I

    move-result v5

    .line 1252
    .local v5, "serviceCnt":I
    const/4 v3, 0x0

    .local v3, "n":I
    :goto_1
    if-ge v3, v5, :cond_4

    .line 1253
    invoke-virtual {v6, v3}, Lorg/cybergarage/upnp/ServiceList;->getService(I)Lorg/cybergarage/upnp/Service;

    move-result-object v4

    .line 1255
    .local v4, "service":Lorg/cybergarage/upnp/Service;
    if-eqz p1, :cond_3

    .line 1256
    invoke-virtual {v4}, Lorg/cybergarage/upnp/Service;->getServiceType()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_3

    .line 1252
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 1259
    :cond_3
    invoke-virtual {v4, p2}, Lorg/cybergarage/upnp/Service;->getStateVariable(Ljava/lang/String;)Lorg/cybergarage/upnp/StateVariable;

    move-result-object v7

    .line 1260
    .local v7, "stateVar":Lorg/cybergarage/upnp/StateVariable;
    if-eqz v7, :cond_2

    goto :goto_0

    .line 1264
    .end local v4    # "service":Lorg/cybergarage/upnp/Service;
    .end local v7    # "stateVar":Lorg/cybergarage/upnp/StateVariable;
    :cond_4
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v2

    .line 1265
    .local v2, "devList":Lorg/cybergarage/upnp/DeviceList;
    invoke-virtual {v2}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v1

    .line 1266
    .local v1, "devCnt":I
    const/4 v3, 0x0

    :goto_2
    if-ge v3, v1, :cond_5

    .line 1267
    invoke-virtual {v2, v3}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v0

    .line 1268
    .local v0, "dev":Lorg/cybergarage/upnp/Device;
    invoke-virtual {v0, p1, p2}, Lorg/cybergarage/upnp/Device;->getStateVariable(Ljava/lang/String;Ljava/lang/String;)Lorg/cybergarage/upnp/StateVariable;

    move-result-object v7

    .line 1269
    .restart local v7    # "stateVar":Lorg/cybergarage/upnp/StateVariable;
    if-nez v7, :cond_0

    .line 1266
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .end local v0    # "dev":Lorg/cybergarage/upnp/Device;
    .end local v7    # "stateVar":Lorg/cybergarage/upnp/StateVariable;
    :cond_5
    move-object v7, v8

    .line 1273
    goto :goto_0
.end method

.method public getSubscriberService(Ljava/lang/String;)Lorg/cybergarage/upnp/Service;
    .locals 10
    .param p1, "uuid"    # Ljava/lang/String;

    .prologue
    .line 1221
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getServiceList()Lorg/cybergarage/upnp/ServiceList;

    move-result-object v6

    .line 1222
    .local v6, "serviceList":Lorg/cybergarage/upnp/ServiceList;
    invoke-virtual {v6}, Lorg/cybergarage/upnp/ServiceList;->size()I

    move-result v5

    .line 1223
    .local v5, "serviceCnt":I
    const/4 v3, 0x0

    .local v3, "n":I
    :goto_0
    if-ge v3, v5, :cond_2

    .line 1224
    invoke-virtual {v6, v3}, Lorg/cybergarage/upnp/ServiceList;->getService(I)Lorg/cybergarage/upnp/Service;

    move-result-object v4

    .line 1225
    .local v4, "service":Lorg/cybergarage/upnp/Service;
    invoke-virtual {v4}, Lorg/cybergarage/upnp/Service;->getSID()Ljava/lang/String;

    move-result-object v7

    .line 1226
    .local v7, "sid":Ljava/lang/String;
    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    const/4 v9, 0x1

    if-ne v8, v9, :cond_1

    .line 1239
    .end local v4    # "service":Lorg/cybergarage/upnp/Service;
    .end local v7    # "sid":Ljava/lang/String;
    :cond_0
    :goto_1
    return-object v4

    .line 1223
    .restart local v4    # "service":Lorg/cybergarage/upnp/Service;
    .restart local v7    # "sid":Ljava/lang/String;
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1230
    .end local v4    # "service":Lorg/cybergarage/upnp/Service;
    .end local v7    # "sid":Ljava/lang/String;
    :cond_2
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v2

    .line 1231
    .local v2, "devList":Lorg/cybergarage/upnp/DeviceList;
    invoke-virtual {v2}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v1

    .line 1232
    .local v1, "devCnt":I
    const/4 v3, 0x0

    :goto_2
    if-ge v3, v1, :cond_3

    .line 1233
    invoke-virtual {v2, v3}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v0

    .line 1234
    .local v0, "dev":Lorg/cybergarage/upnp/Device;
    invoke-virtual {v0, p1}, Lorg/cybergarage/upnp/Device;->getSubscriberService(Ljava/lang/String;)Lorg/cybergarage/upnp/Service;

    move-result-object v4

    .line 1235
    .restart local v4    # "service":Lorg/cybergarage/upnp/Service;
    if-nez v4, :cond_0

    .line 1232
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 1239
    .end local v0    # "dev":Lorg/cybergarage/upnp/Device;
    .end local v4    # "service":Lorg/cybergarage/upnp/Service;
    :cond_3
    const/4 v4, 0x0

    goto :goto_1
.end method

.method public getTimeStamp()J
    .locals 4

    .prologue
    .line 652
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getSSDPPacket()Lorg/cybergarage/upnp/ssdp/SSDPPacket;

    move-result-object v0

    .line 653
    .local v0, "packet":Lorg/cybergarage/upnp/ssdp/SSDPPacket;
    if-eqz v0, :cond_0

    .line 654
    invoke-virtual {v0}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->getTimeStamp()J

    move-result-wide v2

    .line 655
    :goto_0
    return-wide v2

    :cond_0
    const-wide/16 v2, 0x0

    goto :goto_0
.end method

.method public getUDN()Ljava/lang/String;
    .locals 2

    .prologue
    .line 979
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    const-string v1, "UDN"

    invoke-virtual {v0, v1}, Lorg/cybergarage/xml/Node;->getNodeValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->getFilteredUDN(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getUPC()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1000
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    const-string v1, "UPC"

    invoke-virtual {v0, v1}, Lorg/cybergarage/xml/Node;->getNodeValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getURLBase()Ljava/lang/String;
    .locals 2

    .prologue
    .line 698
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->isRootDevice()Z

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 699
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getRootNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    const-string v1, "URLBase"

    invoke-virtual {v0, v1}, Lorg/cybergarage/xml/Node;->getNodeValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 700
    :goto_0
    return-object v0

    :cond_0
    const-string v0, ""

    goto :goto_0
.end method

.method public getUserData()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 2227
    iget-object v0, p0, Lorg/cybergarage/upnp/Device;->userData:Ljava/lang/Object;

    return-object v0
.end method

.method public hasUDN()Z
    .locals 2

    .prologue
    .line 983
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v0

    .line 984
    .local v0, "udn":Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-gtz v1, :cond_1

    .line 985
    :cond_0
    const/4 v1, 0x0

    .line 986
    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public httpRequestRecieved(Lorg/cybergarage/http/HTTPRequest;)V
    .locals 3
    .param p1, "httpReq"    # Lorg/cybergarage/http/HTTPRequest;

    .prologue
    const/4 v2, 0x1

    .line 1719
    invoke-static {}, Lorg/cybergarage/util/Debug;->isOn()Z

    move-result v1

    if-ne v1, v2, :cond_0

    .line 1720
    invoke-virtual {p1}, Lorg/cybergarage/http/HTTPRequest;->print()V

    .line 1722
    :cond_0
    invoke-virtual {p1}, Lorg/cybergarage/http/HTTPRequest;->isGetRequest()Z

    move-result v1

    if-eq v1, v2, :cond_1

    invoke-virtual {p1}, Lorg/cybergarage/http/HTTPRequest;->isHeadRequest()Z

    move-result v1

    if-ne v1, v2, :cond_2

    .line 1723
    :cond_1
    invoke-direct {p0, p1}, Lorg/cybergarage/upnp/Device;->httpGetRequestRecieved(Lorg/cybergarage/http/HTTPRequest;)V

    .line 1738
    :goto_0
    return-void

    .line 1726
    :cond_2
    invoke-virtual {p1}, Lorg/cybergarage/http/HTTPRequest;->isPostRequest()Z

    move-result v1

    if-ne v1, v2, :cond_3

    .line 1727
    invoke-direct {p0, p1}, Lorg/cybergarage/upnp/Device;->httpPostRequestRecieved(Lorg/cybergarage/http/HTTPRequest;)V

    goto :goto_0

    .line 1731
    :cond_3
    invoke-virtual {p1}, Lorg/cybergarage/http/HTTPRequest;->isSubscribeRequest()Z

    move-result v1

    if-eq v1, v2, :cond_4

    invoke-virtual {p1}, Lorg/cybergarage/http/HTTPRequest;->isUnsubscribeRequest()Z

    move-result v1

    if-ne v1, v2, :cond_5

    .line 1732
    :cond_4
    new-instance v0, Lorg/cybergarage/upnp/event/SubscriptionRequest;

    invoke-direct {v0, p1}, Lorg/cybergarage/upnp/event/SubscriptionRequest;-><init>(Lorg/cybergarage/http/HTTPRequest;)V

    .line 1733
    .local v0, "subReq":Lorg/cybergarage/upnp/event/SubscriptionRequest;
    invoke-direct {p0, v0}, Lorg/cybergarage/upnp/Device;->deviceEventSubscriptionRecieved(Lorg/cybergarage/upnp/event/SubscriptionRequest;)V

    goto :goto_0

    .line 1737
    .end local v0    # "subReq":Lorg/cybergarage/upnp/event/SubscriptionRequest;
    :cond_5
    invoke-virtual {p1}, Lorg/cybergarage/http/HTTPRequest;->returnBadRequest()Z

    goto :goto_0
.end method

.method public isAvailable()Z
    .locals 1

    .prologue
    .line 2406
    iget-boolean v0, p0, Lorg/cybergarage/upnp/Device;->available:Z

    return v0
.end method

.method public isDevice(Ljava/lang/String;)Z
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 1076
    if-nez p1, :cond_1

    .line 1084
    :cond_0
    :goto_0
    return v0

    .line 1078
    :cond_1
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-ne v2, v1, :cond_2

    move v0, v1

    .line 1079
    goto :goto_0

    .line 1080
    :cond_2
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getFriendlyName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-ne v2, v1, :cond_3

    move v0, v1

    .line 1081
    goto :goto_0

    .line 1082
    :cond_3
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-ne v2, v1, :cond_0

    move v0, v1

    .line 1083
    goto :goto_0
.end method

.method public isDeviceType(Ljava/lang/String;)Z
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 827
    if-nez p1, :cond_0

    .line 828
    const/4 v0, 0x0

    .line 829
    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method public isExpired()Z
    .locals 5

    .prologue
    .line 663
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getElapsedTime()J

    move-result-wide v0

    .line 664
    .local v0, "elipsedTime":J
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getLeaseTime()I

    move-result v4

    add-int/lit8 v4, v4, 0x3c

    int-to-long v2, v4

    .line 665
    .local v2, "leaseTime":J
    cmp-long v4, v2, v0

    if-gez v4, :cond_0

    .line 666
    const/4 v4, 0x1

    .line 667
    :goto_0
    return v4

    :cond_0
    const/4 v4, 0x0

    goto :goto_0
.end method

.method public isLocationChange()Z
    .locals 1

    .prologue
    .line 2399
    iget-boolean v0, p0, Lorg/cybergarage/upnp/Device;->locationChange:Z

    return v0
.end method

.method public isNMPRMode()Z
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 327
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    .line 328
    .local v0, "devNode":Lorg/cybergarage/xml/Node;
    if-nez v0, :cond_1

    .line 330
    :cond_0
    :goto_0
    return v1

    :cond_1
    const-string v2, "INMPR03"

    invoke-virtual {v0, v2}, Lorg/cybergarage/xml/Node;->getNode(Ljava/lang/String;)Lorg/cybergarage/xml/Node;

    move-result-object v2

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0
.end method

.method public isRootDevice()Z
    .locals 2

    .prologue
    .line 595
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getRootNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    const-string v1, "device"

    invoke-virtual {v0, v1}, Lorg/cybergarage/xml/Node;->getNode(Ljava/lang/String;)Lorg/cybergarage/xml/Node;

    move-result-object v0

    const-string v1, "UDN"

    invoke-virtual {v0, v1}, Lorg/cybergarage/xml/Node;->getNodeValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->getFilteredUDN(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isRunning()Z
    .locals 1

    .prologue
    .line 2150
    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->getAdvertiser()Lorg/cybergarage/upnp/device/Advertiser;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isWirelessMode()Z
    .locals 1

    .prologue
    .line 344
    iget-boolean v0, p0, Lorg/cybergarage/upnp/Device;->wirelessMode:Z

    return v0
.end method

.method public loadDescription(Ljava/io/File;)Z
    .locals 4
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/cybergarage/upnp/device/InvalidDescriptionException;
        }
    .end annotation

    .prologue
    .line 551
    :try_start_0
    invoke-static {}, Lorg/cybergarage/upnp/UPnP;->getXMLParser()Lorg/cybergarage/xml/Parser;

    move-result-object v1

    .line 552
    .local v1, "parser":Lorg/cybergarage/xml/Parser;
    invoke-virtual {v1, p1}, Lorg/cybergarage/xml/Parser;->parse(Ljava/io/File;)Lorg/cybergarage/xml/Node;

    move-result-object v2

    iput-object v2, p0, Lorg/cybergarage/upnp/Device;->rootNode:Lorg/cybergarage/xml/Node;

    .line 553
    iget-object v2, p0, Lorg/cybergarage/upnp/Device;->rootNode:Lorg/cybergarage/xml/Node;

    if-nez v2, :cond_0

    .line 554
    new-instance v2, Lorg/cybergarage/upnp/device/InvalidDescriptionException;

    const-string v3, "Couldn\'t find a root node"

    invoke-direct {v2, v3, p1}, Lorg/cybergarage/upnp/device/InvalidDescriptionException;-><init>(Ljava/lang/String;Ljava/io/File;)V

    throw v2
    :try_end_0
    .catch Lorg/cybergarage/xml/ParserException; {:try_start_0 .. :try_end_0} :catch_0

    .line 558
    .end local v1    # "parser":Lorg/cybergarage/xml/Parser;
    :catch_0
    move-exception v0

    .line 559
    .local v0, "e":Lorg/cybergarage/xml/ParserException;
    new-instance v2, Lorg/cybergarage/upnp/device/InvalidDescriptionException;

    invoke-direct {v2, v0}, Lorg/cybergarage/upnp/device/InvalidDescriptionException;-><init>(Ljava/lang/Exception;)V

    throw v2

    .line 555
    .end local v0    # "e":Lorg/cybergarage/xml/ParserException;
    .restart local v1    # "parser":Lorg/cybergarage/xml/Parser;
    :cond_0
    :try_start_1
    iget-object v2, p0, Lorg/cybergarage/upnp/Device;->rootNode:Lorg/cybergarage/xml/Node;

    const-string v3, "device"

    invoke-virtual {v2, v3}, Lorg/cybergarage/xml/Node;->getNode(Ljava/lang/String;)Lorg/cybergarage/xml/Node;

    move-result-object v2

    iput-object v2, p0, Lorg/cybergarage/upnp/Device;->deviceNode:Lorg/cybergarage/xml/Node;

    .line 556
    iget-object v2, p0, Lorg/cybergarage/upnp/Device;->deviceNode:Lorg/cybergarage/xml/Node;

    if-nez v2, :cond_1

    .line 557
    new-instance v2, Lorg/cybergarage/upnp/device/InvalidDescriptionException;

    const-string v3, "Couldn\'t find a root device node"

    invoke-direct {v2, v3, p1}, Lorg/cybergarage/upnp/device/InvalidDescriptionException;-><init>(Ljava/lang/String;Ljava/io/File;)V

    throw v2
    :try_end_1
    .catch Lorg/cybergarage/xml/ParserException; {:try_start_1 .. :try_end_1} :catch_0

    .line 562
    :cond_1
    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->initializeLoadedDescription()Z

    move-result v2

    if-nez v2, :cond_2

    .line 563
    const/4 v2, 0x0

    .line 567
    :goto_0
    return v2

    .line 565
    :cond_2
    invoke-direct {p0, p1}, Lorg/cybergarage/upnp/Device;->setDescriptionFile(Ljava/io/File;)V

    .line 567
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public loadDescription(Ljava/io/InputStream;)Z
    .locals 4
    .param p1, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/cybergarage/upnp/device/InvalidDescriptionException;
        }
    .end annotation

    .prologue
    .line 509
    :try_start_0
    invoke-static {}, Lorg/cybergarage/upnp/UPnP;->getXMLParser()Lorg/cybergarage/xml/Parser;

    move-result-object v1

    .line 510
    .local v1, "parser":Lorg/cybergarage/xml/Parser;
    invoke-virtual {v1, p1}, Lorg/cybergarage/xml/Parser;->parse(Ljava/io/InputStream;)Lorg/cybergarage/xml/Node;

    move-result-object v2

    iput-object v2, p0, Lorg/cybergarage/upnp/Device;->rootNode:Lorg/cybergarage/xml/Node;

    .line 511
    iget-object v2, p0, Lorg/cybergarage/upnp/Device;->rootNode:Lorg/cybergarage/xml/Node;

    if-nez v2, :cond_0

    .line 512
    new-instance v2, Lorg/cybergarage/upnp/device/InvalidDescriptionException;

    const-string v3, "Couldn\'t find a root node"

    invoke-direct {v2, v3}, Lorg/cybergarage/upnp/device/InvalidDescriptionException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_0
    .catch Lorg/cybergarage/xml/ParserException; {:try_start_0 .. :try_end_0} :catch_0

    .line 516
    .end local v1    # "parser":Lorg/cybergarage/xml/Parser;
    :catch_0
    move-exception v0

    .line 517
    .local v0, "e":Lorg/cybergarage/xml/ParserException;
    new-instance v2, Lorg/cybergarage/upnp/device/InvalidDescriptionException;

    invoke-direct {v2, v0}, Lorg/cybergarage/upnp/device/InvalidDescriptionException;-><init>(Ljava/lang/Exception;)V

    throw v2

    .line 513
    .end local v0    # "e":Lorg/cybergarage/xml/ParserException;
    .restart local v1    # "parser":Lorg/cybergarage/xml/Parser;
    :cond_0
    :try_start_1
    iget-object v2, p0, Lorg/cybergarage/upnp/Device;->rootNode:Lorg/cybergarage/xml/Node;

    const-string v3, "device"

    invoke-virtual {v2, v3}, Lorg/cybergarage/xml/Node;->getNode(Ljava/lang/String;)Lorg/cybergarage/xml/Node;

    move-result-object v2

    iput-object v2, p0, Lorg/cybergarage/upnp/Device;->deviceNode:Lorg/cybergarage/xml/Node;

    .line 514
    iget-object v2, p0, Lorg/cybergarage/upnp/Device;->deviceNode:Lorg/cybergarage/xml/Node;

    if-nez v2, :cond_1

    .line 515
    new-instance v2, Lorg/cybergarage/upnp/device/InvalidDescriptionException;

    const-string v3, "Couldn\'t find a root device node"

    invoke-direct {v2, v3}, Lorg/cybergarage/upnp/device/InvalidDescriptionException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_1
    .catch Lorg/cybergarage/xml/ParserException; {:try_start_1 .. :try_end_1} :catch_0

    .line 520
    :cond_1
    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->initializeLoadedDescription()Z

    move-result v2

    if-nez v2, :cond_2

    .line 521
    const/4 v2, 0x0

    .line 525
    :goto_0
    return v2

    .line 523
    :cond_2
    const/4 v2, 0x0

    invoke-direct {p0, v2}, Lorg/cybergarage/upnp/Device;->setDescriptionFile(Ljava/io/File;)V

    .line 525
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public loadDescription(Ljava/lang/String;)Z
    .locals 4
    .param p1, "descString"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/cybergarage/upnp/device/InvalidDescriptionException;
        }
    .end annotation

    .prologue
    .line 530
    :try_start_0
    invoke-static {}, Lorg/cybergarage/upnp/UPnP;->getXMLParser()Lorg/cybergarage/xml/Parser;

    move-result-object v1

    .line 531
    .local v1, "parser":Lorg/cybergarage/xml/Parser;
    invoke-virtual {v1, p1}, Lorg/cybergarage/xml/Parser;->parse(Ljava/lang/String;)Lorg/cybergarage/xml/Node;

    move-result-object v2

    iput-object v2, p0, Lorg/cybergarage/upnp/Device;->rootNode:Lorg/cybergarage/xml/Node;

    .line 532
    iget-object v2, p0, Lorg/cybergarage/upnp/Device;->rootNode:Lorg/cybergarage/xml/Node;

    if-nez v2, :cond_0

    .line 533
    new-instance v2, Lorg/cybergarage/upnp/device/InvalidDescriptionException;

    const-string v3, "Couldn\'t find a root node"

    invoke-direct {v2, v3}, Lorg/cybergarage/upnp/device/InvalidDescriptionException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_0
    .catch Lorg/cybergarage/xml/ParserException; {:try_start_0 .. :try_end_0} :catch_0

    .line 537
    .end local v1    # "parser":Lorg/cybergarage/xml/Parser;
    :catch_0
    move-exception v0

    .line 538
    .local v0, "e":Lorg/cybergarage/xml/ParserException;
    new-instance v2, Lorg/cybergarage/upnp/device/InvalidDescriptionException;

    invoke-direct {v2, v0}, Lorg/cybergarage/upnp/device/InvalidDescriptionException;-><init>(Ljava/lang/Exception;)V

    throw v2

    .line 534
    .end local v0    # "e":Lorg/cybergarage/xml/ParserException;
    .restart local v1    # "parser":Lorg/cybergarage/xml/Parser;
    :cond_0
    :try_start_1
    iget-object v2, p0, Lorg/cybergarage/upnp/Device;->rootNode:Lorg/cybergarage/xml/Node;

    const-string v3, "device"

    invoke-virtual {v2, v3}, Lorg/cybergarage/xml/Node;->getNode(Ljava/lang/String;)Lorg/cybergarage/xml/Node;

    move-result-object v2

    iput-object v2, p0, Lorg/cybergarage/upnp/Device;->deviceNode:Lorg/cybergarage/xml/Node;

    .line 535
    iget-object v2, p0, Lorg/cybergarage/upnp/Device;->deviceNode:Lorg/cybergarage/xml/Node;

    if-nez v2, :cond_1

    .line 536
    new-instance v2, Lorg/cybergarage/upnp/device/InvalidDescriptionException;

    const-string v3, "Couldn\'t find a root device node"

    invoke-direct {v2, v3}, Lorg/cybergarage/upnp/device/InvalidDescriptionException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_1
    .catch Lorg/cybergarage/xml/ParserException; {:try_start_1 .. :try_end_1} :catch_0

    .line 541
    :cond_1
    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->initializeLoadedDescription()Z

    move-result v2

    if-nez v2, :cond_2

    .line 542
    const/4 v2, 0x0

    .line 546
    :goto_0
    return v2

    .line 544
    :cond_2
    const/4 v2, 0x0

    invoke-direct {p0, v2}, Lorg/cybergarage/upnp/Device;->setDescriptionFile(Ljava/io/File;)V

    .line 546
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public lock()V
    .locals 1

    .prologue
    .line 263
    iget-object v0, p0, Lorg/cybergarage/upnp/Device;->mutex:Lorg/cybergarage/util/Mutex;

    invoke-virtual {v0}, Lorg/cybergarage/util/Mutex;->lock()V

    .line 264
    return-void
.end method

.method public postSearchResponse(Lorg/cybergarage/upnp/ssdp/SSDPPacket;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 12
    .param p1, "ssdpPacket"    # Lorg/cybergarage/upnp/ssdp/SSDPPacket;
    .param p2, "st"    # Ljava/lang/String;
    .param p3, "usn"    # Ljava/lang/String;

    .prologue
    const/4 v11, 0x1

    .line 1586
    invoke-virtual {p1}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->getLocalAddress()Ljava/lang/String;

    move-result-object v1

    .line 1587
    .local v1, "localAddr":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getRootDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v5

    .line 1588
    .local v5, "rootDev":Lorg/cybergarage/upnp/Device;
    invoke-virtual {v5, v1}, Lorg/cybergarage/upnp/Device;->getLocationURL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 1590
    .local v6, "rootDevLocation":Ljava/lang/String;
    new-instance v8, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponse;

    invoke-direct {v8}, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponse;-><init>()V

    .line 1591
    .local v8, "ssdpRes":Lorg/cybergarage/upnp/ssdp/SSDPSearchResponse;
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getLeaseTime()I

    move-result v10

    invoke-virtual {v8, v10}, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponse;->setLeaseTime(I)V

    .line 1592
    sget-object v10, Lorg/cybergarage/upnp/Device;->cal:Ljava/util/Calendar;

    invoke-virtual {v8, v10}, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponse;->setDate(Ljava/util/Calendar;)V

    .line 1593
    invoke-virtual {v8, p2}, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponse;->setST(Ljava/lang/String;)V

    .line 1594
    invoke-virtual {v8, p3}, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponse;->setUSN(Ljava/lang/String;)V

    .line 1595
    invoke-virtual {v8, v6}, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponse;->setLocation(Ljava/lang/String;)V

    .line 1597
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getFriendlyName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v10}, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponse;->setMYNAME(Ljava/lang/String;)V

    .line 1599
    invoke-virtual {p1}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->getMX()I

    move-result v2

    .line 1600
    .local v2, "mx":I
    mul-int/lit16 v10, v2, 0x3e8

    invoke-static {v10}, Lorg/cybergarage/util/TimerUtil;->waitRandom(I)V

    .line 1602
    invoke-virtual {p1}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->getRemoteAddress()Ljava/lang/String;

    move-result-object v3

    .line 1603
    .local v3, "remoteAddr":Ljava/lang/String;
    invoke-virtual {p1}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->getRemotePort()I

    move-result v4

    .line 1604
    .local v4, "remotePort":I
    new-instance v9, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;

    invoke-direct {v9}, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;-><init>()V

    .line 1605
    .local v9, "ssdpResSock":Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;
    invoke-static {}, Lorg/cybergarage/util/Debug;->isOn()Z

    move-result v10

    if-ne v10, v11, :cond_0

    .line 1606
    invoke-virtual {v8}, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponse;->print()V

    .line 1607
    :cond_0
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getSSDPAnnounceCount()I

    move-result v7

    .line 1608
    .local v7, "ssdpCount":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v7, :cond_1

    .line 1609
    invoke-virtual {v9, v3, v4, v8}, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;->post(Ljava/lang/String;ILorg/cybergarage/upnp/ssdp/SSDPSearchResponse;)Z

    .line 1608
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1611
    :cond_1
    return v11
.end method

.method public setActionListener(Lorg/cybergarage/upnp/control/ActionListener;)V
    .locals 4
    .param p1, "listener"    # Lorg/cybergarage/upnp/control/ActionListener;

    .prologue
    .line 2169
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getServiceList()Lorg/cybergarage/upnp/ServiceList;

    move-result-object v3

    .line 2170
    .local v3, "serviceList":Lorg/cybergarage/upnp/ServiceList;
    invoke-virtual {v3}, Lorg/cybergarage/upnp/ServiceList;->size()I

    move-result v1

    .line 2171
    .local v1, "nServices":I
    const/4 v0, 0x0

    .local v0, "n":I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 2172
    invoke-virtual {v3, v0}, Lorg/cybergarage/upnp/ServiceList;->getService(I)Lorg/cybergarage/upnp/Service;

    move-result-object v2

    .line 2173
    .local v2, "service":Lorg/cybergarage/upnp/Service;
    invoke-virtual {v2, p1}, Lorg/cybergarage/upnp/Service;->setActionListener(Lorg/cybergarage/upnp/control/ActionListener;)V

    .line 2171
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2175
    .end local v2    # "service":Lorg/cybergarage/upnp/Service;
    :cond_0
    return-void
.end method

.method public setActionListener(Lorg/cybergarage/upnp/control/ActionListener;Z)V
    .locals 5
    .param p1, "listener"    # Lorg/cybergarage/upnp/control/ActionListener;
    .param p2, "includeSubDevices"    # Z

    .prologue
    const/4 v4, 0x1

    .line 2192
    invoke-virtual {p0, p1}, Lorg/cybergarage/upnp/Device;->setActionListener(Lorg/cybergarage/upnp/control/ActionListener;)V

    .line 2193
    if-ne p2, v4, :cond_0

    .line 2194
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v2

    .line 2195
    .local v2, "devList":Lorg/cybergarage/upnp/DeviceList;
    invoke-virtual {v2}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v1

    .line 2196
    .local v1, "devCnt":I
    const/4 v3, 0x0

    .local v3, "n":I
    :goto_0
    if-ge v3, v1, :cond_0

    .line 2197
    invoke-virtual {v2, v3}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v0

    .line 2198
    .local v0, "dev":Lorg/cybergarage/upnp/Device;
    invoke-virtual {v0, p1, v4}, Lorg/cybergarage/upnp/Device;->setActionListener(Lorg/cybergarage/upnp/control/ActionListener;Z)V

    .line 2196
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 2201
    .end local v0    # "dev":Lorg/cybergarage/upnp/Device;
    .end local v1    # "devCnt":I
    .end local v2    # "devList":Lorg/cybergarage/upnp/DeviceList;
    .end local v3    # "n":I
    :cond_0
    return-void
.end method

.method public setAvailable(Z)V
    .locals 0
    .param p1, "available"    # Z

    .prologue
    .line 2410
    iput-boolean p1, p0, Lorg/cybergarage/upnp/Device;->available:Z

    .line 2411
    return-void
.end method

.method public setBrandName(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 860
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    const-string v1, "brandName"

    invoke-virtual {v0, v1, p1}, Lorg/cybergarage/xml/Node;->setNode(Ljava/lang/String;Ljava/lang/String;)V

    .line 861
    return-void
.end method

.method public setConfigureState(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 1007
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    const-string v1, "CONFIGURE_STATE"

    invoke-virtual {v0, v1, p1}, Lorg/cybergarage/xml/Node;->setNode(Ljava/lang/String;Ljava/lang/String;)V

    .line 1008
    return-void
.end method

.method public setDeviceNode(Lorg/cybergarage/xml/Node;)V
    .locals 0
    .param p1, "node"    # Lorg/cybergarage/xml/Node;

    .prologue
    .line 208
    iput-object p1, p0, Lorg/cybergarage/upnp/Device;->deviceNode:Lorg/cybergarage/xml/Node;

    .line 209
    return-void
.end method

.method public setDeviceType(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 819
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    const-string v1, "deviceType"

    invoke-virtual {v0, v1, p1}, Lorg/cybergarage/xml/Node;->setNode(Ljava/lang/String;Ljava/lang/String;)V

    .line 820
    return-void
.end method

.method public setFriendlyName(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 846
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    const-string v1, "friendlyName"

    invoke-virtual {v0, v1, p1}, Lorg/cybergarage/xml/Node;->setNode(Ljava/lang/String;Ljava/lang/String;)V

    .line 847
    return-void
.end method

.method public setHTTPBindAddress([Ljava/net/InetAddress;)V
    .locals 1
    .param p1, "inets"    # [Ljava/net/InetAddress;

    .prologue
    .line 1679
    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->getDeviceData()Lorg/cybergarage/upnp/xml/DeviceData;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/cybergarage/upnp/xml/DeviceData;->setHTTPBindAddress([Ljava/net/InetAddress;)V

    .line 1680
    return-void
.end method

.method public setHTTPPort(I)V
    .locals 1
    .param p1, "port"    # I

    .prologue
    .line 1671
    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->getDeviceData()Lorg/cybergarage/upnp/xml/DeviceData;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/cybergarage/upnp/xml/DeviceData;->setHTTPPort(I)V

    .line 1672
    return-void
.end method

.method public setLeaseTime(I)V
    .locals 2
    .param p1, "value"    # I

    .prologue
    .line 632
    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->getDeviceData()Lorg/cybergarage/upnp/xml/DeviceData;

    move-result-object v1

    invoke-virtual {v1, p1}, Lorg/cybergarage/upnp/xml/DeviceData;->setLeaseTime(I)V

    .line 633
    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->getAdvertiser()Lorg/cybergarage/upnp/device/Advertiser;

    move-result-object v0

    .line 634
    .local v0, "adv":Lorg/cybergarage/upnp/device/Advertiser;
    if-eqz v0, :cond_0

    .line 635
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->announce()V

    .line 636
    invoke-virtual {v0}, Lorg/cybergarage/upnp/device/Advertiser;->restart()V

    .line 638
    :cond_0
    return-void
.end method

.method public setLocation(Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 617
    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->getDeviceData()Lorg/cybergarage/upnp/xml/DeviceData;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/cybergarage/upnp/xml/DeviceData;->setLocation(Ljava/lang/String;)V

    .line 618
    return-void
.end method

.method public setLocationChange(Z)V
    .locals 0
    .param p1, "locationChange"    # Z

    .prologue
    .line 2403
    iput-boolean p1, p0, Lorg/cybergarage/upnp/Device;->locationChange:Z

    .line 2404
    return-void
.end method

.method public setMacAddress(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 838
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    const-string v1, "macAddress"

    invoke-virtual {v0, v1, p1}, Lorg/cybergarage/xml/Node;->setNode(Ljava/lang/String;Ljava/lang/String;)V

    .line 839
    return-void
.end method

.method public setManufacture(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 875
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    const-string v1, "manufacturer"

    invoke-virtual {v0, v1, p1}, Lorg/cybergarage/xml/Node;->setNode(Ljava/lang/String;Ljava/lang/String;)V

    .line 876
    return-void
.end method

.method public setManufactureURL(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 889
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    const-string v1, "manufacturerURL"

    invoke-virtual {v0, v1, p1}, Lorg/cybergarage/xml/Node;->setNode(Ljava/lang/String;Ljava/lang/String;)V

    .line 890
    return-void
.end method

.method public setModelDescription(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 903
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    const-string v1, "modelDescription"

    invoke-virtual {v0, v1, p1}, Lorg/cybergarage/xml/Node;->setNode(Ljava/lang/String;Ljava/lang/String;)V

    .line 904
    return-void
.end method

.method public setModelName(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 917
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    const-string v1, "modelName"

    invoke-virtual {v0, v1, p1}, Lorg/cybergarage/xml/Node;->setNode(Ljava/lang/String;Ljava/lang/String;)V

    .line 918
    return-void
.end method

.method public setModelNumber(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 931
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    const-string v1, "modelNumber"

    invoke-virtual {v0, v1, p1}, Lorg/cybergarage/xml/Node;->setNode(Ljava/lang/String;Ljava/lang/String;)V

    .line 932
    return-void
.end method

.method public setModelURL(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 945
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    const-string v1, "modelURL"

    invoke-virtual {v0, v1, p1}, Lorg/cybergarage/xml/Node;->setNode(Ljava/lang/String;Ljava/lang/String;)V

    .line 946
    return-void
.end method

.method public setMulticastIPv4Address(Ljava/lang/String;)V
    .locals 1
    .param p1, "ip"    # Ljava/lang/String;

    .prologue
    .line 2038
    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->getDeviceData()Lorg/cybergarage/upnp/xml/DeviceData;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/cybergarage/upnp/xml/DeviceData;->setMulticastIPv4Address(Ljava/lang/String;)V

    .line 2039
    return-void
.end method

.method public setMulticastIPv6Address(Ljava/lang/String;)V
    .locals 1
    .param p1, "ip"    # Ljava/lang/String;

    .prologue
    .line 2052
    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->getDeviceData()Lorg/cybergarage/upnp/xml/DeviceData;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/cybergarage/upnp/xml/DeviceData;->setMulticastIPv6Address(Ljava/lang/String;)V

    .line 2053
    return-void
.end method

.method public setNMPRMode(Z)V
    .locals 3
    .param p1, "flag"    # Z

    .prologue
    .line 315
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    .line 316
    .local v0, "devNode":Lorg/cybergarage/xml/Node;
    if-nez v0, :cond_0

    .line 324
    :goto_0
    return-void

    .line 318
    :cond_0
    const/4 v1, 0x1

    if-ne p1, v1, :cond_1

    .line 319
    const-string v1, "INMPR03"

    const-string v2, "1.0"

    invoke-virtual {v0, v1, v2}, Lorg/cybergarage/xml/Node;->setNode(Ljava/lang/String;Ljava/lang/String;)V

    .line 320
    const-string v1, "URLBase"

    invoke-virtual {v0, v1}, Lorg/cybergarage/xml/Node;->removeNode(Ljava/lang/String;)Z

    goto :goto_0

    .line 322
    :cond_1
    const-string v1, "INMPR03"

    invoke-virtual {v0, v1}, Lorg/cybergarage/xml/Node;->removeNode(Ljava/lang/String;)Z

    goto :goto_0
.end method

.method public setPresentationURL(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 1019
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    const-string v1, "presentationURL"

    invoke-virtual {v0, v1, p1}, Lorg/cybergarage/xml/Node;->setNode(Ljava/lang/String;Ljava/lang/String;)V

    .line 1020
    return-void
.end method

.method public setProductName(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 1047
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    const-string v1, "productName"

    invoke-virtual {v0, v1, p1}, Lorg/cybergarage/xml/Node;->setNode(Ljava/lang/String;Ljava/lang/String;)V

    .line 1048
    return-void
.end method

.method public setProductType(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 1033
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    const-string v1, "productType"

    invoke-virtual {v0, v1, p1}, Lorg/cybergarage/xml/Node;->setNode(Ljava/lang/String;Ljava/lang/String;)V

    .line 1034
    return-void
.end method

.method public setQueryListener(Lorg/cybergarage/upnp/control/QueryListener;)V
    .locals 4
    .param p1, "listener"    # Lorg/cybergarage/upnp/control/QueryListener;

    .prologue
    .line 2178
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getServiceList()Lorg/cybergarage/upnp/ServiceList;

    move-result-object v3

    .line 2179
    .local v3, "serviceList":Lorg/cybergarage/upnp/ServiceList;
    invoke-virtual {v3}, Lorg/cybergarage/upnp/ServiceList;->size()I

    move-result v1

    .line 2180
    .local v1, "nServices":I
    const/4 v0, 0x0

    .local v0, "n":I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 2181
    invoke-virtual {v3, v0}, Lorg/cybergarage/upnp/ServiceList;->getService(I)Lorg/cybergarage/upnp/Service;

    move-result-object v2

    .line 2182
    .local v2, "service":Lorg/cybergarage/upnp/Service;
    invoke-virtual {v2, p1}, Lorg/cybergarage/upnp/Service;->setQueryListener(Lorg/cybergarage/upnp/control/QueryListener;)V

    .line 2180
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2184
    .end local v2    # "service":Lorg/cybergarage/upnp/Service;
    :cond_0
    return-void
.end method

.method public setQueryListener(Lorg/cybergarage/upnp/control/QueryListener;Z)V
    .locals 5
    .param p1, "listener"    # Lorg/cybergarage/upnp/control/QueryListener;
    .param p2, "includeSubDevices"    # Z

    .prologue
    const/4 v4, 0x1

    .line 2205
    invoke-virtual {p0, p1}, Lorg/cybergarage/upnp/Device;->setQueryListener(Lorg/cybergarage/upnp/control/QueryListener;)V

    .line 2206
    if-ne p2, v4, :cond_0

    .line 2207
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v2

    .line 2208
    .local v2, "devList":Lorg/cybergarage/upnp/DeviceList;
    invoke-virtual {v2}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v1

    .line 2209
    .local v1, "devCnt":I
    const/4 v3, 0x0

    .local v3, "n":I
    :goto_0
    if-ge v3, v1, :cond_0

    .line 2210
    invoke-virtual {v2, v3}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v0

    .line 2211
    .local v0, "dev":Lorg/cybergarage/upnp/Device;
    invoke-virtual {v0, p1, v4}, Lorg/cybergarage/upnp/Device;->setQueryListener(Lorg/cybergarage/upnp/control/QueryListener;Z)V

    .line 2209
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 2214
    .end local v0    # "dev":Lorg/cybergarage/upnp/Device;
    .end local v1    # "devCnt":I
    .end local v2    # "devList":Lorg/cybergarage/upnp/DeviceList;
    .end local v3    # "n":I
    :cond_0
    return-void
.end method

.method public setRootNode(Lorg/cybergarage/xml/Node;)V
    .locals 0
    .param p1, "node"    # Lorg/cybergarage/xml/Node;

    .prologue
    .line 204
    iput-object p1, p0, Lorg/cybergarage/upnp/Device;->rootNode:Lorg/cybergarage/xml/Node;

    .line 205
    return-void
.end method

.method public setSSDPBindAddress([Ljava/net/InetAddress;)V
    .locals 1
    .param p1, "inets"    # [Ljava/net/InetAddress;

    .prologue
    .line 2022
    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->getDeviceData()Lorg/cybergarage/upnp/xml/DeviceData;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/cybergarage/upnp/xml/DeviceData;->setSSDPBindAddress([Ljava/net/InetAddress;)V

    .line 2023
    return-void
.end method

.method public setSSDPPacket(Lorg/cybergarage/upnp/ssdp/SSDPPacket;)V
    .locals 1
    .param p1, "packet"    # Lorg/cybergarage/upnp/ssdp/SSDPPacket;

    .prologue
    .line 603
    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->getDeviceData()Lorg/cybergarage/upnp/xml/DeviceData;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/cybergarage/upnp/xml/DeviceData;->setSSDPPacket(Lorg/cybergarage/upnp/ssdp/SSDPPacket;)V

    .line 604
    return-void
.end method

.method public setSSDPPort(I)V
    .locals 1
    .param p1, "port"    # I

    .prologue
    .line 2006
    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->getDeviceData()Lorg/cybergarage/upnp/xml/DeviceData;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/cybergarage/upnp/xml/DeviceData;->setSSDPPort(I)V

    .line 2007
    return-void
.end method

.method public setSerialNumber(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 959
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    const-string v1, "serialNumber"

    invoke-virtual {v0, v1, p1}, Lorg/cybergarage/xml/Node;->setNode(Ljava/lang/String;Ljava/lang/String;)V

    .line 960
    return-void
.end method

.method public setUDN(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 973
    invoke-static {p1}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->getFilteredUDN(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 974
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    const-string v1, "UDN"

    invoke-virtual {v0, v1, p1}, Lorg/cybergarage/xml/Node;->setNode(Ljava/lang/String;Ljava/lang/String;)V

    .line 975
    return-void
.end method

.method public setUPC(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 996
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getDeviceNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    const-string v1, "UPC"

    invoke-virtual {v0, v1, p1}, Lorg/cybergarage/xml/Node;->setNode(Ljava/lang/String;Ljava/lang/String;)V

    .line 997
    return-void
.end method

.method public setUserData(Ljava/lang/Object;)V
    .locals 0
    .param p1, "data"    # Ljava/lang/Object;

    .prologue
    .line 2223
    iput-object p1, p0, Lorg/cybergarage/upnp/Device;->userData:Ljava/lang/Object;

    .line 2224
    return-void
.end method

.method public setWirelessMode(Z)V
    .locals 0
    .param p1, "flag"    # Z

    .prologue
    .line 340
    iput-boolean p1, p0, Lorg/cybergarage/upnp/Device;->wirelessMode:Z

    .line 341
    return-void
.end method

.method public start()Z
    .locals 8

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 2076
    invoke-direct {p0, v6}, Lorg/cybergarage/upnp/Device;->stop(Z)Z

    .line 2082
    const/4 v3, 0x0

    .line 2083
    .local v3, "retryCnt":I
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getHTTPPort()I

    move-result v1

    .line 2084
    .local v1, "bindPort":I
    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->getHTTPServerList()Lorg/cybergarage/http/HTTPServerList;

    move-result-object v2

    .line 2085
    .local v2, "httpServerList":Lorg/cybergarage/http/HTTPServerList;
    :goto_0
    invoke-virtual {v2, v1}, Lorg/cybergarage/http/HTTPServerList;->open(I)Z

    move-result v7

    if-nez v7, :cond_2

    .line 2086
    add-int/lit8 v3, v3, 0x1

    .line 2087
    const/16 v7, 0x64

    if-ge v7, v3, :cond_1

    .line 2119
    :cond_0
    :goto_1
    return v5

    .line 2089
    :cond_1
    add-int/lit8 v7, v1, 0x1

    invoke-virtual {p0, v7}, Lorg/cybergarage/upnp/Device;->setHTTPPort(I)V

    .line 2090
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->getHTTPPort()I

    move-result v1

    goto :goto_0

    .line 2092
    :cond_2
    invoke-virtual {v2, p0}, Lorg/cybergarage/http/HTTPServerList;->addRequestListener(Lorg/cybergarage/http/HTTPRequestListener;)V

    .line 2093
    invoke-virtual {v2}, Lorg/cybergarage/http/HTTPServerList;->start()V

    .line 2099
    invoke-direct {p0}, Lorg/cybergarage/upnp/Device;->getSSDPSearchSocketList()Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;

    move-result-object v4

    .line 2100
    .local v4, "ssdpSearchSockList":Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;
    invoke-virtual {v4}, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;->open()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 2102
    invoke-virtual {v4, p0}, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;->addSearchListener(Lorg/cybergarage/upnp/device/SearchListener;)V

    .line 2103
    invoke-virtual {v4}, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;->start()V

    .line 2109
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Device;->announce()V

    .line 2115
    new-instance v0, Lorg/cybergarage/upnp/device/Advertiser;

    invoke-direct {v0, p0}, Lorg/cybergarage/upnp/device/Advertiser;-><init>(Lorg/cybergarage/upnp/Device;)V

    .line 2116
    .local v0, "adv":Lorg/cybergarage/upnp/device/Advertiser;
    invoke-direct {p0, v0}, Lorg/cybergarage/upnp/Device;->setAdvertiser(Lorg/cybergarage/upnp/device/Advertiser;)V

    .line 2117
    invoke-virtual {v0}, Lorg/cybergarage/upnp/device/Advertiser;->start()V

    move v5, v6

    .line 2119
    goto :goto_1
.end method

.method public stop()Z
    .locals 1

    .prologue
    .line 2146
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/cybergarage/upnp/Device;->stop(Z)Z

    move-result v0

    return v0
.end method

.method public unlock()V
    .locals 1

    .prologue
    .line 267
    iget-object v0, p0, Lorg/cybergarage/upnp/Device;->mutex:Lorg/cybergarage/util/Mutex;

    invoke-virtual {v0}, Lorg/cybergarage/util/Mutex;->unlock()V

    .line 268
    return-void
.end method

.method public updateAttributesList(Lorg/json/JSONObject;Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .locals 7
    .param p1, "attributeListJson"    # Lorg/json/JSONObject;
    .param p2, "attributesJson"    # Lorg/json/JSONObject;

    .prologue
    .line 2289
    if-eqz p1, :cond_1

    if-eqz p2, :cond_1

    .line 2290
    invoke-virtual {p2}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v4

    .line 2291
    .local v4, "getterKeyIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 2293
    :try_start_0
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 2295
    .local v0, "attributeKey":Ljava/lang/String;
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 2297
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 2298
    .local v1, "attributeObejct":Lorg/json/JSONObject;
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 2299
    .local v2, "attributelistJson":Lorg/json/JSONObject;
    const-string v6, "value"

    invoke-virtual {v1, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 2301
    .local v5, "value":Ljava/lang/String;
    if-eqz v5, :cond_0

    const-string v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    const-string v6, "null"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 2302
    const-string v6, "value"

    invoke-virtual {v2, v6, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 2306
    .end local v0    # "attributeKey":Ljava/lang/String;
    .end local v1    # "attributeObejct":Lorg/json/JSONObject;
    .end local v2    # "attributelistJson":Lorg/json/JSONObject;
    .end local v5    # "value":Ljava/lang/String;
    :catch_0
    move-exception v3

    .line 2307
    .local v3, "e":Lorg/json/JSONException;
    invoke-virtual {v3}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    .line 2312
    .end local v3    # "e":Lorg/json/JSONException;
    .end local v4    # "getterKeyIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :cond_1
    return-object p1
.end method
