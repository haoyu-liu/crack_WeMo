.class public Lcom/almworks/sqlite4java/SQLiteLongArray;
.super Ljava/lang/Object;
.source "SQLiteLongArray.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private myController:Lcom/almworks/sqlite4java/SQLiteController;

.field private volatile myDisposed:Z

.field private myHandle:Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;

.field private final myName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 34
    const-class v0, Lcom/almworks/sqlite4java/SQLiteLongArray;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/almworks/sqlite4java/SQLiteLongArray;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method constructor <init>(Lcom/almworks/sqlite4java/SQLiteController;Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;Ljava/lang/String;)V
    .locals 1
    .param p1, "controller"    # Lcom/almworks/sqlite4java/SQLiteController;
    .param p2, "handle"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;
    .param p3, "name"    # Ljava/lang/String;

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    sget-boolean v0, Lcom/almworks/sqlite4java/SQLiteLongArray;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 57
    :cond_0
    sget-boolean v0, Lcom/almworks/sqlite4java/SQLiteLongArray;->$assertionsDisabled:Z

    if-nez v0, :cond_1

    if-nez p2, :cond_1

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 58
    :cond_1
    sget-boolean v0, Lcom/almworks/sqlite4java/SQLiteLongArray;->$assertionsDisabled:Z

    if-nez v0, :cond_2

    if-nez p3, :cond_2

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 59
    :cond_2
    iput-object p1, p0, Lcom/almworks/sqlite4java/SQLiteLongArray;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    .line 60
    iput-object p2, p0, Lcom/almworks/sqlite4java/SQLiteLongArray;->myHandle:Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;

    .line 61
    iput-object p3, p0, Lcom/almworks/sqlite4java/SQLiteLongArray;->myName:Ljava/lang/String;

    .line 62
    return-void
.end method

.method private handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 206
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteLongArray;->myHandle:Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;

    .line 207
    .local v0, "handle":Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;
    if-nez v0, :cond_0

    .line 208
    new-instance v1, Lcom/almworks/sqlite4java/SQLiteException;

    const/16 v2, -0x60

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Lcom/almworks/sqlite4java/SQLiteException;-><init>(ILjava/lang/String;)V

    throw v1

    .line 210
    :cond_0
    return-object v0
.end method


# virtual methods
.method arrayHandle()Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;
    .locals 1

    .prologue
    .line 214
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteLongArray;->myHandle:Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;

    return-object v0
.end method

