.class public final enum Lcom/belkin/constant/DeviceListConstants$Properties;
.super Ljava/lang/Enum;
.source "DeviceListConstants.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/constant/DeviceListConstants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Properties"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/belkin/constant/DeviceListConstants$Properties;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/belkin/constant/DeviceListConstants$Properties;

.field public static final enum CUSTOMIZEDSTATE:Lcom/belkin/constant/DeviceListConstants$Properties;

.field public static final enum DISCOVERYSTATE:Lcom/belkin/constant/DeviceListConstants$Properties;

.field public static final enum FIRMWAREVERSION:Lcom/belkin/constant/DeviceListConstants$Properties;

.field public static final enum FRIENDLYNAME:Lcom/belkin/constant/DeviceListConstants$Properties;

.field public static final enum FWSTATUS:Lcom/belkin/constant/DeviceListConstants$Properties;

.field public static final enum GROUPICON:Lcom/belkin/constant/DeviceListConstants$Properties;

.field public static final enum GROUPID:Lcom/belkin/constant/DeviceListConstants$Properties;

.field public static final enum GROUPNAME:Lcom/belkin/constant/DeviceListConstants$Properties;

.field public static final enum HIDE:Lcom/belkin/constant/DeviceListConstants$Properties;

.field public static final enum ICON:Lcom/belkin/constant/DeviceListConstants$Properties;

.field public static final enum ICONVERSION:Lcom/belkin/constant/DeviceListConstants$Properties;

.field public static final enum INACTIVE:Lcom/belkin/constant/DeviceListConstants$Properties;

.field public static final enum ISDISCOVERED:Lcom/belkin/constant/DeviceListConstants$Properties;

.field public static final enum REMOTE:Lcom/belkin/constant/DeviceListConstants$Properties;

.field public static final enum STATE:Lcom/belkin/constant/DeviceListConstants$Properties;

.field public static final enum STATUSTS:Lcom/belkin/constant/DeviceListConstants$Properties;

