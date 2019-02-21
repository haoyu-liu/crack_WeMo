.class Lcom/almworks/sqlite4java/SQLiteQueue$1;
.super Ljava/lang/Object;
.source "SQLiteQueue.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/almworks/sqlite4java/SQLiteQueue;->start()Lcom/almworks/sqlite4java/SQLiteQueue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/almworks/sqlite4java/SQLiteQueue;


# direct methods
.method constructor <init>(Lcom/almworks/sqlite4java/SQLiteQueue;)V
    .locals 0

    .prologue
    .line 203
    iput-object p1, p0, Lcom/almworks/sqlite4java/SQLiteQueue$1;->this$0:Lcom/almworks/sqlite4java/SQLiteQueue;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 205
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteQueue$1;->this$0:Lcom/almworks/sqlite4java/SQLiteQueue;

    invoke-static {v0}, Lcom/almworks/sqlite4java/SQLiteQueue;->access$000(Lcom/almworks/sqlite4java/SQLiteQueue;)V

    .line 206
    return-void
.end method
