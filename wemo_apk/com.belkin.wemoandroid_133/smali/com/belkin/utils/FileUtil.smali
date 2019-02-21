.class public Lcom/belkin/utils/FileUtil;
.super Ljava/lang/Object;
.source "FileUtil.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static isEmptyDirectory(Ljava/lang/String;)Z
    .locals 4
    .param p0, "dirname"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 9
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 10
    .local v1, "directory":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    .line 12
    .local v0, "contents":[Ljava/io/File;
    if-nez v0, :cond_1

    .line 19
    :cond_0
    :goto_0
    return v2

    .line 15
    :cond_1
    array-length v3, v0

    if-eqz v3, :cond_0

    .line 19
    const/4 v2, 0x1

    goto :goto_0
.end method
