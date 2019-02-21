.class public Lcom/luckycatlabs/sunrisesunset/Zenith;
.super Ljava/lang/Object;
.source "Zenith.java"


# static fields
.field public static final ASTRONOMICAL:Lcom/luckycatlabs/sunrisesunset/Zenith;

.field public static final CIVIL:Lcom/luckycatlabs/sunrisesunset/Zenith;

.field public static final NAUTICAL:Lcom/luckycatlabs/sunrisesunset/Zenith;

.field public static final OFFICIAL:Lcom/luckycatlabs/sunrisesunset/Zenith;


# instance fields
.field private final degrees:Ljava/math/BigDecimal;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 26
    new-instance v0, Lcom/luckycatlabs/sunrisesunset/Zenith;

    const-wide/high16 v2, 0x405b000000000000L    # 108.0

    invoke-direct {v0, v2, v3}, Lcom/luckycatlabs/sunrisesunset/Zenith;-><init>(D)V

    sput-object v0, Lcom/luckycatlabs/sunrisesunset/Zenith;->ASTRONOMICAL:Lcom/luckycatlabs/sunrisesunset/Zenith;

    .line 29
    new-instance v0, Lcom/luckycatlabs/sunrisesunset/Zenith;

    const-wide v2, 0x4059800000000000L    # 102.0

    invoke-direct {v0, v2, v3}, Lcom/luckycatlabs/sunrisesunset/Zenith;-><init>(D)V

    sput-object v0, Lcom/luckycatlabs/sunrisesunset/Zenith;->NAUTICAL:Lcom/luckycatlabs/sunrisesunset/Zenith;

    .line 32
    new-instance v0, Lcom/luckycatlabs/sunrisesunset/Zenith;

    const-wide/high16 v2, 0x4058000000000000L    # 96.0

    invoke-direct {v0, v2, v3}, Lcom/luckycatlabs/sunrisesunset/Zenith;-><init>(D)V

    sput-object v0, Lcom/luckycatlabs/sunrisesunset/Zenith;->CIVIL:Lcom/luckycatlabs/sunrisesunset/Zenith;

    .line 35
    new-instance v0, Lcom/luckycatlabs/sunrisesunset/Zenith;

    const-wide v2, 0x4056b554c985f06fL    # 90.8333

    invoke-direct {v0, v2, v3}, Lcom/luckycatlabs/sunrisesunset/Zenith;-><init>(D)V

    sput-object v0, Lcom/luckycatlabs/sunrisesunset/Zenith;->OFFICIAL:Lcom/luckycatlabs/sunrisesunset/Zenith;

    return-void
.end method

.method public constructor <init>(D)V
    .locals 1
    .param p1, "degrees"    # D

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    invoke-static {p1, p2}, Ljava/math/BigDecimal;->valueOf(D)Ljava/math/BigDecimal;

    move-result-object v0

    iput-object v0, p0, Lcom/luckycatlabs/sunrisesunset/Zenith;->degrees:Ljava/math/BigDecimal;

    .line 41
    return-void
.end method


# virtual methods
.method public degrees()Ljava/math/BigDecimal;
    .locals 1

    .prologue
    .line 44
    iget-object v0, p0, Lcom/luckycatlabs/sunrisesunset/Zenith;->degrees:Ljava/math/BigDecimal;

    return-object v0
.end method
