.class public Lorg/cybergarage/http/HTTP;
.super Ljava/lang/Object;
.source "HTTP.java"


# static fields
.field public static final CACHE_CONTROL:Ljava/lang/String; = "Cache-Control"

.field public static final CALLBACK:Ljava/lang/String; = "CALLBACK"

.field public static final CHARSET:Ljava/lang/String; = "charset"

.field public static final CHUNKED:Ljava/lang/String; = "Chunked"

.field public static final CLOSE:Ljava/lang/String; = "close"

.field public static final CONNECTION:Ljava/lang/String; = "Connection"

.field public static final CONTENT_LENGTH:Ljava/lang/String; = "Content-Length"

.field public static final CONTENT_RANGE:Ljava/lang/String; = "Content-Range"

.field public static final CONTENT_RANGE_BYTES:Ljava/lang/String; = "bytes"

.field public static final CONTENT_TYPE:Ljava/lang/String; = "Content-Type"

.field public static final CR:B = 0xdt

.field public static final CRLF:Ljava/lang/String; = "\r\n"

.field public static final DATE:Ljava/lang/String; = "Date"

.field public static final DEFAULT_CHUNK_SIZE:I = 0x80000

.field public static final DEFAULT_PORT:I = 0x50

.field public static final DEFAULT_TIMEOUT:I = 0x1e

.field public static final EXT:Ljava/lang/String; = "EXT"

.field public static final GET:Ljava/lang/String; = "GET"

.field public static final HEAD:Ljava/lang/String; = "HEAD"

.field public static final HEADER_LINE_DELIM:Ljava/lang/String; = " :"

.field public static final HOST:Ljava/lang/String; = "HOST"

.field public static final KEEP_ALIVE:Ljava/lang/String; = "Keep-Alive"

.field public static final LF:B = 0xat

.field public static final LOCATION:Ljava/lang/String; = "Location"

.field public static final MAN:Ljava/lang/String; = "MAN"

.field public static final MAX_AGE:Ljava/lang/String; = "max-age"

.field public static final MX:Ljava/lang/String; = "MX"

.field public static final MYNAME:Ljava/lang/String; = "MYNAME"

.field public static final M_SEARCH:Ljava/lang/String; = "M-SEARCH"

.field public static final NOTIFY:Ljava/lang/String; = "NOTIFY"

.field public static final NO_CACHE:Ljava/lang/String; = "no-cache"

.field public static final NT:Ljava/lang/String; = "NT"

.field public static final NTS:Ljava/lang/String; = "NTS"

.field public static final POST:Ljava/lang/String; = "POST"

.field public static final RANGE:Ljava/lang/String; = "Range"

.field public static final REQEST_LINE_DELIM:Ljava/lang/String; = " "

.field public static final SEQ:Ljava/lang/String; = "SEQ"

.field public static final SERVER:Ljava/lang/String; = "Server"

.field public static final SID:Ljava/lang/String; = "SID"

.field public static final SOAP_ACTION:Ljava/lang/String; = "SOAPACTION"

.field public static final ST:Ljava/lang/String; = "ST"

.field public static final STATUS_LINE_DELIM:Ljava/lang/String; = " "

.field public static final SUBSCRIBE:Ljava/lang/String; = "SUBSCRIBE"

.field public static final TAB:Ljava/lang/String; = "\t"

.field public static final TIMEOUT:Ljava/lang/String; = "TIMEOUT"

.field public static final TRANSFER_ENCODING:Ljava/lang/String; = "Transfer-Encoding"

.field public static final UNSUBSCRIBE:Ljava/lang/String; = "UNSUBSCRIBE"

.field public static final USN:Ljava/lang/String; = "USN"

.field public static final VERSION:Ljava/lang/String; = "1.1"

.field public static final VERSION_10:Ljava/lang/String; = "1.0"

.field public static final VERSION_11:Ljava/lang/String; = "1.1"

