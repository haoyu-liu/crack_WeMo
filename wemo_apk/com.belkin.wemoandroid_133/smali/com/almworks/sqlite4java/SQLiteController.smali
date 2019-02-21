.class abstract Lcom/almworks/sqlite4java/SQLiteController;
.super Ljava/lang/Object;
.source "SQLiteController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/almworks/sqlite4java/SQLiteController$1;,
        Lcom/almworks/sqlite4java/SQLiteController$Disposed;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 27
    const-class v0, Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/almworks/sqlite4java/SQLiteController;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    return-void
.end method

.method public static getDisposed(Lcom/almworks/sqlite4java/SQLiteController;)Lcom/almworks/sqlite4java/SQLiteController;
    .locals 4
    .param p0, "controller"    # Lcom/almworks/sqlite4java/SQLiteController;

    .prologue
    .line 62
    instance-of v1, p0, Lcom/almworks/sqlite4java/SQLiteController$Disposed;

    if-eqz v1, :cond_0

    .line 70
    .end local p0    # "controller":Lcom/almworks/sqlite4java/SQLiteController;
    .local v0, "debug":Z
    :goto_0
    return-object p0

    .line 65
    .end local v0    # "debug":Z
    .restart local p0    # "controller":Lcom/almworks/sqlite4java/SQLiteController;
    :cond_0
    const/4 v0, 0x0

    .line 66
    .restart local v0    # "debug":Z
    sget-boolean v1, Lcom/almworks/sqlite4java/SQLiteController;->$assertionsDisabled:Z

    if-nez v1, :cond_1

    const/4 v0, 0x1

    if-nez v0, :cond_1

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 67
    :cond_1
    if-nez v0, :cond_2

    .line 68
    sget-object p0, Lcom/almworks/sqlite4java/SQLiteController$Disposed;->INSTANCE:Lcom/almworks/sqlite4java/SQLiteController$Disposed;

    goto :goto_0

    .line 70
    :cond_2
    new-instance v2, Lcom/almworks/sqlite4java/SQLiteController$Disposed;

    if-nez p0, :cond_3

    const-string v1, ""

    :goto_1
    const/4 v3, 0x0

    invoke-direct {v2, v1, v3}, Lcom/almworks/sqlite4java/SQLiteController$Disposed;-><init>(Ljava/lang/String;Lcom/almworks/sqlite4java/SQLiteController$1;)V

    move-object p0, v2

    goto :goto_0

    :cond_3
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_1
.end method


# virtual methods
.method public abstract allocateBuffer(I)Lcom/almworks/sqlite4java/DirectBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation
.end method

.method public abstract dispose(Lcom/almworks/sqlite4java/SQLiteBlob;)V
.end method

.method public abstract dispose(Lcom/almworks/sqlite4java/SQLiteLongArray;)V
.end method

.method public abstract dispose(Lcom/almworks/sqlite4java/SQLiteStatement;)V
.end method

.method public abstract freeBuffer(Lcom/almworks/sqlite4java/DirectBuffer;)V
.end method

.method public abstract getProgressHandler()Lcom/almworks/sqlite4java/ProgressHandler;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation
.end method

.method public abstract getSQLiteManual()Lcom/almworks/sqlite4java/_SQLiteManual;
.end method

.method public abstract throwResult(ILjava/lang/String;Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation
.end method

.method public abstract validate()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation
.end method
