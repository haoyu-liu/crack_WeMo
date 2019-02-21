.class Lcom/synconset/HttpRequest$8;
.super Lcom/synconset/HttpRequest$CloseOperation;
.source "HttpRequest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/synconset/HttpRequest;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)Lcom/synconset/HttpRequest;
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

.field final synthetic val$input:Ljava/io/InputStream;

.field final synthetic val$output:Ljava/io/OutputStream;


# direct methods
.method constructor <init>(Lcom/synconset/HttpRequest;Ljava/io/Closeable;ZLjava/io/InputStream;Ljava/io/OutputStream;)V
    .locals 0
    .param p2, "x0"    # Ljava/io/Closeable;
    .param p3, "x1"    # Z

    .prologue
    .line 2658
    iput-object p1, p0, Lcom/synconset/HttpRequest$8;->this$0:Lcom/synconset/HttpRequest;

    iput-object p4, p0, Lcom/synconset/HttpRequest$8;->val$input:Ljava/io/InputStream;

    iput-object p5, p0, Lcom/synconset/HttpRequest$8;->val$output:Ljava/io/OutputStream;

    invoke-direct {p0, p2, p3}, Lcom/synconset/HttpRequest$CloseOperation;-><init>(Ljava/io/Closeable;Z)V

    return-void
.end method


# virtual methods
.method public run()Lcom/synconset/HttpRequest;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2662
    iget-object v2, p0, Lcom/synconset/HttpRequest$8;->this$0:Lcom/synconset/HttpRequest;

    invoke-static {v2}, Lcom/synconset/HttpRequest;->access$200(Lcom/synconset/HttpRequest;)I

    move-result v2

    new-array v0, v2, [B

    .line 2664
    .local v0, "buffer":[B
    :goto_0
    iget-object v2, p0, Lcom/synconset/HttpRequest$8;->val$input:Ljava/io/InputStream;

    invoke-virtual {v2, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .local v1, "read":I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 2665
    iget-object v2, p0, Lcom/synconset/HttpRequest$8;->val$output:Ljava/io/OutputStream;

    const/4 v3, 0x0

    invoke-virtual {v2, v0, v3, v1}, Ljava/io/OutputStream;->write([BII)V

    .line 2666
    iget-object v2, p0, Lcom/synconset/HttpRequest$8;->this$0:Lcom/synconset/HttpRequest;

    int-to-long v4, v1

    invoke-static {v2, v4, v5}, Lcom/synconset/HttpRequest;->access$314(Lcom/synconset/HttpRequest;J)J

    .line 2667
    iget-object v2, p0, Lcom/synconset/HttpRequest$8;->this$0:Lcom/synconset/HttpRequest;

    invoke-static {v2}, Lcom/synconset/HttpRequest;->access$500(Lcom/synconset/HttpRequest;)Lcom/synconset/HttpRequest$UploadProgress;

    move-result-object v2

    iget-object v3, p0, Lcom/synconset/HttpRequest$8;->this$0:Lcom/synconset/HttpRequest;

    invoke-static {v3}, Lcom/synconset/HttpRequest;->access$300(Lcom/synconset/HttpRequest;)J

    move-result-wide v4

    iget-object v3, p0, Lcom/synconset/HttpRequest$8;->this$0:Lcom/synconset/HttpRequest;

    invoke-static {v3}, Lcom/synconset/HttpRequest;->access$400(Lcom/synconset/HttpRequest;)J

    move-result-wide v6

    invoke-interface {v2, v4, v5, v6, v7}, Lcom/synconset/HttpRequest$UploadProgress;->onUpload(JJ)V

    goto :goto_0

    .line 2669
    :cond_0
    iget-object v2, p0, Lcom/synconset/HttpRequest$8;->this$0:Lcom/synconset/HttpRequest;

    return-object v2
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
    .line 2658
    invoke-virtual {p0}, Lcom/synconset/HttpRequest$8;->run()Lcom/synconset/HttpRequest;

    move-result-object v0

    return-object v0
.end method
