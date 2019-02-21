.class public Lcom/belkin/wemo/cache/zigbee/ZigBeeCapabilities;
.super Ljava/lang/Object;
.source "ZigBeeCapabilities.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static capabilitiesToJSON(Ljava/lang/String;Ljava/lang/String;Ljava/util/LinkedHashMap;)Ljava/lang/String;
    .locals 15
    .param p0, "capabilities"    # Ljava/lang/String;
    .param p1, "values"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/LinkedHashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 32
    .local p2, "profileNameList":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v12, ","

    invoke-virtual {p0, v12}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 33
    .local v3, "capArr":[Ljava/lang/String;
    const-string v12, ","

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 34
    .local v4, "capValArr":[Ljava/lang/String;
    if-nez p2, :cond_0

    .line 35
    const-string v12, ""

    .line 59
    :goto_0
    return-object v12

    .line 36
    :cond_0
    new-instance v10, Lorg/json/JSONObject;

    invoke-direct {v10}, Lorg/json/JSONObject;-><init>()V

    .line 38
    .local v10, "result":Lorg/json/JSONObject;
    const/4 v6, 0x0

    .line 40
    .local v6, "i":I
    move-object v1, v3

    .local v1, "arr$":[Ljava/lang/String;
    :try_start_0
    array-length v8, v1

    .local v8, "len$":I
    const/4 v7, 0x0

    .local v7, "i$":I
    :goto_1
    if-ge v7, v8, :cond_4

    aget-object v2, v1, v7

    .line 41
    .local v2, "cap":Ljava/lang/String;
    array-length v12, v4

    if-le v12, v6, :cond_2

    aget-object v12, v4, v6

    if-eqz v12, :cond_2

    .line 42
    const-string v11, ""

    .line 43
    .local v11, "val":Ljava/lang/String;
    aget-object v12, v4, v6

    invoke-virtual {v12}, Ljava/lang/String;->isEmpty()Z

    move-result v12

    if-nez v12, :cond_1

    .line 44
    aget-object v11, v4, v6

    .line 46
    :cond_1
    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 48
    .local v9, "name":Ljava/lang/String;
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v12

    if-nez v12, :cond_3

    .line 49
    invoke-virtual {v10, v9, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 53
    .end local v9    # "name":Ljava/lang/String;
    .end local v11    # "val":Ljava/lang/String;
    :cond_2
    :goto_2
    add-int/lit8 v6, v6, 0x1

    .line 40
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 51
    .restart local v9    # "name":Ljava/lang/String;
    .restart local v11    # "val":Ljava/lang/String;
    :cond_3
    const-string v12, "ZigbeeScan"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "name empty for capability:"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 56
    .end local v2    # "cap":Ljava/lang/String;
    .end local v7    # "i$":I
    .end local v8    # "len$":I
    .end local v9    # "name":Ljava/lang/String;
    .end local v11    # "val":Ljava/lang/String;
    :catch_0
    move-exception v5

    .line 57
    .local v5, "e":Ljava/lang/Exception;
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V

    .line 59
    .end local v5    # "e":Ljava/lang/Exception;
    :cond_4
    invoke-virtual {v10}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v12

    goto :goto_0
.end method

.method public static getCapabilitiesValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p0, "capabilities"    # Ljava/lang/String;
    .param p1, "values"    # Ljava/lang/String;
    .param p2, "keyCapability"    # Ljava/lang/String;

    .prologue
    .line 14
    const-string v7, ","

    invoke-virtual {p0, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 15
    .local v2, "capArr":[Ljava/lang/String;
    const-string v7, ","

    invoke-virtual {p1, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 16
    .local v3, "capValArr":[Ljava/lang/String;
    const/4 v4, 0x0

    .line 18
    .local v4, "i":I
    move-object v0, v2

    .local v0, "arr$":[Ljava/lang/String;
    array-length v6, v0

    .local v6, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    :goto_0
    if-ge v5, v6, :cond_2

    aget-object v1, v0, v5

    .line 19
    .local v1, "cap":Ljava/lang/String;
    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 20
    array-length v7, v3

    if-le v7, v4, :cond_1

    aget-object v7, v3, v4

    if-eqz v7, :cond_1

    .line 21
    aget-object v7, v3, v4

    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_0

    const-string v7, "0"

    .line 28
    .end local v1    # "cap":Ljava/lang/String;
    :goto_1
    return-object v7

    .line 22
    .restart local v1    # "cap":Ljava/lang/String;
    :cond_0
    aget-object v7, v3, v4

    goto :goto_1

    .line 25
    :cond_1
    add-int/lit8 v4, v4, 0x1

    .line 18
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 28
    .end local v1    # "cap":Ljava/lang/String;
    :cond_2
    const-string v7, "0"

    goto :goto_1
.end method