.method public varargs bind([J)Lcom/almworks/sqlite4java/SQLiteLongArray;
    .locals 6
    .param p1, "values"    # [J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 188
    if-nez p1, :cond_0

    move v3, v2

    :goto_0
    move-object v0, p0

    move-object v1, p1

    move v4, v2

    move v5, v2

    invoke-virtual/range {v0 .. v5}, Lcom/almworks/sqlite4java/SQLiteLongArray;->bind([JIIZZ)Lcom/almworks/sqlite4java/SQLiteLongArray;

    move-result-object v0

    return-object v0

    :cond_0
    array-length v3, p1

    goto :goto_0
.end method

.method public bind([JII)Lcom/almworks/sqlite4java/SQLiteLongArray;
    .locals 6
    .param p1, "values"    # [J
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 176
    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v5, v4

    invoke-virtual/range {v0 .. v5}, Lcom/almworks/sqlite4java/SQLiteLongArray;->bind([JIIZZ)Lcom/almworks/sqlite4java/SQLiteLongArray;

    move-result-object v0

    return-object v0
.end method

.method public bind([JIIZZ)Lcom/almworks/sqlite4java/SQLiteLongArray;
    .locals 7
    .param p1, "values"    # [J
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .param p4, "ordered"    # Z
    .param p5, "unique"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 147
    if-gez p2, :cond_0

    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v0, p2}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(I)V

    throw v0

    .line 148
    :cond_0
    if-gez p3, :cond_1

    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v0, p3}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(I)V

    throw v0

    .line 149
    :cond_1
    if-lez p3, :cond_2

    add-int v0, p2, p3

    array-length v1, p1

    if-le v0, v1, :cond_2

    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    add-int v1, p2, p3

    invoke-direct {v0, v1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(I)V

    throw v0

    .line 150
    :cond_2
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteLongArray;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-virtual {v0}, Lcom/almworks/sqlite4java/SQLiteController;->validate()V

    .line 151
    invoke-static {}, Lcom/almworks/sqlite4java/Internal;->isFineLogging()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 152
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "bind["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 154
    :cond_3
    if-nez p3, :cond_4

    .line 155
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteLongArray;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;

    move-result-object v0

    invoke-static {v0}, Lcom/almworks/sqlite4java/_SQLiteManual;->sqlite3_intarray_unbind(Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;)I

    move-result v6

    .line 160
    .local v6, "rc":I
    :goto_0
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteLongArray;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    const-string v1, "bind(array)"

    invoke-virtual {v0, v6, v1, p0}, Lcom/almworks/sqlite4java/SQLiteController;->throwResult(ILjava/lang/String;Ljava/lang/Object;)V

    .line 161
    return-object p0

    .line 157
    .end local v6    # "rc":I
    :cond_4
    if-nez p1, :cond_5

    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 158
    :cond_5
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteLongArray;->handle()Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;

    move-result-object v0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-static/range {v0 .. v5}, Lcom/almworks/sqlite4java/_SQLiteManual;->sqlite3_intarray_bind(Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;[JIIZZ)I

    move-result v6

    .restart local v6    # "rc":I
    goto :goto_0
.end method

.method public bind([JZZ)Lcom/almworks/sqlite4java/SQLiteLongArray;
    .locals 6
    .param p1, "values"    # [J
    .param p2, "ordered"    # Z
    .param p3, "unique"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 202
    if-nez p1, :cond_0

    move v3, v2

    :goto_0
    move-object v0, p0

    move-object v1, p1

    move v4, p2

    move v5, p3

    invoke-virtual/range {v0 .. v5}, Lcom/almworks/sqlite4java/SQLiteLongArray;->bind([JIIZZ)Lcom/almworks/sqlite4java/SQLiteLongArray;

    move-result-object v0

    return-object v0

    :cond_0
    array-length v3, p1

    goto :goto_0
.end method

.method public dispose()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 104
    iget-object v2, p0, Lcom/almworks/sqlite4java/SQLiteLongArray;->myHandle:Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;

    if-nez v2, :cond_0

    .line 118
    :goto_0
    return-void

    .line 106
    :cond_0
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteLongArray;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    .line 108
    .local v0, "controller":Lcom/almworks/sqlite4java/SQLiteController;
    :try_start_0
    invoke-virtual {v0}, Lcom/almworks/sqlite4java/SQLiteController;->validate()V
    :try_end_0
    .catch Lcom/almworks/sqlite4java/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 113
    const-string v2, "disposing"

    invoke-static {p0, v2}, Lcom/almworks/sqlite4java/Internal;->logFine(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 114
    invoke-virtual {v0, p0}, Lcom/almworks/sqlite4java/SQLiteController;->dispose(Lcom/almworks/sqlite4java/SQLiteLongArray;)V

    .line 115
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/almworks/sqlite4java/SQLiteLongArray;->myHandle:Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray;

    .line 116
    iget-object v2, p0, Lcom/almworks/sqlite4java/SQLiteLongArray;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    invoke-static {v2}, Lcom/almworks/sqlite4java/SQLiteController;->getDisposed(Lcom/almworks/sqlite4java/SQLiteController;)Lcom/almworks/sqlite4java/SQLiteController;

    move-result-object v2

    iput-object v2, p0, Lcom/almworks/sqlite4java/SQLiteLongArray;->myController:Lcom/almworks/sqlite4java/SQLiteController;

    .line 117
    iput-boolean v4, p0, Lcom/almworks/sqlite4java/SQLiteLongArray;->myDisposed:Z

    goto :goto_0

    .line 109
    :catch_0
    move-exception v1

    .line 110
    .local v1, "e":Lcom/almworks/sqlite4java/SQLiteException;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "invalid dispose: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2, v4}, Lcom/almworks/sqlite4java/Internal;->recoverableError(Ljava/lang/Object;Ljava/lang/String;Z)V

    goto :goto_0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 72
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteLongArray;->myName:Ljava/lang/String;

    return-object v0
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 83
    iget-boolean v0, p0, Lcom/almworks/sqlite4java/SQLiteLongArray;->myDisposed:Z

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 88
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteLongArray;->myName:Ljava/lang/String;

    return-object v0
.end method
