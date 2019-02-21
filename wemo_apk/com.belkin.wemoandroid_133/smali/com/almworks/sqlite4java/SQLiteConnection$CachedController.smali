.class Lcom/almworks/sqlite4java/SQLiteConnection$CachedController;
.super Lcom/almworks/sqlite4java/SQLiteConnection$BaseController;
.source "SQLiteConnection.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/almworks/sqlite4java/SQLiteConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CachedController"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/almworks/sqlite4java/SQLiteConnection;


# direct methods
.method private constructor <init>(Lcom/almworks/sqlite4java/SQLiteConnection;)V
    .locals 1

    .prologue
    .line 1730
    iput-object p1, p0, Lcom/almworks/sqlite4java/SQLiteConnection$CachedController;->this$0:Lcom/almworks/sqlite4java/SQLiteConnection;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/almworks/sqlite4java/SQLiteConnection$BaseController;-><init>(Lcom/almworks/sqlite4java/SQLiteConnection;Lcom/almworks/sqlite4java/SQLiteConnection$1;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/almworks/sqlite4java/SQLiteConnection;Lcom/almworks/sqlite4java/SQLiteConnection$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/almworks/sqlite4java/SQLiteConnection;
    .param p2, "x1"    # Lcom/almworks/sqlite4java/SQLiteConnection$1;

    .prologue
    .line 1730
    invoke-direct {p0, p1}, Lcom/almworks/sqlite4java/SQLiteConnection$CachedController;-><init>(Lcom/almworks/sqlite4java/SQLiteConnection;)V

    return-void
.end method


# virtual methods
.method public dispose(Lcom/almworks/sqlite4java/SQLiteLongArray;)V
    .locals 1
    .param p1, "array"    # Lcom/almworks/sqlite4java/SQLiteLongArray;

    .prologue
    .line 1739
    invoke-virtual {p0, p1}, Lcom/almworks/sqlite4java/SQLiteConnection$CachedController;->checkDispose(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1740
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteConnection$CachedController;->this$0:Lcom/almworks/sqlite4java/SQLiteConnection;

    invoke-static {v0, p1}, Lcom/almworks/sqlite4java/SQLiteConnection;->access$1000(Lcom/almworks/sqlite4java/SQLiteConnection;Lcom/almworks/sqlite4java/SQLiteLongArray;)V

    .line 1742
    :cond_0
    return-void
.end method

.method public dispose(Lcom/almworks/sqlite4java/SQLiteStatement;)V
    .locals 1
    .param p1, "statement"    # Lcom/almworks/sqlite4java/SQLiteStatement;

    .prologue
    .line 1732
    invoke-virtual {p0, p1}, Lcom/almworks/sqlite4java/SQLiteConnection$CachedController;->checkDispose(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1733
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteConnection$CachedController;->this$0:Lcom/almworks/sqlite4java/SQLiteConnection;

    invoke-static {v0, p1}, Lcom/almworks/sqlite4java/SQLiteConnection;->access$900(Lcom/almworks/sqlite4java/SQLiteConnection;Lcom/almworks/sqlite4java/SQLiteStatement;)V

    .line 1735
    :cond_0
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1745
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/almworks/sqlite4java/SQLiteConnection$CachedController;->this$0:Lcom/almworks/sqlite4java/SQLiteConnection;

    invoke-virtual {v1}, Lcom/almworks/sqlite4java/SQLiteConnection;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "[C]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
