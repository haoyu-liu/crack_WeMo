.class public Lorg/cybergarage/upnp/ControlPoint;
.super Ljava/lang/Object;
.source "ControlPoint.java"

# interfaces
.implements Lorg/cybergarage/http/HTTPRequestListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/cybergarage/upnp/ControlPoint$ControlPointCleanupsRunnable;
    }
.end annotation


# static fields
.field private static final DEFAULT_EVENTSUB_PORT:I = 0x1f7a

.field private static final DEFAULT_EVENTSUB_URI:Ljava/lang/String; = "/evetSub"

.field private static final DEFAULT_EXPIRED_DEVICE_MONITORING_INTERVAL:I = 0x28

.field private static final DEFAULT_SSDP_PORT:I = 0x1f48

.field private static final TAG:Ljava/lang/String;

.field private static devNodeList:Lorg/cybergarage/xml/NodeList;

.field private static didMSearchFail:Z


# instance fields
.field deviceChangeListenerList:Lorg/cybergarage/util/ListenerList;

.field private deviceDisposer:Lorg/cybergarage/upnp/device/Disposer;

.field private deviceNotifyListenerList:Lorg/cybergarage/util/ListenerList;

.field private deviceSearchResponseListenerList:Lorg/cybergarage/util/ListenerList;

.field private eventListenerList:Lorg/cybergarage/util/ListenerList;

.field private eventSubURI:Ljava/lang/String;

.field private expiredDeviceMonitoringInterval:J

.field private httpPort:I

.field private httpServerList:Lorg/cybergarage/http/HTTPServerList;

.field private mSSID:Ljava/lang/String;

.field private mutex:Lorg/cybergarage/util/Mutex;

.field private nmprMode:Z

.field private renewSubscriber:Lorg/cybergarage/upnp/control/RenewSubscriber;

.field private searchMx:I

.field private ssdpNotifySocketList:Lorg/cybergarage/upnp/ssdp/SSDPNotifySocketList;

.field private ssdpPort:I

.field private ssdpSearchResponseSocketList:Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList;

