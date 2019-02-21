.class Lcom/almworks/sqlite4java/SQLiteController$Disposed;
.super Lcom/almworks/sqlite4java/SQLiteController;
.source "SQLiteController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/almworks/sqlite4java/SQLiteController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Disposed"
.end annotation


# static fields
.field public static final INSTANCE:Lcom/almworks/sqlite4java/SQLiteController$Disposed;


# instance fields
.field private final myName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 79
    new-instance v0, Lcom/almworks/sqlite4java/SQLiteController$Disposed;

    const-string v1, ""

    invoke-direct {v0, v1}, Lcom/almworks/sqlite4java/SQLiteController$Disposed;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/almworks/sqlite4java/SQLiteController$Disposed;->INSTANCE:Lcom/almworks/sqlite4java/SQLiteController$Disposed;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "namePrefix"    # Ljava/lang/String;

    .prologue
    .line 83
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteController;-><init>()V

    .line 84
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "[D]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/almworks/sqlite4java/SQLiteController$Disposed;->myName:Ljava/lang/String;

    .line 85
    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;Lcom/almworks/sqlite4java/SQLiteController$1;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Lcom/almworks/sqlite4java/SQLiteController$1;

    .prologue
    .line 78
    invoke-direct {p0, p1}, Lcom/almworks/sqlite4java/SQLiteController$Disposed;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public allocateBuffer(I)Lcom/almworks/sqlite4java/DirectBuffer;
    .locals 1
    .param p1, "sizeEstimate"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 113
    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0}, Ljava/io/IOException;-><init>()V

    throw v0
.end method

.method public dispose(Lcom/almworks/sqlite4java/SQLiteBlob;)V
    .locals 0
    .param p1, "blob"    # Lcom/almworks/sqlite4java/SQLiteBlob;

    .prologue
    .line 102
    return-void
.end method

.method public dispose(Lcom/almworks/sqlite4java/SQLiteLongArray;)V
    .locals 0
    .param p1, "array"    # Lcom/almworks/sqlite4java/SQLiteLongArray;

    .prologue
    .line 105
    return-void
.end method

.method public dispose(Lcom/almworks/sqlite4java/SQLiteStatement;)V
    .locals 0
    .param p1, "statement"    # Lcom/almworks/sqlite4java/SQLiteStatement;

    .prologue
    .line 99
    return-void
.end method

.method public freeBuffer(Lcom/almworks/sqlite4java/DirectBuffer;)V
    .locals 0
    .param p1, "buffer"    # Lcom/almworks/sqlite4java/DirectBuffer;

    .prologue
    .line 117
    return-void
.end method

.method public getProgressHandler()Lcom/almworks/sqlite4java/ProgressHandler;
    .locals 1

    .prologue
    .line 120
    sget-object v0, Lcom/almworks/sqlite4java/ProgressHandler;->DISPOSED:Lcom/almworks/sqlite4java/ProgressHandler;

    return-object v0
.end method

.method public getSQLiteManual()Lcom/almworks/sqlite4java/_SQLiteManual;
    .locals 1

    .prologue
    .line 109
    new-instance v0, Lcom/almworks/sqlite4java/_SQLiteManual;

    invoke-direct {v0}, Lcom/almworks/sqlite4java/_SQLiteManual;-><init>()V

    return-object v0
.end method

.method public throwResult(ILjava/lang/String;Ljava/lang/Object;)V
    .locals 0
    .param p1, "resultCode"    # I
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "additionalMessage"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 96
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 88
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteController$Disposed;->myName:Ljava/lang/String;

    return-object v0
.end method

.method public validate()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 92
    new-instance v0, Lcom/almworks/sqlite4java/SQLiteException;

    const/16 v1, -0x5c

    const-string v2, "statement is disposed"

    invoke-direct {v0, v1, v2}, Lcom/almworks/sqlite4java/SQLiteException;-><init>(ILjava/lang/String;)V

    throw v0
.end method
