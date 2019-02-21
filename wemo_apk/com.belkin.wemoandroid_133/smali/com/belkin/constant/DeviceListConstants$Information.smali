.class public final enum Lcom/belkin/constant/DeviceListConstants$Information;
.super Ljava/lang/Enum;
.source "DeviceListConstants.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/constant/DeviceListConstants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Information"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/belkin/constant/DeviceListConstants$Information;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/belkin/constant/DeviceListConstants$Information;

.field public static final enum BRIDGEUDN:Lcom/belkin/constant/DeviceListConstants$Information;

.field public static final enum HOMEID:Lcom/belkin/constant/DeviceListConstants$Information;

.field public static final enum HWVERSION:Lcom/belkin/constant/DeviceListConstants$Information;

.field public static final enum IP:Lcom/belkin/constant/DeviceListConstants$Information;

.field public static final enum MAC:Lcom/belkin/constant/DeviceListConstants$Information;

.field public static final enum MANUFACTURER:Lcom/belkin/constant/DeviceListConstants$Information;

.field public static final enum MODElCODE:Lcom/belkin/constant/DeviceListConstants$Information;

.field public static final enum PARENTNAME:Lcom/belkin/constant/DeviceListConstants$Information;

.field public static final enum PLUGINID:Lcom/belkin/constant/DeviceListConstants$Information;

.field public static final enum PORT:Lcom/belkin/constant/DeviceListConstants$Information;

.field public static final enum PRODUCTNAME:Lcom/belkin/constant/DeviceListConstants$Information;

.field public static final enum PRODUCTTYPE:Lcom/belkin/constant/DeviceListConstants$Information;

.field public static final enum SERIALNUMBER:Lcom/belkin/constant/DeviceListConstants$Information;

.field public static final enum SSID:Lcom/belkin/constant/DeviceListConstants$Information;

.field public static final enum TYPE:Lcom/belkin/constant/DeviceListConstants$Information;

.field public static final enum UDN:Lcom/belkin/constant/DeviceListConstants$Information;

.field public static final enum WEMOCERTIFIED:Lcom/belkin/constant/DeviceListConstants$Information;

