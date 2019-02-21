.class Lio/liteglue/SQLitePlugin$DBRunner;
.super Ljava/lang/Object;
.source "SQLitePlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/liteglue/SQLitePlugin;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DBRunner"
.end annotation


# instance fields
.field private bugWorkaround:Z

.field private createFromAssets:Z

.field final dbname:Ljava/lang/String;

.field mydb:Lio/liteglue/SQLiteAndroidDatabase;

.field private oldImpl:Z

.field final openCbc:Lorg/apache/cordova/CallbackContext;

.field final q:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue",
            "<",
            "Lio/liteglue/SQLitePlugin$DBQuery;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lio/liteglue/SQLitePlugin;


# direct methods
.method constructor <init>(Lio/liteglue/SQLitePlugin;Ljava/lang/String;Lorg/json/JSONObject;Lorg/apache/cordova/CallbackContext;)V
    .locals 3
    .param p2, "dbname"    # Ljava/lang/String;
    .param p3, "options"    # Lorg/json/JSONObject;
    .param p4, "cbc"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 585
    iput-object p1, p0, Lio/liteglue/SQLitePlugin$DBRunner;->this$0:Lio/liteglue/SQLitePlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 586
    iput-object p2, p0, Lio/liteglue/SQLitePlugin$DBRunner;->dbname:Ljava/lang/String;

    .line 587
    const-string v0, "createFromResource"

    invoke-virtual {p3, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lio/liteglue/SQLitePlugin$DBRunner;->createFromAssets:Z

    .line 588
    const-string v0, "androidOldDatabaseImplementation"

    invoke-virtual {p3, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lio/liteglue/SQLitePlugin$DBRunner;->oldImpl:Z

    .line 589
    const-class v0, Lio/liteglue/SQLitePlugin;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Android db implementation: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v0, p0, Lio/liteglue/SQLitePlugin$DBRunner;->oldImpl:Z

    if-eqz v0, :cond_1

    const-string v0, "OLD"

    :goto_0
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 590
    iget-boolean v0, p0, Lio/liteglue/SQLitePlugin$DBRunner;->oldImpl:Z

    if-eqz v0, :cond_2

    const-string v0, "androidBugWorkaround"

    invoke-virtual {p3, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x1

    :goto_1
    iput-boolean v0, p0, Lio/liteglue/SQLitePlugin$DBRunner;->bugWorkaround:Z

    .line 591
    iget-boolean v0, p0, Lio/liteglue/SQLitePlugin$DBRunner;->bugWorkaround:Z

    if-eqz v0, :cond_0

    .line 592
    const-class v0, Lio/liteglue/SQLitePlugin;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Android db closing/locking workaround applied"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 594
    :cond_0
    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v0}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    iput-object v0, p0, Lio/liteglue/SQLitePlugin$DBRunner;->q:Ljava/util/concurrent/BlockingQueue;

    .line 595
    iput-object p4, p0, Lio/liteglue/SQLitePlugin$DBRunner;->openCbc:Lorg/apache/cordova/CallbackContext;

    .line 596
    return-void

    .line 589
    :cond_1
    const-string v0, "sqlite4java (NDK)"

    goto :goto_0

    .line 590
    :cond_2
    const/4 v0, 0x0

    goto :goto_1
.end method


# virtual methods
.method public run()V
    .locals 9

    .prologue
    .line 600
    :try_start_0
    iget-object v4, p0, Lio/liteglue/SQLitePlugin$DBRunner;->this$0:Lio/liteglue/SQLitePlugin;

    iget-object v5, p0, Lio/liteglue/SQLitePlugin$DBRunner;->dbname:Ljava/lang/String;

    iget-boolean v6, p0, Lio/liteglue/SQLitePlugin$DBRunner;->createFromAssets:Z

    iget-object v7, p0, Lio/liteglue/SQLitePlugin$DBRunner;->openCbc:Lorg/apache/cordova/CallbackContext;

    iget-boolean v8, p0, Lio/liteglue/SQLitePlugin$DBRunner;->oldImpl:Z

    invoke-static {v4, v5, v6, v7, v8}, Lio/liteglue/SQLitePlugin;->access$000(Lio/liteglue/SQLitePlugin;Ljava/lang/String;ZLorg/apache/cordova/CallbackContext;Z)Lio/liteglue/SQLiteAndroidDatabase;

    move-result-object v4

    iput-object v4, p0, Lio/liteglue/SQLitePlugin$DBRunner;->mydb:Lio/liteglue/SQLiteAndroidDatabase;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 607
    const/4 v1, 0x0

    .line 610
    .local v1, "dbq":Lio/liteglue/SQLitePlugin$DBQuery;
    :try_start_1
    iget-object v4, p0, Lio/liteglue/SQLitePlugin$DBRunner;->q:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v4}, Ljava/util/concurrent/BlockingQueue;->take()Ljava/lang/Object;

    move-result-object v4

    move-object v0, v4

    check-cast v0, Lio/liteglue/SQLitePlugin$DBQuery;

    move-object v1, v0

    .line 612
    :goto_0
    iget-boolean v4, v1, Lio/liteglue/SQLitePlugin$DBQuery;->stop:Z

    if-nez v4, :cond_2

    .line 613
    iget-object v4, p0, Lio/liteglue/SQLitePlugin$DBRunner;->mydb:Lio/liteglue/SQLiteAndroidDatabase;

    iget-object v5, v1, Lio/liteglue/SQLitePlugin$DBQuery;->queries:[Ljava/lang/String;

    iget-object v6, v1, Lio/liteglue/SQLitePlugin$DBQuery;->jsonparams:[Lorg/json/JSONArray;

    iget-object v7, v1, Lio/liteglue/SQLitePlugin$DBQuery;->queryIDs:[Ljava/lang/String;

    iget-object v8, v1, Lio/liteglue/SQLitePlugin$DBQuery;->cbc:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v4, v5, v6, v7, v8}, Lio/liteglue/SQLiteAndroidDatabase;->executeSqlBatch([Ljava/lang/String;[Lorg/json/JSONArray;[Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    .line 616
    iget-boolean v4, p0, Lio/liteglue/SQLitePlugin$DBRunner;->bugWorkaround:Z

    if-eqz v4, :cond_0

    iget-object v4, v1, Lio/liteglue/SQLitePlugin$DBQuery;->queries:[Ljava/lang/String;

    array-length v4, v4

    const/4 v5, 0x1

    if-ne v4, v5, :cond_0

    iget-object v4, v1, Lio/liteglue/SQLitePlugin$DBQuery;->queries:[Ljava/lang/String;

    const/4 v5, 0x0

    aget-object v4, v4, v5

    const-string v5, "COMMIT"

    if-ne v4, v5, :cond_0

    .line 617
    iget-object v4, p0, Lio/liteglue/SQLitePlugin$DBRunner;->mydb:Lio/liteglue/SQLiteAndroidDatabase;

    invoke-virtual {v4}, Lio/liteglue/SQLiteAndroidDatabase;->bugWorkaround()V

    .line 619
    :cond_0
    iget-object v4, p0, Lio/liteglue/SQLitePlugin$DBRunner;->q:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v4}, Ljava/util/concurrent/BlockingQueue;->take()Ljava/lang/Object;

    move-result-object v4

    move-object v0, v4

    check-cast v0, Lio/liteglue/SQLitePlugin$DBQuery;

    move-object v1, v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 601
    .end local v1    # "dbq":Lio/liteglue/SQLitePlugin$DBQuery;
    :catch_0
    move-exception v3

    .line 602
    .local v3, "e":Ljava/lang/Exception;
    const-class v4, Lio/liteglue/SQLitePlugin;

    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "unexpected error, stopping db thread"

    invoke-static {v4, v5, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 603
    sget-object v4, Lio/liteglue/SQLitePlugin;->dbrmap:Ljava/util/concurrent/ConcurrentHashMap;

    iget-object v5, p0, Lio/liteglue/SQLitePlugin$DBRunner;->dbname:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 653
    .end local v3    # "e":Ljava/lang/Exception;
    :cond_1
    :goto_1
    return-void

    .line 621
    .restart local v1    # "dbq":Lio/liteglue/SQLitePlugin$DBQuery;
    :catch_1
    move-exception v3

    .line 622
    .restart local v3    # "e":Ljava/lang/Exception;
    const-class v4, Lio/liteglue/SQLitePlugin;

    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "unexpected error"

    invoke-static {v4, v5, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 625
    .end local v3    # "e":Ljava/lang/Exception;
    :cond_2
    if-eqz v1, :cond_1

    iget-boolean v4, v1, Lio/liteglue/SQLitePlugin$DBQuery;->close:Z

    if-eqz v4, :cond_1

    .line 627
    :try_start_2
    iget-object v4, p0, Lio/liteglue/SQLitePlugin$DBRunner;->this$0:Lio/liteglue/SQLitePlugin;

    iget-object v5, p0, Lio/liteglue/SQLitePlugin$DBRunner;->dbname:Ljava/lang/String;

    invoke-static {v4, v5}, Lio/liteglue/SQLitePlugin;->access$100(Lio/liteglue/SQLitePlugin;Ljava/lang/String;)V

    .line 629
    sget-object v4, Lio/liteglue/SQLitePlugin;->dbrmap:Ljava/util/concurrent/ConcurrentHashMap;

    iget-object v5, p0, Lio/liteglue/SQLitePlugin$DBRunner;->dbname:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 631
    iget-boolean v4, v1, Lio/liteglue/SQLitePlugin$DBQuery;->delete:Z

    if-nez v4, :cond_3

    .line 632
    iget-object v4, v1, Lio/liteglue/SQLitePlugin$DBQuery;->cbc:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v4}, Lorg/apache/cordova/CallbackContext;->success()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_1

    .line 646
    :catch_2
    move-exception v3

    .line 647
    .restart local v3    # "e":Ljava/lang/Exception;
    const-class v4, Lio/liteglue/SQLitePlugin;

    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "couldn\'t close database"

    invoke-static {v4, v5, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 648
    iget-object v4, v1, Lio/liteglue/SQLitePlugin$DBQuery;->cbc:Lorg/apache/cordova/CallbackContext;

    if-eqz v4, :cond_1

    .line 649
    iget-object v4, v1, Lio/liteglue/SQLitePlugin$DBQuery;->cbc:Lorg/apache/cordova/CallbackContext;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "couldn\'t close database: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_1

    .line 635
    .end local v3    # "e":Ljava/lang/Exception;
    :cond_3
    :try_start_3
    iget-object v4, p0, Lio/liteglue/SQLitePlugin$DBRunner;->this$0:Lio/liteglue/SQLitePlugin;

    iget-object v5, p0, Lio/liteglue/SQLitePlugin$DBRunner;->dbname:Ljava/lang/String;

    invoke-static {v4, v5}, Lio/liteglue/SQLitePlugin;->access$200(Lio/liteglue/SQLitePlugin;Ljava/lang/String;)Z

    move-result v2

    .line 636
    .local v2, "deleteResult":Z
    if-eqz v2, :cond_4

    .line 637
    iget-object v4, v1, Lio/liteglue/SQLitePlugin$DBQuery;->cbc:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v4}, Lorg/apache/cordova/CallbackContext;->success()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_1

    .line 641
    .end local v2    # "deleteResult":Z
    :catch_3
    move-exception v3

    .line 642
    .restart local v3    # "e":Ljava/lang/Exception;
    :try_start_4
    const-class v4, Lio/liteglue/SQLitePlugin;

    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "couldn\'t delete database"

    invoke-static {v4, v5, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 643
    iget-object v4, v1, Lio/liteglue/SQLitePlugin$DBQuery;->cbc:Lorg/apache/cordova/CallbackContext;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "couldn\'t delete database: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    goto/16 :goto_1

    .line 639
    .end local v3    # "e":Ljava/lang/Exception;
    .restart local v2    # "deleteResult":Z
    :cond_4
    :try_start_5
    iget-object v4, v1, Lio/liteglue/SQLitePlugin$DBQuery;->cbc:Lorg/apache/cordova/CallbackContext;

    const-string v5, "couldn\'t delete database"

    invoke-virtual {v4, v5}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    goto/16 :goto_1
.end method
