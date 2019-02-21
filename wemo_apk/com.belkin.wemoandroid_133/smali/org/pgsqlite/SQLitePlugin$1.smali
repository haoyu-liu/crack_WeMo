.class Lorg/pgsqlite/SQLitePlugin$1;
.super Ljava/lang/Object;
.source "SQLitePlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/pgsqlite/SQLitePlugin;->executeSqlBatchInBackground(Ljava/lang/String;[Ljava/lang/String;[Lorg/json/JSONArray;[Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/pgsqlite/SQLitePlugin;

.field final synthetic val$cbc:Lorg/apache/cordova/CallbackContext;

.field final synthetic val$dbName:Ljava/lang/String;

.field final synthetic val$jsonparams:[Lorg/json/JSONArray;

.field final synthetic val$myself:Lorg/pgsqlite/SQLitePlugin;

.field final synthetic val$queryIDs:[Ljava/lang/String;

.field final synthetic val$queryarr:[Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/pgsqlite/SQLitePlugin;Lorg/pgsqlite/SQLitePlugin;Ljava/lang/String;[Ljava/lang/String;[Lorg/json/JSONArray;[Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V
    .locals 0

    .prologue
    .line 335
    iput-object p1, p0, Lorg/pgsqlite/SQLitePlugin$1;->this$0:Lorg/pgsqlite/SQLitePlugin;

    iput-object p2, p0, Lorg/pgsqlite/SQLitePlugin$1;->val$myself:Lorg/pgsqlite/SQLitePlugin;

    iput-object p3, p0, Lorg/pgsqlite/SQLitePlugin$1;->val$dbName:Ljava/lang/String;

    iput-object p4, p0, Lorg/pgsqlite/SQLitePlugin$1;->val$queryarr:[Ljava/lang/String;

    iput-object p5, p0, Lorg/pgsqlite/SQLitePlugin$1;->val$jsonparams:[Lorg/json/JSONArray;

    iput-object p6, p0, Lorg/pgsqlite/SQLitePlugin$1;->val$queryIDs:[Ljava/lang/String;

    iput-object p7, p0, Lorg/pgsqlite/SQLitePlugin$1;->val$cbc:Lorg/apache/cordova/CallbackContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    .line 337
    iget-object v6, p0, Lorg/pgsqlite/SQLitePlugin$1;->val$myself:Lorg/pgsqlite/SQLitePlugin;

    monitor-enter v6

    .line 338
    :try_start_0
    iget-object v0, p0, Lorg/pgsqlite/SQLitePlugin$1;->val$myself:Lorg/pgsqlite/SQLitePlugin;

    iget-object v1, p0, Lorg/pgsqlite/SQLitePlugin$1;->val$dbName:Ljava/lang/String;

    iget-object v2, p0, Lorg/pgsqlite/SQLitePlugin$1;->val$queryarr:[Ljava/lang/String;

    iget-object v3, p0, Lorg/pgsqlite/SQLitePlugin$1;->val$jsonparams:[Lorg/json/JSONArray;

    iget-object v4, p0, Lorg/pgsqlite/SQLitePlugin$1;->val$queryIDs:[Ljava/lang/String;

    iget-object v5, p0, Lorg/pgsqlite/SQLitePlugin$1;->val$cbc:Lorg/apache/cordova/CallbackContext;

    invoke-static/range {v0 .. v5}, Lorg/pgsqlite/SQLitePlugin;->access$000(Lorg/pgsqlite/SQLitePlugin;Ljava/lang/String;[Ljava/lang/String;[Lorg/json/JSONArray;[Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    .line 339
    monitor-exit v6

    .line 340
    return-void

    .line 339
    :catchall_0
    move-exception v0

    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
