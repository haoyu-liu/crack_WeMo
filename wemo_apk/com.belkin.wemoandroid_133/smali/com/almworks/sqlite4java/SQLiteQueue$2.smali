.class Lcom/almworks/sqlite4java/SQLiteQueue$2;
.super Ljava/lang/Object;
.source "SQLiteQueue.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/almworks/sqlite4java/SQLiteQueue;->reincarnate(J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/almworks/sqlite4java/SQLiteQueue;

.field final synthetic val$reincarnateTimeout:J


# direct methods
.method constructor <init>(Lcom/almworks/sqlite4java/SQLiteQueue;J)V
    .locals 0

    .prologue
    .line 595
    iput-object p1, p0, Lcom/almworks/sqlite4java/SQLiteQueue$2;->this$0:Lcom/almworks/sqlite4java/SQLiteQueue;

    iput-wide p2, p0, Lcom/almworks/sqlite4java/SQLiteQueue$2;->val$reincarnateTimeout:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .prologue
    .line 598
    :try_start_0
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteQueue$2;->this$0:Lcom/almworks/sqlite4java/SQLiteQueue;

    invoke-static {v1}, Lcom/almworks/sqlite4java/SQLiteQueue;->access$100(Lcom/almworks/sqlite4java/SQLiteQueue;)Ljava/lang/Object;

    move-result-object v6

    monitor-enter v6
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 599
    :try_start_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 600
    .local v2, "now":J
    iget-wide v8, p0, Lcom/almworks/sqlite4java/SQLiteQueue$2;->val$reincarnateTimeout:J

    add-long v4, v2, v8

    .line 601
    .local v4, "wake":J
    :goto_0
    cmp-long v1, v2, v4

    if-gez v1, :cond_1

    .line 602
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteQueue$2;->this$0:Lcom/almworks/sqlite4java/SQLiteQueue;

    invoke-static {v1}, Lcom/almworks/sqlite4java/SQLiteQueue;->access$100(Lcom/almworks/sqlite4java/SQLiteQueue;)Ljava/lang/Object;

    move-result-object v1

    sub-long v8, v4, v2

    invoke-virtual {v1, v8, v9}, Ljava/lang/Object;->wait(J)V

    .line 603
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteQueue$2;->this$0:Lcom/almworks/sqlite4java/SQLiteQueue;

    invoke-static {v1}, Lcom/almworks/sqlite4java/SQLiteQueue;->access$200(Lcom/almworks/sqlite4java/SQLiteQueue;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 604
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteQueue$2;->this$0:Lcom/almworks/sqlite4java/SQLiteQueue;

    const-string v7, "stopped, will not reincarnate"

    invoke-static {v1, v7}, Lcom/almworks/sqlite4java/Internal;->logWarn(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 605
    monitor-exit v6

    .line 614
    .end local v2    # "now":J
    .end local v4    # "wake":J
    :goto_1
    return-void

    .line 607
    .restart local v2    # "now":J
    .restart local v4    # "wake":J
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    goto :goto_0

    .line 609
    :cond_1
    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 610
    :try_start_2
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteQueue$2;->this$0:Lcom/almworks/sqlite4java/SQLiteQueue;

    invoke-virtual {v1}, Lcom/almworks/sqlite4java/SQLiteQueue;->start()Lcom/almworks/sqlite4java/SQLiteQueue;
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_1

    .line 611
    .end local v2    # "now":J
    .end local v4    # "wake":J
    :catch_0
    move-exception v0

    .line 612
    .local v0, "e":Ljava/lang/InterruptedException;
    sget-object v1, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    iget-object v6, p0, Lcom/almworks/sqlite4java/SQLiteQueue$2;->this$0:Lcom/almworks/sqlite4java/SQLiteQueue;

    const-string v7, "not reincarnated"

    invoke-static {v1, v6, v7, v0}, Lcom/almworks/sqlite4java/Internal;->log(Ljava/util/logging/Level;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 609
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit v6
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v1
    :try_end_4
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_0
.end method