.field private static chunkSize:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 200
    const/high16 v0, 0x80000

    sput v0, Lorg/cybergarage/http/HTTP;->chunkSize:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final getAbsoluteURL(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "baseURLStr"    # Ljava/lang/String;
    .param p1, "relURlStr"    # Ljava/lang/String;

    .prologue
    .line 183
    :try_start_0
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 184
    .local v0, "baseURL":Ljava/net/URL;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "://"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/net/URL;->getPort()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {p1}, Lorg/cybergarage/http/HTTP;->toRelativeURL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 192
    .end local v0    # "baseURL":Ljava/net/URL;
    :goto_0
    return-object v2

    .line 191
    :catch_0
    move-exception v1

    .line 192
    .local v1, "e":Ljava/lang/Exception;
    const-string v2, ""

    goto :goto_0
.end method

.method public static final getChunkSize()I
    .locals 1

    .prologue
    .line 209
    sget v0, Lorg/cybergarage/http/HTTP;->chunkSize:I

    return v0
.end method

.method public static final getHost(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "urlStr"    # Ljava/lang/String;

    .prologue
    .line 122
    :try_start_0
    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 123
    .local v1, "url":Ljava/net/URL;
    invoke-virtual {v1}, Ljava/net/URL;->getHost()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 126
    .end local v1    # "url":Ljava/net/URL;
    :goto_0
    return-object v2

    .line 125
    :catch_0
    move-exception v0

    .line 126
    .local v0, "e":Ljava/lang/Exception;
    const-string v2, ""

    goto :goto_0
.end method

.method public static final getPort(Ljava/lang/String;)I
    .locals 3
    .param p0, "urlStr"    # Ljava/lang/String;

    .prologue
    .line 133
    :try_start_0
    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 135
    .local v2, "url":Ljava/net/URL;
    invoke-virtual {v2}, Ljava/net/URL;->getPort()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 136
    .local v1, "port":I
    if-gtz v1, :cond_0

    .line 137
    const/16 v1, 0x50

    .line 141
    .end local v1    # "port":I
    .end local v2    # "url":Ljava/net/URL;
    :cond_0
    :goto_0
    return v1

    .line 140
    :catch_0
    move-exception v0

    .line 141
    .local v0, "e":Ljava/lang/Exception;
    const/16 v1, 0x50

    goto :goto_0
.end method

.method public static final getRequestHostURL(Ljava/lang/String;I)Ljava/lang/String;
    .locals 3
    .param p0, "host"    # Ljava/lang/String;
    .param p1, "port"    # I

    .prologue
    .line 147
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "http://"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 148
    .local v0, "reqHost":Ljava/lang/String;
    return-object v0
.end method

.method public static final isAbsoluteURL(Ljava/lang/String;)Z
    .locals 2
    .param p0, "urlStr"    # Ljava/lang/String;

    .prologue
    .line 111
    :try_start_0
    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 112
    const/4 v1, 0x1

    .line 115
    :goto_0
    return v1

    .line 114
    :catch_0
    move-exception v0

    .line 115
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static final setChunkSize(I)V
    .locals 0
    .param p0, "size"    # I

    .prologue
    .line 204
    sput p0, Lorg/cybergarage/http/HTTP;->chunkSize:I

    .line 205
    return-void
.end method

.method public static final toRelativeURL(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "urlStr"    # Ljava/lang/String;

    .prologue
    .line 177
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lorg/cybergarage/http/HTTP;->toRelativeURL(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static final toRelativeURL(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 5
    .param p0, "urlStr"    # Ljava/lang/String;
    .param p1, "withParam"    # Z

    .prologue
    const/4 v4, 0x0

    .line 153
    move-object v1, p0

    .line 154
    .local v1, "uri":Ljava/lang/String;
    invoke-static {p0}, Lorg/cybergarage/http/HTTP;->isAbsoluteURL(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 155
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_0

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x2f

    if-eq v3, v4, :cond_0

    .line 156
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 172
    :cond_0
    :goto_0
    return-object v1

    .line 160
    :cond_1
    :try_start_0
    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 161
    .local v2, "url":Ljava/net/URL;
    invoke-virtual {v2}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v1

    .line 162
    const/4 v3, 0x1

    if-ne p1, v3, :cond_2

    .line 163
    invoke-virtual {v2}, Ljava/net/URL;->getQuery()Ljava/lang/String;

    move-result-object v0

    .line 164
    .local v0, "queryStr":Ljava/lang/String;
    const-string v3, ""

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 165
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "?"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 168
    .end local v0    # "queryStr":Ljava/lang/String;
    :cond_2
    const-string v3, "/"

    invoke-virtual {v1, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 169
    const/4 v3, 0x0

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v1, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto :goto_0

    .line 170
    .end local v2    # "url":Ljava/net/URL;
    :catch_0
    move-exception v3

    goto :goto_0
.end method
