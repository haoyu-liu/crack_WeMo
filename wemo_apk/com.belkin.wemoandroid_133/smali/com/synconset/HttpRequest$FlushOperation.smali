.class public abstract Lcom/synconset/HttpRequest$FlushOperation;
.super Lcom/synconset/HttpRequest$Operation;
.source "HttpRequest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/synconset/HttpRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40c
    name = "FlushOperation"
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
.field private final flushable:Ljava/io/Flushable;


# direct methods
.method protected constructor <init>(Ljava/io/Flushable;)V
    .locals 0
    .param p1, "flushable"    # Ljava/io/Flushable;

    .prologue
    .line 840
    .local p0, "this":Lcom/synconset/HttpRequest$FlushOperation;, "Lcom/synconset/HttpRequest$FlushOperation<TV;>;"
    invoke-direct {p0}, Lcom/synconset/HttpRequest$Operation;-><init>()V

    .line 841
    iput-object p1, p0, Lcom/synconset/HttpRequest$FlushOperation;->flushable:Ljava/io/Flushable;

    .line 842
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
    .line 846
    .local p0, "this":Lcom/synconset/HttpRequest$FlushOperation;, "Lcom/synconset/HttpRequest$FlushOperation<TV;>;"
    iget-object v0, p0, Lcom/synconset/HttpRequest$FlushOperation;->flushable:Ljava/io/Flushable;

    invoke-interface {v0}, Ljava/io/Flushable;->flush()V

    .line 847
    return-void
.end method
