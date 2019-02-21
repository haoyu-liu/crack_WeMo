.class public Lorg/pgsqlite/SQLiteDBInstances;
.super Ljava/lang/Object;
.source "SQLiteDBInstances.java"


# static fields
.field private static dbInstances:Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Hashtable",
            "<",
            "Ljava/lang/String;",
            "Landroid/database/sqlite/SQLiteDatabase;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 8
    const/4 v0, 0x0

    sput-object v0, Lorg/pgsqlite/SQLiteDBInstances;->dbInstances:Ljava/util/Hashtable;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getDBInstance(Ljava/lang/String;)Landroid/database/sqlite/SQLiteDatabase;
    .locals 2
    .param p0, "key"    # Ljava/lang/String;

    .prologue
    .line 12
    sget-object v1, Lorg/pgsqlite/SQLiteDBInstances;->dbInstances:Ljava/util/Hashtable;

    if-nez v1, :cond_0

    .line 14
    new-instance v1, Ljava/util/Hashtable;

    invoke-direct {v1}, Ljava/util/Hashtable;-><init>()V

    sput-object v1, Lorg/pgsqlite/SQLiteDBInstances;->dbInstances:Ljava/util/Hashtable;

    .line 17
    :cond_0
    const/4 v0, 0x0

    .line 18
    .local v0, "result":Landroid/database/sqlite/SQLiteDatabase;
    sget-object v1, Lorg/pgsqlite/SQLiteDBInstances;->dbInstances:Ljava/util/Hashtable;

    invoke-virtual {v1, p0}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "result":Landroid/database/sqlite/SQLiteDatabase;
    check-cast v0, Landroid/database/sqlite/SQLiteDatabase;

    .line 19
    .restart local v0    # "result":Landroid/database/sqlite/SQLiteDatabase;
    return-object v0
.end method

.method public static removeDBInstance(Ljava/lang/String;)V
    .locals 1
    .param p0, "key"    # Ljava/lang/String;

    .prologue
    .line 34
    sget-object v0, Lorg/pgsqlite/SQLiteDBInstances;->dbInstances:Ljava/util/Hashtable;

    if-nez v0, :cond_0

    .line 40
    :goto_0
    return-void

    .line 39
    :cond_0
    sget-object v0, Lorg/pgsqlite/SQLiteDBInstances;->dbInstances:Ljava/util/Hashtable;

    invoke-virtual {v0, p0}, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public static setDBInstance(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 24
    sget-object v0, Lorg/pgsqlite/SQLiteDBInstances;->dbInstances:Ljava/util/Hashtable;

    if-nez v0, :cond_0

    .line 26
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    sput-object v0, Lorg/pgsqlite/SQLiteDBInstances;->dbInstances:Ljava/util/Hashtable;

    .line 29
    :cond_0
    sget-object v0, Lorg/pgsqlite/SQLiteDBInstances;->dbInstances:Ljava/util/Hashtable;

    invoke-virtual {v0, p0, p1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    return-void
.end method
