.class public Lcom/belkin/wemo/rules/impl/WeMoRulesFactory;
.super Ljava/lang/Object;
.source "WeMoRulesFactory.java"


# static fields
.field public static final TAG:Ljava/lang/String; = "RulesFactory"

.field private static rulesInstance:Lcom/belkin/wemo/rules/IWeMoRules;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    return-void
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/belkin/wemo/rules/IWeMoRules;
    .locals 6
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 79
    const-class v1, Lcom/belkin/wemo/rules/impl/WeMoRulesFactory;

    monitor-enter v1

    :try_start_0
    const-string v0, "RulesFactory"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Time:  Rules Factory: Runtime IN : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 81
    invoke-static {}, Lcom/belkin/wemo/rules/impl/RulesLocalImpl;->getInstance()Lcom/belkin/wemo/rules/impl/RulesLocalImpl;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/rules/impl/WeMoRulesFactory;->rulesInstance:Lcom/belkin/wemo/rules/IWeMoRules;

    .line 85
    :goto_0
    const-string v0, "RulesFactory"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Time:  Rules Factory: Runtime OUT : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    sget-object v0, Lcom/belkin/wemo/rules/impl/WeMoRulesFactory;->rulesInstance:Lcom/belkin/wemo/rules/IWeMoRules;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 83
    :cond_0
    :try_start_1
    invoke-static {}, Lcom/belkin/wemo/rules/impl/RulesRemoteImpl;->getInstance()Lcom/belkin/wemo/rules/impl/RulesRemoteImpl;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/rules/impl/WeMoRulesFactory;->rulesInstance:Lcom/belkin/wemo/rules/IWeMoRules;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 79
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public declared-synchronized onNetworkSwitch()V
    .locals 2

    .prologue
    .line 96
    monitor-enter p0

    :try_start_0
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 97
    const-string v0, "RulesFactory"

    const-string v1, "Local Store Rules API called"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    invoke-static {}, Lcom/belkin/wemo/rules/impl/RulesLocalImpl;->getInstance()Lcom/belkin/wemo/rules/impl/RulesLocalImpl;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/rules/impl/WeMoRulesFactory;->rulesInstance:Lcom/belkin/wemo/rules/IWeMoRules;

    .line 99
    invoke-static {}, Lcom/belkin/wemo/rules/impl/RulesRemoteImpl;->destroyInstance()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 105
    :goto_0
    monitor-exit p0

    return-void

    .line 101
    :cond_0
    :try_start_1
    const-string v0, "RulesFactory"

    const-string v1, "Remote Store Rules API called"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    invoke-static {}, Lcom/belkin/wemo/rules/impl/RulesRemoteImpl;->getInstance()Lcom/belkin/wemo/rules/impl/RulesRemoteImpl;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/rules/impl/WeMoRulesFactory;->rulesInstance:Lcom/belkin/wemo/rules/IWeMoRules;

    .line 103
    invoke-static {}, Lcom/belkin/wemo/rules/impl/RulesLocalImpl;->destroyInstance()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 96
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
