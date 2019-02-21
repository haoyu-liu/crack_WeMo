.class abstract Lcom/almworks/sqlite4java/SQLiteConnection$BaseController;
.super Lcom/almworks/sqlite4java/SQLiteController;
.source "SQLiteConnection.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/almworks/sqlite4java/SQLiteConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "BaseController"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field final synthetic this$0:Lcom/almworks/sqlite4java/SQLiteConnection;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 1677
    const-class v0, Lcom/almworks/sqlite4java/SQLiteConnection;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/almworks/sqlite4java/SQLiteConnection$BaseController;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private constructor <init>(Lcom/almworks/sqlite4java/SQLiteConnection;)V
    .locals 0

    .prologue
    .line 1677
    iput-object p1, p0, Lcom/almworks/sqlite4java/SQLiteConnection$BaseController;->this$0:Lcom/almworks/sqlite4java/SQLiteConnection;

    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteController;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/almworks/sqlite4java/SQLiteConnection;Lcom/almworks/sqlite4java/SQLiteConnection$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/almworks/sqlite4java/SQLiteConnection;
    .param p2, "x1"    # Lcom/almworks/sqlite4java/SQLiteConnection$1;

    .prologue
    .line 1677
    invoke-direct {p0, p1}, Lcom/almworks/sqlite4java/SQLiteConnection$BaseController;-><init>(Lcom/almworks/sqlite4java/SQLiteConnection;)V

    return-void
.end method

.method private validateImpl()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 1683
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteConnection$BaseController;->this$0:Lcom/almworks/sqlite4java/SQLiteConnection;

    invoke-virtual {v0}, Lcom/almworks/sqlite4java/SQLiteConnection;->checkThread()V

    .line 1684
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteConnection$BaseController;->this$0:Lcom/almworks/sqlite4java/SQLiteConnection;

    invoke-static {v0}, Lcom/almworks/sqlite4java/SQLiteConnection;->access$200(Lcom/almworks/sqlite4java/SQLiteConnection;)Lcom/almworks/sqlite4java/SWIGTYPE_p_sqlite3;

    .line 1685
    const/4 v0, 0x1

    return v0
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
    .line 1713
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteConnection$BaseController;->this$0:Lcom/almworks/sqlite4java/SQLiteConnection;

    invoke-static {v0, p1}, Lcom/almworks/sqlite4java/SQLiteConnection;->access$500(Lcom/almworks/sqlite4java/SQLiteConnection;I)Lcom/almworks/sqlite4java/DirectBuffer;

    move-result-object v0

    return-object v0
.end method

.method protected checkDispose(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    .line 1700
    :try_start_0
    iget-object v2, p0, Lcom/almworks/sqlite4java/SQLiteConnection$BaseController;->this$0:Lcom/almworks/sqlite4java/SQLiteConnection;

    invoke-virtual {v2}, Lcom/almworks/sqlite4java/SQLiteConnection;->checkThread()V
    :try_end_0
    .catch Lcom/almworks/sqlite4java/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1705
    :goto_0
    return v1

    .line 1701
    :catch_0
    move-exception v0

    .line 1702
    .local v0, "e":Lcom/almworks/sqlite4java/SQLiteException;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "disposing "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " from alien thread"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2, v1}, Lcom/almworks/sqlite4java/Internal;->recoverableError(Ljava/lang/Object;Ljava/lang/String;Z)V

    .line 1703
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public dispose(Lcom/almworks/sqlite4java/SQLiteBlob;)V
    .locals 1
    .param p1, "blob"    # Lcom/almworks/sqlite4java/SQLiteBlob;

    .prologue
    .line 1693
    invoke-virtual {p0, p1}, Lcom/almworks/sqlite4java/SQLiteConnection$BaseController;->checkDispose(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1694
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteConnection$BaseController;->this$0:Lcom/almworks/sqlite4java/SQLiteConnection;

    invoke-static {v0, p1}, Lcom/almworks/sqlite4java/SQLiteConnection;->access$300(Lcom/almworks/sqlite4java/SQLiteConnection;Lcom/almworks/sqlite4java/SQLiteBlob;)V

    .line 1696
    :cond_0
    return-void
.end method

.method public freeBuffer(Lcom/almworks/sqlite4java/DirectBuffer;)V
    .locals 3
    .param p1, "buffer"    # Lcom/almworks/sqlite4java/DirectBuffer;

    .prologue
    .line 1718
    :try_start_0
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteConnection$BaseController;->this$0:Lcom/almworks/sqlite4java/SQLiteConnection;

    invoke-static {v1, p1}, Lcom/almworks/sqlite4java/SQLiteConnection;->access$600(Lcom/almworks/sqlite4java/SQLiteConnection;Lcom/almworks/sqlite4java/DirectBuffer;)V
    :try_end_0
    .catch Lcom/almworks/sqlite4java/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1722
    :goto_0
    return-void

    .line 1719
    :catch_0
    move-exception v0

    .line 1720
    .local v0, "e":Lcom/almworks/sqlite4java/SQLiteException;
    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteConnection$BaseController;->this$0:Lcom/almworks/sqlite4java/SQLiteConnection;

    invoke-virtual {v0}, Lcom/almworks/sqlite4java/SQLiteException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/almworks/sqlite4java/Internal;->logWarn(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public getProgressHandler()Lcom/almworks/sqlite4java/ProgressHandler;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 1725
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteConnection$BaseController;->this$0:Lcom/almworks/sqlite4java/SQLiteConnection;

    invoke-static {v0}, Lcom/almworks/sqlite4java/SQLiteConnection;->access$700(Lcom/almworks/sqlite4java/SQLiteConnection;)Lcom/almworks/sqlite4java/ProgressHandler;

    move-result-object v0

    return-object v0
.end method

.method public getSQLiteManual()Lcom/almworks/sqlite4java/_SQLiteManual;
    .locals 1

    .prologue
    .line 1709
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteConnection$BaseController;->this$0:Lcom/almworks/sqlite4java/SQLiteConnection;

    invoke-static {v0}, Lcom/almworks/sqlite4java/SQLiteConnection;->access$400(Lcom/almworks/sqlite4java/SQLiteConnection;)Lcom/almworks/sqlite4java/_SQLiteManual;

    move-result-object v0

    return-object v0
.end method

.method public throwResult(ILjava/lang/String;Ljava/lang/Object;)V
    .locals 1
    .param p1, "resultCode"    # I
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "additionalMessage"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 1689
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteConnection$BaseController;->this$0:Lcom/almworks/sqlite4java/SQLiteConnection;

    invoke-virtual {v0, p1, p2, p3}, Lcom/almworks/sqlite4java/SQLiteConnection;->throwResult(ILjava/lang/String;Ljava/lang/Object;)V

    .line 1690
    return-void
.end method

.method public validate()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/almworks/sqlite4java/SQLiteException;
        }
    .end annotation

    .prologue
    .line 1679
    sget-boolean v0, Lcom/almworks/sqlite4java/SQLiteConnection$BaseController;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLiteConnection$BaseController;->validateImpl()Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 1680
    :cond_0
    return-void
.end method
