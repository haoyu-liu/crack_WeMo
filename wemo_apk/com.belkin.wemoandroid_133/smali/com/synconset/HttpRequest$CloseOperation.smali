.class public abstract Lcom/synconset/HttpRequest$CloseOperation;
.super Lcom/synconset/HttpRequest$Operation;
.source "HttpRequest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/synconset/HttpRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40c
    name = "CloseOperation"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/synconset/HttpRequest$Operation",
        "<TV;>;"
    }
.end annotation


# instance fields
.field private final closeable:Ljava/io/Closeable;

.field private final ignoreCloseExceptions:Z


# direct methods
.method protected constructor <init>(Ljava/io/Closeable;Z)V
    .locals 0
    .param p1, "closeable"    # Ljava/io/Closeable;
    .param p2, "ignoreCloseExceptions"    # Z

    .prologue
    .line 805
    .local p0, "this":Lcom/synconset/HttpRequest$CloseOperation;, "Lcom/synconset/HttpRequest$CloseOperation<TV;>;"
    invoke-direct {p0}, Lcom/synconset/HttpRequest$Operation;-><init>()V

    .line 806
    iput-object p1, p0, Lcom/synconset/HttpRequest$CloseOperation;->closeable:Ljava/io/Closeable;

    .line 807
    iput-boolean p2, p0, Lcom/synconset/HttpRequest$CloseOperation;->ignoreCloseExceptions:Z

    .line 808
    return-void
.end method


# virtual methods
.method protected done()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 812
    .local p0, "this":Lcom/synconset/HttpRequest$CloseOperation;, "Lcom/synconset/HttpRequest$CloseOperation<TV;>;"
    iget-object v0, p0, Lcom/synconset/HttpRequest$CloseOperation;->closeable:Ljava/io/Closeable;

    instance-of v0, v0, Ljava/io/Flushable;

    if-eqz v0, :cond_0

    .line 813
    iget-object v0, p0, Lcom/synconset/HttpRequest$CloseOperation;->closeable:Ljava/io/Closeable;

    check-cast v0, Ljava/io/Flushable;

    invoke-interface {v0}, Ljava/io/Flushable;->flush()V

    .line 814
    :cond_0
    iget-boolean v0, p0, Lcom/synconset/HttpRequest$CloseOperation;->ignoreCloseExceptions:Z

    if-eqz v0, :cond_1

    .line 816
    :try_start_0
    iget-object v0, p0, Lcom/synconset/HttpRequest$CloseOperation;->closeable:Ljava/io/Closeable;

    invoke-interface {v0}, Ljava/io/Closeable;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 822
    :goto_0
    return-void

    .line 821
    :cond_1
    iget-object v0, p0, Lcom/synconset/HttpRequest$CloseOperation;->closeable:Ljava/io/Closeable;

    invoke-interface {v0}, Ljava/io/Closeable;->close()V

    goto :goto_0

    .line 817
    :catch_0
    move-exception v0

    goto :goto_0
.end method