.field private userData:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 119
    const/4 v0, 0x1

    sput-boolean v0, Lorg/cybergarage/upnp/ControlPoint;->didMSearchFail:Z

    .line 121
    const-class v0, Lorg/cybergarage/upnp/ControlPoint;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/cybergarage/upnp/ControlPoint;->TAG:Ljava/lang/String;

    .line 138
    const/4 v0, 0x0

    sput-object v0, Lorg/cybergarage/upnp/ControlPoint;->devNodeList:Lorg/cybergarage/xml/NodeList;

    .line 141
    new-instance v0, Lorg/cybergarage/xml/NodeList;

    invoke-direct {v0}, Lorg/cybergarage/xml/NodeList;-><init>()V

    sput-object v0, Lorg/cybergarage/upnp/ControlPoint;->devNodeList:Lorg/cybergarage/xml/NodeList;

    .line 171
    invoke-static {}, Lorg/cybergarage/upnp/UPnP;->initialize()V

    .line 172
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 203
    const/16 v0, 0x1f48

    const/16 v1, 0x1f7a

    invoke-direct {p0, v0, v1}, Lorg/cybergarage/upnp/ControlPoint;-><init>(II)V

    .line 204
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "ssdpPort"    # I
    .param p2, "httpPort"    # I

    .prologue
    .line 199
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/cybergarage/upnp/ControlPoint;-><init>(II[Ljava/net/InetAddress;)V

    .line 200
    return-void
.end method

.method public constructor <init>(II[Ljava/net/InetAddress;)V
    .locals 4
    .param p1, "ssdpPort"    # I
    .param p2, "httpPort"    # I
    .param p3, "binds"    # [Ljava/net/InetAddress;

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 178
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 137
    const-string v0, "/evetSub"

    iput-object v0, p0, Lorg/cybergarage/upnp/ControlPoint;->eventSubURI:Ljava/lang/String;

    .line 143
    new-instance v0, Lorg/cybergarage/util/ListenerList;

    invoke-direct {v0}, Lorg/cybergarage/util/ListenerList;-><init>()V

    iput-object v0, p0, Lorg/cybergarage/upnp/ControlPoint;->deviceChangeListenerList:Lorg/cybergarage/util/ListenerList;

    .line 146
    new-instance v0, Lorg/cybergarage/util/Mutex;

    invoke-direct {v0}, Lorg/cybergarage/util/Mutex;-><init>()V

    iput-object v0, p0, Lorg/cybergarage/upnp/ControlPoint;->mutex:Lorg/cybergarage/util/Mutex;

    .line 147
    iput v3, p0, Lorg/cybergarage/upnp/ControlPoint;->ssdpPort:I

    .line 148
    iput v3, p0, Lorg/cybergarage/upnp/ControlPoint;->httpPort:I

    .line 154
    new-instance v0, Lorg/cybergarage/util/ListenerList;

    invoke-direct {v0}, Lorg/cybergarage/util/ListenerList;-><init>()V

    iput-object v0, p0, Lorg/cybergarage/upnp/ControlPoint;->deviceNotifyListenerList:Lorg/cybergarage/util/ListenerList;

    .line 155
    new-instance v0, Lorg/cybergarage/util/ListenerList;

    invoke-direct {v0}, Lorg/cybergarage/util/ListenerList;-><init>()V

    iput-object v0, p0, Lorg/cybergarage/upnp/ControlPoint;->deviceSearchResponseListenerList:Lorg/cybergarage/util/ListenerList;

    .line 156
    const/4 v0, 0x2

    iput v0, p0, Lorg/cybergarage/upnp/ControlPoint;->searchMx:I

    .line 158
    new-instance v0, Lorg/cybergarage/http/HTTPServerList;

    invoke-direct {v0}, Lorg/cybergarage/http/HTTPServerList;-><init>()V

    iput-object v0, p0, Lorg/cybergarage/upnp/ControlPoint;->httpServerList:Lorg/cybergarage/http/HTTPServerList;

    .line 159
    new-instance v0, Lorg/cybergarage/util/ListenerList;

    invoke-direct {v0}, Lorg/cybergarage/util/ListenerList;-><init>()V

    iput-object v0, p0, Lorg/cybergarage/upnp/ControlPoint;->eventListenerList:Lorg/cybergarage/util/ListenerList;

    .line 166
    const-string v0, ""

    iput-object v0, p0, Lorg/cybergarage/upnp/ControlPoint;->mSSID:Ljava/lang/String;

    .line 168
    iput-object v2, p0, Lorg/cybergarage/upnp/ControlPoint;->userData:Ljava/lang/Object;

    .line 179
    new-instance v0, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocketList;

    invoke-direct {v0, p3}, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocketList;-><init>([Ljava/net/InetAddress;)V

    iput-object v0, p0, Lorg/cybergarage/upnp/ControlPoint;->ssdpNotifySocketList:Lorg/cybergarage/upnp/ssdp/SSDPNotifySocketList;

    .line 180
    new-instance v0, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList;

    invoke-direct {v0, p3}, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList;-><init>([Ljava/net/InetAddress;)V

    iput-object v0, p0, Lorg/cybergarage/upnp/ControlPoint;->ssdpSearchResponseSocketList:Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList;

    .line 182
    invoke-virtual {p0, p1}, Lorg/cybergarage/upnp/ControlPoint;->setSSDPPort(I)V

    .line 183
    invoke-virtual {p0, p2}, Lorg/cybergarage/upnp/ControlPoint;->setHTTPPort(I)V

    .line 185
    invoke-virtual {p0, v2}, Lorg/cybergarage/upnp/ControlPoint;->setDeviceDisposer(Lorg/cybergarage/upnp/device/Disposer;)V

    .line 186
    const-wide/16 v0, 0x28

    invoke-virtual {p0, v0, v1}, Lorg/cybergarage/upnp/ControlPoint;->setExpiredDeviceMonitoringInterval(J)V

    .line 188
    invoke-virtual {p0, v2}, Lorg/cybergarage/upnp/ControlPoint;->setRenewSubscriber(Lorg/cybergarage/upnp/control/RenewSubscriber;)V

    .line 190
    invoke-virtual {p0, v3}, Lorg/cybergarage/upnp/ControlPoint;->setNMPRMode(Z)V

    .line 191
    invoke-virtual {p0, v2}, Lorg/cybergarage/upnp/ControlPoint;->setRenewSubscriber(Lorg/cybergarage/upnp/control/RenewSubscriber;)V

    .line 193
    const/4 v0, 0x1

    invoke-static {v0}, Lorg/cybergarage/upnp/ControlPoint;->setMSearchFail(Z)V

    .line 195
    sget-object v0, Lorg/cybergarage/upnp/ControlPoint;->TAG:Ljava/lang/String;

    const-string v1, "Control point constructor"

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 196
    return-void
.end method

.method static synthetic access$000(Lorg/cybergarage/upnp/ControlPoint;)Lorg/cybergarage/upnp/ssdp/SSDPNotifySocketList;
    .locals 1
    .param p0, "x0"    # Lorg/cybergarage/upnp/ControlPoint;

    .prologue
    .line 115
    invoke-direct {p0}, Lorg/cybergarage/upnp/ControlPoint;->getSSDPNotifySocketList()Lorg/cybergarage/upnp/ssdp/SSDPNotifySocketList;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lorg/cybergarage/upnp/ControlPoint;)Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList;
    .locals 1
    .param p0, "x0"    # Lorg/cybergarage/upnp/ControlPoint;

    .prologue
    .line 115
    invoke-direct {p0}, Lorg/cybergarage/upnp/ControlPoint;->getSSDPSearchResponseSocketList()Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lorg/cybergarage/upnp/ControlPoint;)Lorg/cybergarage/http/HTTPServerList;
    .locals 1
    .param p0, "x0"    # Lorg/cybergarage/upnp/ControlPoint;

    .prologue
    .line 115
    invoke-direct {p0}, Lorg/cybergarage/upnp/ControlPoint;->getHTTPServerList()Lorg/cybergarage/http/HTTPServerList;

    move-result-object v0

    return-object v0
.end method

.method private addDevice(Lorg/cybergarage/upnp/ssdp/SSDPPacket;Z)V
    .locals 22
    .param p1, "ssdpPacket"    # Lorg/cybergarage/upnp/ssdp/SSDPPacket;
    .param p2, "notifyListeners"    # Z

    .prologue
    .line 306
    sget-object v19, Lorg/cybergarage/upnp/ControlPoint;->TAG:Ljava/lang/String;

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Get ssdpPacket: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {p1 .. p1}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "/n Notify Listeners: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 307
    invoke-virtual/range {p1 .. p1}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->isRootDevice()Z

    move-result v19

    if-nez v19, :cond_1

    .line 444
    :cond_0
    :goto_0
    return-void

    .line 310
    :cond_1
    invoke-virtual/range {p1 .. p1}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->getUSN()Ljava/lang/String;

    move-result-object v18

    .line 311
    .local v18, "usn":Ljava/lang/String;
    invoke-static/range {v18 .. v18}, Lorg/cybergarage/upnp/device/USN;->getUDN(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 312
    .local v17, "udn":Ljava/lang/String;
    sget-object v19, Lorg/cybergarage/upnp/ControlPoint;->TAG:Ljava/lang/String;

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Get UDN: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 314
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v3

    .line 315
    .local v3, "dev":Lorg/cybergarage/upnp/Device;
    if-eqz v3, :cond_4

    .line 316
    invoke-virtual {v3}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v4

    .line 317
    .local v4, "devType":Ljava/lang/String;
    sget-object v19, Lorg/cybergarage/upnp/ControlPoint;->TAG:Ljava/lang/String;

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "addDevice: device type on existing device: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 318
    const-string v19, "urn:Belkin:device:socket:1"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_2

    const-string v19, "urn:Belkin:device:sensor:1"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_2

    const-string v19, "urn:Belkin:device:controllee:1"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_2

    const-string v19, "urn:Belkin:device:NetCamSensor:1"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_2

    const-string v19, "urn:Belkin:device:LinksysWNCSensor:1"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_2

    const-string v19, "urn:Belkin:device:bridge:1"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_2

    const-string v19, "urn:Belkin:device:lightswitch:1"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_2

    const-string v19, "urn:Belkin:device:insight:1"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_2

    const-string v19, "urn:Belkin:device:AirPurifier:1"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_2

    const-string v19, "urn:Belkin:device:Maker:1"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_2

    const-string v19, "urn:Belkin:device:HeaterA:1"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_2

    const-string v19, "urn:Belkin:device:HeaterB:1"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_2

    const-string v19, "urn:Belkin:device:Humidifier:1"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_2

    const-string v19, "urn:Belkin:device:HumidifierB:1"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_2

    const-string v19, "urn:Belkin:device:CoffeeMaker:1"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_2

    const-string v19, "urn:Belkin:device:Crockpot:1"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_2

    const-string v19, "urn:Belkin:device:dimmer:1"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_0

    .line 335
    :cond_2
    sget-object v19, Lorg/cybergarage/upnp/ControlPoint;->TAG:Ljava/lang/String;

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Already available UDN = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, " ssdpPacket loc: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {p1 .. p1}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->getLocation()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, " isNotify: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {p1 .. p1}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->isNotify()Z

    move-result v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, " devhash: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 336
    move-object/from16 v0, p1

    invoke-virtual {v3, v0}, Lorg/cybergarage/upnp/Device;->setSSDPPacket(Lorg/cybergarage/upnp/ssdp/SSDPPacket;)V

    .line 337
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v3, v2}, Lorg/cybergarage/upnp/ControlPoint;->isLocationChange(Ljava/lang/String;Lorg/cybergarage/upnp/Device;Lorg/cybergarage/upnp/ssdp/SSDPPacket;)Z

    move-result v19

    if-eqz v19, :cond_3

    .line 338
    const/16 v19, 0x1

    move/from16 v0, v19

    invoke-virtual {v3, v0}, Lorg/cybergarage/upnp/Device;->setLocationChange(Z)V

    .line 342
    :goto_1
    if-eqz p2, :cond_0

    .line 344
    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lorg/cybergarage/upnp/ControlPoint;->performAddDeviceListener(Lorg/cybergarage/upnp/Device;)V

    goto/16 :goto_0

    .line 340
    :cond_3
    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-virtual {v3, v0}, Lorg/cybergarage/upnp/Device;->setLocationChange(Z)V

    goto :goto_1

    .line 350
    .end local v4    # "devType":Ljava/lang/String;
    :cond_4
    invoke-virtual/range {p1 .. p1}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->getLocation()Ljava/lang/String;

    move-result-object v8

    .line 352
    .local v8, "location":Ljava/lang/String;
    :try_start_0
    new-instance v9, Ljava/net/URL;

    invoke-direct {v9, v8}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 354
    .local v9, "locationUrl":Ljava/net/URL;
    sget-object v19, Lorg/cybergarage/upnp/ControlPoint;->TAG:Ljava/lang/String;

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Added UDN = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, " locationUrl: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 356
    invoke-static {}, Lorg/cybergarage/upnp/UPnP;->getXMLParser()Lorg/cybergarage/xml/Parser;

    move-result-object v11

    .line 361
    .local v11, "parser":Lorg/cybergarage/xml/Parser;
    const-string v19, "-"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v6

    .line 362
    .local v6, "ij1":I
    const-string v19, ":"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v7

    .line 364
    .local v7, "ij2":I
    const/16 v19, -0x1

    move/from16 v0, v19

    if-ne v7, v0, :cond_7

    .line 365
    add-int/lit8 v19, v6, 0x1

    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->length()I

    move-result v20

    move-object/from16 v0, v17

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v16

    .line 369
    .local v16, "serialNumber":Ljava/lang/String;
    :goto_2
    const/16 v19, 0x0

    invoke-static/range {v19 .. v19}, Lcom/belkin/wemo/storage/FileStorage;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/storage/FileStorage;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, v16

    invoke-virtual {v0, v9, v1}, Lcom/belkin/wemo/storage/FileStorage;->getDescriptionFile(Ljava/net/URL;Ljava/lang/String;)Ljava/io/File;

    move-result-object v5

    .line 370
    .local v5, "file":Ljava/io/File;
    invoke-virtual {v11, v5}, Lorg/cybergarage/xml/Parser;->parse(Ljava/io/File;)Lorg/cybergarage/xml/Node;

    move-result-object v15

    .line 371
    .local v15, "rootNode":Lorg/cybergarage/xml/Node;
    if-nez v15, :cond_5

    .line 372
    invoke-virtual {v11, v9}, Lorg/cybergarage/xml/Parser;->parse(Ljava/net/URL;)Lorg/cybergarage/xml/Node;

    move-result-object v15

    .line 376
    :cond_5
    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Lorg/cybergarage/xml/Node;)Lorg/cybergarage/upnp/Device;

    move-result-object v13

    .line 377
    .local v13, "rootDev":Lorg/cybergarage/upnp/Device;
    if-eqz v13, :cond_0

    .line 379
    invoke-virtual {v13}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v14

    .line 380
    .local v14, "rootDevType":Ljava/lang/String;
    sget-object v19, Lorg/cybergarage/upnp/ControlPoint;->TAG:Ljava/lang/String;

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "addDevice: device type on new device: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 381
    const-string v19, "urn:Belkin:device:socket:1"

    move-object/from16 v0, v19

    invoke-virtual {v14, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_6

    const-string v19, "urn:Belkin:device:sensor:1"

    move-object/from16 v0, v19

    invoke-virtual {v14, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_6

    const-string v19, "urn:Belkin:device:lightswitch:1"

    move-object/from16 v0, v19

    invoke-virtual {v14, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_6

    const-string v19, "urn:Belkin:device:controllee:1"

    move-object/from16 v0, v19

    invoke-virtual {v14, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_6

    const-string v19, "urn:Belkin:device:NetCamSensor:1"

    move-object/from16 v0, v19

    invoke-virtual {v14, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_6

    const-string v19, "urn:Belkin:device:LinksysWNCSensor:1"

    move-object/from16 v0, v19

    invoke-virtual {v14, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_6

    const-string v19, "urn:Belkin:device:bridge:1"

    move-object/from16 v0, v19

    invoke-virtual {v14, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_6

    const-string v19, "urn:Belkin:device:insight:1"

    move-object/from16 v0, v19

    invoke-virtual {v14, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_6

    const-string v19, "urn:Belkin:device:AirPurifier:1"

    move-object/from16 v0, v19

    invoke-virtual {v14, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_6

    const-string v19, "urn:Belkin:device:HeaterA:1"

    move-object/from16 v0, v19

    invoke-virtual {v14, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_6

    const-string v19, "urn:Belkin:device:HeaterB:1"

    move-object/from16 v0, v19

    invoke-virtual {v14, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_6

    const-string v19, "urn:Belkin:device:Humidifier:1"

    move-object/from16 v0, v19

    invoke-virtual {v14, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_6

    const-string v19, "urn:Belkin:device:HumidifierB:1"

    move-object/from16 v0, v19

    invoke-virtual {v14, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_6

    const-string v19, "urn:Belkin:device:Maker:1"

    move-object/from16 v0, v19

    invoke-virtual {v14, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_6

    const-string v19, "urn:Belkin:device:CoffeeMaker:1"

    move-object/from16 v0, v19

    invoke-virtual {v14, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_6

    const-string v19, "urn:Belkin:device:Crockpot:1"

    move-object/from16 v0, v19

    invoke-virtual {v14, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_6

    const-string v19, "urn:Belkin:device:dimmer:1"

    move-object/from16 v0, v19

    invoke-virtual {v14, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_0

    .line 419
    :cond_6
    move-object/from16 v0, p1

    invoke-virtual {v13, v0}, Lorg/cybergarage/upnp/Device;->setSSDPPacket(Lorg/cybergarage/upnp/ssdp/SSDPPacket;)V

    .line 420
    sget-object v19, Lorg/cybergarage/upnp/ControlPoint;->TAG:Ljava/lang/String;

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "New Device Added UDN = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 423
    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Lorg/cybergarage/upnp/ControlPoint;->addDevice(Lorg/cybergarage/upnp/Device;)Z

    move-result v19

    if-eqz v19, :cond_0

    .line 424
    if-eqz p2, :cond_0

    .line 425
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lorg/cybergarage/upnp/ControlPoint;->performAddDeviceListener(Lorg/cybergarage/upnp/Device;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/cybergarage/xml/ParserException; {:try_start_0 .. :try_end_0} :catch_1

    goto/16 :goto_0

    .line 437
    .end local v5    # "file":Ljava/io/File;
    .end local v6    # "ij1":I
    .end local v7    # "ij2":I
    .end local v9    # "locationUrl":Ljava/net/URL;
    .end local v11    # "parser":Lorg/cybergarage/xml/Parser;
    .end local v13    # "rootDev":Lorg/cybergarage/upnp/Device;
    .end local v14    # "rootDevType":Ljava/lang/String;
    .end local v15    # "rootNode":Lorg/cybergarage/xml/Node;
    .end local v16    # "serialNumber":Ljava/lang/String;
    :catch_0
    move-exception v10

    .line 438
    .local v10, "me":Ljava/net/MalformedURLException;
    invoke-virtual/range {p1 .. p1}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Lorg/cybergarage/util/Debug;->warning(Ljava/lang/String;)V

    .line 439
    invoke-static {v10}, Lorg/cybergarage/util/Debug;->warning(Ljava/lang/Exception;)V

    goto/16 :goto_0

    .line 367
    .end local v10    # "me":Ljava/net/MalformedURLException;
    .restart local v6    # "ij1":I
    .restart local v7    # "ij2":I
    .restart local v9    # "locationUrl":Ljava/net/URL;
    .restart local v11    # "parser":Lorg/cybergarage/xml/Parser;
    :cond_7
    add-int/lit8 v19, v6, 0x1

    :try_start_1
    move-object/from16 v0, v17

    move/from16 v1, v19

    invoke-virtual {v0, v1, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;
    :try_end_1
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lorg/cybergarage/xml/ParserException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v16

    .restart local v16    # "serialNumber":Ljava/lang/String;
    goto/16 :goto_2

    .line 440
    .end local v6    # "ij1":I
    .end local v7    # "ij2":I
    .end local v9    # "locationUrl":Ljava/net/URL;
    .end local v11    # "parser":Lorg/cybergarage/xml/Parser;
    .end local v16    # "serialNumber":Ljava/lang/String;
    :catch_1
    move-exception v12

    .line 441
    .local v12, "pe":Lorg/cybergarage/xml/ParserException;
    invoke-virtual/range {p1 .. p1}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Lorg/cybergarage/util/Debug;->warning(Ljava/lang/String;)V

    .line 442
    invoke-static {v12}, Lorg/cybergarage/util/Debug;->warning(Ljava/lang/Exception;)V

    goto/16 :goto_0
.end method

.method private addDevice(Lorg/cybergarage/xml/Node;)V
    .locals 2
    .param p1, "rootNode"    # Lorg/cybergarage/xml/Node;

    .prologue
    .line 278
    sget-object v0, Lorg/cybergarage/upnp/ControlPoint;->TAG:Ljava/lang/String;

    const-string v1, "device added"

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 279
    sget-object v0, Lorg/cybergarage/upnp/ControlPoint;->devNodeList:Lorg/cybergarage/xml/NodeList;

    invoke-virtual {v0, p1}, Lorg/cybergarage/xml/NodeList;->add(Ljava/lang/Object;)Z

    .line 280
    return-void
.end method

.method private addDevice(Lorg/cybergarage/upnp/Device;)Z
    .locals 2
    .param p1, "device"    # Lorg/cybergarage/upnp/Device;

    .prologue
    .line 286
    const/4 v0, 0x0

    .line 287
    .local v0, "isSuccessful":Z
    invoke-virtual {p1}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v1

    if-nez v1, :cond_0

    .line 288
    invoke-virtual {p1}, Lorg/cybergarage/upnp/Device;->getRootNode()Lorg/cybergarage/xml/Node;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/cybergarage/upnp/ControlPoint;->addDevice(Lorg/cybergarage/xml/Node;)V

    .line 289
    const/4 v0, 0x1

    .line 291
    :cond_0
    return v0
.end method

.method private cleanups()V
    .locals 7

    .prologue
    .line 1415
    new-instance v3, Ljava/util/concurrent/CountDownLatch;

    const/4 v4, 0x1

    invoke-direct {v3, v4}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 1417
    .local v3, "timeoutLatch":Ljava/util/concurrent/CountDownLatch;
    new-instance v0, Lorg/cybergarage/upnp/ControlPoint$ControlPointCleanupsRunnable;

    invoke-direct {v0, p0, v3}, Lorg/cybergarage/upnp/ControlPoint$ControlPointCleanupsRunnable;-><init>(Lorg/cybergarage/upnp/ControlPoint;Ljava/util/concurrent/CountDownLatch;)V

    .line 1418
    .local v0, "cleanupRunnable":Lcom/belkin/wemo/runnable/WeMoRunnable;
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v4

    invoke-virtual {v4, v0}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    .line 1421
    const-wide/16 v4, 0x7d0

    :try_start_0
    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v3, v4, v5, v6}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z

    move-result v2

    .line 1422
    .local v2, "isSuccess":Z
    sget-object v4, Lorg/cybergarage/upnp/ControlPoint;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Control Point cleanups completed in time: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1426
    .end local v2    # "isSuccess":Z
    :goto_0
    return-void

    .line 1423
    :catch_0
    move-exception v1

    .line 1424
    .local v1, "e":Ljava/lang/InterruptedException;
    sget-object v4, Lorg/cybergarage/upnp/ControlPoint;->TAG:Ljava/lang/String;

    const-string v5, "InterruptedException while cleaning up Control Point: "

    invoke-static {v4, v5, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0
.end method

.method public static declared-synchronized didMSearchFail()Z
    .locals 2

    .prologue
    .line 124
    const-class v0, Lorg/cybergarage/upnp/ControlPoint;

    monitor-enter v0

    :try_start_0
    sget-boolean v1, Lorg/cybergarage/upnp/ControlPoint;->didMSearchFail:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private getDevice(Lorg/cybergarage/xml/Node;)Lorg/cybergarage/upnp/Device;
    .locals 5
    .param p1, "rootNode"    # Lorg/cybergarage/xml/Node;

    .prologue
    const/4 v2, 0x0

    .line 447
    if-nez p1, :cond_1

    .line 457
    :cond_0
    :goto_0
    return-object v2

    .line 450
    :cond_1
    :try_start_0
    const-string v3, "device"

    invoke-virtual {p1, v3}, Lorg/cybergarage/xml/Node;->getNode(Ljava/lang/String;)Lorg/cybergarage/xml/Node;

    move-result-object v0

    .line 451
    .local v0, "devNode":Lorg/cybergarage/xml/Node;
    if-eqz v0, :cond_0

    .line 453
    new-instance v3, Lorg/cybergarage/upnp/Device;

    invoke-direct {v3, p1, v0}, Lorg/cybergarage/upnp/Device;-><init>(Lorg/cybergarage/xml/Node;Lorg/cybergarage/xml/Node;)V
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v2, v3

    goto :goto_0

    .line 454
    .end local v0    # "devNode":Lorg/cybergarage/xml/Node;
    :catch_0
    move-exception v1

    .line 455
    .local v1, "e":Ljava/lang/ArrayIndexOutOfBoundsException;
    sget-object v3, Lorg/cybergarage/upnp/ControlPoint;->TAG:Ljava/lang/String;

    const-string v4, "ArrayIndexOutOfBoundsException in getDevice: "

    invoke-static {v3, v4, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0
.end method

.method private getEventSubCallbackURL(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "host"    # Ljava/lang/String;

    .prologue
    .line 953
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ControlPoint;->getHTTPPort()I

    move-result v0

    invoke-virtual {p0}, Lorg/cybergarage/upnp/ControlPoint;->getEventSubURI()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lorg/cybergarage/net/HostInterface;->getHostURL(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getHTTPServerList()Lorg/cybergarage/http/HTTPServerList;
    .locals 1

    .prologue
    .line 760
    iget-object v0, p0, Lorg/cybergarage/upnp/ControlPoint;->httpServerList:Lorg/cybergarage/http/HTTPServerList;

    return-object v0
.end method

.method private getSSDPNotifySocketList()Lorg/cybergarage/upnp/ssdp/SSDPNotifySocketList;
    .locals 1

    .prologue
    .line 207
    iget-object v0, p0, Lorg/cybergarage/upnp/ControlPoint;->ssdpNotifySocketList:Lorg/cybergarage/upnp/ssdp/SSDPNotifySocketList;

    return-object v0
.end method

.method private getSSDPSearchResponseSocketList()Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList;
    .locals 1

    .prologue
    .line 210
    iget-object v0, p0, Lorg/cybergarage/upnp/ControlPoint;->ssdpSearchResponseSocketList:Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList;

    return-object v0
.end method

.method private isLocationChange(Ljava/lang/String;Lorg/cybergarage/upnp/Device;Lorg/cybergarage/upnp/ssdp/SSDPPacket;)Z
    .locals 5
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "dev"    # Lorg/cybergarage/upnp/Device;
    .param p3, "newSsdpPacket"    # Lorg/cybergarage/upnp/ssdp/SSDPPacket;

    .prologue
    .line 295
    invoke-virtual {p3}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->getLocation()Ljava/lang/String;

    move-result-object v0

    .line 296
    .local v0, "currentLocation":Ljava/lang/String;
    invoke-virtual {p2}, Lorg/cybergarage/upnp/Device;->getSSDPPacket()Lorg/cybergarage/upnp/ssdp/SSDPPacket;

    move-result-object v2

    invoke-virtual {v2}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->getLocation()Ljava/lang/String;

    move-result-object v1

    .line 297
    .local v1, "newLocation":Ljava/lang/String;
    sget-object v2, Lorg/cybergarage/upnp/ControlPoint;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "isLocationChanged; UDN: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "; currentLocation: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "; newLocation: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 299
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 301
    const/4 v2, 0x1

    .line 303
    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private removeDevice(Lorg/cybergarage/upnp/ssdp/SSDPPacket;)V
    .locals 5
    .param p1, "packet"    # Lorg/cybergarage/upnp/ssdp/SSDPPacket;

    .prologue
    .line 529
    invoke-virtual {p1}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->isByeBye()Z

    move-result v2

    if-nez v2, :cond_0

    .line 535
    :goto_0
    return-void

    .line 531
    :cond_0
    invoke-virtual {p1}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->getUSN()Ljava/lang/String;

    move-result-object v1

    .line 532
    .local v1, "usn":Ljava/lang/String;
    invoke-static {v1}, Lorg/cybergarage/upnp/device/USN;->getUDN(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 533
    .local v0, "udn":Ljava/lang/String;
    sget-object v2, Lorg/cybergarage/upnp/ControlPoint;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "removed UDN = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 534
    invoke-virtual {p0, v0}, Lorg/cybergarage/upnp/ControlPoint;->removeDevice(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private removeDevice(Lorg/cybergarage/xml/Node;)V
    .locals 3
    .param p1, "rootNode"    # Lorg/cybergarage/xml/Node;

    .prologue
    .line 508
    invoke-direct {p0, p1}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Lorg/cybergarage/xml/Node;)Lorg/cybergarage/upnp/Device;

    move-result-object v0

    .line 509
    .local v0, "dev":Lorg/cybergarage/upnp/Device;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/cybergarage/upnp/Device;->isRootDevice()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 510
    sget-object v1, Lorg/cybergarage/upnp/ControlPoint;->TAG:Ljava/lang/String;

    const-string v2, "calling performRemoveDeviceListener"

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 511
    invoke-virtual {p0, v0}, Lorg/cybergarage/upnp/ControlPoint;->performRemoveDeviceListener(Lorg/cybergarage/upnp/Device;)V

    .line 514
    :cond_0
    sget-object v1, Lorg/cybergarage/upnp/ControlPoint;->devNodeList:Lorg/cybergarage/xml/NodeList;

    invoke-virtual {v1, p1}, Lorg/cybergarage/xml/NodeList;->remove(Ljava/lang/Object;)Z

    .line 515
    return-void
.end method

.method public static declared-synchronized setMSearchFail(Z)V
    .locals 4
    .param p0, "didMSearchFail"    # Z

    .prologue
    .line 128
    const-class v1, Lorg/cybergarage/upnp/ControlPoint;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lorg/cybergarage/upnp/ControlPoint;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "CloudCache: Set Flag - didMSearchFail: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    sput-boolean p0, Lorg/cybergarage/upnp/ControlPoint;->didMSearchFail:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 130
    monitor-exit v1

    return-void

    .line 128
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public addDevice(Ljava/lang/String;)V
    .locals 5
    .param p1, "devStr"    # Ljava/lang/String;

    .prologue
    .line 1459
    sget-object v2, Lorg/cybergarage/upnp/ControlPoint;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " Device String : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1461
    :try_start_0
    new-instance v0, Lorg/cybergarage/upnp/Device;

    invoke-direct {v0}, Lorg/cybergarage/upnp/Device;-><init>()V

    .line 1462
    .local v0, "device":Lorg/cybergarage/upnp/Device;
    invoke-virtual {v0, p1}, Lorg/cybergarage/upnp/Device;->loadDescription(Ljava/lang/String;)Z

    .line 1463
    invoke-direct {p0, v0}, Lorg/cybergarage/upnp/ControlPoint;->addDevice(Lorg/cybergarage/upnp/Device;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1464
    invoke-virtual {p0, v0}, Lorg/cybergarage/upnp/ControlPoint;->performAddDeviceListener(Lorg/cybergarage/upnp/Device;)V
    :try_end_0
    .catch Lorg/cybergarage/upnp/device/InvalidDescriptionException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1469
    .end local v0    # "device":Lorg/cybergarage/upnp/Device;
    :cond_0
    :goto_0
    return-void

    .line 1466
    :catch_0
    move-exception v1

    .line 1467
    .local v1, "e":Lorg/cybergarage/upnp/device/InvalidDescriptionException;
    invoke-virtual {v1}, Lorg/cybergarage/upnp/device/InvalidDescriptionException;->printStackTrace()V

    goto :goto_0
.end method

.method public addDeviceChangeListener(Lorg/cybergarage/upnp/device/DeviceChangeListener;)V
    .locals 4
    .param p1, "listener"    # Lorg/cybergarage/upnp/device/DeviceChangeListener;

    .prologue
    .line 636
    iget-object v1, p0, Lorg/cybergarage/upnp/ControlPoint;->deviceChangeListenerList:Lorg/cybergarage/util/ListenerList;

    monitor-enter v1

    .line 637
    :try_start_0
    iget-object v0, p0, Lorg/cybergarage/upnp/ControlPoint;->deviceChangeListenerList:Lorg/cybergarage/util/ListenerList;

    invoke-virtual {v0, p1}, Lorg/cybergarage/util/ListenerList;->add(Ljava/lang/Object;)Z

    .line 638
    sget-object v0, Lorg/cybergarage/upnp/ControlPoint;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "addDeviceChangeListener: Listener added: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 639
    monitor-exit v1

    .line 640
    return-void

    .line 639
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public addEventListener(Lorg/cybergarage/upnp/event/EventListener;)V
    .locals 1
    .param p1, "listener"    # Lorg/cybergarage/upnp/event/EventListener;

    .prologue
    .line 920
    iget-object v0, p0, Lorg/cybergarage/upnp/ControlPoint;->eventListenerList:Lorg/cybergarage/util/ListenerList;

    invoke-virtual {v0, p1}, Lorg/cybergarage/util/ListenerList;->add(Ljava/lang/Object;)Z

    .line 921
    return-void
.end method

.method public addNotifyListener(Lorg/cybergarage/upnp/device/NotifyListener;)V
    .locals 1
    .param p1, "listener"    # Lorg/cybergarage/upnp/device/NotifyListener;

    .prologue
    .line 580
    iget-object v0, p0, Lorg/cybergarage/upnp/ControlPoint;->deviceNotifyListenerList:Lorg/cybergarage/util/ListenerList;

    invoke-virtual {v0, p1}, Lorg/cybergarage/util/ListenerList;->add(Ljava/lang/Object;)Z

    .line 581
    return-void
.end method

.method public addSearchResponseListener(Lorg/cybergarage/upnp/device/SearchResponseListener;)V
    .locals 1
    .param p1, "listener"    # Lorg/cybergarage/upnp/device/SearchResponseListener;

    .prologue
    .line 606
    iget-object v0, p0, Lorg/cybergarage/upnp/ControlPoint;->deviceSearchResponseListenerList:Lorg/cybergarage/util/ListenerList;

    invoke-virtual {v0, p1}, Lorg/cybergarage/util/ListenerList;->add(Ljava/lang/Object;)Z

    .line 607
    return-void
.end method

.method public finalizeCP()V
    .locals 2

    .prologue
    .line 214
    const-string v0, "Discovery"

    const-string v1, "finalizeCP"

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 215
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ControlPoint;->stop()Z

    .line 216
    sget-object v0, Lorg/cybergarage/upnp/ControlPoint;->devNodeList:Lorg/cybergarage/xml/NodeList;

    invoke-virtual {v0}, Lorg/cybergarage/xml/NodeList;->clear()V

    .line 217
    return-void
.end method

.method public forceClose()V
    .locals 1

    .prologue
    .line 1358
    sget-object v0, Lorg/cybergarage/upnp/ControlPoint;->devNodeList:Lorg/cybergarage/xml/NodeList;

    invoke-virtual {v0}, Lorg/cybergarage/xml/NodeList;->clear()V

    .line 1359
    invoke-direct {p0}, Lorg/cybergarage/upnp/ControlPoint;->cleanups()V

    .line 1360
    return-void
.end method

.method public getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;
    .locals 8
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 481
    :try_start_0
    sget-object v6, Lorg/cybergarage/upnp/ControlPoint;->devNodeList:Lorg/cybergarage/xml/NodeList;

    invoke-virtual {v6}, Lorg/cybergarage/xml/NodeList;->size()I

    move-result v4

    .line 482
    .local v4, "nRoots":I
    const/4 v3, 0x0

    .local v3, "n":I
    :goto_0
    if-ge v3, v4, :cond_3

    .line 483
    sget-object v6, Lorg/cybergarage/upnp/ControlPoint;->devNodeList:Lorg/cybergarage/xml/NodeList;

    invoke-virtual {v6, v3}, Lorg/cybergarage/xml/NodeList;->getNode(I)Lorg/cybergarage/xml/Node;

    move-result-object v5

    .line 484
    .local v5, "rootNode":Lorg/cybergarage/xml/Node;
    invoke-direct {p0, v5}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Lorg/cybergarage/xml/Node;)Lorg/cybergarage/upnp/Device;

    move-result-object v1

    .line 485
    .local v1, "dev":Lorg/cybergarage/upnp/Device;
    if-nez v1, :cond_1

    .line 482
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 487
    :cond_1
    invoke-virtual {v1, p1}, Lorg/cybergarage/upnp/Device;->isDevice(Ljava/lang/String;)Z

    move-result v6

    const/4 v7, 0x1

    if-ne v6, v7, :cond_2

    .line 496
    .end local v1    # "dev":Lorg/cybergarage/upnp/Device;
    .end local v3    # "n":I
    .end local v4    # "nRoots":I
    .end local v5    # "rootNode":Lorg/cybergarage/xml/Node;
    :goto_1
    return-object v1

    .line 489
    .restart local v1    # "dev":Lorg/cybergarage/upnp/Device;
    .restart local v3    # "n":I
    .restart local v4    # "nRoots":I
    .restart local v5    # "rootNode":Lorg/cybergarage/xml/Node;
    :cond_2
    invoke-virtual {v1, p1}, Lorg/cybergarage/upnp/Device;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 490
    .local v0, "cdev":Lorg/cybergarage/upnp/Device;
    if-eqz v0, :cond_0

    move-object v1, v0

    .line 491
    goto :goto_1

    .line 493
    .end local v0    # "cdev":Lorg/cybergarage/upnp/Device;
    .end local v1    # "dev":Lorg/cybergarage/upnp/Device;
    .end local v3    # "n":I
    .end local v4    # "nRoots":I
    .end local v5    # "rootNode":Lorg/cybergarage/xml/Node;
    :catch_0
    move-exception v2

    .line 494
    .local v2, "e":Ljava/lang/ArrayIndexOutOfBoundsException;
    sget-object v6, Lorg/cybergarage/upnp/ControlPoint;->TAG:Ljava/lang/String;

    const-string v7, "ArrayIndexOutOfBoundsException in getDevice: "

    invoke-static {v6, v7, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 496
    .end local v2    # "e":Ljava/lang/ArrayIndexOutOfBoundsException;
    :cond_3
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public getDeviceBySubscriber(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;
    .locals 5
    .param p1, "uuid"    # Ljava/lang/String;

    .prologue
    .line 1078
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v2

    .line 1079
    .local v2, "devList":Lorg/cybergarage/upnp/DeviceList;
    invoke-virtual {v2}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v1

    .line 1080
    .local v1, "devCnt":I
    const/4 v3, 0x0

    .local v3, "n":I
    :goto_0
    if-ge v3, v1, :cond_1

    .line 1081
    invoke-virtual {v2, v3}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v0

    .line 1082
    .local v0, "dev":Lorg/cybergarage/upnp/Device;
    invoke-virtual {v0, p1}, Lorg/cybergarage/upnp/Device;->getSubscriberService(Ljava/lang/String;)Lorg/cybergarage/upnp/Service;

    move-result-object v4

    .line 1083
    .local v4, "service":Lorg/cybergarage/upnp/Service;
    if-eqz v4, :cond_0

    if-eqz v0, :cond_0

    .line 1086
    .end local v0    # "dev":Lorg/cybergarage/upnp/Device;
    .end local v4    # "service":Lorg/cybergarage/upnp/Service;
    :goto_1
    return-object v0

    .line 1080
    .restart local v0    # "dev":Lorg/cybergarage/upnp/Device;
    .restart local v4    # "service":Lorg/cybergarage/upnp/Service;
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1086
    .end local v0    # "dev":Lorg/cybergarage/upnp/Device;
    .end local v4    # "service":Lorg/cybergarage/upnp/Service;
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public getDeviceDisposer()Lorg/cybergarage/upnp/device/Disposer;
    .locals 1

    .prologue
    .line 571
    iget-object v0, p0, Lorg/cybergarage/upnp/ControlPoint;->deviceDisposer:Lorg/cybergarage/upnp/device/Disposer;

    return-object v0
.end method

.method public getDeviceList()Lorg/cybergarage/upnp/DeviceList;
    .locals 7

    .prologue
    .line 462
    new-instance v1, Lorg/cybergarage/upnp/DeviceList;

    invoke-direct {v1}, Lorg/cybergarage/upnp/DeviceList;-><init>()V

    .line 463
    .local v1, "devList":Lorg/cybergarage/upnp/DeviceList;
    sget-object v6, Lorg/cybergarage/upnp/ControlPoint;->devNodeList:Lorg/cybergarage/xml/NodeList;

    invoke-virtual {v6}, Lorg/cybergarage/xml/NodeList;->size()I

    move-result v4

    .line 465
    .local v4, "nRoots":I
    const/4 v3, 0x0

    .local v3, "n":I
    :goto_0
    if-ge v3, v4, :cond_1

    .line 466
    :try_start_0
    sget-object v6, Lorg/cybergarage/upnp/ControlPoint;->devNodeList:Lorg/cybergarage/xml/NodeList;

    invoke-virtual {v6, v3}, Lorg/cybergarage/xml/NodeList;->getNode(I)Lorg/cybergarage/xml/Node;

    move-result-object v5

    .line 467
    .local v5, "rootNode":Lorg/cybergarage/xml/Node;
    invoke-direct {p0, v5}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Lorg/cybergarage/xml/Node;)Lorg/cybergarage/upnp/Device;

    move-result-object v0

    .line 468
    .local v0, "dev":Lorg/cybergarage/upnp/Device;
    if-nez v0, :cond_0

    .line 465
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 470
    :cond_0
    invoke-virtual {v1, v0}, Lorg/cybergarage/upnp/DeviceList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 472
    .end local v0    # "dev":Lorg/cybergarage/upnp/Device;
    .end local v5    # "rootNode":Lorg/cybergarage/xml/Node;
    :catch_0
    move-exception v2

    .line 473
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 476
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_1
    return-object v1
.end method

.method public getEventSubURI()Ljava/lang/String;
    .locals 1

    .prologue
    .line 945
    iget-object v0, p0, Lorg/cybergarage/upnp/ControlPoint;->eventSubURI:Ljava/lang/String;

    return-object v0
.end method

.method public getExpiredDeviceMonitoringInterval()J
    .locals 2

    .prologue
    .line 563
    iget-wide v0, p0, Lorg/cybergarage/upnp/ControlPoint;->expiredDeviceMonitoringInterval:J

    return-wide v0
.end method

.method public getHTTPPort()I
    .locals 1

    .prologue
    .line 251
    iget v0, p0, Lorg/cybergarage/upnp/ControlPoint;->httpPort:I

    return v0
.end method

.method public getRenewSubscriber()Lorg/cybergarage/upnp/control/RenewSubscriber;
    .locals 1

    .prologue
    .line 1132
    iget-object v0, p0, Lorg/cybergarage/upnp/ControlPoint;->renewSubscriber:Lorg/cybergarage/upnp/control/RenewSubscriber;

    return-object v0
.end method

.method public getSSDPPort()I
    .locals 1

    .prologue
    .line 238
    iget v0, p0, Lorg/cybergarage/upnp/ControlPoint;->ssdpPort:I

    return v0
.end method

.method public getSearchMx()I
    .locals 1

    .prologue
    .line 728
    iget v0, p0, Lorg/cybergarage/upnp/ControlPoint;->searchMx:I

    return v0
.end method

.method public getSubscriberService(Ljava/lang/String;)Lorg/cybergarage/upnp/Service;
    .locals 5
    .param p1, "uuid"    # Ljava/lang/String;

    .prologue
    .line 1059
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v2

    .line 1060
    .local v2, "devList":Lorg/cybergarage/upnp/DeviceList;
    invoke-virtual {v2}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v1

    .line 1061
    .local v1, "devCnt":I
    const/4 v3, 0x0

    .local v3, "n":I
    :goto_0
    if-ge v3, v1, :cond_1

    .line 1062
    invoke-virtual {v2, v3}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v0

    .line 1063
    .local v0, "dev":Lorg/cybergarage/upnp/Device;
    invoke-virtual {v0, p1}, Lorg/cybergarage/upnp/Device;->getSubscriberService(Ljava/lang/String;)Lorg/cybergarage/upnp/Service;

    move-result-object v4

    .line 1064
    .local v4, "service":Lorg/cybergarage/upnp/Service;
    if-eqz v4, :cond_0

    .line 1067
    .end local v0    # "dev":Lorg/cybergarage/upnp/Device;
    .end local v4    # "service":Lorg/cybergarage/upnp/Service;
    :goto_1
    return-object v4

    .line 1061
    .restart local v0    # "dev":Lorg/cybergarage/upnp/Device;
    .restart local v4    # "service":Lorg/cybergarage/upnp/Service;
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1067
    .end local v0    # "dev":Lorg/cybergarage/upnp/Device;
    .end local v4    # "service":Lorg/cybergarage/upnp/Service;
    :cond_1
    const/4 v4, 0x0

    goto :goto_1
.end method

.method public getUserData()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1429
    iget-object v0, p0, Lorg/cybergarage/upnp/ControlPoint;->userData:Ljava/lang/Object;

    return-object v0
.end method

.method public hasDevice(Ljava/lang/String;)Z
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 500
    invoke-virtual {p0, p1}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public httpRequestRecieved(Lorg/cybergarage/http/HTTPRequest;)V
    .locals 41
    .param p1, "httpReq"    # Lorg/cybergarage/http/HTTPRequest;

    .prologue
    .line 764
    invoke-static {}, Lorg/cybergarage/util/Debug;->isOn()Z

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 765
    invoke-virtual/range {p1 .. p1}, Lorg/cybergarage/http/HTTPRequest;->print()V

    .line 768
    :cond_0
    invoke-virtual/range {p1 .. p1}, Lorg/cybergarage/http/HTTPRequest;->isNotifyRequest()Z

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_a

    .line 769
    new-instance v30, Lorg/cybergarage/upnp/event/NotifyRequest;

    move-object/from16 v0, v30

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Lorg/cybergarage/upnp/event/NotifyRequest;-><init>(Lorg/cybergarage/http/HTTPRequest;)V

    .line 770
    .local v30, "notifyReq":Lorg/cybergarage/upnp/event/NotifyRequest;
    const/4 v5, 0x0

    .local v5, "deviceId":Ljava/lang/String;
    const/16 v17, 0x0

    .local v17, "value":Ljava/lang/String;
    const/4 v10, 0x0

    .local v10, "capabilityId":Ljava/lang/String;
    const/16 v26, 0x0

    .local v26, "eventType":Ljava/lang/String;
    const/4 v2, 0x0

    .line 771
    .local v2, "availability":Ljava/lang/String;
    const/16 v32, 0x0

    .line 773
    .local v32, "propCnt":I
    sget-object v3, Lorg/cybergarage/upnp/ControlPoint;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "http Request received notifications: "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {v30 .. v30}, Lorg/cybergarage/upnp/event/NotifyRequest;->getContentString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 774
    invoke-virtual/range {v30 .. v30}, Lorg/cybergarage/upnp/event/NotifyRequest;->getContentString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "StateEvent"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 775
    invoke-virtual/range {v30 .. v30}, Lorg/cybergarage/upnp/event/NotifyRequest;->getContentString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "</StatusChange>"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 791
    sget-object v3, Lorg/cybergarage/upnp/ControlPoint;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "notifyReq.getContentString() : "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {v30 .. v30}, Lorg/cybergarage/upnp/event/NotifyRequest;->getContentString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 792
    invoke-virtual/range {v30 .. v30}, Lorg/cybergarage/upnp/event/NotifyRequest;->getContentString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "<StatusChange>"

    const/4 v6, -0x1

    invoke-virtual {v3, v4, v6}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v39

    .line 793
    .local v39, "substring":[Ljava/lang/String;
    const/4 v3, 0x1

    aget-object v3, v39, v3

    const-string v4, "</StatusChange>"

    const/4 v6, -0x1

    invoke-virtual {v3, v4, v6}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v37

    .line 794
    .local v37, "sub":[Ljava/lang/String;
    const/4 v3, 0x0

    aget-object v3, v37, v3

    const-string v4, "StateEvent"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 795
    new-instance v35, Lorg/json/JSONArray;

    invoke-direct/range {v35 .. v35}, Lorg/json/JSONArray;-><init>()V

    .line 796
    .local v35, "statusChange":Lorg/json/JSONArray;
    const/4 v3, 0x0

    const/4 v4, 0x0

    aget-object v4, v37, v4

    const-string v6, "&lt;"

    const-string v7, "<"

    invoke-virtual {v4, v6, v7}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v37, v3

    .line 797
    const/4 v3, 0x0

    const/4 v4, 0x0

    aget-object v4, v37, v4

    const-string v6, "&gt;"

    const-string v7, ">"

    invoke-virtual {v4, v6, v7}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v37, v3

    .line 798
    const/4 v3, 0x0

    const/4 v4, 0x0

    aget-object v4, v37, v4

    const-string v6, "&amp;"

    const-string v7, "&"

    invoke-virtual {v4, v6, v7}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v37, v3

    .line 799
    const/4 v3, 0x0

    const/4 v4, 0x0

    aget-object v4, v37, v4

    const-string v6, "&quot;"

    const-string v7, "\""

    invoke-virtual {v4, v6, v7}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v37, v3

    .line 800
    sget-object v3, Lorg/cybergarage/upnp/ControlPoint;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Contains state event replaces: "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v6, 0x0

    aget-object v6, v37, v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 801
    const/4 v3, 0x0

    aget-object v3, v37, v3

    const-string v4, "DeviceIDavailable="

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 802
    const/4 v3, 0x0

    const/4 v4, 0x0

    aget-object v4, v37, v4

    const-string v6, "DeviceIDavailable="

    const-string v7, "DeviceID available="

    invoke-virtual {v4, v6, v7}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v37, v3

    .line 804
    :cond_1
    sget-object v3, Lorg/cybergarage/upnp/ControlPoint;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Contains state event: "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v6, 0x0

    aget-object v6, v37, v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 805
    new-instance v29, Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;

    invoke-direct/range {v29 .. v29}, Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;-><init>()V

    .line 806
    .local v29, "notify":Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;
    const/4 v3, 0x0

    aget-object v3, v37, v3

    move-object/from16 v0, v29

    invoke-virtual {v0, v3}, Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;->parseNotifyStatusResponse(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v35

    .line 808
    const/4 v3, 0x0

    :try_start_0
    move-object/from16 v0, v35

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    sget-object v4, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->NOTIFY_DEVICE_ID:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 809
    const/4 v3, 0x0

    move-object/from16 v0, v35

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    sget-object v4, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->NOTIFY_VALUE:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 810
    const/4 v3, 0x0

    move-object/from16 v0, v35

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    sget-object v4, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->NOTIFY_CAPABILITY_ID:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 811
    const/4 v3, 0x0

    move-object/from16 v0, v35

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "Availability"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 815
    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v17

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "::"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "::"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 816
    .local v9, "state":Ljava/lang/String;
    invoke-virtual/range {v30 .. v30}, Lorg/cybergarage/upnp/event/NotifyRequest;->getSID()Ljava/lang/String;

    move-result-object v4

    invoke-virtual/range {v30 .. v30}, Lorg/cybergarage/upnp/event/NotifyRequest;->getSEQ()J

    move-result-wide v6

    const-string v8, "StatusChange"

    move-object/from16 v3, p0

    invoke-virtual/range {v3 .. v9}, Lorg/cybergarage/upnp/ControlPoint;->performEventListener(Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;)V

    .line 823
    .end local v9    # "state":Ljava/lang/String;
    .end local v29    # "notify":Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;
    .end local v35    # "statusChange":Lorg/json/JSONArray;
    .end local v37    # "sub":[Ljava/lang/String;
    .end local v39    # "substring":[Ljava/lang/String;
    :cond_2
    :goto_1
    invoke-virtual/range {v30 .. v30}, Lorg/cybergarage/upnp/event/NotifyRequest;->getContentString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "</SubDeviceFWUpdate>"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 824
    invoke-virtual/range {v30 .. v30}, Lorg/cybergarage/upnp/event/NotifyRequest;->getContentString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "<SubDeviceFWUpdate>"

    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v40

    .line 825
    .local v40, "substring1":[Ljava/lang/String;
    const/4 v3, 0x1

    aget-object v3, v40, v3

    const-string v4, "</SubDeviceFWUpdate>"

    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v38

    .line 826
    .local v38, "sub1":[Ljava/lang/String;
    const/4 v3, 0x0

    aget-object v3, v38, v3

    const-string v4, "StateEvent"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 827
    new-instance v27, Lorg/json/JSONArray;

    invoke-direct/range {v27 .. v27}, Lorg/json/JSONArray;-><init>()V

    .line 828
    .local v27, "firmwareNotification":Lorg/json/JSONArray;
    const/4 v3, 0x0

    const/4 v4, 0x0

    aget-object v4, v38, v4

    const-string v6, "&lt;"

    const-string v7, "<"

    invoke-virtual {v4, v6, v7}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v38, v3

    .line 829
    const/4 v3, 0x0

    const/4 v4, 0x0

    aget-object v4, v38, v4

    const-string v6, "&gt;"

    const-string v7, ">"

    invoke-virtual {v4, v6, v7}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v38, v3

    .line 830
    const/4 v3, 0x0

    const/4 v4, 0x0

    aget-object v4, v38, v4

    const-string v6, "&amp;"

    const-string v7, "&"

    invoke-virtual {v4, v6, v7}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v38, v3

    .line 831
    const/4 v3, 0x0

    const/4 v4, 0x0

    aget-object v4, v38, v4

    const-string v6, "&quot;"

    const-string v7, "\""

    invoke-virtual {v4, v6, v7}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v38, v3

    .line 833
    new-instance v29, Lorg/cybergarage/xml/parser/GetNotifyStatusFirmwareParser;

    invoke-direct/range {v29 .. v29}, Lorg/cybergarage/xml/parser/GetNotifyStatusFirmwareParser;-><init>()V

    .line 834
    .local v29, "notify":Lorg/cybergarage/xml/parser/GetNotifyStatusFirmwareParser;
    const/4 v3, 0x0

    aget-object v3, v38, v3

    move-object/from16 v0, v29

    invoke-virtual {v0, v3}, Lorg/cybergarage/xml/parser/GetNotifyStatusFirmwareParser;->parseNotifyStatusResponse(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v27

    .line 836
    const/4 v3, 0x0

    :try_start_1
    move-object/from16 v0, v27

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    sget-object v4, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->NOTIFY_DEVICE_ID:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 837
    const/4 v3, 0x0

    move-object/from16 v0, v27

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    sget-object v4, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->NOTIFY_VALUE:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 838
    const/4 v3, 0x0

    move-object/from16 v0, v27

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    sget-object v4, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->NOTIFY_TYPE:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v26

    .line 842
    :goto_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "::"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v26

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "::"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 843
    .local v13, "deviceIdType":Ljava/lang/String;
    invoke-virtual/range {v30 .. v30}, Lorg/cybergarage/upnp/event/NotifyRequest;->getSID()Ljava/lang/String;

    move-result-object v12

    invoke-virtual/range {v30 .. v30}, Lorg/cybergarage/upnp/event/NotifyRequest;->getSEQ()J

    move-result-wide v14

    const-string v16, "SubDeviceFWUpdate"

    move-object/from16 v11, p0

    invoke-virtual/range {v11 .. v17}, Lorg/cybergarage/upnp/ControlPoint;->performEventListener(Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;)V

    .line 847
    .end local v13    # "deviceIdType":Ljava/lang/String;
    .end local v27    # "firmwareNotification":Lorg/json/JSONArray;
    .end local v29    # "notify":Lorg/cybergarage/xml/parser/GetNotifyStatusFirmwareParser;
    .end local v38    # "sub1":[Ljava/lang/String;
    .end local v40    # "substring1":[Ljava/lang/String;
    :cond_3
    invoke-virtual/range {v30 .. v30}, Lorg/cybergarage/upnp/event/NotifyRequest;->getContentString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "</SensorChange>"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 849
    const-string v36, ""

    .line 850
    .local v36, "statusTimeStamp":Ljava/lang/String;
    const-string v3, "notifyReq.getContentString()"

    invoke-virtual/range {v30 .. v30}, Lorg/cybergarage/upnp/event/NotifyRequest;->getContentString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 851
    invoke-virtual/range {v30 .. v30}, Lorg/cybergarage/upnp/event/NotifyRequest;->getContentString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "<SensorChange>"

    const/4 v6, -0x1

    invoke-virtual {v3, v4, v6}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v39

    .line 852
    .restart local v39    # "substring":[Ljava/lang/String;
    const/4 v3, 0x1

    aget-object v3, v39, v3

    const-string v4, "</SensorChange>"

    const/4 v6, -0x1

    invoke-virtual {v3, v4, v6}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v37

    .line 853
    .restart local v37    # "sub":[Ljava/lang/String;
    const/4 v3, 0x0

    aget-object v3, v37, v3

    const-string v4, "StateEvent"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 854
    new-instance v34, Lorg/json/JSONArray;

    invoke-direct/range {v34 .. v34}, Lorg/json/JSONArray;-><init>()V

    .line 855
    .local v34, "sensorChange":Lorg/json/JSONArray;
    const/4 v3, 0x0

    const/4 v4, 0x0

    aget-object v4, v37, v4

    const-string v6, "&lt;"

    const-string v7, "<"

    invoke-virtual {v4, v6, v7}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v37, v3

    .line 856
    const/4 v3, 0x0

    const/4 v4, 0x0

    aget-object v4, v37, v4

    const-string v6, "&gt;"

    const-string v7, ">"

    invoke-virtual {v4, v6, v7}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v37, v3

    .line 857
    const/4 v3, 0x0

    const/4 v4, 0x0

    aget-object v4, v37, v4

    const-string v6, "&amp;"

    const-string v7, "&"

    invoke-virtual {v4, v6, v7}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v37, v3

    .line 858
    const/4 v3, 0x0

    const/4 v4, 0x0

    aget-object v4, v37, v4

    const-string v6, "&quot;"

    const-string v7, "\""

    invoke-virtual {v4, v6, v7}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v37, v3

    .line 859
    const-string v3, "XML"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Contains state event replaces: "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v6, 0x0

    aget-object v6, v37, v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 860
    const/4 v3, 0x0

    aget-object v3, v37, v3

    const-string v4, "DeviceIDavailable="

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 861
    const/4 v3, 0x0

    const/4 v4, 0x0

    aget-object v4, v37, v4

    const-string v6, "DeviceIDavailable="

    const-string v7, "DeviceID available="

    invoke-virtual {v4, v6, v7}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v37, v3

    .line 863
    :cond_4
    const-string v3, "XML"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Contains state event: "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v6, 0x0

    aget-object v6, v37, v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 864
    new-instance v29, Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;

    invoke-direct/range {v29 .. v29}, Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;-><init>()V

    .line 865
    .local v29, "notify":Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;
    const/4 v3, 0x0

    aget-object v3, v37, v3

    move-object/from16 v0, v29

    invoke-virtual {v0, v3}, Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;->parseNotifyStatusResponse(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v34

    .line 867
    const/4 v3, 0x0

    :try_start_2
    move-object/from16 v0, v34

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    sget-object v4, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->NOTIFY_DEVICE_ID:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 868
    const/4 v3, 0x0

    move-object/from16 v0, v34

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    sget-object v4, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->NOTIFY_VALUE:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 869
    const/4 v3, 0x0

    move-object/from16 v0, v34

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    sget-object v4, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->NOTIFY_CAPABILITY_ID:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 870
    const/4 v3, 0x0

    move-object/from16 v0, v34

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "Availability"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 871
    const/4 v3, 0x0

    move-object/from16 v0, v34

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "statusTS"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_2

    move-result-object v36

    .line 875
    :goto_3
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v17

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "::"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "::"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "::"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v36

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 876
    .restart local v9    # "state":Ljava/lang/String;
    const-string v3, "state: "

    invoke-static {v3, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 877
    invoke-virtual/range {v30 .. v30}, Lorg/cybergarage/upnp/event/NotifyRequest;->getSID()Ljava/lang/String;

    move-result-object v4

    invoke-virtual/range {v30 .. v30}, Lorg/cybergarage/upnp/event/NotifyRequest;->getSEQ()J

    move-result-wide v6

    const-string v8, "SensorChange"

    move-object/from16 v3, p0

    invoke-virtual/range {v3 .. v9}, Lorg/cybergarage/upnp/ControlPoint;->performEventListener(Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;)V

    .line 902
    .end local v9    # "state":Ljava/lang/String;
    .end local v29    # "notify":Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;
    .end local v34    # "sensorChange":Lorg/json/JSONArray;
    .end local v36    # "statusTimeStamp":Ljava/lang/String;
    .end local v37    # "sub":[Ljava/lang/String;
    .end local v39    # "substring":[Ljava/lang/String;
    :cond_5
    if-eqz v32, :cond_9

    .line 903
    invoke-virtual/range {p1 .. p1}, Lorg/cybergarage/http/HTTPRequest;->returnOK()Z

    .line 912
    .end local v2    # "availability":Ljava/lang/String;
    .end local v5    # "deviceId":Ljava/lang/String;
    .end local v10    # "capabilityId":Ljava/lang/String;
    .end local v17    # "value":Ljava/lang/String;
    .end local v26    # "eventType":Ljava/lang/String;
    .end local v30    # "notifyReq":Lorg/cybergarage/upnp/event/NotifyRequest;
    .end local v32    # "propCnt":I
    :goto_4
    return-void

    .line 812
    .restart local v2    # "availability":Ljava/lang/String;
    .restart local v5    # "deviceId":Ljava/lang/String;
    .restart local v10    # "capabilityId":Ljava/lang/String;
    .restart local v17    # "value":Ljava/lang/String;
    .restart local v26    # "eventType":Ljava/lang/String;
    .restart local v29    # "notify":Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;
    .restart local v30    # "notifyReq":Lorg/cybergarage/upnp/event/NotifyRequest;
    .restart local v32    # "propCnt":I
    .restart local v35    # "statusChange":Lorg/json/JSONArray;
    .restart local v37    # "sub":[Ljava/lang/String;
    .restart local v39    # "substring":[Ljava/lang/String;
    :catch_0
    move-exception v18

    .line 813
    .local v18, "e":Lorg/json/JSONException;
    invoke-virtual/range {v18 .. v18}, Lorg/json/JSONException;->printStackTrace()V

    goto/16 :goto_0

    .line 820
    .end local v18    # "e":Lorg/json/JSONException;
    .end local v29    # "notify":Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;
    .end local v35    # "statusChange":Lorg/json/JSONArray;
    .end local v37    # "sub":[Ljava/lang/String;
    .end local v39    # "substring":[Ljava/lang/String;
    :cond_6
    sget-object v3, Lorg/cybergarage/upnp/ControlPoint;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Contains state event replaces: in else:  "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {v30 .. v30}, Lorg/cybergarage/upnp/event/NotifyRequest;->getContentString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 839
    .restart local v27    # "firmwareNotification":Lorg/json/JSONArray;
    .local v29, "notify":Lorg/cybergarage/xml/parser/GetNotifyStatusFirmwareParser;
    .restart local v38    # "sub1":[Ljava/lang/String;
    .restart local v40    # "substring1":[Ljava/lang/String;
    :catch_1
    move-exception v18

    .line 840
    .restart local v18    # "e":Lorg/json/JSONException;
    invoke-virtual/range {v18 .. v18}, Lorg/json/JSONException;->printStackTrace()V

    goto/16 :goto_2

    .line 872
    .end local v18    # "e":Lorg/json/JSONException;
    .end local v27    # "firmwareNotification":Lorg/json/JSONArray;
    .end local v38    # "sub1":[Ljava/lang/String;
    .end local v40    # "substring1":[Ljava/lang/String;
    .local v29, "notify":Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;
    .restart local v34    # "sensorChange":Lorg/json/JSONArray;
    .restart local v36    # "statusTimeStamp":Ljava/lang/String;
    .restart local v37    # "sub":[Ljava/lang/String;
    .restart local v39    # "substring":[Ljava/lang/String;
    :catch_2
    move-exception v18

    .line 873
    .restart local v18    # "e":Lorg/json/JSONException;
    const-string v3, "XML"

    const-string v4, "JSONException in getting values for sensorChange"

    move-object/from16 v0, v18

    invoke-static {v3, v4, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_3

    .line 885
    .end local v18    # "e":Lorg/json/JSONException;
    .end local v29    # "notify":Lorg/cybergarage/xml/parser/GetNotifyStatusResponseParser;
    .end local v34    # "sensorChange":Lorg/json/JSONArray;
    .end local v36    # "statusTimeStamp":Ljava/lang/String;
    .end local v37    # "sub":[Ljava/lang/String;
    .end local v39    # "substring":[Ljava/lang/String;
    :cond_7
    invoke-virtual/range {v30 .. v30}, Lorg/cybergarage/upnp/event/NotifyRequest;->getSID()Ljava/lang/String;

    move-result-object v20

    .line 886
    .local v20, "uuid":Ljava/lang/String;
    invoke-virtual/range {v30 .. v30}, Lorg/cybergarage/upnp/event/NotifyRequest;->getSEQ()J

    move-result-wide v22

    .line 887
    .local v22, "seq":J
    invoke-virtual/range {v30 .. v30}, Lorg/cybergarage/upnp/event/NotifyRequest;->getPropertyList()Lorg/cybergarage/upnp/event/PropertyList;

    move-result-object v33

    .line 890
    .local v33, "props":Lorg/cybergarage/upnp/event/PropertyList;
    if-eqz v33, :cond_8

    .line 891
    invoke-virtual/range {v33 .. v33}, Lorg/cybergarage/upnp/event/PropertyList;->size()I

    move-result v32

    .line 893
    :cond_8
    const/16 v28, 0x0

    .local v28, "n":I
    :goto_5
    move/from16 v0, v28

    move/from16 v1, v32

    if-ge v0, v1, :cond_5

    .line 894
    move-object/from16 v0, v33

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Lorg/cybergarage/upnp/event/PropertyList;->getProperty(I)Lorg/cybergarage/upnp/event/Property;

    move-result-object v31

    .line 895
    .local v31, "prop":Lorg/cybergarage/upnp/event/Property;
    invoke-virtual/range {v31 .. v31}, Lorg/cybergarage/upnp/event/Property;->getName()Ljava/lang/String;

    move-result-object v24

    .line 896
    .local v24, "varName":Ljava/lang/String;
    invoke-virtual/range {v31 .. v31}, Lorg/cybergarage/upnp/event/Property;->getValue()Ljava/lang/String;

    move-result-object v25

    .local v25, "varValue":Ljava/lang/String;
    move-object/from16 v19, p0

    move-object/from16 v21, v20

    .line 897
    invoke-virtual/range {v19 .. v25}, Lorg/cybergarage/upnp/ControlPoint;->performEventListener(Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;)V

    .line 893
    add-int/lit8 v28, v28, 0x1

    goto :goto_5

    .line 905
    .end local v20    # "uuid":Ljava/lang/String;
    .end local v22    # "seq":J
    .end local v24    # "varName":Ljava/lang/String;
    .end local v25    # "varValue":Ljava/lang/String;
    .end local v28    # "n":I
    .end local v31    # "prop":Lorg/cybergarage/upnp/event/Property;
    .end local v33    # "props":Lorg/cybergarage/upnp/event/PropertyList;
    :cond_9
    invoke-virtual/range {p1 .. p1}, Lorg/cybergarage/http/HTTPRequest;->returnBadRequest()Z

    goto :goto_4

    .line 911
    .end local v2    # "availability":Ljava/lang/String;
    .end local v5    # "deviceId":Ljava/lang/String;
    .end local v10    # "capabilityId":Ljava/lang/String;
    .end local v17    # "value":Ljava/lang/String;
    .end local v26    # "eventType":Ljava/lang/String;
    .end local v30    # "notifyReq":Lorg/cybergarage/upnp/event/NotifyRequest;
    .end local v32    # "propCnt":I
    :cond_a
    invoke-virtual/range {p1 .. p1}, Lorg/cybergarage/http/HTTPRequest;->returnBadRequest()Z

    goto :goto_4
.end method

.method public isNMPRMode()Z
    .locals 1

    .prologue
    .line 265
    iget-boolean v0, p0, Lorg/cybergarage/upnp/ControlPoint;->nmprMode:Z

    return v0
.end method

.method public isSubscribed(Lorg/cybergarage/upnp/Service;)Z
    .locals 1
    .param p1, "service"    # Lorg/cybergarage/upnp/Service;

    .prologue
    .line 1010
    if-nez p1, :cond_0

    .line 1011
    const/4 v0, 0x0

    .line 1012
    :goto_0
    return v0

    :cond_0
    invoke-virtual {p1}, Lorg/cybergarage/upnp/Service;->isSubscribed()Z

    move-result v0

    goto :goto_0
.end method

.method public lock()V
    .locals 1

    .prologue
    .line 225
    iget-object v0, p0, Lorg/cybergarage/upnp/ControlPoint;->mutex:Lorg/cybergarage/util/Mutex;

    invoke-virtual {v0}, Lorg/cybergarage/util/Mutex;->lock()V

    .line 226
    return-void
.end method

.method public notifyReceived(Lorg/cybergarage/upnp/ssdp/SSDPPacket;)V
    .locals 2
    .param p1, "packet"    # Lorg/cybergarage/upnp/ssdp/SSDPPacket;

    .prologue
    const/4 v1, 0x1

    .line 688
    invoke-virtual {p1}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->isRootDevice()Z

    move-result v0

    if-ne v0, v1, :cond_0

    .line 690
    invoke-virtual {p1}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->isAlive()Z

    move-result v0

    if-ne v0, v1, :cond_1

    .line 691
    invoke-virtual {p1, v1}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->setNotify(Z)V

    .line 692
    invoke-direct {p0, p1, v1}, Lorg/cybergarage/upnp/ControlPoint;->addDevice(Lorg/cybergarage/upnp/ssdp/SSDPPacket;Z)V

    .line 697
    :cond_0
    :goto_0
    invoke-virtual {p0, p1}, Lorg/cybergarage/upnp/ControlPoint;->performNotifyListener(Lorg/cybergarage/upnp/ssdp/SSDPPacket;)V

    .line 698
    return-void

    .line 693
    :cond_1
    invoke-virtual {p1}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->isByeBye()Z

    move-result v0

    if-ne v0, v1, :cond_0

    .line 694
    invoke-direct {p0, p1}, Lorg/cybergarage/upnp/ControlPoint;->removeDevice(Lorg/cybergarage/upnp/ssdp/SSDPPacket;)V

    goto :goto_0
.end method

.method public performAddDeviceListener(Lorg/cybergarage/upnp/Device;)V
    .locals 8
    .param p1, "dev"    # Lorg/cybergarage/upnp/Device;

    .prologue
    .line 650
    sget-object v4, Lorg/cybergarage/upnp/ControlPoint;->TAG:Ljava/lang/String;

    const-string v5, "start calling the added listener##########"

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 651
    iget-object v5, p0, Lorg/cybergarage/upnp/ControlPoint;->deviceChangeListenerList:Lorg/cybergarage/util/ListenerList;

    monitor-enter v5

    .line 652
    :try_start_0
    iget-object v4, p0, Lorg/cybergarage/upnp/ControlPoint;->deviceChangeListenerList:Lorg/cybergarage/util/ListenerList;

    invoke-virtual {v4}, Lorg/cybergarage/util/ListenerList;->size()I

    move-result v2

    .line 653
    .local v2, "listenerSize":I
    sget-object v4, Lorg/cybergarage/upnp/ControlPoint;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "performAddDeviceListener: deviceChangeListenerList size: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 654
    const/4 v3, 0x0

    .local v3, "n":I
    :goto_0
    if-ge v3, v2, :cond_0

    .line 655
    iget-object v4, p0, Lorg/cybergarage/upnp/ControlPoint;->deviceChangeListenerList:Lorg/cybergarage/util/ListenerList;

    invoke-virtual {v4, v3}, Lorg/cybergarage/util/ListenerList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/cybergarage/upnp/device/DeviceChangeListener;

    .line 657
    .local v1, "listener":Lorg/cybergarage/upnp/device/DeviceChangeListener;
    sget-object v4, Lorg/cybergarage/upnp/ControlPoint;->TAG:Ljava/lang/String;

    const-string v6, "calling the added listener##########"

    invoke-static {v4, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 659
    :try_start_1
    sget-object v4, Lorg/cybergarage/upnp/ControlPoint;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "performAddDeviceListener: calling listener: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 660
    invoke-interface {v1, p1}, Lorg/cybergarage/upnp/device/DeviceChangeListener;->deviceAdded(Lorg/cybergarage/upnp/Device;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 665
    :goto_1
    :try_start_2
    sget-object v4, Lorg/cybergarage/upnp/ControlPoint;->TAG:Ljava/lang/String;

    const-string v6, "end of current its ... calling the added listener##########"

    invoke-static {v4, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 654
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 661
    :catch_0
    move-exception v0

    .line 663
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 667
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "listener":Lorg/cybergarage/upnp/device/DeviceChangeListener;
    .end local v2    # "listenerSize":I
    .end local v3    # "n":I
    :catchall_0
    move-exception v4

    monitor-exit v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v4

    .restart local v2    # "listenerSize":I
    .restart local v3    # "n":I
    :cond_0
    :try_start_3
    monitor-exit v5
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 668
    sget-object v4, Lorg/cybergarage/upnp/ControlPoint;->TAG:Ljava/lang/String;

    const-string v5, "end calling the added listener##########"

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 669
    return-void
.end method

.method public performEventListener(Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;)V
    .locals 11
    .param p1, "uuid"    # Ljava/lang/String;
    .param p2, "devid"    # Ljava/lang/String;
    .param p3, "seq"    # J
    .param p5, "name"    # Ljava/lang/String;
    .param p6, "value"    # Ljava/lang/String;

    .prologue
    .line 930
    :try_start_0
    iget-object v2, p0, Lorg/cybergarage/upnp/ControlPoint;->eventListenerList:Lorg/cybergarage/util/ListenerList;

    invoke-virtual {v2}, Lorg/cybergarage/util/ListenerList;->size()I

    move-result v8

    .line 931
    .local v8, "listenerSize":I
    const/4 v9, 0x0

    .local v9, "n":I
    :goto_0
    if-ge v9, v8, :cond_0

    .line 932
    iget-object v2, p0, Lorg/cybergarage/upnp/ControlPoint;->eventListenerList:Lorg/cybergarage/util/ListenerList;

    invoke-virtual {v2, v9}, Lorg/cybergarage/util/ListenerList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/cybergarage/upnp/event/EventListener;

    .local v1, "listener":Lorg/cybergarage/upnp/event/EventListener;
    move-object v2, p1

    move-object v3, p2

    move-wide v4, p3

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    .line 933
    invoke-interface/range {v1 .. v7}, Lorg/cybergarage/upnp/event/EventListener;->eventNotifyReceived(Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 931
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 935
    .end local v1    # "listener":Lorg/cybergarage/upnp/event/EventListener;
    .end local v8    # "listenerSize":I
    .end local v9    # "n":I
    :catch_0
    move-exception v0

    .line 936
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 938
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    return-void
.end method

.method public performNotifyListener(Lorg/cybergarage/upnp/ssdp/SSDPPacket;)V
    .locals 5
    .param p1, "ssdpPacket"    # Lorg/cybergarage/upnp/ssdp/SSDPPacket;

    .prologue
    .line 588
    iget-object v4, p0, Lorg/cybergarage/upnp/ControlPoint;->deviceNotifyListenerList:Lorg/cybergarage/util/ListenerList;

    invoke-virtual {v4}, Lorg/cybergarage/util/ListenerList;->size()I

    move-result v2

    .line 589
    .local v2, "listenerSize":I
    const/4 v3, 0x0

    .local v3, "n":I
    :goto_0
    if-ge v3, v2, :cond_0

    .line 590
    iget-object v4, p0, Lorg/cybergarage/upnp/ControlPoint;->deviceNotifyListenerList:Lorg/cybergarage/util/ListenerList;

    invoke-virtual {v4, v3}, Lorg/cybergarage/util/ListenerList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/cybergarage/upnp/device/NotifyListener;

    .line 593
    .local v1, "listener":Lorg/cybergarage/upnp/device/NotifyListener;
    :try_start_0
    invoke-interface {v1, p1}, Lorg/cybergarage/upnp/device/NotifyListener;->deviceNotifyReceived(Lorg/cybergarage/upnp/ssdp/SSDPPacket;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 589
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 594
    :catch_0
    move-exception v0

    .line 595
    .local v0, "e":Ljava/lang/Exception;
    const-string v4, "NotifyListener returned an error:"

    invoke-static {v4, v0}, Lorg/cybergarage/util/Debug;->warning(Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_1

    .line 598
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "listener":Lorg/cybergarage/upnp/device/NotifyListener;
    :cond_0
    return-void
.end method

.method public performRemoveDeviceListener(Lorg/cybergarage/upnp/Device;)V
    .locals 7
    .param p1, "dev"    # Lorg/cybergarage/upnp/Device;

    .prologue
    .line 672
    iget-object v4, p0, Lorg/cybergarage/upnp/ControlPoint;->deviceChangeListenerList:Lorg/cybergarage/util/ListenerList;

    monitor-enter v4

    .line 673
    :try_start_0
    iget-object v3, p0, Lorg/cybergarage/upnp/ControlPoint;->deviceChangeListenerList:Lorg/cybergarage/util/ListenerList;

    invoke-virtual {v3}, Lorg/cybergarage/util/ListenerList;->size()I

    move-result v1

    .line 674
    .local v1, "listenerSize":I
    sget-object v3, Lorg/cybergarage/upnp/ControlPoint;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "performRemoveDeviceListener: deviceChangeListenerList size: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 675
    const/4 v2, 0x0

    .local v2, "n":I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 676
    iget-object v3, p0, Lorg/cybergarage/upnp/ControlPoint;->deviceChangeListenerList:Lorg/cybergarage/util/ListenerList;

    invoke-virtual {v3, v2}, Lorg/cybergarage/util/ListenerList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/cybergarage/upnp/device/DeviceChangeListener;

    .line 678
    .local v0, "listener":Lorg/cybergarage/upnp/device/DeviceChangeListener;
    sget-object v3, Lorg/cybergarage/upnp/ControlPoint;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "performRemoveDeviceListener: calling listener: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 679
    invoke-interface {v0, p1}, Lorg/cybergarage/upnp/device/DeviceChangeListener;->deviceRemoved(Lorg/cybergarage/upnp/Device;)V

    .line 675
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 681
    .end local v0    # "listener":Lorg/cybergarage/upnp/device/DeviceChangeListener;
    :cond_0
    monitor-exit v4

    .line 682
    return-void

    .line 681
    .end local v1    # "listenerSize":I
    .end local v2    # "n":I
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3
.end method

.method public performSearchResponseListener(Lorg/cybergarage/upnp/ssdp/SSDPPacket;)V
    .locals 5
    .param p1, "ssdpPacket"    # Lorg/cybergarage/upnp/ssdp/SSDPPacket;

    .prologue
    .line 614
    iget-object v4, p0, Lorg/cybergarage/upnp/ControlPoint;->deviceSearchResponseListenerList:Lorg/cybergarage/util/ListenerList;

    invoke-virtual {v4}, Lorg/cybergarage/util/ListenerList;->size()I

    move-result v2

    .line 615
    .local v2, "listenerSize":I
    const/4 v3, 0x0

    .local v3, "n":I
    :goto_0
    if-ge v3, v2, :cond_0

    .line 616
    iget-object v4, p0, Lorg/cybergarage/upnp/ControlPoint;->deviceSearchResponseListenerList:Lorg/cybergarage/util/ListenerList;

    invoke-virtual {v4, v3}, Lorg/cybergarage/util/ListenerList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/cybergarage/upnp/device/SearchResponseListener;

    .line 619
    .local v1, "listener":Lorg/cybergarage/upnp/device/SearchResponseListener;
    :try_start_0
    invoke-interface {v1, p1}, Lorg/cybergarage/upnp/device/SearchResponseListener;->deviceSearchResponseReceived(Lorg/cybergarage/upnp/ssdp/SSDPPacket;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 615
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 620
    :catch_0
    move-exception v0

    .line 621
    .local v0, "e":Ljava/lang/Exception;
    const-string v4, "SearchResponseListener returned an error:"

    invoke-static {v4, v0}, Lorg/cybergarage/util/Debug;->warning(Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_1

    .line 625
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "listener":Lorg/cybergarage/upnp/device/SearchResponseListener;
    :cond_0
    return-void
.end method

.method public print()V
    .locals 8

    .prologue
    .line 1443
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v2

    .line 1444
    .local v2, "devList":Lorg/cybergarage/upnp/DeviceList;
    invoke-virtual {v2}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v1

    .line 1445
    .local v1, "devCnt":I
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Device Num = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lorg/cybergarage/util/Debug;->message(Ljava/lang/String;)V

    .line 1446
    const/4 v3, 0x0

    .local v3, "n":I
    :goto_0
    if-ge v3, v1, :cond_0

    .line 1447
    invoke-virtual {v2, v3}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v0

    .line 1448
    .local v0, "dev":Lorg/cybergarage/upnp/Device;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "] "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Lorg/cybergarage/upnp/Device;->getFriendlyName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Lorg/cybergarage/upnp/Device;->getLeaseTime()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Lorg/cybergarage/upnp/Device;->getElapsedTime()J

    move-result-wide v6

    invoke-virtual {v4, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lorg/cybergarage/util/Debug;->message(Ljava/lang/String;)V

    .line 1446
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1451
    .end local v0    # "dev":Lorg/cybergarage/upnp/Device;
    :cond_0
    return-void
.end method

.method public removeAllDevices()V
    .locals 1

    .prologue
    .line 559
    sget-object v0, Lorg/cybergarage/upnp/ControlPoint;->devNodeList:Lorg/cybergarage/xml/NodeList;

    invoke-virtual {v0}, Lorg/cybergarage/xml/NodeList;->clear()V

    .line 560
    return-void
.end method

.method public removeDevice(Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 524
    invoke-virtual {p0, p1}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v0

    .line 525
    .local v0, "dev":Lorg/cybergarage/upnp/Device;
    invoke-virtual {p0, v0}, Lorg/cybergarage/upnp/ControlPoint;->removeDevice(Lorg/cybergarage/upnp/Device;)V

    .line 526
    return-void
.end method

.method protected removeDevice(Lorg/cybergarage/upnp/Device;)V
    .locals 1
    .param p1, "dev"    # Lorg/cybergarage/upnp/Device;

    .prologue
    .line 518
    if-nez p1, :cond_0

    .line 521
    :goto_0
    return-void

    .line 520
    :cond_0
    invoke-virtual {p1}, Lorg/cybergarage/upnp/Device;->getRootNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/cybergarage/upnp/ControlPoint;->removeDevice(Lorg/cybergarage/xml/Node;)V

    goto :goto_0
.end method

.method public removeDeviceChangeListener(Lorg/cybergarage/upnp/device/DeviceChangeListener;)V
    .locals 4
    .param p1, "listener"    # Lorg/cybergarage/upnp/device/DeviceChangeListener;

    .prologue
    .line 643
    iget-object v1, p0, Lorg/cybergarage/upnp/ControlPoint;->deviceChangeListenerList:Lorg/cybergarage/util/ListenerList;

    monitor-enter v1

    .line 644
    :try_start_0
    iget-object v0, p0, Lorg/cybergarage/upnp/ControlPoint;->deviceChangeListenerList:Lorg/cybergarage/util/ListenerList;

    invoke-virtual {v0, p1}, Lorg/cybergarage/util/ListenerList;->remove(Ljava/lang/Object;)Z

    .line 645
    sget-object v0, Lorg/cybergarage/upnp/ControlPoint;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "removeDeviceChangeListener: Listener removed: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 646
    monitor-exit v1

    .line 647
    return-void

    .line 646
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public removeEventListener(Lorg/cybergarage/upnp/event/EventListener;)V
    .locals 1
    .param p1, "listener"    # Lorg/cybergarage/upnp/event/EventListener;

    .prologue
    .line 924
    iget-object v0, p0, Lorg/cybergarage/upnp/ControlPoint;->eventListenerList:Lorg/cybergarage/util/ListenerList;

    invoke-virtual {v0, p1}, Lorg/cybergarage/util/ListenerList;->remove(Ljava/lang/Object;)Z

    .line 925
    return-void
.end method

.method public removeExpiredDevices()V
    .locals 7

    .prologue
    .line 544
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v2

    .line 545
    .local v2, "devList":Lorg/cybergarage/upnp/DeviceList;
    invoke-virtual {v2}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v1

    .line 546
    .local v1, "devCnt":I
    new-array v0, v1, [Lorg/cybergarage/upnp/Device;

    .line 547
    .local v0, "dev":[Lorg/cybergarage/upnp/Device;
    const/4 v3, 0x0

    .local v3, "n":I
    :goto_0
    if-ge v3, v1, :cond_0

    .line 548
    invoke-virtual {v2, v3}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v4

    aput-object v4, v0, v3

    .line 547
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 549
    :cond_0
    const/4 v3, 0x0

    :goto_1
    if-ge v3, v1, :cond_2

    .line 550
    aget-object v4, v0, v3

    invoke-virtual {v4}, Lorg/cybergarage/upnp/Device;->isExpired()Z

    move-result v4

    const/4 v5, 0x1

    if-ne v4, v5, :cond_1

    .line 551
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Expired device =  "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    aget-object v5, v0, v3

    invoke-virtual {v5}, Lorg/cybergarage/upnp/Device;->getFriendlyName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lorg/cybergarage/util/Debug;->message(Ljava/lang/String;)V

    .line 552
    sget-object v4, Lorg/cybergarage/upnp/ControlPoint;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Removing expired device: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    aget-object v6, v0, v3

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 553
    aget-object v4, v0, v3

    invoke-virtual {p0, v4}, Lorg/cybergarage/upnp/ControlPoint;->removeDevice(Lorg/cybergarage/upnp/Device;)V

    .line 549
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 556
    :cond_2
    return-void
.end method

.method public removeNotifyListener(Lorg/cybergarage/upnp/device/NotifyListener;)V
    .locals 1
    .param p1, "listener"    # Lorg/cybergarage/upnp/device/NotifyListener;

    .prologue
    .line 584
    iget-object v0, p0, Lorg/cybergarage/upnp/ControlPoint;->deviceNotifyListenerList:Lorg/cybergarage/util/ListenerList;

    invoke-virtual {v0, p1}, Lorg/cybergarage/util/ListenerList;->remove(Ljava/lang/Object;)Z

    .line 585
    return-void
.end method

.method public removeSearchResponseListener(Lorg/cybergarage/upnp/device/SearchResponseListener;)V
    .locals 1
    .param p1, "listener"    # Lorg/cybergarage/upnp/device/SearchResponseListener;

    .prologue
    .line 610
    iget-object v0, p0, Lorg/cybergarage/upnp/ControlPoint;->deviceSearchResponseListenerList:Lorg/cybergarage/util/ListenerList;

    invoke-virtual {v0, p1}, Lorg/cybergarage/util/ListenerList;->remove(Ljava/lang/Object;)Z

    .line 611
    return-void
.end method

.method public renewSubscriberService()V
    .locals 2

    .prologue
    .line 1124
    const-wide/16 v0, -0x1

    invoke-virtual {p0, v0, v1}, Lorg/cybergarage/upnp/ControlPoint;->renewSubscriberService(J)V

    .line 1125
    return-void
.end method

.method public renewSubscriberService(J)V
    .locals 5
    .param p1, "timeout"    # J

    .prologue
    .line 1115
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v2

    .line 1116
    .local v2, "devList":Lorg/cybergarage/upnp/DeviceList;
    invoke-virtual {v2}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v1

    .line 1117
    .local v1, "devCnt":I
    const/4 v3, 0x0

    .local v3, "n":I
    :goto_0
    if-ge v3, v1, :cond_0

    .line 1118
    invoke-virtual {v2, v3}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v0

    .line 1119
    .local v0, "dev":Lorg/cybergarage/upnp/Device;
    invoke-virtual {p0, v0, p1, p2}, Lorg/cybergarage/upnp/ControlPoint;->renewSubscriberService(Lorg/cybergarage/upnp/Device;J)V

    .line 1117
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1121
    .end local v0    # "dev":Lorg/cybergarage/upnp/Device;
    :cond_0
    return-void
.end method

.method public renewSubscriberService(Lorg/cybergarage/upnp/Device;J)V
    .locals 10
    .param p1, "dev"    # Lorg/cybergarage/upnp/Device;
    .param p2, "timeout"    # J

    .prologue
    .line 1094
    invoke-virtual {p1}, Lorg/cybergarage/upnp/Device;->getServiceList()Lorg/cybergarage/upnp/ServiceList;

    move-result-object v7

    .line 1095
    .local v7, "serviceList":Lorg/cybergarage/upnp/ServiceList;
    invoke-virtual {v7}, Lorg/cybergarage/upnp/ServiceList;->size()I

    move-result v6

    .line 1096
    .local v6, "serviceCnt":I
    const/4 v4, 0x0

    .local v4, "n":I
    :goto_0
    if-ge v4, v6, :cond_2

    .line 1097
    invoke-virtual {v7, v4}, Lorg/cybergarage/upnp/ServiceList;->getService(I)Lorg/cybergarage/upnp/Service;

    move-result-object v5

    .line 1098
    .local v5, "service":Lorg/cybergarage/upnp/Service;
    invoke-virtual {v5}, Lorg/cybergarage/upnp/Service;->isSubscribed()Z

    move-result v9

    if-nez v9, :cond_1

    .line 1096
    :cond_0
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 1100
    :cond_1
    invoke-virtual {v5}, Lorg/cybergarage/upnp/Service;->getSID()Ljava/lang/String;

    move-result-object v8

    .line 1101
    .local v8, "sid":Ljava/lang/String;
    invoke-virtual {p0, v5, v8, p2, p3}, Lorg/cybergarage/upnp/ControlPoint;->subscribe(Lorg/cybergarage/upnp/Service;Ljava/lang/String;J)Z

    move-result v3

    .line 1102
    .local v3, "isRenewed":Z
    if-nez v3, :cond_0

    .line 1103
    invoke-virtual {p0, v5, p2, p3}, Lorg/cybergarage/upnp/ControlPoint;->subscribe(Lorg/cybergarage/upnp/Service;J)Z

    goto :goto_1

    .line 1106
    .end local v3    # "isRenewed":Z
    .end local v5    # "service":Lorg/cybergarage/upnp/Service;
    .end local v8    # "sid":Ljava/lang/String;
    :cond_2
    invoke-virtual {p1}, Lorg/cybergarage/upnp/Device;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v2

    .line 1107
    .local v2, "cdevList":Lorg/cybergarage/upnp/DeviceList;
    invoke-virtual {v2}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v1

    .line 1108
    .local v1, "cdevCnt":I
    const/4 v4, 0x0

    :goto_2
    if-ge v4, v1, :cond_3

    .line 1109
    invoke-virtual {v2, v4}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v0

    .line 1110
    .local v0, "cdev":Lorg/cybergarage/upnp/Device;
    invoke-virtual {p0, v0, p2, p3}, Lorg/cybergarage/upnp/ControlPoint;->renewSubscriberService(Lorg/cybergarage/upnp/Device;J)V

    .line 1108
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 1112
    .end local v0    # "cdev":Lorg/cybergarage/upnp/Device;
    :cond_3
    return-void
.end method

.method public declared-synchronized search(I)Z
    .locals 3
    .param p1, "mx"    # I

    .prologue
    .line 750
    monitor-enter p0

    :try_start_0
    sget-object v0, Lorg/cybergarage/upnp/ControlPoint;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ControlPoint search() sending mSearch. MX: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 751
    const-string v0, "urn:Belkin:service:basicevent:1"

    invoke-virtual {p0, v0, p1}, Lorg/cybergarage/upnp/ControlPoint;->search(Ljava/lang/String;I)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    .line 750
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized search(Ljava/lang/String;)Z
    .locals 2
    .param p1, "target"    # Ljava/lang/String;

    .prologue
    .line 745
    monitor-enter p0

    :try_start_0
    sget-object v0, Lorg/cybergarage/upnp/ControlPoint;->TAG:Ljava/lang/String;

    const-string v1, "ControlPoint search(String target) sending mSearch"

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 746
    const/4 v0, 0x2

    invoke-virtual {p0, p1, v0}, Lorg/cybergarage/upnp/ControlPoint;->search(Ljava/lang/String;I)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    .line 745
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized search(Ljava/lang/String;I)Z
    .locals 6
    .param p1, "target"    # Ljava/lang/String;
    .param p2, "mx"    # I

    .prologue
    .line 736
    monitor-enter p0

    :try_start_0
    new-instance v1, Lorg/cybergarage/upnp/ssdp/SSDPSearchRequest;

    invoke-direct {v1, p1, p2}, Lorg/cybergarage/upnp/ssdp/SSDPSearchRequest;-><init>(Ljava/lang/String;I)V

    .line 737
    .local v1, "msReq":Lorg/cybergarage/upnp/ssdp/SSDPSearchRequest;
    invoke-direct {p0}, Lorg/cybergarage/upnp/ControlPoint;->getSSDPSearchResponseSocketList()Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList;

    move-result-object v2

    .line 738
    .local v2, "ssdpSearchResponseSocketList":Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList;
    invoke-virtual {v2, v1}, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList;->post(Lorg/cybergarage/upnp/ssdp/SSDPSearchRequest;)Z

    move-result v0

    .line 739
    .local v0, "isSuccess":Z
    sget-object v3, Lorg/cybergarage/upnp/ControlPoint;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "ControlPoint search(String target, int mx) POST response: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 741
    monitor-exit p0

    return v0

    .line 736
    .end local v0    # "isSuccess":Z
    .end local v1    # "msReq":Lorg/cybergarage/upnp/ssdp/SSDPSearchRequest;
    .end local v2    # "ssdpSearchResponseSocketList":Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList;
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public searchResponseReceived(Lorg/cybergarage/upnp/ssdp/SSDPPacket;)V
    .locals 1
    .param p1, "packet"    # Lorg/cybergarage/upnp/ssdp/SSDPPacket;

    .prologue
    const/4 v0, 0x0

    .line 702
    invoke-virtual {p0, p1, v0, v0}, Lorg/cybergarage/upnp/ControlPoint;->searchResponseReceived(Lorg/cybergarage/upnp/ssdp/SSDPPacket;ZZ)V

    .line 703
    return-void
.end method

.method public searchResponseReceived(Lorg/cybergarage/upnp/ssdp/SSDPPacket;ZZ)V
    .locals 6
    .param p1, "packet"    # Lorg/cybergarage/upnp/ssdp/SSDPPacket;
    .param p2, "isViaCloudCache"    # Z
    .param p3, "isViaUnicast"    # Z

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 706
    sget-object v3, Lorg/cybergarage/upnp/ControlPoint;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "SSDP Packet received. isViaCloudCache: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "; isViaUnicast: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 708
    if-nez p2, :cond_0

    if-nez p3, :cond_0

    .line 709
    const/4 v3, 0x0

    :try_start_0
    invoke-static {v3}, Lorg/cybergarage/upnp/ControlPoint;->setMSearchFail(Z)V

    .line 712
    :cond_0
    invoke-virtual {p1}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->isRootDevice()Z

    move-result v3

    if-ne v3, v2, :cond_1

    .line 713
    if-eqz p3, :cond_2

    .line 714
    .local v1, "notifyListeners":Z
    :goto_0
    invoke-direct {p0, p1, v1}, Lorg/cybergarage/upnp/ControlPoint;->addDevice(Lorg/cybergarage/upnp/ssdp/SSDPPacket;Z)V

    .line 716
    .end local v1    # "notifyListeners":Z
    :cond_1
    invoke-virtual {p0, p1}, Lorg/cybergarage/upnp/ControlPoint;->performSearchResponseListener(Lorg/cybergarage/upnp/ssdp/SSDPPacket;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 720
    :goto_1
    return-void

    :cond_2
    move v1, v2

    .line 713
    goto :goto_0

    .line 717
    :catch_0
    move-exception v0

    .line 718
    .local v0, "e":Ljava/lang/Exception;
    sget-object v2, Lorg/cybergarage/upnp/ControlPoint;->TAG:Ljava/lang/String;

    const-string v3, "Exception in searchResponseReceived(): "

    invoke-static {v2, v3, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_1
.end method

.method public setDeviceDisposer(Lorg/cybergarage/upnp/device/Disposer;)V
    .locals 0
    .param p1, "disposer"    # Lorg/cybergarage/upnp/device/Disposer;

    .prologue
    .line 575
    iput-object p1, p0, Lorg/cybergarage/upnp/ControlPoint;->deviceDisposer:Lorg/cybergarage/upnp/device/Disposer;

    .line 577
    return-void
.end method

.method public setEventSubURI(Ljava/lang/String;)V
    .locals 0
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 949
    iput-object p1, p0, Lorg/cybergarage/upnp/ControlPoint;->eventSubURI:Ljava/lang/String;

    .line 950
    return-void
.end method

.method public setExpiredDeviceMonitoringInterval(J)V
    .locals 1
    .param p1, "interval"    # J

    .prologue
    .line 567
    iput-wide p1, p0, Lorg/cybergarage/upnp/ControlPoint;->expiredDeviceMonitoringInterval:J

    .line 568
    return-void
.end method

.method public setHTTPPort(I)V
    .locals 0
    .param p1, "port"    # I

    .prologue
    .line 255
    iput p1, p0, Lorg/cybergarage/upnp/ControlPoint;->httpPort:I

    .line 256
    return-void
.end method

.method public setNMPRMode(Z)V
    .locals 0
    .param p1, "flag"    # Z

    .prologue
    .line 273
    iput-boolean p1, p0, Lorg/cybergarage/upnp/ControlPoint;->nmprMode:Z

    .line 274
    return-void
.end method

.method public setRenewSubscriber(Lorg/cybergarage/upnp/control/RenewSubscriber;)V
    .locals 0
    .param p1, "sub"    # Lorg/cybergarage/upnp/control/RenewSubscriber;

    .prologue
    .line 1136
    iput-object p1, p0, Lorg/cybergarage/upnp/ControlPoint;->renewSubscriber:Lorg/cybergarage/upnp/control/RenewSubscriber;

    .line 1137
    return-void
.end method

.method public setSSDPPort(I)V
    .locals 0
    .param p1, "port"    # I

    .prologue
    .line 242
    iput p1, p0, Lorg/cybergarage/upnp/ControlPoint;->ssdpPort:I

    .line 243
    return-void
.end method

.method public setSSID(Ljava/lang/String;)V
    .locals 0
    .param p1, "ssid"    # Ljava/lang/String;

    .prologue
    .line 1150
    iput-object p1, p0, Lorg/cybergarage/upnp/ControlPoint;->mSSID:Ljava/lang/String;

    .line 1151
    return-void
.end method

.method public setSearchMx(I)V
    .locals 0
    .param p1, "mx"    # I

    .prologue
    .line 732
    iput p1, p0, Lorg/cybergarage/upnp/ControlPoint;->searchMx:I

    .line 733
    return-void
.end method

.method public setUserData(Ljava/lang/Object;)V
    .locals 0
    .param p1, "data"    # Ljava/lang/Object;

    .prologue
    .line 1434
    iput-object p1, p0, Lorg/cybergarage/upnp/ControlPoint;->userData:Ljava/lang/Object;

    .line 1436
    return-void
.end method

.method public start()Z
    .locals 2

    .prologue
    .line 1322
    sget-object v0, Lorg/cybergarage/upnp/ControlPoint;->TAG:Ljava/lang/String;

    const-string v1, "Starting control point"

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1323
    const-string v0, "urn:Belkin:service:basicevent:1"

    const/4 v1, 0x2

    invoke-virtual {p0, v0, v1}, Lorg/cybergarage/upnp/ControlPoint;->start(Ljava/lang/String;I)Z

    move-result v0

    return v0
.end method

.method public start(Ljava/lang/String;)Z
    .locals 1
    .param p1, "target"    # Ljava/lang/String;

    .prologue
    .line 1318
    const/4 v0, 0x2

    invoke-virtual {p0, p1, v0}, Lorg/cybergarage/upnp/ControlPoint;->start(Ljava/lang/String;I)Z

    move-result v0

    return v0
.end method

.method public start(Ljava/lang/String;I)Z
    .locals 11
    .param p1, "target"    # Ljava/lang/String;
    .param p2, "mx"    # I

    .prologue
    .line 1188
    :try_start_0
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ControlPoint;->stop()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1192
    :goto_0
    sget-object v9, Lorg/cybergarage/upnp/ControlPoint;->TAG:Ljava/lang/String;

    const-string v10, "Control Point start :: After Stop"

    invoke-static {v9, v10}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1197
    const/4 v5, 0x0

    .line 1198
    .local v5, "retryCnt":I
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ControlPoint;->getHTTPPort()I

    move-result v0

    .line 1199
    .local v0, "bindPort":I
    invoke-direct {p0}, Lorg/cybergarage/upnp/ControlPoint;->getHTTPServerList()Lorg/cybergarage/http/HTTPServerList;

    move-result-object v3

    .line 1200
    .local v3, "httpServerList":Lorg/cybergarage/http/HTTPServerList;
    :goto_1
    invoke-virtual {v3, v0}, Lorg/cybergarage/http/HTTPServerList;->open(I)Z

    move-result v9

    if-nez v9, :cond_1

    .line 1201
    add-int/lit8 v5, v5, 0x1

    .line 1202
    const/16 v9, 0x64

    if-ge v9, v5, :cond_0

    .line 1203
    const/4 v9, 0x0

    .line 1314
    :goto_2
    return v9

    .line 1189
    .end local v0    # "bindPort":I
    .end local v3    # "httpServerList":Lorg/cybergarage/http/HTTPServerList;
    .end local v5    # "retryCnt":I
    :catch_0
    move-exception v2

    .line 1190
    .local v2, "ex":Ljava/lang/Exception;
    sget-object v9, Lorg/cybergarage/upnp/ControlPoint;->TAG:Ljava/lang/String;

    const-string v10, "Control Point start  :: Exception in Stop "

    invoke-static {v9, v10}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 1204
    .end local v2    # "ex":Ljava/lang/Exception;
    .restart local v0    # "bindPort":I
    .restart local v3    # "httpServerList":Lorg/cybergarage/http/HTTPServerList;
    .restart local v5    # "retryCnt":I
    :cond_0
    add-int/lit8 v9, v0, 0x1

    invoke-virtual {p0, v9}, Lorg/cybergarage/upnp/ControlPoint;->setHTTPPort(I)V

    .line 1205
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ControlPoint;->getHTTPPort()I

    move-result v0

    goto :goto_1

    .line 1207
    :cond_1
    invoke-virtual {v3, p0}, Lorg/cybergarage/http/HTTPServerList;->addRequestListener(Lorg/cybergarage/http/HTTPRequestListener;)V

    .line 1208
    invoke-virtual {v3}, Lorg/cybergarage/http/HTTPServerList;->start()V

    .line 1213
    invoke-direct {p0}, Lorg/cybergarage/upnp/ControlPoint;->getSSDPNotifySocketList()Lorg/cybergarage/upnp/ssdp/SSDPNotifySocketList;

    move-result-object v6

    .line 1214
    .local v6, "ssdpNotifySocketList":Lorg/cybergarage/upnp/ssdp/SSDPNotifySocketList;
    invoke-virtual {v6}, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocketList;->open()Z

    move-result v9

    if-nez v9, :cond_2

    .line 1215
    const/4 v9, 0x0

    goto :goto_2

    .line 1216
    :cond_2
    invoke-virtual {v6, p0}, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocketList;->setControlPoint(Lorg/cybergarage/upnp/ControlPoint;)V

    .line 1217
    invoke-virtual {v6}, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocketList;->start()V

    .line 1222
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ControlPoint;->getSSDPPort()I

    move-result v7

    .line 1223
    .local v7, "ssdpPort":I
    const/4 v5, 0x0

    .line 1224
    invoke-direct {p0}, Lorg/cybergarage/upnp/ControlPoint;->getSSDPSearchResponseSocketList()Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList;

    move-result-object v8

    .line 1226
    .local v8, "ssdpSearchResponseSocketList":Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList;
    :goto_3
    invoke-virtual {v8, v7}, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList;->open(I)Z

    move-result v9

    if-nez v9, :cond_4

    .line 1227
    add-int/lit8 v5, v5, 0x1

    .line 1228
    const/16 v9, 0x64

    if-ge v9, v5, :cond_3

    .line 1229
    const/4 v9, 0x0

    goto :goto_2

    .line 1230
    :cond_3
    add-int/lit8 v9, v7, 0x1

    invoke-virtual {p0, v9}, Lorg/cybergarage/upnp/ControlPoint;->setSSDPPort(I)V

    .line 1231
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ControlPoint;->getSSDPPort()I

    move-result v7

    goto :goto_3

    .line 1233
    :cond_4
    invoke-virtual {v8, p0}, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList;->setControlPoint(Lorg/cybergarage/upnp/ControlPoint;)V

    .line 1234
    invoke-virtual {v8}, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList;->start()V

    .line 1301
    new-instance v1, Lorg/cybergarage/upnp/device/Disposer;

    invoke-direct {v1, p0}, Lorg/cybergarage/upnp/device/Disposer;-><init>(Lorg/cybergarage/upnp/ControlPoint;)V

    .line 1302
    .local v1, "disposer":Lorg/cybergarage/upnp/device/Disposer;
    invoke-virtual {p0, v1}, Lorg/cybergarage/upnp/ControlPoint;->setDeviceDisposer(Lorg/cybergarage/upnp/device/Disposer;)V

    .line 1303
    invoke-virtual {v1}, Lorg/cybergarage/upnp/device/Disposer;->start()V

    .line 1308
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ControlPoint;->isNMPRMode()Z

    move-result v9

    const/4 v10, 0x1

    if-ne v9, v10, :cond_5

    .line 1309
    new-instance v4, Lorg/cybergarage/upnp/control/RenewSubscriber;

    invoke-direct {v4, p0}, Lorg/cybergarage/upnp/control/RenewSubscriber;-><init>(Lorg/cybergarage/upnp/ControlPoint;)V

    .line 1310
    .local v4, "renewSub":Lorg/cybergarage/upnp/control/RenewSubscriber;
    invoke-virtual {p0, v4}, Lorg/cybergarage/upnp/ControlPoint;->setRenewSubscriber(Lorg/cybergarage/upnp/control/RenewSubscriber;)V

    .line 1311
    invoke-virtual {v4}, Lorg/cybergarage/upnp/control/RenewSubscriber;->start()V

    .line 1314
    .end local v4    # "renewSub":Lorg/cybergarage/upnp/control/RenewSubscriber;
    :cond_5
    const/4 v9, 0x1

    goto :goto_2
.end method

.method public stop()Z
    .locals 1

    .prologue
    .line 1354
    invoke-direct {p0}, Lorg/cybergarage/upnp/ControlPoint;->cleanups()V

    .line 1355
    const/4 v0, 0x1

    return v0
.end method

.method public subscribe(Lorg/cybergarage/upnp/Service;)Z
    .locals 2
    .param p1, "service"    # Lorg/cybergarage/upnp/Service;

    .prologue
    .line 984
    sget-object v0, Lorg/cybergarage/upnp/ControlPoint;->TAG:Ljava/lang/String;

    const-string v1, "Subscribe :: applied"

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 985
    const-wide/16 v0, -0x1

    invoke-virtual {p0, p1, v0, v1}, Lorg/cybergarage/upnp/ControlPoint;->subscribe(Lorg/cybergarage/upnp/Service;J)Z

    move-result v0

    return v0
.end method

.method public subscribe(Lorg/cybergarage/upnp/Service;J)Z
    .locals 10
    .param p1, "service"    # Lorg/cybergarage/upnp/Service;
    .param p2, "timeout"    # J

    .prologue
    const/4 v5, 0x0

    const/4 v6, 0x1

    .line 957
    sget-object v7, Lorg/cybergarage/upnp/ControlPoint;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, " UPnPImpl Subscribe :: Device fetched from Service Object"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {p1}, Lorg/cybergarage/upnp/Service;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v9

    invoke-virtual {v9}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " :: Service Subscription Status = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {p1}, Lorg/cybergarage/upnp/Service;->isSubscribed()Z

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 958
    invoke-virtual {p1}, Lorg/cybergarage/upnp/Service;->isSubscribed()Z

    move-result v7

    if-ne v7, v6, :cond_1

    .line 959
    invoke-virtual {p1}, Lorg/cybergarage/upnp/Service;->getSID()Ljava/lang/String;

    move-result-object v2

    .line 960
    .local v2, "sid":Ljava/lang/String;
    invoke-virtual {p0, p1, v2, p2, p3}, Lorg/cybergarage/upnp/ControlPoint;->subscribe(Lorg/cybergarage/upnp/Service;Ljava/lang/String;J)Z

    move-result v5

    .line 980
    .end local v2    # "sid":Ljava/lang/String;
    :cond_0
    :goto_0
    return v5

    .line 963
    :cond_1
    invoke-virtual {p1}, Lorg/cybergarage/upnp/Service;->getRootDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v1

    .line 964
    .local v1, "rootDev":Lorg/cybergarage/upnp/Device;
    if-eqz v1, :cond_0

    .line 966
    invoke-virtual {v1}, Lorg/cybergarage/upnp/Device;->getInterfaceAddress()Ljava/lang/String;

    move-result-object v0

    .line 967
    .local v0, "ifAddress":Ljava/lang/String;
    new-instance v3, Lorg/cybergarage/upnp/event/SubscriptionRequest;

    invoke-direct {v3}, Lorg/cybergarage/upnp/event/SubscriptionRequest;-><init>()V

    .line 968
    .local v3, "subReq":Lorg/cybergarage/upnp/event/SubscriptionRequest;
    invoke-direct {p0, v0}, Lorg/cybergarage/upnp/ControlPoint;->getEventSubCallbackURL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, p1, v7, p2, p3}, Lorg/cybergarage/upnp/event/SubscriptionRequest;->setSubscribeRequest(Lorg/cybergarage/upnp/Service;Ljava/lang/String;J)V

    .line 970
    invoke-virtual {v3}, Lorg/cybergarage/upnp/event/SubscriptionRequest;->post()Lorg/cybergarage/upnp/event/SubscriptionResponse;

    move-result-object v4

    .line 971
    .local v4, "subRes":Lorg/cybergarage/upnp/event/SubscriptionResponse;
    invoke-virtual {v4}, Lorg/cybergarage/upnp/event/SubscriptionResponse;->isSuccessful()Z

    move-result v7

    if-ne v7, v6, :cond_2

    .line 972
    invoke-virtual {v4}, Lorg/cybergarage/upnp/event/SubscriptionResponse;->getSID()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Lorg/cybergarage/upnp/Service;->setSID(Ljava/lang/String;)V

    .line 973
    invoke-virtual {v4}, Lorg/cybergarage/upnp/event/SubscriptionResponse;->getTimeout()J

    move-result-wide v8

    invoke-virtual {p1, v8, v9}, Lorg/cybergarage/upnp/Service;->setTimeout(J)V

    .line 974
    sget-object v5, Lorg/cybergarage/upnp/ControlPoint;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "UPnPImpl Subscribe :: Subscription Successful :: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v1}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    move v5, v6

    .line 975
    goto :goto_0

    .line 978
    :cond_2
    invoke-virtual {p1}, Lorg/cybergarage/upnp/Service;->clearSID()V

    .line 979
    sget-object v6, Lorg/cybergarage/upnp/ControlPoint;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "UPnPImpl Subscribe :: Subscription failed"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v1}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public subscribe(Lorg/cybergarage/upnp/Service;Ljava/lang/String;)Z
    .locals 2
    .param p1, "service"    # Lorg/cybergarage/upnp/Service;
    .param p2, "uuid"    # Ljava/lang/String;

    .prologue
    .line 1006
    const-wide/16 v0, -0x1

    invoke-virtual {p0, p1, p2, v0, v1}, Lorg/cybergarage/upnp/ControlPoint;->subscribe(Lorg/cybergarage/upnp/Service;Ljava/lang/String;J)Z

    move-result v0

    return v0
.end method

.method public subscribe(Lorg/cybergarage/upnp/Service;Ljava/lang/String;J)Z
    .locals 7
    .param p1, "service"    # Lorg/cybergarage/upnp/Service;
    .param p2, "uuid"    # Ljava/lang/String;
    .param p3, "timeout"    # J

    .prologue
    const/4 v2, 0x1

    .line 989
    new-instance v0, Lorg/cybergarage/upnp/event/SubscriptionRequest;

    invoke-direct {v0}, Lorg/cybergarage/upnp/event/SubscriptionRequest;-><init>()V

    .line 990
    .local v0, "subReq":Lorg/cybergarage/upnp/event/SubscriptionRequest;
    invoke-virtual {v0, p1, p2, p3, p4}, Lorg/cybergarage/upnp/event/SubscriptionRequest;->setRenewRequest(Lorg/cybergarage/upnp/Service;Ljava/lang/String;J)V

    .line 991
    invoke-static {}, Lorg/cybergarage/util/Debug;->isOn()Z

    move-result v3

    if-ne v3, v2, :cond_0

    .line 992
    invoke-virtual {v0}, Lorg/cybergarage/upnp/event/SubscriptionRequest;->print()V

    .line 993
    :cond_0
    invoke-virtual {v0}, Lorg/cybergarage/upnp/event/SubscriptionRequest;->post()Lorg/cybergarage/upnp/event/SubscriptionResponse;

    move-result-object v1

    .line 994
    .local v1, "subRes":Lorg/cybergarage/upnp/event/SubscriptionResponse;
    invoke-static {}, Lorg/cybergarage/util/Debug;->isOn()Z

    move-result v3

    if-ne v3, v2, :cond_1

    .line 995
    invoke-virtual {v1}, Lorg/cybergarage/upnp/event/SubscriptionResponse;->print()V

    .line 996
    :cond_1
    invoke-virtual {v1}, Lorg/cybergarage/upnp/event/SubscriptionResponse;->isSuccessful()Z

    move-result v3

    if-ne v3, v2, :cond_2

    .line 997
    invoke-virtual {v1}, Lorg/cybergarage/upnp/event/SubscriptionResponse;->getSID()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Lorg/cybergarage/upnp/Service;->setSID(Ljava/lang/String;)V

    .line 998
    invoke-virtual {v1}, Lorg/cybergarage/upnp/event/SubscriptionResponse;->getTimeout()J

    move-result-wide v4

    invoke-virtual {p1, v4, v5}, Lorg/cybergarage/upnp/Service;->setTimeout(J)V

    .line 1002
    :goto_0
    return v2

    .line 1001
    :cond_2
    invoke-virtual {p1}, Lorg/cybergarage/upnp/Service;->clearSID()V

    .line 1002
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public unlock()V
    .locals 1

    .prologue
    .line 229
    iget-object v0, p0, Lorg/cybergarage/upnp/ControlPoint;->mutex:Lorg/cybergarage/util/Mutex;

    invoke-virtual {v0}, Lorg/cybergarage/util/Mutex;->unlock()V

    .line 230
    return-void
.end method

.method public unsubscribe()V
    .locals 6

    .prologue
    .line 1045
    sget-object v4, Lorg/cybergarage/upnp/ControlPoint;->TAG:Ljava/lang/String;

    const-string v5, "Subscribe :: unsubscribe() removed"

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1046
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v2

    .line 1047
    .local v2, "devList":Lorg/cybergarage/upnp/DeviceList;
    invoke-virtual {v2}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v1

    .line 1048
    .local v1, "devCnt":I
    const/4 v3, 0x0

    .local v3, "n":I
    :goto_0
    if-ge v3, v1, :cond_0

    .line 1049
    invoke-virtual {v2, v3}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v0

    .line 1050
    .local v0, "dev":Lorg/cybergarage/upnp/Device;
    invoke-virtual {p0, v0}, Lorg/cybergarage/upnp/ControlPoint;->unsubscribe(Lorg/cybergarage/upnp/Device;)V

    .line 1048
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1052
    .end local v0    # "dev":Lorg/cybergarage/upnp/Device;
    :cond_0
    return-void
.end method

.method public unsubscribe(Lorg/cybergarage/upnp/Device;)V
    .locals 9
    .param p1, "device"    # Lorg/cybergarage/upnp/Device;

    .prologue
    .line 1027
    sget-object v7, Lorg/cybergarage/upnp/ControlPoint;->TAG:Ljava/lang/String;

    const-string v8, "UPnPImpl Subscribe :: UnSubscription Called"

    invoke-static {v7, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1028
    invoke-virtual {p1}, Lorg/cybergarage/upnp/Device;->getServiceList()Lorg/cybergarage/upnp/ServiceList;

    move-result-object v6

    .line 1029
    .local v6, "serviceList":Lorg/cybergarage/upnp/ServiceList;
    invoke-virtual {v6}, Lorg/cybergarage/upnp/ServiceList;->size()I

    move-result v5

    .line 1030
    .local v5, "serviceCnt":I
    const/4 v3, 0x0

    .local v3, "n":I
    :goto_0
    if-ge v3, v5, :cond_1

    .line 1031
    invoke-virtual {v6, v3}, Lorg/cybergarage/upnp/ServiceList;->getService(I)Lorg/cybergarage/upnp/Service;

    move-result-object v4

    .line 1032
    .local v4, "service":Lorg/cybergarage/upnp/Service;
    invoke-virtual {v4}, Lorg/cybergarage/upnp/Service;->hasSID()Z

    move-result v7

    const/4 v8, 0x1

    if-ne v7, v8, :cond_0

    .line 1033
    invoke-virtual {p0, v4}, Lorg/cybergarage/upnp/ControlPoint;->unsubscribe(Lorg/cybergarage/upnp/Service;)Z

    .line 1030
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1036
    .end local v4    # "service":Lorg/cybergarage/upnp/Service;
    :cond_1
    invoke-virtual {p1}, Lorg/cybergarage/upnp/Device;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v2

    .line 1037
    .local v2, "childDevList":Lorg/cybergarage/upnp/DeviceList;
    invoke-virtual {v2}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v1

    .line 1038
    .local v1, "childDevCnt":I
    const/4 v3, 0x0

    :goto_1
    if-ge v3, v1, :cond_2

    .line 1039
    invoke-virtual {v2, v3}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v0

    .line 1040
    .local v0, "cdev":Lorg/cybergarage/upnp/Device;
    invoke-virtual {p0, v0}, Lorg/cybergarage/upnp/ControlPoint;->unsubscribe(Lorg/cybergarage/upnp/Device;)V

    .line 1038
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 1042
    .end local v0    # "cdev":Lorg/cybergarage/upnp/Device;
    :cond_2
    return-void
.end method

.method public unsubscribe(Lorg/cybergarage/upnp/Service;)Z
    .locals 4
    .param p1, "service"    # Lorg/cybergarage/upnp/Service;

    .prologue
    const/4 v2, 0x1

    .line 1016
    new-instance v0, Lorg/cybergarage/upnp/event/SubscriptionRequest;

    invoke-direct {v0}, Lorg/cybergarage/upnp/event/SubscriptionRequest;-><init>()V

    .line 1017
    .local v0, "subReq":Lorg/cybergarage/upnp/event/SubscriptionRequest;
    invoke-virtual {v0, p1}, Lorg/cybergarage/upnp/event/SubscriptionRequest;->setUnsubscribeRequest(Lorg/cybergarage/upnp/Service;)V

    .line 1018
    invoke-virtual {v0}, Lorg/cybergarage/upnp/event/SubscriptionRequest;->post()Lorg/cybergarage/upnp/event/SubscriptionResponse;

    move-result-object v1

    .line 1019
    .local v1, "subRes":Lorg/cybergarage/upnp/event/SubscriptionResponse;
    invoke-virtual {v1}, Lorg/cybergarage/upnp/event/SubscriptionResponse;->isSuccessful()Z

    move-result v3

    if-ne v3, v2, :cond_0

    .line 1020
    invoke-virtual {p1}, Lorg/cybergarage/upnp/Service;->clearSID()V

    .line 1023
    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public updateDevice(Lorg/cybergarage/upnp/Device;)V
    .locals 3
    .param p1, "device"    # Lorg/cybergarage/upnp/Device;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/cybergarage/xml/ParserException;
        }
    .end annotation

    .prologue
    .line 1453
    sget-object v0, Lorg/cybergarage/upnp/ControlPoint;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Updating device: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1454
    invoke-virtual {p0, p1}, Lorg/cybergarage/upnp/ControlPoint;->removeDevice(Lorg/cybergarage/upnp/Device;)V

    .line 1455
    invoke-virtual {p1}, Lorg/cybergarage/upnp/Device;->getSSDPPacket()Lorg/cybergarage/upnp/ssdp/SSDPPacket;

    move-result-object v0

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lorg/cybergarage/upnp/ControlPoint;->addDevice(Lorg/cybergarage/upnp/ssdp/SSDPPacket;Z)V

    .line 1456
    return-void
.end method
