.class public Lorg/cybergarage/xml/XML;
.super Ljava/lang/Object;
.source "XML.java"


# static fields
.field public static final CHARSET_UTF8:Ljava/lang/String; = "utf-8"

.field public static final CONTENT_TYPE:Ljava/lang/String; = "text/xml; charset=\"utf-8\""


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final escapeXMLChars(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "input"    # Ljava/lang/String;

    .prologue
    .line 63
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lorg/cybergarage/xml/XML;->escapeXMLChars(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static final escapeXMLChars(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 7
    .param p0, "input"    # Ljava/lang/String;
    .param p1, "quote"    # Z

    .prologue
    const/4 v6, 0x0

    .line 32
    if-nez p0, :cond_1

    .line 33
    const/4 p0, 0x0

    .line 58
    .end local p0    # "input":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p0

    .line 34
    .restart local p0    # "input":Ljava/lang/String;
    :cond_1
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    .line 35
    .local v4, "out":Ljava/lang/StringBuffer;
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    .line 36
    .local v3, "oldsize":I
    new-array v2, v3, [C

    .line 37
    .local v2, "old":[C
    invoke-virtual {p0, v6, v3, v2, v6}, Ljava/lang/String;->getChars(II[CI)V

    .line 38
    const/4 v5, 0x0

    .line 39
    .local v5, "selstart":I
    const/4 v0, 0x0

    .line 40
    .local v0, "entity":Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-ge v1, v3, :cond_5

    .line 41
    aget-char v6, v2, v1

    sparse-switch v6, :sswitch_data_0

    .line 48
    :cond_2
    :goto_2
    if-eqz v0, :cond_3

    .line 49
    sub-int v6, v1, v5

    invoke-virtual {v4, v2, v5, v6}, Ljava/lang/StringBuffer;->append([CII)Ljava/lang/StringBuffer;

    .line 50
    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 51
    add-int/lit8 v5, v1, 0x1

    .line 52
    const/4 v0, 0x0

    .line 40
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 42
    :sswitch_0
    const-string v0, "&amp;"

    goto :goto_2

    .line 43
    :sswitch_1
    const-string v0, "&lt;"

    goto :goto_2

    .line 44
    :sswitch_2
    const-string v0, "&gt;"

    goto :goto_2

    .line 45
    :sswitch_3
    if-eqz p1, :cond_4

    const-string v0, "&apos;"

    goto :goto_2

    .line 46
    :cond_4
    :sswitch_4
    if-eqz p1, :cond_2

    const-string v0, "&quot;"

    goto :goto_2

    .line 55
    :cond_5
    if-eqz v5, :cond_0

    .line 57
    sub-int v6, v3, v5

    invoke-virtual {v4, v2, v5, v6}, Ljava/lang/StringBuffer;->append([CII)Ljava/lang/StringBuffer;

    .line 58
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 41
    :sswitch_data_0
    .sparse-switch
        0x22 -> :sswitch_4
        0x26 -> :sswitch_0
        0x27 -> :sswitch_3
        0x3c -> :sswitch_1
        0x3e -> :sswitch_2
    .end sparse-switch
.end method

.method public static final unescapeXMLChars(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "input"    # Ljava/lang/String;

    .prologue
    .line 72
    if-nez p0, :cond_0

    .line 73
    const/4 v0, 0x0

    .line 83
    :goto_0
    return-object v0

    .line 77
    :cond_0
    const-string v1, "&amp;"

    const-string v2, "&"

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 78
    .local v0, "outStr":Ljava/lang/String;
    const-string v1, "&lt;"

    const-string v2, "<"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 79
    const-string v1, "&gt;"

    const-string v2, ">"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 80
    const-string v1, "&apos;"

    const-string v2, "\'"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 81
    const-string v1, "&quot;"

    const-string v2, "\""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 83
    goto :goto_0
.end method
