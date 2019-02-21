.class public Lcom/almworks/sqlite4java/SQLiteException;
.super Ljava/lang/Exception;
.source "SQLiteException.java"


# instance fields
.field private final myErrorCode:I


# direct methods
.method public constructor <init>(ILjava/lang/String;)V
    .locals 1
    .param p1, "errorCode"    # I
    .param p2, "errorMessage"    # Ljava/lang/String;

    .prologue
    .line 38
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/almworks/sqlite4java/SQLiteException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    .line 39
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "errorCode"    # I
    .param p2, "errorMessage"    # Ljava/lang/String;
    .param p3, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 49
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "] "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    if-nez p2, :cond_0

    const-string p2, "sqlite error"

    .end local p2    # "errorMessage":Ljava/lang/String;
    :cond_0
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p3}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 50
    iput p1, p0, Lcom/almworks/sqlite4java/SQLiteException;->myErrorCode:I

    .line 51
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 52
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0}, Lcom/almworks/sqlite4java/SQLiteException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 54
    :cond_1
    return-void
.end method


# virtual methods
.method public getBaseErrorCode()I
    .locals 1

    .prologue
    .line 72
    iget v0, p0, Lcom/almworks/sqlite4java/SQLiteException;->myErrorCode:I

    if-ltz v0, :cond_0

    iget v0, p0, Lcom/almworks/sqlite4java/SQLiteException;->myErrorCode:I

    and-int/lit16 v0, v0, 0xff

    :goto_0
    return v0

    :cond_0
    iget v0, p0, Lcom/almworks/sqlite4java/SQLiteException;->myErrorCode:I

    goto :goto_0
.end method

.method public getErrorCode()I
    .locals 1

    .prologue
    .line 62
    iget v0, p0, Lcom/almworks/sqlite4java/SQLiteException;->myErrorCode:I

    return v0
.end method
