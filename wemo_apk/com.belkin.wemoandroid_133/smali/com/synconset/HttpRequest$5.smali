.class Lcom/synconset/HttpRequest$5;
.super Lcom/synconset/HttpRequest$CloseOperation;
.source "HttpRequest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/synconset/HttpRequest;->receive(Ljava/io/File;)Lcom/synconset/HttpRequest;
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

.field final synthetic val$output:Ljava/io/OutputStream;


# direct methods
.method constructor <init>(Lcom/synconset/HttpRequest;Ljava/io/Closeable;ZLjava/io/OutputStream;)V
    .locals 0
    .param p2, "x0"    # Ljava/io/Closeable;
    .param p3, "x1"    # Z

    .prologue
    .line 2000
    iput-object p1, p0, Lcom/synconset/HttpRequest$5;->this$0:Lcom/synconset/HttpRequest;

    iput-object p4, p0, Lcom/synconset/HttpRequest$5;->val$output:Ljava/io/OutputStream;

    invoke-direct {p0, p2, p3}, Lcom/synconset/HttpRequest$CloseOperation;-><init>(Ljava/io/Closeable;Z)V

    return-void
.end method


# virtual methods
.method protected run()Lcom/synconset/HttpRequest;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/synconset/HttpRequest$HttpRequestException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2004
    iget-object v0, p0, Lcom/synconset/HttpRequest$5;->this$0:Lcom/synconset/HttpRequest;

    iget-object v1, p0, Lcom/synconset/HttpRequest$5;->val$output:Ljava/io/OutputStream;

    invoke-virtual {v0, v1}, Lcom/synconset/HttpRequest;->receive(Ljava/io/OutputStream;)Lcom/synconset/HttpRequest;

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
    .line 2000
    invoke-virtual {p0}, Lcom/synconset/HttpRequest$5;->run()Lcom/synconset/HttpRequest;

    move-result-object v0

    return-object v0
.end method
