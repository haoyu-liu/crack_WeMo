.class public Lorg/cybergarage/http/HTTPHeader;
.super Ljava/lang/Object;
.source "HTTPHeader.java"


# static fields
.field private static MAX_LENGTH:I


# instance fields
.field private name:Ljava/lang/String;

.field private value:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 29
    const/16 v0, 0x400

    sput v0, Lorg/cybergarage/http/HTTPHeader;->MAX_LENGTH:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 6
    .param p1, "lineStr"    # Ljava/lang/String;

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    const-string v3, ""

    invoke-virtual {p0, v3}, Lorg/cybergarage/http/HTTPHeader;->setName(Ljava/lang/String;)V

    .line 42
    const-string v3, ""

    invoke-virtual {p0, v3}, Lorg/cybergarage/http/HTTPHeader;->setValue(Ljava/lang/String;)V

    .line 43
    if-nez p1, :cond_1

    .line 52
    :cond_0
    :goto_0
    return-void

    .line 45
    :cond_1
    const/16 v3, 0x3a

    invoke-virtual {p1, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 46
    .local v0, "colonIdx":I
    if-ltz v0, :cond_0

    .line 48
    new-instance v1, Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    const/4 v4, 0x0

    invoke-direct {v1, v3, v4, v0}, Ljava/lang/String;-><init>([BII)V

    .line 49
    .local v1, "name":Ljava/lang/String;
    new-instance v2, Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    add-int/lit8 v4, v0, 0x1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    sub-int/2addr v5, v0

    add-int/lit8 v5, v5, -0x1

    invoke-direct {v2, v3, v4, v5}, Ljava/lang/String;-><init>([BII)V

    .line 50
    .local v2, "value":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/cybergarage/http/HTTPHeader;->setName(Ljava/lang/String;)V

    .line 51
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/cybergarage/http/HTTPHeader;->setValue(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    invoke-virtual {p0, p1}, Lorg/cybergarage/http/HTTPHeader;->setName(Ljava/lang/String;)V

    .line 36
    invoke-virtual {p0, p2}, Lorg/cybergarage/http/HTTPHeader;->setValue(Ljava/lang/String;)V

    .line 37
    return-void
.end method

.method public static final getIntegerValue(Ljava/lang/String;Ljava/lang/String;)I
    .locals 2
    .param p0, "data"    # Ljava/lang/String;
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 139
    :try_start_0
    invoke-static {p0, p1}, Lorg/cybergarage/http/HTTPHeader;->getValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 142
    :goto_0
    return v1

    .line 141
    :catch_0
    move-exception v0

    .line 142
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static final getIntegerValue([BLjava/lang/String;)I
    .locals 2
    .param p0, "data"    # [B
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 149
    :try_start_0
    invoke-static {p0, p1}, Lorg/cybergarage/http/HTTPHeader;->getValue([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 152
    :goto_0
    return v1

    .line 151
    :catch_0
    move-exception v0

    .line 152
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static final getValue(Ljava/io/LineNumberReader;Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p0, "reader"    # Ljava/io/LineNumberReader;
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 91
    invoke-virtual {p1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v1

    .line 93
    .local v1, "bigName":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Ljava/io/LineNumberReader;->readLine()Ljava/lang/String;

    move-result-object v4

    .line 94
    .local v4, "lineStr":Ljava/lang/String;
    :goto_0
    if-eqz v4, :cond_2

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_2

    .line 95
    new-instance v3, Lorg/cybergarage/http/HTTPHeader;

    invoke-direct {v3, v4}, Lorg/cybergarage/http/HTTPHeader;-><init>(Ljava/lang/String;)V

    .line 96
    .local v3, "header":Lorg/cybergarage/http/HTTPHeader;
    invoke-virtual {v3}, Lorg/cybergarage/http/HTTPHeader;->hasName()Z

    move-result v5

    if-nez v5, :cond_0

    .line 97
    invoke-virtual {p0}, Ljava/io/LineNumberReader;->readLine()Ljava/lang/String;

    move-result-object v4

    .line 98
    goto :goto_0

    .line 100
    :cond_0
    invoke-virtual {v3}, Lorg/cybergarage/http/HTTPHeader;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v0

    .line 102
    .local v0, "bigLineHeaderName":Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 103
    invoke-virtual {p0}, Ljava/io/LineNumberReader;->readLine()Ljava/lang/String;

    move-result-object v4

    .line 104
    goto :goto_0

    .line 106
    :cond_1
    invoke-virtual {v3}, Lorg/cybergarage/http/HTTPHeader;->getValue()Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .line 113
    .end local v0    # "bigLineHeaderName":Ljava/lang/String;
    .end local v3    # "header":Lorg/cybergarage/http/HTTPHeader;
    .end local v4    # "lineStr":Ljava/lang/String;
    :goto_1
    return-object v5

    .line 109
    :catch_0
    move-exception v2

    .line 110
    .local v2, "e":Ljava/io/IOException;
    invoke-static {v2}, Lorg/cybergarage/util/Debug;->warning(Ljava/lang/Exception;)V

    .line 111
    const-string v5, ""

    goto :goto_1

    .line 113
    .end local v2    # "e":Ljava/io/IOException;
    .restart local v4    # "lineStr":Ljava/lang/String;
    :cond_2
    const-string v5, ""

    goto :goto_1
.end method

.method public static final getValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "data"    # Ljava/lang/String;
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 119
    if-eqz p0, :cond_0

    :try_start_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_0

    .line 120
    new-instance v2, Ljava/io/StringReader;

    invoke-direct {v2, p0}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    .line 121
    .local v2, "strReader":Ljava/io/StringReader;
    new-instance v1, Ljava/io/LineNumberReader;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    sget v4, Lorg/cybergarage/http/HTTPHeader;->MAX_LENGTH:I

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    invoke-direct {v1, v2, v3}, Ljava/io/LineNumberReader;-><init>(Ljava/io/Reader;I)V

    .line 122
    .local v1, "lineReader":Ljava/io/LineNumberReader;
    invoke-static {v1, p1}, Lorg/cybergarage/http/HTTPHeader;->getValue(Ljava/io/LineNumberReader;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 127
    .end local v1    # "lineReader":Ljava/io/LineNumberReader;
    .end local v2    # "strReader":Ljava/io/StringReader;
    :goto_0
    return-object v3

    .line 124
    :cond_0
    const-string v3, ""
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 126
    :catch_0
    move-exception v0

    .line 127
    .local v0, "e":Ljava/lang/Exception;
    const-string v3, ""

    goto :goto_0
.end method

.method public static final getValue([BLjava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "data"    # [B
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 133
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p0}, Ljava/lang/String;-><init>([B)V

    invoke-static {v0, p1}, Lorg/cybergarage/http/HTTPHeader;->getValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 70
    iget-object v0, p0, Lorg/cybergarage/http/HTTPHeader;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 75
    iget-object v0, p0, Lorg/cybergarage/http/HTTPHeader;->value:Ljava/lang/String;

    return-object v0
.end method

.method public hasName()Z
    .locals 1

    .prologue
    .line 80
    iget-object v0, p0, Lorg/cybergarage/http/HTTPHeader;->name:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/cybergarage/http/HTTPHeader;->name:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-gtz v0, :cond_1

    .line 81
    :cond_0
    const/4 v0, 0x0

    .line 82
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 60
    iput-object p1, p0, Lorg/cybergarage/http/HTTPHeader;->name:Ljava/lang/String;

    .line 61
    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 65
    iput-object p1, p0, Lorg/cybergarage/http/HTTPHeader;->value:Ljava/lang/String;

    .line 66
    return-void
.end method