.field public static infos:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/belkin/constant/DeviceListConstants$Information;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final value:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 10
    new-instance v0, Lcom/belkin/constant/DeviceListConstants$Information;

    const-string v1, "UDN"

    const-string v2, "UDN"

    invoke-direct {v0, v1, v4, v2}, Lcom/belkin/constant/DeviceListConstants$Information;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/belkin/constant/DeviceListConstants$Information;->UDN:Lcom/belkin/constant/DeviceListConstants$Information;

    new-instance v0, Lcom/belkin/constant/DeviceListConstants$Information;

    const-string v1, "TYPE"

    const-string v2, "Type"

    invoke-direct {v0, v1, v5, v2}, Lcom/belkin/constant/DeviceListConstants$Information;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/belkin/constant/DeviceListConstants$Information;->TYPE:Lcom/belkin/constant/DeviceListConstants$Information;

    new-instance v0, Lcom/belkin/constant/DeviceListConstants$Information;

    const-string v1, "MAC"

    const-string v2, "MAC"

    invoke-direct {v0, v1, v6, v2}, Lcom/belkin/constant/DeviceListConstants$Information;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/belkin/constant/DeviceListConstants$Information;->MAC:Lcom/belkin/constant/DeviceListConstants$Information;

    new-instance v0, Lcom/belkin/constant/DeviceListConstants$Information;

    const-string v1, "PLUGINID"

    const-string v2, "PluginID"

    invoke-direct {v0, v1, v7, v2}, Lcom/belkin/constant/DeviceListConstants$Information;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/belkin/constant/DeviceListConstants$Information;->PLUGINID:Lcom/belkin/constant/DeviceListConstants$Information;

    new-instance v0, Lcom/belkin/constant/DeviceListConstants$Information;

    const-string v1, "HOMEID"

    const-string v2, "HomeID"

    invoke-direct {v0, v1, v8, v2}, Lcom/belkin/constant/DeviceListConstants$Information;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/belkin/constant/DeviceListConstants$Information;->HOMEID:Lcom/belkin/constant/DeviceListConstants$Information;

    new-instance v0, Lcom/belkin/constant/DeviceListConstants$Information;

    const-string v1, "MODElCODE"

    const/4 v2, 0x5

    const-string v3, "ModelCode"

    invoke-direct {v0, v1, v2, v3}, Lcom/belkin/constant/DeviceListConstants$Information;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/belkin/constant/DeviceListConstants$Information;->MODElCODE:Lcom/belkin/constant/DeviceListConstants$Information;

    new-instance v0, Lcom/belkin/constant/DeviceListConstants$Information;

    const-string v1, "IP"

    const/4 v2, 0x6

    const-string v3, "IP"

    invoke-direct {v0, v1, v2, v3}, Lcom/belkin/constant/DeviceListConstants$Information;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/belkin/constant/DeviceListConstants$Information;->IP:Lcom/belkin/constant/DeviceListConstants$Information;

    new-instance v0, Lcom/belkin/constant/DeviceListConstants$Information;

    const-string v1, "PORT"

    const/4 v2, 0x7

    const-string v3, "Port"

    invoke-direct {v0, v1, v2, v3}, Lcom/belkin/constant/DeviceListConstants$Information;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/belkin/constant/DeviceListConstants$Information;->PORT:Lcom/belkin/constant/DeviceListConstants$Information;

    new-instance v0, Lcom/belkin/constant/DeviceListConstants$Information;

    const-string v1, "MANUFACTURER"

    const/16 v2, 0x8

    const-string v3, "ManufacturerName"

    invoke-direct {v0, v1, v2, v3}, Lcom/belkin/constant/DeviceListConstants$Information;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/belkin/constant/DeviceListConstants$Information;->MANUFACTURER:Lcom/belkin/constant/DeviceListConstants$Information;

    new-instance v0, Lcom/belkin/constant/DeviceListConstants$Information;

    const-string v1, "WEMOCERTIFIED"

    const/16 v2, 0x9

    const-string v3, "WemoCertified"

    invoke-direct {v0, v1, v2, v3}, Lcom/belkin/constant/DeviceListConstants$Information;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/belkin/constant/DeviceListConstants$Information;->WEMOCERTIFIED:Lcom/belkin/constant/DeviceListConstants$Information;

    new-instance v0, Lcom/belkin/constant/DeviceListConstants$Information;

    const-string v1, "BRIDGEUDN"

    const/16 v2, 0xa

    const-string v3, "BridgeUDN"

    invoke-direct {v0, v1, v2, v3}, Lcom/belkin/constant/DeviceListConstants$Information;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/belkin/constant/DeviceListConstants$Information;->BRIDGEUDN:Lcom/belkin/constant/DeviceListConstants$Information;

    new-instance v0, Lcom/belkin/constant/DeviceListConstants$Information;

    const-string v1, "PRODUCTTYPE"

    const/16 v2, 0xb

    const-string v3, "ProductType"

    invoke-direct {v0, v1, v2, v3}, Lcom/belkin/constant/DeviceListConstants$Information;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/belkin/constant/DeviceListConstants$Information;->PRODUCTTYPE:Lcom/belkin/constant/DeviceListConstants$Information;

    new-instance v0, Lcom/belkin/constant/DeviceListConstants$Information;

    const-string v1, "PRODUCTNAME"

    const/16 v2, 0xc

    const-string v3, "ProductName"

    invoke-direct {v0, v1, v2, v3}, Lcom/belkin/constant/DeviceListConstants$Information;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/belkin/constant/DeviceListConstants$Information;->PRODUCTNAME:Lcom/belkin/constant/DeviceListConstants$Information;

    new-instance v0, Lcom/belkin/constant/DeviceListConstants$Information;

    const-string v1, "HWVERSION"

    const/16 v2, 0xd

    const-string v3, "HwVersion"

    invoke-direct {v0, v1, v2, v3}, Lcom/belkin/constant/DeviceListConstants$Information;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/belkin/constant/DeviceListConstants$Information;->HWVERSION:Lcom/belkin/constant/DeviceListConstants$Information;

    .line 11
    new-instance v0, Lcom/belkin/constant/DeviceListConstants$Information;

    const-string v1, "SSID"

    const/16 v2, 0xe

    const-string v3, "SSID"

    invoke-direct {v0, v1, v2, v3}, Lcom/belkin/constant/DeviceListConstants$Information;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/belkin/constant/DeviceListConstants$Information;->SSID:Lcom/belkin/constant/DeviceListConstants$Information;

    new-instance v0, Lcom/belkin/constant/DeviceListConstants$Information;

    const-string v1, "PARENTNAME"

    const/16 v2, 0xf

    const-string v3, "ParentName"

    invoke-direct {v0, v1, v2, v3}, Lcom/belkin/constant/DeviceListConstants$Information;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/belkin/constant/DeviceListConstants$Information;->PARENTNAME:Lcom/belkin/constant/DeviceListConstants$Information;

    new-instance v0, Lcom/belkin/constant/DeviceListConstants$Information;

    const-string v1, "SERIALNUMBER"

    const/16 v2, 0x10

    const-string v3, "SerialNumber"

    invoke-direct {v0, v1, v2, v3}, Lcom/belkin/constant/DeviceListConstants$Information;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/belkin/constant/DeviceListConstants$Information;->SERIALNUMBER:Lcom/belkin/constant/DeviceListConstants$Information;

    .line 9
    const/16 v0, 0x11

    new-array v0, v0, [Lcom/belkin/constant/DeviceListConstants$Information;

    sget-object v1, Lcom/belkin/constant/DeviceListConstants$Information;->UDN:Lcom/belkin/constant/DeviceListConstants$Information;

    aput-object v1, v0, v4

    sget-object v1, Lcom/belkin/constant/DeviceListConstants$Information;->TYPE:Lcom/belkin/constant/DeviceListConstants$Information;

    aput-object v1, v0, v5

    sget-object v1, Lcom/belkin/constant/DeviceListConstants$Information;->MAC:Lcom/belkin/constant/DeviceListConstants$Information;

    aput-object v1, v0, v6

    sget-object v1, Lcom/belkin/constant/DeviceListConstants$Information;->PLUGINID:Lcom/belkin/constant/DeviceListConstants$Information;

    aput-object v1, v0, v7

    sget-object v1, Lcom/belkin/constant/DeviceListConstants$Information;->HOMEID:Lcom/belkin/constant/DeviceListConstants$Information;

    aput-object v1, v0, v8

    const/4 v1, 0x5

    sget-object v2, Lcom/belkin/constant/DeviceListConstants$Information;->MODElCODE:Lcom/belkin/constant/DeviceListConstants$Information;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/belkin/constant/DeviceListConstants$Information;->IP:Lcom/belkin/constant/DeviceListConstants$Information;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/belkin/constant/DeviceListConstants$Information;->PORT:Lcom/belkin/constant/DeviceListConstants$Information;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/belkin/constant/DeviceListConstants$Information;->MANUFACTURER:Lcom/belkin/constant/DeviceListConstants$Information;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/belkin/constant/DeviceListConstants$Information;->WEMOCERTIFIED:Lcom/belkin/constant/DeviceListConstants$Information;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lcom/belkin/constant/DeviceListConstants$Information;->BRIDGEUDN:Lcom/belkin/constant/DeviceListConstants$Information;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lcom/belkin/constant/DeviceListConstants$Information;->PRODUCTTYPE:Lcom/belkin/constant/DeviceListConstants$Information;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lcom/belkin/constant/DeviceListConstants$Information;->PRODUCTNAME:Lcom/belkin/constant/DeviceListConstants$Information;

    aput-object v2, v0, v1

    const/16 v1, 0xd

    sget-object v2, Lcom/belkin/constant/DeviceListConstants$Information;->HWVERSION:Lcom/belkin/constant/DeviceListConstants$Information;

    aput-object v2, v0, v1

    const/16 v1, 0xe

    sget-object v2, Lcom/belkin/constant/DeviceListConstants$Information;->SSID:Lcom/belkin/constant/DeviceListConstants$Information;

    aput-object v2, v0, v1

    const/16 v1, 0xf

    sget-object v2, Lcom/belkin/constant/DeviceListConstants$Information;->PARENTNAME:Lcom/belkin/constant/DeviceListConstants$Information;

    aput-object v2, v0, v1

    const/16 v1, 0x10

    sget-object v2, Lcom/belkin/constant/DeviceListConstants$Information;->SERIALNUMBER:Lcom/belkin/constant/DeviceListConstants$Information;

    aput-object v2, v0, v1

    sput-object v0, Lcom/belkin/constant/DeviceListConstants$Information;->$VALUES:[Lcom/belkin/constant/DeviceListConstants$Information;

    .line 22
    const-class v0, Lcom/belkin/constant/DeviceListConstants$Information;

    invoke-static {v0}, Ljava/util/EnumSet;->allOf(Ljava/lang/Class;)Ljava/util/EnumSet;

    move-result-object v0

    sput-object v0, Lcom/belkin/constant/DeviceListConstants$Information;->infos:Ljava/util/Set;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .param p3, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 13
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 14
    iput-object p3, p0, Lcom/belkin/constant/DeviceListConstants$Information;->value:Ljava/lang/String;

    .line 15
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/belkin/constant/DeviceListConstants$Information;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 9
    const-class v0, Lcom/belkin/constant/DeviceListConstants$Information;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/belkin/constant/DeviceListConstants$Information;

    return-object v0
.end method

.method public static values()[Lcom/belkin/constant/DeviceListConstants$Information;
    .locals 1

    .prologue
    .line 9
    sget-object v0, Lcom/belkin/constant/DeviceListConstants$Information;->$VALUES:[Lcom/belkin/constant/DeviceListConstants$Information;

    invoke-virtual {v0}, [Lcom/belkin/constant/DeviceListConstants$Information;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/belkin/constant/DeviceListConstants$Information;

    return-object v0
.end method


# virtual methods
.method public getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 18
    iget-object v0, p0, Lcom/belkin/constant/DeviceListConstants$Information;->value:Ljava/lang/String;

    return-object v0
.end method
