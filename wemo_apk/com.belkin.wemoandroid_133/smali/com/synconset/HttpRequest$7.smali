.class Lcom/synconset/HttpRequest$7;
.super Lcom/synconset/HttpRequest$CloseOperation;
.source "HttpRequest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/synconset/HttpRequest;->receive(Ljava/io/Writer;)Lcom/synconset/HttpRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/synconset/HttpRequest$CloseOperation",
        "<",
        "Lcom/synconset/HttpRequest;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/synconset/HttpRequest;

.field final synthetic val$reader:Ljava/io/BufferedReader;

.field final synthetic val$writer:Ljava/io/Writer;


# direct methods
.method constructor <init>(Lcom/synconset/HttpRequest;Ljava/io/Closeable;ZLjava/io/BufferedReader;Ljava/io/Writer;)V
    .locals 0
    .param p2, "x0"    # Ljava/io/Closeable;
    .param p3, "x1"    # Z

    .prologue
    .line 2072
    iput-object p1, p0, Lcom/synconset/HttpRequest$7;->this$0:Lcom/synconset/HttpRequest;

    iput-object p4, p0, Lcom/synconset/HttpRequest$7;->val$reader:Ljava/io/BufferedReader;

    iput-object p5, p0, Lcom/synconset/HttpRequest$7;->val$writer:Ljava/io/Writer;

    invoke-direct {p0, p2, p3}, Lcom/synconset/HttpRequest$CloseOperation;-><init>(Ljava/io/Closeable;Z)V

    return-void
.end method


# virtual methods
.method public run()Lcom/synconset/HttpRequest;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2076
    iget-object v0, p0, Lcom/synconset/HttpRequest$7;->this$0:Lcom/synconset/HttpRequest;

    iget-object v1, p0, Lcom/synconset/HttpRequest$7;->val$reader:Ljava/io/BufferedReader;

    iget-object v2, p0, Lcom/synconset/HttpRequest$7;->val$writer:Ljava/io/Writer;

    invoke-virtual {v0, v1, v2}, Lcom/synconset/HttpRequest;->copy(Ljava/io/Reader;Ljava/io/Writer;)Lcom/synconset/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic run()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2072
    invoke-virtual {p0}, Lcom/synconset/HttpRequest$7;->run()Lcom/synconset/HttpRequest;

    move-result-object v0

    return-object v0
.end method
