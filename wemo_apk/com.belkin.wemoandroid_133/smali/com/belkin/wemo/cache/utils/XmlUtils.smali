.class public Lcom/belkin/wemo/cache/utils/XmlUtils;
.super Ljava/lang/Object;
.source "XmlUtils.java"


# static fields
.field private static final TAG_BINARY_STATE_C:Ljava/lang/String; = "</binaryState>"

.field private static final TAG_BINARY_STATE_O:Ljava/lang/String; = "<binaryState>"

.field private static final TAG_FRIENDLY_NAME_C:Ljava/lang/String; = "</friendlyName>"

.field private static final TAG_FRIENDLY_NAME_O:Ljava/lang/String; = "<friendlyName>"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getBinaryState(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "rawXML"    # Ljava/lang/String;

    .prologue
    .line 24
    const-string v0, ""

    .line 27
    .local v0, "str":Ljava/lang/String;
    if-eqz p0, :cond_0

    :try_start_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    .line 28
    const-string v1, "<binaryState>"

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    const-string v2, "<binaryState>"

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v1, v2

    const-string v2, "</binaryState>"

    invoke-virtual {p0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 33
    :cond_0
    :goto_0
    return-object v0

    .line 30
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public static getFriendlyName(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "rawXML"    # Ljava/lang/String;

    .prologue
    .line 11
    const-string v0, ""

    .line 14
    .local v0, "str":Ljava/lang/String;
    if-eqz p0, :cond_0

    :try_start_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    .line 15
    const-string v1, "<friendlyName>"

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    const-string v2, "<friendlyName>"

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v1, v2

    const-string v2, "</friendlyName>"

    invoke-virtual {p0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 20
    :cond_0
    :goto_0
    return-object v0

    .line 17
    :catch_0
    move-exception v1

    goto :goto_0
.end method
