.class public Lcom/belkin/wemo/cache/utils/WemoAppRecovery;
.super Ljava/lang/Object;
.source "WemoAppRecovery.java"


# static fields
.field public static final ERROR_CODE_002:Ljava/lang/String; = "ERR_002"

.field public static final ERROR_CODE_414:Ljava/lang/String; = "WEMO_414"

.field public static final ERROR_CODE_415:Ljava/lang/String; = "WEMO_415"

.field public static final KEY_CODE:Ljava/lang/String; = "code"

.field public static final KEY_ERROR:Ljava/lang/String; = "Error"

.field public static final KEY_RESULT_CODE:Ljava/lang/String; = "resultCode"

.field public static final KEY_error:Ljava/lang/String; = "error"

.field public static final STATUS_CODE_400:I = 0x190

.field public static final STATUS_CODE_403:I = 0x193

.field private static final TAG:Ljava/lang/String; = "SDK_CloudRequestForAppRecovery"

.field private static appRecovery:Lcom/belkin/wemo/cache/utils/WemoAppRecovery;

.field private static mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;


# instance fields
.field public consistentFlag:Z

.field public counter:I

.field public maxRetryCount:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 21
    const/4 v0, 0x0

    sput-object v0, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->appRecovery:Lcom/belkin/wemo/cache/utils/WemoAppRecovery;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    iput-boolean v0, p0, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->consistentFlag:Z

    .line 8
    iput v0, p0, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->counter:I

    .line 9
    iput v0, p0, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->maxRetryCount:I

    .line 31
    new-instance v0, Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-direct {v0, p1}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    .line 32
    return-void
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/utils/WemoAppRecovery;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 24
    const-class v1, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->appRecovery:Lcom/belkin/wemo/cache/utils/WemoAppRecovery;

    if-nez v0, :cond_0

    .line 25
    new-instance v0, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;

    invoke-direct {v0, p0}, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->appRecovery:Lcom/belkin/wemo/cache/utils/WemoAppRecovery;

    .line 27
    :cond_0
    invoke-static {}, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->initAppRecoveryData()Lcom/belkin/wemo/cache/utils/WemoAppRecovery;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit v1

    return-object v0

    .line 24
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static initAppRecoveryData()Lcom/belkin/wemo/cache/utils/WemoAppRecovery;
    .locals 3

    .prologue
    .line 42
    sget-object v0, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->appRecovery:Lcom/belkin/wemo/cache/utils/WemoAppRecovery;

    sget-object v1, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getAppRecoveryFlag()Z

    move-result v1

    iput-boolean v1, v0, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->consistentFlag:Z

    .line 43
    sget-object v0, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->appRecovery:Lcom/belkin/wemo/cache/utils/WemoAppRecovery;

    sget-object v1, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getAppRecoveryCounter()I

    move-result v1

    iput v1, v0, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->counter:I

    .line 44
    sget-object v0, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->appRecovery:Lcom/belkin/wemo/cache/utils/WemoAppRecovery;

    sget-object v1, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getAppRecoveryMaxCount()I

    move-result v1

    iput v1, v0, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->maxRetryCount:I

    .line 45
    const-string v0, "SDK_CloudRequestForAppRecovery"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "initAppRecoveryData :: AppRecovery values are :: consistentFlag :: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->appRecovery:Lcom/belkin/wemo/cache/utils/WemoAppRecovery;

    iget-boolean v2, v2, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->consistentFlag:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " :: counter :: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->appRecovery:Lcom/belkin/wemo/cache/utils/WemoAppRecovery;

    iget v2, v2, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->counter:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " :: appRecovery.maxRetryCount  :: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->appRecovery:Lcom/belkin/wemo/cache/utils/WemoAppRecovery;

    iget v2, v2, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->maxRetryCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    sget-object v0, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->appRecovery:Lcom/belkin/wemo/cache/utils/WemoAppRecovery;

    return-object v0
.end method


# virtual methods
.method public setAppRecoveryData(Lcom/belkin/wemo/cache/utils/WemoAppRecovery;)V
    .locals 3
    .param p1, "appRecovery"    # Lcom/belkin/wemo/cache/utils/WemoAppRecovery;

    .prologue
    .line 35
    const-string v0, "SDK_CloudRequestForAppRecovery"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setAppRecoveryData :: AppRecovery values are :: consistentFlag :: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p1, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->consistentFlag:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " :: counter :: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p1, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->counter:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " :: appRecovery.maxRetryCount  :: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p1, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->maxRetryCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    sget-object v0, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    iget-boolean v1, p1, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->consistentFlag:Z

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setAppRecoveryFlag(Z)V

    .line 37
    sget-object v0, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    iget v1, p1, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->counter:I

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setAppRecoveryCounter(I)V

    .line 38
    sget-object v0, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    iget v1, p1, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->maxRetryCount:I

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setAppRecoveryMaxCount(I)V

    .line 39
    return-void
.end method
