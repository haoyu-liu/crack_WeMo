.class public abstract Lorg/cybergarage/xml/Parser;
.super Ljava/lang/Object;
.source "Parser.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    return-void
.end method


# virtual methods
.method public parse(Ljava/io/File;)Lorg/cybergarage/xml/Node;
    .locals 3
    .param p1, "descriptionFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/cybergarage/xml/ParserException;
        }
    .end annotation

    .prologue
    .line 101
    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 102
    .local v1, "fileIn":Ljava/io/InputStream;
    invoke-virtual {p0, v1}, Lorg/cybergarage/xml/Parser;->parse(Ljava/io/InputStream;)Lorg/cybergarage/xml/Node;

    move-result-object v2

    .line 103
    .local v2, "root":Lorg/cybergarage/xml/Node;
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 110
    .end local v1    # "fileIn":Ljava/io/InputStream;
    .end local v2    # "root":Lorg/cybergarage/xml/Node;
    :goto_0
    return-object v2

    .line 106
    :catch_0
    move-exception v0

    .line 108
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 110
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public abstract parse(Ljava/io/InputStream;)Lorg/cybergarage/xml/Node;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/cybergarage/xml/ParserException;
        }
    .end annotation
.end method

.method public parse(Ljava/lang/String;)Lorg/cybergarage/xml/Node;
    .locals 4
    .param p1, "descr"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/cybergarage/xml/ParserException;
        }
    .end annotation

    .prologue
    .line 120
    :try_start_0
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 121
    .local v0, "decrIn":Ljava/io/InputStream;
    invoke-virtual {p0, v0}, Lorg/cybergarage/xml/Parser;->parse(Ljava/io/InputStream;)Lorg/cybergarage/xml/Node;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 122
    .local v2, "root":Lorg/cybergarage/xml/Node;
    return-object v2

    .line 123
    .end local v0    # "decrIn":Ljava/io/InputStream;
    .end local v2    # "root":Lorg/cybergarage/xml/Node;
    :catch_0
    move-exception v1

    .line 124
    .local v1, "e":Ljava/lang/Exception;
    new-instance v3, Lorg/cybergarage/xml/ParserException;

    invoke-direct {v3, v1}, Lorg/cybergarage/xml/ParserException;-><init>(Ljava/lang/Exception;)V

    throw v3
.end method

.method public parse(Ljava/net/URL;)Lorg/cybergarage/xml/Node;
    .locals 13
    .param p1, "locationURL"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/cybergarage/xml/ParserException;
        }
    .end annotation

    .prologue
    .line 55
    invoke-virtual {p1}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v1

    .line 56
    .local v1, "host":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/net/URL;->getPort()I

    move-result v4

    .line 58
    .local v4, "port":I
    const/4 v10, -0x1

    if-ne v4, v10, :cond_0

    .line 59
    const/16 v4, 0x50

    .line 60
    :cond_0
    invoke-virtual {p1}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v7

    .line 63
    .local v7, "uri":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v8

    check-cast v8, Ljava/net/HttpURLConnection;

    .line 64
    .local v8, "urlCon":Ljava/net/HttpURLConnection;
    const-string v10, "GET"

    invoke-virtual {v8, v10}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 65
    const-string v10, "Content-Length"

    const-string v11, "0"

    invoke-virtual {v8, v10, v11}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    if-eqz v1, :cond_1

    .line 67
    const-string v10, "HOST"

    invoke-virtual {v8, v10, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    :cond_1
    invoke-virtual {v8}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v9

    .line 71
    .local v9, "urlIn":Ljava/io/InputStream;
    invoke-virtual {p0, v9}, Lorg/cybergarage/xml/Parser;->parse(Ljava/io/InputStream;)Lorg/cybergarage/xml/Node;

    move-result-object v5

    .line 73
    .local v5, "rootElem":Lorg/cybergarage/xml/Node;
    invoke-virtual {v9}, Ljava/io/InputStream;->close()V

    .line 74
    invoke-virtual {v8}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 91
    .end local v5    # "rootElem":Lorg/cybergarage/xml/Node;
    .end local v8    # "urlCon":Ljava/net/HttpURLConnection;
    .end local v9    # "urlIn":Ljava/io/InputStream;
    :goto_0
    return-object v5

    .line 78
    :catch_0
    move-exception v10

    .line 82
    new-instance v2, Lorg/cybergarage/http/HTTPRequest;

    invoke-direct {v2}, Lorg/cybergarage/http/HTTPRequest;-><init>()V

    .line 83
    .local v2, "httpReq":Lorg/cybergarage/http/HTTPRequest;
    const-string v10, "GET"

    invoke-virtual {v2, v10}, Lorg/cybergarage/http/HTTPRequest;->setMethod(Ljava/lang/String;)V

    .line 84
    invoke-virtual {v2, v7}, Lorg/cybergarage/http/HTTPRequest;->setURI(Ljava/lang/String;)V

    .line 85
    invoke-virtual {v2, v1, v4}, Lorg/cybergarage/http/HTTPRequest;->post(Ljava/lang/String;I)Lorg/cybergarage/http/HTTPResponse;

    move-result-object v3

    .line 86
    .local v3, "httpRes":Lorg/cybergarage/http/HTTPResponse;
    invoke-virtual {v3}, Lorg/cybergarage/http/HTTPResponse;->isSuccessful()Z

    move-result v10

    if-nez v10, :cond_2

    .line 87
    new-instance v10, Lorg/cybergarage/xml/ParserException;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "HTTP comunication failed: no answer from peer.Unable to retrive resoure -> "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {p1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Lorg/cybergarage/xml/ParserException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 89
    :cond_2
    new-instance v0, Ljava/lang/String;

    invoke-virtual {v3}, Lorg/cybergarage/http/HTTPResponse;->getContent()[B

    move-result-object v10

    invoke-direct {v0, v10}, Ljava/lang/String;-><init>([B)V

    .line 90
    .local v0, "content":Ljava/lang/String;
    new-instance v6, Ljava/io/ByteArrayInputStream;

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v10

    invoke-direct {v6, v10}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 91
    .local v6, "strBuf":Ljava/io/ByteArrayInputStream;
    invoke-virtual {p0, v6}, Lorg/cybergarage/xml/Parser;->parse(Ljava/io/InputStream;)Lorg/cybergarage/xml/Node;

    move-result-object v5

    goto :goto_0
.end method
