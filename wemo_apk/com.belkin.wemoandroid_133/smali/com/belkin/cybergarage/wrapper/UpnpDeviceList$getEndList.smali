.class final enum Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$getEndList;
.super Ljava/lang/Enum;
.source "UpnpDeviceList.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "getEndList"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$getEndList;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$getEndList;

.field public static final enum ALL_LIST:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$getEndList;

.field public static final enum PAIRED_LIST:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$getEndList;

.field public static final enum SCAN_LIST:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$getEndList;

.field public static final enum UNPAIRED_LIST:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$getEndList;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 1350
    new-instance v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$getEndList;

    const-string v1, "SCAN_LIST"

    invoke-direct {v0, v1, v2}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$getEndList;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$getEndList;->SCAN_LIST:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$getEndList;

    new-instance v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$getEndList;

    const-string v1, "ALL_LIST"

    invoke-direct {v0, v1, v3}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$getEndList;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$getEndList;->ALL_LIST:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$getEndList;

    new-instance v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$getEndList;

    const-string v1, "PAIRED_LIST"

    invoke-direct {v0, v1, v4}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$getEndList;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$getEndList;->PAIRED_LIST:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$getEndList;

    new-instance v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$getEndList;

    const-string v1, "UNPAIRED_LIST"

    invoke-direct {v0, v1, v5}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$getEndList;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$getEndList;->UNPAIRED_LIST:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$getEndList;

    .line 1349
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$getEndList;

    sget-object v1, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$getEndList;->SCAN_LIST:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$getEndList;

    aput-object v1, v0, v2

    sget-object v1, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$getEndList;->ALL_LIST:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$getEndList;

    aput-object v1, v0, v3

    sget-object v1, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$getEndList;->PAIRED_LIST:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$getEndList;

    aput-object v1, v0, v4

    sget-object v1, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$getEndList;->UNPAIRED_LIST:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$getEndList;

    aput-object v1, v0, v5

    sput-object v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$getEndList;->$VALUES:[Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$getEndList;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 1349
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$getEndList;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 1349
    const-class v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$getEndList;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$getEndList;

    return-object v0
.end method

.method public static values()[Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$getEndList;
    .locals 1

    .prologue
    .line 1349
    sget-object v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$getEndList;->$VALUES:[Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$getEndList;

    invoke-virtual {v0}, [Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$getEndList;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$getEndList;

    return-object v0
.end method