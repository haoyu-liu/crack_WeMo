.class public Lcom/belkin/wemo/cache/cloud/requestqueue/impl/RequestProcessorFactory;
.super Ljava/lang/Object;
.source "RequestProcessorFactory.java"


# static fields
.field private static requestProcessor:Lcom/belkin/wemo/cache/cloud/requestqueue/IRequestProcessor;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static declared-synchronized getRequestProcessor(Landroid/content/Context;)Lcom/belkin/wemo/cache/cloud/requestqueue/IRequestProcessor;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 12
    const-class v1, Lcom/belkin/wemo/cache/cloud/requestqueue/impl/RequestProcessorFactory;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/belkin/wemo/cache/cloud/requestqueue/impl/RequestProcessorFactory;->requestProcessor:Lcom/belkin/wemo/cache/cloud/requestqueue/IRequestProcessor;

    if-nez v0, :cond_0

    .line 13
    new-instance v0, Lcom/belkin/wemo/cache/cloud/requestqueue/impl/WemoRequestProcessor;

    invoke-direct {v0, p0}, Lcom/belkin/wemo/cache/cloud/requestqueue/impl/WemoRequestProcessor;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/belkin/wemo/cache/cloud/requestqueue/impl/RequestProcessorFactory;->requestProcessor:Lcom/belkin/wemo/cache/cloud/requestqueue/IRequestProcessor;

    .line 15
    :cond_0
    sget-object v0, Lcom/belkin/wemo/cache/cloud/requestqueue/impl/RequestProcessorFactory;->requestProcessor:Lcom/belkin/wemo/cache/cloud/requestqueue/IRequestProcessor;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 12
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method
