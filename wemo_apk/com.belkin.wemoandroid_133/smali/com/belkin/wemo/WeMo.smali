.class public final enum Lcom/belkin/wemo/WeMo;
.super Ljava/lang/Enum;
.source "WeMo.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/belkin/wemo/WeMo;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/belkin/wemo/WeMo;

.field public static final enum INSTANCE:Lcom/belkin/wemo/WeMo;

.field private static apiKey:Ljava/lang/String;

.field private static context:Landroid/content/Context;

.field private static mainHandler:Landroid/os/Handler;

.field private static mainLooper:Landroid/os/Looper;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 14
    new-instance v0, Lcom/belkin/wemo/WeMo;

    const-string v1, "INSTANCE"

    invoke-direct {v0, v1, v2}, Lcom/belkin/wemo/WeMo;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/belkin/wemo/WeMo;->INSTANCE:Lcom/belkin/wemo/WeMo;

    .line 12
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/belkin/wemo/WeMo;

    sget-object v1, Lcom/belkin/wemo/WeMo;->INSTANCE:Lcom/belkin/wemo/WeMo;

    aput-object v1, v0, v2

    sput-object v0, Lcom/belkin/wemo/WeMo;->$VALUES:[Lcom/belkin/wemo/WeMo;

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
    .line 12
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static getMainHandler()Landroid/os/Handler;
    .locals 1

    .prologue
    .line 62
    sget-object v0, Lcom/belkin/wemo/WeMo;->mainHandler:Landroid/os/Handler;

    return-object v0
.end method

.method public static getMainLooper()Landroid/os/Looper;
    .locals 1

    .prologue
    .line 55
    sget-object v0, Lcom/belkin/wemo/WeMo;->mainLooper:Landroid/os/Looper;

    return-object v0
.end method

.method public static initialize(Ljava/lang/String;Landroid/content/Context;)V
    .locals 2
    .param p0, "apiKey"    # Ljava/lang/String;
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/exception/WeMoInitException;
        }
    .end annotation

    .prologue
    .line 28
    if-nez p1, :cond_0

    .line 29
    new-instance v0, Lcom/belkin/wemo/exception/WeMoInitException;

    const-string v1, "Context in NULL!"

    invoke-direct {v0, v1}, Lcom/belkin/wemo/exception/WeMoInitException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 32
    :cond_0
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 33
    new-instance v0, Lcom/belkin/wemo/exception/WeMoInitException;

    const-string v1, "Invalid WEMO SDK API key."

    invoke-direct {v0, v1}, Lcom/belkin/wemo/exception/WeMoInitException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 36
    :cond_1
    sput-object p1, Lcom/belkin/wemo/WeMo;->context:Landroid/content/Context;

    .line 37
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/WeMo;->mainLooper:Landroid/os/Looper;

    .line 38
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcom/belkin/wemo/WeMo;->mainHandler:Landroid/os/Handler;

    .line 39
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/belkin/wemo/WeMo;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 12
    const-class v0, Lcom/belkin/wemo/WeMo;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/WeMo;

    return-object v0
.end method

.method public static values()[Lcom/belkin/wemo/WeMo;
    .locals 1

    .prologue
    .line 12
    sget-object v0, Lcom/belkin/wemo/WeMo;->$VALUES:[Lcom/belkin/wemo/WeMo;

    invoke-virtual {v0}, [Lcom/belkin/wemo/WeMo;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/belkin/wemo/WeMo;

    return-object v0
.end method


# virtual methods
.method public destroy()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 42
    sput-object v0, Lcom/belkin/wemo/WeMo;->context:Landroid/content/Context;

    .line 43
    sput-object v0, Lcom/belkin/wemo/WeMo;->mainHandler:Landroid/os/Handler;

    .line 44
    sput-object v0, Lcom/belkin/wemo/WeMo;->mainHandler:Landroid/os/Handler;

    .line 45
    return-void
.end method

.method public getApiKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 23
    sget-object v0, Lcom/belkin/wemo/WeMo;->apiKey:Ljava/lang/String;

    return-object v0
.end method

.method public getContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 48
    sget-object v0, Lcom/belkin/wemo/WeMo;->context:Landroid/content/Context;

    return-object v0
.end method
