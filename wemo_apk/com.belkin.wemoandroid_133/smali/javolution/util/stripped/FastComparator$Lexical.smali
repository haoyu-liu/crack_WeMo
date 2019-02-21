.class final Ljavolution/util/stripped/FastComparator$Lexical;
.super Ljavolution/util/stripped/FastComparator;
.source "FastComparator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavolution/util/stripped/FastComparator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Lexical"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 231
    invoke-direct {p0}, Ljavolution/util/stripped/FastComparator;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Ljavolution/util/stripped/FastComparator$1;)V
    .locals 0
    .param p1, "x0"    # Ljavolution/util/stripped/FastComparator$1;

    .prologue
    .line 231
    invoke-direct {p0}, Ljavolution/util/stripped/FastComparator$Lexical;-><init>()V

    return-void
.end method


# virtual methods
.method public areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 11
    .param p1, "o1"    # Ljava/lang/Object;
    .param p2, "o2"    # Ljava/lang/Object;

    .prologue
    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 248
    instance-of v9, p1, Ljava/lang/String;

    if-eqz v9, :cond_1

    instance-of v9, p2, Ljava/lang/String;

    if-eqz v9, :cond_1

    .line 249
    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v8

    .line 285
    :cond_0
    :goto_0
    return v8

    .line 250
    :cond_1
    instance-of v9, p1, Ljava/lang/CharSequence;

    if-eqz v9, :cond_3

    instance-of v9, p2, Ljava/lang/String;

    if-eqz v9, :cond_3

    move-object v0, p1

    .line 251
    check-cast v0, Ljava/lang/CharSequence;

    .local v0, "csq":Ljava/lang/CharSequence;
    move-object v6, p2

    .line 252
    check-cast v6, Ljava/lang/String;

    .line 253
    .local v6, "str":Ljava/lang/String;
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v5

    .line 254
    .local v5, "length":I
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v9

    if-ne v9, v5, :cond_0

    .line 256
    const/4 v3, 0x0

    .local v3, "i":I
    move v4, v3

    .end local v3    # "i":I
    .local v4, "i":I
    :goto_1
    if-ge v4, v5, :cond_2

    .line 257
    invoke-virtual {v6, v4}, Ljava/lang/String;->charAt(I)C

    move-result v9

    add-int/lit8 v3, v4, 0x1

    .end local v4    # "i":I
    .restart local v3    # "i":I
    invoke-interface {v0, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v10

    if-ne v9, v10, :cond_0

    move v4, v3

    .end local v3    # "i":I
    .restart local v4    # "i":I
    goto :goto_1

    :cond_2
    move v8, v7

    .line 260
    goto :goto_0

    .line 262
    .end local v0    # "csq":Ljava/lang/CharSequence;
    .end local v4    # "i":I
    .end local v5    # "length":I
    .end local v6    # "str":Ljava/lang/String;
    :cond_3
    instance-of v9, p1, Ljava/lang/String;

    if-eqz v9, :cond_5

    instance-of v9, p2, Ljava/lang/CharSequence;

    if-eqz v9, :cond_5

    move-object v0, p2

    .line 263
    check-cast v0, Ljava/lang/CharSequence;

    .restart local v0    # "csq":Ljava/lang/CharSequence;
    move-object v6, p1

    .line 264
    check-cast v6, Ljava/lang/String;

    .line 265
    .restart local v6    # "str":Ljava/lang/String;
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v5

    .line 266
    .restart local v5    # "length":I
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v9

    if-ne v9, v5, :cond_0

    .line 268
    const/4 v3, 0x0

    .restart local v3    # "i":I
    move v4, v3

    .end local v3    # "i":I
    .restart local v4    # "i":I
    :goto_2
    if-ge v4, v5, :cond_4

    .line 269
    invoke-virtual {v6, v4}, Ljava/lang/String;->charAt(I)C

    move-result v9

    add-int/lit8 v3, v4, 0x1

    .end local v4    # "i":I
    .restart local v3    # "i":I
    invoke-interface {v0, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v10

    if-ne v9, v10, :cond_0

    move v4, v3

    .end local v3    # "i":I
    .restart local v4    # "i":I
    goto :goto_2

    :cond_4
    move v8, v7

    .line 272
    goto :goto_0

    .line 274
    .end local v0    # "csq":Ljava/lang/CharSequence;
    .end local v4    # "i":I
    .end local v5    # "length":I
    .end local v6    # "str":Ljava/lang/String;
    :cond_5
    if-eqz p1, :cond_6

    if-nez p2, :cond_8

    .line 275
    :cond_6
    if-ne p1, p2, :cond_7

    :goto_3
    move v8, v7

    goto :goto_0

    :cond_7
    move v7, v8

    goto :goto_3

    :cond_8
    move-object v1, p1

    .line 276
    check-cast v1, Ljava/lang/CharSequence;

    .local v1, "csq1":Ljava/lang/CharSequence;
    move-object v2, p2

    .line 277
    check-cast v2, Ljava/lang/CharSequence;

    .line 278
    .local v2, "csq2":Ljava/lang/CharSequence;
    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v5

    .line 279
    .restart local v5    # "length":I
    invoke-interface {v2}, Ljava/lang/CharSequence;->length()I

    move-result v9

    if-ne v9, v5, :cond_0

    .line 281
    const/4 v3, 0x0

    .restart local v3    # "i":I
    move v4, v3

    .end local v3    # "i":I
    .restart local v4    # "i":I
    :goto_4
    if-ge v4, v5, :cond_9

    .line 282
    invoke-interface {v1, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v9

    add-int/lit8 v3, v4, 0x1

    .end local v4    # "i":I
    .restart local v3    # "i":I
    invoke-interface {v2, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v10

    if-ne v9, v10, :cond_0

    move v4, v3

    .end local v3    # "i":I
    .restart local v4    # "i":I
    goto :goto_4

    :cond_9
    move v8, v7

    .line 285
    goto/16 :goto_0
.end method

.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 10
    .param p1, "left"    # Ljava/lang/Object;
    .param p2, "right"    # Ljava/lang/Object;

    .prologue
    .line 289
    instance-of v8, p1, Ljava/lang/String;

    if-eqz v8, :cond_3

    .line 290
    instance-of v8, p2, Ljava/lang/String;

    if-eqz v8, :cond_0

    .line 291
    check-cast p1, Ljava/lang/String;

    .end local p1    # "left":Ljava/lang/Object;
    check-cast p2, Ljava/lang/String;

    .end local p2    # "right":Ljava/lang/Object;
    invoke-virtual {p1, p2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v8

    .line 319
    :goto_0
    return v8

    .restart local p1    # "left":Ljava/lang/Object;
    .restart local p2    # "right":Ljava/lang/Object;
    :cond_0
    move-object v6, p1

    .line 293
    check-cast v6, Ljava/lang/String;

    .local v6, "seq1":Ljava/lang/String;
    move-object v7, p2

    .line 294
    check-cast v7, Ljava/lang/CharSequence;

    .line 295
    .local v7, "seq2":Ljava/lang/CharSequence;
    const/4 v2, 0x0

    .line 296
    .local v2, "i":I
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v8

    invoke-interface {v7}, Ljava/lang/CharSequence;->length()I

    move-result v9

    invoke-static {v8, v9}, Ljava/lang/Math;->min(II)I

    move-result v4

    .local v4, "n":I
    move v5, v4

    .end local v4    # "n":I
    .local v5, "n":I
    move v3, v2

    .line 297
    .end local v2    # "i":I
    .local v3, "i":I
    :goto_1
    add-int/lit8 v4, v5, -0x1

    .end local v5    # "n":I
    .restart local v4    # "n":I
    if-eqz v5, :cond_2

    .line 298
    invoke-virtual {v6, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 299
    .local v0, "c1":C
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "i":I
    .restart local v2    # "i":I
    invoke-interface {v7, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    .line 300
    .local v1, "c2":C
    if-eq v0, v1, :cond_1

    .line 301
    sub-int v8, v0, v1

    goto :goto_0

    :cond_1
    move v5, v4

    .end local v4    # "n":I
    .restart local v5    # "n":I
    move v3, v2

    .line 302
    .end local v2    # "i":I
    .restart local v3    # "i":I
    goto :goto_1

    .line 303
    .end local v0    # "c1":C
    .end local v1    # "c2":C
    .end local v5    # "n":I
    .restart local v4    # "n":I
    :cond_2
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v8

    invoke-interface {v7}, Ljava/lang/CharSequence;->length()I

    move-result v9

    sub-int/2addr v8, v9

    goto :goto_0

    .line 305
    .end local v3    # "i":I
    .end local v4    # "n":I
    .end local v6    # "seq1":Ljava/lang/String;
    .end local v7    # "seq2":Ljava/lang/CharSequence;
    :cond_3
    instance-of v8, p2, Ljava/lang/String;

    if-eqz v8, :cond_4

    .line 306
    invoke-virtual {p0, p2, p1}, Ljavolution/util/stripped/FastComparator$Lexical;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v8

    neg-int v8, v8

    goto :goto_0

    :cond_4
    move-object v6, p1

    .line 309
    check-cast v6, Ljava/lang/CharSequence;

    .local v6, "seq1":Ljava/lang/CharSequence;
    move-object v7, p2

    .line 310
    check-cast v7, Ljava/lang/CharSequence;

    .line 311
    .restart local v7    # "seq2":Ljava/lang/CharSequence;
    const/4 v2, 0x0

    .line 312
    .restart local v2    # "i":I
    invoke-interface {v6}, Ljava/lang/CharSequence;->length()I

    move-result v8

    invoke-interface {v7}, Ljava/lang/CharSequence;->length()I

    move-result v9

    invoke-static {v8, v9}, Ljava/lang/Math;->min(II)I

    move-result v4

    .restart local v4    # "n":I
    move v5, v4

    .end local v4    # "n":I
    .restart local v5    # "n":I
    move v3, v2

    .line 313
    .end local v2    # "i":I
    .restart local v3    # "i":I
    :goto_2
    add-int/lit8 v4, v5, -0x1

    .end local v5    # "n":I
    .restart local v4    # "n":I
    if-eqz v5, :cond_6

    .line 314
    invoke-interface {v6, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    .line 315
    .restart local v0    # "c1":C
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "i":I
    .restart local v2    # "i":I
    invoke-interface {v7, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    .line 316
    .restart local v1    # "c2":C
    if-eq v0, v1, :cond_5

    .line 317
    sub-int v8, v0, v1

    goto :goto_0

    :cond_5
    move v5, v4

    .end local v4    # "n":I
    .restart local v5    # "n":I
    move v3, v2

    .line 318
    .end local v2    # "i":I
    .restart local v3    # "i":I
    goto :goto_2

    .line 319
    .end local v0    # "c1":C
    .end local v1    # "c2":C
    .end local v5    # "n":I
    .restart local v4    # "n":I
    :cond_6
    invoke-interface {v6}, Ljava/lang/CharSequence;->length()I

    move-result v8

    invoke-interface {v7}, Ljava/lang/CharSequence;->length()I

    move-result v9

    sub-int/2addr v8, v9

    goto :goto_0
.end method

.method public hashCodeOf(Ljava/lang/Object;)I
    .locals 7
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 234
    if-nez p1, :cond_1

    .line 235
    const/4 v1, 0x0

    .line 244
    :cond_0
    :goto_0
    return v1

    .line 236
    :cond_1
    instance-of v5, p1, Ljava/lang/String;

    if-eqz v5, :cond_2

    .line 237
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    goto :goto_0

    :cond_2
    move-object v0, p1

    .line 238
    check-cast v0, Ljava/lang/CharSequence;

    .line 239
    .local v0, "chars":Ljava/lang/CharSequence;
    const/4 v1, 0x0

    .line 240
    .local v1, "h":I
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v4

    .line 241
    .local v4, "length":I
    const/4 v2, 0x0

    .local v2, "i":I
    move v3, v2

    .end local v2    # "i":I
    .local v3, "i":I
    :goto_1
    if-ge v3, v4, :cond_0

    .line 242
    mul-int/lit8 v5, v1, 0x1f

    add-int/lit8 v2, v3, 0x1

    .end local v3    # "i":I
    .restart local v2    # "i":I
    invoke-interface {v0, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v6

    add-int v1, v5, v6

    move v3, v2

    .end local v2    # "i":I
    .restart local v3    # "i":I
    goto :goto_1
.end method

.method public readResolve()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/ObjectStreamException;
        }
    .end annotation

    .prologue
    .line 327
    sget-object v0, Ljavolution/util/stripped/FastComparator$Lexical;->LEXICAL:Ljavolution/util/stripped/FastComparator;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 323
    const-string v0, "Lexical"

    return-object v0
.end method