.field public static properties:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/belkin/constant/DeviceListConstants$Properties;",
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

    .line 27
    new-instance v0, Lcom/belkin/constant/DeviceListConstants$Properties;

    const-string v1, "ICON"

    const-string v2, "Icon"

    invoke-direct {v0, v1, v4, v2}, Lcom/belkin/constant/DeviceListConstants$Properties;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/belkin/constant/DeviceListConstants$Properties;->ICON:Lcom/belkin/constant/DeviceListConstants$Properties;

    new-instance v0, Lcom/belkin/constant/DeviceListConstants$Properties;

    const-string v1, "FRIENDLYNAME"

    const-string v2, "FriendlyName"

    invoke-direct {v0, v1, v5, v2}, Lcom/belkin/constant/DeviceListConstants$Properties;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/belkin/constant/DeviceListConstants$Properties;->FRIENDLYNAME:Lcom/belkin/constant/DeviceListConstants$Properties;

    new-instance v0, Lcom/belkin/constant/DeviceListConstants$Properties;

    const-string v1, "FIRMWAREVERSION"

    const-string v2, "FirmwareVersion"

    invoke-direct {v0, v1, v6, v2}, Lcom/belkin/constant/DeviceListConstants$Properties;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/belkin/constant/DeviceListConstants$Properties;->FIRMWAREVERSION:Lcom/belkin/constant/DeviceListConstants$Properties;

    new-instance v0, Lcom/belkin/constant/DeviceListConstants$Properties;

    const-string v1, "STATE"

    const-string v2, "State"

    invoke-direct {v0, v1, v7, v2}, Lcom/belkin/constant/DeviceListConstants$Properties;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/belkin/constant/DeviceListConstants$Properties;->STATE:Lcom/belkin/constant/DeviceListConstants$Properties;

    new-instance v0, Lcom/belkin/constant/DeviceListConstants$Properties;

    const-string v1, "INACTIVE"

    const-string v2, "InActive"

    invoke-direct {v0, v1, v8, v2}, Lcom/belkin/constant/DeviceListConstants$Properties;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/belkin/constant/DeviceListConstants$Properties;->INACTIVE:Lcom/belkin/constant/DeviceListConstants$Properties;

    new-instance v0, Lcom/belkin/constant/DeviceListConstants$Properties;

    const-string v1, "CUSTOMIZEDSTATE"

    const/4 v2, 0x5

    const-string v3, "CustomizedState"

    invoke-direct {v0, v1, v2, v3}, Lcom/belkin/constant/DeviceListConstants$Properties;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/belkin/constant/DeviceListConstants$Properties;->CUSTOMIZEDSTATE:Lcom/belkin/constant/DeviceListConstants$Properties;

    new-instance v0, Lcom/belkin/constant/DeviceListConstants$Properties;

    const-string v1, "DISCOVERYSTATE"

    const/4 v2, 0x6

    const-string v3, "DiscoveryState"

    invoke-direct {v0, v1, v2, v3}, Lcom/belkin/constant/DeviceListConstants$Properties;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/belkin/constant/DeviceListConstants$Properties;->DISCOVERYSTATE:Lcom/belkin/constant/DeviceListConstants$Properties;

    new-instance v0, Lcom/belkin/constant/DeviceListConstants$Properties;

    const-string v1, "HIDE"

    const/4 v2, 0x7

    const-string v3, "Hide"

    invoke-direct {v0, v1, v2, v3}, Lcom/belkin/constant/DeviceListConstants$Properties;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/belkin/constant/DeviceListConstants$Properties;->HIDE:Lcom/belkin/constant/DeviceListConstants$Properties;

    new-instance v0, Lcom/belkin/constant/DeviceListConstants$Properties;

    const-string v1, "ISDISCOVERED"

    const/16 v2, 0x8

    const-string v3, "IsDiscovered"

    invoke-direct {v0, v1, v2, v3}, Lcom/belkin/constant/DeviceListConstants$Properties;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/belkin/constant/DeviceListConstants$Properties;->ISDISCOVERED:Lcom/belkin/constant/DeviceListConstants$Properties;

    .line 28
    new-instance v0, Lcom/belkin/constant/DeviceListConstants$Properties;

    const-string v1, "REMOTE"

    const/16 v2, 0x9

    const-string v3, "IsRemote"

    invoke-direct {v0, v1, v2, v3}, Lcom/belkin/constant/DeviceListConstants$Properties;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/belkin/constant/DeviceListConstants$Properties;->REMOTE:Lcom/belkin/constant/DeviceListConstants$Properties;

    new-instance v0, Lcom/belkin/constant/DeviceListConstants$Properties;

    const-string v1, "STATUSTS"

    const/16 v2, 0xa

    const-string v3, "StatusTS"

    invoke-direct {v0, v1, v2, v3}, Lcom/belkin/constant/DeviceListConstants$Properties;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/belkin/constant/DeviceListConstants$Properties;->STATUSTS:Lcom/belkin/constant/DeviceListConstants$Properties;

    new-instance v0, Lcom/belkin/constant/DeviceListConstants$Properties;

    const-string v1, "GROUPID"

    const/16 v2, 0xb

    const-string v3, "GroupID"

    invoke-direct {v0, v1, v2, v3}, Lcom/belkin/constant/DeviceListConstants$Properties;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/belkin/constant/DeviceListConstants$Properties;->GROUPID:Lcom/belkin/constant/DeviceListConstants$Properties;

    new-instance v0, Lcom/belkin/constant/DeviceListConstants$Properties;

    const-string v1, "GROUPNAME"

    const/16 v2, 0xc

    const-string v3, "GroupName"

    invoke-direct {v0, v1, v2, v3}, Lcom/belkin/constant/DeviceListConstants$Properties;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/belkin/constant/DeviceListConstants$Properties;->GROUPNAME:Lcom/belkin/constant/DeviceListConstants$Properties;

    new-instance v0, Lcom/belkin/constant/DeviceListConstants$Properties;

    const-string v1, "GROUPICON"

    const/16 v2, 0xd

    const-string v3, "GroupIcon"

    invoke-direct {v0, v1, v2, v3}, Lcom/belkin/constant/DeviceListConstants$Properties;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/belkin/constant/DeviceListConstants$Properties;->GROUPICON:Lcom/belkin/constant/DeviceListConstants$Properties;

    new-instance v0, Lcom/belkin/constant/DeviceListConstants$Properties;

    const-string v1, "FWSTATUS"

    const/16 v2, 0xe

    const-string v3, "FwStatus"

    invoke-direct {v0, v1, v2, v3}, Lcom/belkin/constant/DeviceListConstants$Properties;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/belkin/constant/DeviceListConstants$Properties;->FWSTATUS:Lcom/belkin/constant/DeviceListConstants$Properties;

    new-instance v0, Lcom/belkin/constant/DeviceListConstants$Properties;

    const-string v1, "ICONVERSION"

    const/16 v2, 0xf

    const-string v3, "IconVersion"

    invoke-direct {v0, v1, v2, v3}, Lcom/belkin/constant/DeviceListConstants$Properties;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/belkin/constant/DeviceListConstants$Properties;->ICONVERSION:Lcom/belkin/constant/DeviceListConstants$Properties;

    .line 26
    const/16 v0, 0x10

    new-array v0, v0, [Lcom/belkin/constant/DeviceListConstants$Properties;

    sget-object v1, Lcom/belkin/constant/DeviceListConstants$Properties;->ICON:Lcom/belkin/constant/DeviceListConstants$Properties;

    aput-object v1, v0, v4

    sget-object v1, Lcom/belkin/constant/DeviceListConstants$Properties;->FRIENDLYNAME:Lcom/belkin/constant/DeviceListConstants$Properties;

    aput-object v1, v0, v5

    sget-object v1, Lcom/belkin/constant/DeviceListConstants$Properties;->FIRMWAREVERSION:Lcom/belkin/constant/DeviceListConstants$Properties;

    aput-object v1, v0, v6

    sget-object v1, Lcom/belkin/constant/DeviceListConstants$Properties;->STATE:Lcom/belkin/constant/DeviceListConstants$Properties;

    aput-object v1, v0, v7

    sget-object v1, Lcom/belkin/constant/DeviceListConstants$Properties;->INACTIVE:Lcom/belkin/constant/DeviceListConstants$Properties;

    aput-object v1, v0, v8

    const/4 v1, 0x5

    sget-object v2, Lcom/belkin/constant/DeviceListConstants$Properties;->CUSTOMIZEDSTATE:Lcom/belkin/constant/DeviceListConstants$Properties;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/belkin/constant/DeviceListConstants$Properties;->DISCOVERYSTATE:Lcom/belkin/constant/DeviceListConstants$Properties;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/belkin/constant/DeviceListConstants$Properties;->HIDE:Lcom/belkin/constant/DeviceListConstants$Properties;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/belkin/constant/DeviceListConstants$Properties;->ISDISCOVERED:Lcom/belkin/constant/DeviceListConstants$Properties;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/belkin/constant/DeviceListConstants$Properties;->REMOTE:Lcom/belkin/constant/DeviceListConstants$Properties;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lcom/belkin/constant/DeviceListConstants$Properties;->STATUSTS:Lcom/belkin/constant/DeviceListConstants$Properties;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lcom/belkin/constant/DeviceListConstants$Properties;->GROUPID:Lcom/belkin/constant/DeviceListConstants$Properties;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lcom/belkin/constant/DeviceListConstants$Properties;->GROUPNAME:Lcom/belkin/constant/DeviceListConstants$Properties;

    aput-object v2, v0, v1

    const/16 v1, 0xd

    sget-object v2, Lcom/belkin/constant/DeviceListConstants$Properties;->GROUPICON:Lcom/belkin/constant/DeviceListConstants$Properties;

    aput-object v2, v0, v1

    const/16 v1, 0xe

    sget-object v2, Lcom/belkin/constant/DeviceListConstants$Properties;->FWSTATUS:Lcom/belkin/constant/DeviceListConstants$Properties;

    aput-object v2, v0, v1

    const/16 v1, 0xf

    sget-object v2, Lcom/belkin/constant/DeviceListConstants$Properties;->ICONVERSION:Lcom/belkin/constant/DeviceListConstants$Properties;

    aput-object v2, v0, v1

    sput-object v0, Lcom/belkin/constant/DeviceListConstants$Properties;->$VALUES:[Lcom/belkin/constant/DeviceListConstants$Properties;

    .line 40
    const-class v0, Lcom/belkin/constant/DeviceListConstants$Properties;

    invoke-static {v0}, Ljava/util/EnumSet;->allOf(Ljava/lang/Class;)Ljava/util/EnumSet;

    move-result-object v0

    sput-object v0, Lcom/belkin/constant/DeviceListConstants$Properties;->properties:Ljava/util/Set;

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
    .line 30
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 31
    iput-object p3, p0, Lcom/belkin/constant/DeviceListConstants$Properties;->value:Ljava/lang/String;

    .line 32
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/belkin/constant/DeviceListConstants$Properties;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 26
    const-class v0, Lcom/belkin/constant/DeviceListConstants$Properties;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/belkin/constant/DeviceListConstants$Properties;

    return-object v0
.end method

.method public static values()[Lcom/belkin/constant/DeviceListConstants$Properties;
    .locals 1

    .prologue
    .line 26
    sget-object v0, Lcom/belkin/constant/DeviceListConstants$Properties;->$VALUES:[Lcom/belkin/constant/DeviceListConstants$Properties;

    invoke-virtual {v0}, [Lcom/belkin/constant/DeviceListConstants$Properties;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/belkin/constant/DeviceListConstants$Properties;

    return-object v0
.end method


# virtual methods
.method public getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 35
    iget-object v0, p0, Lcom/belkin/constant/DeviceListConstants$Properties;->value:Ljava/lang/String;

    return-object v0
.end method
