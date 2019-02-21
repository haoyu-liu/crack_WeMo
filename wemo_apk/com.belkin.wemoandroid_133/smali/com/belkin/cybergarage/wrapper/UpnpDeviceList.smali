.class public Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
.super Lcom/belkin/cybergarage/wrapper/UpnpDeviceBase;
.source "UpnpDeviceList.java"

# interfaces
.implements Lorg/cybergarage/upnp/device/SearchResponseListener;
.implements Lorg/cybergarage/upnp/event/EventListener;
.implements Lorg/cybergarage/upnp/device/NotifyListener;
.implements Lorg/cybergarage/upnp/device/DeviceChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$DeletePresetCallback;,
        Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$GetPresetCallback;,
        Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$SetPresetCallback;,
        Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$SetDeviceNamePostActionCallback;,
        Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$GetPostActionCallback;,
        Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$SetPostActionCallback;,
        Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$getEndList;
    }
.end annotation


# static fields
.field private static final BULB_UPGRADE:Ljava/lang/String; = "0"

.field private static final FWUPDATETAG:Ljava/lang/String; = "FIRMWARE UPGRADE"

.field public static final SET_STATE:Ljava/lang/String; = "set_state"

.field private static final TAG:Ljava/lang/String; = "UpnpDeviceList"

.field private static udnIcons:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static udns:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/Date;",
            ">;"
        }
    .end annotation
.end field

.field private static upnpDeviceListInstance:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;


# instance fields
.field SEARCH_EXPIRY_INTERVAL:J

.field private airPurifierFw:[Ljava/lang/String;

.field private argumentsArray:[Ljava/lang/String;

.field private bridgeFW:[Ljava/lang/String;

.field private capabilityID:Ljava/lang/String;

.field private cofeeMakerFw:[Ljava/lang/String;

.field private deviceId:Ljava/lang/String;

.field private euFW:[Ljava/lang/String;

.field private filesToBeZipped:[Ljava/lang/String;

.field private firmDetailsList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private flexLEDFw:[Ljava/lang/String;

.field private gardenSpotFw:[Ljava/lang/String;

.field private heaterAFw:[Ljava/lang/String;

.field private heaterBFw:[Ljava/lang/String;

.field private heaterFw:[Ljava/lang/String;

.field private humidifierBFw:[Ljava/lang/String;

.field private humidifierFw:[Ljava/lang/String;

.field private insightFW:[Ljava/lang/String;

.field private isGroupAction:Ljava/lang/String;

.field private jsonBridgeArray:Lorg/json/JSONArray;

.field private jsonObject:Lorg/json/JSONObject;

.field private lightSwitchFW:[Ljava/lang/String;

.field private mBridgeUdn:Ljava/lang/String;

.field private mContext:Landroid/content/Context;

.field private mDeviceList:Lorg/cybergarage/upnp/DeviceList;

.field private mGroupId:Ljava/lang/String;

.field private mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

.field private mOpenBridgeRetryCount:I

.field private mResponseString:Ljava/lang/String;

.field private makerFW:[Ljava/lang/String;

.field private numofTries:I

.field private onORoff:Ljava/lang/String;

.field private openWRTAirPurifierFw:[Ljava/lang/String;

.field private openWRTCoffeeMakerFw:[Ljava/lang/String;

.field private openWRTHeaterAFw:[Ljava/lang/String;

.field private openWRTHeaterBFw:[Ljava/lang/String;

.field private openWRTHumidifierBFw:[Ljava/lang/String;

.field private openWRTHumidifierFw:[Ljava/lang/String;

.field private openWRTInsightV2:[Ljava/lang/String;

.field private openWRTLSFw:[Ljava/lang/String;

.field private openWRTMakerFw:[Ljava/lang/String;

.field private openWRTSlowCookerFw:[Ljava/lang/String;

.field private openWRTTransAirPurifierFw:[Ljava/lang/String;

.field private openWRTTransCoffeeMakerFw:[Ljava/lang/String;

.field private openWRTTransHeaterAFw:[Ljava/lang/String;

.field private openWRTTransHeaterBFw:[Ljava/lang/String;

.field private openWRTTransHumidifierBFw:[Ljava/lang/String;

.field private openWRTTransHumidifierFw:[Ljava/lang/String;

.field private openWRTTransLSFw:[Ljava/lang/String;

.field private openWRTTransMakerFw:[Ljava/lang/String;

.field private openWRTTransSlowCookerFw:[Ljava/lang/String;

.field private openWRTTransinsightFw:[Ljava/lang/String;

.field private openWRTTranssnsFw:[Ljava/lang/String;

.field private openWRTinsightFw:[Ljava/lang/String;

.field private openWRTsnsFw:[Ljava/lang/String;

.field private signedEUFW:[Ljava/lang/String;

.field private signedInsightFW:[Ljava/lang/String;

.field private signedLightSwitchFW:[Ljava/lang/String;

.field private signedUSFW:[Ljava/lang/String;

.field private slowCookerFw:[Ljava/lang/String;

.field private tempTunableFw:[Ljava/lang/String;

.field private timeOpenNetworkCheck:J

.field private usFW:[Ljava/lang/String;

.field private wemobulbFw:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 212
    const/4 v0, 0x0

    sput-object v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->upnpDeviceListInstance:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    .line 218
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->udns:Ljava/util/HashMap;

    .line 219
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->udnIcons:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 244
    invoke-direct {p0, p1}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceBase;-><init>(Landroid/content/Context;)V

    .line 153
    new-instance v0, Lorg/cybergarage/upnp/DeviceList;

    invoke-direct {v0}, Lorg/cybergarage/upnp/DeviceList;-><init>()V

    iput-object v0, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mDeviceList:Lorg/cybergarage/upnp/DeviceList;

    .line 154
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    .line 155
    new-array v0, v1, [Ljava/lang/String;

    iput-object v0, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->filesToBeZipped:[Ljava/lang/String;

    .line 157
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->argumentsArray:[Ljava/lang/String;

    .line 158
    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->lightSwitchFW:[Ljava/lang/String;

    .line 159
    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->makerFW:[Ljava/lang/String;

    .line 160
    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->signedLightSwitchFW:[Ljava/lang/String;

    .line 161
    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->euFW:[Ljava/lang/String;

    .line 162
    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->usFW:[Ljava/lang/String;

    .line 163
    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->signedEUFW:[Ljava/lang/String;

    .line 164
    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->signedUSFW:[Ljava/lang/String;

    .line 165
    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->insightFW:[Ljava/lang/String;

    .line 166
    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->signedInsightFW:[Ljava/lang/String;

    .line 167
    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->bridgeFW:[Ljava/lang/String;

    .line 170
    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->onORoff:Ljava/lang/String;

    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->deviceId:Ljava/lang/String;

    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->capabilityID:Ljava/lang/String;

    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->isGroupAction:Ljava/lang/String;

    .line 173
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    .line 174
    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mGroupId:Ljava/lang/String;

    .line 175
    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->slowCookerFw:[Ljava/lang/String;

    .line 176
    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->cofeeMakerFw:[Ljava/lang/String;

    .line 177
    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->heaterFw:[Ljava/lang/String;

    .line 178
    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->heaterAFw:[Ljava/lang/String;

    .line 179
    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->heaterBFw:[Ljava/lang/String;

    .line 180
    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->humidifierFw:[Ljava/lang/String;

    .line 181
    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->humidifierBFw:[Ljava/lang/String;

    .line 182
    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->airPurifierFw:[Ljava/lang/String;

    .line 183
    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->wemobulbFw:[Ljava/lang/String;

    .line 184
    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTSlowCookerFw:[Ljava/lang/String;

    .line 185
    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTCoffeeMakerFw:[Ljava/lang/String;

    .line 186
    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTHeaterAFw:[Ljava/lang/String;

    .line 187
    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTHeaterBFw:[Ljava/lang/String;

    .line 188
    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTHumidifierFw:[Ljava/lang/String;

    .line 189
    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTHumidifierBFw:[Ljava/lang/String;

    .line 190
    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTAirPurifierFw:[Ljava/lang/String;

    .line 191
    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTsnsFw:[Ljava/lang/String;

    .line 192
    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTinsightFw:[Ljava/lang/String;

    .line 193
    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTLSFw:[Ljava/lang/String;

    .line 194
    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTMakerFw:[Ljava/lang/String;

    .line 195
    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransSlowCookerFw:[Ljava/lang/String;

    .line 196
    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransCoffeeMakerFw:[Ljava/lang/String;

    .line 197
    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransHeaterAFw:[Ljava/lang/String;

    .line 198
    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransHeaterBFw:[Ljava/lang/String;

    .line 199
    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransHumidifierFw:[Ljava/lang/String;

    .line 200
    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransHumidifierBFw:[Ljava/lang/String;

    .line 201
    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransAirPurifierFw:[Ljava/lang/String;

    .line 202
    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTranssnsFw:[Ljava/lang/String;

    .line 203
    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransinsightFw:[Ljava/lang/String;

    .line 204
    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransLSFw:[Ljava/lang/String;

    .line 205
    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransMakerFw:[Ljava/lang/String;

    .line 206
    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTInsightV2:[Ljava/lang/String;

    .line 207
    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->gardenSpotFw:[Ljava/lang/String;

    .line 208
    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->tempTunableFw:[Ljava/lang/String;

    .line 209
    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->flexLEDFw:[Ljava/lang/String;

    .line 211
    iput v1, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->numofTries:I

    .line 215
    const/4 v0, 0x7

    iput v0, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mOpenBridgeRetryCount:I

    .line 221
    const-wide/16 v0, 0x7d0

    iput-wide v0, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->SEARCH_EXPIRY_INTERVAL:J

    .line 225
    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->firmDetailsList:Ljava/util/ArrayList;

    .line 245
    iput-object p1, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    .line 246
    new-instance v0, Lcom/belkin/wemo/cache/utils/MoreUtil;

    invoke-direct {v0}, Lcom/belkin/wemo/cache/utils/MoreUtil;-><init>()V

    iput-object v0, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    .line 247
    return-void
.end method

.method static synthetic access$000(Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    .prologue
    .line 147
    iget-object v0, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$100(Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    .prologue
    .line 147
    iget-object v0, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$102(Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 147
    iput-object p1, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$200(Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    .prologue
    .line 147
    iget-object v0, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->onORoff:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    .prologue
    .line 147
    iget-object v0, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->deviceId:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$400(Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    .prologue
    .line 147
    iget-object v0, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->capabilityID:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$500(Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    .prologue
    .line 147
    iget-object v0, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->isGroupAction:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$600(Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z
    .locals 1
    .param p0, "x0"    # Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    .param p1, "x1"    # Lorg/cybergarage/upnp/Action;
    .param p2, "x2"    # [Ljava/lang/String;
    .param p3, "x3"    # [Ljava/lang/String;

    .prologue
    .line 147
    invoke-direct {p0, p1, p2, p3}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$700(Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    .prologue
    .line 147
    iget-object v0, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mResponseString:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$702(Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 147
    iput-object p1, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mResponseString:Ljava/lang/String;

    return-object p1
.end method

.method private createGetEmergencyContactRequest()Ljava/lang/String;
    .locals 2

    .prologue
    .line 4569
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4570
    .local v0, "str":Ljava/lang/StringBuilder;
    const-string v1, "<DataStore>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4572
    const-string v1, "<Name>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4573
    const-string v1, "EmergencyContacts"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4574
    const-string v1, "</Name>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4576
    const-string v1, "</DataStore>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4577
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private createGetPresetRequest(Lorg/json/JSONArray;)Ljava/lang/String;
    .locals 4
    .param p1, "presetsInfo"    # Lorg/json/JSONArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 4729
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4730
    .local v0, "str":Ljava/lang/StringBuilder;
    const-string v1, "<presetList>\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4731
    const-string v1, "<devicePreset>\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4732
    const-string v1, "<version>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4733
    invoke-virtual {p1, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "version"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 4734
    const-string v1, "</version>\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4735
    const-string v1, "<isGroupID>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4736
    invoke-virtual {p1, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "isGroupID"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 4737
    const-string v1, "</isGroupID>\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4738
    const-string v1, "<id>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4739
    invoke-virtual {p1, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "id"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4740
    const-string v1, "</id>\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4741
    const-string v1, "<presets>\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4742
    const-string v1, "<preset>\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4743
    const-string v1, "</preset>\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4744
    const-string v1, "</presets>\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4745
    const-string v1, "</devicePreset>\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4746
    const-string v1, "</presetList>\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4747
    const-string v1, "UpnpDeviceList"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "createGetPresetRequest XML: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 4748
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private createSetDeletePresetRequest(Lorg/json/JSONArray;)Ljava/lang/String;
    .locals 4
    .param p1, "presetsInfo"    # Lorg/json/JSONArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 4697
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4698
    .local v0, "str":Ljava/lang/StringBuilder;
    const-string v1, "<presetList>\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4699
    const-string v1, "<devicePreset>\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4700
    const-string v1, "<version>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4701
    invoke-virtual {p1, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "version"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 4702
    const-string v1, "</version>\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4703
    const-string v1, "<isGroupID>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4704
    invoke-virtual {p1, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "isGroupID"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 4705
    const-string v1, "</isGroupID>\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4706
    const-string v1, "<id>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4707
    invoke-virtual {p1, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "id"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4708
    const-string v1, "</id>\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4709
    const-string v1, "<presets>\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4710
    const-string v1, "<preset>\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4711
    const-string v1, "<name>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4712
    invoke-virtual {p1, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "name"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4713
    const-string v1, "</name>\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4714
    const-string v1, "<value>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4715
    invoke-virtual {p1, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "value"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4716
    const-string v1, "</value>\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4717
    const-string v1, "<type>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4718
    invoke-virtual {p1, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "type"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4719
    const-string v1, "</type>\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4720
    const-string v1, "</preset>\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4721
    const-string v1, "</presets>\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4722
    const-string v1, "</devicePreset>\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4723
    const-string v1, "</presetList>\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4724
    const-string v1, "UpnpDeviceList"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "createSetPresetRequest XML: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 4725
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private createSetEmergencyContactRequest(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "emergencyContacts"    # Ljava/lang/String;

    .prologue
    .line 4553
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4554
    .local v0, "str":Ljava/lang/StringBuilder;
    const-string v1, "<DataStore>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4556
    const-string v1, "<Name>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4557
    const-string v1, "EmergencyContacts"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4558
    const-string v1, "</Name>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4560
    const-string v1, "<Value>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4561
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4562
    const-string v1, "</Value>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4564
    const-string v1, "</DataStore>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4565
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private createSimulatedRuleBridgeXml([Ljava/lang/String;)Ljava/lang/String;
    .locals 24
    .param p1, "DeviceXml"    # [Ljava/lang/String;

    .prologue
    .line 2250
    const/16 v16, 0x0

    .line 2253
    .local v16, "tempxml":Ljava/lang/String;
    :try_start_0
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v9

    .line 2254
    .local v9, "docFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    invoke-virtual {v9}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v8

    .line 2256
    .local v8, "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    invoke-virtual {v8}, Ljavax/xml/parsers/DocumentBuilder;->newDocument()Lorg/w3c/dom/Document;

    move-result-object v7

    .line 2258
    .local v7, "doc":Lorg/w3c/dom/Document;
    const-string v21, "SimulatedRuleData"

    move-object/from16 v0, v21

    invoke-interface {v7, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v4

    .line 2259
    .local v4, "SimulatedRuleDataTag":Lorg/w3c/dom/Element;
    invoke-interface {v7, v4}, Lorg/w3c/dom/Document;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 2261
    const/4 v5, 0x0

    .local v5, "count":I
    :goto_0
    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v21, v0

    move/from16 v0, v21

    if-ge v5, v0, :cond_1

    .line 2263
    const-string v21, "Device"

    move-object/from16 v0, v21

    invoke-interface {v7, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v3

    .line 2264
    .local v3, "DeviceTag":Lorg/w3c/dom/Element;
    invoke-interface {v4, v3}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 2266
    aget-object v19, p1, v5

    .line 2267
    .local v19, "udn":Ljava/lang/String;
    invoke-static/range {v19 .. v19}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v21

    if-nez v21, :cond_0

    .line 2268
    const-string v21, "["

    const-string v22, ""

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v12

    .line 2269
    .local v12, "repUdn":Ljava/lang/String;
    const-string v21, "]"

    const-string v22, ""

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-virtual {v12, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v13

    .line 2270
    .local v13, "repUdn1":Ljava/lang/String;
    const-string v21, "\""

    const-string v22, ""

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-virtual {v13, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 2272
    .local v14, "repUdn2":Ljava/lang/String;
    const-string v21, "UDN"

    move-object/from16 v0, v21

    invoke-interface {v7, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v6

    .line 2273
    .local v6, "deviceIdTag":Lorg/w3c/dom/Element;
    invoke-interface {v7, v14}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-interface {v6, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 2274
    invoke-interface {v3, v6}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 2276
    const-string v21, "index"

    move-object/from16 v0, v21

    invoke-interface {v7, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v10

    .line 2277
    .local v10, "indexTag":Lorg/w3c/dom/Element;
    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-interface {v7, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-interface {v10, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 2278
    invoke-interface {v3, v10}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 2261
    .end local v6    # "deviceIdTag":Lorg/w3c/dom/Element;
    .end local v10    # "indexTag":Lorg/w3c/dom/Element;
    .end local v12    # "repUdn":Ljava/lang/String;
    .end local v13    # "repUdn1":Ljava/lang/String;
    .end local v14    # "repUdn2":Ljava/lang/String;
    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 2282
    .end local v3    # "DeviceTag":Lorg/w3c/dom/Element;
    .end local v19    # "udn":Ljava/lang/String;
    :cond_1
    invoke-static {}, Ljavax/xml/transform/TransformerFactory;->newInstance()Ljavax/xml/transform/TransformerFactory;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljavax/xml/transform/TransformerFactory;->newTransformer()Ljavax/xml/transform/Transformer;

    move-result-object v18

    .line 2283
    .local v18, "transformer":Ljavax/xml/transform/Transformer;
    new-instance v20, Ljava/io/StringWriter;

    invoke-direct/range {v20 .. v20}, Ljava/io/StringWriter;-><init>()V

    .line 2284
    .local v20, "writer":Ljava/io/StringWriter;
    new-instance v15, Ljavax/xml/transform/stream/StreamResult;

    move-object/from16 v0, v20

    invoke-direct {v15, v0}, Ljavax/xml/transform/stream/StreamResult;-><init>(Ljava/io/Writer;)V

    .line 2285
    .local v15, "result":Ljavax/xml/transform/stream/StreamResult;
    new-instance v21, Ljavax/xml/transform/dom/DOMSource;

    move-object/from16 v0, v21

    invoke-direct {v0, v7}, Ljavax/xml/transform/dom/DOMSource;-><init>(Lorg/w3c/dom/Node;)V

    move-object/from16 v0, v18

    move-object/from16 v1, v21

    invoke-virtual {v0, v1, v15}, Ljavax/xml/transform/Transformer;->transform(Ljavax/xml/transform/Source;Ljavax/xml/transform/Result;)V

    .line 2287
    invoke-virtual/range {v20 .. v20}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v16

    .line 2288
    const-string v21, "UpnpDeviceList"

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "File simulated ruled saved!"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljavax/xml/transform/TransformerException; {:try_start_0 .. :try_end_0} :catch_1

    .line 2294
    .end local v4    # "SimulatedRuleDataTag":Lorg/w3c/dom/Element;
    .end local v5    # "count":I
    .end local v7    # "doc":Lorg/w3c/dom/Document;
    .end local v8    # "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    .end local v9    # "docFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    .end local v15    # "result":Ljavax/xml/transform/stream/StreamResult;
    .end local v18    # "transformer":Ljavax/xml/transform/Transformer;
    .end local v20    # "writer":Ljava/io/StringWriter;
    :goto_1
    return-object v16

    .line 2289
    :catch_0
    move-exception v11

    .line 2290
    .local v11, "pce":Ljavax/xml/parsers/ParserConfigurationException;
    invoke-virtual {v11}, Ljavax/xml/parsers/ParserConfigurationException;->printStackTrace()V

    goto :goto_1

    .line 2291
    .end local v11    # "pce":Ljavax/xml/parsers/ParserConfigurationException;
    :catch_1
    move-exception v17

    .line 2292
    .local v17, "tfe":Ljavax/xml/transform/TransformerException;
    invoke-virtual/range {v17 .. v17}, Ljavax/xml/transform/TransformerException;->printStackTrace()V

    goto :goto_1
.end method

.method private createSimulatedRuleXml([Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p1, "DeviceXml"    # [Ljava/lang/String;

    .prologue
    .line 2360
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 2361
    .local v2, "simulatedRulexml":Ljava/lang/StringBuffer;
    const-string v7, "\n"

    invoke-virtual {v2, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 2362
    const-string v7, "<SimulatedRuleData>"

    invoke-virtual {v2, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 2363
    const-string v7, "\n"

    invoke-virtual {v2, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 2364
    const/4 v0, 0x0

    .local v0, "count":I
    :goto_0
    array-length v7, p1

    if-ge v0, v7, :cond_1

    .line 2366
    aget-object v6, p1, v0

    .line 2367
    .local v6, "udn":Ljava/lang/String;
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 2368
    const-string v7, "<Device>"

    invoke-virtual {v2, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 2369
    const-string v7, "\n"

    invoke-virtual {v2, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 2370
    const-string v7, "<UDN>"

    invoke-virtual {v2, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 2371
    invoke-virtual {v2, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 2372
    const-string v7, "</UDN>"

    invoke-virtual {v2, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 2373
    const-string v7, "\n"

    invoke-virtual {v2, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 2374
    const-string v7, "<index>"

    invoke-virtual {v2, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 2375
    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 2376
    const-string v7, "</index>"

    invoke-virtual {v2, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 2377
    const-string v7, "\n"

    invoke-virtual {v2, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 2378
    const-string v7, "</Device>"

    invoke-virtual {v2, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 2379
    const-string v7, "\n"

    invoke-virtual {v2, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 2364
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2382
    .end local v6    # "udn":Ljava/lang/String;
    :cond_1
    const-string v7, "</SimulatedRuleData>"

    invoke-virtual {v2, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 2383
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    .line 2384
    .local v3, "soXml":Ljava/lang/String;
    const-string v7, "["

    const-string v8, ""

    invoke-virtual {v3, v7, v8}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    .line 2385
    .local v4, "soXml1":Ljava/lang/String;
    const-string v7, "]"

    const-string v8, ""

    invoke-virtual {v4, v7, v8}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v5

    .line 2386
    .local v5, "soXml2":Ljava/lang/String;
    const-string v7, "\""

    const-string v8, ""

    invoke-virtual {v5, v7, v8}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 2388
    .local v1, "finalSoXml":Ljava/lang/String;
    return-object v1
.end method

.method private doBridgeXml(Lorg/json/JSONArray;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 30
    .param p1, "deviceIds"    # Lorg/json/JSONArray;
    .param p2, "GroupCapabilityIDs"    # Ljava/lang/String;
    .param p3, "GroupCapabilityValues"    # Ljava/lang/String;
    .param p4, "groupName"    # Ljava/lang/String;
    .param p5, "groupId"    # Ljava/lang/String;

    .prologue
    .line 1934
    const/16 v22, 0x0

    .line 1935
    .local v22, "tempxml":Ljava/lang/String;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v26

    const-wide/16 v28, 0x3e8

    div-long v18, v26, v28

    .line 1936
    .local v18, "seconds":J
    const-string v26, "UpnpDeviceList"

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "Seconds*******: "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    move-wide/from16 v1, v18

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "--"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    move-object/from16 v1, p5

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v26 .. v27}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1938
    :try_start_0
    new-instance v21, Ljava/util/ArrayList;

    invoke-direct/range {v21 .. v21}, Ljava/util/ArrayList;-><init>()V

    .line 1940
    .local v21, "strtemp":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    .line 1941
    .local v6, "devIds":Ljava/lang/StringBuffer;
    const/4 v15, 0x0

    .local v15, "i":I
    :goto_0
    invoke-virtual/range {p1 .. p1}, Lorg/json/JSONArray;->length()I

    move-result v26

    move/from16 v0, v26

    if-ge v15, v0, :cond_1

    .line 1942
    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v6, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1943
    invoke-virtual/range {p1 .. p1}, Lorg/json/JSONArray;->length()I

    move-result v26

    add-int/lit8 v26, v26, -0x1

    move/from16 v0, v26

    if-ge v15, v0, :cond_0

    .line 1944
    const-string v26, ","

    move-object/from16 v0, v26

    invoke-virtual {v6, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1945
    :cond_0
    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v21

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1941
    add-int/lit8 v15, v15, 0x1

    goto :goto_0

    .line 1948
    :cond_1
    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v20

    .line 1950
    .local v20, "strDevIds":Ljava/lang/String;
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v11

    .line 1951
    .local v11, "docFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    invoke-virtual {v11}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v10

    .line 1954
    .local v10, "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    invoke-virtual {v10}, Ljavax/xml/parsers/DocumentBuilder;->newDocument()Lorg/w3c/dom/Document;

    move-result-object v9

    .line 1956
    .local v9, "doc":Lorg/w3c/dom/Document;
    const-string v26, "CreateGroup"

    move-object/from16 v0, v26

    invoke-interface {v9, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v8

    .line 1957
    .local v8, "deviceStatusTag":Lorg/w3c/dom/Element;
    invoke-interface {v9, v8}, Lorg/w3c/dom/Document;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 1959
    const-string v26, "GroupID"

    move-object/from16 v0, v26

    invoke-interface {v9, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v13

    .line 1960
    .local v13, "groupAvailableTag":Lorg/w3c/dom/Element;
    invoke-static/range {v18 .. v19}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v26

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mGroupId:Ljava/lang/String;

    .line 1961
    const-string v26, "0"

    move-object/from16 v0, p5

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v26

    if-eqz v26, :cond_2

    .line 1962
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mGroupId:Ljava/lang/String;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    invoke-interface {v9, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-interface {v13, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 1965
    :goto_1
    invoke-interface {v8, v13}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 1968
    const-string v26, "GroupName"

    move-object/from16 v0, v26

    invoke-interface {v9, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v7

    .line 1969
    .local v7, "deviceIdTag":Lorg/w3c/dom/Element;
    move-object/from16 v0, p4

    invoke-interface {v9, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-interface {v7, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 1970
    invoke-interface {v8, v7}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 1973
    const-string v26, "DeviceIDList"

    move-object/from16 v0, v26

    invoke-interface {v9, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v4

    .line 1974
    .local v4, "capabilityIdTag":Lorg/w3c/dom/Element;
    move-object/from16 v0, v20

    invoke-interface {v9, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-interface {v4, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 1975
    invoke-interface {v8, v4}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 1978
    const-string v26, "GroupCapabilityIDs"

    move-object/from16 v0, v26

    invoke-interface {v9, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v5

    .line 1979
    .local v5, "capabilityValueTag":Lorg/w3c/dom/Element;
    move-object/from16 v0, p2

    invoke-interface {v9, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-interface {v5, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 1980
    invoke-interface {v8, v5}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 1983
    const-string v26, "GroupCapabilityValues"

    move-object/from16 v0, v26

    invoke-interface {v9, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v14

    .line 1984
    .local v14, "groupCapabilityIdTag":Lorg/w3c/dom/Element;
    move-object/from16 v0, p3

    invoke-interface {v9, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-interface {v14, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 1985
    invoke-interface {v8, v14}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 1987
    invoke-static {}, Ljavax/xml/transform/TransformerFactory;->newInstance()Ljavax/xml/transform/TransformerFactory;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljavax/xml/transform/TransformerFactory;->newTransformer()Ljavax/xml/transform/Transformer;

    move-result-object v24

    .line 1988
    .local v24, "transformer":Ljavax/xml/transform/Transformer;
    new-instance v25, Ljava/io/StringWriter;

    invoke-direct/range {v25 .. v25}, Ljava/io/StringWriter;-><init>()V

    .line 1989
    .local v25, "writer":Ljava/io/StringWriter;
    new-instance v17, Ljavax/xml/transform/stream/StreamResult;

    move-object/from16 v0, v17

    move-object/from16 v1, v25

    invoke-direct {v0, v1}, Ljavax/xml/transform/stream/StreamResult;-><init>(Ljava/io/Writer;)V

    .line 1990
    .local v17, "result":Ljavax/xml/transform/stream/StreamResult;
    new-instance v26, Ljavax/xml/transform/dom/DOMSource;

    move-object/from16 v0, v26

    invoke-direct {v0, v9}, Ljavax/xml/transform/dom/DOMSource;-><init>(Lorg/w3c/dom/Node;)V

    move-object/from16 v0, v24

    move-object/from16 v1, v26

    move-object/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Ljavax/xml/transform/Transformer;->transform(Ljavax/xml/transform/Source;Ljavax/xml/transform/Result;)V

    .line 1993
    invoke-virtual/range {v25 .. v25}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v22

    .line 1994
    const-string v26, "UpnpDeviceList"

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "File saved!"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v26 .. v27}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2003
    .end local v4    # "capabilityIdTag":Lorg/w3c/dom/Element;
    .end local v5    # "capabilityValueTag":Lorg/w3c/dom/Element;
    .end local v6    # "devIds":Ljava/lang/StringBuffer;
    .end local v7    # "deviceIdTag":Lorg/w3c/dom/Element;
    .end local v8    # "deviceStatusTag":Lorg/w3c/dom/Element;
    .end local v9    # "doc":Lorg/w3c/dom/Document;
    .end local v10    # "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    .end local v11    # "docFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    .end local v13    # "groupAvailableTag":Lorg/w3c/dom/Element;
    .end local v14    # "groupCapabilityIdTag":Lorg/w3c/dom/Element;
    .end local v15    # "i":I
    .end local v17    # "result":Ljavax/xml/transform/stream/StreamResult;
    .end local v20    # "strDevIds":Ljava/lang/String;
    .end local v21    # "strtemp":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v24    # "transformer":Ljavax/xml/transform/Transformer;
    .end local v25    # "writer":Ljava/io/StringWriter;
    :goto_2
    return-object v22

    .line 1964
    .restart local v6    # "devIds":Ljava/lang/StringBuffer;
    .restart local v8    # "deviceStatusTag":Lorg/w3c/dom/Element;
    .restart local v9    # "doc":Lorg/w3c/dom/Document;
    .restart local v10    # "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    .restart local v11    # "docFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    .restart local v13    # "groupAvailableTag":Lorg/w3c/dom/Element;
    .restart local v15    # "i":I
    .restart local v20    # "strDevIds":Ljava/lang/String;
    .restart local v21    # "strtemp":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_2
    move-object/from16 v0, p5

    invoke-interface {v9, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-interface {v13, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;
    :try_end_0
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljavax/xml/transform/TransformerException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_2

    goto/16 :goto_1

    .line 1995
    .end local v6    # "devIds":Ljava/lang/StringBuffer;
    .end local v8    # "deviceStatusTag":Lorg/w3c/dom/Element;
    .end local v9    # "doc":Lorg/w3c/dom/Document;
    .end local v10    # "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    .end local v11    # "docFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    .end local v13    # "groupAvailableTag":Lorg/w3c/dom/Element;
    .end local v15    # "i":I
    .end local v20    # "strDevIds":Ljava/lang/String;
    .end local v21    # "strtemp":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :catch_0
    move-exception v16

    .line 1996
    .local v16, "pce":Ljavax/xml/parsers/ParserConfigurationException;
    invoke-virtual/range {v16 .. v16}, Ljavax/xml/parsers/ParserConfigurationException;->printStackTrace()V

    goto :goto_2

    .line 1997
    .end local v16    # "pce":Ljavax/xml/parsers/ParserConfigurationException;
    :catch_1
    move-exception v23

    .line 1998
    .local v23, "tfe":Ljavax/xml/transform/TransformerException;
    invoke-virtual/range {v23 .. v23}, Ljavax/xml/transform/TransformerException;->printStackTrace()V

    goto :goto_2

    .line 1999
    .end local v23    # "tfe":Ljavax/xml/transform/TransformerException;
    :catch_2
    move-exception v12

    .line 2001
    .local v12, "e":Lorg/json/JSONException;
    invoke-virtual {v12}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_2
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 232
    const-class v1, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->upnpDeviceListInstance:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    if-nez v0, :cond_0

    .line 233
    new-instance v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    invoke-direct {v0, p0}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->upnpDeviceListInstance:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    .line 236
    :cond_0
    sget-object v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->upnpDeviceListInstance:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 232
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private getRegistrationDataArgs()Ljava/lang/String;
    .locals 5

    .prologue
    .line 4372
    new-instance v0, Lcom/belkin/utils/WiFiSecurityUtil;

    invoke-direct {v0}, Lcom/belkin/utils/WiFiSecurityUtil;-><init>()V

    .line 4373
    .local v0, "mWiFiSecurityUtil":Lcom/belkin/utils/WiFiSecurityUtil;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "<SmartDeviceData><SmartUniqueId>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v2}, Lcom/belkin/utils/WiFiSecurityUtil;->getDeviceID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</SmartUniqueId>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<ReUnionKey>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    new-instance v2, Lcom/belkin/wemo/cache/utils/MoreUtil;

    invoke-direct {v2}, Lcom/belkin/wemo/cache/utils/MoreUtil;-><init>()V

    new-instance v3, Lcom/belkin/wemo/cache/utils/SharePreferences;

    iget-object v4, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-direct {v3, v4}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v3}, Lcom/belkin/wemo/cache/utils/MoreUtil;->getReUnionKey(Lcom/belkin/wemo/cache/utils/SharePreferences;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</ReUnionKey></SmartDeviceData>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private getRegistrationWorker(Lorg/cybergarage/upnp/Action;)Lorg/json/JSONObject;
    .locals 6
    .param p1, "action"    # Lorg/cybergarage/upnp/Action;

    .prologue
    .line 4357
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    .line 4359
    :try_start_0
    invoke-virtual {p1}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v2

    .line 4360
    .local v2, "response":Ljava/lang/String;
    const-string v3, "UpnpDeviceList"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Response : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 4361
    new-instance v1, Lcom/belkin/upnp/parser/RegistrationDataResponseParser;

    invoke-direct {v1}, Lcom/belkin/upnp/parser/RegistrationDataResponseParser;-><init>()V

    .line 4362
    .local v1, "registrationDataResponseParser":Lcom/belkin/upnp/parser/RegistrationDataResponseParser;
    invoke-virtual {v1, v2}, Lcom/belkin/upnp/parser/RegistrationDataResponseParser;->parseResponse(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    iput-object v3, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    .line 4363
    iget-object v3, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 4368
    .end local v1    # "registrationDataResponseParser":Lcom/belkin/upnp/parser/RegistrationDataResponseParser;
    .end local v2    # "response":Ljava/lang/String;
    :goto_0
    return-object v3

    .line 4365
    :catch_0
    move-exception v0

    .line 4366
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 4368
    iget-object v3, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    goto :goto_0
.end method

.method private getRemoteAccessAgrs()[Ljava/lang/String;
    .locals 7

    .prologue
    const/4 v6, 0x1

    .line 763
    const/16 v4, 0x8

    new-array v0, v4, [Ljava/lang/String;

    .line 764
    .local v0, "arrstrRemoteAccessArgs":[Ljava/lang/String;
    new-instance v2, Lcom/belkin/wemo/cache/utils/SharePreferences;

    iget-object v4, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-direct {v2, v4}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    .line 765
    .local v2, "sharePreference":Lcom/belkin/wemo/cache/utils/SharePreferences;
    new-instance v3, Lcom/belkin/utils/WiFiSecurityUtil;

    invoke-direct {v3}, Lcom/belkin/utils/WiFiSecurityUtil;-><init>()V

    .line 767
    .local v3, "wiFiSecurityUtil":Lcom/belkin/utils/WiFiSecurityUtil;
    const/4 v4, 0x0

    iget-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-virtual {v3, v5}, Lcom/belkin/utils/WiFiSecurityUtil;->getDeviceID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v0, v4

    .line 768
    new-instance v1, Ljava/util/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-direct {v1, v4, v5}, Ljava/util/Date;-><init>(J)V

    .line 769
    .local v1, "date":Ljava/util/Date;
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/util/TimeZone;->inDaylightTime(Ljava/util/Date;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 770
    const-string v4, "1"

    aput-object v4, v0, v6

    .line 774
    :goto_0
    const/4 v4, 0x2

    invoke-virtual {v2}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getHomeId()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v0, v4

    .line 775
    const/4 v4, 0x3

    new-instance v5, Lcom/belkin/wemo/cache/utils/MoreUtil;

    invoke-direct {v5}, Lcom/belkin/wemo/cache/utils/MoreUtil;-><init>()V

    iget-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-virtual {v5, v6}, Lcom/belkin/wemo/cache/utils/MoreUtil;->getDeviceUserName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v0, v4

    .line 776
    const/4 v4, 0x4

    const-string v5, ""

    aput-object v5, v0, v4

    .line 777
    const/4 v4, 0x5

    const-string v5, ""

    aput-object v5, v0, v4

    .line 778
    const/4 v4, 0x6

    const-string v5, ""

    aput-object v5, v0, v4

    .line 779
    const/4 v4, 0x7

    iget-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-virtual {v3, v5}, Lcom/belkin/utils/WiFiSecurityUtil;->generateAuthCode(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v0, v4

    .line 781
    return-object v0

    .line 772
    :cond_0
    const-string v4, "0"

    aput-object v4, v0, v6

    goto :goto_0
.end method

.method private isWeMo(Ljava/lang/String;)Z
    .locals 2
    .param p1, "deviceType"    # Ljava/lang/String;

    .prologue
    .line 546
    const-string v0, "urn:Belkin:device:socket:1"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "urn:Belkin:device:controllee:1"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "urn:Belkin:device:sensor:1"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "urn:Belkin:device:NetCamSensor:1"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "urn:Belkin:device:lightswitch:1"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "urn:Belkin:device:bridge:1"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "urn:Belkin:device:CoffeeMaker:1"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "urn:Belkin:device:Crockpot:1"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "urn:Belkin:device:Crockpot:1"

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "urn:Belkin:device:insight:1"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "urn:Belkin:device:Heater:1"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "urn:Belkin:device:AirPurifier:1"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "urn:Belkin:device:Humidifier:1"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "urn:Belkin:device:HumidifierB:1"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "urn:Belkin:device:Maker:1"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 561
    :cond_0
    const/4 v0, 0x1

    .line 562
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private printDeviceList()V
    .locals 7

    .prologue
    .line 4235
    invoke-virtual {p0}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v1

    .line 4236
    .local v1, "dl":Lorg/cybergarage/upnp/DeviceList;
    invoke-virtual {v1}, Lorg/cybergarage/upnp/DeviceList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 4237
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/cybergarage/upnp/Device;

    .line 4239
    .local v0, "device":Lorg/cybergarage/upnp/Device;
    :try_start_0
    const-string v4, "UpnpDeviceList"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "printDeviceList inner device:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " hash: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " location: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Lorg/cybergarage/upnp/Device;->getLocation()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " isRoot: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Lorg/cybergarage/upnp/Device;->isRootDevice()Z

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 4240
    :catch_0
    move-exception v2

    .line 4242
    .local v2, "e":Ljava/lang/Exception;
    const-string v4, "UpnpDeviceList"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "printDeviceList Exception: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 4245
    .end local v0    # "device":Lorg/cybergarage/upnp/Device;
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_0
    return-void
.end method

.method private sendSmartSetupRequest(Lorg/cybergarage/upnp/Action;Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .locals 12
    .param p1, "action"    # Lorg/cybergarage/upnp/Action;
    .param p2, "jsonObject"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 4333
    const/4 v4, 0x1

    .line 4334
    .local v4, "failed":Z
    const/4 v5, 0x0

    .line 4335
    .local v5, "retry":Z
    const/4 v0, 0x0

    .line 4336
    .local v0, "count":I
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 4338
    .local v2, "currentTime":J
    :cond_0
    const-string v6, "UpnpDeviceList"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "sendSmartSetupRequest Trying:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 4339
    invoke-direct {p0, p1}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getRegistrationWorker(Lorg/cybergarage/upnp/Action;)Lorg/json/JSONObject;

    move-result-object p2

    .line 4340
    const-string v6, "F"

    const-string v7, "registrationStatus"

    invoke-virtual {p2, v7}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    .line 4341
    const-string v6, "RETRY"

    const-string v7, "statusCode"

    invoke-virtual {p2, v7}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    .line 4342
    const-string v6, "UpnpDeviceList"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "sendSmartSetupRequest failed: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " retry: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 4344
    if-eqz v4, :cond_1

    if-eqz v5, :cond_1

    .line 4345
    const-wide/16 v6, 0x2710

    :try_start_0
    invoke-static {v6, v7}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4351
    :cond_1
    :goto_0
    if-eqz v4, :cond_2

    if-eqz v5, :cond_2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sub-long/2addr v6, v2

    const-wide/32 v8, 0xea60

    cmp-long v6, v6, v8

    if-ltz v6, :cond_0

    .line 4352
    :cond_2
    const-string v6, "UpnpDeviceList"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "sendSmartSetupRequest Exiting failed: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " retry: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " timediff(secs): "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    sub-long/2addr v8, v2

    const-wide/16 v10, 0x3e8

    div-long/2addr v8, v10

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 4353
    return-object p2

    .line 4346
    :catch_0
    move-exception v1

    .line 4348
    .local v1, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v1}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0
.end method

.method private setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z
    .locals 4
    .param p1, "action"    # Lorg/cybergarage/upnp/Action;
    .param p2, "keyList"    # [Ljava/lang/String;
    .param p3, "argList"    # [Ljava/lang/String;

    .prologue
    .line 715
    if-eqz p3, :cond_0

    if-eqz p2, :cond_0

    .line 716
    const/4 v0, 0x0

    .local v0, "counter":I
    :goto_0
    array-length v1, p2

    if-ge v0, v1, :cond_1

    .line 717
    const-string v1, "UpnpDeviceList"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Key "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    aget-object v3, p2, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    aget-object v3, p3, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " Value"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 718
    aget-object v1, p2, v0

    aget-object v2, p3, v0

    invoke-virtual {p1, v1, v2}, Lorg/cybergarage/upnp/Action;->setArgumentValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 716
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 721
    .end local v0    # "counter":I
    :cond_0
    const/4 v1, 0x0

    .line 723
    :goto_1
    return v1

    .restart local v0    # "counter":I
    :cond_1
    const/4 v1, 0x1

    goto :goto_1
.end method

.method private timeSync()[Ljava/lang/String;
    .locals 12

    .prologue
    const/4 v10, 0x3

    const/4 v9, 0x2

    const/4 v8, 0x1

    .line 382
    const/4 v6, 0x4

    new-array v0, v6, [Ljava/lang/String;

    .line 383
    .local v0, "argList":[Ljava/lang/String;
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v5

    .line 384
    .local v5, "t":Ljava/util/TimeZone;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Ljava/util/TimeZone;->getOffset(J)I

    move-result v2

    .line 385
    .local v2, "offset":I
    div-int/lit16 v6, v2, 0x3e8

    div-int/lit8 v6, v6, 0x3c

    div-int/lit8 v3, v6, 0x3c

    .line 386
    .local v3, "offsetHrs":I
    div-int/lit16 v6, v2, 0x3e8

    div-int/lit8 v6, v6, 0x3c

    rem-int/lit8 v4, v6, 0x3c

    .line 387
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

    .line 388
    const/16 v6, 0x1e

    if-ne v4, v6, :cond_0

    .line 389
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

    .line 392
    :cond_0
    new-instance v1, Ljava/util/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-direct {v1, v6, v7}, Ljava/util/Date;-><init>(J)V

    .line 393
    .local v1, "date":Ljava/util/Date;
    invoke-virtual {v5, v1}, Ljava/util/TimeZone;->inDaylightTime(Ljava/util/Date;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 394
    const-string v6, "1"

    aput-object v6, v0, v9

    .line 399
    :goto_0
    invoke-virtual {v5}, Ljava/util/TimeZone;->useDaylightTime()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 400
    const-string v6, "1"

    aput-object v6, v0, v10

    .line 404
    :goto_1
    const/4 v6, 0x0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    const-wide/16 v10, 0x3e8

    div-long/2addr v8, v10

    invoke-static {v8, v9}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v0, v6

    .line 406
    return-object v0

    .line 396
    :cond_1
    const-string v6, "0"

    aput-object v6, v0, v9

    goto :goto_0

    .line 402
    :cond_2
    const-string v6, "0"

    aput-object v6, v0, v10

    goto :goto_1
.end method

.method public static upperCaseFirstChar(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p0, "inputString"    # Ljava/lang/String;

    .prologue
    .line 4222
    const-string v2, ""

    .line 4223
    .local v2, "result":Ljava/lang/String;
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_0

    move-object v3, v2

    .line 4231
    .end local v2    # "result":Ljava/lang/String;
    .local v3, "result":Ljava/lang/String;
    :goto_0
    return-object v3

    .line 4226
    .end local v3    # "result":Ljava/lang/String;
    .restart local v2    # "result":Ljava/lang/String;
    :cond_0
    const/4 v4, 0x0

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v0

    .line 4227
    .local v0, "firstChar":C
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 4228
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v1, v4, :cond_1

    .line 4229
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 4228
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_1
    move-object v3, v2

    .line 4231
    .end local v2    # "result":Ljava/lang/String;
    .restart local v3    # "result":Ljava/lang/String;
    goto :goto_0
.end method


# virtual methods
.method public UpdateBulbFirmware(Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONArray;
    .locals 10
    .param p1, "deviceList"    # Ljava/lang/String;
    .param p2, "firmwareLink"    # Ljava/lang/String;

    .prologue
    .line 2048
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    .line 2049
    .local v2, "createGroupArray":Lorg/json/JSONArray;
    iget-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v6

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v1

    .line 2050
    .local v1, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v6

    invoke-virtual {v6}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v6

    if-ge v4, v6, :cond_1

    .line 2051
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v6

    invoke-virtual {v6, v4}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v6

    invoke-virtual {v6}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v6

    const-string v7, "Bridge"

    invoke-virtual {v6, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 2052
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v6

    invoke-virtual {v6, v4}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v6

    invoke-virtual {v6}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    .line 2050
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 2056
    :cond_1
    :try_start_0
    iget-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    invoke-virtual {v1, v6}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v6

    const-string v7, "UpgradeSubDeviceFirmware"

    invoke-virtual {v6, v7}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 2057
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    sget-object v6, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->ARGS_UPDATE_BULB_FIRMWARE:[Ljava/lang/String;

    const/4 v7, 0x3

    new-array v7, v7, [Ljava/lang/String;

    const/4 v8, 0x0

    aput-object p1, v7, v8

    const/4 v8, 0x1

    aput-object p2, v7, v8

    const/4 v8, 0x2

    const-string v9, "0"

    aput-object v9, v7, v8

    invoke-direct {p0, v0, v6, v7}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 2058
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v5

    .line 2059
    .local v5, "response":Ljava/lang/String;
    const-string v6, "UpnpDeviceList"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "BULB FIRMWARE RESPOMSE: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2064
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v5    # "response":Ljava/lang/String;
    :goto_1
    return-object v2

    .line 2061
    :catch_0
    move-exception v3

    .line 2062
    .local v3, "e":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method public UpnpInitialization()Z
    .locals 2

    .prologue
    .line 259
    iget-object v1, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mDeviceList:Lorg/cybergarage/upnp/DeviceList;

    invoke-virtual {v1}, Lorg/cybergarage/upnp/DeviceList;->clear()V

    .line 260
    iget-object v1, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v0

    .line 261
    .local v0, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    invoke-virtual {p0}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 262
    invoke-virtual {v0, p0}, Lorg/cybergarage/upnp/ControlPoint;->addEventListener(Lorg/cybergarage/upnp/event/EventListener;)V

    .line 263
    invoke-virtual {v0, p0}, Lorg/cybergarage/upnp/ControlPoint;->addNotifyListener(Lorg/cybergarage/upnp/device/NotifyListener;)V

    .line 264
    invoke-virtual {v0, p0}, Lorg/cybergarage/upnp/ControlPoint;->addDeviceChangeListener(Lorg/cybergarage/upnp/device/DeviceChangeListener;)V

    .line 265
    const/4 v1, 0x1

    .line 267
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public addBridgeDevices(Lorg/json/JSONArray;)Lorg/json/JSONArray;
    .locals 13
    .param p1, "LedDeviceIds"    # Lorg/json/JSONArray;

    .prologue
    .line 1594
    const-string v10, "UpnpDeviceList"

    const-string v11, "addBridgeDevices()"

    invoke-static {v10, v11}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1595
    new-instance v9, Lorg/json/JSONArray;

    invoke-direct {v9}, Lorg/json/JSONArray;-><init>()V

    .line 1596
    .local v9, "tempJsonArray":Lorg/json/JSONArray;
    iget-object v10, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v10}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v10

    invoke-virtual {v10}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v1

    .line 1597
    .local v1, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v10

    invoke-virtual {v10}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v10

    if-ge v5, v10, :cond_1

    .line 1598
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v10

    invoke-virtual {v10, v5}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v10

    invoke-virtual {v10}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v10

    const-string v11, "Bridge"

    invoke-virtual {v10, v11}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 1599
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v10

    invoke-virtual {v10, v5}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v10

    invoke-virtual {v10}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v10

    iput-object v10, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    .line 1597
    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 1604
    :cond_1
    :try_start_0
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    .line 1605
    .local v3, "devIds":Ljava/lang/StringBuffer;
    const/4 v5, 0x0

    :goto_1
    const/4 v10, 0x0

    invoke-virtual {p1, v10}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v10

    invoke-virtual {v10}, Lorg/json/JSONArray;->length()I

    move-result v10

    if-ge v5, v10, :cond_3

    .line 1606
    const/4 v10, 0x0

    invoke-virtual {p1, v10}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v10

    invoke-virtual {v10, v5}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v3, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1607
    const/4 v10, 0x0

    invoke-virtual {p1, v10}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v10

    invoke-virtual {v10}, Lorg/json/JSONArray;->length()I

    move-result v10

    add-int/lit8 v10, v10, -0x1

    if-ge v5, v10, :cond_2

    .line 1608
    const-string v10, ","

    invoke-virtual {v3, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1605
    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 1611
    :cond_3
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 1612
    .local v2, "devIdFriendlyNames":Ljava/lang/StringBuffer;
    const/4 v5, 0x0

    :goto_2
    const/4 v10, 0x1

    invoke-virtual {p1, v10}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v10

    invoke-virtual {v10}, Lorg/json/JSONArray;->length()I

    move-result v10

    if-ge v5, v10, :cond_5

    .line 1613
    const/4 v10, 0x1

    invoke-virtual {p1, v10}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v10

    invoke-virtual {v10, v5}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v2, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1614
    const/4 v10, 0x1

    invoke-virtual {p1, v10}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v10

    invoke-virtual {v10}, Lorg/json/JSONArray;->length()I

    move-result v10

    add-int/lit8 v10, v10, -0x1

    if-ge v5, v10, :cond_4

    .line 1615
    const-string v10, ","

    invoke-virtual {v2, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1612
    :cond_4
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 1623
    :cond_5
    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    .line 1624
    .local v7, "strDevIds":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    .line 1625
    .local v8, "strdevIdFriendlyNames":Ljava/lang/String;
    sget-object v10, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "----- add dev ids:"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "---"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "---"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget-object v12, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 1626
    iget-object v10, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    invoke-virtual {v1, v10}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v10

    const-string v11, "AddDeviceName"

    invoke-virtual {v10, v11}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 1627
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    sget-object v10, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->ARGS_LED_ADD_DEVICEIDS:[Ljava/lang/String;

    const/4 v11, 0x2

    new-array v11, v11, [Ljava/lang/String;

    const/4 v12, 0x0

    aput-object v7, v11, v12

    const/4 v12, 0x1

    aput-object v8, v11, v12

    invoke-direct {p0, v0, v10, v11}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 1628
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v10

    iput-object v10, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mResponseString:Ljava/lang/String;

    .line 1629
    const-string v10, "UpnpDeviceList"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "get add devices n/w===+"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget-object v12, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mResponseString:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1630
    iget-object v10, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mResponseString:Ljava/lang/String;

    if-eqz v10, :cond_6

    .line 1631
    new-instance v6, Lcom/belkin/upnp/parser/LedDeviceResponseParser;

    invoke-direct {v6}, Lcom/belkin/upnp/parser/LedDeviceResponseParser;-><init>()V

    .line 1632
    .local v6, "responseStatus":Lcom/belkin/upnp/parser/LedDeviceResponseParser;
    iget-object v10, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mResponseString:Ljava/lang/String;

    invoke-virtual {v6, v10}, Lcom/belkin/upnp/parser/LedDeviceResponseParser;->parseNetworkStatus(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v10

    invoke-virtual {v9, v10}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 1633
    iget-object v10, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v10}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v10

    iget-object v11, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    invoke-virtual {v10, v11}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->initiateScanZigBeeDevice(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1639
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v2    # "devIdFriendlyNames":Ljava/lang/StringBuffer;
    .end local v3    # "devIds":Ljava/lang/StringBuffer;
    .end local v6    # "responseStatus":Lcom/belkin/upnp/parser/LedDeviceResponseParser;
    .end local v7    # "strDevIds":Ljava/lang/String;
    .end local v8    # "strdevIdFriendlyNames":Ljava/lang/String;
    :cond_6
    :goto_3
    return-object v9

    .line 1636
    :catch_0
    move-exception v4

    .line 1637
    .local v4, "e":Ljava/lang/Exception;
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_3
.end method

.method public callAction(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .locals 14
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "service"    # Ljava/lang/String;
    .param p3, "action"    # Ljava/lang/String;
    .param p4, "arguments"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 4154
    const/4 v8, 0x0

    .line 4156
    .local v8, "output":Lorg/json/JSONObject;
    iget-object v11, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v11}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v11

    invoke-virtual {v11}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v3

    .line 4157
    .local v3, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    invoke-virtual {v3, p1}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v4

    .line 4158
    .local v4, "device":Lorg/cybergarage/upnp/Device;
    if-nez v4, :cond_0

    .line 4159
    new-instance v11, Ljava/lang/Exception;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Device not found "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v11

    .line 4161
    :cond_0
    move-object/from16 v0, p3

    invoke-virtual {v4, v0}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v1

    .line 4162
    .local v1, "actionObj":Lorg/cybergarage/upnp/Action;
    if-nez v1, :cond_1

    .line 4163
    new-instance v11, Ljava/lang/Exception;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Invalid action "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    move-object/from16 v0, p3

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v11

    .line 4165
    :cond_1
    if-eqz p4, :cond_2

    invoke-virtual/range {p4 .. p4}, Lorg/json/JSONObject;->length()I

    move-result v11

    if-lez v11, :cond_2

    .line 4166
    invoke-virtual/range {p4 .. p4}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v7

    .line 4167
    .local v7, "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_2

    .line 4168
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    .line 4169
    .local v6, "key":Ljava/lang/String;
    move-object/from16 v0, p4

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v1, v6, v11}, Lorg/cybergarage/upnp/Action;->setArgumentValue(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 4174
    .end local v6    # "key":Ljava/lang/String;
    .end local v7    # "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :cond_2
    invoke-virtual {v1}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v10

    .line 4175
    .local v10, "response":Ljava/lang/String;
    const-string v11, "UpnpDeviceList"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "call action response: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 4176
    if-nez v10, :cond_4

    iget v11, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->numofTries:I

    const/4 v12, 0x3

    if-gt v11, v12, :cond_4

    .line 4178
    iget v11, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->numofTries:I

    add-int/lit8 v11, v11, 0x1

    iput v11, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->numofTries:I

    .line 4179
    const-string v11, "UpnpDeviceList"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "num of tries: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget v13, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->numofTries:I

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 4180
    invoke-virtual/range {p0 .. p4}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->callAction(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    .line 4210
    :cond_3
    if-nez v8, :cond_d

    if-nez v10, :cond_d

    iget v11, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->numofTries:I

    const/4 v12, 0x3

    if-le v11, v12, :cond_d

    .line 4211
    new-instance v11, Ljava/lang/Exception;

    const-string v12, "Null response"

    invoke-direct {v11, v12}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v11

    .line 4182
    :cond_4
    if-eqz v10, :cond_3

    .line 4185
    const/4 v11, 0x1

    iput v11, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->numofTries:I

    .line 4186
    sget-object v11, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->ERROR:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_5

    .line 4187
    new-instance v11, Ljava/lang/Exception;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Action response: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v11

    .line 4189
    :cond_5
    const-string v11, "GetAttributes"

    move-object/from16 v0, p3

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_6

    const-string v11, "GetBlobStorage"

    move-object/from16 v0, p3

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_8

    .line 4190
    :cond_6
    new-instance v11, Lcom/belkin/upnp/parser/GenericGetAttributeResponseParser;

    invoke-direct {v11}, Lcom/belkin/upnp/parser/GenericGetAttributeResponseParser;-><init>()V

    invoke-virtual {v11, v10}, Lcom/belkin/upnp/parser/GenericGetAttributeResponseParser;->parseGetAttributeResponse(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v8

    .line 4206
    :cond_7
    :goto_1
    const-string v11, "UpnpDeviceList"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "output json elements:"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    move-object v9, v8

    .line 4213
    .end local v8    # "output":Lorg/json/JSONObject;
    .local v9, "output":Lorg/json/JSONObject;
    :goto_2
    return-object v9

    .line 4191
    .end local v9    # "output":Lorg/json/JSONObject;
    .restart local v8    # "output":Lorg/json/JSONObject;
    :cond_8
    const-string v11, "GetRules"

    move-object/from16 v0, p3

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_9

    const-string v11, "SetRules"

    move-object/from16 v0, p3

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_a

    .line 4192
    :cond_9
    new-instance v11, Lcom/belkin/upnp/parser/GetRulesResponseParser;

    invoke-direct {v11}, Lcom/belkin/upnp/parser/GetRulesResponseParser;-><init>()V

    invoke-virtual {v11, v10}, Lcom/belkin/upnp/parser/GetRulesResponseParser;->parseGetRulesResponse(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v8

    goto :goto_1

    .line 4193
    :cond_a
    const-string v11, "GetInsightParams"

    move-object/from16 v0, p3

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_b

    .line 4194
    invoke-virtual {p0, v1, p1}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getInsightParamsOutputObject(Lorg/cybergarage/upnp/Action;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v8

    goto :goto_1

    .line 4195
    :cond_b
    const-string v11, "SetBlobStorage"

    move-object/from16 v0, p3

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_c

    .line 4196
    new-instance v11, Lcom/belkin/upnp/parser/SetBlobStorageResponseParser;

    invoke-direct {v11}, Lcom/belkin/upnp/parser/SetBlobStorageResponseParser;-><init>()V

    invoke-virtual {v11, v10}, Lcom/belkin/upnp/parser/SetBlobStorageResponseParser;->parseSetlobStorageRespone(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v8

    goto :goto_1

    .line 4198
    :cond_c
    new-instance v8, Lorg/json/JSONObject;

    .end local v8    # "output":Lorg/json/JSONObject;
    invoke-direct {v8}, Lorg/json/JSONObject;-><init>()V

    .line 4199
    .restart local v8    # "output":Lorg/json/JSONObject;
    invoke-virtual {v1}, Lorg/cybergarage/upnp/Action;->getOutputArgumentList()Lorg/cybergarage/upnp/ArgumentList;

    move-result-object v11

    invoke-virtual {v11}, Lorg/cybergarage/upnp/ArgumentList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .line 4200
    .local v5, "elems":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    const-string v11, "UpnpDeviceList"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "getoutputArgument List size:"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v1}, Lorg/cybergarage/upnp/Action;->getOutputArgumentList()Lorg/cybergarage/upnp/ArgumentList;

    move-result-object v13

    invoke-virtual {v13}, Lorg/cybergarage/upnp/ArgumentList;->size()I

    move-result v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 4201
    :goto_3
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_7

    .line 4202
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/cybergarage/upnp/Argument;

    .line 4203
    .local v2, "argument":Lorg/cybergarage/upnp/Argument;
    invoke-virtual {v2}, Lorg/cybergarage/upnp/Argument;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v2}, Lorg/cybergarage/upnp/Argument;->getValue()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v8, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_3

    .end local v2    # "argument":Lorg/cybergarage/upnp/Argument;
    .end local v5    # "elems":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :cond_d
    move-object v9, v8

    .line 4213
    .end local v8    # "output":Lorg/json/JSONObject;
    .restart local v9    # "output":Lorg/json/JSONObject;
    goto/16 :goto_2
.end method

.method public checkIfWemoPresent(Ljava/lang/String;)Z
    .locals 12
    .param p1, "serialNo"    # Ljava/lang/String;

    .prologue
    .line 829
    const/4 v1, 0x0

    .line 830
    .local v1, "count":I
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 832
    .local v2, "currentTime":J
    :cond_0
    const-string v7, "UpnpDeviceList"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "checkIfWemoPresent Trying:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 834
    :try_start_0
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v7

    invoke-virtual {v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v0

    .line 835
    .local v0, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    invoke-virtual {v0}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v7

    iput-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mDeviceList:Lorg/cybergarage/upnp/DeviceList;

    .line 836
    const/4 v6, 0x0

    .line 837
    .local v6, "tempSerialNo":Ljava/lang/String;
    const-string v7, "UpnpDeviceList"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "checkIfWemoPresent serialNo: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " mDeviceList size "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mDeviceList:Lorg/cybergarage/upnp/DeviceList;

    invoke-virtual {v9}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " Try: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 839
    const/4 v5, 0x0

    .local v5, "j":I
    :goto_0
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mDeviceList:Lorg/cybergarage/upnp/DeviceList;

    invoke-virtual {v7}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v7

    if-ge v5, v7, :cond_2

    .line 840
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mDeviceList:Lorg/cybergarage/upnp/DeviceList;

    invoke-virtual {v7, v5}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v7

    invoke-virtual {v7}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getWeMoSSID(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 841
    const-string v7, "UpnpDeviceList"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "checkIfWemoPresent Devices "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " tempSerialNo is "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " location: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mDeviceList:Lorg/cybergarage/upnp/DeviceList;

    invoke-virtual {v9, v5}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v9

    invoke-virtual {v9}, Lorg/cybergarage/upnp/Device;->getLocation()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 842
    invoke-virtual {v6, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 843
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mDeviceList:Lorg/cybergarage/upnp/DeviceList;

    invoke-virtual {v7, v5}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v7

    iput-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mDevice:Lorg/cybergarage/upnp/Device;

    .line 844
    const/4 v7, 0x1

    .line 856
    .end local v0    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .end local v5    # "j":I
    .end local v6    # "tempSerialNo":Ljava/lang/String;
    :goto_1
    return v7

    .line 839
    .restart local v0    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .restart local v5    # "j":I
    .restart local v6    # "tempSerialNo":Ljava/lang/String;
    :cond_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 847
    :cond_2
    const-wide/16 v8, 0x2710

    invoke-static {v8, v9}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 852
    .end local v0    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .end local v5    # "j":I
    .end local v6    # "tempSerialNo":Ljava/lang/String;
    :goto_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    sub-long/2addr v8, v2

    const-wide/32 v10, 0xea60

    cmp-long v7, v8, v10

    if-ltz v7, :cond_0

    .line 855
    const-string v7, "UpnpDeviceList"

    const-string v8, "checkIfWemoPresent WeMO not present"

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 856
    const/4 v7, 0x0

    goto :goto_1

    .line 849
    :catch_0
    move-exception v4

    .line 850
    .local v4, "e":Ljava/lang/Exception;
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2
.end method

.method public clearBridgeDevices()V
    .locals 1

    .prologue
    .line 4378
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonBridgeArray:Lorg/json/JSONArray;

    .line 4379
    return-void
.end method

.method public clearNameIconRule(Ljava/lang/String;)Z
    .locals 9
    .param p1, "udn"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 623
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    .line 625
    :try_start_0
    iget-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v6

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v1

    .line 626
    .local v1, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    invoke-virtual {v1, p1}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v3

    .line 627
    .local v3, "localDevice":Lorg/cybergarage/upnp/Device;
    const-string v6, "ReSetup"

    invoke-virtual {v3, v6}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 628
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    const-string v6, "Reset"

    const-string v7, "1"

    invoke-virtual {v0, v6, v7}, Lorg/cybergarage/upnp/Action;->setArgumentValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 629
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v4

    .line 630
    .local v4, "response":Ljava/lang/String;
    const-string v6, "UpnpDeviceList"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "clearNameIconRule response: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 631
    if-eqz v4, :cond_0

    sget-object v6, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->ERROR:Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v6

    if-eqz v6, :cond_1

    .line 636
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .end local v3    # "localDevice":Lorg/cybergarage/upnp/Device;
    .end local v4    # "response":Ljava/lang/String;
    :cond_0
    :goto_0
    return v5

    .line 633
    .restart local v0    # "action":Lorg/cybergarage/upnp/Action;
    .restart local v1    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .restart local v3    # "localDevice":Lorg/cybergarage/upnp/Device;
    .restart local v4    # "response":Ljava/lang/String;
    :cond_1
    const/4 v5, 0x1

    goto :goto_0

    .line 634
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .end local v3    # "localDevice":Lorg/cybergarage/upnp/Device;
    .end local v4    # "response":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 635
    .local v2, "e":Ljava/lang/Exception;
    const-string v6, "UpnpDeviceList"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "exception in clearNameIconRule: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public closeBridgeNetwork()Lorg/json/JSONObject;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    .line 1912
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    iput-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    .line 1913
    iget-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v5}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v5

    invoke-virtual {v5}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v1

    .line 1914
    .local v1, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v5

    invoke-virtual {v5}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v5

    if-ge v3, v5, :cond_1

    .line 1915
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v5

    invoke-virtual {v5, v3}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v5

    invoke-virtual {v5}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v5

    const-string v6, "Bridge"

    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 1916
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v5

    invoke-virtual {v5, v3}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v5

    invoke-virtual {v5}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    .line 1914
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1920
    :cond_1
    :try_start_0
    iget-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    invoke-virtual {v1, v5}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v5

    const-string v6, "CloseNetwork"

    invoke-virtual {v5, v6}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 1921
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    sget-object v5, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->ARGS_DEVUDN:[Ljava/lang/String;

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    iget-object v8, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    aput-object v8, v6, v7

    invoke-direct {p0, v0, v5, v6}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 1922
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v4

    .line 1923
    .local v4, "response":Ljava/lang/String;
    const-string v5, "UpnpDeviceList"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "CLOSE NETWORK RESPOMSE: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1924
    if-eqz v4, :cond_2

    .line 1925
    iget-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    const-string v6, "CloseNetwork"

    const/4 v7, 0x1

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v5

    .line 1929
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v4    # "response":Ljava/lang/String;
    :goto_1
    return-object v5

    .line 1927
    .restart local v0    # "action":Lorg/cybergarage/upnp/Action;
    .restart local v4    # "response":Ljava/lang/String;
    :cond_2
    iget-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    const-string v6, "CloseNetwork"

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    goto :goto_1

    .line 1928
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v4    # "response":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 1929
    .local v2, "e":Ljava/lang/Exception;
    iget-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    const-string v6, "CloseNetwork"

    invoke-virtual {v5, v6, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v5

    goto :goto_1
.end method

.method public createCalendarList([Ljava/lang/String;)Ljava/lang/String;
    .locals 26
    .param p1, "weeklyCalendar"    # [Ljava/lang/String;

    .prologue
    .line 2138
    const/16 v16, 0x0

    .line 2141
    .local v16, "tempxml":Ljava/lang/String;
    :try_start_0
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v7

    .line 2142
    .local v7, "docFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    invoke-virtual {v7}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v6

    .line 2145
    .local v6, "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    invoke-virtual {v6}, Ljavax/xml/parsers/DocumentBuilder;->newDocument()Lorg/w3c/dom/Document;

    move-result-object v5

    .line 2147
    .local v5, "doc":Lorg/w3c/dom/Document;
    const-string v23, "CalendarList"

    move-object/from16 v0, v23

    invoke-interface {v5, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v3

    .line 2148
    .local v3, "CalendarList":Lorg/w3c/dom/Element;
    invoke-interface {v5, v3}, Lorg/w3c/dom/Document;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 2150
    const-string v23, "Calendar"

    move-object/from16 v0, v23

    invoke-interface {v5, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v2

    .line 2151
    .local v2, "Calendar":Lorg/w3c/dom/Element;
    invoke-interface {v3, v2}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 2153
    const-string v23, "([0-9]*)"

    invoke-static/range {v23 .. v23}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v11

    .line 2155
    .local v11, "p":Ljava/util/regex/Pattern;
    const/16 v23, 0x0

    aget-object v23, p1, v23

    move-object/from16 v0, v23

    invoke-virtual {v11, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v9

    .line 2157
    .local v9, "m":Ljava/util/regex/Matcher;
    invoke-virtual {v9}, Ljava/util/regex/Matcher;->matches()Z

    move-result v23

    if-eqz v23, :cond_0

    .line 2158
    const-string v23, "GroupID"

    move-object/from16 v0, v23

    invoke-interface {v5, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v4

    .line 2159
    .local v4, "deviceIdTag":Lorg/w3c/dom/Element;
    const/16 v23, 0x0

    aget-object v23, p1, v23

    move-object/from16 v0, v23

    invoke-interface {v5, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-interface {v4, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 2160
    invoke-interface {v2, v4}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 2168
    :goto_0
    const-string v23, "Mon"

    move-object/from16 v0, v23

    invoke-interface {v5, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v10

    .line 2169
    .local v10, "monTag":Lorg/w3c/dom/Element;
    const/16 v23, 0x1

    aget-object v23, p1, v23

    move-object/from16 v0, v23

    invoke-interface {v5, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-interface {v10, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 2170
    invoke-interface {v2, v10}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 2172
    const-string v23, "Tues"

    move-object/from16 v0, v23

    invoke-interface {v5, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v20

    .line 2173
    .local v20, "tuesTag":Lorg/w3c/dom/Element;
    const/16 v23, 0x2

    aget-object v23, p1, v23

    move-object/from16 v0, v23

    invoke-interface {v5, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v23

    move-object/from16 v0, v20

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 2174
    move-object/from16 v0, v20

    invoke-interface {v2, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 2176
    const-string v23, "Wed"

    move-object/from16 v0, v23

    invoke-interface {v5, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v21

    .line 2177
    .local v21, "wedTag":Lorg/w3c/dom/Element;
    const/16 v23, 0x3

    aget-object v23, p1, v23

    move-object/from16 v0, v23

    invoke-interface {v5, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v23

    move-object/from16 v0, v21

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 2178
    move-object/from16 v0, v21

    invoke-interface {v2, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 2180
    const-string v23, "Thurs"

    move-object/from16 v0, v23

    invoke-interface {v5, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v18

    .line 2181
    .local v18, "thursTag":Lorg/w3c/dom/Element;
    const/16 v23, 0x4

    aget-object v23, p1, v23

    move-object/from16 v0, v23

    invoke-interface {v5, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v23

    move-object/from16 v0, v18

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 2182
    move-object/from16 v0, v18

    invoke-interface {v2, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 2184
    const-string v23, "Fri"

    move-object/from16 v0, v23

    invoke-interface {v5, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v8

    .line 2185
    .local v8, "friTag":Lorg/w3c/dom/Element;
    const/16 v23, 0x5

    aget-object v23, p1, v23

    move-object/from16 v0, v23

    invoke-interface {v5, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-interface {v8, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 2186
    invoke-interface {v2, v8}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 2188
    const-string v23, "Sat"

    move-object/from16 v0, v23

    invoke-interface {v5, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v14

    .line 2189
    .local v14, "satTag":Lorg/w3c/dom/Element;
    const/16 v23, 0x6

    aget-object v23, p1, v23

    move-object/from16 v0, v23

    invoke-interface {v5, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-interface {v14, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 2190
    invoke-interface {v2, v14}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 2192
    const-string v23, "Sun"

    move-object/from16 v0, v23

    invoke-interface {v5, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v15

    .line 2193
    .local v15, "sunTag":Lorg/w3c/dom/Element;
    const/16 v23, 0x7

    aget-object v23, p1, v23

    move-object/from16 v0, v23

    invoke-interface {v5, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-interface {v15, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 2194
    invoke-interface {v2, v15}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 2196
    invoke-static {}, Ljavax/xml/transform/TransformerFactory;->newInstance()Ljavax/xml/transform/TransformerFactory;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljavax/xml/transform/TransformerFactory;->newTransformer()Ljavax/xml/transform/Transformer;

    move-result-object v19

    .line 2197
    .local v19, "transformer":Ljavax/xml/transform/Transformer;
    new-instance v22, Ljava/io/StringWriter;

    invoke-direct/range {v22 .. v22}, Ljava/io/StringWriter;-><init>()V

    .line 2198
    .local v22, "writer":Ljava/io/StringWriter;
    new-instance v13, Ljavax/xml/transform/stream/StreamResult;

    move-object/from16 v0, v22

    invoke-direct {v13, v0}, Ljavax/xml/transform/stream/StreamResult;-><init>(Ljava/io/Writer;)V

    .line 2199
    .local v13, "result":Ljavax/xml/transform/stream/StreamResult;
    new-instance v23, Ljavax/xml/transform/dom/DOMSource;

    move-object/from16 v0, v23

    invoke-direct {v0, v5}, Ljavax/xml/transform/dom/DOMSource;-><init>(Lorg/w3c/dom/Node;)V

    move-object/from16 v0, v19

    move-object/from16 v1, v23

    invoke-virtual {v0, v1, v13}, Ljavax/xml/transform/Transformer;->transform(Ljavax/xml/transform/Source;Ljavax/xml/transform/Result;)V

    .line 2201
    invoke-virtual/range {v22 .. v22}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v16

    .line 2202
    const-string v23, "UpnpDeviceList"

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "File saved calendar!"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2208
    .end local v2    # "Calendar":Lorg/w3c/dom/Element;
    .end local v3    # "CalendarList":Lorg/w3c/dom/Element;
    .end local v4    # "deviceIdTag":Lorg/w3c/dom/Element;
    .end local v5    # "doc":Lorg/w3c/dom/Document;
    .end local v6    # "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    .end local v7    # "docFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    .end local v8    # "friTag":Lorg/w3c/dom/Element;
    .end local v9    # "m":Ljava/util/regex/Matcher;
    .end local v10    # "monTag":Lorg/w3c/dom/Element;
    .end local v11    # "p":Ljava/util/regex/Pattern;
    .end local v13    # "result":Ljavax/xml/transform/stream/StreamResult;
    .end local v14    # "satTag":Lorg/w3c/dom/Element;
    .end local v15    # "sunTag":Lorg/w3c/dom/Element;
    .end local v18    # "thursTag":Lorg/w3c/dom/Element;
    .end local v19    # "transformer":Ljavax/xml/transform/Transformer;
    .end local v20    # "tuesTag":Lorg/w3c/dom/Element;
    .end local v21    # "wedTag":Lorg/w3c/dom/Element;
    .end local v22    # "writer":Ljava/io/StringWriter;
    :goto_1
    return-object v16

    .line 2162
    .restart local v2    # "Calendar":Lorg/w3c/dom/Element;
    .restart local v3    # "CalendarList":Lorg/w3c/dom/Element;
    .restart local v5    # "doc":Lorg/w3c/dom/Document;
    .restart local v6    # "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    .restart local v7    # "docFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    .restart local v9    # "m":Ljava/util/regex/Matcher;
    .restart local v11    # "p":Ljava/util/regex/Pattern;
    :cond_0
    const-string v23, "DeviceID"

    move-object/from16 v0, v23

    invoke-interface {v5, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v4

    .line 2163
    .restart local v4    # "deviceIdTag":Lorg/w3c/dom/Element;
    const/16 v23, 0x0

    aget-object v23, p1, v23

    move-object/from16 v0, v23

    invoke-interface {v5, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-interface {v4, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 2164
    invoke-interface {v2, v4}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;
    :try_end_0
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljavax/xml/transform/TransformerException; {:try_start_0 .. :try_end_0} :catch_1

    goto/16 :goto_0

    .line 2203
    .end local v2    # "Calendar":Lorg/w3c/dom/Element;
    .end local v3    # "CalendarList":Lorg/w3c/dom/Element;
    .end local v4    # "deviceIdTag":Lorg/w3c/dom/Element;
    .end local v5    # "doc":Lorg/w3c/dom/Document;
    .end local v6    # "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    .end local v7    # "docFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    .end local v9    # "m":Ljava/util/regex/Matcher;
    .end local v11    # "p":Ljava/util/regex/Pattern;
    :catch_0
    move-exception v12

    .line 2204
    .local v12, "pce":Ljavax/xml/parsers/ParserConfigurationException;
    invoke-virtual {v12}, Ljavax/xml/parsers/ParserConfigurationException;->printStackTrace()V

    goto :goto_1

    .line 2205
    .end local v12    # "pce":Ljavax/xml/parsers/ParserConfigurationException;
    :catch_1
    move-exception v17

    .line 2206
    .local v17, "tfe":Ljavax/xml/transform/TransformerException;
    invoke-virtual/range {v17 .. v17}, Ljavax/xml/transform/TransformerException;->printStackTrace()V

    goto :goto_1
.end method

.method public createGroup(Lorg/json/JSONArray;)Lorg/json/JSONArray;
    .locals 21
    .param p1, "params"    # Lorg/json/JSONArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 2013
    new-instance v11, Lorg/json/JSONArray;

    invoke-direct {v11}, Lorg/json/JSONArray;-><init>()V

    .line 2014
    .local v11, "createGroupArray":Lorg/json/JSONArray;
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    .line 2015
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v10

    .line 2016
    .local v10, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    const/4 v15, 0x0

    .local v15, "i":I
    :goto_0
    invoke-virtual {v10}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v3

    invoke-virtual {v3}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v3

    if-ge v15, v3, :cond_1

    .line 2017
    invoke-virtual {v10}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v3

    invoke-virtual {v3, v15}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v3

    invoke-virtual {v3}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v3

    const-string v4, "Bridge"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 2018
    invoke-virtual {v10}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v3

    invoke-virtual {v3, v15}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v3

    invoke-virtual {v3}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    .line 2016
    :cond_0
    add-int/lit8 v15, v15, 0x1

    goto :goto_0

    .line 2022
    :cond_1
    :try_start_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    invoke-virtual {v10, v3}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v3

    const-string v4, "CreateGroup"

    invoke-virtual {v3, v4}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v9

    .line 2023
    .local v9, "action":Lorg/cybergarage/upnp/Action;
    sget-object v18, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->CREATE_GROUP_ARGS:[Ljava/lang/String;

    const/4 v3, 0x1

    new-array v0, v3, [Ljava/lang/String;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    const/4 v3, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v4

    const/4 v3, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v3

    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v3, 0x2

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v3

    const/4 v6, 0x0

    invoke-virtual {v3, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v3, 0x3

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v3

    const/4 v7, 0x0

    invoke-virtual {v3, v7}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v7

    const/4 v3, 0x4

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v3

    const/4 v8, 0x0

    invoke-virtual {v3, v8}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v8

    move-object/from16 v3, p0

    invoke-direct/range {v3 .. v8}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->doBridgeXml(Lorg/json/JSONArray;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v19, v20

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-direct {v0, v9, v1, v2}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 2024
    invoke-virtual {v9}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v16

    .line 2025
    .local v16, "response":Ljava/lang/String;
    const-string v3, "UpnpDeviceList"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "CREATE RESPOMSE: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v16

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2026
    new-instance v13, Lcom/belkin/upnp/parser/GetCreateGroupResponseParser;

    invoke-direct {v13}, Lcom/belkin/upnp/parser/GetCreateGroupResponseParser;-><init>()V

    .line 2027
    .local v13, "createGroupResponse":Lcom/belkin/upnp/parser/GetCreateGroupResponseParser;
    move-object/from16 v0, v16

    invoke-virtual {v13, v0}, Lcom/belkin/upnp/parser/GetCreateGroupResponseParser;->parseCreateGroupResponse(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v11

    .line 2028
    invoke-virtual {v11}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "0"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    const/4 v3, 0x4

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "0"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 2029
    new-instance v12, Lorg/json/JSONArray;

    invoke-direct {v12}, Lorg/json/JSONArray;-><init>()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2030
    .end local v11    # "createGroupArray":Lorg/json/JSONArray;
    .local v12, "createGroupArray":Lorg/json/JSONArray;
    :try_start_1
    new-instance v17, Lorg/json/JSONObject;

    invoke-direct/range {v17 .. v17}, Lorg/json/JSONObject;-><init>()V

    .line 2031
    .local v17, "temp":Lorg/json/JSONObject;
    const-string v3, "GetCreateGroupResponse"

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mGroupId:Ljava/lang/String;

    move-object/from16 v0, v17

    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 2032
    move-object/from16 v0, v17

    invoke-virtual {v12, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-object v11, v12

    .line 2038
    .end local v9    # "action":Lorg/cybergarage/upnp/Action;
    .end local v12    # "createGroupArray":Lorg/json/JSONArray;
    .end local v13    # "createGroupResponse":Lcom/belkin/upnp/parser/GetCreateGroupResponseParser;
    .end local v16    # "response":Ljava/lang/String;
    .end local v17    # "temp":Lorg/json/JSONObject;
    .restart local v11    # "createGroupArray":Lorg/json/JSONArray;
    :cond_2
    :goto_1
    return-object v11

    .line 2035
    :catch_0
    move-exception v14

    .line 2036
    .local v14, "e":Ljava/lang/Exception;
    :goto_2
    invoke-virtual {v14}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 2035
    .end local v11    # "createGroupArray":Lorg/json/JSONArray;
    .end local v14    # "e":Ljava/lang/Exception;
    .restart local v9    # "action":Lorg/cybergarage/upnp/Action;
    .restart local v12    # "createGroupArray":Lorg/json/JSONArray;
    .restart local v13    # "createGroupResponse":Lcom/belkin/upnp/parser/GetCreateGroupResponseParser;
    .restart local v16    # "response":Ljava/lang/String;
    :catch_1
    move-exception v14

    move-object v11, v12

    .end local v12    # "createGroupArray":Lorg/json/JSONArray;
    .restart local v11    # "createGroupArray":Lorg/json/JSONArray;
    goto :goto_2
.end method

.method public deleteCalendarList(Ljava/lang/String;)Ljava/lang/String;
    .locals 18
    .param p1, "weeklyCalendarId"    # Ljava/lang/String;

    .prologue
    .line 2397
    const/4 v11, 0x0

    .line 2400
    .local v11, "tempxml":Ljava/lang/String;
    :try_start_0
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v6

    .line 2401
    .local v6, "docFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    invoke-virtual {v6}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v5

    .line 2404
    .local v5, "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    invoke-virtual {v5}, Ljavax/xml/parsers/DocumentBuilder;->newDocument()Lorg/w3c/dom/Document;

    move-result-object v4

    .line 2406
    .local v4, "doc":Lorg/w3c/dom/Document;
    const-string v15, "CalendarList"

    invoke-interface {v4, v15}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v2

    .line 2407
    .local v2, "CalendarList":Lorg/w3c/dom/Element;
    invoke-interface {v4, v2}, Lorg/w3c/dom/Document;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 2409
    const-string v15, "Calendar"

    invoke-interface {v4, v15}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v1

    .line 2410
    .local v1, "Calendar":Lorg/w3c/dom/Element;
    invoke-interface {v2, v1}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 2412
    const-string v15, "([0-9]*)"

    invoke-static {v15}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v8

    .line 2414
    .local v8, "p":Ljava/util/regex/Pattern;
    move-object/from16 v0, p1

    invoke-virtual {v8, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v7

    .line 2416
    .local v7, "m":Ljava/util/regex/Matcher;
    invoke-virtual {v7}, Ljava/util/regex/Matcher;->matches()Z

    move-result v15

    if-eqz v15, :cond_0

    .line 2417
    const-string v15, "GroupID"

    invoke-interface {v4, v15}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v3

    .line 2418
    .local v3, "deviceIdTag":Lorg/w3c/dom/Element;
    move-object/from16 v0, p1

    invoke-interface {v4, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v15

    invoke-interface {v3, v15}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 2419
    invoke-interface {v1, v3}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 2427
    :goto_0
    invoke-static {}, Ljavax/xml/transform/TransformerFactory;->newInstance()Ljavax/xml/transform/TransformerFactory;

    move-result-object v15

    invoke-virtual {v15}, Ljavax/xml/transform/TransformerFactory;->newTransformer()Ljavax/xml/transform/Transformer;

    move-result-object v13

    .line 2428
    .local v13, "transformer":Ljavax/xml/transform/Transformer;
    new-instance v14, Ljava/io/StringWriter;

    invoke-direct {v14}, Ljava/io/StringWriter;-><init>()V

    .line 2429
    .local v14, "writer":Ljava/io/StringWriter;
    new-instance v10, Ljavax/xml/transform/stream/StreamResult;

    invoke-direct {v10, v14}, Ljavax/xml/transform/stream/StreamResult;-><init>(Ljava/io/Writer;)V

    .line 2430
    .local v10, "result":Ljavax/xml/transform/stream/StreamResult;
    new-instance v15, Ljavax/xml/transform/dom/DOMSource;

    invoke-direct {v15, v4}, Ljavax/xml/transform/dom/DOMSource;-><init>(Lorg/w3c/dom/Node;)V

    invoke-virtual {v13, v15, v10}, Ljavax/xml/transform/Transformer;->transform(Ljavax/xml/transform/Source;Ljavax/xml/transform/Result;)V

    .line 2432
    invoke-virtual {v14}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v11

    .line 2433
    const-string v15, "UpnpDeviceList"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "File saved calendar delete!"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2439
    .end local v1    # "Calendar":Lorg/w3c/dom/Element;
    .end local v2    # "CalendarList":Lorg/w3c/dom/Element;
    .end local v3    # "deviceIdTag":Lorg/w3c/dom/Element;
    .end local v4    # "doc":Lorg/w3c/dom/Document;
    .end local v5    # "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    .end local v6    # "docFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    .end local v7    # "m":Ljava/util/regex/Matcher;
    .end local v8    # "p":Ljava/util/regex/Pattern;
    .end local v10    # "result":Ljavax/xml/transform/stream/StreamResult;
    .end local v13    # "transformer":Ljavax/xml/transform/Transformer;
    .end local v14    # "writer":Ljava/io/StringWriter;
    :goto_1
    return-object v11

    .line 2421
    .restart local v1    # "Calendar":Lorg/w3c/dom/Element;
    .restart local v2    # "CalendarList":Lorg/w3c/dom/Element;
    .restart local v4    # "doc":Lorg/w3c/dom/Document;
    .restart local v5    # "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    .restart local v6    # "docFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    .restart local v7    # "m":Ljava/util/regex/Matcher;
    .restart local v8    # "p":Ljava/util/regex/Pattern;
    :cond_0
    const-string v15, "DeviceID"

    invoke-interface {v4, v15}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v3

    .line 2422
    .restart local v3    # "deviceIdTag":Lorg/w3c/dom/Element;
    move-object/from16 v0, p1

    invoke-interface {v4, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v15

    invoke-interface {v3, v15}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 2423
    invoke-interface {v1, v3}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;
    :try_end_0
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljavax/xml/transform/TransformerException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 2434
    .end local v1    # "Calendar":Lorg/w3c/dom/Element;
    .end local v2    # "CalendarList":Lorg/w3c/dom/Element;
    .end local v3    # "deviceIdTag":Lorg/w3c/dom/Element;
    .end local v4    # "doc":Lorg/w3c/dom/Document;
    .end local v5    # "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    .end local v6    # "docFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    .end local v7    # "m":Ljava/util/regex/Matcher;
    .end local v8    # "p":Ljava/util/regex/Pattern;
    :catch_0
    move-exception v9

    .line 2435
    .local v9, "pce":Ljavax/xml/parsers/ParserConfigurationException;
    invoke-virtual {v9}, Ljavax/xml/parsers/ParserConfigurationException;->printStackTrace()V

    goto :goto_1

    .line 2436
    .end local v9    # "pce":Ljavax/xml/parsers/ParserConfigurationException;
    :catch_1
    move-exception v12

    .line 2437
    .local v12, "tfe":Ljavax/xml/transform/TransformerException;
    invoke-virtual {v12}, Ljavax/xml/transform/TransformerException;->printStackTrace()V

    goto :goto_1
.end method

.method public deleteDevicePreset(Lorg/json/JSONArray;Lcom/belkin/wemo/callback/SetAndGetActionCallBack;)V
    .locals 7
    .param p1, "presetsInfo"    # Lorg/json/JSONArray;
    .param p2, "callback"    # Lcom/belkin/wemo/callback/SetAndGetActionCallBack;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 4817
    const/4 v4, 0x0

    .line 4818
    .local v4, "isRequestProcessed":Z
    iget-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v5}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v5

    invoke-virtual {v5}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v2

    .line 4819
    .local v2, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    const/4 v5, 0x0

    invoke-virtual {p1, v5}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "bridgeUdn"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    .line 4820
    iget-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    if-eqz v5, :cond_0

    .line 4821
    iget-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    invoke-virtual {v2, v5}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v3

    .line 4822
    .local v3, "device":Lorg/cybergarage/upnp/Device;
    if-eqz v3, :cond_0

    .line 4823
    const-string v5, "deleteDevicePreset"

    invoke-virtual {v3, v5}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 4824
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    if-eqz v0, :cond_0

    .line 4825
    const-string v5, "devicePresetData"

    invoke-direct {p0, p1}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->createSetDeletePresetRequest(Lorg/json/JSONArray;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v5, v6}, Lorg/cybergarage/upnp/Action;->setArgumentValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 4826
    new-instance v1, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$DeletePresetCallback;

    invoke-direct {v1, p0, p2}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$DeletePresetCallback;-><init>(Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;Lcom/belkin/wemo/callback/SetAndGetActionCallBack;)V

    .line 4827
    .local v1, "actionCallback":Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$DeletePresetCallback;
    const/4 v4, 0x1

    .line 4828
    invoke-static {}, Lcom/belkin/cybergarage/wrapper/ControlActionHandler;->newInstance()Lcom/belkin/cybergarage/wrapper/ControlActionHandler;

    move-result-object v5

    invoke-virtual {v5, v0, v1, v1}, Lcom/belkin/cybergarage/wrapper/ControlActionHandler;->postControlAction(Lorg/cybergarage/upnp/Action;Lcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionErrorCallback;Lcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionSuccessCallback;)V

    .line 4832
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "actionCallback":Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$DeletePresetCallback;
    .end local v3    # "device":Lorg/cybergarage/upnp/Device;
    :cond_0
    if-nez v4, :cond_1

    .line 4833
    invoke-interface {p2}, Lcom/belkin/wemo/callback/SetAndGetActionCallBack;->onError()V

    .line 4835
    :cond_1
    return-void
.end method

.method public deleteGroup(Ljava/lang/String;)Lorg/json/JSONArray;
    .locals 10
    .param p1, "GroupId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 1648
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    iput-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    .line 1649
    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    .line 1650
    .local v3, "deleteGroupArray":Lorg/json/JSONArray;
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v7

    invoke-virtual {v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v1

    .line 1651
    .local v1, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v7

    invoke-virtual {v7}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v7

    if-ge v5, v7, :cond_1

    .line 1652
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v7

    invoke-virtual {v7, v5}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v7

    invoke-virtual {v7}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v7

    const-string v8, "Bridge"

    invoke-virtual {v7, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 1653
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v7

    invoke-virtual {v7, v5}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v7

    invoke-virtual {v7}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    .line 1651
    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 1657
    :cond_1
    :try_start_0
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    invoke-virtual {v1, v7}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v7

    const-string v8, "DeleteGroup"

    invoke-virtual {v7, v8}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 1658
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    sget-object v7, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->ARGS_GROUPID:[Ljava/lang/String;

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/String;

    const/4 v9, 0x0

    aput-object p1, v8, v9

    invoke-direct {p0, v0, v7, v8}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 1659
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v6

    .line 1660
    .local v6, "response":Ljava/lang/String;
    const-string v7, "UpnpDeviceList"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "DELETE GROUP RESPOMSE: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1661
    if-eqz v6, :cond_2

    .line 1662
    new-instance v2, Lcom/belkin/upnp/parser/GetCreateGroupResponseParser;

    invoke-direct {v2}, Lcom/belkin/upnp/parser/GetCreateGroupResponseParser;-><init>()V

    .line 1663
    .local v2, "createGroupResponse":Lcom/belkin/upnp/parser/GetCreateGroupResponseParser;
    invoke-virtual {v2, v6}, Lcom/belkin/upnp/parser/GetCreateGroupResponseParser;->parseCreateGroupResponse(Ljava/lang/String;)Lorg/json/JSONArray;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 1668
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v2    # "createGroupResponse":Lcom/belkin/upnp/parser/GetCreateGroupResponseParser;
    .end local v6    # "response":Ljava/lang/String;
    :cond_2
    :goto_1
    return-object v3

    .line 1665
    :catch_0
    move-exception v4

    .line 1666
    .local v4, "e":Ljava/lang/Exception;
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method public deleteNotifyRule([Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "notifyRule"    # [Ljava/lang/String;

    .prologue
    .line 2083
    const-string v3, ""

    .line 2085
    .local v3, "status":Ljava/lang/String;
    :try_start_0
    iget-object v4, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v4

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v1

    .line 2086
    .local v1, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    const/4 v4, 0x1

    aget-object v4, p1, v4

    invoke-virtual {v1, v4}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v4

    const-string v5, "DeleteRuleID"

    invoke-virtual {v4, v5}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 2087
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    sget-object v4, Lcom/belkin/wemo/cache/utils/Constants;->DELETE_RULE_ID:[Ljava/lang/String;

    invoke-direct {p0, v0, v4, p1}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 2088
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    .line 2089
    const-string v3, "true"
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2095
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    :goto_0
    return-object v3

    .line 2090
    :catch_0
    move-exception v2

    .line 2091
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 2092
    const-string v3, "false"

    goto :goto_0
.end method

.method public deleteWeeklyCalendarString([Ljava/lang/String;)Ljava/lang/String;
    .locals 11
    .param p1, "deleteRecord"    # [Ljava/lang/String;

    .prologue
    const/4 v8, 0x0

    .line 2448
    const-string v7, ""

    .local v7, "status":Ljava/lang/String;
    const-string v6, ""

    .line 2449
    .local v6, "mBridgeUdn":Ljava/lang/String;
    aget-object v3, p1, v8

    .line 2450
    .local v3, "deviceId":Ljava/lang/String;
    iget-object v8, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v8}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v8

    invoke-virtual {v8}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v1

    .line 2452
    .local v1, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    if-eqz p1, :cond_0

    const/4 v8, 0x1

    :try_start_0
    aget-object v8, p1, v8

    if-eqz v8, :cond_0

    .line 2453
    const/4 v8, 0x1

    aget-object v8, p1, v8

    invoke-virtual {v1, v8}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v8

    const-string v9, "DeleteWeeklyCalendar"

    invoke-virtual {v8, v9}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 2454
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    sget-object v8, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->ARGS_DEVICEID:[Ljava/lang/String;

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/String;

    const/4 v10, 0x0

    aput-object v3, v9, v10

    invoke-direct {p0, v0, v8, v9}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 2455
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    .line 2456
    const-string v7, "true"

    .line 2478
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    :goto_0
    return-object v7

    .line 2457
    :cond_0
    if-eqz p1, :cond_3

    const/4 v8, 0x0

    aget-object v8, p1, v8

    if-eqz v8, :cond_3

    .line 2458
    invoke-virtual {p0, v3}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->deleteCalendarList(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 2459
    .local v2, "deleteId":Ljava/lang/String;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_1
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v8

    invoke-virtual {v8}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v8

    if-ge v5, v8, :cond_2

    .line 2460
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v8

    invoke-virtual {v8, v5}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v8

    invoke-virtual {v8}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v8

    const-string v9, "Bridge"

    invoke-virtual {v8, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 2461
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v8

    invoke-virtual {v8, v5}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v8

    invoke-virtual {v8}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v6

    .line 2459
    :cond_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 2464
    :cond_2
    invoke-virtual {v1, v6}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v8

    const-string v9, "DeleteWeeklyCalendar"

    invoke-virtual {v8, v9}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 2465
    .restart local v0    # "action":Lorg/cybergarage/upnp/Action;
    sget-object v8, Lcom/belkin/wemo/cache/utils/Constants;->SET_UPDATE_WEEKLY_CALENDER_LED_ARGS:[Ljava/lang/String;

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/String;

    const/4 v10, 0x0

    aput-object v2, v9, v10

    invoke-direct {p0, v0, v8, v9}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 2466
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    .line 2467
    const-string v7, "true"

    .line 2468
    goto :goto_0

    .line 2471
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v2    # "deleteId":Ljava/lang/String;
    .end local v5    # "i":I
    :cond_3
    const-string v7, "false"
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 2473
    :catch_0
    move-exception v4

    .line 2474
    .local v4, "e":Ljava/lang/Exception;
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    .line 2475
    const-string v7, "false"

    goto :goto_0
.end method

.method public destroyControlPointNow()V
    .locals 0

    .prologue
    .line 254
    invoke-super {p0}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceBase;->destroyControlPointNow()V

    .line 255
    return-void
.end method

.method public deviceAdded(Lorg/cybergarage/upnp/Device;)V
    .locals 3
    .param p1, "device"    # Lorg/cybergarage/upnp/Device;

    .prologue
    .line 412
    const-string v0, "UpnpDeviceList"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "deviceAdded(Device device) : Friendly Name : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lorg/cybergarage/upnp/Device;->getFriendlyName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 413
    invoke-virtual {p1}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->isWeMo(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 416
    iget-object v0, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mDeviceList:Lorg/cybergarage/upnp/DeviceList;

    invoke-virtual {v0, p1}, Lorg/cybergarage/upnp/DeviceList;->addElement(Ljava/lang/Object;)V

    .line 418
    :cond_0
    return-void
.end method

.method public deviceNotifyReceived(Lorg/cybergarage/upnp/ssdp/SSDPPacket;)V
    .locals 0
    .param p1, "ssdpPacket"    # Lorg/cybergarage/upnp/ssdp/SSDPPacket;

    .prologue
    .line 430
    return-void
.end method

.method public deviceRemoved(Lorg/cybergarage/upnp/Device;)V
    .locals 3
    .param p1, "device"    # Lorg/cybergarage/upnp/Device;

    .prologue
    .line 422
    const-string v0, "UpnpDeviceList"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "deviceRemoved(Device device) : Friendly Name : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lorg/cybergarage/upnp/Device;->getFriendlyName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 425
    return-void
.end method

.method public deviceSearchResponseReceived(Lorg/cybergarage/upnp/ssdp/SSDPPacket;)V
    .locals 0
    .param p1, "ssdpPacket"    # Lorg/cybergarage/upnp/ssdp/SSDPPacket;

    .prologue
    .line 435
    return-void
.end method

.method public domXml(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 23
    .param p1, "onORoff"    # Ljava/lang/String;
    .param p2, "deviceId"    # Ljava/lang/String;
    .param p3, "capabilityID"    # Ljava/lang/String;
    .param p4, "isGroupAction"    # Ljava/lang/String;

    .prologue
    .line 1700
    const/16 v16, 0x0

    .line 1702
    .local v16, "tempxml":Ljava/lang/String;
    :try_start_0
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v10

    .line 1703
    .local v10, "docFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    invoke-virtual {v10}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v9

    .line 1706
    .local v9, "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    invoke-virtual {v9}, Ljavax/xml/parsers/DocumentBuilder;->newDocument()Lorg/w3c/dom/Document;

    move-result-object v8

    .line 1708
    .local v8, "doc":Lorg/w3c/dom/Document;
    const-string v20, "DeviceStatus"

    move-object/from16 v0, v20

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v7

    .line 1709
    .local v7, "deviceStatusTag":Lorg/w3c/dom/Element;
    invoke-interface {v8, v7}, Lorg/w3c/dom/Document;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 1712
    const-string v20, ","

    move-object/from16 v0, p2

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v20

    if-eqz v20, :cond_0

    .line 1713
    const-string v20, ","

    move-object/from16 v0, p2

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 1714
    .local v5, "devIdslist":[Ljava/lang/String;
    const/4 v13, 0x0

    .local v13, "i":I
    :goto_0
    array-length v0, v5

    move/from16 v20, v0

    move/from16 v0, v20

    if-ge v13, v0, :cond_1

    .line 1716
    const-string v20, "IsGroupAction"

    move-object/from16 v0, v20

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v12

    .line 1717
    .local v12, "groupAvailableTag1":Lorg/w3c/dom/Element;
    move-object/from16 v0, p4

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-interface {v12, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 1718
    invoke-interface {v7, v12}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 1721
    const-string v20, "DeviceID"

    move-object/from16 v0, v20

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v6

    .line 1722
    .local v6, "deviceIdTag":Lorg/w3c/dom/Element;
    aget-object v20, v5, v13

    move-object/from16 v0, v20

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-interface {v6, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 1723
    invoke-interface {v7, v6}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 1724
    const-string v20, "available"

    move-object/from16 v0, v20

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createAttribute(Ljava/lang/String;)Lorg/w3c/dom/Attr;

    move-result-object v2

    .line 1725
    .local v2, "attr":Lorg/w3c/dom/Attr;
    const-string v20, "YES"

    move-object/from16 v0, v20

    invoke-interface {v2, v0}, Lorg/w3c/dom/Attr;->setValue(Ljava/lang/String;)V

    .line 1726
    invoke-interface {v6, v2}, Lorg/w3c/dom/Element;->setAttributeNode(Lorg/w3c/dom/Attr;)Lorg/w3c/dom/Attr;

    .line 1729
    const-string v20, "CapabilityID"

    move-object/from16 v0, v20

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v3

    .line 1730
    .local v3, "capabilityIdTag":Lorg/w3c/dom/Element;
    move-object/from16 v0, p3

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-interface {v3, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 1731
    invoke-interface {v7, v3}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 1734
    const-string v20, "CapabilityValue"

    move-object/from16 v0, v20

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v4

    .line 1735
    .local v4, "capabilityValueTag":Lorg/w3c/dom/Element;
    move-object/from16 v0, p1

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-interface {v4, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 1736
    invoke-interface {v7, v4}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 1714
    add-int/lit8 v13, v13, 0x1

    goto :goto_0

    .line 1741
    .end local v2    # "attr":Lorg/w3c/dom/Attr;
    .end local v3    # "capabilityIdTag":Lorg/w3c/dom/Element;
    .end local v4    # "capabilityValueTag":Lorg/w3c/dom/Element;
    .end local v5    # "devIdslist":[Ljava/lang/String;
    .end local v6    # "deviceIdTag":Lorg/w3c/dom/Element;
    .end local v12    # "groupAvailableTag1":Lorg/w3c/dom/Element;
    .end local v13    # "i":I
    :cond_0
    const-string v20, "IsGroupAction"

    move-object/from16 v0, v20

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v11

    .line 1742
    .local v11, "groupAvailableTag":Lorg/w3c/dom/Element;
    move-object/from16 v0, p4

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-interface {v11, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 1743
    invoke-interface {v7, v11}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 1746
    const-string v20, "DeviceID"

    move-object/from16 v0, v20

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v6

    .line 1747
    .restart local v6    # "deviceIdTag":Lorg/w3c/dom/Element;
    move-object/from16 v0, p2

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-interface {v6, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 1748
    invoke-interface {v7, v6}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 1749
    const-string v20, "available"

    move-object/from16 v0, v20

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createAttribute(Ljava/lang/String;)Lorg/w3c/dom/Attr;

    move-result-object v2

    .line 1750
    .restart local v2    # "attr":Lorg/w3c/dom/Attr;
    const-string v20, "YES"

    move-object/from16 v0, v20

    invoke-interface {v2, v0}, Lorg/w3c/dom/Attr;->setValue(Ljava/lang/String;)V

    .line 1751
    invoke-interface {v6, v2}, Lorg/w3c/dom/Element;->setAttributeNode(Lorg/w3c/dom/Attr;)Lorg/w3c/dom/Attr;

    .line 1754
    const-string v20, "CapabilityID"

    move-object/from16 v0, v20

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v3

    .line 1755
    .restart local v3    # "capabilityIdTag":Lorg/w3c/dom/Element;
    move-object/from16 v0, p3

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-interface {v3, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 1756
    invoke-interface {v7, v3}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 1759
    const-string v20, "CapabilityValue"

    move-object/from16 v0, v20

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v4

    .line 1760
    .restart local v4    # "capabilityValueTag":Lorg/w3c/dom/Element;
    move-object/from16 v0, p1

    invoke-interface {v8, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-interface {v4, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 1761
    invoke-interface {v7, v4}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 1765
    .end local v2    # "attr":Lorg/w3c/dom/Attr;
    .end local v3    # "capabilityIdTag":Lorg/w3c/dom/Element;
    .end local v4    # "capabilityValueTag":Lorg/w3c/dom/Element;
    .end local v6    # "deviceIdTag":Lorg/w3c/dom/Element;
    .end local v11    # "groupAvailableTag":Lorg/w3c/dom/Element;
    :cond_1
    invoke-static {}, Ljavax/xml/transform/TransformerFactory;->newInstance()Ljavax/xml/transform/TransformerFactory;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljavax/xml/transform/TransformerFactory;->newTransformer()Ljavax/xml/transform/Transformer;

    move-result-object v18

    .line 1766
    .local v18, "transformer":Ljavax/xml/transform/Transformer;
    new-instance v19, Ljava/io/StringWriter;

    invoke-direct/range {v19 .. v19}, Ljava/io/StringWriter;-><init>()V

    .line 1767
    .local v19, "writer":Ljava/io/StringWriter;
    new-instance v15, Ljavax/xml/transform/stream/StreamResult;

    move-object/from16 v0, v19

    invoke-direct {v15, v0}, Ljavax/xml/transform/stream/StreamResult;-><init>(Ljava/io/Writer;)V

    .line 1768
    .local v15, "result":Ljavax/xml/transform/stream/StreamResult;
    new-instance v20, Ljavax/xml/transform/dom/DOMSource;

    move-object/from16 v0, v20

    invoke-direct {v0, v8}, Ljavax/xml/transform/dom/DOMSource;-><init>(Lorg/w3c/dom/Node;)V

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-virtual {v0, v1, v15}, Ljavax/xml/transform/Transformer;->transform(Ljavax/xml/transform/Source;Ljavax/xml/transform/Result;)V

    .line 1771
    invoke-virtual/range {v19 .. v19}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v16

    .line 1772
    const-string v20, "UpnpDeviceList"

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "File saved!"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljavax/xml/transform/TransformerException; {:try_start_0 .. :try_end_0} :catch_1

    .line 1778
    .end local v7    # "deviceStatusTag":Lorg/w3c/dom/Element;
    .end local v8    # "doc":Lorg/w3c/dom/Document;
    .end local v9    # "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    .end local v10    # "docFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    .end local v15    # "result":Ljavax/xml/transform/stream/StreamResult;
    .end local v18    # "transformer":Ljavax/xml/transform/Transformer;
    .end local v19    # "writer":Ljava/io/StringWriter;
    :goto_1
    return-object v16

    .line 1773
    :catch_0
    move-exception v14

    .line 1774
    .local v14, "pce":Ljavax/xml/parsers/ParserConfigurationException;
    invoke-virtual {v14}, Ljavax/xml/parsers/ParserConfigurationException;->printStackTrace()V

    goto :goto_1

    .line 1775
    .end local v14    # "pce":Ljavax/xml/parsers/ParserConfigurationException;
    :catch_1
    move-exception v17

    .line 1776
    .local v17, "tfe":Ljavax/xml/transform/TransformerException;
    invoke-virtual/range {v17 .. v17}, Ljavax/xml/transform/TransformerException;->printStackTrace()V

    goto :goto_1
.end method

.method public editWeeklyCalenderString(Ljava/lang/String;)V
    .locals 5
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 2072
    const/4 v3, 0x2

    new-array v2, v3, [Ljava/lang/String;

    .line 2073
    .local v2, "editWeekly":[Ljava/lang/String;
    const/4 v3, 0x0

    const-string v4, "2"

    aput-object v4, v2, v3

    .line 2074
    const/4 v3, 0x1

    aput-object p1, v2, v3

    .line 2075
    iget-object v3, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v1

    .line 2076
    .local v1, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    invoke-virtual {v1, p1}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v3

    const-string v4, "EditWeeklycalendar"

    invoke-virtual {v3, v4}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 2077
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    sget-object v3, Lcom/belkin/wemo/cache/utils/Constants;->SET_EDIT_WEEKLY_CALENDER_ARGS:[Ljava/lang/String;

    invoke-direct {p0, v0, v3, v2}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 2078
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    .line 2079
    return-void
.end method

.method public enableRemoteAccess(Lcom/belkin/wemo/cache/data/DeviceInformation;)Lorg/json/JSONObject;
    .locals 9
    .param p1, "device"    # Lcom/belkin/wemo/cache/data/DeviceInformation;

    .prologue
    .line 732
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    .line 734
    :try_start_0
    invoke-direct {p0}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getRemoteAccessAgrs()[Ljava/lang/String;

    move-result-object v3

    .line 735
    .local v3, "remoteAccessArg":[Ljava/lang/String;
    if-eqz p1, :cond_0

    .line 736
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v2

    .line 737
    .local v2, "localDevice":Lorg/cybergarage/upnp/Device;
    const-string v6, "UpnpDeviceList"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "enabling remote access for device :: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v2}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 738
    const-string v6, "RemoteAccess"

    invoke-virtual {v2, v6}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 739
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    sget-object v6, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->SET_REMOTE_ACESS_ARGS:[Ljava/lang/String;

    invoke-direct {p0, v0, v6, v3}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 740
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v5

    .line 741
    .local v5, "response":Ljava/lang/String;
    if-eqz v5, :cond_0

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_0

    .line 742
    new-instance v4, Lcom/belkin/upnp/parser/RemoteAccessResponseParser;

    invoke-direct {v4}, Lcom/belkin/upnp/parser/RemoteAccessResponseParser;-><init>()V

    .line 743
    .local v4, "remoteAccessResponseParser":Lcom/belkin/upnp/parser/RemoteAccessResponseParser;
    invoke-virtual {v4, v5}, Lcom/belkin/upnp/parser/RemoteAccessResponseParser;->parseRemoteAccessRespone(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 750
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v2    # "localDevice":Lorg/cybergarage/upnp/Device;
    .end local v3    # "remoteAccessArg":[Ljava/lang/String;
    .end local v4    # "remoteAccessResponseParser":Lcom/belkin/upnp/parser/RemoteAccessResponseParser;
    .end local v5    # "response":Ljava/lang/String;
    :cond_0
    :goto_0
    iget-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    return-object v6

    .line 747
    :catch_0
    move-exception v1

    .line 748
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public eventNotifyReceived(Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "uuid"    # Ljava/lang/String;
    .param p2, "Leddevid"    # Ljava/lang/String;
    .param p3, "seq"    # J
    .param p5, "varName"    # Ljava/lang/String;
    .param p6, "value"    # Ljava/lang/String;

    .prologue
    .line 308
    :try_start_0
    iget-object v3, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v0

    .line 309
    .local v0, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    invoke-virtual {v0, p1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceBySubscriber(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v1

    .line 312
    .local v1, "device":Lorg/cybergarage/upnp/Device;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->isWeMo(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    const-string v3, "TimeSyncRequest"

    invoke-virtual {p5, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 315
    invoke-virtual {p0, v1}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->postTimeSync(Lorg/cybergarage/upnp/Device;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 321
    .end local v0    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .end local v1    # "device":Lorg/cybergarage/upnp/Device;
    :cond_0
    :goto_0
    return-void

    .line 317
    :catch_0
    move-exception v2

    .line 318
    .local v2, "e":Ljava/lang/Exception;
    const-string v3, "UpnpDeviceList"

    const-string v4, "eventNotifyReceived(String uuid, long seq, String varName, String value)"

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 319
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public findLedBulb(Ljava/lang/String;)Lorg/json/JSONArray;
    .locals 10
    .param p1, "deviceId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 1877
    new-instance v4, Lorg/json/JSONArray;

    invoke-direct {v4}, Lorg/json/JSONArray;-><init>()V

    .line 1880
    .local v4, "findbulbResponse":Lorg/json/JSONArray;
    :try_start_0
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v7

    invoke-virtual {v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v1

    .line 1881
    .local v1, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    if-eqz v1, :cond_2

    .line 1882
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v7

    invoke-virtual {v7}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v7

    if-ge v5, v7, :cond_1

    .line 1883
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v7

    invoke-virtual {v7, v5}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v7

    invoke-virtual {v7}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v7

    const-string v8, "Bridge"

    invoke-virtual {v7, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 1884
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v7

    invoke-virtual {v7, v5}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v7

    invoke-virtual {v7}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    .line 1882
    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 1887
    :cond_1
    const-string v7, "UpnpDeviceList"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "bridge udn if:---"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v9

    invoke-virtual {v9}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "--"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1890
    .end local v5    # "i":I
    :cond_2
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    if-eqz v7, :cond_3

    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    if-eqz v7, :cond_3

    .line 1891
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    invoke-virtual {v1, v7}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v7

    const-string v8, "IdentifyDevice"

    invoke-virtual {v7, v8}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 1892
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    sget-object v7, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->ARGS_DEVICEID:[Ljava/lang/String;

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/String;

    const/4 v9, 0x0

    aput-object p1, v8, v9

    invoke-direct {p0, v0, v7, v8}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 1893
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v6

    .line 1894
    .local v6, "response":Ljava/lang/String;
    const-string v7, "UpnpDeviceList"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "FIND BULB RESPOMSE: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1895
    if-eqz v6, :cond_3

    .line 1896
    new-instance v2, Lcom/belkin/upnp/parser/GetCreateGroupResponseParser;

    invoke-direct {v2}, Lcom/belkin/upnp/parser/GetCreateGroupResponseParser;-><init>()V

    .line 1897
    .local v2, "createGroupResponse":Lcom/belkin/upnp/parser/GetCreateGroupResponseParser;
    invoke-virtual {v2, v6}, Lcom/belkin/upnp/parser/GetCreateGroupResponseParser;->parseCreateGroupResponse(Ljava/lang/String;)Lorg/json/JSONArray;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 1903
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .end local v2    # "createGroupResponse":Lcom/belkin/upnp/parser/GetCreateGroupResponseParser;
    .end local v6    # "response":Ljava/lang/String;
    :cond_3
    :goto_1
    return-object v4

    .line 1900
    :catch_0
    move-exception v3

    .line 1901
    .local v3, "e":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method public firmwareUpdateList(Ljava/lang/String;Lorg/json/JSONArray;)Lorg/json/JSONObject;
    .locals 24
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "currentFirmwareArray"    # Lorg/json/JSONArray;

    .prologue
    .line 2738
    const-string v19, "UpnpDeviceList"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, " firmwareUpdateList url: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, " :: currentFirmwareArray ::"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2739
    const-string v19, "FIRMWARE UPGRADE"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, " firmwareUpdateList url: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, " :: currentFirmwareArray ::"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2740
    new-instance v15, Lorg/json/JSONObject;

    invoke-direct {v15}, Lorg/json/JSONObject;-><init>()V

    .line 2741
    .local v15, "jsonObject":Lorg/json/JSONObject;
    const/16 v19, 0x3

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v18, v0

    .line 2742
    .local v18, "updateFirmwareDetails":[Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->firmDetailsList:Ljava/util/ArrayList;

    move-object/from16 v19, v0

    if-nez v19, :cond_0

    .line 2743
    invoke-virtual/range {p0 .. p1}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getFirmwareDetailsList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->firmDetailsList:Ljava/util/ArrayList;

    .line 2744
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->firmDetailsList:Ljava/util/ArrayList;

    move-object/from16 v19, v0

    if-eqz v19, :cond_4d

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->firmDetailsList:Ljava/util/ArrayList;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/util/ArrayList;->size()I

    move-result v19

    if-lez v19, :cond_4d

    if-eqz p2, :cond_4d

    .line 2745
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->firmDetailsList:Ljava/util/ArrayList;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->firmDetailsList:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/util/ArrayList;->size()I

    move-result v20

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v10

    check-cast v10, [Ljava/lang/String;

    .line 2747
    .local v10, "firmwareDetailsArray":[Ljava/lang/String;
    const/4 v13, 0x0

    .local v13, "i":I
    :goto_0
    :try_start_0
    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v19

    move/from16 v0, v19

    if-ge v13, v0, :cond_4

    .line 2748
    const-string v17, ""

    .line 2749
    .local v17, "status":Ljava/lang/String;
    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    .line 2750
    .local v5, "currentFirmwareVersion":Lorg/json/JSONObject;
    if-eqz v5, :cond_4c

    .line 2751
    const-string v19, "type"

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 2752
    .local v7, "deviceType":Ljava/lang/String;
    move-object v4, v10

    .local v4, "arr$":[Ljava/lang/String;
    array-length v0, v4

    move/from16 v16, v0

    .local v16, "len$":I
    const/4 v14, 0x0

    .local v14, "i$":I
    :goto_1
    move/from16 v0, v16

    if-ge v14, v0, :cond_2

    aget-object v9, v4, v14

    .line 2753
    .local v9, "firmwareDetail":Ljava/lang/String;
    const-string v19, "type"

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    const-string v20, "urn:Belkin:device:lightswitch:1"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_9

    .line 2754
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTLSFw:[Ljava/lang/String;

    move-object/from16 v19, v0

    if-eqz v19, :cond_6

    .line 2755
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    move-object/from16 v19, v0

    const-string v20, "devicefirmware"

    move-object/from16 v0, v20

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->lightSwitchFW:[Ljava/lang/String;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransLSFw:[Ljava/lang/String;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTLSFw:[Ljava/lang/String;

    move-object/from16 v23, v0

    invoke-virtual/range {v19 .. v23}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareOpenWRTFirmwareForLightSwitch(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 2756
    const-string v19, "light"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_3

    .line 2757
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->lightSwitchFW:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2758
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->lightSwitchFW:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2759
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->lightSwitchFW:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3210
    :cond_1
    :goto_2
    if-eqz v17, :cond_4b

    const-string v19, ""

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_4b

    .line 3211
    new-instance v11, Lorg/json/JSONObject;

    invoke-direct {v11}, Lorg/json/JSONObject;-><init>()V

    .line 3212
    .local v11, "firmwareJsonObject":Lorg/json/JSONObject;
    const-string v19, "udn"

    const-string v20, "udn"

    move-object/from16 v0, v20

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v11, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3213
    const-string v19, "devicefirmware"

    const-string v20, "devicefirmware"

    move-object/from16 v0, v20

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v11, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3214
    const-string v19, "pluginId"

    const-string v20, "pluginId"

    move-object/from16 v0, v20

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v11, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3215
    const-string v19, "macAddress"

    const-string v20, "macAddress"

    move-object/from16 v0, v20

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v11, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3216
    const-string v19, "friendlyName"

    const-string v20, "friendlyName"

    move-object/from16 v0, v20

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v11, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3217
    const-string v19, "type"

    const-string v20, "type"

    move-object/from16 v0, v20

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v11, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3218
    sget-object v19, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->NEW_FIRMWARE_VERSION:Ljava/lang/String;

    const/16 v20, 0x0

    aget-object v20, v18, v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v11, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3219
    sget-object v19, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->NEW_FIRMWARE_URL:Ljava/lang/String;

    const/16 v20, 0x1

    aget-object v20, v18, v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v11, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3220
    sget-object v19, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->NEW_FIRMWARE_SIGNATURE:Ljava/lang/String;

    const/16 v20, 0x2

    aget-object v20, v18, v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v11, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3222
    const-string v19, "udn"

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v15, v0, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 2747
    .end local v4    # "arr$":[Ljava/lang/String;
    .end local v7    # "deviceType":Ljava/lang/String;
    .end local v9    # "firmwareDetail":Ljava/lang/String;
    .end local v11    # "firmwareJsonObject":Lorg/json/JSONObject;
    .end local v14    # "i$":I
    .end local v16    # "len$":I
    :cond_2
    :goto_3
    add-int/lit8 v13, v13, 0x1

    goto/16 :goto_0

    .line 2761
    .restart local v4    # "arr$":[Ljava/lang/String;
    .restart local v7    # "deviceType":Ljava/lang/String;
    .restart local v9    # "firmwareDetail":Ljava/lang/String;
    .restart local v14    # "i$":I
    .restart local v16    # "len$":I
    :cond_3
    const-string v19, "openWRTlight"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_5

    .line 2762
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTLSFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2763
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTLSFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2764
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTLSFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    goto/16 :goto_2

    .line 3231
    .end local v4    # "arr$":[Ljava/lang/String;
    .end local v5    # "currentFirmwareVersion":Lorg/json/JSONObject;
    .end local v7    # "deviceType":Ljava/lang/String;
    .end local v9    # "firmwareDetail":Ljava/lang/String;
    .end local v14    # "i$":I
    .end local v16    # "len$":I
    .end local v17    # "status":Ljava/lang/String;
    :catch_0
    move-exception v8

    .line 3232
    .local v8, "e":Lorg/json/JSONException;
    const-string v19, "UpnpDeviceList"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, " JSON Exception is :: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 3239
    .end local v8    # "e":Lorg/json/JSONException;
    .end local v10    # "firmwareDetailsArray":[Ljava/lang/String;
    .end local v13    # "i":I
    :cond_4
    :goto_4
    return-object v15

    .line 2766
    .restart local v4    # "arr$":[Ljava/lang/String;
    .restart local v5    # "currentFirmwareVersion":Lorg/json/JSONObject;
    .restart local v7    # "deviceType":Ljava/lang/String;
    .restart local v9    # "firmwareDetail":Ljava/lang/String;
    .restart local v10    # "firmwareDetailsArray":[Ljava/lang/String;
    .restart local v13    # "i":I
    .restart local v14    # "i$":I
    .restart local v16    # "len$":I
    .restart local v17    # "status":Ljava/lang/String;
    :cond_5
    :try_start_1
    const-string v19, "openWRTTranslight"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_1

    .line 2767
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransLSFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2768
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransLSFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2769
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransLSFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto/16 :goto_2

    .line 3233
    .end local v4    # "arr$":[Ljava/lang/String;
    .end local v5    # "currentFirmwareVersion":Lorg/json/JSONObject;
    .end local v7    # "deviceType":Ljava/lang/String;
    .end local v9    # "firmwareDetail":Ljava/lang/String;
    .end local v14    # "i$":I
    .end local v16    # "len$":I
    .end local v17    # "status":Ljava/lang/String;
    :catch_1
    move-exception v8

    .line 3234
    .local v8, "e":Ljava/lang/Exception;
    const-string v19, "UpnpDeviceList"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Exception while showing release notes and the exception is :: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4

    .line 2772
    .end local v8    # "e":Ljava/lang/Exception;
    .restart local v4    # "arr$":[Ljava/lang/String;
    .restart local v5    # "currentFirmwareVersion":Lorg/json/JSONObject;
    .restart local v7    # "deviceType":Ljava/lang/String;
    .restart local v9    # "firmwareDetail":Ljava/lang/String;
    .restart local v14    # "i$":I
    .restart local v16    # "len$":I
    .restart local v17    # "status":Ljava/lang/String;
    :cond_6
    :try_start_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->lightSwitchFW:[Ljava/lang/String;

    move-object/from16 v19, v0

    if-eqz v19, :cond_8

    .line 2773
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    move-object/from16 v19, v0

    const-string v20, "devicefirmware"

    move-object/from16 v0, v20

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->lightSwitchFW:[Ljava/lang/String;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->signedLightSwitchFW:[Ljava/lang/String;

    move-object/from16 v22, v0

    invoke-virtual/range {v19 .. v22}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareNEWFirmwareDataForLightSwitch(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 2774
    const-string v19, "light"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_7

    .line 2775
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->lightSwitchFW:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2776
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->lightSwitchFW:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2777
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->lightSwitchFW:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 2779
    :cond_7
    const-string v19, "signedlight"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_1

    .line 2780
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->signedLightSwitchFW:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2781
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->signedLightSwitchFW:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2782
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->signedLightSwitchFW:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 2786
    :cond_8
    const-string v19, "UpnpDeviceList"

    const-string v20, "Either openWRTLSFw or lightSwitchFW is null"

    invoke-static/range {v19 .. v20}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_2

    .line 2789
    :cond_9
    const-string v19, "type"

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    const-string v20, "urn:Belkin:device:insight:1"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_12

    .line 2790
    const-string v19, "hwVersion"

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 2792
    .local v12, "hwVersion":Ljava/lang/String;
    invoke-virtual {v12}, Ljava/lang/String;->isEmpty()Z

    move-result v19

    if-nez v19, :cond_a

    const-string v19, "v1"

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_10

    .line 2794
    :cond_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransinsightFw:[Ljava/lang/String;

    move-object/from16 v19, v0

    if-eqz v19, :cond_d

    .line 2795
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    move-object/from16 v19, v0

    const-string v20, "devicefirmware"

    move-object/from16 v0, v20

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->insightFW:[Ljava/lang/String;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransinsightFw:[Ljava/lang/String;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTinsightFw:[Ljava/lang/String;

    move-object/from16 v23, v0

    invoke-virtual/range {v19 .. v23}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareOpenWRTFirmwareForInsight(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 2796
    const-string v19, "insight"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_b

    .line 2797
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->insightFW:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2798
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->insightFW:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2799
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->insightFW:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 2801
    :cond_b
    const-string v19, "openWRTinsight"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_c

    .line 2802
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTinsightFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2803
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTinsightFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2804
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTinsightFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 2806
    :cond_c
    const-string v19, "openWRTTransinsight"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_1

    .line 2807
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransinsightFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2808
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransinsightFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2809
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransinsightFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 2812
    :cond_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->insightFW:[Ljava/lang/String;

    move-object/from16 v19, v0

    if-eqz v19, :cond_f

    .line 2813
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    move-object/from16 v19, v0

    const-string v20, "devicefirmware"

    move-object/from16 v0, v20

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->insightFW:[Ljava/lang/String;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->signedInsightFW:[Ljava/lang/String;

    move-object/from16 v22, v0

    invoke-virtual/range {v19 .. v22}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareNEWFirmwareDataForInsight(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 2814
    const-string v19, "insight"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_e

    .line 2815
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->insightFW:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2816
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->insightFW:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2817
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->insightFW:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 2819
    :cond_e
    const-string v19, "signedInsight"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_1

    .line 2820
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->signedInsightFW:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2821
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->signedInsightFW:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2822
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->signedInsightFW:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 2826
    :cond_f
    const-string v19, "UpnpDeviceList"

    const-string v20, "Either openWRTTransinsightFw or insightFW is null"

    invoke-static/range {v19 .. v20}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_2

    .line 2828
    :cond_10
    const-string v19, "v2"

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_1

    .line 2830
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTInsightV2:[Ljava/lang/String;

    move-object/from16 v19, v0

    if-eqz v19, :cond_11

    .line 2831
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    move-object/from16 v19, v0

    const-string v20, "devicefirmware"

    move-object/from16 v0, v20

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTInsightV2:[Ljava/lang/String;

    move-object/from16 v21, v0

    invoke-virtual/range {v19 .. v21}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareOpenWRTFirmwareForInsightV2(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 2832
    const-string v19, "insightV2"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_1

    .line 2833
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTInsightV2:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2834
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTInsightV2:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2835
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTInsightV2:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 2838
    :cond_11
    const-string v19, "UpnpDeviceList"

    const-string v20, "openWRTInsightV2 is null"

    invoke-static/range {v19 .. v20}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_2

    .line 2843
    .end local v12    # "hwVersion":Ljava/lang/String;
    :cond_12
    const-string v19, "type"

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    const-string v20, "urn:Belkin:device:Maker:1"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_17

    .line 2844
    const-string v19, "devicefirmware"

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 2845
    .local v6, "currentPlugInVersion":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransMakerFw:[Ljava/lang/String;

    move-object/from16 v19, v0

    if-eqz v19, :cond_15

    .line 2847
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTMakerFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const-string v21, "Maker"

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v6, v1, v2}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareOpenWRTFirmwareVersions(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 2848
    const-string v19, "Maker"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_13

    .line 2849
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->makerFW:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2850
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->makerFW:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2851
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->makerFW:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 2852
    :cond_13
    const-string v19, "openWRTTransMaker"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_14

    .line 2853
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransMakerFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2854
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransMakerFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2855
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransMakerFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 2856
    :cond_14
    const-string v19, "openWRTMaker"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_1

    .line 2857
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTMakerFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2858
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTMakerFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2859
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTMakerFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 2861
    :cond_15
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->makerFW:[Ljava/lang/String;

    move-object/from16 v19, v0

    if-eqz v19, :cond_16

    .line 2862
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    move-object/from16 v19, v0

    const-string v20, "devicefirmware"

    move-object/from16 v0, v20

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->makerFW:[Ljava/lang/String;

    move-object/from16 v21, v0

    invoke-virtual/range {v19 .. v21}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareNEWFirmwareDataForMaker(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 2863
    const-string v19, "Maker"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_1

    .line 2864
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->makerFW:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2865
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->makerFW:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2866
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->makerFW:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 2870
    :cond_16
    const-string v19, "UpnpDeviceList"

    const-string v20, "makerFW  is null"

    invoke-static/range {v19 .. v20}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_2

    .line 2874
    .end local v6    # "currentPlugInVersion":Ljava/lang/String;
    :cond_17
    const-string v19, "type"

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    const-string v20, "urn:Belkin:device:sensor:1"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_18

    const-string v19, "type"

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    const-string v20, "urn:Belkin:device:controllee:1"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_26

    .line 2876
    :cond_18
    const-string v19, "devicefirmware"

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 2877
    .restart local v6    # "currentPlugInVersion":Ljava/lang/String;
    const-string v19, "WeMo_US"

    move-object/from16 v0, v19

    invoke-virtual {v6, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v19

    if-nez v19, :cond_19

    const-string v19, "WeMo_WW_1.0"

    move-object/from16 v0, v19

    invoke-virtual {v6, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v19

    if-eqz v19, :cond_1f

    .line 2878
    :cond_19
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTranssnsFw:[Ljava/lang/String;

    move-object/from16 v19, v0

    if-eqz v19, :cond_1c

    .line 2879
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->usFW:[Ljava/lang/String;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTranssnsFw:[Ljava/lang/String;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTsnsFw:[Ljava/lang/String;

    move-object/from16 v22, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    move-object/from16 v3, v22

    invoke-virtual {v0, v6, v1, v2, v3}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareOpenWRTFirmwareForSNS(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 2880
    const-string v19, "US"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_1a

    .line 2881
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->usFW:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2882
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->usFW:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2883
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->usFW:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 2885
    :cond_1a
    const-string v19, "openWRTSNS"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_1b

    .line 2886
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTsnsFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2887
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTsnsFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2888
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTsnsFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 2890
    :cond_1b
    const-string v19, "openWRTTransSNS"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_1

    .line 2891
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTranssnsFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2892
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTranssnsFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2893
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTranssnsFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 2896
    :cond_1c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->usFW:[Ljava/lang/String;

    move-object/from16 v19, v0

    if-eqz v19, :cond_1e

    .line 2897
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->usFW:[Ljava/lang/String;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->signedUSFW:[Ljava/lang/String;

    move-object/from16 v21, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v6, v1, v2}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareNEWFirmwareDataForSwitchSensor(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 2898
    const-string v19, "US"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_1d

    .line 2899
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->usFW:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2900
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->usFW:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2901
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->usFW:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 2903
    :cond_1d
    const-string v19, "US_SIGNED"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_1

    .line 2904
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->signedUSFW:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2905
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->signedUSFW:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2906
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->signedUSFW:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 2910
    :cond_1e
    const-string v19, "UpnpDeviceList"

    const-string v20, "Either openWRTTranssnsFw or usFW is null"

    invoke-static/range {v19 .. v20}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_2

    .line 2913
    :cond_1f
    const-string v19, "WeMo_EU"

    move-object/from16 v0, v19

    invoke-virtual {v6, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v19

    if-nez v19, :cond_20

    const-string v19, "WeMo_WW_2.0"

    move-object/from16 v0, v19

    invoke-virtual {v6, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v19

    if-eqz v19, :cond_1

    .line 2914
    :cond_20
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTranssnsFw:[Ljava/lang/String;

    move-object/from16 v19, v0

    if-eqz v19, :cond_23

    .line 2915
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->euFW:[Ljava/lang/String;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTranssnsFw:[Ljava/lang/String;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTsnsFw:[Ljava/lang/String;

    move-object/from16 v22, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    move-object/from16 v3, v22

    invoke-virtual {v0, v6, v1, v2, v3}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareOpenWRTFirmwareForSNS(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 2916
    const-string v19, "EU"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_21

    .line 2917
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->euFW:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2918
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->euFW:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2919
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->euFW:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 2921
    :cond_21
    const-string v19, "openWRTSNS"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_22

    .line 2922
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTsnsFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2923
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTsnsFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2924
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTsnsFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 2926
    :cond_22
    const-string v19, "openWRTTransSNS"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_1

    .line 2927
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTranssnsFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2928
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTranssnsFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2929
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTranssnsFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 2932
    :cond_23
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->euFW:[Ljava/lang/String;

    move-object/from16 v19, v0

    if-eqz v19, :cond_25

    .line 2933
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->euFW:[Ljava/lang/String;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->signedEUFW:[Ljava/lang/String;

    move-object/from16 v21, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v6, v1, v2}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareNEWFirmwareDataForSwitchSensor(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 2934
    const-string v19, "EU"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_24

    .line 2935
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->euFW:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2936
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->euFW:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2937
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->euFW:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 2939
    :cond_24
    const-string v19, "EU_SIGNED"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_1

    .line 2940
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->signedEUFW:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2941
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->signedEUFW:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2942
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->signedEUFW:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 2946
    :cond_25
    const-string v19, "UpnpDeviceList"

    const-string v20, "Either openWRTTranssnsFw or euFW is null"

    invoke-static/range {v19 .. v20}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_2

    .line 2949
    .end local v6    # "currentPlugInVersion":Ljava/lang/String;
    :cond_26
    const-string v19, "type"

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    const-string v20, "urn:Belkin:device:Crockpot:1"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_2a

    .line 2950
    const-string v19, "devicefirmware"

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 2951
    .restart local v6    # "currentPlugInVersion":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransSlowCookerFw:[Ljava/lang/String;

    move-object/from16 v19, v0

    if-eqz v19, :cond_29

    .line 2953
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTSlowCookerFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const-string v21, "SlowCooker"

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v6, v1, v2}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareOpenWRTFirmwareVersions(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 2954
    const-string v19, "slowCookerFlag"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_27

    .line 2955
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->slowCookerFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2956
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->slowCookerFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2957
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->slowCookerFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 2958
    :cond_27
    const-string v19, "openWRTTransSlowCooker"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_28

    .line 2959
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransSlowCookerFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2960
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransSlowCookerFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2961
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransSlowCookerFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 2962
    :cond_28
    const-string v19, "openWRTSlowCooker"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_1

    .line 2963
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTSlowCookerFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2964
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTSlowCookerFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2965
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTSlowCookerFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 2967
    :cond_29
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->slowCookerFw:[Ljava/lang/String;

    move-object/from16 v19, v0

    if-eqz v19, :cond_1

    .line 2968
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->slowCookerFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v0, v6, v1}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareNEWFirmwareDataForCrockpot(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 2969
    const-string v19, "slowCookerFlag"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_1

    .line 2970
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->slowCookerFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2971
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->slowCookerFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2972
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->slowCookerFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 2977
    .end local v6    # "currentPlugInVersion":Ljava/lang/String;
    :cond_2a
    const-string v19, "type"

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    const-string v20, "urn:Belkin:device:CoffeeMaker:1"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_2e

    .line 2978
    const-string v19, "devicefirmware"

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 2979
    .restart local v6    # "currentPlugInVersion":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransCoffeeMakerFw:[Ljava/lang/String;

    move-object/from16 v19, v0

    if-eqz v19, :cond_2d

    .line 2981
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTCoffeeMakerFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const-string v21, "CoffeeMaker"

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v6, v1, v2}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareOpenWRTFirmwareVersions(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 2982
    const-string v19, "wemoSmartFlag"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_2b

    .line 2983
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->cofeeMakerFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2984
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->cofeeMakerFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2985
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->cofeeMakerFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 2986
    :cond_2b
    const-string v19, "openWRTTransCoffeeMaker"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_2c

    .line 2987
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransCoffeeMakerFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2988
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransCoffeeMakerFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2989
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransCoffeeMakerFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 2990
    :cond_2c
    const-string v19, "openWRTCoffeeMaker"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_1

    .line 2991
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTCoffeeMakerFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2992
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTCoffeeMakerFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2993
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTCoffeeMakerFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 2995
    :cond_2d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->cofeeMakerFw:[Ljava/lang/String;

    move-object/from16 v19, v0

    if-eqz v19, :cond_1

    .line 2996
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->cofeeMakerFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const-string v21, "CoffeeMaker"

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v6, v1, v2}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareFirmwareVersions(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 2997
    const-string v19, "CoffeeMakerFlag"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_1

    .line 2998
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->cofeeMakerFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 2999
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->cofeeMakerFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3000
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->cofeeMakerFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 3004
    .end local v6    # "currentPlugInVersion":Ljava/lang/String;
    :cond_2e
    const-string v19, "type"

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    const-string v20, "urn:Belkin:device:Heater:1"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_2f

    .line 3005
    const-string v19, "devicefirmware"

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 3006
    .restart local v6    # "currentPlugInVersion":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->heaterFw:[Ljava/lang/String;

    move-object/from16 v19, v0

    if-eqz v19, :cond_1

    .line 3007
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->heaterFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v0, v6, v1}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareNEWFirmwareDataForWeMoSmart(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 3008
    const-string v19, "wemoSmartFlag"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_1

    .line 3009
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->heaterFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3010
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->heaterFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3011
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->heaterFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 3015
    .end local v6    # "currentPlugInVersion":Ljava/lang/String;
    :cond_2f
    const-string v19, "type"

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    const-string v20, "urn:Belkin:device:HeaterA:1"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_33

    .line 3016
    const-string v19, "devicefirmware"

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 3017
    .restart local v6    # "currentPlugInVersion":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransHeaterAFw:[Ljava/lang/String;

    move-object/from16 v19, v0

    if-eqz v19, :cond_32

    .line 3019
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTHeaterAFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const-string v21, "HeaterA"

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v6, v1, v2}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareOpenWRTFirmwareVersions(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 3020
    const-string v19, "wemoSmartFlag"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_30

    .line 3021
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->heaterAFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3022
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->heaterAFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3023
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->heaterAFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 3024
    :cond_30
    const-string v19, "openWRTTransHeaterA"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_31

    .line 3025
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransHeaterAFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3026
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransHeaterAFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3027
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransHeaterAFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 3028
    :cond_31
    const-string v19, "openWRTHeaterA"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_1

    .line 3029
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTHeaterAFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3030
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTHeaterAFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3031
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTHeaterAFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 3033
    :cond_32
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->heaterAFw:[Ljava/lang/String;

    move-object/from16 v19, v0

    if-eqz v19, :cond_1

    .line 3034
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->heaterAFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const-string v21, "HeaterA"

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v6, v1, v2}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareFirmwareVersions(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 3035
    const-string v19, "HeaterAFlag"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_1

    .line 3036
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->heaterAFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3037
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->heaterAFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3038
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->heaterAFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 3042
    .end local v6    # "currentPlugInVersion":Ljava/lang/String;
    :cond_33
    const-string v19, "type"

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    const-string v20, "urn:Belkin:device:HeaterB:1"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_37

    .line 3043
    const-string v19, "devicefirmware"

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 3044
    .restart local v6    # "currentPlugInVersion":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransHeaterBFw:[Ljava/lang/String;

    move-object/from16 v19, v0

    if-eqz v19, :cond_36

    .line 3046
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTHeaterBFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const-string v21, "HeaterB"

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v6, v1, v2}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareOpenWRTFirmwareVersions(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 3047
    const-string v19, "wemoSmartFlag"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_34

    .line 3048
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->heaterBFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3049
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->heaterBFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3050
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->heaterBFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 3051
    :cond_34
    const-string v19, "openWRTTransHeaterB"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_35

    .line 3052
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransHeaterBFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3053
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransHeaterBFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3054
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransHeaterBFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 3055
    :cond_35
    const-string v19, "openWRTHeaterB"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_1

    .line 3056
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTHeaterBFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3057
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTHeaterBFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3058
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTHeaterBFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 3060
    :cond_36
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->heaterBFw:[Ljava/lang/String;

    move-object/from16 v19, v0

    if-eqz v19, :cond_1

    .line 3061
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->heaterBFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const-string v21, "HeaterB"

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v6, v1, v2}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareFirmwareVersions(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 3062
    const-string v19, "HeaterBFlag"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_1

    .line 3063
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->heaterBFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3064
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->heaterBFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3065
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->heaterBFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 3069
    .end local v6    # "currentPlugInVersion":Ljava/lang/String;
    :cond_37
    const-string v19, "type"

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    const-string v20, "urn:Belkin:device:Humidifier:1"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_3b

    .line 3070
    const-string v19, "devicefirmware"

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 3072
    .restart local v6    # "currentPlugInVersion":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransHumidifierFw:[Ljava/lang/String;

    move-object/from16 v19, v0

    if-eqz v19, :cond_3a

    .line 3074
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTHumidifierFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const-string v21, "Humidifier"

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v6, v1, v2}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareOpenWRTFirmwareVersions(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 3075
    const-string v19, "HumidifierFlag"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_38

    .line 3076
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->humidifierFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3077
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->humidifierFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3078
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->humidifierFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 3079
    :cond_38
    const-string v19, "openWRTTransHumidifier"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_39

    .line 3080
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransHumidifierFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3081
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransHumidifierFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3082
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransHumidifierFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 3083
    :cond_39
    const-string v19, "openWRTHumidifier"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_1

    .line 3084
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTHumidifierFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3085
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTHumidifierFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3086
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTHumidifierFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 3088
    :cond_3a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->humidifierFw:[Ljava/lang/String;

    move-object/from16 v19, v0

    if-eqz v19, :cond_1

    .line 3089
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->humidifierFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const-string v21, "Humidifier"

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v6, v1, v2}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareFirmwareVersions(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 3090
    const-string v19, "HumidifierFlag"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_1

    .line 3091
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->humidifierFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3092
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->humidifierFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3093
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->humidifierFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 3097
    .end local v6    # "currentPlugInVersion":Ljava/lang/String;
    :cond_3b
    const-string v19, "type"

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    const-string v20, "urn:Belkin:device:HumidifierB:1"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_3f

    .line 3098
    const-string v19, "devicefirmware"

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 3100
    .restart local v6    # "currentPlugInVersion":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransHumidifierBFw:[Ljava/lang/String;

    move-object/from16 v19, v0

    if-eqz v19, :cond_3e

    .line 3102
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTHumidifierBFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const-string v21, "HumidifierB"

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v6, v1, v2}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareOpenWRTFirmwareVersions(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 3103
    const-string v19, "HumidifierBFlag"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_3c

    .line 3104
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->humidifierBFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3105
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->humidifierBFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3106
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->humidifierBFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 3107
    :cond_3c
    const-string v19, "openWRTTransHumidifierB"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_3d

    .line 3108
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransHumidifierBFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3109
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransHumidifierBFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3110
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransHumidifierBFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 3111
    :cond_3d
    const-string v19, "openWRTHumidifierB"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_1

    .line 3112
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTHumidifierBFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3113
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTHumidifierBFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3114
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTHumidifierBFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 3116
    :cond_3e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->humidifierBFw:[Ljava/lang/String;

    move-object/from16 v19, v0

    if-eqz v19, :cond_1

    .line 3117
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->humidifierBFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const-string v21, "HumidifierB"

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v6, v1, v2}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareFirmwareVersions(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 3118
    const-string v19, "HumidifierBFlag"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_1

    .line 3119
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->humidifierBFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3120
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->humidifierBFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3121
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->humidifierBFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 3125
    .end local v6    # "currentPlugInVersion":Ljava/lang/String;
    :cond_3f
    const-string v19, "type"

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    const-string v20, "urn:Belkin:device:AirPurifier:1"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_43

    .line 3126
    const-string v19, "devicefirmware"

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 3128
    .restart local v6    # "currentPlugInVersion":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransAirPurifierFw:[Ljava/lang/String;

    move-object/from16 v19, v0

    if-eqz v19, :cond_42

    .line 3129
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTAirPurifierFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const-string v21, "AirPurifier"

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v6, v1, v2}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareOpenWRTFirmwareVersions(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 3130
    const-string v19, "wemoSmartFlag"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_40

    .line 3131
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->airPurifierFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3132
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->airPurifierFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3133
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->airPurifierFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 3134
    :cond_40
    const-string v19, "openWRTTransAirPurifier"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_41

    .line 3135
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransAirPurifierFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3136
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransAirPurifierFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3137
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransAirPurifierFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 3138
    :cond_41
    const-string v19, "openWRTAirPurifier"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_1

    .line 3139
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTAirPurifierFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3140
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTAirPurifierFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3141
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTAirPurifierFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 3143
    :cond_42
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->airPurifierFw:[Ljava/lang/String;

    move-object/from16 v19, v0

    if-eqz v19, :cond_1

    .line 3144
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->airPurifierFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const-string v21, "AirPurifier"

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v6, v1, v2}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareFirmwareVersions(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 3145
    const-string v19, "AirPurifierFlag"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_1

    .line 3146
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->airPurifierFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3147
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->airPurifierFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3148
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->airPurifierFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 3152
    .end local v6    # "currentPlugInVersion":Ljava/lang/String;
    :cond_43
    const-string v19, "type"

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    const-string v20, "urn:Belkin:device:bridge:1"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_44

    const-string v19, "devicefirmware"

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    const-string v20, "WeMo_WW_2.0"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v19

    if-eqz v19, :cond_44

    .line 3153
    const-string v19, "UpnpDeviceList"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Type Bridge"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "type"

    move-object/from16 v0, v21

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 3154
    const-string v19, "devicefirmware"

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 3156
    .restart local v6    # "currentPlugInVersion":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->bridgeFW:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v0, v6, v1}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareNEWFirmwareDataForBridge(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 3157
    const-string v19, "Bridge"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_1

    .line 3158
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->bridgeFW:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3159
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->bridgeFW:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3160
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->bridgeFW:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 3163
    .end local v6    # "currentPlugInVersion":Ljava/lang/String;
    :cond_44
    const-string v19, "type"

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    const-string v20, "MZ100"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_45

    .line 3164
    const-string v19, "UpnpDeviceList"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Type Bulb"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "type"

    move-object/from16 v0, v21

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 3165
    const-string v19, "devicefirmware"

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 3166
    .restart local v6    # "currentPlugInVersion":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->wemobulbFw:[Ljava/lang/String;

    move-object/from16 v19, v0

    if-eqz v19, :cond_1

    .line 3167
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->wemobulbFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v0, v6, v1}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareNEWFirmwareDataForBulb(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 3168
    const-string v19, "Bulb"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_1

    .line 3169
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->wemobulbFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3170
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->wemobulbFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3171
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->wemobulbFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 3174
    .end local v6    # "currentPlugInVersion":Ljava/lang/String;
    :cond_45
    const-string v19, "Gardenspot RGB"

    move-object/from16 v0, v19

    invoke-virtual {v7, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_46

    const-string v19, "LIGHTIFY Gardenspot RGB"

    move-object/from16 v0, v19

    invoke-virtual {v7, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_47

    .line 3175
    :cond_46
    const-string v19, "UpnpDeviceList"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Type OSRAM Gardenspot"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "type"

    move-object/from16 v0, v21

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 3176
    const-string v19, "devicefirmware"

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 3177
    .restart local v6    # "currentPlugInVersion":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->gardenSpotFw:[Ljava/lang/String;

    move-object/from16 v19, v0

    if-eqz v19, :cond_1

    .line 3178
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->gardenSpotFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    const-string v21, "Gardenspot RGB"

    const-string v22, "\\s+"

    const-string v23, ""

    invoke-virtual/range {v21 .. v23}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v6, v1, v2}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareFirmwareVersionsBulb(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 3179
    const-string v19, "GardenspotRGBFlag"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_1

    .line 3180
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->gardenSpotFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3181
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->gardenSpotFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3182
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->gardenSpotFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 3185
    .end local v6    # "currentPlugInVersion":Ljava/lang/String;
    :cond_47
    const-string v19, "Classic A60 TW"

    move-object/from16 v0, v19

    invoke-virtual {v7, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_48

    const-string v19, "LIGHTIFY A19 Tunable White"

    move-object/from16 v0, v19

    invoke-virtual {v7, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_49

    .line 3186
    :cond_48
    const-string v19, "UpnpDeviceList"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Type OSRAM TEMPTunable"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "type"

    move-object/from16 v0, v21

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 3187
    const-string v19, "devicefirmware"

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 3188
    .restart local v6    # "currentPlugInVersion":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->tempTunableFw:[Ljava/lang/String;

    move-object/from16 v19, v0

    if-eqz v19, :cond_1

    .line 3189
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->tempTunableFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    const-string v21, "Classic A60 TW"

    const-string v22, "\\s+"

    const-string v23, ""

    invoke-virtual/range {v21 .. v23}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v6, v1, v2}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareFirmwareVersionsBulb(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 3190
    const-string v19, "ClassicA60TWFlag"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_1

    .line 3191
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->tempTunableFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3192
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->tempTunableFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3193
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->tempTunableFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 3196
    .end local v6    # "currentPlugInVersion":Ljava/lang/String;
    :cond_49
    const-string v19, "Flex RGBW"

    move-object/from16 v0, v19

    invoke-virtual {v7, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_4a

    const-string v19, "LIGHTIFY Flex RGBW"

    move-object/from16 v0, v19

    invoke-virtual {v7, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_1

    .line 3197
    :cond_4a
    const-string v19, "UpnpDeviceList"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Type OSRAM FLEX LED"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "type"

    move-object/from16 v0, v21

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 3198
    const-string v19, "devicefirmware"

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 3199
    .restart local v6    # "currentPlugInVersion":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->flexLEDFw:[Ljava/lang/String;

    move-object/from16 v19, v0

    if-eqz v19, :cond_1

    .line 3200
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->flexLEDFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    const-string v21, "Flex RGBW"

    const-string v22, "\\s+"

    const-string v23, ""

    invoke-virtual/range {v21 .. v23}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v6, v1, v2}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareFirmwareVersionsBulb(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 3201
    const-string v19, "FlexRGBWFlag"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_1

    .line 3202
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->flexLEDFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3203
    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->flexLEDFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 3204
    const/16 v19, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->flexLEDFw:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto/16 :goto_2

    .line 2752
    .end local v6    # "currentPlugInVersion":Ljava/lang/String;
    :cond_4b
    add-int/lit8 v14, v14, 0x1

    goto/16 :goto_1

    .line 3228
    .end local v4    # "arr$":[Ljava/lang/String;
    .end local v7    # "deviceType":Ljava/lang/String;
    .end local v9    # "firmwareDetail":Ljava/lang/String;
    .end local v14    # "i$":I
    .end local v16    # "len$":I
    :cond_4c
    const-string v19, "UpnpDeviceList"

    const-string v20, " currentFirmwareVersion is NULL"

    invoke-static/range {v19 .. v20}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto/16 :goto_3

    .line 3237
    .end local v5    # "currentFirmwareVersion":Lorg/json/JSONObject;
    .end local v10    # "firmwareDetailsArray":[Ljava/lang/String;
    .end local v13    # "i":I
    .end local v17    # "status":Ljava/lang/String;
    :cond_4d
    const-string v19, "UpnpDeviceList"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, " Null value passed:: currentFirmwreArray ::"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, " firmDetailsList:: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->firmDetailsList:Ljava/util/ArrayList;

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_4
.end method

.method public getActionResultValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "constant"    # Ljava/lang/String;
    .param p3, "attribute"    # Ljava/lang/String;

    .prologue
    .line 3919
    const-string v1, ""

    .line 3921
    .local v1, "argValue":Ljava/lang/String;
    :try_start_0
    iget-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v6

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v2

    .line 3922
    .local v2, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    invoke-virtual {v2, p1}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v4

    .line 3923
    .local v4, "localDevice":Lorg/cybergarage/upnp/Device;
    invoke-virtual {v4, p2}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 3924
    .local v0, "actionObj":Lorg/cybergarage/upnp/Action;
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v5

    .line 3926
    .local v5, "response":Ljava/lang/String;
    invoke-virtual {p0, v5, p3}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getStringFromResponse(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 3930
    .end local v0    # "actionObj":Lorg/cybergarage/upnp/Action;
    .end local v2    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .end local v4    # "localDevice":Lorg/cybergarage/upnp/Device;
    .end local v5    # "response":Ljava/lang/String;
    :goto_0
    return-object v1

    .line 3927
    :catch_0
    move-exception v3

    .line 3928
    .local v3, "e":Ljava/lang/Exception;
    const-string v6, "UpnpDeviceList"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Get insight parameters exception: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public getActionResultValuesJSONObject(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 16
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "constant"    # Ljava/lang/String;
    .param p3, "attributes"    # [Ljava/lang/String;

    .prologue
    .line 3942
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 3944
    .local v4, "dataInfo":Lorg/json/JSONObject;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v13}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v13

    invoke-virtual {v13}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v2

    .line 3945
    .local v2, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v12

    .line 3946
    .local v12, "tmpDev":Lorg/cybergarage/upnp/Device;
    if-eqz v12, :cond_1

    .line 3947
    move-object/from16 v0, p2

    invoke-virtual {v12, v0}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v1

    .line 3948
    .local v1, "actionObj":Lorg/cybergarage/upnp/Action;
    if-eqz v1, :cond_1

    .line 3949
    invoke-virtual {v1}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v10

    .line 3950
    .local v10, "response":Ljava/lang/String;
    const-string v13, "UpnpDeviceList"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "getActionResultValuesJSONObject >> response "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 3951
    if-eqz v10, :cond_1

    .line 3952
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_0
    move-object/from16 v0, p3

    array-length v13, v0

    if-ge v9, v13, :cond_0

    .line 3953
    aget-object v13, p3, v9

    aget-object v14, p3, v9

    move-object/from16 v0, p0

    invoke-virtual {v0, v10, v14}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getStringFromResponse(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v4, v13, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3952
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 3956
    :cond_0
    const/4 v7, 0x0

    .local v7, "hasCurrency":Z
    const/4 v8, 0x0

    .line 3957
    .local v8, "hasEnergyPerUnitCost":Z
    sget-object v13, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_CURRENCY:Ljava/lang/String;

    invoke-virtual {v4, v13}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    .line 3958
    sget-object v13, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_ENERGY_PER_UNIT_COST:Ljava/lang/String;

    invoke-virtual {v4, v13}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v8

    .line 3960
    if-eqz v7, :cond_1

    if-eqz v8, :cond_1

    .line 3961
    sget-object v13, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_CURRENCY:Ljava/lang/String;

    invoke-virtual {v4, v13}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 3962
    .local v3, "currency":Ljava/lang/String;
    sget-object v13, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_ENERGY_PER_UNIT_COST:Ljava/lang/String;

    invoke-virtual {v4, v13}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 3963
    .local v6, "energyPerUnitCost":Ljava/lang/String;
    new-instance v11, Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-direct {v11, v13}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    .line 3964
    .local v11, "sharedPref":Lcom/belkin/wemo/cache/utils/SharePreferences;
    invoke-virtual {v11, v3, v6}, Lcom/belkin/wemo/cache/utils/SharePreferences;->saveInsightHomeSettingsParams(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 3973
    .end local v1    # "actionObj":Lorg/cybergarage/upnp/Action;
    .end local v2    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .end local v3    # "currency":Ljava/lang/String;
    .end local v6    # "energyPerUnitCost":Ljava/lang/String;
    .end local v7    # "hasCurrency":Z
    .end local v8    # "hasEnergyPerUnitCost":Z
    .end local v9    # "i":I
    .end local v10    # "response":Ljava/lang/String;
    .end local v11    # "sharedPref":Lcom/belkin/wemo/cache/utils/SharePreferences;
    .end local v12    # "tmpDev":Lorg/cybergarage/upnp/Device;
    :cond_1
    :goto_1
    return-object v4

    .line 3969
    :catch_0
    move-exception v5

    .line 3970
    .local v5, "e":Ljava/lang/Exception;
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method public getBridgeList()Lorg/json/JSONArray;
    .locals 17
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 1072
    new-instance v12, Lorg/json/JSONArray;

    invoke-direct {v12}, Lorg/json/JSONArray;-><init>()V

    .line 1073
    .local v12, "tempLedDevices":Lorg/json/JSONArray;
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonBridgeArray:Lorg/json/JSONArray;

    if-eqz v14, :cond_4

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonBridgeArray:Lorg/json/JSONArray;

    invoke-virtual {v14}, Lorg/json/JSONArray;->length()I

    move-result v14

    if-lez v14, :cond_4

    .line 1074
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonBridgeArray:Lorg/json/JSONArray;

    invoke-virtual {v14}, Lorg/json/JSONArray;->length()I

    move-result v14

    if-ge v7, v14, :cond_3

    .line 1075
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 1076
    .local v2, "bridgeJsonObject":Lorg/json/JSONObject;
    const/4 v6, 0x0

    .line 1078
    .local v6, "grpDeviceObject":Lorg/json/JSONObject;
    new-instance v13, Lorg/json/JSONObject;

    invoke-direct {v13}, Lorg/json/JSONObject;-><init>()V

    .line 1079
    .local v13, "tempObject":Lorg/json/JSONObject;
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonBridgeArray:Lorg/json/JSONArray;

    invoke-virtual {v14, v7}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v13

    .line 1080
    invoke-virtual {v13}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1082
    .local v1, "GroupId":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v14

    if-nez v14, :cond_2

    const-string v14, "GroupID"

    invoke-virtual {v1, v14}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v14

    if-eqz v14, :cond_2

    .line 1084
    new-instance v6, Lorg/json/JSONObject;

    .end local v6    # "grpDeviceObject":Lorg/json/JSONObject;
    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    .line 1085
    .restart local v6    # "grpDeviceObject":Lorg/json/JSONObject;
    const-string v14, "GroupIDS"

    invoke-virtual {v13, v14}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    .line 1086
    .local v3, "devicesInGroup":Lorg/json/JSONArray;
    if-eqz v3, :cond_0

    .line 1087
    const/4 v8, 0x0

    .local v8, "j":I
    :goto_1
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v14

    if-ge v8, v14, :cond_0

    .line 1088
    invoke-virtual {v3, v8}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v14

    const-string v15, "ModelCode"

    invoke-virtual {v14, v15}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 1089
    .local v10, "modelCode":Ljava/lang/String;
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v14

    if-nez v14, :cond_1

    invoke-static {v10}, Lcom/belkin/wemo/utils/WeMoUtils;->isLEDModelCodeSupported(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_1

    .line 1090
    const-string v14, "GroupID"

    invoke-virtual {v13, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 1091
    .local v11, "subDeviceGroupId":Ljava/lang/String;
    const-string v14, "GroupName"

    invoke-virtual {v13, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 1092
    .local v5, "groupFriendlyName":Ljava/lang/String;
    const-string v14, "friendlyName"

    invoke-virtual {v6, v14, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1093
    const-string v14, "udn"

    invoke-virtual {v6, v14, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1094
    const-string v14, "bridgeudn"

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    invoke-virtual {v6, v14, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1095
    invoke-virtual {v12, v6}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 1074
    .end local v3    # "devicesInGroup":Lorg/json/JSONArray;
    .end local v5    # "groupFriendlyName":Ljava/lang/String;
    .end local v8    # "j":I
    .end local v10    # "modelCode":Ljava/lang/String;
    .end local v11    # "subDeviceGroupId":Ljava/lang/String;
    :cond_0
    :goto_2
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 1087
    .restart local v3    # "devicesInGroup":Lorg/json/JSONArray;
    .restart local v8    # "j":I
    .restart local v10    # "modelCode":Ljava/lang/String;
    :cond_1
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 1101
    .end local v3    # "devicesInGroup":Lorg/json/JSONArray;
    .end local v8    # "j":I
    .end local v10    # "modelCode":Ljava/lang/String;
    :cond_2
    const-string v14, "ModelCode"

    invoke-virtual {v13, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 1102
    .restart local v10    # "modelCode":Ljava/lang/String;
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v14

    if-nez v14, :cond_0

    invoke-static {v10}, Lcom/belkin/wemo/utils/WeMoUtils;->isLEDModelCodeSupported(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_0

    .line 1103
    const-string v14, "DeviceID"

    invoke-virtual {v13, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 1104
    .local v9, "ledDeviceId":Ljava/lang/String;
    const-string v14, "FriendlyName"

    invoke-virtual {v13, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1105
    .local v4, "friendlyName":Ljava/lang/String;
    const-string v14, "friendlyName"

    invoke-virtual {v2, v14, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1106
    const-string v14, "udn"

    invoke-virtual {v2, v14, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1107
    const-string v14, "bridgeudn"

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    invoke-virtual {v2, v14, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1108
    invoke-virtual {v12, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_2

    .line 1112
    .end local v1    # "GroupId":Ljava/lang/String;
    .end local v2    # "bridgeJsonObject":Lorg/json/JSONObject;
    .end local v4    # "friendlyName":Ljava/lang/String;
    .end local v6    # "grpDeviceObject":Lorg/json/JSONObject;
    .end local v9    # "ledDeviceId":Ljava/lang/String;
    .end local v10    # "modelCode":Ljava/lang/String;
    .end local v13    # "tempObject":Lorg/json/JSONObject;
    :cond_3
    const-string v14, "UpnpDeviceList"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "LED DEVICES**"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1117
    .end local v7    # "i":I
    :goto_3
    return-object v12

    .line 1115
    :cond_4
    const/4 v14, 0x0

    invoke-virtual {v12, v14}, Lorg/json/JSONArray;->put(I)Lorg/json/JSONArray;

    goto :goto_3
.end method

.method public getCapabilityProfileIdList()Lorg/json/JSONArray;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 1488
    new-instance v6, Lorg/json/JSONArray;

    invoke-direct {v6}, Lorg/json/JSONArray;-><init>()V

    .line 1489
    .local v6, "tempArray":Lorg/json/JSONArray;
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v7

    invoke-virtual {v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v1

    .line 1490
    .local v1, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v7

    invoke-virtual {v7}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v7

    if-ge v4, v7, :cond_1

    .line 1491
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v7

    invoke-virtual {v7, v4}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v7

    invoke-virtual {v7}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v7

    const-string v8, "Bridge"

    invoke-virtual {v7, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 1492
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v7

    invoke-virtual {v7, v4}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v7

    invoke-virtual {v7}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    .line 1490
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 1496
    :cond_1
    :try_start_0
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    invoke-virtual {v1, v7}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v7

    const-string v8, "GetCapabilityProfileIDList"

    invoke-virtual {v7, v8}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 1497
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    sget-object v7, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->ARGS_DEVUDN:[Ljava/lang/String;

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/String;

    const/4 v9, 0x0

    iget-object v10, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    aput-object v10, v8, v9

    invoke-direct {p0, v0, v7, v8}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 1498
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v5

    .line 1499
    .local v5, "response":Ljava/lang/String;
    const-string v7, "UpnpDeviceList"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "GET capabilities profiel id list: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1500
    new-instance v3, Lcom/belkin/upnp/parser/GetLedProfileIDResponseParser;

    invoke-direct {v3}, Lcom/belkin/upnp/parser/GetLedProfileIDResponseParser;-><init>()V

    .line 1501
    .local v3, "getprofileidlist":Lcom/belkin/upnp/parser/GetLedProfileIDResponseParser;
    invoke-virtual {v3, v5}, Lcom/belkin/upnp/parser/GetLedProfileIDResponseParser;->parseProfileIdListResponse(Ljava/lang/String;)Lorg/json/JSONArray;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    move-object v7, v6

    .line 1504
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v3    # "getprofileidlist":Lcom/belkin/upnp/parser/GetLedProfileIDResponseParser;
    .end local v5    # "response":Ljava/lang/String;
    :goto_1
    return-object v7

    .line 1503
    :catch_0
    move-exception v2

    .line 1504
    .local v2, "e":Ljava/lang/Exception;
    const/4 v7, 0x0

    goto :goto_1
.end method

.method public getCapabilityProfileList(Ljava/lang/String;)Lorg/json/JSONArray;
    .locals 17
    .param p1, "deviceIds"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 1515
    new-instance v12, Lorg/json/JSONArray;

    invoke-direct {v12}, Lorg/json/JSONArray;-><init>()V

    .line 1516
    .local v12, "tempArrayList":Lorg/json/JSONArray;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v13}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v13

    invoke-virtual {v13}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v4

    .line 1517
    .local v4, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_0
    invoke-virtual {v4}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v13

    invoke-virtual {v13}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v13

    if-ge v8, v13, :cond_1

    .line 1518
    invoke-virtual {v4}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v13

    invoke-virtual {v13, v8}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v13

    invoke-virtual {v13}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v13

    const-string v14, "Bridge"

    invoke-virtual {v13, v14}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v13

    if-eqz v13, :cond_0

    .line 1519
    invoke-virtual {v4}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v13

    invoke-virtual {v13, v8}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v13

    invoke-virtual {v13}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    .line 1517
    :cond_0
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 1525
    :cond_1
    :try_start_0
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    invoke-virtual {v4, v13}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v13

    const-string v14, "GetDeviceCapabilities"

    invoke-virtual {v13, v14}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v1

    .line 1526
    .local v1, "action":Lorg/cybergarage/upnp/Action;
    sget-object v13, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->ARGS_DEVICEIDS:[Ljava/lang/String;

    const/4 v14, 0x1

    new-array v14, v14, [Ljava/lang/String;

    const/4 v15, 0x0

    aput-object p1, v14, v15

    move-object/from16 v0, p0

    invoke-direct {v0, v1, v13, v14}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 1527
    invoke-virtual {v1}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v10

    .line 1528
    .local v10, "response":Ljava/lang/String;
    const-string v13, "UpnpDeviceList"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "GET capabilities device list: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1529
    if-eqz v10, :cond_2

    .line 1530
    new-instance v6, Lcom/belkin/upnp/parser/GetDeviceCapabilitiesResponse;

    invoke-direct {v6}, Lcom/belkin/upnp/parser/GetDeviceCapabilitiesResponse;-><init>()V

    .line 1531
    .local v6, "getdeviceCapabilites":Lcom/belkin/upnp/parser/GetDeviceCapabilitiesResponse;
    invoke-virtual {v6, v10}, Lcom/belkin/upnp/parser/GetDeviceCapabilitiesResponse;->parseForDeviceCapabilitiesList(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v9

    .line 1532
    .local v9, "jsonArrayDeviceCapabilities":Lorg/json/JSONArray;
    const-string v13, "UpnpDeviceList"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "get device capabilities************"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const/4 v15, 0x0

    invoke-virtual {v9, v15}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v15

    const-string v16, "deviceCapabilityIds"

    invoke-virtual/range {v15 .. v16}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1533
    const/4 v13, 0x0

    invoke-virtual {v9, v13}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v13

    const-string v14, "deviceCapabilityIds"

    invoke-virtual {v13, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v3

    .line 1534
    .local v3, "capabilityIds":Ljava/lang/String;
    if-eqz v3, :cond_2

    .line 1536
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    invoke-virtual {v4, v13}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v13

    const-string v14, "GetCapabilityProfileList"

    invoke-virtual {v13, v14}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v2

    .line 1537
    .local v2, "action1":Lorg/cybergarage/upnp/Action;
    sget-object v13, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->ARGS_CAPABILITYIDS:[Ljava/lang/String;

    const/4 v14, 0x1

    new-array v14, v14, [Ljava/lang/String;

    const/4 v15, 0x0

    aput-object v3, v14, v15

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v13, v14}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 1538
    invoke-virtual {v2}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v11

    .line 1539
    .local v11, "responseProfile":Ljava/lang/String;
    const-string v13, "UpnpDeviceList"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "GET capabilities profiel id list: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1540
    if-eqz v11, :cond_2

    .line 1541
    new-instance v7, Lcom/belkin/upnp/parser/GetLedProfileListResponse;

    invoke-direct {v7}, Lcom/belkin/upnp/parser/GetLedProfileListResponse;-><init>()V

    .line 1542
    .local v7, "getledprofiles":Lcom/belkin/upnp/parser/GetLedProfileListResponse;
    invoke-virtual {v7, v11}, Lcom/belkin/upnp/parser/GetLedProfileListResponse;->parseForLedprofileList(Ljava/lang/String;)Lorg/json/JSONArray;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v12

    .end local v2    # "action1":Lorg/cybergarage/upnp/Action;
    .end local v3    # "capabilityIds":Ljava/lang/String;
    .end local v6    # "getdeviceCapabilites":Lcom/belkin/upnp/parser/GetDeviceCapabilitiesResponse;
    .end local v7    # "getledprofiles":Lcom/belkin/upnp/parser/GetLedProfileListResponse;
    .end local v9    # "jsonArrayDeviceCapabilities":Lorg/json/JSONArray;
    .end local v11    # "responseProfile":Ljava/lang/String;
    :cond_2
    move-object v13, v12

    .line 1548
    .end local v1    # "action":Lorg/cybergarage/upnp/Action;
    .end local v10    # "response":Ljava/lang/String;
    :goto_1
    return-object v13

    .line 1547
    :catch_0
    move-exception v5

    .line 1548
    .local v5, "e":Ljava/lang/Exception;
    const/4 v13, 0x0

    goto :goto_1
.end method

.method public getCountdownFirmwareVersionByUDN(Ljava/lang/String;)Z
    .locals 14
    .param p1, "udn"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x1

    .line 2653
    new-instance v9, Lcom/belkin/utils/RuleUtility;

    iget-object v11, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-direct {v9, v11}, Lcom/belkin/utils/RuleUtility;-><init>(Landroid/content/Context;)V

    .line 2655
    .local v9, "ruleUtility":Lcom/belkin/utils/RuleUtility;
    iget-object v11, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v11}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v11

    invoke-virtual {v11}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v2

    .line 2656
    .local v2, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    invoke-virtual {v2}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v11

    iput-object v11, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mDeviceList:Lorg/cybergarage/upnp/DeviceList;

    .line 2658
    :try_start_0
    const-string v11, "UpnpDeviceList"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "version udn::::"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2659
    invoke-virtual {v2, p1}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v6

    .line 2660
    .local v6, "localDevice":Lorg/cybergarage/upnp/Device;
    if-eqz v6, :cond_0

    .line 2662
    const-string v11, "GetFirmwareVersion"

    invoke-virtual {v6, v11}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 2663
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v8

    .line 2664
    .local v8, "response":Ljava/lang/String;
    if-eqz v8, :cond_0

    .line 2665
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->getOutputArgumentList()Lorg/cybergarage/upnp/ArgumentList;

    move-result-object v1

    .line 2666
    .local v1, "argumentList":Lorg/cybergarage/upnp/ArgumentList;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lorg/cybergarage/upnp/ArgumentList;->size()I

    move-result v11

    if-lez v11, :cond_0

    .line 2668
    const/4 v11, 0x0

    invoke-virtual {v1, v11}, Lorg/cybergarage/upnp/ArgumentList;->getArgument(I)Lorg/cybergarage/upnp/Argument;

    move-result-object v11

    invoke-virtual {v11}, Lorg/cybergarage/upnp/Argument;->getValue()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v11

    const-string v12, "\\|"

    invoke-virtual {v11, v12}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    .line 2669
    .local v7, "respStrings":[Ljava/lang/String;
    new-instance v11, Lorg/json/JSONObject;

    invoke-direct {v11}, Lorg/json/JSONObject;-><init>()V

    iput-object v11, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    .line 2670
    const/4 v11, 0x0

    aget-object v11, v7, v11

    invoke-virtual {v11}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v11

    const-string v12, ":"

    invoke-virtual {v11, v12}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 2671
    .local v4, "firmware":[Ljava/lang/String;
    const-string v11, "UpnpDeviceList"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "FirmWare : "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const/4 v13, 0x1

    aget-object v13, v4, v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " : UDN - "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v6}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2672
    const/4 v11, 0x1

    aget-object v11, v4, v11

    invoke-virtual {v9, v11}, Lcom/belkin/utils/RuleUtility;->isFirmwareValidForCountdownRule(Ljava/lang/String;)Z

    move-result v5

    .line 2673
    .local v5, "fw":Z
    const-string v11, "UpnpDeviceList"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "fw : "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2682
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "argumentList":Lorg/cybergarage/upnp/ArgumentList;
    .end local v4    # "firmware":[Ljava/lang/String;
    .end local v5    # "fw":Z
    .end local v6    # "localDevice":Lorg/cybergarage/upnp/Device;
    .end local v7    # "respStrings":[Ljava/lang/String;
    .end local v8    # "response":Ljava/lang/String;
    :goto_0
    return v5

    .line 2678
    :catch_0
    move-exception v3

    .line 2679
    .local v3, "e":Ljava/lang/Exception;
    const-string v11, "UpnpDeviceList"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "getCountdownFirmwareVersionByUDN Exception: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v3}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2681
    .end local v3    # "e":Ljava/lang/Exception;
    :cond_0
    const-string v11, "UpnpDeviceList"

    const-string v12, "getCountdownFirmwareVersionByUDN returning default"

    invoke-static {v11, v12}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    move v5, v10

    .line 2682
    goto :goto_0
.end method

.method public getCurrentFirmwareVersion(Lorg/cybergarage/upnp/Device;)Ljava/lang/String;
    .locals 10
    .param p1, "device"    # Lorg/cybergarage/upnp/Device;

    .prologue
    .line 3693
    const-string v2, ""

    .line 3694
    .local v2, "mCurrentVersion":Ljava/lang/String;
    invoke-virtual {p1}, Lorg/cybergarage/upnp/Device;->getServiceList()Lorg/cybergarage/upnp/ServiceList;

    move-result-object v6

    .line 3695
    .local v6, "serviceList":Lorg/cybergarage/upnp/ServiceList;
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_0
    invoke-virtual {v6}, Lorg/cybergarage/upnp/ServiceList;->size()I

    move-result v7

    if-ge v1, v7, :cond_1

    .line 3696
    invoke-virtual {v6, v1}, Lorg/cybergarage/upnp/ServiceList;->getService(I)Lorg/cybergarage/upnp/Service;

    move-result-object v7

    const-string v8, "GetFirmwareVersion"

    invoke-virtual {v7, v8}, Lorg/cybergarage/upnp/Service;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 3697
    .local v0, "actionPost":Lorg/cybergarage/upnp/Action;
    if-eqz v0, :cond_0

    .line 3698
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v3

    .line 3699
    .local v3, "mCurrentVersionResponce":Ljava/lang/String;
    if-eqz v3, :cond_0

    .line 3700
    new-instance v5, Lcom/belkin/beans/FirmwareVersionResponseBean;

    invoke-direct {v5}, Lcom/belkin/beans/FirmwareVersionResponseBean;-><init>()V

    .line 3701
    .local v5, "respObject":Lcom/belkin/beans/FirmwareVersionResponseBean;
    new-instance v4, Lcom/belkin/upnp/parser/Parser;

    invoke-direct {v4}, Lcom/belkin/upnp/parser/Parser;-><init>()V

    .line 3702
    .local v4, "parseResponse":Lcom/belkin/upnp/parser/Parser;
    const/4 v7, 0x6

    invoke-virtual {v4, v5, v7, v3}, Lcom/belkin/upnp/parser/Parser;->uPnPResponseParser(Ljava/lang/Object;ILjava/lang/String;)V

    .line 3703
    if-eqz v5, :cond_0

    invoke-virtual {v5}, Lcom/belkin/beans/FirmwareVersionResponseBean;->getFirmwareVersion()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_0

    invoke-virtual {v5}, Lcom/belkin/beans/FirmwareVersionResponseBean;->getSkuNumber()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_0

    .line 3704
    invoke-virtual {v5}, Lcom/belkin/beans/FirmwareVersionResponseBean;->getFirmwareVersion()Ljava/lang/String;

    move-result-object v2

    .line 3705
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, " firmware version is : "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 3695
    .end local v3    # "mCurrentVersionResponce":Ljava/lang/String;
    .end local v4    # "parseResponse":Lcom/belkin/upnp/parser/Parser;
    .end local v5    # "respObject":Lcom/belkin/beans/FirmwareVersionResponseBean;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 3710
    .end local v0    # "actionPost":Lorg/cybergarage/upnp/Action;
    :cond_1
    return-object v2
.end method

.method public getCurrentFirmwareVersion(Lorg/json/JSONArray;)Lorg/json/JSONArray;
    .locals 3
    .param p1, "json"    # Lorg/json/JSONArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 2723
    iget-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/belkin/controller/DeviceListController;->getInstance(Landroid/content/Context;)Lcom/belkin/controller/DeviceListController;

    move-result-object v2

    invoke-virtual {v2}, Lcom/belkin/controller/DeviceListController;->getFirmwareList()Lorg/json/JSONArray;

    move-result-object v1

    .line 2724
    .local v1, "jsonArray":Lorg/json/JSONArray;
    const/4 v0, 0x0

    .local v0, "j":I
    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 2725
    if-eqz p1, :cond_0

    .line 2726
    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 2724
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2729
    :cond_1
    return-object v1
.end method

.method public getCurrentFirmwareVersionByUDN(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 12
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "currFW"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 2691
    const-string v9, "UpnpDeviceList"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "FW <>  :FirmWare currFW: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2692
    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v9}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v9

    invoke-virtual {v9}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v2

    .line 2693
    .local v2, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    invoke-virtual {v2}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v9

    iput-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mDeviceList:Lorg/cybergarage/upnp/DeviceList;

    .line 2695
    :try_start_0
    invoke-virtual {v2, p1}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v6

    .line 2696
    .local v6, "localDevice":Lorg/cybergarage/upnp/Device;
    const-string v9, "GetFirmwareVersion"

    invoke-virtual {v6, v9}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 2697
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v8

    .line 2698
    .local v8, "response":Ljava/lang/String;
    if-eqz v8, :cond_0

    .line 2699
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->getOutputArgumentList()Lorg/cybergarage/upnp/ArgumentList;

    move-result-object v1

    .line 2700
    .local v1, "argumentList":Lorg/cybergarage/upnp/ArgumentList;
    const/4 v5, 0x0

    .local v5, "k":I
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ArgumentList;->size()I

    move-result v9

    if-ge v5, v9, :cond_0

    .line 2701
    invoke-virtual {v1, v5}, Lorg/cybergarage/upnp/ArgumentList;->getArgument(I)Lorg/cybergarage/upnp/Argument;

    move-result-object v9

    invoke-virtual {v9}, Lorg/cybergarage/upnp/Argument;->getValue()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v9

    const-string v10, "\\|"

    invoke-virtual {v9, v10}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    .line 2702
    .local v7, "respStrings":[Ljava/lang/String;
    new-instance v9, Lorg/json/JSONObject;

    invoke-direct {v9}, Lorg/json/JSONObject;-><init>()V

    iput-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    .line 2703
    const/4 v9, 0x0

    aget-object v9, v7, v9

    invoke-virtual {v9}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v9

    const-string v10, ":"

    invoke-virtual {v9, v10}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 2704
    .local v4, "firmware":[Ljava/lang/String;
    const-string v9, "UpnpDeviceList"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "FW <>  FirmWare : "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const/4 v11, 0x1

    aget-object v11, v4, v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " : UDN - "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v6}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2705
    const/4 v9, 0x1

    aget-object v9, v4, v9
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2711
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "argumentList":Lorg/cybergarage/upnp/ArgumentList;
    .end local v4    # "firmware":[Ljava/lang/String;
    .end local v5    # "k":I
    .end local v6    # "localDevice":Lorg/cybergarage/upnp/Device;
    .end local v7    # "respStrings":[Ljava/lang/String;
    .end local v8    # "response":Ljava/lang/String;
    :goto_0
    return-object v9

    .line 2708
    :catch_0
    move-exception v3

    .line 2709
    .local v3, "e":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    .line 2711
    .end local v3    # "e":Ljava/lang/Exception;
    :cond_0
    const-string v9, ""

    goto :goto_0
.end method

.method public getCurrentFirmwareVersionByUDN(Ljava/lang/String;)Z
    .locals 14
    .param p1, "udn"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 2526
    new-instance v9, Lcom/belkin/utils/RuleUtility;

    iget-object v11, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-direct {v9, v11}, Lcom/belkin/utils/RuleUtility;-><init>(Landroid/content/Context;)V

    .line 2527
    .local v9, "ruleUtility":Lcom/belkin/utils/RuleUtility;
    iget-object v11, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v11}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v11

    invoke-virtual {v11}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v2

    .line 2528
    .local v2, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    invoke-virtual {v2}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v11

    iput-object v11, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mDeviceList:Lorg/cybergarage/upnp/DeviceList;

    .line 2530
    :try_start_0
    invoke-virtual {v2, p1}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v6

    .line 2531
    .local v6, "localDevice":Lorg/cybergarage/upnp/Device;
    invoke-virtual {v6}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v10

    .line 2532
    .local v10, "type":Ljava/lang/String;
    const-string v11, "GetFirmwareVersion"

    invoke-virtual {v6, v11}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 2533
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v8

    .line 2534
    .local v8, "response":Ljava/lang/String;
    if-eqz v8, :cond_0

    .line 2535
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->getOutputArgumentList()Lorg/cybergarage/upnp/ArgumentList;

    move-result-object v1

    .line 2536
    .local v1, "argumentList":Lorg/cybergarage/upnp/ArgumentList;
    const/4 v5, 0x0

    .local v5, "k":I
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ArgumentList;->size()I

    move-result v11

    if-ge v5, v11, :cond_0

    .line 2537
    invoke-virtual {v1, v5}, Lorg/cybergarage/upnp/ArgumentList;->getArgument(I)Lorg/cybergarage/upnp/Argument;

    move-result-object v11

    invoke-virtual {v11}, Lorg/cybergarage/upnp/Argument;->getValue()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v11

    const-string v12, "\\|"

    invoke-virtual {v11, v12}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    .line 2538
    .local v7, "respStrings":[Ljava/lang/String;
    new-instance v11, Lorg/json/JSONObject;

    invoke-direct {v11}, Lorg/json/JSONObject;-><init>()V

    iput-object v11, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    .line 2539
    const/4 v11, 0x0

    aget-object v11, v7, v11

    invoke-virtual {v11}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v11

    const-string v12, ":"

    invoke-virtual {v11, v12}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 2540
    .local v4, "firmware":[Ljava/lang/String;
    const-string v11, "UpnpDeviceList"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "FirmWare : "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const/4 v13, 0x1

    aget-object v13, v4, v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " : UDN - "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v6}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2541
    const/4 v11, 0x1

    aget-object v11, v4, v11

    invoke-virtual {v9, v11, v10}, Lcom/belkin/utils/RuleUtility;->frimwareSupportSRSS(Ljava/lang/String;Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v11

    .line 2547
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "argumentList":Lorg/cybergarage/upnp/ArgumentList;
    .end local v4    # "firmware":[Ljava/lang/String;
    .end local v5    # "k":I
    .end local v6    # "localDevice":Lorg/cybergarage/upnp/Device;
    .end local v7    # "respStrings":[Ljava/lang/String;
    .end local v8    # "response":Ljava/lang/String;
    .end local v10    # "type":Ljava/lang/String;
    :goto_0
    return v11

    .line 2544
    :catch_0
    move-exception v3

    .line 2545
    .local v3, "e":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    .line 2547
    .end local v3    # "e":Ljava/lang/Exception;
    :cond_0
    const/4 v11, 0x1

    goto :goto_0
.end method

.method public getDBPathAllDevices(Landroid/content/Context;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 16
    .param p1, "mContext"    # Landroid/content/Context;
    .param p2, "dbFilePath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1011
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 1012
    .local v3, "dbPathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v8, Lcom/belkin/rules/beans/RulesDBPathResponseBean;

    invoke-direct {v8}, Lcom/belkin/rules/beans/RulesDBPathResponseBean;-><init>()V

    .line 1013
    .local v8, "respObject":Lcom/belkin/rules/beans/RulesDBPathResponseBean;
    new-instance v10, Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v0, p1

    invoke-direct {v10, v0}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    .line 1014
    .local v10, "sharePreference":Lcom/belkin/wemo/cache/utils/SharePreferences;
    invoke-virtual {v10}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getDBVersion()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v13

    add-int/lit8 v12, v13, 0x1

    .line 1015
    .local v12, "version":I
    invoke-static {v12}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v11

    .line 1017
    .local v11, "updatedDBVersion":Ljava/lang/String;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mDeviceList:Lorg/cybergarage/upnp/DeviceList;

    invoke-virtual {v13}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v13

    if-ge v5, v13, :cond_2

    .line 1018
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mDeviceList:Lorg/cybergarage/upnp/DeviceList;

    invoke-virtual {v13, v5}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v13

    const-string v14, "GetRulesDBPath"

    invoke-virtual {v13, v14}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v1

    .line 1019
    .local v1, "action1":Lorg/cybergarage/upnp/Action;
    invoke-virtual {v1}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v7

    .line 1020
    .local v7, "resDBPath":Ljava/lang/String;
    const/4 v13, 0x1

    new-array v4, v13, [Ljava/lang/String;

    const/4 v13, 0x0

    aput-object v11, v4, v13

    .line 1021
    .local v4, "dbVersionArgs":[Ljava/lang/String;
    if-eqz v7, :cond_1

    const-string v13, "app_error"

    invoke-virtual {v7, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_1

    .line 1022
    new-instance v6, Lcom/belkin/upnp/parser/Parser;

    invoke-direct {v6}, Lcom/belkin/upnp/parser/Parser;-><init>()V

    .line 1023
    .local v6, "parseResponse":Lcom/belkin/upnp/parser/Parser;
    const/16 v13, 0xc

    invoke-virtual {v6, v8, v13, v7}, Lcom/belkin/upnp/parser/Parser;->uPnPResponseParser(Ljava/lang/Object;ILjava/lang/String;)V

    .line 1024
    invoke-virtual {v8}, Lcom/belkin/rules/beans/RulesDBPathResponseBean;->getStrRulesDBPath()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v3, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1025
    if-eqz p2, :cond_0

    .line 1026
    invoke-virtual {v8}, Lcom/belkin/rules/beans/RulesDBPathResponseBean;->getStrRulesDBPath()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p2

    invoke-static {v0, v13}, Lcom/belkin/utils/UploadFileUtil;->writeDBToDevice(Ljava/lang/String;Ljava/lang/String;)V

    .line 1027
    :cond_0
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mDeviceList:Lorg/cybergarage/upnp/DeviceList;

    invoke-virtual {v13, v5}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v13

    const-string v14, "SetRulesDBVersion"

    invoke-virtual {v13, v14}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v2

    .line 1028
    .local v2, "action2":Lorg/cybergarage/upnp/Action;
    sget-object v13, Lcom/belkin/wemo/cache/utils/Constants;->SET_DB_VER_ARGS:[Ljava/lang/String;

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v13, v4}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 1029
    invoke-virtual {v2}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v9

    .line 1030
    .local v9, "response":Ljava/lang/String;
    const-string v13, "UpnpDeviceList"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "SET DB VERSION UPNP CMD RESPONSE: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1017
    .end local v2    # "action2":Lorg/cybergarage/upnp/Action;
    .end local v6    # "parseResponse":Lcom/belkin/upnp/parser/Parser;
    .end local v9    # "response":Ljava/lang/String;
    :cond_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 1033
    .end local v1    # "action1":Lorg/cybergarage/upnp/Action;
    .end local v4    # "dbVersionArgs":[Ljava/lang/String;
    .end local v7    # "resDBPath":Ljava/lang/String;
    :cond_2
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v13

    if-lez v13, :cond_3

    .line 1034
    invoke-virtual {v10, v11}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setDBVersion(Ljava/lang/String;)V

    .line 1036
    :cond_3
    return-object v3
.end method

.method public getDevice(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 14
    .param p1, "udn"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 4068
    const/4 v5, 0x0

    .line 4069
    .local v5, "deviceJsonObject":Lorg/json/JSONObject;
    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v9}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v9

    invoke-virtual {v9}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v3

    .line 4070
    .local v3, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    sget-object v9, Lcom/belkin/cordova/plugin/DevicePlugin;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v9, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDevice(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v8

    .line 4072
    .local v8, "wemodevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    const-string v9, "UpnpDeviceList"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "control point size:"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v3}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v11

    invoke-virtual {v11}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 4073
    invoke-virtual {v3}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v9

    invoke-virtual {v9}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v9

    if-nez v9, :cond_1

    .line 4075
    sget-object v9, Lcom/belkin/cordova/plugin/DevicePlugin;->mWeMoSDKContext:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    if-nez v9, :cond_0

    .line 4076
    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v9}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    move-result-object v9

    sput-object v9, Lcom/belkin/cordova/plugin/DevicePlugin;->mWeMoSDKContext:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    .line 4078
    :cond_0
    sget-object v9, Lcom/belkin/cordova/plugin/DevicePlugin;->mWeMoSDKContext:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    invoke-virtual {v9}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->getUpnpControl()Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    check-cast v3, Lorg/cybergarage/upnp/ControlPoint;

    .line 4080
    .restart local v3    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    :cond_1
    invoke-virtual {v3, p1}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v4

    .line 4081
    .local v4, "device":Lorg/cybergarage/upnp/Device;
    if-eqz v4, :cond_6

    .line 4082
    new-instance v5, Lorg/json/JSONObject;

    .end local v5    # "deviceJsonObject":Lorg/json/JSONObject;
    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    .line 4084
    .restart local v5    # "deviceJsonObject":Lorg/json/JSONObject;
    const-string v9, "friendlyName"

    invoke-virtual {v4}, Lorg/cybergarage/upnp/Device;->getFriendlyName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v5, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 4085
    const-string v9, "type"

    invoke-virtual {v4}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v5, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 4086
    const-string v9, "udn"

    invoke-virtual {v4}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v5, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 4089
    invoke-virtual {v4}, Lorg/cybergarage/upnp/Device;->getBrandName()Ljava/lang/String;

    move-result-object v2

    .line 4090
    .local v2, "brandName":Ljava/lang/String;
    invoke-virtual {v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getCountDownEndTime()Ljava/lang/String;

    move-result-object v1

    .line 4091
    .local v1, "autoOffValue":Ljava/lang/String;
    const-string v9, ""

    invoke-virtual {v2, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_2

    .line 4092
    const-string v9, "brandName"

    invoke-virtual {v5, v9, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 4094
    :cond_2
    const-string v9, ""

    invoke-virtual {v1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_3

    .line 4095
    const-string v9, "RuleAutoOffTime"

    invoke-virtual {v5, v9, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 4098
    :cond_3
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 4099
    monitor-enter p0

    .line 4100
    :try_start_0
    sget-object v9, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->udns:Ljava/util/HashMap;

    invoke-virtual {v9, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    if-eqz v9, :cond_4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    sget-object v9, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->udns:Ljava/util/HashMap;

    invoke-virtual {v9, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/Date;

    invoke-virtual {v9}, Ljava/util/Date;->getTime()J

    move-result-wide v12

    sub-long/2addr v10, v12

    iget-wide v12, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->SEARCH_EXPIRY_INTERVAL:J

    cmp-long v9, v10, v12

    if-lez v9, :cond_8

    .line 4102
    :cond_4
    invoke-virtual {v4}, Lorg/cybergarage/upnp/Device;->getLocation()Ljava/lang/String;

    move-result-object v6

    .line 4103
    .local v6, "iconURL":Ljava/lang/String;
    if-eqz v6, :cond_7

    .line 4104
    const-string v9, "setup.xml"

    const-string v10, "icon.jpg"

    invoke-virtual {v6, v9, v10}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v6

    .line 4107
    :goto_0
    if-eqz v6, :cond_5

    .line 4109
    sget-object v9, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->udns:Ljava/util/HashMap;

    new-instance v10, Ljava/util/Date;

    invoke-direct {v10}, Ljava/util/Date;-><init>()V

    invoke-virtual {v9, p1, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4110
    sget-object v9, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->udnIcons:Ljava/util/HashMap;

    invoke-virtual {v9, p1, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4117
    .end local v6    # "iconURL":Ljava/lang/String;
    :cond_5
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 4120
    const-string v9, "iconUrl"

    invoke-virtual {v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIcon()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v5, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 4121
    const-string v9, "serialNumber"

    invoke-virtual {v4}, Lorg/cybergarage/upnp/Device;->getSerialNumber()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v5, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 4122
    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v9}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    move-result-object v9

    invoke-virtual {v9, p1}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->getWeMoDeviceByUDN(Ljava/lang/String;)Lcom/belkin/wemo/localsdk/WeMoDevice;

    move-result-object v9

    invoke-virtual {v9}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getAttribute()Ljava/lang/String;

    move-result-object v0

    .line 4123
    .local v0, "attributeList":Ljava/lang/String;
    const-string v9, ""

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_a

    .line 4125
    invoke-virtual {v4}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v9

    const-string v10, "urn:Belkin:device:insight:1"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_9

    .line 4127
    const-string v9, "attributeList"

    invoke-virtual {v4}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {p0, v10}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getInsightParamsJSONObjectFramework(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v10

    invoke-virtual {v5, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 4141
    .end local v0    # "attributeList":Ljava/lang/String;
    .end local v1    # "autoOffValue":Ljava/lang/String;
    .end local v2    # "brandName":Ljava/lang/String;
    :cond_6
    :goto_2
    const-string v9, "UpnpDeviceList"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "get device crockpot:"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "---"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v3}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v11

    invoke-virtual {v11}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "---"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mDeviceList:Lorg/cybergarage/upnp/DeviceList;

    invoke-virtual {v11}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 4142
    return-object v5

    .line 4106
    .restart local v1    # "autoOffValue":Ljava/lang/String;
    .restart local v2    # "brandName":Ljava/lang/String;
    .restart local v6    # "iconURL":Ljava/lang/String;
    :cond_7
    :try_start_1
    invoke-virtual {p0, p1}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getIconUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_0

    .line 4115
    .end local v6    # "iconURL":Ljava/lang/String;
    :cond_8
    const-string v9, "UpnpDeviceList"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "getDevice() got icon url from cache for udn: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 4117
    :catchall_0
    move-exception v9

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v9

    .line 4131
    .restart local v0    # "attributeList":Ljava/lang/String;
    :cond_9
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    .line 4132
    .local v7, "wemoDeviceJsonObject":Lorg/json/JSONObject;
    sget-object v9, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->BINARY_STATE:Ljava/lang/String;

    iget-object v10, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v10}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    move-result-object v10

    invoke-virtual {v10, p1}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->getWeMoDeviceByUDN(Ljava/lang/String;)Lcom/belkin/wemo/localsdk/WeMoDevice;

    move-result-object v10

    invoke-virtual {v10}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getState()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v7, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 4133
    const-string v9, "attributeList"

    invoke-virtual {v5, v9, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_2

    .line 4137
    .end local v7    # "wemoDeviceJsonObject":Lorg/json/JSONObject;
    :cond_a
    const-string v9, "attributeList"

    invoke-virtual {v5, v9, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto/16 :goto_2
.end method

.method protected getDeviceList()Lorg/cybergarage/upnp/DeviceList;
    .locals 2

    .prologue
    .line 273
    iget-object v1, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v0

    .line 274
    .local v0, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    invoke-virtual {v0}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v1

    return-object v1
.end method

.method public getDevicePreset(Lorg/json/JSONArray;Lcom/belkin/wemo/callback/SetAndGetActionCallBack;)V
    .locals 8
    .param p1, "presetsInfo"    # Lorg/json/JSONArray;
    .param p2, "callback"    # Lcom/belkin/wemo/callback/SetAndGetActionCallBack;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 4787
    const-string v5, "UpnpDeviceList"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "getDevicePreset: presetsInfo: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p1}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 4788
    const/4 v4, 0x0

    .line 4789
    .local v4, "isRequestProcessed":Z
    iget-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v5}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v5

    invoke-virtual {v5}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v2

    .line 4790
    .local v2, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    const/4 v5, 0x0

    invoke-virtual {p1, v5}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "bridgeUdn"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    .line 4791
    const-string v5, "UpnpDeviceList"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "mBridgeUdn: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 4792
    iget-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    if-eqz v5, :cond_0

    .line 4793
    iget-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    invoke-virtual {v2, v5}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v3

    .line 4794
    .local v3, "device":Lorg/cybergarage/upnp/Device;
    if-eqz v3, :cond_0

    .line 4795
    const-string v5, "getDevicePreset"

    invoke-virtual {v3, v5}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 4796
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    if-eqz v0, :cond_0

    .line 4797
    const-string v5, "devicePresetData"

    invoke-direct {p0, p1}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->createGetPresetRequest(Lorg/json/JSONArray;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v5, v6}, Lorg/cybergarage/upnp/Action;->setArgumentValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 4798
    new-instance v1, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$GetPresetCallback;

    invoke-direct {v1, p0, p2}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$GetPresetCallback;-><init>(Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;Lcom/belkin/wemo/callback/SetAndGetActionCallBack;)V

    .line 4799
    .local v1, "actionCallback":Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$GetPresetCallback;
    const/4 v4, 0x1

    .line 4800
    invoke-static {}, Lcom/belkin/cybergarage/wrapper/ControlActionHandler;->newInstance()Lcom/belkin/cybergarage/wrapper/ControlActionHandler;

    move-result-object v5

    invoke-virtual {v5, v0, v1, v1}, Lcom/belkin/cybergarage/wrapper/ControlActionHandler;->postControlAction(Lorg/cybergarage/upnp/Action;Lcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionErrorCallback;Lcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionSuccessCallback;)V

    .line 4804
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "actionCallback":Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$GetPresetCallback;
    .end local v3    # "device":Lorg/cybergarage/upnp/Device;
    :cond_0
    if-nez v4, :cond_1

    .line 4805
    invoke-interface {p2}, Lcom/belkin/wemo/callback/SetAndGetActionCallBack;->onError()V

    .line 4807
    :cond_1
    return-void
.end method

.method public getDeviceState(Lorg/cybergarage/upnp/Device;)Ljava/lang/String;
    .locals 6
    .param p1, "device"    # Lorg/cybergarage/upnp/Device;

    .prologue
    .line 471
    :try_start_0
    const-string v2, "0"

    .line 472
    .local v2, "argumentValueStr":Ljava/lang/String;
    const-string v5, "GetBinaryState"

    invoke-virtual {p1, v5}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 473
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    .line 474
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->getOutputArgumentList()Lorg/cybergarage/upnp/ArgumentList;

    move-result-object v1

    .line 475
    .local v1, "argumentList":Lorg/cybergarage/upnp/ArgumentList;
    const/4 v4, 0x0

    .local v4, "k":I
    :goto_0
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ArgumentList;->size()I

    move-result v5

    if-ge v4, v5, :cond_0

    .line 476
    invoke-virtual {v1, v4}, Lorg/cybergarage/upnp/ArgumentList;->getArgument(I)Lorg/cybergarage/upnp/Argument;

    move-result-object v5

    invoke-virtual {v5}, Lorg/cybergarage/upnp/Argument;->getValue()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 477
    if-eqz v2, :cond_1

    .line 483
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "argumentList":Lorg/cybergarage/upnp/ArgumentList;
    .end local v2    # "argumentValueStr":Ljava/lang/String;
    .end local v4    # "k":I
    :cond_0
    :goto_1
    return-object v2

    .line 475
    .restart local v0    # "action":Lorg/cybergarage/upnp/Action;
    .restart local v1    # "argumentList":Lorg/cybergarage/upnp/ArgumentList;
    .restart local v2    # "argumentValueStr":Ljava/lang/String;
    .restart local v4    # "k":I
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 482
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "argumentList":Lorg/cybergarage/upnp/ArgumentList;
    .end local v2    # "argumentValueStr":Ljava/lang/String;
    .end local v4    # "k":I
    :catch_0
    move-exception v3

    .line 483
    .local v3, "e":Ljava/lang/Exception;
    const-string v2, "0"

    goto :goto_1
.end method

.method public getDoorWindowSensorsList()Lorg/json/JSONArray;
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 1162
    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    .line 1163
    .local v3, "doorNWindowSensors":Lorg/json/JSONArray;
    iget-object v11, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonBridgeArray:Lorg/json/JSONArray;

    if-eqz v11, :cond_3

    iget-object v11, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonBridgeArray:Lorg/json/JSONArray;

    invoke-virtual {v11}, Lorg/json/JSONArray;->length()I

    move-result v11

    if-lez v11, :cond_3

    .line 1164
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    iget-object v11, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonBridgeArray:Lorg/json/JSONArray;

    invoke-virtual {v11}, Lorg/json/JSONArray;->length()I

    move-result v11

    if-ge v5, v11, :cond_3

    .line 1165
    new-instance v10, Lorg/json/JSONObject;

    invoke-direct {v10}, Lorg/json/JSONObject;-><init>()V

    .line 1166
    .local v10, "tempObject":Lorg/json/JSONObject;
    iget-object v11, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonBridgeArray:Lorg/json/JSONArray;

    invoke-virtual {v11, v5}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v10

    .line 1167
    invoke-virtual {v10}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v9

    .line 1168
    .local v9, "subDeviceInfo":Ljava/lang/String;
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    if-nez v11, :cond_1

    const-string v11, "GroupID"

    invoke-virtual {v9, v11}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 1169
    const-string v11, "GroupIDS"

    invoke-virtual {v10, v11}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    .line 1170
    .local v2, "devicesInGroup":Lorg/json/JSONArray;
    if-eqz v2, :cond_2

    .line 1171
    const/4 v6, 0x0

    .local v6, "j":I
    :goto_1
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v11

    if-ge v6, v11, :cond_2

    .line 1172
    invoke-virtual {v2, v6}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    .line 1173
    .local v1, "deviceInfo":Lorg/json/JSONObject;
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 1174
    .local v0, "bridgeJsonObject":Lorg/json/JSONObject;
    const-string v11, "ModelCode"

    invoke-virtual {v1, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 1175
    .local v7, "modelCode":Ljava/lang/String;
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    if-nez v11, :cond_0

    const-string v11, "F7C038"

    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_0

    .line 1176
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v12, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ":"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "DeviceID"

    invoke-virtual {v1, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 1177
    .local v8, "subDeviceID":Ljava/lang/String;
    const-string v11, "FriendlyName"

    invoke-virtual {v1, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1178
    .local v4, "friendlyName":Ljava/lang/String;
    const-string v11, "friendlyName"

    invoke-virtual {v0, v11, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1179
    const-string v11, "udn"

    invoke-virtual {v0, v11, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1180
    const-string v11, "bridgeudn"

    iget-object v12, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    invoke-virtual {v0, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1181
    const-string v11, "ProductName"

    invoke-static {v7}, Lcom/belkin/wemo/cache/utils/WemoUtils;->getProductName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v0, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1182
    invoke-virtual {v3, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 1171
    .end local v4    # "friendlyName":Ljava/lang/String;
    .end local v8    # "subDeviceID":Ljava/lang/String;
    :cond_0
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 1187
    .end local v0    # "bridgeJsonObject":Lorg/json/JSONObject;
    .end local v1    # "deviceInfo":Lorg/json/JSONObject;
    .end local v2    # "devicesInGroup":Lorg/json/JSONArray;
    .end local v6    # "j":I
    .end local v7    # "modelCode":Ljava/lang/String;
    :cond_1
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    if-nez v11, :cond_2

    const-string v11, "GroupID"

    invoke-virtual {v9, v11}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v11

    if-nez v11, :cond_2

    .line 1188
    const-string v11, "ModelCode"

    invoke-virtual {v10, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 1189
    .restart local v7    # "modelCode":Ljava/lang/String;
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    if-nez v11, :cond_2

    const-string v11, "F7C038"

    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_2

    .line 1190
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 1191
    .restart local v0    # "bridgeJsonObject":Lorg/json/JSONObject;
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v12, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ":"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "DeviceID"

    invoke-virtual {v10, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 1192
    .restart local v8    # "subDeviceID":Ljava/lang/String;
    const-string v11, "FriendlyName"

    invoke-virtual {v10, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1193
    .restart local v4    # "friendlyName":Ljava/lang/String;
    const-string v11, "friendlyName"

    invoke-virtual {v0, v11, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1194
    const-string v11, "udn"

    invoke-virtual {v0, v11, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1195
    const-string v11, "bridgeudn"

    iget-object v12, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    invoke-virtual {v0, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1196
    const-string v11, "ProductName"

    invoke-static {v7}, Lcom/belkin/wemo/cache/utils/WemoUtils;->getProductName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v0, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1197
    invoke-virtual {v3, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 1164
    .end local v0    # "bridgeJsonObject":Lorg/json/JSONObject;
    .end local v4    # "friendlyName":Ljava/lang/String;
    .end local v7    # "modelCode":Ljava/lang/String;
    .end local v8    # "subDeviceID":Ljava/lang/String;
    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_0

    .line 1202
    .end local v5    # "i":I
    .end local v9    # "subDeviceInfo":Ljava/lang/String;
    .end local v10    # "tempObject":Lorg/json/JSONObject;
    :cond_3
    const-string v11, "UpnpDeviceList"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Door and Window Sensor Devices** "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1203
    return-object v3
.end method

.method public getEmailData()Ljava/lang/String;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/16 v10, 0x3b

    const/16 v9, 0x2c

    const/4 v8, 0x0

    .line 3741
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 3742
    .local v4, "response":Ljava/lang/StringBuilder;
    const-string v2, ""

    .line 3743
    .local v2, "deviceName":Ljava/lang/String;
    iget-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v5}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v5

    invoke-virtual {v5}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v0

    .line 3744
    .local v0, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-virtual {v0}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v5

    invoke-virtual {v5}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v5

    if-ge v3, v5, :cond_11

    .line 3745
    invoke-virtual {v0}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v5

    invoke-virtual {v5, v3}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v1

    .line 3746
    .local v1, "device":Lorg/cybergarage/upnp/Device;
    invoke-virtual {v1}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v5

    const-string v6, "urn:Belkin:device:controllee:1"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 3747
    const-string v5, "Switch, "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3776
    :cond_0
    :goto_1
    invoke-virtual {v1}, Lorg/cybergarage/upnp/Device;->getFriendlyName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "Bridge"

    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_f

    .line 3777
    const-string v2, "WeMo Link"

    .line 3781
    :goto_2
    invoke-virtual {v1}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v5

    const-string v6, "urn:Belkin:device:NetCamSensor:1"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 3783
    invoke-virtual {v2, v10}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v5

    if-lez v5, :cond_10

    .line 3785
    invoke-virtual {v2, v10}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v5

    invoke-virtual {v2, v8, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 3793
    :cond_1
    :goto_3
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v1}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getMacAddress(Lorg/cybergarage/upnp/Device;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v1}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getCurrentFirmwareVersion(Lorg/cybergarage/upnp/Device;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v1}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getSignalStrenght(Lorg/cybergarage/upnp/Device;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "Unavailable : NO, "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "Device Extended Meta Info : NA"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3744
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    .line 3748
    :cond_2
    invoke-virtual {v1}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v5

    const-string v6, "urn:Belkin:device:sensor:1"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 3749
    const-string v5, "Sensor, "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_1

    .line 3750
    :cond_3
    invoke-virtual {v1}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v5

    const-string v6, "urn:Belkin:device:lightswitch:1"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 3751
    const-string v5, "Light Switch, "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_1

    .line 3752
    :cond_4
    invoke-virtual {v1}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v5

    const-string v6, "urn:Belkin:device:NetCamSensor:1"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 3753
    const-string v5, "NetCam, "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_1

    .line 3754
    :cond_5
    invoke-virtual {v1}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v5

    const-string v6, "urn:Belkin:device:insight:1"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 3755
    const-string v5, "Insight, "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_1

    .line 3756
    :cond_6
    invoke-virtual {v1}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v5

    const-string v6, "urn:Belkin:device:bridge:1"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 3757
    const-string v5, "WeMo Link, "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_1

    .line 3758
    :cond_7
    invoke-virtual {v1}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v5

    const-string v6, "urn:Belkin:device:CoffeeMaker:1"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_8

    .line 3759
    const-string v5, "Coffee Maker, "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_1

    .line 3760
    :cond_8
    invoke-virtual {v1}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v5

    const-string v6, "urn:Belkin:device:Crockpot:1"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_9

    .line 3761
    const-string v5, "Slow Cooker, "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_1

    .line 3762
    :cond_9
    invoke-virtual {v1}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v5

    const-string v6, "urn:Belkin:device:HeaterA:1"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_a

    .line 3763
    const-string v5, "Heater A, "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_1

    .line 3764
    :cond_a
    invoke-virtual {v1}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v5

    const-string v6, "urn:Belkin:device:HeaterB:1"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_b

    .line 3765
    const-string v5, "Heater B, "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_1

    .line 3766
    :cond_b
    invoke-virtual {v1}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v5

    const-string v6, "urn:Belkin:device:AirPurifier:1"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_c

    .line 3767
    const-string v5, "Air Purifier, "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_1

    .line 3768
    :cond_c
    invoke-virtual {v1}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v5

    const-string v6, "urn:Belkin:device:Humidifier:1"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_d

    .line 3769
    const-string v5, "Humidifier, "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_1

    .line 3770
    :cond_d
    invoke-virtual {v1}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v5

    const-string v6, "urn:Belkin:device:HumidifierB:1"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_e

    .line 3771
    const-string v5, "HumidifierB, "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_1

    .line 3772
    :cond_e
    invoke-virtual {v1}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v5

    const-string v6, "urn:Belkin:device:Maker:1"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 3773
    const-string v5, "Maker, "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_1

    .line 3779
    :cond_f
    invoke-virtual {v1}, Lorg/cybergarage/upnp/Device;->getFriendlyName()Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_2

    .line 3787
    :cond_10
    invoke-virtual {v2, v9}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v5

    if-lez v5, :cond_1

    .line 3789
    invoke-virtual {v2, v9}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v5

    invoke-virtual {v2, v8, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_3

    .line 3802
    .end local v1    # "device":Lorg/cybergarage/upnp/Device;
    :cond_11
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method public getEmergencyContacts(Lcom/belkin/devices/callback/GetDataStoreOnLinkCallBack;)V
    .locals 8
    .param p1, "callback"    # Lcom/belkin/devices/callback/GetDataStoreOnLinkCallBack;

    .prologue
    .line 4426
    const/4 v5, 0x0

    .line 4427
    .local v5, "isRequestProcessed":Z
    iget-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v6

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v2

    .line 4428
    .local v2, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    invoke-virtual {v2}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v6

    invoke-virtual {v6}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v6

    if-ge v4, v6, :cond_1

    .line 4429
    invoke-virtual {v2}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v6

    invoke-virtual {v6, v4}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v6

    invoke-virtual {v6}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v6

    const-string v7, "Bridge"

    invoke-virtual {v6, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 4430
    invoke-virtual {v2}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v6

    invoke-virtual {v6, v4}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v6

    invoke-virtual {v6}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    .line 4428
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 4433
    :cond_1
    iget-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    if-eqz v6, :cond_2

    .line 4434
    iget-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    invoke-virtual {v2, v6}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v3

    .line 4435
    .local v3, "device":Lorg/cybergarage/upnp/Device;
    if-eqz v3, :cond_2

    .line 4436
    const-string v6, "GetDataStores"

    invoke-virtual {v3, v6}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 4437
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    if-eqz v0, :cond_2

    .line 4438
    const-string v6, "DataStores"

    invoke-direct {p0}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->createGetEmergencyContactRequest()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v6, v7}, Lorg/cybergarage/upnp/Action;->setArgumentValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 4439
    new-instance v1, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$GetPostActionCallback;

    invoke-direct {v1, p0, p1}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$GetPostActionCallback;-><init>(Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;Lcom/belkin/wemo/callback/SetAndGetActionCallBack;)V

    .line 4440
    .local v1, "actionCallback":Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$GetPostActionCallback;
    const/4 v5, 0x1

    .line 4442
    invoke-static {}, Lcom/belkin/cybergarage/wrapper/ControlActionHandler;->newInstance()Lcom/belkin/cybergarage/wrapper/ControlActionHandler;

    move-result-object v6

    invoke-virtual {v6, v0, v1, v1}, Lcom/belkin/cybergarage/wrapper/ControlActionHandler;->postControlAction(Lorg/cybergarage/upnp/Action;Lcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionErrorCallback;Lcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionSuccessCallback;)V

    .line 4447
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "actionCallback":Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$GetPostActionCallback;
    .end local v3    # "device":Lorg/cybergarage/upnp/Device;
    :cond_2
    if-nez v5, :cond_3

    .line 4448
    invoke-virtual {p1}, Lcom/belkin/devices/callback/GetDataStoreOnLinkCallBack;->onError()V

    .line 4450
    :cond_3
    return-void
.end method

.method public getFirmwareDetailsList(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 10
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    .line 3446
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    invoke-virtual {v7, p1}, Lcom/belkin/wemo/cache/utils/MoreUtil;->getFirmwareDetailsUSWW(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    .line 3447
    .local v1, "firmDetailsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    if-eqz v1, :cond_2d

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-lez v7, :cond_2d

    .line 3448
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v7

    new-array v7, v7, [Ljava/lang/String;

    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/String;

    .line 3449
    .local v3, "firmwareDetailsArray":[Ljava/lang/String;
    move-object v0, v3

    .local v0, "arr$":[Ljava/lang/String;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_0
    if-ge v4, v5, :cond_2d

    aget-object v2, v0, v4

    .line 3450
    .local v2, "firmwareDetail":Ljava/lang/String;
    const-string v7, "\\r?\\n"

    invoke-virtual {v2, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    .line 3451
    .local v6, "newFirmwareVersion":[Ljava/lang/String;
    aget-object v7, v6, v9

    const-string v8, "WeMoLightSwitch"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 3452
    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->lightSwitchFW:[Ljava/lang/String;

    .line 3454
    :cond_0
    aget-object v7, v6, v9

    const-string v8, "WeMoSignedLightSwitch"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 3455
    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->signedLightSwitchFW:[Ljava/lang/String;

    .line 3457
    :cond_1
    aget-object v7, v6, v9

    const-string v8, "WeMoInsight"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 3458
    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->insightFW:[Ljava/lang/String;

    .line 3460
    :cond_2
    aget-object v7, v6, v9

    const-string v8, "WeMoSignedInsight"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 3461
    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->signedInsightFW:[Ljava/lang/String;

    .line 3463
    :cond_3
    aget-object v7, v6, v9

    const-string v8, "WeMoEU"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 3464
    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->euFW:[Ljava/lang/String;

    .line 3466
    :cond_4
    aget-object v7, v6, v9

    const-string v8, "WeMoUS"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 3467
    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->usFW:[Ljava/lang/String;

    .line 3469
    :cond_5
    aget-object v7, v6, v9

    const-string v8, "WeMoSignedEU"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 3470
    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->signedEUFW:[Ljava/lang/String;

    .line 3472
    :cond_6
    aget-object v7, v6, v9

    const-string v8, "WeMoSignedUS"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_7

    .line 3473
    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->signedUSFW:[Ljava/lang/String;

    .line 3475
    :cond_7
    aget-object v7, v6, v9

    const-string v8, "WeMoWW_BRIDGE"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_8

    .line 3476
    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->bridgeFW:[Ljava/lang/String;

    .line 3478
    :cond_8
    aget-object v7, v6, v9

    const-string v8, "WeMoWW_CROCKPOT"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_9

    .line 3479
    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->slowCookerFw:[Ljava/lang/String;

    .line 3481
    :cond_9
    aget-object v7, v6, v9

    const-string v8, "WeMoWW_Maker"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_a

    .line 3482
    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->makerFW:[Ljava/lang/String;

    .line 3484
    :cond_a
    aget-object v7, v6, v9

    const-string v8, "WeMoWW_CoffeeMaker"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_b

    .line 3485
    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->cofeeMakerFw:[Ljava/lang/String;

    .line 3487
    :cond_b
    aget-object v7, v6, v9

    const-string v8, "WeMoWW_Heater"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_c

    .line 3488
    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->heaterFw:[Ljava/lang/String;

    .line 3490
    :cond_c
    aget-object v7, v6, v9

    const-string v8, "WeMoWW_HeaterA"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_d

    .line 3491
    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->heaterAFw:[Ljava/lang/String;

    .line 3493
    :cond_d
    aget-object v7, v6, v9

    const-string v8, "WeMoWW_HeaterB"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_e

    .line 3494
    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->heaterBFw:[Ljava/lang/String;

    .line 3496
    :cond_e
    aget-object v7, v6, v9

    const-string v8, "WeMoWW_Humidifier"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_f

    .line 3497
    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->humidifierFw:[Ljava/lang/String;

    .line 3499
    :cond_f
    aget-object v7, v6, v9

    const-string v8, "WeMoWW_HumidifierB"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_10

    .line 3500
    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->humidifierBFw:[Ljava/lang/String;

    .line 3502
    :cond_10
    aget-object v7, v6, v9

    const-string v8, "WeMoWW_AirPurifier"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_11

    .line 3503
    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->airPurifierFw:[Ljava/lang/String;

    .line 3505
    :cond_11
    aget-object v7, v6, v9

    const-string v8, "WeMoWW_Bulb"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_12

    .line 3506
    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->wemobulbFw:[Ljava/lang/String;

    .line 3508
    :cond_12
    aget-object v7, v6, v9

    const-string v8, "WeMoWW_OsramGardenSpotLED"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_13

    .line 3509
    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->gardenSpotFw:[Ljava/lang/String;

    .line 3511
    :cond_13
    aget-object v7, v6, v9

    const-string v8, "WeMoWW_OsramTWBulb"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_14

    .line 3512
    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->tempTunableFw:[Ljava/lang/String;

    .line 3514
    :cond_14
    aget-object v7, v6, v9

    const-string v8, "WeMoWW_OsramFlexLED"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_15

    .line 3515
    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->flexLEDFw:[Ljava/lang/String;

    .line 3517
    :cond_15
    aget-object v7, v6, v9

    const-string v8, "WeMoOpenWRTAirPurifier"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_16

    .line 3518
    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTAirPurifierFw:[Ljava/lang/String;

    .line 3520
    :cond_16
    aget-object v7, v6, v9

    const-string v8, "WeMoOpenWRTCoffeeMaker"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_17

    .line 3521
    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTCoffeeMakerFw:[Ljava/lang/String;

    .line 3523
    :cond_17
    aget-object v7, v6, v9

    const-string v8, "WeMoOpenWRTCROCKPOT"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_18

    .line 3524
    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTSlowCookerFw:[Ljava/lang/String;

    .line 3526
    :cond_18
    aget-object v7, v6, v9

    const-string v8, "WeMoOpenWRTHeaterA"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_19

    .line 3527
    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTHeaterAFw:[Ljava/lang/String;

    .line 3529
    :cond_19
    aget-object v7, v6, v9

    const-string v8, "WeMoOpenWRTHeaterB"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1a

    .line 3530
    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTHeaterBFw:[Ljava/lang/String;

    .line 3532
    :cond_1a
    aget-object v7, v6, v9

    const-string v8, "WeMoOpenWRTHumidifier"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1b

    .line 3533
    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTHumidifierFw:[Ljava/lang/String;

    .line 3535
    :cond_1b
    aget-object v7, v6, v9

    const-string v8, "WeMoOpenWRTHumidifierB"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1c

    .line 3536
    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTHumidifierBFw:[Ljava/lang/String;

    .line 3538
    :cond_1c
    aget-object v7, v6, v9

    const-string v8, "WeMoOpenWRTInsight"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1d

    .line 3539
    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTinsightFw:[Ljava/lang/String;

    .line 3541
    :cond_1d
    aget-object v7, v6, v9

    const-string v8, "WeMoOpenWRTLightSwitch"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1e

    .line 3542
    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTLSFw:[Ljava/lang/String;

    .line 3544
    :cond_1e
    aget-object v7, v6, v9

    const-string v8, "WeMoOpenWRTMaker"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1f

    .line 3545
    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTMakerFw:[Ljava/lang/String;

    .line 3547
    :cond_1f
    aget-object v7, v6, v9

    const-string v8, "WeMoOpenWRTSNS"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_20

    .line 3548
    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTsnsFw:[Ljava/lang/String;

    .line 3550
    :cond_20
    aget-object v7, v6, v9

    const-string v8, "WeMoOpenWRTTransAirPurifier"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_21

    .line 3551
    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransAirPurifierFw:[Ljava/lang/String;

    .line 3553
    :cond_21
    aget-object v7, v6, v9

    const-string v8, "WeMoOpenWRTTransCoffeeMaker"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_22

    .line 3554
    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransCoffeeMakerFw:[Ljava/lang/String;

    .line 3556
    :cond_22
    aget-object v7, v6, v9

    const-string v8, "WeMoOpenWRTTransCROCKPOT"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_23

    .line 3557
    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransSlowCookerFw:[Ljava/lang/String;

    .line 3559
    :cond_23
    aget-object v7, v6, v9

    const-string v8, "WeMoOpenWRTTransHeaterA"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_24

    .line 3560
    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransHeaterAFw:[Ljava/lang/String;

    .line 3562
    :cond_24
    aget-object v7, v6, v9

    const-string v8, "WeMoOpenWRTTransHeaterB"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_25

    .line 3563
    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransHeaterBFw:[Ljava/lang/String;

    .line 3565
    :cond_25
    aget-object v7, v6, v9

    const-string v8, "WeMoOpenWRTTransHumidifier"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_26

    .line 3566
    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransHumidifierFw:[Ljava/lang/String;

    .line 3568
    :cond_26
    aget-object v7, v6, v9

    const-string v8, "WeMoOpenWRTTransHumidifierB"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_27

    .line 3569
    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransHumidifierBFw:[Ljava/lang/String;

    .line 3571
    :cond_27
    aget-object v7, v6, v9

    const-string v8, "WeMoOpenWRTTransInsight"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_28

    .line 3572
    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransinsightFw:[Ljava/lang/String;

    .line 3574
    :cond_28
    aget-object v7, v6, v9

    const-string v8, "WeMoOpenWRTTransLightSwitch"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_29

    .line 3575
    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransLSFw:[Ljava/lang/String;

    .line 3577
    :cond_29
    aget-object v7, v6, v9

    const-string v8, "WeMoOpenWRTTransMaker"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2a

    .line 3578
    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransMakerFw:[Ljava/lang/String;

    .line 3580
    :cond_2a
    aget-object v7, v6, v9

    const-string v8, "WeMoOpenWRTTransSNS"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2b

    .line 3581
    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTranssnsFw:[Ljava/lang/String;

    .line 3583
    :cond_2b
    aget-object v7, v6, v9

    const-string v8, "WeMoOpenWRTInsight_v2"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2c

    .line 3584
    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTInsightV2:[Ljava/lang/String;

    .line 3449
    :cond_2c
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_0

    .line 3588
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v2    # "firmwareDetail":Ljava/lang/String;
    .end local v3    # "firmwareDetailsArray":[Ljava/lang/String;
    .end local v4    # "i$":I
    .end local v5    # "len$":I
    .end local v6    # "newFirmwareVersion":[Ljava/lang/String;
    :cond_2d
    return-object v1
.end method

.method public getFobSensorList()Lorg/json/JSONArray;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 1128
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 1129
    .local v1, "fobSensorDevices":Lorg/json/JSONArray;
    iget-object v8, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonBridgeArray:Lorg/json/JSONArray;

    if-eqz v8, :cond_1

    iget-object v8, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonBridgeArray:Lorg/json/JSONArray;

    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    move-result v8

    if-lez v8, :cond_1

    .line 1130
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    iget-object v8, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonBridgeArray:Lorg/json/JSONArray;

    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    move-result v8

    if-ge v4, v8, :cond_1

    .line 1131
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 1132
    .local v0, "bridgeJsonObject":Lorg/json/JSONObject;
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    .line 1134
    .local v7, "tempObject":Lorg/json/JSONObject;
    iget-object v8, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonBridgeArray:Lorg/json/JSONArray;

    invoke-virtual {v8, v4}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    .line 1135
    invoke-virtual {v7}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    .line 1136
    .local v3, "groupId":Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_0

    const-string v8, "GroupID"

    invoke-virtual {v3, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 1138
    const-string v8, "ModelCode"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 1139
    .local v5, "modelCode":Ljava/lang/String;
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_0

    const-string v8, "F7C039"

    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 1140
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ":"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "DeviceID"

    invoke-virtual {v7, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 1141
    .local v6, "subDeviceID":Ljava/lang/String;
    const-string v8, "FriendlyName"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1142
    .local v2, "friendlyName":Ljava/lang/String;
    const-string v8, "friendlyName"

    invoke-virtual {v0, v8, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1143
    const-string v8, "udn"

    invoke-virtual {v0, v8, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1144
    const-string v8, "bridgeudn"

    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    invoke-virtual {v0, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1145
    const-string v8, "ProductName"

    invoke-static {v5}, Lcom/belkin/wemo/cache/utils/WemoUtils;->getProductName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1146
    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 1149
    .end local v2    # "friendlyName":Ljava/lang/String;
    .end local v5    # "modelCode":Ljava/lang/String;
    .end local v6    # "subDeviceID":Ljava/lang/String;
    :cond_0
    const-string v8, "UpnpDeviceList"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Fob Sensor Devices**"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1130
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_0

    .line 1152
    .end local v0    # "bridgeJsonObject":Lorg/json/JSONObject;
    .end local v3    # "groupId":Ljava/lang/String;
    .end local v4    # "i":I
    .end local v7    # "tempObject":Lorg/json/JSONObject;
    :cond_1
    return-object v1
.end method

.method public getFriendlyName(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 2508
    iget-object v3, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v0

    .line 2509
    .local v0, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    iput-object v3, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    .line 2511
    :try_start_0
    invoke-virtual {v0, p1}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v2

    .line 2512
    .local v2, "localDevice":Lorg/cybergarage/upnp/Device;
    invoke-virtual {v2}, Lorg/cybergarage/upnp/Device;->getFriendlyName()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 2515
    .end local v2    # "localDevice":Lorg/cybergarage/upnp/Device;
    :goto_0
    return-object v3

    .line 2513
    :catch_0
    move-exception v1

    .line 2514
    .local v1, "e":Ljava/lang/Exception;
    const-string v3, "UpnpDeviceList"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "exception in getFriendlyName: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2515
    const-string v3, ""

    goto :goto_0
.end method

.method public getIconURLByUDN(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 2488
    iget-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v5}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v5

    invoke-virtual {v5}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v1

    .line 2489
    .local v1, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    const-string v4, ""

    .line 2491
    .local v4, "iconURL":Ljava/lang/String;
    :try_start_0
    invoke-virtual {v1, p1}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v2

    .line 2492
    .local v2, "device":Lorg/cybergarage/upnp/Device;
    const-string v5, "GetIconURL"

    invoke-virtual {v2, v5}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 2493
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    move-object v5, v4

    .line 2498
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v2    # "device":Lorg/cybergarage/upnp/Device;
    :goto_0
    return-object v5

    .line 2494
    :catch_0
    move-exception v3

    .line 2495
    .local v3, "e":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    .line 2496
    const-string v5, ""

    goto :goto_0
.end method

.method public getIconUrl(Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p1, "udn"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 443
    iget-object v8, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v8}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v8

    invoke-virtual {v8}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v4

    .line 444
    .local v4, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    invoke-virtual {v4, p1}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v5

    .line 446
    .local v5, "device":Lorg/cybergarage/upnp/Device;
    :try_start_0
    const-string v3, ""

    .line 447
    .local v3, "argumentValueStr":Ljava/lang/String;
    const-string v8, "GetIconURL"

    invoke-virtual {v5, v8}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 448
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    .line 449
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->getOutputArgumentList()Lorg/cybergarage/upnp/ArgumentList;

    move-result-object v2

    .line 451
    .local v2, "argumentList":Lorg/cybergarage/upnp/ArgumentList;
    invoke-virtual {v2}, Lorg/cybergarage/upnp/ArgumentList;->size()I

    move-result v8

    if-lez v8, :cond_0

    .line 452
    invoke-virtual {v2}, Lorg/cybergarage/upnp/ArgumentList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_0

    .line 453
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/cybergarage/upnp/Argument;

    .line 454
    .local v1, "argument":Lorg/cybergarage/upnp/Argument;
    invoke-virtual {v1}, Lorg/cybergarage/upnp/Argument;->getValue()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 455
    goto :goto_0

    .line 459
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "argument":Lorg/cybergarage/upnp/Argument;
    .end local v2    # "argumentList":Lorg/cybergarage/upnp/ArgumentList;
    .end local v3    # "argumentValueStr":Ljava/lang/String;
    .end local v7    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :catch_0
    move-exception v6

    .line 460
    .local v6, "e":Ljava/lang/Exception;
    const-string v3, ""

    .end local v6    # "e":Ljava/lang/Exception;
    :cond_0
    return-object v3
.end method

.method public getInsightList()Lorg/json/JSONArray;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 1276
    new-instance v4, Lorg/json/JSONArray;

    invoke-direct {v4}, Lorg/json/JSONArray;-><init>()V

    .line 1277
    .local v4, "jsonInsightObject":Lorg/json/JSONArray;
    iget-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v5}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v5

    invoke-virtual {v5}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v0

    .line 1278
    .local v0, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_0
    invoke-virtual {v0}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v5

    invoke-virtual {v5}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v5

    if-ge v3, v5, :cond_1

    .line 1279
    invoke-virtual {v0}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v5

    invoke-virtual {v5, v3}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v1

    .line 1280
    .local v1, "device":Lorg/cybergarage/upnp/Device;
    const-string v5, "Device friendly name"

    invoke-virtual {v1}, Lorg/cybergarage/upnp/Device;->getFriendlyName()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1281
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 1282
    .local v2, "insightJsonObject":Lorg/json/JSONObject;
    invoke-virtual {v1}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v5

    const-string v6, "urn:Belkin:device:insight:1"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 1283
    const-string v5, "friendlyName"

    invoke-virtual {v1}, Lorg/cybergarage/upnp/Device;->getFriendlyName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1284
    const-string v5, "udn"

    invoke-virtual {v1}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1285
    invoke-virtual {v4, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 1278
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1288
    .end local v1    # "device":Lorg/cybergarage/upnp/Device;
    .end local v2    # "insightJsonObject":Lorg/json/JSONObject;
    :cond_1
    return-object v4
.end method

.method public getInsightParamsJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 9
    .param p1, "udn"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 3815
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v7

    invoke-virtual {v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v3

    .line 3816
    .local v3, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    invoke-virtual {v3, p1}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v7

    const-string v8, "GetInsightParams"

    invoke-virtual {v7, v8}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 3817
    .local v0, "actionObj":Lorg/cybergarage/upnp/Action;
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    .line 3819
    const/4 v2, 0x0

    .line 3820
    .local v2, "argumentValueStr":Ljava/lang/String;
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->getOutputArgumentList()Lorg/cybergarage/upnp/ArgumentList;

    move-result-object v1

    .line 3821
    .local v1, "argumentList":Lorg/cybergarage/upnp/ArgumentList;
    const/4 v5, 0x0

    .local v5, "k":I
    :goto_0
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ArgumentList;->size()I

    move-result v7

    if-ge v5, v7, :cond_0

    .line 3822
    invoke-virtual {v1, v5}, Lorg/cybergarage/upnp/ArgumentList;->getArgument(I)Lorg/cybergarage/upnp/Argument;

    move-result-object v7

    invoke-virtual {v7}, Lorg/cybergarage/upnp/Argument;->getValue()Ljava/lang/String;

    move-result-object v2

    .line 3821
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 3824
    :cond_0
    const-string v7, "\\|"

    invoke-virtual {v2, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    .line 3825
    .local v6, "result":[Ljava/lang/String;
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 3826
    .local v4, "insightParams":Lorg/json/JSONObject;
    const-string v7, "state"

    const/4 v8, 0x0

    aget-object v8, v6, v8

    invoke-virtual {v4, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3827
    sget-object v7, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_STATE_CHANGE_TS:Ljava/lang/String;

    const/4 v8, 0x1

    aget-object v8, v6, v8

    invoke-virtual {v4, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3828
    sget-object v7, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_ON_FOR:Ljava/lang/String;

    const/4 v8, 0x2

    aget-object v8, v6, v8

    invoke-virtual {v4, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3829
    sget-object v7, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_TTTON:Ljava/lang/String;

    const/4 v8, 0x3

    aget-object v8, v6, v8

    invoke-virtual {v4, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3830
    sget-object v7, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_PAST_14_TOTAL_TIME:Ljava/lang/String;

    const/4 v8, 0x4

    aget-object v8, v6, v8

    invoke-virtual {v4, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3831
    sget-object v7, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_HRS_CONNECTED:Ljava/lang/String;

    const/4 v8, 0x5

    aget-object v8, v6, v8

    invoke-virtual {v4, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3832
    sget-object v7, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_AVG_POWER_ON:Ljava/lang/String;

    const/4 v8, 0x6

    aget-object v8, v6, v8

    invoke-virtual {v4, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3833
    sget-object v7, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_POWER_NOW:Ljava/lang/String;

    const/4 v8, 0x7

    aget-object v8, v6, v8

    invoke-virtual {v4, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3834
    sget-object v7, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_TODAY_TOTAL_KWH:Ljava/lang/String;

    const/16 v8, 0x8

    aget-object v8, v6, v8

    invoke-virtual {v4, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3835
    sget-object v7, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_PAST_14_DAYS_KWH:Ljava/lang/String;

    const/16 v8, 0x9

    aget-object v8, v6, v8

    invoke-virtual {v4, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3836
    sget-object v7, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_POWER_THRESHOLD:Ljava/lang/String;

    const/16 v8, 0xa

    aget-object v8, v6, v8

    invoke-virtual {v4, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3838
    return-object v4
.end method

.method public getInsightParamsJSONObjectFramework(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 4
    .param p1, "udn"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 3850
    new-instance v2, Lorg/json/JSONObject;

    const-string v3, "{}"

    invoke-direct {v2, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 3852
    .local v2, "oInsightParams":Lorg/json/JSONObject;
    :try_start_0
    const-string v3, "GetInsightParams"

    invoke-virtual {p0, p1, v3}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->postActionObjectControlAction(Ljava/lang/String;Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 3853
    .local v0, "actionObj":Lorg/cybergarage/upnp/Action;
    invoke-virtual {p0, v0, p1}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getInsightParamsOutputObject(Lorg/cybergarage/upnp/Action;Ljava/lang/String;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 3855
    .end local v0    # "actionObj":Lorg/cybergarage/upnp/Action;
    .end local v2    # "oInsightParams":Lorg/json/JSONObject;
    :goto_0
    return-object v2

    .line 3854
    .restart local v2    # "oInsightParams":Lorg/json/JSONObject;
    :catch_0
    move-exception v1

    .line 3855
    .local v1, "ex":Ljava/lang/Exception;
    goto :goto_0
.end method

.method public getInsightParamsOutputObject(Lorg/cybergarage/upnp/Action;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 7
    .param p1, "actionObj"    # Lorg/cybergarage/upnp/Action;
    .param p2, "udn"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 3886
    const/4 v1, 0x0

    .line 3887
    .local v1, "argumentValueStr":Ljava/lang/String;
    invoke-virtual {p1}, Lorg/cybergarage/upnp/Action;->getOutputArgumentList()Lorg/cybergarage/upnp/ArgumentList;

    move-result-object v0

    .line 3888
    .local v0, "argumentList":Lorg/cybergarage/upnp/ArgumentList;
    const/4 v3, 0x0

    .local v3, "k":I
    :goto_0
    invoke-virtual {v0}, Lorg/cybergarage/upnp/ArgumentList;->size()I

    move-result v5

    if-ge v3, v5, :cond_0

    .line 3889
    invoke-virtual {v0, v3}, Lorg/cybergarage/upnp/ArgumentList;->getArgument(I)Lorg/cybergarage/upnp/Argument;

    move-result-object v5

    invoke-virtual {v5}, Lorg/cybergarage/upnp/Argument;->getValue()Ljava/lang/String;

    move-result-object v1

    .line 3888
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 3891
    :cond_0
    const-string v5, "\\|"

    invoke-virtual {v1, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 3892
    .local v4, "result":[Ljava/lang/String;
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 3893
    .local v2, "insightParams":Lorg/json/JSONObject;
    const-string v5, "GetInsightHomeSettings"

    sget-object v6, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->GET_ENERGY_PER_UNIT_COST_DATA:[Ljava/lang/String;

    invoke-virtual {p0, p2, v5, v6}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getActionResultValuesJSONObject(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 3894
    sget-object v5, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->BINARY_STATE:Ljava/lang/String;

    const/4 v6, 0x0

    aget-object v6, v4, v6

    invoke-virtual {v2, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3895
    sget-object v5, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_STATE_CHANGE_TS:Ljava/lang/String;

    const/4 v6, 0x1

    aget-object v6, v4, v6

    invoke-virtual {v2, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3896
    sget-object v5, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_ON_FOR:Ljava/lang/String;

    const/4 v6, 0x2

    aget-object v6, v4, v6

    invoke-virtual {v2, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3897
    sget-object v5, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_TTTON:Ljava/lang/String;

    const/4 v6, 0x3

    aget-object v6, v4, v6

    invoke-virtual {v2, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3898
    sget-object v5, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_PAST_14_TOTAL_TIME:Ljava/lang/String;

    const/4 v6, 0x4

    aget-object v6, v4, v6

    invoke-virtual {v2, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3899
    sget-object v5, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_HRS_CONNECTED:Ljava/lang/String;

    const/4 v6, 0x5

    aget-object v6, v4, v6

    invoke-virtual {v2, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3900
    sget-object v5, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_AVG_POWER_ON:Ljava/lang/String;

    const/4 v6, 0x6

    aget-object v6, v4, v6

    invoke-virtual {v2, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3901
    sget-object v5, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_POWER_NOW:Ljava/lang/String;

    const/4 v6, 0x7

    aget-object v6, v4, v6

    invoke-virtual {v2, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3902
    sget-object v5, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_TODAY_TOTAL_KWH:Ljava/lang/String;

    const/16 v6, 0x8

    aget-object v6, v4, v6

    invoke-virtual {v2, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3903
    sget-object v5, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_PAST_14_DAYS_KWH:Ljava/lang/String;

    const/16 v6, 0x9

    aget-object v6, v4, v6

    invoke-virtual {v2, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3904
    sget-object v5, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_POWER_THRESHOLD:Ljava/lang/String;

    const/16 v6, 0xa

    aget-object v6, v4, v6

    invoke-virtual {v2, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3907
    return-object v2
.end method

.method public getLatestDBVersion(Landroid/content/Context;)Ljava/lang/String;
    .locals 22
    .param p1, "mContext"    # Landroid/content/Context;

    .prologue
    .line 899
    const-string v19, "Inside getLatestDBVersion"

    const-string v20, "1"

    invoke-static/range {v19 .. v20}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 900
    new-instance v18, Lcom/belkin/rules/beans/RulesDBVersionResponseBean;

    invoke-direct/range {v18 .. v18}, Lcom/belkin/rules/beans/RulesDBVersionResponseBean;-><init>()V

    .line 901
    .local v18, "verRespObject":Lcom/belkin/rules/beans/RulesDBVersionResponseBean;
    new-instance v14, Lcom/belkin/rules/beans/RulesDBPathResponseBean;

    invoke-direct {v14}, Lcom/belkin/rules/beans/RulesDBPathResponseBean;-><init>()V

    .line 902
    .local v14, "rulesDBPathResponseObject":Lcom/belkin/rules/beans/RulesDBPathResponseBean;
    const-string v12, ""

    .line 903
    .local v12, "responseDBVersion":Ljava/lang/String;
    const-string v17, ""

    .line 906
    .local v17, "tempresponseDBVersion":Ljava/lang/String;
    new-instance v15, Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v0, p1

    invoke-direct {v15, v0}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    .line 907
    .local v15, "sharePreference":Lcom/belkin/wemo/cache/utils/SharePreferences;
    const-string v19, "UpnpDeviceList"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "getLatestDBVersion :: the device list size is:: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mDeviceList:Lorg/cybergarage/upnp/DeviceList;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 908
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mDeviceList:Lorg/cybergarage/upnp/DeviceList;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v19

    move/from16 v0, v19

    if-ge v7, v0, :cond_7

    .line 909
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mDeviceList:Lorg/cybergarage/upnp/DeviceList;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v7}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v19

    const-string v20, "GetRulesDBVersion"

    invoke-virtual/range {v19 .. v20}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v2

    .line 910
    .local v2, "action":Lorg/cybergarage/upnp/Action;
    invoke-virtual {v2}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v13

    .line 911
    .local v13, "responseXML":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mDeviceList:Lorg/cybergarage/upnp/DeviceList;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v7}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v19

    const-string v20, "GetRulesDBPath"

    invoke-virtual/range {v19 .. v20}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v3

    .line 912
    .local v3, "action1":Lorg/cybergarage/upnp/Action;
    invoke-virtual {v3}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v6

    .line 914
    .local v6, "dbPathResponseXML":Ljava/lang/String;
    if-eqz v13, :cond_5

    const-string v19, "app_error"

    move-object/from16 v0, v19

    invoke-virtual {v13, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_5

    if-eqz v6, :cond_5

    .line 915
    new-instance v9, Lcom/belkin/upnp/parser/Parser;

    invoke-direct {v9}, Lcom/belkin/upnp/parser/Parser;-><init>()V

    .line 916
    .local v9, "parseResponse":Lcom/belkin/upnp/parser/Parser;
    const/16 v19, 0xd

    move-object/from16 v0, v18

    move/from16 v1, v19

    invoke-virtual {v9, v0, v1, v13}, Lcom/belkin/upnp/parser/Parser;->uPnPResponseParser(Ljava/lang/Object;ILjava/lang/String;)V

    .line 917
    const/16 v19, 0xc

    move/from16 v0, v19

    invoke-virtual {v9, v14, v0, v6}, Lcom/belkin/upnp/parser/Parser;->uPnPResponseParser(Ljava/lang/Object;ILjava/lang/String;)V

    .line 918
    if-eqz v18, :cond_0

    .line 919
    invoke-virtual/range {v18 .. v18}, Lcom/belkin/rules/beans/RulesDBVersionResponseBean;->getStrRulesDBVersion()Ljava/lang/String;

    move-result-object v17

    .line 923
    :cond_0
    const-string v19, ""

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_3

    .line 924
    const/4 v11, 0x0

    .line 927
    .local v11, "respDBVersion":I
    :goto_1
    const-string v19, ""

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_4

    .line 928
    const/16 v16, 0x0

    .line 931
    .local v16, "tempDBVersion":I
    :goto_2
    const-string v19, ""

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_1

    move/from16 v0, v16

    if-ge v11, v0, :cond_2

    .line 932
    :cond_1
    move-object/from16 v12, v17

    .line 908
    :cond_2
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_0

    .line 926
    .end local v11    # "respDBVersion":I
    .end local v16    # "tempDBVersion":I
    :cond_3
    invoke-static {v12}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v11

    .restart local v11    # "respDBVersion":I
    goto :goto_1

    .line 930
    :cond_4
    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v16

    .restart local v16    # "tempDBVersion":I
    goto :goto_2

    .line 935
    .end local v9    # "parseResponse":Lcom/belkin/upnp/parser/Parser;
    .end local v11    # "respDBVersion":I
    .end local v16    # "tempDBVersion":I
    :cond_5
    const/4 v5, 0x0

    .line 956
    .end local v2    # "action":Lorg/cybergarage/upnp/Action;
    .end local v3    # "action1":Lorg/cybergarage/upnp/Action;
    .end local v6    # "dbPathResponseXML":Ljava/lang/String;
    .end local v13    # "responseXML":Ljava/lang/String;
    :cond_6
    :goto_3
    return-object v5

    .line 938
    :cond_7
    if-eqz v12, :cond_9

    const-string v19, ""

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_9

    .line 939
    invoke-virtual {v15}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getDBVersion()Ljava/lang/String;

    move-result-object v8

    .line 940
    .local v8, "localDBVer":Ljava/lang/String;
    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    .line 941
    .local v4, "currVer":I
    const-string v19, "UpnpDeviceList"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Local DB Version --- "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 942
    invoke-static {v12}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    .line 943
    .local v10, "resVer":I
    const-string v19, "UpnpDeviceList"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Remote DB Version --- "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 944
    if-ge v4, v10, :cond_8

    .line 945
    sget-object v19, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v20, "Download and use the plugin db"

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 946
    invoke-virtual {v14}, Lcom/belkin/rules/beans/RulesDBPathResponseBean;->getStrRulesDBPath()Ljava/lang/String;

    move-result-object v5

    .line 947
    .local v5, "dbPath":Ljava/lang/String;
    if-eqz v5, :cond_6

    .line 948
    invoke-virtual {v15, v12}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setDBVersion(Ljava/lang/String;)V

    goto :goto_3

    .line 951
    .end local v5    # "dbPath":Ljava/lang/String;
    :cond_8
    if-lt v4, v10, :cond_9

    .line 952
    sget-object v19, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v20, "Use the local db"

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 953
    const-string v5, "Use local DB"

    goto :goto_3

    .line 956
    .end local v4    # "currVer":I
    .end local v8    # "localDBVer":Ljava/lang/String;
    .end local v10    # "resVer":I
    :cond_9
    const/4 v5, 0x0

    goto :goto_3
.end method

.method public getLedDeviceStatus(Ljava/lang/String;)Lorg/json/JSONArray;
    .locals 10
    .param p1, "devids"    # Ljava/lang/String;

    .prologue
    .line 1672
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v7

    invoke-virtual {v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v1

    .line 1673
    .local v1, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    const-string v5, ""

    .line 1674
    .local v5, "getStatusResponse":Ljava/lang/String;
    new-instance v4, Lorg/json/JSONArray;

    invoke-direct {v4}, Lorg/json/JSONArray;-><init>()V

    .line 1675
    .local v4, "getLeddevices":Lorg/json/JSONArray;
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v7

    invoke-virtual {v7}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v7

    if-ge v6, v7, :cond_1

    .line 1676
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v7

    invoke-virtual {v7, v6}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v7

    invoke-virtual {v7}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v7

    const-string v8, "Bridge"

    invoke-virtual {v7, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 1677
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v7

    invoke-virtual {v7, v6}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v7

    invoke-virtual {v7}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    .line 1675
    :cond_0
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 1682
    :cond_1
    :try_start_0
    const-string v7, "UpnpDeviceList"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "device ID getled***"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "--"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1683
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    invoke-virtual {v1, v7}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v7

    const-string v8, "GetDeviceStatus"

    invoke-virtual {v7, v8}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 1684
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    sget-object v7, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->ARGS_DEVICEIDS:[Ljava/lang/String;

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/String;

    const/4 v9, 0x0

    aput-object p1, v8, v9

    invoke-direct {p0, v0, v7, v8}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 1685
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v5

    .line 1686
    const-string v7, "UpnpDeviceList"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "get led devices status ===+"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1687
    if-eqz v5, :cond_2

    .line 1688
    new-instance v3, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;

    invoke-direct {v3}, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;-><init>()V

    .line 1689
    .local v3, "getDevicesStatusResp":Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;
    invoke-virtual {v3, v5}, Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;->parseForDeviceListStatus(Ljava/lang/String;)Lorg/json/JSONArray;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 1695
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v3    # "getDevicesStatusResp":Lcom/belkin/upnp/parser/GetDeviceListStatusResponse;
    :cond_2
    :goto_1
    const-string v7, "UpnpDeviceList"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "json array of getleddevice status:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1696
    return-object v4

    .line 1692
    :catch_0
    move-exception v2

    .line 1693
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method public getMacAddress(Lorg/cybergarage/upnp/Device;)Ljava/lang/String;
    .locals 7
    .param p1, "device"    # Lorg/cybergarage/upnp/Device;

    .prologue
    .line 3631
    const-string v2, ""

    .line 3632
    .local v2, "macAddress":Ljava/lang/String;
    const-string v4, "GetMetaInfo"

    invoke-virtual {p1, v4}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 3633
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v3

    .line 3634
    .local v3, "metaDataRespose":Ljava/lang/String;
    new-instance v1, Lcom/belkin/beans/MetaDataResponseBean;

    invoke-direct {v1}, Lcom/belkin/beans/MetaDataResponseBean;-><init>()V

    .line 3635
    .local v1, "mMetadataResponce":Lcom/belkin/beans/MetaDataResponseBean;
    if-eqz v3, :cond_0

    const-string v4, "app_error"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 3636
    invoke-virtual {v1, v3}, Lcom/belkin/beans/MetaDataResponseBean;->setMetadata(Ljava/lang/String;)V

    .line 3637
    iget-object v4, v1, Lcom/belkin/beans/MetaDataResponseBean;->strMacAddress:Ljava/lang/String;

    const-string v5, ">"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 3638
    iget-object v4, v1, Lcom/belkin/beans/MetaDataResponseBean;->strMacAddress:Ljava/lang/String;

    iget-object v5, v1, Lcom/belkin/beans/MetaDataResponseBean;->strMacAddress:Ljava/lang/String;

    const-string v6, ">"

    invoke-virtual {v5, v6}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v5

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 3642
    :cond_0
    :goto_0
    return-object v2

    .line 3640
    :cond_1
    iget-object v2, v1, Lcom/belkin/beans/MetaDataResponseBean;->strMacAddress:Ljava/lang/String;

    goto :goto_0
.end method

.method public getMacAddressByUDN(Ljava/lang/String;)Ljava/lang/String;
    .locals 11
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 3653
    iget-object v8, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v8}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v8

    invoke-virtual {v8}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v1

    .line 3654
    .local v1, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    invoke-virtual {v1, p1}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v2

    .line 3655
    .local v2, "device":Lorg/cybergarage/upnp/Device;
    const-string v5, ""

    .line 3656
    .local v5, "macAddress":Ljava/lang/String;
    const-string v8, "GetMetaInfo"

    invoke-virtual {v2, v8}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 3657
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v6

    .line 3658
    .local v6, "metaDataRespose":Ljava/lang/String;
    new-instance v4, Lcom/belkin/beans/MetaDataResponseBean;

    invoke-direct {v4}, Lcom/belkin/beans/MetaDataResponseBean;-><init>()V

    .line 3659
    .local v4, "mMetadataResponce":Lcom/belkin/beans/MetaDataResponseBean;
    if-eqz v6, :cond_0

    const-string v8, "app_error"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 3660
    invoke-virtual {v4, v6}, Lcom/belkin/beans/MetaDataResponseBean;->setMetadata(Ljava/lang/String;)V

    .line 3661
    iget-object v8, v4, Lcom/belkin/beans/MetaDataResponseBean;->strMacAddress:Ljava/lang/String;

    const-string v9, ">"

    invoke-virtual {v8, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 3662
    iget-object v8, v4, Lcom/belkin/beans/MetaDataResponseBean;->strMacAddress:Ljava/lang/String;

    iget-object v9, v4, Lcom/belkin/beans/MetaDataResponseBean;->strMacAddress:Ljava/lang/String;

    const-string v10, ">"

    invoke-virtual {v9, v10}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v9

    add-int/lit8 v9, v9, 0x1

    invoke-virtual {v8, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    .line 3666
    :cond_0
    :goto_0
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    .line 3667
    .local v7, "output":Ljava/lang/StringBuffer;
    const/4 v3, 0x1

    .local v3, "i":I
    :goto_1
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v8

    if-gt v3, v8, :cond_3

    .line 3668
    add-int/lit8 v8, v3, -0x1

    invoke-virtual {v5, v8}, Ljava/lang/String;->charAt(I)C

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 3669
    rem-int/lit8 v8, v3, 0x2

    if-nez v8, :cond_1

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v8

    if-ge v3, v8, :cond_1

    .line 3670
    const-string v8, ":"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 3667
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 3664
    .end local v3    # "i":I
    .end local v7    # "output":Ljava/lang/StringBuffer;
    :cond_2
    iget-object v5, v4, Lcom/belkin/beans/MetaDataResponseBean;->strMacAddress:Ljava/lang/String;

    goto :goto_0

    .line 3674
    .restart local v3    # "i":I
    .restart local v7    # "output":Ljava/lang/StringBuffer;
    :cond_3
    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    return-object v8
.end method

.method public getMacAddresswithColon(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "macAddress"    # Ljava/lang/String;

    .prologue
    .line 3678
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 3679
    .local v1, "output":Ljava/lang/StringBuffer;
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-gt v0, v2, :cond_1

    .line 3680
    add-int/lit8 v2, v0, -0x1

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 3681
    rem-int/lit8 v2, v0, 0x2

    if-nez v2, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 3682
    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 3679
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 3685
    :cond_1
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public getMakerFirmwareVersion(Ljava/lang/String;)Z
    .locals 14
    .param p1, "udn"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 2557
    new-instance v9, Lcom/belkin/utils/RuleUtility;

    iget-object v11, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-direct {v9, v11}, Lcom/belkin/utils/RuleUtility;-><init>(Landroid/content/Context;)V

    .line 2558
    .local v9, "ruleUtility":Lcom/belkin/utils/RuleUtility;
    iget-object v11, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v11}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v11

    invoke-virtual {v11}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v2

    .line 2559
    .local v2, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    invoke-virtual {v2}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v11

    iput-object v11, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mDeviceList:Lorg/cybergarage/upnp/DeviceList;

    .line 2561
    :try_start_0
    invoke-virtual {v2, p1}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v6

    .line 2562
    .local v6, "localDevice":Lorg/cybergarage/upnp/Device;
    invoke-virtual {v6}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v10

    .line 2563
    .local v10, "type":Ljava/lang/String;
    const-string v11, "GetFirmwareVersion"

    invoke-virtual {v6, v11}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 2564
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v8

    .line 2565
    .local v8, "response":Ljava/lang/String;
    if-eqz v8, :cond_0

    .line 2566
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->getOutputArgumentList()Lorg/cybergarage/upnp/ArgumentList;

    move-result-object v1

    .line 2567
    .local v1, "argumentList":Lorg/cybergarage/upnp/ArgumentList;
    const/4 v5, 0x0

    .local v5, "k":I
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ArgumentList;->size()I

    move-result v11

    if-ge v5, v11, :cond_0

    .line 2568
    invoke-virtual {v1, v5}, Lorg/cybergarage/upnp/ArgumentList;->getArgument(I)Lorg/cybergarage/upnp/Argument;

    move-result-object v11

    invoke-virtual {v11}, Lorg/cybergarage/upnp/Argument;->getValue()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v11

    const-string v12, "\\|"

    invoke-virtual {v11, v12}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    .line 2569
    .local v7, "respStrings":[Ljava/lang/String;
    new-instance v11, Lorg/json/JSONObject;

    invoke-direct {v11}, Lorg/json/JSONObject;-><init>()V

    iput-object v11, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    .line 2570
    const/4 v11, 0x0

    aget-object v11, v7, v11

    invoke-virtual {v11}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v11

    const-string v12, ":"

    invoke-virtual {v11, v12}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 2571
    .local v4, "firmware":[Ljava/lang/String;
    const-string v11, "UpnpDeviceList"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "FirmWare : "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const/4 v13, 0x1

    aget-object v13, v4, v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " : UDN - "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v6}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2572
    const/4 v11, 0x1

    aget-object v11, v4, v11

    invoke-virtual {v9, v11, v10}, Lcom/belkin/utils/RuleUtility;->firmwareSupportMakerRule(Ljava/lang/String;Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v11

    .line 2578
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "argumentList":Lorg/cybergarage/upnp/ArgumentList;
    .end local v4    # "firmware":[Ljava/lang/String;
    .end local v5    # "k":I
    .end local v6    # "localDevice":Lorg/cybergarage/upnp/Device;
    .end local v7    # "respStrings":[Ljava/lang/String;
    .end local v8    # "response":Ljava/lang/String;
    .end local v10    # "type":Ljava/lang/String;
    :goto_0
    return v11

    .line 2575
    :catch_0
    move-exception v3

    .line 2576
    .local v3, "e":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    .line 2578
    .end local v3    # "e":Ljava/lang/Exception;
    :cond_0
    const/4 v11, 0x1

    goto :goto_0
.end method

.method public getMotionNotifyFirmwareVersionByUDN(Ljava/lang/String;)Z
    .locals 14
    .param p1, "udn"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x1

    .line 2620
    new-instance v9, Lcom/belkin/utils/RuleUtility;

    iget-object v11, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-direct {v9, v11}, Lcom/belkin/utils/RuleUtility;-><init>(Landroid/content/Context;)V

    .line 2622
    .local v9, "ruleUtility":Lcom/belkin/utils/RuleUtility;
    iget-object v11, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v11}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v11

    invoke-virtual {v11}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v2

    .line 2623
    .local v2, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    invoke-virtual {v2}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v11

    iput-object v11, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mDeviceList:Lorg/cybergarage/upnp/DeviceList;

    .line 2625
    :try_start_0
    const-string v11, "UpnpDeviceList"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "version udn::::"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2626
    invoke-virtual {v2, p1}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v6

    .line 2627
    .local v6, "localDevice":Lorg/cybergarage/upnp/Device;
    if-eqz v6, :cond_0

    .line 2629
    const-string v11, "GetFirmwareVersion"

    invoke-virtual {v6, v11}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 2630
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v8

    .line 2631
    .local v8, "response":Ljava/lang/String;
    if-eqz v8, :cond_0

    .line 2632
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->getOutputArgumentList()Lorg/cybergarage/upnp/ArgumentList;

    move-result-object v1

    .line 2633
    .local v1, "argumentList":Lorg/cybergarage/upnp/ArgumentList;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lorg/cybergarage/upnp/ArgumentList;->size()I

    move-result v11

    if-lez v11, :cond_0

    .line 2635
    const/4 v11, 0x0

    invoke-virtual {v1, v11}, Lorg/cybergarage/upnp/ArgumentList;->getArgument(I)Lorg/cybergarage/upnp/Argument;

    move-result-object v11

    invoke-virtual {v11}, Lorg/cybergarage/upnp/Argument;->getValue()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v11

    const-string v12, "\\|"

    invoke-virtual {v11, v12}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    .line 2636
    .local v7, "respStrings":[Ljava/lang/String;
    new-instance v11, Lorg/json/JSONObject;

    invoke-direct {v11}, Lorg/json/JSONObject;-><init>()V

    iput-object v11, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    .line 2637
    const/4 v11, 0x0

    aget-object v11, v7, v11

    invoke-virtual {v11}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v11

    const-string v12, ":"

    invoke-virtual {v11, v12}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 2638
    .local v4, "firmware":[Ljava/lang/String;
    const-string v11, "UpnpDeviceList"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "FirmWare : "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const/4 v13, 0x1

    aget-object v13, v4, v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " : UDN - "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v6}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2639
    const/4 v11, 0x1

    aget-object v11, v4, v11

    invoke-virtual {v9, v11}, Lcom/belkin/utils/RuleUtility;->isFirmwareValidForMotionNotify(Ljava/lang/String;)Z

    move-result v5

    .line 2640
    .local v5, "fw":Z
    const-string v11, "UpnpDeviceList"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "fw : "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2649
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "argumentList":Lorg/cybergarage/upnp/ArgumentList;
    .end local v4    # "firmware":[Ljava/lang/String;
    .end local v5    # "fw":Z
    .end local v6    # "localDevice":Lorg/cybergarage/upnp/Device;
    .end local v7    # "respStrings":[Ljava/lang/String;
    .end local v8    # "response":Ljava/lang/String;
    :goto_0
    return v5

    .line 2645
    :catch_0
    move-exception v3

    .line 2646
    .local v3, "e":Ljava/lang/Exception;
    const-string v11, "UpnpDeviceList"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "getSOFirmwareVersionByUDN Exception: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v3}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2648
    .end local v3    # "e":Ljava/lang/Exception;
    :cond_0
    const-string v11, "UpnpDeviceList"

    const-string v12, "getSOFirmwareVersionByUDN returning default"

    invoke-static {v11, v12}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    move v5, v10

    .line 2649
    goto :goto_0
.end method

.method public getNightLightStatus([Ljava/lang/String;)Ljava/lang/String;
    .locals 11
    .param p1, "argList"    # [Ljava/lang/String;

    .prologue
    .line 4271
    :try_start_0
    const-string v2, "0"

    .line 4272
    .local v2, "argumentValueStr":Ljava/lang/String;
    iget-object v8, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v8}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v8

    invoke-virtual {v8}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v3

    .line 4273
    .local v3, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    const/4 v8, 0x0

    aget-object v8, p1, v8

    invoke-virtual {v3, v8}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v4

    .line 4274
    .local v4, "device":Lorg/cybergarage/upnp/Device;
    const-string v8, "GetNightLightStatus"

    invoke-virtual {v4, v8}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 4275
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v7

    .line 4276
    .local v7, "response":Ljava/lang/String;
    const-string v8, "UpnpDeviceList"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "GET NIGHT LIGHT STATUS :: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 4277
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->getOutputArgumentList()Lorg/cybergarage/upnp/ArgumentList;

    move-result-object v1

    .line 4278
    .local v1, "argumentList":Lorg/cybergarage/upnp/ArgumentList;
    const/4 v6, 0x0

    .local v6, "k":I
    :goto_0
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ArgumentList;->size()I

    move-result v8

    if-ge v6, v8, :cond_0

    .line 4279
    invoke-virtual {v1, v6}, Lorg/cybergarage/upnp/ArgumentList;->getArgument(I)Lorg/cybergarage/upnp/Argument;

    move-result-object v8

    invoke-virtual {v8}, Lorg/cybergarage/upnp/Argument;->getValue()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 4280
    if-eqz v2, :cond_1

    .line 4288
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "argumentList":Lorg/cybergarage/upnp/ArgumentList;
    .end local v2    # "argumentValueStr":Ljava/lang/String;
    .end local v3    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .end local v4    # "device":Lorg/cybergarage/upnp/Device;
    .end local v6    # "k":I
    .end local v7    # "response":Ljava/lang/String;
    :cond_0
    :goto_1
    return-object v2

    .line 4278
    .restart local v0    # "action":Lorg/cybergarage/upnp/Action;
    .restart local v1    # "argumentList":Lorg/cybergarage/upnp/ArgumentList;
    .restart local v2    # "argumentValueStr":Ljava/lang/String;
    .restart local v3    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .restart local v4    # "device":Lorg/cybergarage/upnp/Device;
    .restart local v6    # "k":I
    .restart local v7    # "response":Ljava/lang/String;
    :cond_1
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 4285
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "argumentList":Lorg/cybergarage/upnp/ArgumentList;
    .end local v2    # "argumentValueStr":Ljava/lang/String;
    .end local v3    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .end local v4    # "device":Lorg/cybergarage/upnp/Device;
    .end local v6    # "k":I
    .end local v7    # "response":Ljava/lang/String;
    :catch_0
    move-exception v5

    .line 4286
    .local v5, "exception":Ljava/lang/Exception;
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V

    .line 4287
    const-string v8, "UpnpDeviceList"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "GET NIGHT LIGHT STATUS :: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 4288
    const-string v2, "0"

    goto :goto_1
.end method

.method public getPIRSensorList()Lorg/json/JSONArray;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 1212
    new-instance v5, Lorg/json/JSONArray;

    invoke-direct {v5}, Lorg/json/JSONArray;-><init>()V

    .line 1213
    .local v5, "pirSensorDevices":Lorg/json/JSONArray;
    iget-object v8, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonBridgeArray:Lorg/json/JSONArray;

    if-eqz v8, :cond_1

    iget-object v8, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonBridgeArray:Lorg/json/JSONArray;

    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    move-result v8

    if-lez v8, :cond_1

    .line 1214
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    iget-object v8, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonBridgeArray:Lorg/json/JSONArray;

    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    move-result v8

    if-ge v3, v8, :cond_1

    .line 1215
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 1216
    .local v0, "bridgeJsonObject":Lorg/json/JSONObject;
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    .line 1218
    .local v7, "tempObject":Lorg/json/JSONObject;
    iget-object v8, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonBridgeArray:Lorg/json/JSONArray;

    invoke-virtual {v8, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    .line 1219
    invoke-virtual {v7}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1220
    .local v2, "groupId":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_0

    const-string v8, "GroupID"

    invoke-virtual {v2, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 1222
    const-string v8, "ModelCode"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1223
    .local v4, "modelCode":Ljava/lang/String;
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_0

    const-string v8, "F7C041"

    invoke-virtual {v4, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 1224
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ":"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "DeviceID"

    invoke-virtual {v7, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 1225
    .local v6, "subDeviceID":Ljava/lang/String;
    const-string v8, "FriendlyName"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1226
    .local v1, "friendlyName":Ljava/lang/String;
    const-string v8, "friendlyName"

    invoke-virtual {v0, v8, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1227
    const-string v8, "udn"

    invoke-virtual {v0, v8, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1228
    const-string v8, "bridgeudn"

    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    invoke-virtual {v0, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1229
    const-string v8, "ProductName"

    invoke-static {v4}, Lcom/belkin/wemo/cache/utils/WemoUtils;->getProductName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1230
    invoke-virtual {v5, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 1214
    .end local v1    # "friendlyName":Ljava/lang/String;
    .end local v4    # "modelCode":Ljava/lang/String;
    .end local v6    # "subDeviceID":Ljava/lang/String;
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    .line 1235
    .end local v0    # "bridgeJsonObject":Lorg/json/JSONObject;
    .end local v2    # "groupId":Ljava/lang/String;
    .end local v3    # "i":I
    .end local v7    # "tempObject":Lorg/json/JSONObject;
    :cond_1
    const-string v8, "UpnpDeviceList"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "PIR Sensor Devices**"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1239
    return-object v5
.end method

.method public getPragmaFromDB(Landroid/content/Context;)Ljava/lang/String;
    .locals 5
    .param p1, "mContext"    # Landroid/content/Context;

    .prologue
    .line 963
    const-string v1, ""

    .line 964
    .local v1, "pragmaUserVersion":Ljava/lang/String;
    new-instance v2, Lcom/belkin/utils/RuleUtility;

    invoke-direct {v2, p1}, Lcom/belkin/utils/RuleUtility;-><init>(Landroid/content/Context;)V

    .line 966
    .local v2, "ruleUtility":Lcom/belkin/utils/RuleUtility;
    :try_start_0
    invoke-virtual {v2}, Lcom/belkin/utils/RuleUtility;->getPragmaVersion()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 970
    :goto_0
    return-object v1

    .line 967
    :catch_0
    move-exception v0

    .line 968
    .local v0, "excep":Ljava/lang/Exception;
    const-string v3, "getPragmaFromDB"

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public getRegistrationData()Lorg/json/JSONObject;
    .locals 6

    .prologue
    .line 4292
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    .line 4293
    const/4 v3, 0x1

    new-array v2, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    invoke-direct {p0}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getRegistrationDataArgs()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    .line 4295
    .local v2, "registrationDataArg":[Ljava/lang/String;
    :try_start_0
    const-string v3, "UpnpDeviceList"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "getRegistrationData before MDevice:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mDevice:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " hash: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mDevice:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v5}, Ljava/lang/Object;->hashCode()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " this: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 4297
    invoke-direct {p0}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->printDeviceList()V

    .line 4299
    iget-object v3, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mDevice:Lorg/cybergarage/upnp/Device;

    const-string v4, "GetRegistrationData"

    invoke-virtual {v3, v4}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 4300
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    sget-object v3, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->SET_REGISTRATION_DATA_ARGS:[Ljava/lang/String;

    invoke-direct {p0, v0, v3, v2}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 4301
    iget-object v3, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    invoke-direct {p0, v0, v3}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->sendSmartSetupRequest(Lorg/cybergarage/upnp/Action;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v3

    iput-object v3, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 4306
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    :goto_0
    iget-object v3, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    return-object v3

    .line 4303
    :catch_0
    move-exception v1

    .line 4304
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public getRegistrationStatus()Lorg/json/JSONObject;
    .locals 6

    .prologue
    const/4 v2, 0x0

    .line 4310
    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    .line 4312
    :try_start_0
    const-string v3, "UpnpDeviceList"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "getRegistrationStatus before MDevice:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mDevice:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " hash: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mDevice:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v5}, Ljava/lang/Object;->hashCode()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " this: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 4314
    invoke-direct {p0}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->printDeviceList()V

    .line 4316
    iget-object v3, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mDevice:Lorg/cybergarage/upnp/Device;

    const-string v4, "GetRegistrationStatus"

    invoke-virtual {v3, v4}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 4318
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    const-string v3, "UpnpDeviceList"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "getRegistrationStatus after MDevice:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mDevice:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v5}, Lorg/cybergarage/upnp/Device;->getSerialNumber()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " hash: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mDevice:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v5}, Ljava/lang/Object;->hashCode()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " action: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 4319
    if-nez v0, :cond_0

    .line 4320
    const-string v3, "UpnpDeviceList"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "getRegistrationStatus MDevice:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mDevice:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v5}, Lorg/cybergarage/upnp/Device;->getSerialNumber()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " action is null, not supported FW"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 4329
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    :goto_0
    return-object v2

    .line 4324
    .restart local v0    # "action":Lorg/cybergarage/upnp/Action;
    :cond_0
    iget-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    invoke-direct {p0, v0, v2}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->sendSmartSetupRequest(Lorg/cybergarage/upnp/Action;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v2

    iput-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 4329
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    :goto_1
    iget-object v2, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    goto :goto_0

    .line 4326
    :catch_0
    move-exception v1

    .line 4327
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method public getSOFirmwareVersionByUDN(Ljava/lang/String;)Z
    .locals 14
    .param p1, "udn"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x1

    .line 2586
    new-instance v9, Lcom/belkin/utils/RuleUtility;

    iget-object v11, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-direct {v9, v11}, Lcom/belkin/utils/RuleUtility;-><init>(Landroid/content/Context;)V

    .line 2588
    .local v9, "ruleUtility":Lcom/belkin/utils/RuleUtility;
    iget-object v11, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v11}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v11

    invoke-virtual {v11}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v2

    .line 2589
    .local v2, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    invoke-virtual {v2}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v11

    iput-object v11, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mDeviceList:Lorg/cybergarage/upnp/DeviceList;

    .line 2591
    :try_start_0
    const-string v11, "UpnpDeviceList"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "version udn::::"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2592
    invoke-virtual {v2, p1}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v6

    .line 2593
    .local v6, "localDevice":Lorg/cybergarage/upnp/Device;
    if-eqz v6, :cond_0

    .line 2595
    const-string v11, "GetFirmwareVersion"

    invoke-virtual {v6, v11}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 2596
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v8

    .line 2597
    .local v8, "response":Ljava/lang/String;
    if-eqz v8, :cond_0

    .line 2598
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->getOutputArgumentList()Lorg/cybergarage/upnp/ArgumentList;

    move-result-object v1

    .line 2599
    .local v1, "argumentList":Lorg/cybergarage/upnp/ArgumentList;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lorg/cybergarage/upnp/ArgumentList;->size()I

    move-result v11

    if-lez v11, :cond_0

    .line 2601
    const/4 v11, 0x0

    invoke-virtual {v1, v11}, Lorg/cybergarage/upnp/ArgumentList;->getArgument(I)Lorg/cybergarage/upnp/Argument;

    move-result-object v11

    invoke-virtual {v11}, Lorg/cybergarage/upnp/Argument;->getValue()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v11

    const-string v12, "\\|"

    invoke-virtual {v11, v12}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    .line 2602
    .local v7, "respStrings":[Ljava/lang/String;
    new-instance v11, Lorg/json/JSONObject;

    invoke-direct {v11}, Lorg/json/JSONObject;-><init>()V

    iput-object v11, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    .line 2603
    const/4 v11, 0x0

    aget-object v11, v7, v11

    invoke-virtual {v11}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v11

    const-string v12, ":"

    invoke-virtual {v11, v12}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 2604
    .local v4, "firmware":[Ljava/lang/String;
    const-string v11, "UpnpDeviceList"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "FirmWare : "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const/4 v13, 0x1

    aget-object v13, v4, v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " : UDN - "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v6}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2605
    const/4 v11, 0x1

    aget-object v11, v4, v11

    invoke-virtual {v9, v11}, Lcom/belkin/utils/RuleUtility;->isFirmwareValidForSO(Ljava/lang/String;)Z

    move-result v5

    .line 2606
    .local v5, "fw":Z
    const-string v11, "UpnpDeviceList"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "fw : "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2615
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "argumentList":Lorg/cybergarage/upnp/ArgumentList;
    .end local v4    # "firmware":[Ljava/lang/String;
    .end local v5    # "fw":Z
    .end local v6    # "localDevice":Lorg/cybergarage/upnp/Device;
    .end local v7    # "respStrings":[Ljava/lang/String;
    .end local v8    # "response":Ljava/lang/String;
    :goto_0
    return v5

    .line 2611
    :catch_0
    move-exception v3

    .line 2612
    .local v3, "e":Ljava/lang/Exception;
    const-string v11, "UpnpDeviceList"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "getSOFirmwareVersionByUDN Exception: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v3}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2614
    .end local v3    # "e":Ljava/lang/Exception;
    :cond_0
    const-string v11, "UpnpDeviceList"

    const-string v12, "getSOFirmwareVersionByUDN returning default"

    invoke-static {v11, v12}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    move v5, v10

    .line 2615
    goto :goto_0
.end method

.method public getSignalStrenght(Lorg/cybergarage/upnp/Device;)Ljava/lang/String;
    .locals 10
    .param p1, "device"    # Lorg/cybergarage/upnp/Device;

    .prologue
    .line 3719
    const-string v2, ""

    .line 3720
    .local v2, "mSignalStrength":Ljava/lang/String;
    invoke-virtual {p1}, Lorg/cybergarage/upnp/Device;->getServiceList()Lorg/cybergarage/upnp/ServiceList;

    move-result-object v6

    .line 3721
    .local v6, "serviceList":Lorg/cybergarage/upnp/ServiceList;
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_0
    invoke-virtual {v6}, Lorg/cybergarage/upnp/ServiceList;->size()I

    move-result v7

    if-ge v1, v7, :cond_1

    .line 3722
    invoke-virtual {v6, v1}, Lorg/cybergarage/upnp/ServiceList;->getService(I)Lorg/cybergarage/upnp/Service;

    move-result-object v7

    const-string v8, "GetSignalStrength"

    invoke-virtual {v7, v8}, Lorg/cybergarage/upnp/Service;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 3723
    .local v0, "actionPost":Lorg/cybergarage/upnp/Action;
    if-eqz v0, :cond_0

    .line 3724
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v3

    .line 3725
    .local v3, "mSignalStrengthResponse":Ljava/lang/String;
    if-eqz v3, :cond_0

    .line 3726
    new-instance v5, Lcom/belkin/beans/SignalStrengthResponseBean;

    invoke-direct {v5}, Lcom/belkin/beans/SignalStrengthResponseBean;-><init>()V

    .line 3727
    .local v5, "respObject":Lcom/belkin/beans/SignalStrengthResponseBean;
    new-instance v4, Lcom/belkin/upnp/parser/Parser;

    invoke-direct {v4}, Lcom/belkin/upnp/parser/Parser;-><init>()V

    .line 3728
    .local v4, "parseResponse":Lcom/belkin/upnp/parser/Parser;
    const/16 v7, 0xe

    invoke-virtual {v4, v5, v7, v3}, Lcom/belkin/upnp/parser/Parser;->uPnPResponseParser(Ljava/lang/Object;ILjava/lang/String;)V

    .line 3729
    if-eqz v5, :cond_0

    invoke-virtual {v5}, Lcom/belkin/beans/SignalStrengthResponseBean;->getSignalStrength()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_0

    .line 3730
    invoke-virtual {v5}, Lcom/belkin/beans/SignalStrengthResponseBean;->getSignalStrength()Ljava/lang/String;

    move-result-object v2

    .line 3731
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, " signal strength is ***************   "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 3721
    .end local v3    # "mSignalStrengthResponse":Ljava/lang/String;
    .end local v4    # "parseResponse":Lcom/belkin/upnp/parser/Parser;
    .end local v5    # "respObject":Lcom/belkin/beans/SignalStrengthResponseBean;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 3736
    .end local v0    # "actionPost":Lorg/cybergarage/upnp/Action;
    :cond_1
    return-object v2
.end method

.method public getStringFromResponse(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "response"    # Ljava/lang/String;
    .param p2, "attrib"    # Ljava/lang/String;

    .prologue
    .line 3984
    new-instance v0, Lcom/belkin/upnp/parser/Parser;

    invoke-direct {v0}, Lcom/belkin/upnp/parser/Parser;-><init>()V

    .line 3985
    .local v0, "parseResponse":Lcom/belkin/upnp/parser/Parser;
    new-instance v1, Lcom/belkin/beans/ValueFromSoapResponse;

    invoke-direct {v1}, Lcom/belkin/beans/ValueFromSoapResponse;-><init>()V

    .line 3986
    .local v1, "verRespObject":Lcom/belkin/beans/ValueFromSoapResponse;
    const/16 v2, 0x10

    invoke-virtual {v0, v1, v2, p1, p2}, Lcom/belkin/upnp/parser/Parser;->uPnPResponseParserSOAP(Ljava/lang/Object;ILjava/lang/String;Ljava/lang/String;)V

    .line 3987
    invoke-virtual {v1}, Lcom/belkin/beans/ValueFromSoapResponse;->getStrValue()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public getWeMoDeviceList()Lorg/json/JSONObject;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Lcom/belkin/exception/DatabaseException;
        }
    .end annotation

    .prologue
    .line 285
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    iput-object v3, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    .line 287
    iget-object v3, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v0

    .line 291
    .local v0, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    iget-object v3, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mDeviceList:Lorg/cybergarage/upnp/DeviceList;

    invoke-virtual {v3}, Lorg/cybergarage/upnp/DeviceList;->clear()V

    .line 292
    invoke-virtual {v0}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v3

    iput-object v3, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mDeviceList:Lorg/cybergarage/upnp/DeviceList;

    .line 293
    const-string v3, "UpnpDeviceList"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "JSONArray getWeMoDeviceList() :: Size() "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mDeviceList:Lorg/cybergarage/upnp/DeviceList;

    invoke-virtual {v5}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 294
    iget-object v3, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mDeviceList:Lorg/cybergarage/upnp/DeviceList;

    invoke-virtual {v3}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v3

    if-lez v3, :cond_1

    .line 295
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 296
    .local v2, "tempDeviceList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v3, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mDeviceList:Lorg/cybergarage/upnp/DeviceList;

    invoke-virtual {v3}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v3

    if-ge v1, v3, :cond_0

    .line 297
    iget-object v3, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mDeviceList:Lorg/cybergarage/upnp/DeviceList;

    invoke-virtual {v3, v1}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v3

    invoke-virtual {v3}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 296
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 299
    :cond_0
    iget-object v3, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    const-string v4, "deviceUdnList"

    invoke-virtual {v3, v4, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 301
    .end local v1    # "i":I
    .end local v2    # "tempDeviceList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_1
    iget-object v3, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    return-object v3
.end method

.method public getWeMoSSID(Ljava/lang/String;)Ljava/lang/String;
    .locals 11
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 791
    :try_start_0
    iget-object v8, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v8}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v8

    invoke-virtual {v8}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v1

    .line 793
    .local v1, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    invoke-virtual {v1, p1}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v8

    const-string v9, "GetMetaInfo"

    invoke-virtual {v8, v9}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 794
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    const-string v8, "UpnpDeviceList"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "getWeMoSSID :: udn is::"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " action  is::"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 796
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v7

    .line 798
    .local v7, "response":Ljava/lang/String;
    const/4 v5, 0x0

    .line 799
    .local v5, "metaParseData":Ljava/lang/String;
    const/4 v8, 0x7

    new-array v4, v8, [Ljava/lang/String;

    .line 801
    .local v4, "metaArray":[Ljava/lang/String;
    new-instance v3, Lcom/belkin/beans/MetaDataResponseBean;

    invoke-direct {v3}, Lcom/belkin/beans/MetaDataResponseBean;-><init>()V

    .line 802
    .local v3, "mMetadataResponce":Lcom/belkin/beans/MetaDataResponseBean;
    if-eqz v7, :cond_0

    const-string v8, "app_error"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 803
    new-instance v6, Lcom/belkin/upnp/parser/Parser;

    invoke-direct {v6}, Lcom/belkin/upnp/parser/Parser;-><init>()V

    .line 804
    .local v6, "parseResponse1":Lcom/belkin/upnp/parser/Parser;
    const/16 v8, 0x9

    invoke-virtual {v6, v3, v8, v7}, Lcom/belkin/upnp/parser/Parser;->uPnPResponseParser(Ljava/lang/Object;ILjava/lang/String;)V

    .line 806
    if-eqz v3, :cond_0

    .line 807
    invoke-virtual {v3}, Lcom/belkin/beans/MetaDataResponseBean;->getMetadata()Ljava/lang/String;

    move-result-object v5

    .line 808
    const-string v8, "\\|"

    invoke-virtual {v5, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 809
    const/4 v8, 0x4

    aget-object v8, v4, v8

    .line 818
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .end local v3    # "mMetadataResponce":Lcom/belkin/beans/MetaDataResponseBean;
    .end local v4    # "metaArray":[Ljava/lang/String;
    .end local v5    # "metaParseData":Ljava/lang/String;
    .end local v6    # "parseResponse1":Lcom/belkin/upnp/parser/Parser;
    .end local v7    # "response":Ljava/lang/String;
    :goto_0
    return-object v8

    .line 813
    .restart local v0    # "action":Lorg/cybergarage/upnp/Action;
    .restart local v1    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .restart local v3    # "mMetadataResponce":Lcom/belkin/beans/MetaDataResponseBean;
    .restart local v4    # "metaArray":[Ljava/lang/String;
    .restart local v5    # "metaParseData":Ljava/lang/String;
    .restart local v7    # "response":Ljava/lang/String;
    :cond_0
    const-string v8, "UpnpDeviceList"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "getWeMoSSID(String udn) :: SSID - "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const/4 v10, 0x4

    aget-object v10, v4, v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 818
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .end local v3    # "mMetadataResponce":Lcom/belkin/beans/MetaDataResponseBean;
    .end local v4    # "metaArray":[Ljava/lang/String;
    .end local v5    # "metaParseData":Ljava/lang/String;
    .end local v7    # "response":Ljava/lang/String;
    :goto_1
    const-string v8, ""

    goto :goto_0

    .line 815
    :catch_0
    move-exception v2

    .line 816
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method public isFirmwareAvailable(Ljava/lang/String;Lorg/json/JSONArray;)Z
    .locals 13
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "currentFirmwreArray"    # Lorg/json/JSONArray;

    .prologue
    .line 3250
    invoke-virtual {p0, p1}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getFirmwareDetailsList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v7

    iput-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->firmDetailsList:Ljava/util/ArrayList;

    .line 3251
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->firmDetailsList:Ljava/util/ArrayList;

    if-eqz v7, :cond_35

    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->firmDetailsList:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-lez v7, :cond_35

    if-eqz p2, :cond_35

    .line 3253
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    :try_start_0
    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-ge v5, v7, :cond_3

    .line 3254
    const-string v6, ""

    .line 3255
    .local v6, "status":Ljava/lang/String;
    invoke-virtual {p2, v5}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    .line 3256
    .local v0, "currentFirmwareVersion":Lorg/json/JSONObject;
    const-string v7, "UpnpDeviceList"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "currentFirmwareVersion:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 3257
    const-string v7, "devicefirmware"

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 3258
    .local v1, "currentPlugInVersion":Ljava/lang/String;
    if-eqz v0, :cond_34

    .line 3259
    const-string v7, "type"

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 3260
    .local v2, "deviceType":Ljava/lang/String;
    const-string v7, "type"

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "urn:Belkin:device:lightswitch:1"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 3261
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransLSFw:[Ljava/lang/String;

    if-eqz v7, :cond_1

    .line 3262
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    const-string v8, "devicefirmware"

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->lightSwitchFW:[Ljava/lang/String;

    iget-object v10, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransLSFw:[Ljava/lang/String;

    iget-object v11, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTLSFw:[Ljava/lang/String;

    invoke-virtual {v7, v8, v9, v10, v11}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareOpenWRTFirmwareForLightSwitch(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 3423
    :cond_0
    :goto_1
    if-eqz v6, :cond_34

    const-string v7, ""

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_34

    .line 3424
    const/4 v7, 0x1

    .line 3437
    .end local v0    # "currentFirmwareVersion":Lorg/json/JSONObject;
    .end local v1    # "currentPlugInVersion":Ljava/lang/String;
    .end local v2    # "deviceType":Ljava/lang/String;
    .end local v5    # "i":I
    .end local v6    # "status":Ljava/lang/String;
    :goto_2
    return v7

    .line 3264
    .restart local v0    # "currentFirmwareVersion":Lorg/json/JSONObject;
    .restart local v1    # "currentPlugInVersion":Ljava/lang/String;
    .restart local v2    # "deviceType":Ljava/lang/String;
    .restart local v5    # "i":I
    .restart local v6    # "status":Ljava/lang/String;
    :cond_1
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->lightSwitchFW:[Ljava/lang/String;

    if-eqz v7, :cond_2

    .line 3265
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    const-string v8, "devicefirmware"

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->lightSwitchFW:[Ljava/lang/String;

    iget-object v10, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->signedLightSwitchFW:[Ljava/lang/String;

    invoke-virtual {v7, v8, v9, v10}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareNEWFirmwareDataForLightSwitch(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto :goto_1

    .line 3268
    :cond_2
    const-string v7, "UpnpDeviceList"

    const-string v8, "Either openWRTTransLSFw or lightSwitchFW is null"

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_1

    .line 3428
    .end local v0    # "currentFirmwareVersion":Lorg/json/JSONObject;
    .end local v1    # "currentPlugInVersion":Ljava/lang/String;
    .end local v2    # "deviceType":Ljava/lang/String;
    .end local v6    # "status":Ljava/lang/String;
    :catch_0
    move-exception v3

    .line 3429
    .local v3, "e":Lorg/json/JSONException;
    invoke-virtual {v3}, Lorg/json/JSONException;->printStackTrace()V

    .line 3437
    .end local v3    # "e":Lorg/json/JSONException;
    .end local v5    # "i":I
    :cond_3
    :goto_3
    const/4 v7, 0x0

    goto :goto_2

    .line 3271
    .restart local v0    # "currentFirmwareVersion":Lorg/json/JSONObject;
    .restart local v1    # "currentPlugInVersion":Ljava/lang/String;
    .restart local v2    # "deviceType":Ljava/lang/String;
    .restart local v5    # "i":I
    .restart local v6    # "status":Ljava/lang/String;
    :cond_4
    :try_start_1
    const-string v7, "type"

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "urn:Belkin:device:insight:1"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_a

    .line 3273
    const-string v7, "hwVersion"

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 3275
    .local v4, "hwVersion":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_5

    const-string v7, "v1"

    invoke-virtual {v4, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_8

    .line 3277
    :cond_5
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransinsightFw:[Ljava/lang/String;

    if-eqz v7, :cond_6

    .line 3278
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    const-string v8, "devicefirmware"

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->insightFW:[Ljava/lang/String;

    iget-object v10, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransinsightFw:[Ljava/lang/String;

    iget-object v11, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTinsightFw:[Ljava/lang/String;

    invoke-virtual {v7, v8, v9, v10, v11}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareOpenWRTFirmwareForInsight(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto :goto_1

    .line 3280
    :cond_6
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->insightFW:[Ljava/lang/String;

    if-eqz v7, :cond_7

    .line 3281
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    const-string v8, "devicefirmware"

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->insightFW:[Ljava/lang/String;

    iget-object v10, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->signedInsightFW:[Ljava/lang/String;

    invoke-virtual {v7, v8, v9, v10}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareNEWFirmwareDataForInsight(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto :goto_1

    .line 3284
    :cond_7
    const-string v7, "UpnpDeviceList"

    const-string v8, "Either openWRTTransinsightFw or insightFW is null"

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto/16 :goto_1

    .line 3431
    .end local v0    # "currentFirmwareVersion":Lorg/json/JSONObject;
    .end local v1    # "currentPlugInVersion":Ljava/lang/String;
    .end local v2    # "deviceType":Ljava/lang/String;
    .end local v4    # "hwVersion":Ljava/lang/String;
    .end local v6    # "status":Ljava/lang/String;
    :catch_1
    move-exception v3

    .line 3432
    .local v3, "e":Ljava/lang/Exception;
    const-string v7, "UpnpDeviceList"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Exception while comparing the FW versions and the exception is :: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    .line 3286
    .end local v3    # "e":Ljava/lang/Exception;
    .restart local v0    # "currentFirmwareVersion":Lorg/json/JSONObject;
    .restart local v1    # "currentPlugInVersion":Ljava/lang/String;
    .restart local v2    # "deviceType":Ljava/lang/String;
    .restart local v4    # "hwVersion":Ljava/lang/String;
    .restart local v6    # "status":Ljava/lang/String;
    :cond_8
    :try_start_2
    const-string v7, "v2"

    invoke-virtual {v4, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 3288
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTInsightV2:[Ljava/lang/String;

    if-eqz v7, :cond_9

    .line 3289
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    const-string v8, "devicefirmware"

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTInsightV2:[Ljava/lang/String;

    invoke-virtual {v7, v8, v9}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareOpenWRTFirmwareForInsightV2(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_1

    .line 3292
    :cond_9
    const-string v7, "UpnpDeviceList"

    const-string v8, "openWRTInsightV2 is null"

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 3297
    .end local v4    # "hwVersion":Ljava/lang/String;
    :cond_a
    const-string v7, "type"

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "urn:Belkin:device:sensor:1"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_b

    const-string v7, "type"

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "urn:Belkin:device:controllee:1"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_14

    .line 3300
    :cond_b
    const-string v7, "WeMo_US"

    invoke-virtual {v1, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_c

    const-string v7, "WeMo_WW_1.0"

    invoke-virtual {v1, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_10

    .line 3301
    :cond_c
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTranssnsFw:[Ljava/lang/String;

    if-eqz v7, :cond_e

    .line 3302
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    iget-object v8, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->usFW:[Ljava/lang/String;

    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTranssnsFw:[Ljava/lang/String;

    iget-object v10, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTsnsFw:[Ljava/lang/String;

    invoke-virtual {v7, v1, v8, v9, v10}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareOpenWRTFirmwareForSNS(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 3322
    :cond_d
    :goto_4
    const-string v7, "UpnpDeviceList"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "the value of status is ::"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 3304
    :cond_e
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->usFW:[Ljava/lang/String;

    if-eqz v7, :cond_f

    .line 3305
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    iget-object v8, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->usFW:[Ljava/lang/String;

    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->signedUSFW:[Ljava/lang/String;

    invoke-virtual {v7, v1, v8, v9}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareNEWFirmwareDataForSwitchSensor(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto :goto_4

    .line 3308
    :cond_f
    const-string v7, "UpnpDeviceList"

    const-string v8, "Either openWRTTranssnsFw or usFW is null"

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4

    .line 3311
    :cond_10
    const-string v7, "WeMo_EU"

    invoke-virtual {v1, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_11

    const-string v7, "WeMo_WW_2.0"

    invoke-virtual {v1, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_d

    .line 3312
    :cond_11
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTranssnsFw:[Ljava/lang/String;

    if-eqz v7, :cond_12

    .line 3313
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    iget-object v8, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->euFW:[Ljava/lang/String;

    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTranssnsFw:[Ljava/lang/String;

    iget-object v10, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTsnsFw:[Ljava/lang/String;

    invoke-virtual {v7, v1, v8, v9, v10}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareOpenWRTFirmwareForSNS(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto :goto_4

    .line 3315
    :cond_12
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->euFW:[Ljava/lang/String;

    if-eqz v7, :cond_13

    .line 3316
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    iget-object v8, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->euFW:[Ljava/lang/String;

    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->signedEUFW:[Ljava/lang/String;

    invoke-virtual {v7, v1, v8, v9}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareNEWFirmwareDataForSwitchSensor(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto :goto_4

    .line 3319
    :cond_13
    const-string v7, "UpnpDeviceList"

    const-string v8, "Either openWRTTranssnsFw or euFW is null"

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4

    .line 3323
    :cond_14
    const-string v7, "type"

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "urn:Belkin:device:Crockpot:1"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_17

    .line 3325
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransSlowCookerFw:[Ljava/lang/String;

    if-eqz v7, :cond_15

    .line 3327
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    iget-object v8, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTSlowCookerFw:[Ljava/lang/String;

    const-string v9, "SlowCooker"

    invoke-virtual {v7, v1, v8, v9}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareOpenWRTFirmwareVersions(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_1

    .line 3328
    :cond_15
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->slowCookerFw:[Ljava/lang/String;

    if-eqz v7, :cond_16

    .line 3329
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    const-string v8, "devicefirmware"

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->slowCookerFw:[Ljava/lang/String;

    invoke-virtual {v7, v8, v9}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareNEWFirmwareDataForCrockpot(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_1

    .line 3332
    :cond_16
    const-string v7, "UpnpDeviceList"

    const-string v8, "crockpotFw is null"

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 3335
    :cond_17
    const-string v7, "type"

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "urn:Belkin:device:CoffeeMaker:1"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_19

    .line 3336
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransCoffeeMakerFw:[Ljava/lang/String;

    if-eqz v7, :cond_18

    .line 3337
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    iget-object v8, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTCoffeeMakerFw:[Ljava/lang/String;

    const-string v9, "CoffeeMaker"

    invoke-virtual {v7, v1, v8, v9}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareOpenWRTFirmwareVersions(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_1

    .line 3338
    :cond_18
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->cofeeMakerFw:[Ljava/lang/String;

    if-eqz v7, :cond_0

    .line 3339
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    const-string v8, "devicefirmware"

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->cofeeMakerFw:[Ljava/lang/String;

    const-string v10, "CoffeeMaker"

    invoke-virtual {v7, v8, v9, v10}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareFirmwareVersions(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_1

    .line 3342
    :cond_19
    const-string v7, "type"

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "urn:Belkin:device:Heater:1"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1a

    .line 3343
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->heaterFw:[Ljava/lang/String;

    if-eqz v7, :cond_0

    .line 3344
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    const-string v8, "devicefirmware"

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->heaterFw:[Ljava/lang/String;

    invoke-virtual {v7, v8, v9}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareNEWFirmwareDataForWeMoSmart(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_1

    .line 3346
    :cond_1a
    const-string v7, "type"

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "urn:Belkin:device:HeaterA:1"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1c

    .line 3347
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransHeaterAFw:[Ljava/lang/String;

    if-eqz v7, :cond_1b

    .line 3348
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    iget-object v8, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTHeaterAFw:[Ljava/lang/String;

    const-string v9, "HeaterA"

    invoke-virtual {v7, v1, v8, v9}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareOpenWRTFirmwareVersions(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_1

    .line 3349
    :cond_1b
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->heaterAFw:[Ljava/lang/String;

    if-eqz v7, :cond_0

    .line 3350
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    const-string v8, "devicefirmware"

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->heaterAFw:[Ljava/lang/String;

    const-string v10, "HeaterA"

    invoke-virtual {v7, v8, v9, v10}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareFirmwareVersions(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_1

    .line 3352
    :cond_1c
    const-string v7, "type"

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "urn:Belkin:device:HeaterB:1"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1e

    .line 3353
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransHeaterBFw:[Ljava/lang/String;

    if-eqz v7, :cond_1d

    .line 3354
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    iget-object v8, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTHeaterBFw:[Ljava/lang/String;

    const-string v9, "HeaterB"

    invoke-virtual {v7, v1, v8, v9}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareOpenWRTFirmwareVersions(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_1

    .line 3355
    :cond_1d
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->heaterBFw:[Ljava/lang/String;

    if-eqz v7, :cond_0

    .line 3356
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    const-string v8, "devicefirmware"

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->heaterBFw:[Ljava/lang/String;

    const-string v10, "HeaterB"

    invoke-virtual {v7, v8, v9, v10}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareFirmwareVersions(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_1

    .line 3358
    :cond_1e
    const-string v7, "type"

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "urn:Belkin:device:AirPurifier:1"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_20

    .line 3359
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransAirPurifierFw:[Ljava/lang/String;

    if-eqz v7, :cond_1f

    .line 3360
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    iget-object v8, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTAirPurifierFw:[Ljava/lang/String;

    const-string v9, "AirPurifier"

    invoke-virtual {v7, v1, v8, v9}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareOpenWRTFirmwareVersions(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_1

    .line 3361
    :cond_1f
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->airPurifierFw:[Ljava/lang/String;

    if-eqz v7, :cond_0

    .line 3362
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    const-string v8, "devicefirmware"

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->airPurifierFw:[Ljava/lang/String;

    const-string v10, "AirPurifier"

    invoke-virtual {v7, v8, v9, v10}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareFirmwareVersions(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_1

    .line 3365
    :cond_20
    const-string v7, "type"

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "urn:Belkin:device:Humidifier:1"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_22

    .line 3366
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransHumidifierFw:[Ljava/lang/String;

    if-eqz v7, :cond_21

    .line 3367
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    iget-object v8, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTHumidifierFw:[Ljava/lang/String;

    const-string v9, "Humidifier"

    invoke-virtual {v7, v1, v8, v9}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareOpenWRTFirmwareVersions(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_1

    .line 3368
    :cond_21
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->humidifierFw:[Ljava/lang/String;

    if-eqz v7, :cond_0

    .line 3369
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    const-string v8, "devicefirmware"

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->humidifierFw:[Ljava/lang/String;

    const-string v10, "Humidifier"

    invoke-virtual {v7, v8, v9, v10}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareFirmwareVersions(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_1

    .line 3371
    :cond_22
    const-string v7, "type"

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "urn:Belkin:device:HumidifierB:1"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_24

    .line 3372
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransHumidifierBFw:[Ljava/lang/String;

    if-eqz v7, :cond_23

    .line 3373
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    iget-object v8, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTHumidifierBFw:[Ljava/lang/String;

    const-string v9, "HumidifierB"

    invoke-virtual {v7, v1, v8, v9}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareOpenWRTFirmwareVersions(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_1

    .line 3374
    :cond_23
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->humidifierBFw:[Ljava/lang/String;

    if-eqz v7, :cond_0

    .line 3375
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    const-string v8, "devicefirmware"

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->humidifierFw:[Ljava/lang/String;

    const-string v10, "HumidifierB"

    invoke-virtual {v7, v8, v9, v10}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareFirmwareVersions(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_1

    .line 3377
    :cond_24
    const-string v7, "type"

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "urn:Belkin:device:bridge:1"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_26

    .line 3378
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->bridgeFW:[Ljava/lang/String;

    if-eqz v7, :cond_25

    .line 3379
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    const-string v8, "devicefirmware"

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->bridgeFW:[Ljava/lang/String;

    const/4 v10, 0x1

    aget-object v9, v9, v10

    invoke-virtual {v7, v8, v9}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareNEWFirmwareDataForBridge(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_1

    .line 3382
    :cond_25
    const-string v7, "UpnpDeviceList"

    const-string v8, "bridgeFW is null"

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 3384
    :cond_26
    const-string v7, "type"

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "MZ100"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_28

    .line 3385
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->wemobulbFw:[Ljava/lang/String;

    if-eqz v7, :cond_27

    .line 3386
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    const-string v8, "devicefirmware"

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->wemobulbFw:[Ljava/lang/String;

    const/4 v10, 0x1

    aget-object v9, v9, v10

    invoke-virtual {v7, v8, v9}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareNEWFirmwareDataForBulb(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_1

    .line 3389
    :cond_27
    const-string v7, "UpnpDeviceList"

    const-string v8, "wemobulbFw is null"

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 3391
    :cond_28
    const-string v7, "Gardenspot RGB"

    invoke-virtual {v2, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_29

    const-string v7, "LIGHTIFY Gardenspot RGB"

    invoke-virtual {v2, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2b

    .line 3392
    :cond_29
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->gardenSpotFw:[Ljava/lang/String;

    if-eqz v7, :cond_2a

    .line 3393
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    const-string v8, "devicefirmware"

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->gardenSpotFw:[Ljava/lang/String;

    const/4 v10, 0x1

    aget-object v9, v9, v10

    const-string v10, "Gardenspot RGB"

    const-string v11, "\\s+"

    const-string v12, ""

    invoke-virtual {v10, v11, v12}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v7, v8, v9, v10}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareFirmwareVersionsBulb(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_1

    .line 3396
    :cond_2a
    const-string v7, "UpnpDeviceList"

    const-string v8, "gardenSpotFw is null"

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 3399
    :cond_2b
    const-string v7, "Classic A60 TW"

    invoke-virtual {v2, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_2c

    const-string v7, "LIGHTIFY A19 Tunable White"

    invoke-virtual {v2, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2e

    .line 3400
    :cond_2c
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->tempTunableFw:[Ljava/lang/String;

    if-eqz v7, :cond_2d

    .line 3401
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    const-string v8, "devicefirmware"

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->tempTunableFw:[Ljava/lang/String;

    const/4 v10, 0x1

    aget-object v9, v9, v10

    const-string v10, "Classic A60 TW"

    const-string v11, "\\s+"

    const-string v12, ""

    invoke-virtual {v10, v11, v12}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v7, v8, v9, v10}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareFirmwareVersionsBulb(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_1

    .line 3404
    :cond_2d
    const-string v7, "UpnpDeviceList"

    const-string v8, "tempTunableFw is null"

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 3406
    :cond_2e
    const-string v7, "type"

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "urn:Belkin:device:Maker:1"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_31

    .line 3407
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTTransMakerFw:[Ljava/lang/String;

    if-eqz v7, :cond_2f

    .line 3408
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    iget-object v8, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openWRTMakerFw:[Ljava/lang/String;

    const-string v9, "Maker"

    invoke-virtual {v7, v1, v8, v9}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareOpenWRTFirmwareVersions(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_1

    .line 3409
    :cond_2f
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->makerFW:[Ljava/lang/String;

    if-eqz v7, :cond_30

    .line 3410
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    const-string v8, "devicefirmware"

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->makerFW:[Ljava/lang/String;

    invoke-virtual {v7, v8, v9}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareNEWFirmwareDataForMaker(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_1

    .line 3413
    :cond_30
    const-string v7, "UpnpDeviceList"

    const-string v8, "makerFW is null"

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 3415
    :cond_31
    const-string v7, "Flex RGBW"

    invoke-virtual {v2, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_32

    const-string v7, "LIGHTIFY Flex RGBW"

    invoke-virtual {v2, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 3416
    :cond_32
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->flexLEDFw:[Ljava/lang/String;

    if-eqz v7, :cond_33

    .line 3417
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    const-string v8, "devicefirmware"

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->flexLEDFw:[Ljava/lang/String;

    const/4 v10, 0x1

    aget-object v9, v9, v10

    const-string v10, "Flex RGBW"

    const-string v11, "\\s+"

    const-string v12, ""

    invoke-virtual {v10, v11, v12}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v7, v8, v9, v10}, Lcom/belkin/wemo/cache/utils/MoreUtil;->compareFirmwareVersionsBulb(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_1

    .line 3420
    :cond_33
    const-string v7, "UpnpDeviceList"

    const-string v8, "flexLEDFW is null"

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto/16 :goto_1

    .line 3253
    .end local v2    # "deviceType":Ljava/lang/String;
    :cond_34
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_0

    .line 3435
    .end local v0    # "currentFirmwareVersion":Lorg/json/JSONObject;
    .end local v1    # "currentPlugInVersion":Ljava/lang/String;
    .end local v5    # "i":I
    .end local v6    # "status":Ljava/lang/String;
    :cond_35
    const-string v7, "UpnpDeviceList"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, " Null value passed:: currentFirmwreArray ::"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " firmDetailsList:: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->firmDetailsList:Ljava/util/ArrayList;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_3
.end method

.method public newOptionsReset(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 9
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 690
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    .line 692
    :try_start_0
    iget-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v6

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v1

    .line 693
    .local v1, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    invoke-virtual {v1, p1}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v3

    .line 694
    .local v3, "localDevice":Lorg/cybergarage/upnp/Device;
    const-string v6, "ReSetup"

    invoke-virtual {v3, v6}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 695
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    const-string v6, "Reset"

    invoke-virtual {v0, v6, p2}, Lorg/cybergarage/upnp/Action;->setArgumentValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 696
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v4

    .line 697
    .local v4, "response":Ljava/lang/String;
    const-string v6, "UpnpDeviceList"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Response : reset option : UDN : "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " : "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " : "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 698
    if-eqz v4, :cond_0

    sget-object v6, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->ERROR:Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v6

    if-eqz v6, :cond_1

    .line 703
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .end local v3    # "localDevice":Lorg/cybergarage/upnp/Device;
    .end local v4    # "response":Ljava/lang/String;
    :cond_0
    :goto_0
    return v5

    .line 700
    .restart local v0    # "action":Lorg/cybergarage/upnp/Action;
    .restart local v1    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .restart local v3    # "localDevice":Lorg/cybergarage/upnp/Device;
    .restart local v4    # "response":Ljava/lang/String;
    :cond_1
    const/4 v5, 0x1

    goto :goto_0

    .line 701
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .end local v3    # "localDevice":Lorg/cybergarage/upnp/Device;
    .end local v4    # "response":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 702
    .local v2, "e":Ljava/lang/Exception;
    const-string v6, "UpnpDeviceList"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Exception in resetOption: key: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " : "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public openBridgeNetwork()Lorg/json/JSONArray;
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v12, 0x0

    .line 1299
    new-instance v9, Lorg/json/JSONObject;

    invoke-direct {v9}, Lorg/json/JSONObject;-><init>()V

    iput-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    .line 1300
    const-string v8, ""

    .line 1301
    .local v8, "udn":Ljava/lang/String;
    new-instance v7, Lorg/json/JSONArray;

    invoke-direct {v7}, Lorg/json/JSONArray;-><init>()V

    .line 1302
    .local v7, "tempJsonArray":Lorg/json/JSONArray;
    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v9}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v9

    invoke-virtual {v9}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v1

    .line 1303
    .local v1, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    if-eqz v1, :cond_1

    .line 1304
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v9

    invoke-virtual {v9}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v9

    if-ge v3, v9, :cond_2

    .line 1305
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v9

    invoke-virtual {v9, v3}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v9

    invoke-virtual {v9}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v9

    const-string v10, "Bridge"

    invoke-virtual {v9, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 1306
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v9

    invoke-virtual {v9, v3}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v9

    invoke-virtual {v9}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v8

    .line 1304
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1311
    .end local v3    # "i":I
    :cond_1
    sget-object v9, Lcom/belkin/cordova/plugin/DevicePlugin;->mWeMoSDKContext:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    invoke-virtual {v9}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->getUpnpControl()Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    check-cast v1, Lorg/cybergarage/upnp/ControlPoint;

    .line 1312
    .restart local v1    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v9

    invoke-virtual {v9, v12}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v9

    invoke-virtual {v9}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v8

    .line 1314
    :cond_2
    const-string v9, "UpnpDeviceList"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "IN OPEN NETWORK SIZE"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1315
    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_4

    .line 1316
    iget v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mOpenBridgeRetryCount:I

    if-lez v9, :cond_3

    .line 1317
    const-string v9, "UpnpDeviceList"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "mOpenBridgeRetryCount: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget v11, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mOpenBridgeRetryCount:I

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1318
    iget v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mOpenBridgeRetryCount:I

    add-int/lit8 v9, v9, -0x1

    iput v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mOpenBridgeRetryCount:I

    .line 1320
    invoke-virtual {p0}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openBridgeNetwork()Lorg/json/JSONArray;

    move-result-object v7

    .line 1346
    .end local v7    # "tempJsonArray":Lorg/json/JSONArray;
    :goto_1
    return-object v7

    .line 1323
    .restart local v7    # "tempJsonArray":Lorg/json/JSONArray;
    :cond_3
    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    const-string v10, "OpenNetwork"

    invoke-virtual {v9, v10, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 1324
    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    invoke-virtual {v7, v9}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 1344
    :goto_2
    invoke-virtual {p0}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->resetOpenBridgeCounter()V

    .line 1345
    const-string v9, "UpnpDeviceList"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "openBridgeNetwork() tempJsonArray: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 1328
    :cond_4
    :try_start_0
    invoke-virtual {v1, v8}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v9

    const-string v10, "OpenNetwork"

    invoke-virtual {v9, v10}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 1329
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    sget-object v9, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->ARGS_DEVUDN:[Ljava/lang/String;

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/String;

    const/4 v11, 0x0

    aput-object v8, v10, v11

    invoke-direct {p0, v0, v9, v10}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 1330
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v6

    .line 1331
    .local v6, "statusResponse":Ljava/lang/String;
    const-string v9, "UpnpDeviceList"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "=========open network===="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1332
    if-eqz v6, :cond_5

    .line 1333
    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    const-string v10, "OpenNetwork"

    const/4 v11, 0x1

    invoke-virtual {v9, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 1334
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    const-wide/16 v12, 0x3e8

    div-long v4, v10, v12

    .line 1335
    .local v4, "seconds":J
    const-wide/16 v10, 0xff

    add-long/2addr v10, v4

    iput-wide v10, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->timeOpenNetworkCheck:J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1342
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v4    # "seconds":J
    .end local v6    # "statusResponse":Ljava/lang/String;
    :goto_3
    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    invoke-virtual {v7, v9}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_2

    .line 1338
    .restart local v0    # "action":Lorg/cybergarage/upnp/Action;
    .restart local v6    # "statusResponse":Ljava/lang/String;
    :cond_5
    :try_start_1
    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    const-string v10, "OpenNetwork"

    const/4 v11, 0x0

    invoke-virtual {v9, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_3

    .line 1339
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v6    # "statusResponse":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 1340
    .local v2, "e":Ljava/lang/Exception;
    const-string v9, "UpnpDeviceList"

    const-string v10, "Exception in openBridgeNetwork(): "

    invoke-static {v9, v10, v2}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_3
.end method

.method public parseGetEndDeviceList()Lorg/json/JSONArray;
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 1354
    new-instance v6, Lorg/json/JSONArray;

    invoke-direct {v6}, Lorg/json/JSONArray;-><init>()V

    .line 1355
    .local v6, "jsonArrayForLED":Lorg/json/JSONArray;
    const-string v9, ""

    .line 1356
    .local v9, "udn":Ljava/lang/String;
    iget-object v10, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v10}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v10

    invoke-virtual {v10}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v1

    .line 1358
    .local v1, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    if-eqz v1, :cond_1

    .line 1359
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    :try_start_0
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v10

    invoke-virtual {v10}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v10

    if-ge v5, v10, :cond_1

    .line 1360
    const-string v10, "UpnpDeviceList"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Control point inside*****"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v12

    invoke-virtual {v12, v5}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v12

    invoke-virtual {v12}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1361
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v10

    invoke-virtual {v10, v5}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v10

    invoke-virtual {v10}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v10

    const-string v11, "Bridge"

    invoke-virtual {v10, v11}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 1362
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v10

    invoke-virtual {v10, v5}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v10

    invoke-virtual {v10}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v9

    .line 1359
    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 1366
    .end local v5    # "i":I
    :cond_1
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v10

    if-lez v10, :cond_2

    .line 1367
    invoke-virtual {v1, v9}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v10

    const-string v11, "GetEndDevices"

    invoke-virtual {v10, v11}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 1368
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    sget-object v10, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->GET_END_DEVICES_ARGS:[Ljava/lang/String;

    const/4 v11, 0x2

    new-array v11, v11, [Ljava/lang/String;

    const/4 v12, 0x0

    aput-object v9, v11, v12

    const/4 v12, 0x1

    sget-object v13, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$getEndList;->SCAN_LIST:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$getEndList;

    invoke-static {v13}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-direct {p0, v0, v10, v11}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 1369
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v10

    iput-object v10, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mResponseString:Ljava/lang/String;

    .line 1370
    const-string v10, "UpnpDeviceList"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "RESPONSE of Get end devices IS :"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget-object v12, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mResponseString:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1371
    iget-object v10, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mResponseString:Ljava/lang/String;

    if-eqz v10, :cond_2

    .line 1372
    new-instance v4, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;

    invoke-direct {v4}, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;-><init>()V

    .line 1373
    .local v4, "getEndDevicesListResp":Lcom/belkin/upnp/parser/GetEndDeviceListResponse;
    iget-object v10, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mResponseString:Ljava/lang/String;

    invoke-virtual {v4, v10}, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->parseForGetEndDeviceList(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v6

    .line 1375
    if-eqz v6, :cond_3

    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v10

    if-nez v10, :cond_3

    .line 1376
    const-string v10, "0"

    invoke-virtual {v6, v10}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1409
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v4    # "getEndDevicesListResp":Lcom/belkin/upnp/parser/GetEndDeviceListResponse;
    :cond_2
    :goto_1
    const-string v10, "UpnpDeviceList"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "LED get end devices******"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1410
    return-object v6

    .line 1379
    .restart local v0    # "action":Lorg/cybergarage/upnp/Action;
    .restart local v4    # "getEndDevicesListResp":Lcom/belkin/upnp/parser/GetEndDeviceListResponse;
    :cond_3
    const/4 v5, 0x0

    .restart local v5    # "i":I
    :goto_2
    :try_start_1
    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v10

    if-ge v5, v10, :cond_2

    .line 1380
    invoke-virtual {v6, v5}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    .line 1381
    .local v7, "led":Lorg/json/JSONObject;
    const-string v10, "ModelCode"

    invoke-virtual {v7, v10}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_4

    .line 1382
    const-string v10, "FriendlyName"

    invoke-virtual {v7, v10}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 1383
    .local v3, "friendlyName":Ljava/lang/String;
    const-string v10, "Lightbulb"

    invoke-virtual {v3, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_5

    .line 1384
    const-string v8, "MZ100"

    .line 1385
    .local v8, "modelCodeValue":Ljava/lang/String;
    const-string v10, "ModelCode"

    invoke-virtual {v7, v10, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1386
    const-string v10, "ManufacturerName"

    const-string v11, "MRVL"

    invoke-virtual {v7, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1387
    const-string v10, "WemoCertified"

    const-string v11, "YES"

    invoke-virtual {v7, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1388
    const-string v10, "Availability"

    const-string v11, "YES"

    invoke-virtual {v7, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1389
    invoke-virtual {v6, v7}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 1390
    const-string v10, "UpnpDeviceList"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "updated LED :"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1379
    .end local v3    # "friendlyName":Ljava/lang/String;
    .end local v8    # "modelCodeValue":Ljava/lang/String;
    :cond_4
    :goto_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 1391
    .restart local v3    # "friendlyName":Ljava/lang/String;
    :cond_5
    const-string v10, "OSRAM"

    invoke-virtual {v3, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_4

    .line 1392
    const-string v8, "iQBR30"

    .line 1393
    .restart local v8    # "modelCodeValue":Ljava/lang/String;
    const-string v10, "ModelCode"

    invoke-virtual {v7, v10, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1394
    const-string v10, "ManufacturerName"

    const-string v11, "OSRAM SYLVANIA"

    invoke-virtual {v7, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1395
    const-string v10, "WemoCertified"

    const-string v11, "NO"

    invoke-virtual {v7, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1396
    const-string v10, "Availability"

    const-string v11, "YES"

    invoke-virtual {v7, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1397
    invoke-virtual {v6, v7}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 1398
    const-string v10, "UpnpDeviceList"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "updated LED :"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_3

    .line 1405
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v3    # "friendlyName":Ljava/lang/String;
    .end local v4    # "getEndDevicesListResp":Lcom/belkin/upnp/parser/GetEndDeviceListResponse;
    .end local v5    # "i":I
    .end local v7    # "led":Lorg/json/JSONObject;
    .end local v8    # "modelCodeValue":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 1406
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_1
.end method

.method public parseGetEndDeviceList(Lorg/json/JSONArray;)Lorg/json/JSONArray;
    .locals 13
    .param p1, "udnArray"    # Lorg/json/JSONArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x0

    .line 1421
    const-string v7, ""

    .line 1422
    .local v7, "mBridgeUdn":Ljava/lang/String;
    new-instance v9, Lorg/json/JSONArray;

    invoke-direct {v9}, Lorg/json/JSONArray;-><init>()V

    iput-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonBridgeArray:Lorg/json/JSONArray;

    .line 1423
    new-instance v5, Lorg/json/JSONArray;

    invoke-direct {v5}, Lorg/json/JSONArray;-><init>()V

    .line 1424
    .local v5, "jsonArrayForLED":Lorg/json/JSONArray;
    invoke-virtual {p1, v10}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v8

    .line 1425
    .local v8, "searchGetendList":Ljava/lang/String;
    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v9}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v9

    invoke-virtual {v9}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v1

    .line 1426
    .local v1, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    if-eqz v1, :cond_1

    .line 1427
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v9

    invoke-virtual {v9}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v9

    if-ge v4, v9, :cond_1

    .line 1428
    const-string v9, "UpnpDeviceList"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Control point inside*****"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v11

    invoke-virtual {v11, v4}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v11

    invoke-virtual {v11}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1429
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v9

    invoke-virtual {v9, v4}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v9

    invoke-virtual {v9}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v9

    const-string v10, "Bridge"

    invoke-virtual {v9, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 1430
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v9

    invoke-virtual {v9, v4}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v9

    invoke-virtual {v9}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v7

    .line 1427
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 1434
    .end local v4    # "i":I
    :cond_1
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v9

    if-lez v9, :cond_2

    .line 1436
    :try_start_0
    const-string v9, "pairedlist"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 1437
    invoke-virtual {v1, v7}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v9

    const-string v10, "GetEndDevices"

    invoke-virtual {v9, v10}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 1438
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    sget-object v9, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->GET_END_DEVICES_ARGS:[Ljava/lang/String;

    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/String;

    const/4 v11, 0x0

    aput-object v7, v10, v11

    const/4 v11, 0x1

    sget-object v12, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$getEndList;->PAIRED_LIST:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$getEndList;

    invoke-static {v12}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    aput-object v12, v10, v11

    invoke-direct {p0, v0, v9, v10}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 1439
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v9

    iput-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mResponseString:Ljava/lang/String;

    .line 1440
    const-string v9, "UpnpDeviceList"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "RESPONSE of Get end devices IS :"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mResponseString:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1441
    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mResponseString:Ljava/lang/String;

    if-eqz v9, :cond_2

    .line 1442
    new-instance v3, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;

    invoke-direct {v3}, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;-><init>()V

    .line 1443
    .local v3, "getEndDevicesListResp":Lcom/belkin/upnp/parser/GetEndDeviceListResponse;
    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mResponseString:Ljava/lang/String;

    invoke-virtual {v3, v9}, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->parseForGetEndDeviceList(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v5

    .line 1444
    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mResponseString:Ljava/lang/String;

    invoke-virtual {v3, v9}, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->parseForGetEndDeviceList(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v9

    iput-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonBridgeArray:Lorg/json/JSONArray;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1476
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v3    # "getEndDevicesListResp":Lcom/belkin/upnp/parser/GetEndDeviceListResponse;
    :cond_2
    :goto_1
    const-string v9, "UpnpDeviceList"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "get end list response:******"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonBridgeArray:Lorg/json/JSONArray;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1477
    return-object v5

    .line 1454
    :cond_3
    :try_start_1
    const-string v6, ""

    .line 1455
    .local v6, "listtype":Ljava/lang/String;
    const-string v9, "unpairedlist"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 1456
    sget-object v9, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$getEndList;->SCAN_LIST:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$getEndList;

    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    .line 1459
    :goto_2
    invoke-virtual {v1, v7}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v9

    const-string v10, "GetEndDevices"

    invoke-virtual {v9, v10}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 1460
    .restart local v0    # "action":Lorg/cybergarage/upnp/Action;
    sget-object v9, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->GET_END_DEVICES_ARGS:[Ljava/lang/String;

    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/String;

    const/4 v11, 0x0

    aput-object v7, v10, v11

    const/4 v11, 0x1

    aput-object v6, v10, v11

    invoke-direct {p0, v0, v9, v10}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 1461
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v9

    iput-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mResponseString:Ljava/lang/String;

    .line 1462
    const-string v9, "UpnpDeviceList"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "RESPONSE of Get end devices IS :"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mResponseString:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1463
    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mResponseString:Ljava/lang/String;

    if-eqz v9, :cond_2

    .line 1464
    new-instance v3, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;

    invoke-direct {v3}, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;-><init>()V

    .line 1465
    .restart local v3    # "getEndDevicesListResp":Lcom/belkin/upnp/parser/GetEndDeviceListResponse;
    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mResponseString:Ljava/lang/String;

    invoke-virtual {v3, v9}, Lcom/belkin/upnp/parser/GetEndDeviceListResponse;->parseForGetEndDeviceList(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v5

    goto :goto_1

    .line 1458
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v3    # "getEndDevicesListResp":Lcom/belkin/upnp/parser/GetEndDeviceListResponse;
    :cond_4
    sget-object v9, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$getEndList;->ALL_LIST:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$getEndList;

    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v6

    goto :goto_2

    .line 1470
    .end local v6    # "listtype":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 1471
    .local v2, "e":Ljava/lang/Exception;
    const-string v9, "UpnpDeviceList"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Exception: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1
.end method

.method public postActionObjectControlAction(Ljava/lang/String;Ljava/lang/String;)Lorg/cybergarage/upnp/Action;
    .locals 6
    .param p1, "pudn"    # Ljava/lang/String;
    .param p2, "pCommand"    # Ljava/lang/String;

    .prologue
    .line 3867
    const/4 v0, 0x0

    .line 3869
    .local v0, "actionObj":Lorg/cybergarage/upnp/Action;
    :try_start_0
    iget-object v4, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v4

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v2

    .line 3870
    .local v2, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    invoke-virtual {v2, p1}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v4

    invoke-virtual {v4, p2}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 3871
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v1, v0

    .line 3875
    .end local v0    # "actionObj":Lorg/cybergarage/upnp/Action;
    .end local v2    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .local v1, "actionObj":Lorg/cybergarage/upnp/Action;
    :goto_0
    return-object v1

    .line 3873
    .end local v1    # "actionObj":Lorg/cybergarage/upnp/Action;
    .restart local v0    # "actionObj":Lorg/cybergarage/upnp/Action;
    :catch_0
    move-exception v3

    .line 3874
    .local v3, "ex":Ljava/lang/Exception;
    const-string v4, "postActionObjectControlAction()"

    invoke-virtual {v3}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    move-object v1, v0

    .line 3875
    .end local v0    # "actionObj":Lorg/cybergarage/upnp/Action;
    .restart local v1    # "actionObj":Lorg/cybergarage/upnp/Action;
    goto :goto_0
.end method

.method public postTimeSync(Lorg/cybergarage/upnp/Device;)Lorg/json/JSONObject;
    .locals 6
    .param p1, "device"    # Lorg/cybergarage/upnp/Device;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 355
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 357
    .local v2, "jsonObj":Lorg/json/JSONObject;
    if-eqz p1, :cond_0

    .line 359
    :try_start_0
    const-string v4, "TimeSync"

    invoke-virtual {p1, v4}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 360
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    if-eqz v0, :cond_0

    .line 362
    sget-object v4, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->SET_TIME_SYNC_ARGS:[Ljava/lang/String;

    invoke-direct {p0}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->timeSync()[Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v0, v4, v5}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 363
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v3

    .line 364
    .local v3, "str":Ljava/lang/String;
    if-eqz v3, :cond_0

    const-string v4, "failure"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 366
    const-string v4, "TimeSync"

    const/4 v5, 0x1

    invoke-virtual {v2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 373
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v3    # "str":Ljava/lang/String;
    :goto_0
    return-object v4

    .line 370
    :catch_0
    move-exception v1

    .line 371
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 373
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_0
    const-string v4, "TimeSync"

    const/4 v5, 0x0

    invoke-virtual {v2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v4

    goto :goto_0
.end method

.method public readDBDataFromPlugin(Landroid/content/Context;)Ljava/lang/String;
    .locals 8
    .param p1, "mContext"    # Landroid/content/Context;

    .prologue
    .line 1047
    const-string v2, ""

    .line 1048
    .local v2, "pragmaUserVersion":Ljava/lang/String;
    const-string v3, ""

    .line 1049
    .local v3, "remoteDBFilePath":Ljava/lang/String;
    new-instance v4, Lcom/belkin/utils/RuleUtility;

    invoke-direct {v4, p1}, Lcom/belkin/utils/RuleUtility;-><init>(Landroid/content/Context;)V

    .line 1051
    .local v4, "ruleUtility":Lcom/belkin/utils/RuleUtility;
    :try_start_0
    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getLocalDBPath()Ljava/lang/String;

    move-result-object v1

    .line 1052
    .local v1, "localDBFilePath":Ljava/lang/String;
    invoke-virtual {p0, p1}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getLatestDBVersion(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    .line 1053
    if-eqz v1, :cond_0

    if-eqz v3, :cond_0

    const-string v5, "Use local DB"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 1055
    const-string v5, "Reading DB if "

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "  Local DB - "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " Remote DB - "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1056
    const-string v5, "pluginrulesCompressed.zip"

    invoke-virtual {v4, v3, v5}, Lcom/belkin/utils/RuleUtility;->DownloadFromUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1065
    .end local v1    # "localDBFilePath":Ljava/lang/String;
    :goto_0
    return-object v2

    .line 1058
    .restart local v1    # "localDBFilePath":Ljava/lang/String;
    :cond_0
    const-string v5, "Reading DB else "

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "  Local DB - "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " Remote DB - "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1059
    const-string v5, "Reading DB"

    const-string v6, "Using local DB as Remote DB is either unavailable or has lesser version"

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1060
    invoke-virtual {v4}, Lcom/belkin/utils/RuleUtility;->getPragmaVersion()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    goto :goto_0

    .line 1062
    .end local v1    # "localDBFilePath":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 1063
    .local v0, "excep":Ljava/lang/Exception;
    const-string v5, "UpnpDeviceList"

    const-string v6, "Exception in readDBDataFromPlugin(): "

    invoke-static {v5, v6, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public removeBridgeDevices(Lorg/json/JSONArray;)Lorg/json/JSONArray;
    .locals 12
    .param p1, "LedDeviceIds"    # Lorg/json/JSONArray;

    .prologue
    .line 1555
    new-instance v8, Lorg/json/JSONArray;

    invoke-direct {v8}, Lorg/json/JSONArray;-><init>()V

    .line 1556
    .local v8, "tempJsonArray":Lorg/json/JSONArray;
    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v9}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v9

    invoke-virtual {v9}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v1

    .line 1557
    .local v1, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v9

    invoke-virtual {v9}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v9

    if-ge v4, v9, :cond_1

    .line 1558
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v9

    invoke-virtual {v9, v4}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v9

    invoke-virtual {v9}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v9

    const-string v10, "Bridge"

    invoke-virtual {v9, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 1559
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v9

    invoke-virtual {v9, v4}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v9

    invoke-virtual {v9}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v9

    iput-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    .line 1557
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 1563
    :cond_1
    :try_start_0
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 1565
    .local v7, "strtemp":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 1566
    .local v2, "devIds":Ljava/lang/StringBuffer;
    const/4 v4, 0x0

    :goto_1
    const/4 v9, 0x0

    invoke-virtual {p1, v9}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v9

    invoke-virtual {v9}, Lorg/json/JSONArray;->length()I

    move-result v9

    if-ge v4, v9, :cond_3

    .line 1567
    const/4 v9, 0x0

    invoke-virtual {p1, v9}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v9

    invoke-virtual {v9, v4}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v2, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1568
    const/4 v9, 0x0

    invoke-virtual {p1, v9}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v9

    invoke-virtual {v9}, Lorg/json/JSONArray;->length()I

    move-result v9

    add-int/lit8 v9, v9, -0x1

    if-ge v4, v9, :cond_2

    .line 1569
    const-string v9, ","

    invoke-virtual {v2, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1570
    :cond_2
    const/4 v9, 0x0

    invoke-virtual {p1, v9}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v9

    invoke-virtual {v9, v4}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1566
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 1573
    :cond_3
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    .line 1574
    .local v6, "strDevIds":Ljava/lang/String;
    const-string v9, "UpnpDeviceList"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "----- remove dev ids:"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1575
    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    invoke-virtual {v1, v9}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v9

    const-string v10, "RemoveDevice"

    invoke-virtual {v9, v10}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 1576
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    sget-object v9, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->ARGS_DEVICEIDS:[Ljava/lang/String;

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/String;

    const/4 v11, 0x0

    aput-object v6, v10, v11

    invoke-direct {p0, v0, v9, v10}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 1577
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v9

    iput-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mResponseString:Ljava/lang/String;

    .line 1578
    const-string v9, "UpnpDeviceList"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "get remove devices n/w===+"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mResponseString:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1581
    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    const-string v10, "MZ100"

    invoke-virtual {v9, v10}, Lcom/belkin/wemo/cache/utils/MoreUtil;->resetFWFlags(Ljava/lang/String;)V

    .line 1583
    new-instance v5, Lcom/belkin/upnp/parser/LedDeviceResponseParser;

    invoke-direct {v5}, Lcom/belkin/upnp/parser/LedDeviceResponseParser;-><init>()V

    .line 1584
    .local v5, "responseStatus":Lcom/belkin/upnp/parser/LedDeviceResponseParser;
    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mResponseString:Ljava/lang/String;

    invoke-virtual {v5, v9}, Lcom/belkin/upnp/parser/LedDeviceResponseParser;->parseNetworkStatus(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v9

    invoke-virtual {v8, v9}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1590
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v2    # "devIds":Ljava/lang/StringBuffer;
    .end local v5    # "responseStatus":Lcom/belkin/upnp/parser/LedDeviceResponseParser;
    .end local v6    # "strDevIds":Ljava/lang/String;
    .end local v7    # "strtemp":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :goto_2
    return-object v8

    .line 1587
    :catch_0
    move-exception v3

    .line 1588
    .local v3, "e":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2
.end method

.method public removeLed(Ljava/lang/String;)Z
    .locals 9
    .param p1, "deviceID"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 1243
    const-string v6, "UpnpDeviceList"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "removeLed():: deviceID--> "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " jsonBridgeArray--> "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonBridgeArray:Lorg/json/JSONArray;

    invoke-virtual {v8}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1244
    new-instance v4, Lorg/json/JSONArray;

    invoke-direct {v4}, Lorg/json/JSONArray;-><init>()V

    .line 1245
    .local v4, "tempArray":Lorg/json/JSONArray;
    const/4 v2, 0x0

    .line 1246
    .local v2, "index":I
    iget-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonBridgeArray:Lorg/json/JSONArray;

    if-eqz v6, :cond_2

    iget-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonBridgeArray:Lorg/json/JSONArray;

    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-lez v6, :cond_2

    .line 1247
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonBridgeArray:Lorg/json/JSONArray;

    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-ge v1, v6, :cond_2

    .line 1249
    iget-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonBridgeArray:Lorg/json/JSONArray;

    invoke-virtual {v6, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    invoke-virtual {v6}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1250
    .local v5, "tempLedObj":Ljava/lang/String;
    const-string v6, "GroupID"

    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 1251
    iget-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonBridgeArray:Lorg/json/JSONArray;

    invoke-virtual {v6, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    const-string v7, "GroupID"

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1252
    .local v0, "groupId":Ljava/lang/String;
    const-string v6, "UpnpDeviceList"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "removeLed():: groupId--> "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1253
    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 1254
    iget-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonBridgeArray:Lorg/json/JSONArray;

    invoke-virtual {v6, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    invoke-virtual {v4, v2, v6}, Lorg/json/JSONArray;->put(ILjava/lang/Object;)Lorg/json/JSONArray;

    .line 1255
    add-int/lit8 v2, v2, 0x1

    .line 1247
    .end local v0    # "groupId":Ljava/lang/String;
    :cond_0
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1258
    :cond_1
    iget-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonBridgeArray:Lorg/json/JSONArray;

    invoke-virtual {v6, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    const-string v7, "DeviceID"

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1259
    .local v3, "ledDeviceId":Ljava/lang/String;
    const-string v6, "UpnpDeviceList"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "removeLed():: ledDeviceId--> "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1260
    if-eqz v3, :cond_0

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 1261
    iget-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonBridgeArray:Lorg/json/JSONArray;

    invoke-virtual {v6, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    invoke-virtual {v4, v2, v6}, Lorg/json/JSONArray;->put(ILjava/lang/Object;)Lorg/json/JSONArray;

    .line 1262
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 1269
    .end local v1    # "i":I
    .end local v3    # "ledDeviceId":Ljava/lang/String;
    .end local v5    # "tempLedObj":Ljava/lang/String;
    :cond_2
    iput-object v4, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonBridgeArray:Lorg/json/JSONArray;

    .line 1270
    const-string v6, "UpnpDeviceList"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "removeLed():: returning jsonBridgeArray--> "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonBridgeArray:Lorg/json/JSONArray;

    invoke-virtual {v8}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1271
    const/4 v6, 0x1

    return v6
.end method

.method public resetOpenBridgeCounter()V
    .locals 1

    .prologue
    .line 4382
    const/4 v0, 0x7

    iput v0, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mOpenBridgeRetryCount:I

    .line 4383
    return-void
.end method

.method public resetPlugIn(Ljava/lang/String;)Z
    .locals 12
    .param p1, "udn"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    .line 646
    if-nez p1, :cond_1

    .line 678
    :cond_0
    :goto_0
    return v8

    .line 649
    :cond_1
    new-instance v9, Lorg/json/JSONObject;

    invoke-direct {v9}, Lorg/json/JSONObject;-><init>()V

    iput-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    .line 651
    :try_start_0
    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v9}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v9

    invoke-virtual {v9}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v1

    .line 652
    .local v1, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    invoke-virtual {v1, p1}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v5

    .line 653
    .local v5, "localDevice":Lorg/cybergarage/upnp/Device;
    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v9}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v9

    invoke-virtual {v9, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDevice(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v7

    .line 654
    .local v7, "wemoDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v5, :cond_0

    .line 657
    const-string v9, "ReSetup"

    invoke-virtual {v5, v9}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 658
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    const-string v9, "Reset"

    const-string v10, "2"

    invoke-virtual {v0, v9, v10}, Lorg/cybergarage/upnp/Action;->setArgumentValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 659
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v6

    .line 660
    .local v6, "response":Ljava/lang/String;
    const-string v9, "UpnpDeviceList"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "resetAllContentAndSettings response: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 661
    if-eqz v6, :cond_0

    sget-object v9, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->ERROR:Ljava/lang/String;

    invoke-virtual {v6, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_0

    .line 665
    invoke-virtual {v5}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v2

    .line 666
    .local v2, "deviceType":Ljava/lang/String;
    if-eqz v2, :cond_2

    const-string v9, "insight"

    invoke-virtual {v2, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 667
    invoke-virtual {v7}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getHwVersion()Ljava/lang/String;

    move-result-object v4

    .line 669
    .local v4, "hwVersion":Ljava/lang/String;
    if-eqz v4, :cond_2

    const-string v9, "v2"

    invoke-virtual {v4, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 670
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "v2"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 673
    .end local v4    # "hwVersion":Ljava/lang/String;
    :cond_2
    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    invoke-virtual {v9, v2}, Lcom/belkin/wemo/cache/utils/MoreUtil;->resetFWFlags(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 674
    const/4 v8, 0x1

    goto/16 :goto_0

    .line 676
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .end local v2    # "deviceType":Ljava/lang/String;
    .end local v5    # "localDevice":Lorg/cybergarage/upnp/Device;
    .end local v6    # "response":Ljava/lang/String;
    .end local v7    # "wemoDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :catch_0
    move-exception v3

    .line 677
    .local v3, "e":Ljava/lang/Exception;
    const-string v9, "UpnpDeviceList"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "exception in resetAllContentAndSettings: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method public sendDBDataToPlugin(Landroid/content/Context;)Ljava/lang/String;
    .locals 10
    .param p1, "mContext"    # Landroid/content/Context;

    .prologue
    .line 986
    const-string v5, ""

    .line 987
    .local v5, "uploadStatus":Ljava/lang/String;
    new-instance v3, Lcom/belkin/utils/RuleUtility;

    invoke-direct {v3, p1}, Lcom/belkin/utils/RuleUtility;-><init>(Landroid/content/Context;)V

    .line 989
    .local v3, "ruleUtility":Lcom/belkin/utils/RuleUtility;
    :try_start_0
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getLocalDBPath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "pluginrules2.db"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getStoragePath()Ljava/io/File;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "/"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "temppluginRules.db"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const-string v8, "false"

    invoke-virtual {v3, v6, v7, v8}, Lcom/belkin/utils/RuleUtility;->copyDataBase(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 990
    iget-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->filesToBeZipped:[Ljava/lang/String;

    const/4 v7, 0x0

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getStoragePath()Ljava/io/File;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "/"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "temppluginRules.db"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    .line 991
    iget-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->filesToBeZipped:[Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getStoragePath()Ljava/io/File;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "/"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "pluginrulesCompressed.zip"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v6, v7}, Lcom/belkin/utils/RuleUtility;->zip([Ljava/lang/String;Ljava/lang/String;)V

    .line 992
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getStoragePath()Ljava/io/File;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "pluginrules2.db"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 993
    .local v4, "strDBFilePath":Ljava/lang/String;
    invoke-virtual {p0, p1, v4}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getDBPathAllDevices(Landroid/content/Context;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    .line 995
    .local v0, "dbPathArrayAllDevices":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    if-eqz v4, :cond_0

    if-eqz v0, :cond_0

    .line 996
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v2, v6, :cond_0

    .line 997
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Lcom/belkin/utils/UploadFileUtil;->writeDBToDevice(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 996
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1001
    .end local v0    # "dbPathArrayAllDevices":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v2    # "i":I
    .end local v4    # "strDBFilePath":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 1002
    .local v1, "excep":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 1004
    .end local v1    # "excep":Ljava/lang/Exception;
    :cond_0
    return-object v5
.end method

.method public setDevicePreset(Lorg/json/JSONArray;Lcom/belkin/wemo/callback/SetAndGetActionCallBack;)V
    .locals 7
    .param p1, "presetsInfo"    # Lorg/json/JSONArray;
    .param p2, "callback"    # Lcom/belkin/wemo/callback/SetAndGetActionCallBack;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 4759
    const/4 v4, 0x0

    .line 4760
    .local v4, "isRequestProcessed":Z
    iget-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v5}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v5

    invoke-virtual {v5}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v2

    .line 4761
    .local v2, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    const/4 v5, 0x0

    invoke-virtual {p1, v5}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "bridgeUdn"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    .line 4762
    iget-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    if-eqz v5, :cond_0

    .line 4763
    iget-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    invoke-virtual {v2, v5}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v3

    .line 4764
    .local v3, "device":Lorg/cybergarage/upnp/Device;
    if-eqz v3, :cond_0

    .line 4765
    const-string v5, "setDevicePreset"

    invoke-virtual {v3, v5}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 4766
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    if-eqz v0, :cond_0

    .line 4767
    const-string v5, "devicePresetData"

    invoke-direct {p0, p1}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->createSetDeletePresetRequest(Lorg/json/JSONArray;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v5, v6}, Lorg/cybergarage/upnp/Action;->setArgumentValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 4768
    new-instance v1, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$SetPresetCallback;

    invoke-direct {v1, p0, p2}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$SetPresetCallback;-><init>(Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;Lcom/belkin/wemo/callback/SetAndGetActionCallBack;)V

    .line 4769
    .local v1, "actionCallback":Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$SetPresetCallback;
    const/4 v4, 0x1

    .line 4770
    invoke-static {}, Lcom/belkin/cybergarage/wrapper/ControlActionHandler;->newInstance()Lcom/belkin/cybergarage/wrapper/ControlActionHandler;

    move-result-object v5

    invoke-virtual {v5, v0, v1, v1}, Lcom/belkin/cybergarage/wrapper/ControlActionHandler;->postControlAction(Lorg/cybergarage/upnp/Action;Lcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionErrorCallback;Lcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionSuccessCallback;)V

    .line 4774
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "actionCallback":Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$SetPresetCallback;
    .end local v3    # "device":Lorg/cybergarage/upnp/Device;
    :cond_0
    if-nez v4, :cond_1

    .line 4775
    invoke-interface {p2}, Lcom/belkin/wemo/callback/SetAndGetActionCallBack;->onError()V

    .line 4777
    :cond_1
    return-void
.end method

.method public setDeviceState(Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 10
    .param p1, "state"    # Ljava/lang/String;
    .param p2, "udn"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 495
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    iput-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    .line 496
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    sget-object v8, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->NOTIFY_TYPE:Ljava/lang/String;

    const-string v9, "BinaryState"

    invoke-virtual {v7, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 498
    :try_start_0
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v7

    invoke-virtual {v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v1

    .line 499
    .local v1, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    invoke-virtual {v1, p2}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v3

    .line 500
    .local v3, "localDevice":Lorg/cybergarage/upnp/Device;
    const-string v7, "UpnpDeviceList"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "setDeviceState(Device device, String state, String udn) :: UDN "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 501
    const-string v7, "UpnpDeviceList"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "setDeviceState(Device device, String state, String udn) :: FNAME "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v3}, Lorg/cybergarage/upnp/Device;->getFriendlyName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 502
    const-string v7, "UpnpDeviceList"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "setDeviceState(Device device, String state, String udn) :: DEVICE UDN "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v3}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 503
    const-string v7, "SetBinaryState"

    invoke-virtual {v3, v7}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 504
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    sget-object v7, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->SET_BINARY_STATE_ARGS:[Ljava/lang/String;

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/String;

    const/4 v9, 0x0

    aput-object p1, v8, v9

    invoke-direct {p0, v0, v7, v8}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 505
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v4

    .line 506
    .local v4, "response":Ljava/lang/String;
    const-string v7, "UpnpDeviceList"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "setDeviceState(Device device, String state) :: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 507
    sget-object v7, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->ERROR:Ljava/lang/String;

    invoke-virtual {v4, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 508
    const-string v7, "0"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 509
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    const-string v8, "state"

    const-string v9, "1"

    invoke-virtual {v7, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 510
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    const-string v8, "udn"

    invoke-virtual {v7, v8, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 511
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    .line 532
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .end local v3    # "localDevice":Lorg/cybergarage/upnp/Device;
    .end local v4    # "response":Ljava/lang/String;
    :goto_0
    return-object v7

    .line 513
    .restart local v0    # "action":Lorg/cybergarage/upnp/Action;
    .restart local v1    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .restart local v3    # "localDevice":Lorg/cybergarage/upnp/Device;
    .restart local v4    # "response":Ljava/lang/String;
    :cond_0
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    const-string v8, "state"

    const-string v9, "0"

    invoke-virtual {v7, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 514
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    const-string v8, "udn"

    invoke-virtual {v7, v8, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 515
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    goto :goto_0

    .line 519
    :cond_1
    sget-object v7, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->BINARY_STATE:Ljava/lang/String;

    invoke-virtual {p0, v4, v7}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getStringFromResponse(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 520
    .local v6, "resultPars":Ljava/lang/String;
    const-string v7, "\\|"

    invoke-virtual {v6, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 521
    .local v5, "result":[Ljava/lang/String;
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    const-string v8, "state"

    const/4 v9, 0x0

    aget-object v9, v5, v9

    invoke-virtual {v7, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 522
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    const-string v8, "udn"

    invoke-virtual {v7, v8, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 523
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 524
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .end local v3    # "localDevice":Lorg/cybergarage/upnp/Device;
    .end local v4    # "response":Ljava/lang/String;
    .end local v5    # "result":[Ljava/lang/String;
    .end local v6    # "resultPars":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 525
    .local v2, "e":Ljava/lang/Exception;
    const-string v7, "0"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 526
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    const-string v8, "state"

    const-string v9, "1"

    invoke-virtual {v7, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 527
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    const-string v8, "udn"

    invoke-virtual {v7, v8, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 528
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    goto :goto_0

    .line 530
    :cond_2
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    const-string v8, "state"

    const-string v9, "0"

    invoke-virtual {v7, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 531
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    const-string v8, "udn"

    invoke-virtual {v7, v8, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 532
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    goto :goto_0
.end method

.method public setEmergencyContacts(Ljava/lang/String;Lcom/belkin/devices/callback/SetDataStoreOnLinkCallBack;)V
    .locals 8
    .param p1, "emergencyContactsInfo"    # Ljava/lang/String;
    .param p2, "callback"    # Lcom/belkin/devices/callback/SetDataStoreOnLinkCallBack;

    .prologue
    .line 4393
    const/4 v5, 0x0

    .line 4394
    .local v5, "isRequestProcessed":Z
    iget-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v6

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v2

    .line 4395
    .local v2, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    invoke-virtual {v2}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v6

    invoke-virtual {v6}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v6

    if-ge v4, v6, :cond_1

    .line 4396
    invoke-virtual {v2}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v6

    invoke-virtual {v6, v4}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v6

    invoke-virtual {v6}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v6

    const-string v7, "Bridge"

    invoke-virtual {v6, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 4397
    invoke-virtual {v2}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v6

    invoke-virtual {v6, v4}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v6

    invoke-virtual {v6}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    .line 4395
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 4400
    :cond_1
    iget-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    if-eqz v6, :cond_2

    .line 4401
    iget-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    invoke-virtual {v2, v6}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v3

    .line 4402
    .local v3, "device":Lorg/cybergarage/upnp/Device;
    if-eqz v3, :cond_2

    .line 4403
    const-string v6, "SetDataStores"

    invoke-virtual {v3, v6}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 4405
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    if-eqz v0, :cond_2

    .line 4406
    const-string v6, "DataStores"

    invoke-direct {p0, p1}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->createSetEmergencyContactRequest(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v6, v7}, Lorg/cybergarage/upnp/Action;->setArgumentValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 4407
    new-instance v1, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$SetPostActionCallback;

    invoke-direct {v1, p0, p2}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$SetPostActionCallback;-><init>(Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;Lcom/belkin/wemo/callback/SetAndGetActionCallBack;)V

    .line 4408
    .local v1, "actionCallback":Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$SetPostActionCallback;
    const/4 v5, 0x1

    .line 4410
    invoke-static {}, Lcom/belkin/cybergarage/wrapper/ControlActionHandler;->newInstance()Lcom/belkin/cybergarage/wrapper/ControlActionHandler;

    move-result-object v6

    invoke-virtual {v6, v0, v1, v1}, Lcom/belkin/cybergarage/wrapper/ControlActionHandler;->postControlAction(Lorg/cybergarage/upnp/Action;Lcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionErrorCallback;Lcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionSuccessCallback;)V

    .line 4415
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "actionCallback":Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$SetPostActionCallback;
    .end local v3    # "device":Lorg/cybergarage/upnp/Device;
    :cond_2
    if-nez v5, :cond_3

    .line 4416
    invoke-virtual {p2}, Lcom/belkin/devices/callback/SetDataStoreOnLinkCallBack;->onError()V

    .line 4418
    :cond_3
    return-void
.end method

.method public setFriendlyName(Ljava/lang/String;[Ljava/lang/String;)Z
    .locals 9
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "friendlyName"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 329
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    .line 331
    :try_start_0
    iget-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v6

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v1

    .line 332
    .local v1, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    invoke-virtual {v1, p1}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v3

    .line 333
    .local v3, "localDevice":Lorg/cybergarage/upnp/Device;
    if-eqz v3, :cond_0

    if-eqz p2, :cond_0

    const/4 v6, 0x0

    aget-object v6, p2, v6

    if-eqz v6, :cond_0

    .line 334
    const/4 v6, 0x0

    aget-object v6, p2, v6

    invoke-virtual {v3, v6}, Lorg/cybergarage/upnp/Device;->setFriendlyName(Ljava/lang/String;)V

    .line 336
    :cond_0
    const-string v6, "ChangeFriendlyName"

    invoke-virtual {v3, v6}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 337
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    sget-object v6, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->SET_FRIENDLY_NAME_ARGS_KEYS:[Ljava/lang/String;

    invoke-direct {p0, v0, v6, p2}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 338
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 339
    .local v4, "response":Ljava/lang/String;
    if-nez v4, :cond_1

    .line 344
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .end local v3    # "localDevice":Lorg/cybergarage/upnp/Device;
    .end local v4    # "response":Ljava/lang/String;
    :goto_0
    return v5

    .line 341
    .restart local v0    # "action":Lorg/cybergarage/upnp/Action;
    .restart local v1    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .restart local v3    # "localDevice":Lorg/cybergarage/upnp/Device;
    .restart local v4    # "response":Ljava/lang/String;
    :cond_1
    const/4 v5, 0x1

    goto :goto_0

    .line 342
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .end local v3    # "localDevice":Lorg/cybergarage/upnp/Device;
    .end local v4    # "response":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 343
    .local v2, "e":Ljava/lang/Exception;
    const-string v6, "UpnpDeviceList"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "set friendly name exception: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public setIconUsingUri(Landroid/net/Uri;Ljava/lang/String;)V
    .locals 9
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "udn"    # Ljava/lang/String;

    .prologue
    .line 570
    iget-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v6

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v2

    .line 571
    .local v2, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    invoke-virtual {v2, p2}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v3

    .line 572
    .local v3, "device":Lorg/cybergarage/upnp/Device;
    invoke-virtual {v3}, Lorg/cybergarage/upnp/Device;->getLogoURLFromDevice()Ljava/lang/String;

    move-result-object v5

    .line 574
    .local v5, "iconUrl":Ljava/lang/String;
    const-string v6, "UpnpDeviceList"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "URI: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " URL: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 576
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 577
    .local v0, "bfo":Landroid/graphics/BitmapFactory$Options;
    const/4 v6, 0x1

    iput v6, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 578
    const/4 v6, 0x0

    iput-boolean v6, v0, Landroid/graphics/BitmapFactory$Options;->inDither:Z

    .line 579
    const/4 v1, 0x0

    .line 581
    .local v1, "bitmap":Landroid/graphics/Bitmap;
    :try_start_0
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v6

    const-string v7, "file:///android_asset/www/img/belkin_sensor_small.png"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 582
    iget-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v6

    const-string v7, "www/img/belkin_sensor_small.png"

    invoke-virtual {v6, v7}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v6

    const/4 v7, 0x0

    invoke-static {v6, v7, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 605
    :goto_0
    if-eqz v1, :cond_0

    .line 606
    invoke-static {v1}, Lcom/belkin/utils/UploadFileUtil;->getByteArray(Landroid/graphics/Bitmap;)[B

    move-result-object v6

    const/16 v7, 0x3a98

    invoke-static {v5, v6, v7}, Lcom/belkin/utils/UploadFileUtil;->uploadFileToDevice(Ljava/lang/String;[BI)V

    .line 607
    iget-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v6}, Lcom/belkin/wemo/storage/FileStorage;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/storage/FileStorage;

    move-result-object v6

    const-string v7, "0"

    invoke-virtual {v3}, Lorg/cybergarage/upnp/Device;->getSerialNumber()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v5, v7, v8}, Lcom/belkin/wemo/storage/FileStorage;->saveIconFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    .line 614
    :cond_0
    :goto_1
    return-void

    .line 583
    :cond_1
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v6

    const-string v7, "file:///android_asset/www/img/belkin_switch_small.png"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 584
    iget-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v6

    const-string v7, "www/img/belkin_switch_small.png"

    invoke-virtual {v6, v7}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v6

    const/4 v7, 0x0

    invoke-static {v6, v7, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    goto :goto_0

    .line 585
    :cond_2
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v6

    const-string v7, "file:///android_asset/www/img/belkin_light_switch_small.png"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 586
    iget-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v6

    const-string v7, "www/img/belkin_light_switch_small.png"

    invoke-virtual {v6, v7}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v6

    const/4 v7, 0x0

    invoke-static {v6, v7, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    goto :goto_0

    .line 587
    :cond_3
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v6

    const-string v7, "file:///android_asset/www/img/belkin_insight_small.png"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 588
    iget-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v6

    const-string v7, "www/img/belkin_insight_small.png"

    invoke-virtual {v6, v7}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v6

    const/4 v7, 0x0

    invoke-static {v6, v7, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    goto :goto_0

    .line 589
    :cond_4
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v6

    const-string v7, "file:///android_asset/www/img/belkin_maker_small.png"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 590
    iget-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v6

    const-string v7, "www/img/belkin_maker_small.png"

    invoke-virtual {v6, v7}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v6

    const/4 v7, 0x0

    invoke-static {v6, v7, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    goto/16 :goto_0

    .line 591
    :cond_5
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v6

    const-string v7, "file:///android_asset/www/img/belkin_heater.png"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 592
    iget-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v6

    const-string v7, "www/img/belkin_heater.png"

    invoke-virtual {v6, v7}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v6

    const/4 v7, 0x0

    invoke-static {v6, v7, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    goto/16 :goto_0

    .line 593
    :cond_6
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v6

    const-string v7, "file:///android_asset/www/img/belkin_airpurifier.png"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_7

    .line 594
    iget-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v6

    const-string v7, "www/img/belkin_airpurifier.png"

    invoke-virtual {v6, v7}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v6

    const/4 v7, 0x0

    invoke-static {v6, v7, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    goto/16 :goto_0

    .line 595
    :cond_7
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v6

    const-string v7, "file:///android_asset/www/img/belkin_humidifier.png"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_8

    .line 596
    iget-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v6

    const-string v7, "www/img/belkin_humidifier.png"

    invoke-virtual {v6, v7}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v6

    const/4 v7, 0x0

    invoke-static {v6, v7, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    goto/16 :goto_0

    .line 597
    :cond_8
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v6

    const-string v7, "file:///android_asset/www/img/belkin_humidifierb.png"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_9

    .line 598
    iget-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v6

    const-string v7, "www/img/belkin_humidifierb.png"

    invoke-virtual {v6, v7}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v6

    const/4 v7, 0x0

    invoke-static {v6, v7, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    goto/16 :goto_0

    .line 599
    :cond_9
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v6

    const-string v7, "file:///android_asset/www/img/belkin_coffeemaker.png"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_a

    .line 600
    iget-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v6

    const-string v7, "www/img/belkin_coffeemaker.png"

    invoke-virtual {v6, v7}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v6

    const/4 v7, 0x0

    invoke-static {v6, v7, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    goto/16 :goto_0

    .line 602
    :cond_a
    iget-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    invoke-virtual {v6, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v6

    const/4 v7, 0x0

    invoke-static {v6, v7, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v1

    goto/16 :goto_0

    .line 609
    :catch_0
    move-exception v4

    .line 610
    .local v4, "e":Ljava/io/FileNotFoundException;
    invoke-virtual {v4}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto/16 :goto_1

    .line 611
    .end local v4    # "e":Ljava/io/FileNotFoundException;
    :catch_1
    move-exception v4

    .line 612
    .local v4, "e":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_1
.end method

.method public setLedDeviceStatus(Lorg/json/JSONArray;Lorg/json/JSONArray;)Lorg/json/JSONArray;
    .locals 9
    .param p1, "params"    # Lorg/json/JSONArray;
    .param p2, "Ledparams"    # Lorg/json/JSONArray;

    .prologue
    .line 1783
    new-instance v5, Lorg/json/JSONArray;

    invoke-direct {v5}, Lorg/json/JSONArray;-><init>()V

    .line 1784
    .local v5, "setStatus":Lorg/json/JSONArray;
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->jsonObject:Lorg/json/JSONObject;

    .line 1785
    const-string v6, "UpnpDeviceList"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "status of set status array:********"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "--"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1788
    const/4 v6, 0x0

    :try_start_0
    invoke-virtual {p1, v6}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->onORoff:Ljava/lang/String;

    .line 1790
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 1791
    .local v0, "devIds":Ljava/lang/StringBuffer;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-ge v2, v6, :cond_1

    .line 1792
    invoke-virtual {p2, v2}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1793
    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    if-ge v2, v6, :cond_0

    .line 1794
    const-string v6, ","

    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1791
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1797
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->deviceId:Ljava/lang/String;

    .line 1799
    const/4 v6, 0x1

    invoke-virtual {p1, v6}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->capabilityID:Ljava/lang/String;

    .line 1800
    const/4 v6, 0x2

    invoke-virtual {p1, v6}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->isGroupAction:Ljava/lang/String;

    .line 1801
    const-string v6, "UpnpDeviceList"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "status of set status:********"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->onORoff:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "------"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->deviceId:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1802
    new-instance v4, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$1;

    invoke-direct {v4, p0}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$1;-><init>(Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;)V

    .line 1821
    .local v4, "runnable":Ljava/lang/Runnable;
    new-instance v3, Ljava/lang/Thread;

    invoke-direct {v3, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 1822
    .local v3, "mythread":Ljava/lang/Thread;
    invoke-virtual {v3}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1828
    .end local v0    # "devIds":Ljava/lang/StringBuffer;
    .end local v2    # "i":I
    .end local v3    # "mythread":Ljava/lang/Thread;
    .end local v4    # "runnable":Ljava/lang/Runnable;
    :goto_1
    return-object v5

    .line 1824
    :catch_0
    move-exception v1

    .line 1825
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method public setLedFriendlyName(Lorg/json/JSONArray;)Lorg/json/JSONArray;
    .locals 12
    .param p1, "inParramArry"    # Lorg/json/JSONArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 1837
    new-instance v7, Lorg/json/JSONArray;

    invoke-direct {v7}, Lorg/json/JSONArray;-><init>()V

    .line 1838
    .local v7, "jsonStatus":Lorg/json/JSONArray;
    invoke-virtual {p1, v9}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v3

    .line 1839
    .local v3, "devId":Ljava/lang/String;
    invoke-virtual {p1, v10}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1840
    .local v5, "friendlyName":Ljava/lang/String;
    const-string v9, "UpnpDeviceList"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "devId: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " :friendlyName: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1842
    :try_start_0
    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v9}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v9

    invoke-virtual {v9}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v1

    .line 1843
    .local v1, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    if-eqz v1, :cond_2

    .line 1844
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v9

    invoke-virtual {v9}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v9

    if-ge v6, v9, :cond_1

    .line 1845
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v9

    invoke-virtual {v9, v6}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v9

    invoke-virtual {v9}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v9

    const-string v10, "Bridge"

    invoke-virtual {v9, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 1846
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v9

    invoke-virtual {v9, v6}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v9

    invoke-virtual {v9}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v9

    iput-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    .line 1844
    :cond_0
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 1849
    :cond_1
    const-string v9, "UpnpDeviceList"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "bridge udn if:---"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v11

    invoke-virtual {v11}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "--"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1852
    .end local v6    # "i":I
    :cond_2
    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    if-eqz v9, :cond_3

    .line 1853
    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    invoke-virtual {v1, v9}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v9

    const-string v10, "SetDeviceName"

    invoke-virtual {v9, v10}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 1854
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    sget-object v9, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->ARGS_LED_FRIENDLY_NAME:[Ljava/lang/String;

    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/String;

    const/4 v11, 0x0

    aput-object v3, v10, v11

    const/4 v11, 0x1

    aput-object v5, v10, v11

    invoke-direct {p0, v0, v9, v10}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 1855
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v8

    .line 1856
    .local v8, "response":Ljava/lang/String;
    const-string v9, "UpnpDeviceList"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "set friendly name: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1857
    if-eqz v8, :cond_3

    .line 1858
    new-instance v2, Lcom/belkin/upnp/parser/GetCreateGroupResponseParser;

    invoke-direct {v2}, Lcom/belkin/upnp/parser/GetCreateGroupResponseParser;-><init>()V

    .line 1859
    .local v2, "createGroupResponse":Lcom/belkin/upnp/parser/GetCreateGroupResponseParser;
    invoke-virtual {v2, v8}, Lcom/belkin/upnp/parser/GetCreateGroupResponseParser;->parseCreateGroupResponse(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v7

    .line 1863
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v2    # "createGroupResponse":Lcom/belkin/upnp/parser/GetCreateGroupResponseParser;
    .end local v8    # "response":Ljava/lang/String;
    :cond_3
    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v9}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v9

    invoke-virtual {v9, v3, v5}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->updateFriendlyName(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1868
    .end local v1    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    :goto_1
    return-object v7

    .line 1864
    :catch_0
    move-exception v4

    .line 1865
    .local v4, "e":Ljava/lang/Exception;
    const-string v9, "UpnpDeviceList"

    const-string v10, "Exception in setLedFriendlyName(): "

    invoke-static {v9, v10, v4}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method public setMultipleDeviceName(Lorg/json/JSONArray;Lcom/belkin/devices/callback/SetDeviceNameOnLinkCallBack;)V
    .locals 13
    .param p1, "inParramArry"    # Lorg/json/JSONArray;
    .param p2, "callback"    # Lcom/belkin/devices/callback/SetDeviceNameOnLinkCallBack;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v12, 0x1

    const/4 v11, 0x0

    .line 4460
    invoke-virtual {p1, v11}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 4461
    .local v7, "subDeviceIDs":Ljava/lang/String;
    invoke-virtual {p1, v12}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 4462
    .local v4, "friendlyNames":Ljava/lang/String;
    const/4 v6, 0x0

    .line 4463
    .local v6, "isRequestProcessed":Z
    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v9}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v9

    invoke-virtual {v9}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v2

    .line 4464
    .local v2, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    invoke-virtual {v2}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v9

    invoke-virtual {v9}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v9

    if-ge v5, v9, :cond_1

    .line 4465
    invoke-virtual {v2}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v9

    invoke-virtual {v9, v5}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v9

    invoke-virtual {v9}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v8

    .line 4466
    .local v8, "tempUDN":Ljava/lang/String;
    const-string v9, "Bridge"

    invoke-virtual {v8, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 4467
    iput-object v8, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    .line 4464
    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 4470
    .end local v8    # "tempUDN":Ljava/lang/String;
    :cond_1
    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    if-eqz v9, :cond_2

    .line 4471
    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mBridgeUdn:Ljava/lang/String;

    invoke-virtual {v2, v9}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v3

    .line 4472
    .local v3, "device":Lorg/cybergarage/upnp/Device;
    if-eqz v3, :cond_2

    .line 4473
    const-string v9, "SetDeviceNames"

    invoke-virtual {v3, v9}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 4474
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    if-eqz v0, :cond_2

    .line 4475
    sget-object v9, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->ARGS_MULTIPLE_DEVICE_FRIENDLY_NAME:[Ljava/lang/String;

    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/String;

    aput-object v7, v10, v11

    aput-object v4, v10, v12

    invoke-direct {p0, v0, v9, v10}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 4476
    new-instance v1, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$SetDeviceNamePostActionCallback;

    invoke-direct {v1, p0, p2}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$SetDeviceNamePostActionCallback;-><init>(Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;Lcom/belkin/devices/callback/SetDeviceNameOnLinkCallBack;)V

    .line 4477
    .local v1, "actionCallback":Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$SetDeviceNamePostActionCallback;
    const/4 v6, 0x1

    .line 4479
    invoke-static {}, Lcom/belkin/cybergarage/wrapper/ControlActionHandler;->newInstance()Lcom/belkin/cybergarage/wrapper/ControlActionHandler;

    move-result-object v9

    invoke-virtual {v9, v0, v1, v1}, Lcom/belkin/cybergarage/wrapper/ControlActionHandler;->postControlAction(Lorg/cybergarage/upnp/Action;Lcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionErrorCallback;Lcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionSuccessCallback;)V

    .line 4484
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "actionCallback":Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$SetDeviceNamePostActionCallback;
    .end local v3    # "device":Lorg/cybergarage/upnp/Device;
    :cond_2
    if-nez v6, :cond_3

    .line 4485
    invoke-virtual {p2}, Lcom/belkin/devices/callback/SetDeviceNameOnLinkCallBack;->onError()V

    .line 4487
    :cond_3
    return-void
.end method

.method public setNightLightStatus([Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p1, "argList"    # [Ljava/lang/String;

    .prologue
    .line 4251
    :try_start_0
    iget-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v5}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v5

    invoke-virtual {v5}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v1

    .line 4252
    .local v1, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    const/4 v5, 0x0

    aget-object v5, p1, v5

    invoke-virtual {v1, v5}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v2

    .line 4253
    .local v2, "device":Lorg/cybergarage/upnp/Device;
    const-string v5, "UpnpDeviceList"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "setNightLightStatus device: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " argList[0]: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const/4 v7, 0x0

    aget-object v7, p1, v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 4254
    const-string v5, "SetNightLightStatus"

    invoke-virtual {v2, v5}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 4255
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    const-string v5, "UpnpDeviceList"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "setNightLightStatus argList[1]: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const/4 v7, 0x1

    aget-object v7, p1, v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 4256
    sget-object v5, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->NIGHT_LIGHT_STATUS:[Ljava/lang/String;

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    const/4 v8, 0x1

    aget-object v8, p1, v8

    aput-object v8, v6, v7

    invoke-direct {p0, v0, v5, v6}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 4257
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v4

    .line 4258
    .local v4, "response":Ljava/lang/String;
    const-string v5, "UpnpDeviceList"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "SET NIGHT LIGHT STATUS :: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 4259
    const-string v5, "true"
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 4263
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .end local v2    # "device":Lorg/cybergarage/upnp/Device;
    .end local v4    # "response":Ljava/lang/String;
    :goto_0
    return-object v5

    .line 4260
    :catch_0
    move-exception v3

    .line 4261
    .local v3, "exception":Ljava/lang/Exception;
    const-string v5, "UpnpDeviceList"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "SET NIGHT LIGHT STATUS :: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 4263
    const-string v5, "false"

    goto :goto_0
.end method

.method public setNotifyMessage([Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p1, "notifyMessage"    # [Ljava/lang/String;

    .prologue
    .line 2100
    const-string v4, ""

    .line 2101
    .local v4, "status":Ljava/lang/String;
    const/4 v3, 0x0

    .line 2102
    .local v3, "isMakerDevice":Z
    const/4 v0, 0x0

    .line 2103
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    iget-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v6

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v1

    .line 2105
    .local v1, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    const/4 v6, 0x3

    :try_start_0
    aget-object v5, p1, v6

    .line 2106
    .local v5, "udn":Ljava/lang/String;
    const-string v6, "UpnpDeviceList"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Set Notify Message. Device UDN: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const/4 v8, 0x3

    aget-object v8, p1, v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2108
    iget-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v5, v6}, Lcom/belkin/wemo/utils/WeMoUtils;->areFetchStoreAPIsSupportedInLocal(Ljava/lang/String;Landroid/content/Context;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 2110
    const-string v6, "uuid:Maker"

    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 2111
    const/4 v3, 0x1

    .line 2112
    const-string v6, ":sensor"

    const-string v7, ":sensor:switch"

    invoke-virtual {v5, v6, v7}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v5

    .line 2114
    :cond_0
    if-eqz v3, :cond_2

    .line 2115
    invoke-virtual {v1, v5}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v6

    const-string v7, "SetRuleID"

    invoke-virtual {v6, v7}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 2120
    :goto_0
    sget-object v6, Lcom/belkin/wemo/cache/utils/Constants;->SET_RULE_ID:[Ljava/lang/String;

    invoke-direct {p0, v0, v6, p1}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 2121
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    .line 2124
    :cond_1
    const-string v4, "true"

    .line 2130
    .end local v5    # "udn":Ljava/lang/String;
    :goto_1
    return-object v4

    .line 2118
    .restart local v5    # "udn":Ljava/lang/String;
    :cond_2
    const/4 v6, 0x3

    aget-object v6, p1, v6

    invoke-virtual {v1, v6}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v6

    const-string v7, "SetRuleID"

    invoke-virtual {v6, v7}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    goto :goto_0

    .line 2125
    .end local v5    # "udn":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 2126
    .local v2, "e":Ljava/lang/Exception;
    const-string v6, "UpnpDeviceList"

    const-string v7, "Exception during SET_RULE_ID action to device: "

    invoke-static {v6, v7, v2}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2127
    const-string v4, "false"

    goto :goto_1
.end method

.method public setParametersValues(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Z
    .locals 6
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "constant"    # Ljava/lang/String;
    .param p3, "attributes"    # [Ljava/lang/String;
    .param p4, "data"    # [Ljava/lang/String;

    .prologue
    .line 4022
    iget-object v3, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v1

    .line 4023
    .local v1, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    invoke-virtual {v1, p1}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v3

    invoke-virtual {v3, p2}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 4024
    .local v0, "actionObj":Lorg/cybergarage/upnp/Action;
    if-eqz v0, :cond_0

    .line 4025
    invoke-direct {p0, v0, p3, p4}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 4026
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v2

    .line 4028
    .local v2, "response":Ljava/lang/String;
    const-string v3, "UpnpDeviceList"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Set new values, action :  res : UDN : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 4029
    if-nez v2, :cond_0

    .line 4030
    const/4 v3, 0x0

    .line 4032
    .end local v2    # "response":Ljava/lang/String;
    :goto_0
    return v3

    :cond_0
    const/4 v3, 0x1

    goto :goto_0
.end method

.method public setPragmaInDB(Landroid/content/Context;I)V
    .locals 2
    .param p1, "mContext"    # Landroid/content/Context;
    .param p2, "version"    # I

    .prologue
    .line 974
    new-instance v1, Lcom/belkin/utils/RuleUtility;

    invoke-direct {v1, p1}, Lcom/belkin/utils/RuleUtility;-><init>(Landroid/content/Context;)V

    .line 976
    .local v1, "ruleUtility":Lcom/belkin/utils/RuleUtility;
    :try_start_0
    invoke-virtual {v1, p2}, Lcom/belkin/utils/RuleUtility;->setPragmaVersion(I)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 980
    :goto_0
    return-void

    .line 977
    :catch_0
    move-exception v0

    .line 978
    .local v0, "excep":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public setValueFromAction(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 6
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "constant"    # Ljava/lang/String;
    .param p3, "newValue"    # Ljava/lang/String;
    .param p4, "argumentValue"    # Ljava/lang/String;

    .prologue
    .line 3999
    iget-object v3, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v1

    .line 4000
    .local v1, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    invoke-virtual {v1, p1}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v3

    invoke-virtual {v3, p2}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 4001
    .local v0, "actionObj":Lorg/cybergarage/upnp/Action;
    if-eqz v0, :cond_0

    .line 4002
    invoke-virtual {v0, p4, p3}, Lorg/cybergarage/upnp/Action;->setArgumentValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 4003
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v2

    .line 4005
    .local v2, "response":Ljava/lang/String;
    const-string v3, "UpnpDeviceList"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Set new value res : constant : UDN : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 4006
    if-nez v2, :cond_0

    .line 4007
    const/4 v3, 0x0

    .line 4009
    .end local v2    # "response":Ljava/lang/String;
    :goto_0
    return v3

    :cond_0
    const/4 v3, 0x1

    goto :goto_0
.end method

.method public simulatedRuleDataAction([Ljava/lang/String;)Z
    .locals 17
    .param p1, "deviceList"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 2303
    const-string v13, ""

    .line 2304
    .local v13, "udn":Ljava/lang/String;
    const-string v1, "UpnpDeviceList.simulatedRuleDatadeviceList"

    .line 2305
    .local v1, "TAG1":Ljava/lang/String;
    const-string v7, ""

    .line 2306
    .local v7, "finalDeviceList":Ljava/lang/String;
    const-string v3, ""

    .line 2307
    .local v3, "bridgeUdn":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v14}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v14

    invoke-virtual {v14}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v4

    .line 2310
    .local v4, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    const/4 v14, 0x0

    :try_start_0
    aget-object v13, p1, v14

    .line 2311
    const/4 v5, 0x0

    .local v5, "count":I
    :goto_0
    move-object/from16 v0, p1

    array-length v14, v0

    if-gt v5, v14, :cond_3

    .line 2313
    aget-object v13, p1, v5

    .line 2314
    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v14

    if-nez v14, :cond_0

    .line 2315
    const-string v14, "["

    const-string v15, ""

    invoke-virtual {v13, v14, v15}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v8

    .line 2316
    .local v8, "repUdn":Ljava/lang/String;
    const-string v14, "]"

    const-string v15, ""

    invoke-virtual {v8, v14, v15}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v9

    .line 2317
    .local v9, "repUdn1":Ljava/lang/String;
    const-string v14, "\""

    const-string v15, ""

    invoke-virtual {v9, v14, v15}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 2318
    .local v10, "repUdn2":Ljava/lang/String;
    const-string v14, ":"

    invoke-virtual {v10, v14}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v11

    .line 2319
    .local v11, "repUdnSplit":[Ljava/lang/String;
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v15, 0x0

    aget-object v15, v11, v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ":"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const/4 v15, 0x1

    aget-object v15, v11, v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 2320
    const/4 v14, 0x1

    aget-object v14, v11, v14

    const-string v15, "Bridge"

    invoke-virtual {v14, v15}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v14

    if-eqz v14, :cond_1

    .line 2321
    invoke-direct/range {p0 .. p1}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->createSimulatedRuleBridgeXml([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 2322
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "final xml BRIDGE::"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v1, v14}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2323
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->argumentsArray:[Ljava/lang/String;

    const/4 v15, 0x0

    aput-object v7, v14, v15

    .line 2324
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->argumentsArray:[Ljava/lang/String;

    const/4 v15, 0x1

    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v16, v0

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v16

    aput-object v16, v14, v15

    .line 2325
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "simulateddata: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v1, v14}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2326
    invoke-virtual {v4, v3}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v14

    const-string v15, "SimulatedRuleData"

    invoke-virtual {v14, v15}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v2

    .line 2327
    .local v2, "action":Lorg/cybergarage/upnp/Action;
    sget-object v14, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->SIMULATED_DEVICELIST_COUNTER:[Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->argumentsArray:[Ljava/lang/String;

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v14, v15}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 2328
    invoke-virtual {v2}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v12

    .line 2329
    .local v12, "response":Ljava/lang/String;
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "action response bridge:: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v1, v14}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2311
    .end local v2    # "action":Lorg/cybergarage/upnp/Action;
    .end local v8    # "repUdn":Ljava/lang/String;
    .end local v9    # "repUdn1":Ljava/lang/String;
    .end local v10    # "repUdn2":Ljava/lang/String;
    .end local v11    # "repUdnSplit":[Ljava/lang/String;
    .end local v12    # "response":Ljava/lang/String;
    :cond_0
    :goto_1
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_0

    .line 2331
    .restart local v8    # "repUdn":Ljava/lang/String;
    .restart local v9    # "repUdn1":Ljava/lang/String;
    .restart local v10    # "repUdn2":Ljava/lang/String;
    .restart local v11    # "repUdnSplit":[Ljava/lang/String;
    :cond_1
    invoke-direct/range {p0 .. p1}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->createSimulatedRuleXml([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 2332
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "final xml SNS::"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v1, v14}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2333
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->argumentsArray:[Ljava/lang/String;

    const/4 v15, 0x0

    aput-object v7, v14, v15

    .line 2334
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->argumentsArray:[Ljava/lang/String;

    const/4 v15, 0x1

    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v16, v0

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v16

    aput-object v16, v14, v15

    .line 2335
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "repUdn2"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v1, v14}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2336
    const-string v14, "uuid:Maker"

    invoke-virtual {v10, v14}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v14

    if-eqz v14, :cond_2

    .line 2337
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v15, 0x0

    aget-object v15, v11, v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ":"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const/4 v15, 0x1

    aget-object v15, v11, v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ":sensor:switch"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 2339
    :cond_2
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Changed repUdn2"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v1, v14}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2340
    invoke-virtual {v4, v10}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v14

    const-string v15, "SimulatedRuleData"

    invoke-virtual {v14, v15}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v2

    .line 2341
    .restart local v2    # "action":Lorg/cybergarage/upnp/Action;
    sget-object v14, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->SIMULATED_DEVICELIST_COUNTER:[Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->argumentsArray:[Ljava/lang/String;

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v14, v15}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 2342
    invoke-virtual {v2}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v12

    .line 2343
    .restart local v12    # "response":Ljava/lang/String;
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "action response SNS:: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v1, v14}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_1

    .line 2349
    .end local v2    # "action":Lorg/cybergarage/upnp/Action;
    .end local v5    # "count":I
    .end local v8    # "repUdn":Ljava/lang/String;
    .end local v9    # "repUdn1":Ljava/lang/String;
    .end local v10    # "repUdn2":Ljava/lang/String;
    .end local v11    # "repUdnSplit":[Ljava/lang/String;
    .end local v12    # "response":Ljava/lang/String;
    :catch_0
    move-exception v6

    .line 2350
    .local v6, "exception":Ljava/lang/Exception;
    const/4 v14, 0x0

    .end local v6    # "exception":Ljava/lang/Exception;
    :goto_2
    return v14

    .line 2348
    .restart local v5    # "count":I
    :cond_3
    const/4 v14, 0x1

    goto :goto_2
.end method

.method public updateFirmware(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 11
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "newFirmwareVersion"    # Ljava/lang/String;
    .param p3, "newFirmwareURL"    # Ljava/lang/String;
    .param p4, "newFirmwareSign"    # Ljava/lang/String;
    .param p5, "startTime"    # Ljava/lang/String;

    .prologue
    .line 3598
    const-string v7, "FIRMWARE UPGRADE"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "UDN:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " Upgrade FirmwareVersion:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " Upgrade FirmwareVersionURL:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 3600
    :try_start_0
    new-instance v6, Ljava/text/SimpleDateFormat;

    const-string v7, "dd/MM/yyyy"

    invoke-direct {v6, v7}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 3601
    .local v6, "timeStampFormat":Ljava/text/SimpleDateFormat;
    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    .line 3602
    .local v2, "date":Ljava/util/Date;
    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v7

    invoke-virtual {v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v1

    .line 3603
    .local v1, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    invoke-virtual {v1, p1}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v3

    .line 3604
    .local v3, "device":Lorg/cybergarage/upnp/Device;
    const-string v7, "UpdateFirmware"

    invoke-virtual {v3, v7}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 3605
    .local v0, "actionPost":Lorg/cybergarage/upnp/Action;
    if-eqz v0, :cond_0

    .line 3606
    sget-object v7, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->SET_UPDATE_FIRMWARE_ARGS:[Ljava/lang/String;

    const/4 v8, 0x5

    new-array v8, v8, [Ljava/lang/String;

    const/4 v9, 0x0

    aput-object p2, v8, v9

    const/4 v9, 0x1

    invoke-virtual {v6, v2}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x2

    aput-object p3, v8, v9

    const/4 v9, 0x3

    aput-object p4, v8, v9

    const/4 v9, 0x4

    aput-object p5, v8, v9

    invoke-direct {p0, v0, v7, v8}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 3609
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v5

    .line 3610
    .local v5, "response":Ljava/lang/String;
    const-string v7, "FIRMWARE UPGRADE"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "UDN:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " Firmware Upgrade UPNP Response:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 3612
    invoke-virtual {v5}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v7

    const-string v8, "success"

    invoke-virtual {v7, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v7

    if-eqz v7, :cond_0

    .line 3613
    const/4 v7, 0x1

    .line 3621
    .end local v0    # "actionPost":Lorg/cybergarage/upnp/Action;
    .end local v1    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .end local v2    # "date":Ljava/util/Date;
    .end local v3    # "device":Lorg/cybergarage/upnp/Device;
    .end local v5    # "response":Ljava/lang/String;
    .end local v6    # "timeStampFormat":Ljava/text/SimpleDateFormat;
    :goto_0
    return v7

    .line 3617
    :catch_0
    move-exception v4

    .line 3619
    .local v4, "e":Ljava/lang/Exception;
    const-string v7, "FIRMWARE UPGRADE"

    invoke-virtual {v4}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 3621
    .end local v4    # "e":Ljava/lang/Exception;
    :cond_0
    const/4 v7, 0x0

    goto :goto_0
.end method

.method public updateWeeklyCalenderString([Ljava/lang/String;)Ljava/lang/String;
    .locals 11
    .param p1, "weeklyRecord"    # [Ljava/lang/String;

    .prologue
    .line 2216
    const-string v6, ""

    .local v6, "status":Ljava/lang/String;
    const-string v4, ""

    .line 2217
    .local v4, "mBridgeUdn":Ljava/lang/String;
    iget-object v8, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->mContext:Landroid/content/Context;

    invoke-static {v8}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v8

    invoke-virtual {v8}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v1

    .line 2219
    .local v1, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    if-eqz p1, :cond_3

    .line 2220
    const/4 v8, 0x7

    :try_start_0
    aget-object v8, p1, v8

    if-eqz v8, :cond_0

    const/4 v8, 0x7

    aget-object v8, p1, v8

    const-string v9, "uuid"

    invoke-virtual {v8, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 2221
    const-string v8, "UpnpDeviceList"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "updateWeeklyCalenderString controlPoint.getDevice(weeklyRecord[7]) : "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const/4 v10, 0x7

    aget-object v10, p1, v10

    invoke-virtual {v1, v10}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2222
    const/4 v8, 0x7

    aget-object v8, p1, v8

    invoke-virtual {v1, v8}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v8

    const-string v9, "UpdateWeeklyCalendar"

    invoke-virtual {v8, v9}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 2223
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    sget-object v8, Lcom/belkin/wemo/cache/utils/Constants;->SET_UPDATE_WEEKLY_CALENDER_ARGS:[Ljava/lang/String;

    invoke-direct {p0, v0, v8, p1}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 2224
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    .line 2237
    :goto_0
    const-string v6, "true"

    .line 2246
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    :goto_1
    return-object v6

    .line 2226
    :cond_0
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_2
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v8

    invoke-virtual {v8}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v8

    if-ge v3, v8, :cond_2

    .line 2227
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v8

    invoke-virtual {v8, v3}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v8

    invoke-virtual {v8}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v8

    const-string v9, "Bridge"

    invoke-virtual {v8, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 2228
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v8

    invoke-virtual {v8, v3}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v8

    invoke-virtual {v8}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v4

    .line 2226
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 2231
    :cond_2
    invoke-virtual {p0, p1}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->createCalendarList([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 2232
    .local v7, "weeklyList":Ljava/lang/String;
    invoke-virtual {v1, v4}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v8

    const-string v9, "UpdateWeeklyCalendar"

    invoke-virtual {v8, v9}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 2233
    .restart local v0    # "action":Lorg/cybergarage/upnp/Action;
    sget-object v8, Lcom/belkin/wemo/cache/utils/Constants;->SET_UPDATE_WEEKLY_CALENDER_LED_ARGS:[Ljava/lang/String;

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/String;

    const/4 v10, 0x0

    aput-object v7, v9, v10

    invoke-direct {p0, v0, v8, v9}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 2234
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v5

    .line 2235
    .local v5, "res":Ljava/lang/String;
    const-string v8, "UpnpDeviceList"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "response : "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 2241
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v3    # "i":I
    .end local v5    # "res":Ljava/lang/String;
    .end local v7    # "weeklyList":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 2242
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 2243
    const-string v6, "false"

    goto :goto_1

    .line 2239
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_3
    :try_start_1
    const-string v6, "false"
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method
