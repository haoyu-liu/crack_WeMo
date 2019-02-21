.class Lcom/localytics/android/BaseProvider$1;
.super Ljava/lang/Object;
.source "BaseProvider.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/BaseProvider;->vacuumIfNecessary()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/localytics/android/BaseProvider;


# direct methods
.method constructor <init>(Lcom/localytics/android/BaseProvider;)V
    .locals 0

    .prologue
    .line 271
    iput-object p1, p0, Lcom/localytics/android/BaseProvider$1;->this$0:Lcom/localytics/android/BaseProvider;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 275
    const/4 v0, 0x0

    .line 278
    .local v0, "cursor":Landroid/database/Cursor;
    :try_start_0
    iget-object v2, p0, Lcom/localytics/android/BaseProvider$1;->this$0:Lcom/localytics/android/BaseProvider;

    iget-object v2, v2, Lcom/localytics/android/BaseProvider;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const-string v3, "PRAGMA incremental_vacuum(0);"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 279
    :cond_0
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    if-nez v2, :cond_0

    .line 290
    if-eqz v0, :cond_1

    .line 292
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 293
    const/4 v0, 0x0

    .line 296
    :cond_1
    :goto_0
    return-void

    .line 284
    :catch_0
    move-exception v1

    .line 286
    .local v1, "e":Ljava/lang/Exception;
    :try_start_1
    const-string v2, "Auto-vacuum error"

    invoke-static {v2, v1}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 290
    if-eqz v0, :cond_1

    .line 292
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 293
    const/4 v0, 0x0

    goto :goto_0

    .line 290
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    if-eqz v0, :cond_2

    .line 292
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 293
    const/4 v0, 0x0

    :cond_2
    throw v2
.end method
