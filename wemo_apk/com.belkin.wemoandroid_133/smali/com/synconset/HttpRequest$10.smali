.class Lcom/synconset/HttpRequest$10;
.super Lcom/synconset/HttpRequest$FlushOperation;
.source "HttpRequest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/synconset/HttpRequest;->send(Ljava/io/Reader;)Lcom/synconset/HttpRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/synconset/HttpRequest$FlushOperation",
        "<",
        "Lcom/synconset/HttpRequest;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/synconset/HttpRequest;

.field final synthetic val$input:Ljava/io/Reader;

.field final synthetic val$writer:Ljava/io/Writer;


# direct methods
.method constructor <init>(Lcom/synconset/HttpRequest;Ljava/io/Flushable;Ljava/io/Reader;Ljava/io/Writer;)V
    .locals 0
    .param p2, "x0"    # Ljava/io/Flushable;

    .prologue
    .line 3071
    iput-object p1, p0, Lcom/synconset/HttpRequest$10;->this$0:Lcom/synconset/HttpRequest;

    iput-object p3, p0, Lcom/synconset/HttpRequest$10;->val$input:Ljava/io/Reader;

    iput-object p4, p0, Lcom/synconset/HttpRequest$10;->val$writer:Ljava/io/Writer;

    invoke-direct {p0, p2}, Lcom/synconset/HttpRequest$FlushOperation;-><init>(Ljava/io/Flushable;)V

    return-void
.end method


# virtual methods
.method protected run()Lcom/synconset/HttpRequest;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 3075
    iget-object v0, p0, Lcom/synconset/HttpRequest$10;->this$0:Lcom/synconset/HttpRequest;

    iget-object v1, p0, Lcom/synconset/HttpRequest$10;->val$input:Ljava/io/Reader;

    iget-object v2, p0, Lcom/synconset/HttpRequest$10;->val$writer:Ljava/io/Writer;

    invoke-virtual {v0, v1, v2}, Lcom/synconset/HttpRequest;->copy(Ljava/io/Reader;Ljava/io/Writer;)Lcom/synconset/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic run()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 3071
    invoke-virtual {p0}, Lcom/synconset/HttpRequest$10;->run()Lcom/synconset/HttpRequest;

    move-result-object v0

    return-object v0
.end method
