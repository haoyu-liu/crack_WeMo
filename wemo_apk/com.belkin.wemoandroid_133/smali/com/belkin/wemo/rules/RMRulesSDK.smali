.class public Lcom/belkin/wemo/rules/RMRulesSDK;
.super Ljava/lang/Object;
.source "RMRulesSDK.java"


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static isInitialized:Z

.field private static provider:Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;

.field private static rulesSDK:Lcom/belkin/wemo/rules/RMRulesSDK;


# instance fields
.field private rules:Lcom/belkin/wemo/rules/RMIRules;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 14
    const-class v0, Lcom/belkin/wemo/rules/RMRulesSDK;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/rules/RMRulesSDK;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iget-object v0, p0, Lcom/belkin/wemo/rules/RMRulesSDK;->rules:Lcom/belkin/wemo/rules/RMIRules;

    if-nez v0, :cond_0

    .line 18
    new-instance v0, Lcom/belkin/wemo/rules/impl/RMRulesImpl;

    invoke-direct {v0}, Lcom/belkin/wemo/rules/impl/RMRulesImpl;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/rules/RMRulesSDK;->rules:Lcom/belkin/wemo/rules/RMIRules;

    .line 20
    :cond_0
    return-void
.end method

.method public static declared-synchronized init()V
    .locals 4

    .prologue
    .line 32
    const-class v1, Lcom/belkin/wemo/rules/RMRulesSDK;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/belkin/wemo/rules/RMRulesSDK;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "RULES SDK DEFAULT INIT REQUESTED. Is already initialized: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-boolean v3, Lcom/belkin/wemo/rules/RMRulesSDK;->isInitialized:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    sget-boolean v0, Lcom/belkin/wemo/rules/RMRulesSDK;->isInitialized:Z

    if-nez v0, :cond_0

    .line 34
    new-instance v0, Lcom/belkin/wemo/rules/RMRulesDependencyProviderImpl;

    invoke-direct {v0}, Lcom/belkin/wemo/rules/RMRulesDependencyProviderImpl;-><init>()V

    sput-object v0, Lcom/belkin/wemo/rules/RMRulesSDK;->provider:Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;

    .line 35
    const/4 v0, 0x1

    sput-boolean v0, Lcom/belkin/wemo/rules/RMRulesSDK;->isInitialized:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    :cond_0
    monitor-exit v1

    return-void

    .line 32
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static declared-synchronized init(Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;)V
    .locals 4
    .param p0, "provider"    # Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;

    .prologue
    .line 44
    const-class v1, Lcom/belkin/wemo/rules/RMRulesSDK;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/belkin/wemo/rules/RMRulesSDK;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "RULES SDK INIT REQUESTED (CUSTOM DEPENDENCY PROVIDED). Is already initialized: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-boolean v3, Lcom/belkin/wemo/rules/RMRulesSDK;->isInitialized:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    sget-boolean v0, Lcom/belkin/wemo/rules/RMRulesSDK;->isInitialized:Z

    if-nez v0, :cond_0

    .line 46
    sput-object p0, Lcom/belkin/wemo/rules/RMRulesSDK;->provider:Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;

    .line 47
    const/4 v0, 0x1

    sput-boolean v0, Lcom/belkin/wemo/rules/RMRulesSDK;->isInitialized:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    :cond_0
    monitor-exit v1

    return-void

    .line 44
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static declared-synchronized instance()Lcom/belkin/wemo/rules/RMRulesSDK;
    .locals 2

    .prologue
    .line 23
    const-class v1, Lcom/belkin/wemo/rules/RMRulesSDK;

    monitor-enter v1

    :try_start_0
    sget-boolean v0, Lcom/belkin/wemo/rules/RMRulesSDK;->isInitialized:Z

    if-eqz v0, :cond_0

    .line 24
    sget-object v0, Lcom/belkin/wemo/rules/RMRulesSDK;->rulesSDK:Lcom/belkin/wemo/rules/RMRulesSDK;

    if-nez v0, :cond_0

    .line 25
    new-instance v0, Lcom/belkin/wemo/rules/RMRulesSDK;

    invoke-direct {v0}, Lcom/belkin/wemo/rules/RMRulesSDK;-><init>()V

    sput-object v0, Lcom/belkin/wemo/rules/RMRulesSDK;->rulesSDK:Lcom/belkin/wemo/rules/RMRulesSDK;

    .line 28
    :cond_0
    sget-object v0, Lcom/belkin/wemo/rules/RMRulesSDK;->rulesSDK:Lcom/belkin/wemo/rules/RMRulesSDK;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 23
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static declared-synchronized isInitialized()Z
    .locals 2

    .prologue
    .line 40
    const-class v0, Lcom/belkin/wemo/rules/RMRulesSDK;

    monitor-enter v0

    :try_start_0
    sget-boolean v1, Lcom/belkin/wemo/rules/RMRulesSDK;->isInitialized:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static declared-synchronized tearDown()V
    .locals 3

    .prologue
    .line 52
    const-class v1, Lcom/belkin/wemo/rules/RMRulesSDK;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/belkin/wemo/rules/RMRulesSDK;->TAG:Ljava/lang/String;

    const-string v2, "RULES SDK TEARDOWN REQUESTED."

    invoke-static {v0, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    sget-object v0, Lcom/belkin/wemo/rules/RMRulesSDK;->rulesSDK:Lcom/belkin/wemo/rules/RMRulesSDK;

    if-eqz v0, :cond_0

    .line 54
    const/4 v0, 0x0

    sput-object v0, Lcom/belkin/wemo/rules/RMRulesSDK;->rulesSDK:Lcom/belkin/wemo/rules/RMRulesSDK;

    .line 55
    const/4 v0, 0x0

    sput-boolean v0, Lcom/belkin/wemo/rules/RMRulesSDK;->isInitialized:Z

    .line 57
    :cond_0
    invoke-static {}, Lcom/belkin/wemo/utils/RMRulesSharedPreferences;->instance()Lcom/belkin/wemo/utils/RMRulesSharedPreferences;

    move-result-object v0

    invoke-virtual {v0}, Lcom/belkin/wemo/utils/RMRulesSharedPreferences;->clearAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 58
    monitor-exit v1

    return-void

    .line 52
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public declared-synchronized getDependencyProvider()Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;
    .locals 1

    .prologue
    .line 61
    monitor-enter p0

    :try_start_0
    sget-object v0, Lcom/belkin/wemo/rules/RMRulesSDK;->provider:Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getRules()Lcom/belkin/wemo/rules/RMIRules;
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lcom/belkin/wemo/rules/RMRulesSDK;->rules:Lcom/belkin/wemo/rules/RMIRules;

    return-object v0
.end method
