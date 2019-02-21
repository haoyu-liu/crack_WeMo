.class public Lcom/belkin/wemo/cache/utils/NetworkMode;
.super Ljava/lang/Object;
.source "NetworkMode.java"


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static appNetworkType:Ljava/lang/String;

.field private static isLocal:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 5
    const/4 v0, 0x1

    sput-boolean v0, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal:Z

    .line 6
    const-class v0, Lcom/belkin/wemo/cache/utils/NetworkMode;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/cache/utils/NetworkMode;->TAG:Ljava/lang/String;

    .line 7
    const-string v0, "Home"

    sput-object v0, Lcom/belkin/wemo/cache/utils/NetworkMode;->appNetworkType:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getAppNetworkType()Ljava/lang/String;
    .locals 3

    .prologue
    .line 22
    sget-object v0, Lcom/belkin/wemo/cache/utils/NetworkMode;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Get App Network Type"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/belkin/wemo/cache/utils/NetworkMode;->appNetworkType:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    sget-object v0, Lcom/belkin/wemo/cache/utils/NetworkMode;->appNetworkType:Ljava/lang/String;

    return-object v0
.end method

.method public static isLocal()Z
    .locals 3

    .prologue
    .line 11
    sget-object v0, Lcom/belkin/wemo/cache/utils/NetworkMode;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Network Mode isLocal: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-boolean v2, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    sget-boolean v0, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal:Z

    return v0
.end method

.method public static setAppNetworkType(Ljava/lang/String;)V
    .locals 3
    .param p0, "networkType"    # Ljava/lang/String;

    .prologue
    .line 27
    sget-object v0, Lcom/belkin/wemo/cache/utils/NetworkMode;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Set App Network Type"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    sput-object p0, Lcom/belkin/wemo/cache/utils/NetworkMode;->appNetworkType:Ljava/lang/String;

    .line 29
    return-void
.end method

.method public static setLocal(Z)V
    .locals 3
    .param p0, "local"    # Z

    .prologue
    .line 17
    sget-object v0, Lcom/belkin/wemo/cache/utils/NetworkMode;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Setting Network Mode: isLocal = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    sput-boolean p0, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal:Z

    .line 19
    return-void
.end method
