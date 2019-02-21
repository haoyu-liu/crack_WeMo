.class public final Lcom/almworks/sqlite4java/SQLParts;
.super Ljava/lang/Object;
.source "SQLParts.java"


# static fields
.field private static final PARAMS_STRINGS:[Ljava/lang/String;


# instance fields
.field private myFixed:Z

.field private myHash:I

.field private final myParts:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mySql:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 38
    const/16 v0, 0x65

    new-array v0, v0, [Ljava/lang/String;

    sput-object v0, Lcom/almworks/sqlite4java/SQLParts;->PARAMS_STRINGS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/almworks/sqlite4java/SQLParts;->myParts:Ljava/util/List;

    .line 51
    return-void
.end method

.method public constructor <init>(Lcom/almworks/sqlite4java/SQLParts;)V
    .locals 2
    .param p1, "copyFrom"    # Lcom/almworks/sqlite4java/SQLParts;

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    new-instance v1, Ljava/util/ArrayList;

    if-nez p1, :cond_1

    const/4 v0, 0x5

    :goto_0
    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v1, p0, Lcom/almworks/sqlite4java/SQLParts;->myParts:Ljava/util/List;

    .line 61
    if-eqz p1, :cond_0

    .line 62
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLParts;->myParts:Ljava/util/List;

    iget-object v1, p1, Lcom/almworks/sqlite4java/SQLParts;->myParts:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 64
    :cond_0
    return-void

    .line 60
    :cond_1
    iget-object v0, p1, Lcom/almworks/sqlite4java/SQLParts;->myParts:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    goto :goto_0
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "sql"    # Ljava/lang/String;

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/almworks/sqlite4java/SQLParts;->myParts:Ljava/util/List;

    .line 73
    invoke-virtual {p0, p1}, Lcom/almworks/sqlite4java/SQLParts;->append(Ljava/lang/String;)Lcom/almworks/sqlite4java/SQLParts;

    .line 74
    return-void
.end method

.method private calcHash()I
    .locals 5

    .prologue
    .line 103
    const/4 v2, 0x0

    .line 104
    .local v2, "r":I
    iget-object v3, p0, Lcom/almworks/sqlite4java/SQLParts;->myParts:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 105
    .local v1, "myPart":Ljava/lang/String;
    mul-int/lit8 v3, v2, 0x1f

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v4

    add-int v2, v3, v4

    goto :goto_0

    .line 106
    .end local v1    # "myPart":Ljava/lang/String;
    :cond_0
    return v2
.end method

.method private createParamsString(I)Ljava/lang/String;
    .locals 3
    .param p1, "count"    # I

    .prologue
    .line 196
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 197
    .local v0, "b":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, p1, :cond_1

    .line 198
    if-lez v1, :cond_0

    .line 199
    const/16 v2, 0x2c

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 200
    :cond_0
    const/16 v2, 0x3f

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 197
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 202
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private dropCachedValues()V
    .locals 1

    .prologue
    .line 206
    const/4 v0, 0x0

    iput v0, p0, Lcom/almworks/sqlite4java/SQLParts;->myHash:I

    .line 207
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/almworks/sqlite4java/SQLParts;->mySql:Ljava/lang/String;

    .line 208
    return-void
.end method

.method private getParamsString(I)Ljava/lang/String;
    .locals 2
    .param p1, "count"    # I

    .prologue
    .line 185
    const/4 v1, 0x1

    if-ge p1, v1, :cond_1

    .line 186
    const/4 v0, 0x0

    .line 192
    :cond_0
    :goto_0
    return-object v0

    .line 187
    :cond_1
    sget-object v1, Lcom/almworks/sqlite4java/SQLParts;->PARAMS_STRINGS:[Ljava/lang/String;

    array-length v1, v1

    if-lt p1, v1, :cond_2

    .line 188
    invoke-direct {p0, p1}, Lcom/almworks/sqlite4java/SQLParts;->createParamsString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 189
    :cond_2
    sget-object v1, Lcom/almworks/sqlite4java/SQLParts;->PARAMS_STRINGS:[Ljava/lang/String;

    aget-object v0, v1, p1

    .line 190
    .local v0, "s":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 191
    sget-object v1, Lcom/almworks/sqlite4java/SQLParts;->PARAMS_STRINGS:[Ljava/lang/String;

    invoke-direct {p0, p1}, Lcom/almworks/sqlite4java/SQLParts;->createParamsString(I)Ljava/lang/String;

    move-result-object v0

    .end local v0    # "s":Ljava/lang/String;
    aput-object v0, v1, p1

    .restart local v0    # "s":Ljava/lang/String;
    goto :goto_0
.end method


# virtual methods
.method public append(Lcom/almworks/sqlite4java/SQLParts;)Lcom/almworks/sqlite4java/SQLParts;
    .locals 2
    .param p1, "parts"    # Lcom/almworks/sqlite4java/SQLParts;

    .prologue
    .line 160
    iget-boolean v0, p0, Lcom/almworks/sqlite4java/SQLParts;->myFixed:Z

    if-eqz v0, :cond_0

    .line 161
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 163
    :cond_0
    if-eqz p1, :cond_1

    iget-object v0, p1, Lcom/almworks/sqlite4java/SQLParts;->myParts:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 164
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLParts;->myParts:Ljava/util/List;

    iget-object v1, p1, Lcom/almworks/sqlite4java/SQLParts;->myParts:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 165
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLParts;->dropCachedValues()V

    .line 167
    :cond_1
    return-object p0
.end method

.method public append(Ljava/lang/String;)Lcom/almworks/sqlite4java/SQLParts;
    .locals 2
    .param p1, "part"    # Ljava/lang/String;

    .prologue
    .line 142
    iget-boolean v0, p0, Lcom/almworks/sqlite4java/SQLParts;->myFixed:Z

    if-eqz v0, :cond_0

    .line 143
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 145
    :cond_0
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_1

    .line 146
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLParts;->myParts:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 147
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLParts;->dropCachedValues()V

    .line 149
    :cond_1
    return-object p0
.end method

.method public appendParams(I)Lcom/almworks/sqlite4java/SQLParts;
    .locals 1
    .param p1, "count"    # I

    .prologue
    .line 181
    invoke-direct {p0, p1}, Lcom/almworks/sqlite4java/SQLParts;->getParamsString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/almworks/sqlite4java/SQLParts;->append(Ljava/lang/String;)Lcom/almworks/sqlite4java/SQLParts;

    move-result-object v0

    return-object v0
.end method

.method public clear()V
    .locals 2

    .prologue
    .line 127
    iget-boolean v0, p0, Lcom/almworks/sqlite4java/SQLParts;->myFixed:Z

    if-eqz v0, :cond_0

    .line 128
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 130
    :cond_0
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLParts;->myParts:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 131
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLParts;->dropCachedValues()V

    .line 132
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 6
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 110
    if-ne p0, p1, :cond_0

    move v2, v3

    .line 118
    .end local p1    # "o":Ljava/lang/Object;
    :goto_0
    return v2

    .line 111
    .restart local p1    # "o":Ljava/lang/Object;
    :cond_0
    if-eqz p1, :cond_1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    if-eq v2, v5, :cond_2

    :cond_1
    move v2, v4

    goto :goto_0

    .line 112
    :cond_2
    check-cast p1, Lcom/almworks/sqlite4java/SQLParts;

    .end local p1    # "o":Ljava/lang/Object;
    iget-object v1, p1, Lcom/almworks/sqlite4java/SQLParts;->myParts:Ljava/util/List;

    .line 113
    .local v1, "other":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v2, p0, Lcom/almworks/sqlite4java/SQLParts;->myParts:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v5

    if-eq v2, v5, :cond_3

    move v2, v4

    .line 114
    goto :goto_0

    .line 115
    :cond_3
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v2, p0, Lcom/almworks/sqlite4java/SQLParts;->myParts:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_5

    .line 116
    iget-object v2, p0, Lcom/almworks/sqlite4java/SQLParts;->myParts:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    move v2, v4

    .line 117
    goto :goto_0

    .line 115
    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_5
    move v2, v3

    .line 118
    goto :goto_0
.end method

.method public fix()Lcom/almworks/sqlite4java/SQLParts;
    .locals 1

    .prologue
    .line 82
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/almworks/sqlite4java/SQLParts;->myFixed:Z

    .line 83
    return-object p0
.end method

.method public getFixedParts()Lcom/almworks/sqlite4java/SQLParts;
    .locals 1

    .prologue
    .line 93
    iget-boolean v0, p0, Lcom/almworks/sqlite4java/SQLParts;->myFixed:Z

    if-eqz v0, :cond_0

    .end local p0    # "this":Lcom/almworks/sqlite4java/SQLParts;
    :goto_0
    return-object p0

    .restart local p0    # "this":Lcom/almworks/sqlite4java/SQLParts;
    :cond_0
    new-instance v0, Lcom/almworks/sqlite4java/SQLParts;

    invoke-direct {v0, p0}, Lcom/almworks/sqlite4java/SQLParts;-><init>(Lcom/almworks/sqlite4java/SQLParts;)V

    invoke-virtual {v0}, Lcom/almworks/sqlite4java/SQLParts;->fix()Lcom/almworks/sqlite4java/SQLParts;

    move-result-object p0

    goto :goto_0
.end method

.method public getParts()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 232
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLParts;->myParts:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 97
    iget v0, p0, Lcom/almworks/sqlite4java/SQLParts;->myHash:I

    if-nez v0, :cond_0

    .line 98
    invoke-direct {p0}, Lcom/almworks/sqlite4java/SQLParts;->calcHash()I

    move-result v0

    iput v0, p0, Lcom/almworks/sqlite4java/SQLParts;->myHash:I

    .line 99
    :cond_0
    iget v0, p0, Lcom/almworks/sqlite4java/SQLParts;->myHash:I

    return v0
.end method

.method public isFixed()Z
    .locals 1

    .prologue
    .line 242
    iget-boolean v0, p0, Lcom/almworks/sqlite4java/SQLParts;->myFixed:Z

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 216
    iget-object v2, p0, Lcom/almworks/sqlite4java/SQLParts;->mySql:Ljava/lang/String;

    if-nez v2, :cond_1

    .line 217
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 218
    .local v0, "builder":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lcom/almworks/sqlite4java/SQLParts;->myParts:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 219
    iget-object v2, p0, Lcom/almworks/sqlite4java/SQLParts;->myParts:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 218
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 221
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/almworks/sqlite4java/SQLParts;->mySql:Ljava/lang/String;

    .line 223
    .end local v0    # "builder":Ljava/lang/StringBuilder;
    .end local v1    # "i":I
    :cond_1
    iget-object v2, p0, Lcom/almworks/sqlite4java/SQLParts;->mySql:Ljava/lang/String;

    return-object v2
.end method
