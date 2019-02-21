.class public final enum Lcom/belkin/constant/DeviceListConstants$Attributes;
.super Ljava/lang/Enum;
.source "DeviceListConstants.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/constant/DeviceListConstants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Attributes"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/belkin/constant/DeviceListConstants$Attributes;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/belkin/constant/DeviceListConstants$Attributes;

.field public static final enum ATTRIBUTELIST:Lcom/belkin/constant/DeviceListConstants$Attributes;

.field public static attributes:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/belkin/constant/DeviceListConstants$Attributes;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final value:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 44
    new-instance v0, Lcom/belkin/constant/DeviceListConstants$Attributes;

    const-string v1, "ATTRIBUTELIST"

    const-string v2, "AttributeList"

    invoke-direct {v0, v1, v3, v2}, Lcom/belkin/constant/DeviceListConstants$Attributes;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/belkin/constant/DeviceListConstants$Attributes;->ATTRIBUTELIST:Lcom/belkin/constant/DeviceListConstants$Attributes;

    .line 43
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/belkin/constant/DeviceListConstants$Attributes;

    sget-object v1, Lcom/belkin/constant/DeviceListConstants$Attributes;->ATTRIBUTELIST:Lcom/belkin/constant/DeviceListConstants$Attributes;

    aput-object v1, v0, v3

    sput-object v0, Lcom/belkin/constant/DeviceListConstants$Attributes;->$VALUES:[Lcom/belkin/constant/DeviceListConstants$Attributes;

    .line 55
    const-class v0, Lcom/belkin/constant/DeviceListConstants$Attributes;

    invoke-static {v0}, Ljava/util/EnumSet;->allOf(Ljava/lang/Class;)Ljava/util/EnumSet;

    move-result-object v0

    sput-object v0, Lcom/belkin/constant/DeviceListConstants$Attributes;->attributes:Ljava/util/Set;

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
    .line 46
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 47
    iput-object p3, p0, Lcom/belkin/constant/DeviceListConstants$Attributes;->value:Ljava/lang/String;

    .line 48
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/belkin/constant/DeviceListConstants$Attributes;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 43
    const-class v0, Lcom/belkin/constant/DeviceListConstants$Attributes;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/belkin/constant/DeviceListConstants$Attributes;

    return-object v0
.end method

.method public static values()[Lcom/belkin/constant/DeviceListConstants$Attributes;
    .locals 1

    .prologue
    .line 43
    sget-object v0, Lcom/belkin/constant/DeviceListConstants$Attributes;->$VALUES:[Lcom/belkin/constant/DeviceListConstants$Attributes;

    invoke-virtual {v0}, [Lcom/belkin/constant/DeviceListConstants$Attributes;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/belkin/constant/DeviceListConstants$Attributes;

    return-object v0
.end method


# virtual methods
.method public getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/belkin/constant/DeviceListConstants$Attributes;->value:Ljava/lang/String;

    return-object v0
.end method
