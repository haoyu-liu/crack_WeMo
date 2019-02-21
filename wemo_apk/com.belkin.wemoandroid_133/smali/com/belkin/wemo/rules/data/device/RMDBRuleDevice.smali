.class public Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
.super Ljava/lang/Object;
.source "RMDBRuleDevice.java"


# instance fields
.field protected final TAG:Ljava/lang/String;

.field protected dbUdn:Ljava/lang/String;

.field private endAction:I

.field private offModeOffset:I

.field private onModeOffset:I

.field private ruleDuration:I

.field private startAction:I

.field protected uiUdn:Ljava/lang/String;

.field private zbCapabilityEnd:Ljava/lang/String;

.field private zbCapabilityStart:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, -0x1

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->TAG:Ljava/lang/String;

    .line 37
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->zbCapabilityStart:Ljava/lang/String;

    .line 38
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->zbCapabilityEnd:Ljava/lang/String;

    .line 39
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->dbUdn:Ljava/lang/String;

    .line 40
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->uiUdn:Ljava/lang/String;

    .line 42
    iput v1, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->startAction:I

    .line 43
    iput v1, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->endAction:I

    .line 44
    iput v1, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->onModeOffset:I

    .line 45
    iput v1, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->offModeOffset:I

    .line 46
    return-void
.end method


# virtual methods
.method protected calculateDbUdn()V
    .locals 1

    .prologue
    .line 246
    iget-object v0, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->uiUdn:Ljava/lang/String;

    iput-object v0, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->dbUdn:Ljava/lang/String;

    .line 247
    return-void
.end method

.method protected calculateUiUdn()V
    .locals 1

    .prologue
    .line 250
    iget-object v0, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->dbUdn:Ljava/lang/String;

    iput-object v0, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->uiUdn:Ljava/lang/String;

    .line 251
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 308
    if-ne p0, p1, :cond_1

    .line 358
    :cond_0
    :goto_0
    return v1

    .line 311
    :cond_1
    if-nez p1, :cond_2

    move v1, v2

    .line 312
    goto :goto_0

    .line 314
    :cond_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    move v1, v2

    .line 315
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 317
    check-cast v0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;

    .line 318
    .local v0, "other":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    iget-object v3, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->dbUdn:Ljava/lang/String;

    if-nez v3, :cond_4

    .line 319
    iget-object v3, v0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->dbUdn:Ljava/lang/String;

    if-eqz v3, :cond_5

    move v1, v2

    .line 320
    goto :goto_0

    .line 322
    :cond_4
    iget-object v3, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->dbUdn:Ljava/lang/String;

    iget-object v4, v0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->dbUdn:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    move v1, v2

    .line 323
    goto :goto_0

    .line 325
    :cond_5
    iget v3, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->endAction:I

    iget v4, v0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->endAction:I

    if-eq v3, v4, :cond_6

    move v1, v2

    .line 326
    goto :goto_0

    .line 328
    :cond_6
    iget v3, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->offModeOffset:I

    iget v4, v0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->offModeOffset:I

    if-eq v3, v4, :cond_7

    move v1, v2

    .line 329
    goto :goto_0

    .line 331
    :cond_7
    iget v3, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->onModeOffset:I

    iget v4, v0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->onModeOffset:I

    if-eq v3, v4, :cond_8

    move v1, v2

    .line 332
    goto :goto_0

    .line 334
    :cond_8
    iget v3, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->startAction:I

    iget v4, v0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->startAction:I

    if-eq v3, v4, :cond_9

    move v1, v2

    .line 335
    goto :goto_0

    .line 337
    :cond_9
    iget-object v3, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->uiUdn:Ljava/lang/String;

    if-nez v3, :cond_a

    .line 338
    iget-object v3, v0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->uiUdn:Ljava/lang/String;

    if-eqz v3, :cond_b

    move v1, v2

    .line 339
    goto :goto_0

    .line 341
    :cond_a
    iget-object v3, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->uiUdn:Ljava/lang/String;

    iget-object v4, v0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->uiUdn:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_b

    move v1, v2

    .line 342
    goto :goto_0

    .line 344
    :cond_b
    iget-object v3, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->zbCapabilityEnd:Ljava/lang/String;

    if-nez v3, :cond_c

    .line 345
    iget-object v3, v0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->zbCapabilityEnd:Ljava/lang/String;

    if-eqz v3, :cond_d

    move v1, v2

    .line 346
    goto :goto_0

    .line 348
    :cond_c
    iget-object v3, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->zbCapabilityEnd:Ljava/lang/String;

    iget-object v4, v0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->zbCapabilityEnd:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_d

    move v1, v2

    .line 349
    goto :goto_0

    .line 351
    :cond_d
    iget-object v3, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->zbCapabilityStart:Ljava/lang/String;

    if-nez v3, :cond_e

    .line 352
    iget-object v3, v0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->zbCapabilityStart:Ljava/lang/String;

    if-eqz v3, :cond_0

    move v1, v2

    .line 353
    goto :goto_0

    .line 355
    :cond_e
    iget-object v3, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->zbCapabilityStart:Ljava/lang/String;

    iget-object v4, v0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->zbCapabilityStart:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    move v1, v2

    .line 356
    goto/16 :goto_0
.end method

.method protected extractZBCapabilityEnd(Ljava/lang/String;)V
    .locals 0
    .param p1, "zbCapabilityEnd"    # Ljava/lang/String;

    .prologue
    .line 84
    return-void
.end method

.method protected extractZBCapabilityStart(Ljava/lang/String;)V
    .locals 0
    .param p1, "zbCapabilityStart"    # Ljava/lang/String;

    .prologue
    .line 80
    return-void
.end method

.method public getEndAction()I
    .locals 1

    .prologue
    .line 257
    iget v0, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->endAction:I

    return v0
.end method

.method public getOffModeOffset()I
    .locals 1

    .prologue
    .line 271
    iget v0, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->offModeOffset:I

    return v0
.end method

.method public getOnModeOffset()I
    .locals 1

    .prologue
    .line 235
    iget v0, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->onModeOffset:I

    return v0
.end method

.method public getRuleDuration()I
    .locals 1

    .prologue
    .line 21
    iget v0, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->ruleDuration:I

    return v0
.end method

.method public getStartAction()I
    .locals 1

    .prologue
    .line 154
    iget v0, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->startAction:I

    return v0
.end method

.method public getUdn()Ljava/lang/String;
    .locals 1

    .prologue
    .line 124
    iget-object v0, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->dbUdn:Ljava/lang/String;

    return-object v0
.end method

.method public getUiUdn()Ljava/lang/String;
    .locals 1

    .prologue
    .line 139
    iget-object v0, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->uiUdn:Ljava/lang/String;

    return-object v0
.end method

.method public getZBCapabilityEndBrightnessStr()Ljava/lang/String;
    .locals 1

    .prologue
    .line 173
    const-string v0, ""

    return-object v0
.end method

.method public getZBCapabilityEndStateStr()Ljava/lang/String;
    .locals 1

    .prologue
    .line 165
    const-string v0, ""

    return-object v0
.end method

.method public getZBCapabilityStartBrightnessStr()Ljava/lang/String;
    .locals 1

    .prologue
    .line 177
    const-string v0, ""

    return-object v0
.end method

.method public getZBCapabilityStartStateStr()Ljava/lang/String;
    .locals 1

    .prologue
    .line 169
    const-string v0, ""

    return-object v0
.end method

.method public getZbCapabilityEnd()Ljava/lang/String;
    .locals 1

    .prologue
    .line 67
    iget-object v0, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->zbCapabilityEnd:Ljava/lang/String;

    return-object v0
.end method

.method public getZbCapabilityStart()Ljava/lang/String;
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->zbCapabilityStart:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 5

    .prologue
    const/4 v3, 0x0

    .line 286
    const/16 v0, 0x1f

    .line 287
    .local v0, "prime":I
    const/4 v1, 0x1

    .line 288
    .local v1, "result":I
    iget-object v2, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->dbUdn:Ljava/lang/String;

    if-nez v2, :cond_0

    move v2, v3

    :goto_0
    add-int/lit8 v1, v2, 0x1f

    .line 289
    mul-int/lit8 v2, v1, 0x1f

    iget v4, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->endAction:I

    add-int v1, v2, v4

    .line 290
    mul-int/lit8 v2, v1, 0x1f

    iget v4, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->offModeOffset:I

    add-int v1, v2, v4

    .line 291
    mul-int/lit8 v2, v1, 0x1f

    iget v4, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->onModeOffset:I

    add-int v1, v2, v4

    .line 292
    mul-int/lit8 v2, v1, 0x1f

    iget v4, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->startAction:I

    add-int v1, v2, v4

    .line 293
    mul-int/lit8 v4, v1, 0x1f

    iget-object v2, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->uiUdn:Ljava/lang/String;

    if-nez v2, :cond_1

    move v2, v3

    :goto_1
    add-int v1, v4, v2

    .line 294
    mul-int/lit8 v4, v1, 0x1f

    iget-object v2, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->zbCapabilityEnd:Ljava/lang/String;

    if-nez v2, :cond_2

    move v2, v3

    :goto_2
    add-int v1, v4, v2

    .line 296
    mul-int/lit8 v2, v1, 0x1f

    iget-object v4, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->zbCapabilityStart:Ljava/lang/String;

    if-nez v4, :cond_3

    :goto_3
    add-int v1, v2, v3

    .line 300
    return v1

    .line 288
    :cond_0
    iget-object v2, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->dbUdn:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    goto :goto_0

    .line 293
    :cond_1
    iget-object v2, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->uiUdn:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    goto :goto_1

    .line 294
    :cond_2
    iget-object v2, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->zbCapabilityEnd:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    goto :goto_2

    .line 296
    :cond_3
    iget-object v3, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->zbCapabilityStart:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    goto :goto_3
.end method

.method public setEndAction(I)V
    .locals 0
    .param p1, "endAction"    # I

    .prologue
    .line 264
    iput p1, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->endAction:I

    .line 265
    return-void
.end method

.method public setOffModeOffset(I)V
    .locals 0
    .param p1, "offModeOffset"    # I

    .prologue
    .line 278
    iput p1, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->offModeOffset:I

    .line 279
    return-void
.end method

.method public setOnModeOffset(I)V
    .locals 0
    .param p1, "onModeOffset"    # I

    .prologue
    .line 242
    iput p1, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->onModeOffset:I

    .line 243
    return-void
.end method

.method public setRuleDuration(I)V
    .locals 0
    .param p1, "ruleDuration"    # I

    .prologue
    .line 25
    iput p1, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->ruleDuration:I

    .line 26
    return-void
.end method

.method public setStartAction(I)V
    .locals 0
    .param p1, "startAction"    # I

    .prologue
    .line 161
    iput p1, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->startAction:I

    .line 162
    return-void
.end method

.method public setUdn(Ljava/lang/String;)V
    .locals 0
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 131
    iput-object p1, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->dbUdn:Ljava/lang/String;

    .line 132
    invoke-virtual {p0}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->calculateUiUdn()V

    .line 133
    return-void
.end method

.method public setUiUdn(Ljava/lang/String;)V
    .locals 0
    .param p1, "uiUdn"    # Ljava/lang/String;

    .prologue
    .line 146
    iput-object p1, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->uiUdn:Ljava/lang/String;

    .line 147
    invoke-virtual {p0}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->calculateDbUdn()V

    .line 148
    return-void
.end method

.method public setZbCapabilityEnd(Ljava/lang/String;)V
    .locals 0
    .param p1, "zbCapabilityEnd"    # Ljava/lang/String;

    .prologue
    .line 74
    iput-object p1, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->zbCapabilityEnd:Ljava/lang/String;

    .line 75
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->extractZBCapabilityStart(Ljava/lang/String;)V

    .line 76
    return-void
.end method

.method public setZbCapabilityStart(Ljava/lang/String;)V
    .locals 0
    .param p1, "zbCapabilityStart"    # Ljava/lang/String;

    .prologue
    .line 59
    iput-object p1, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->zbCapabilityStart:Ljava/lang/String;

    .line 60
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->extractZBCapabilityStart(Ljava/lang/String;)V

    .line 61
    return-void
.end method

.method public toJSON(Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .locals 2
    .param p1, "ruleDeviceJO"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 548
    const-string v0, "UDN"

    iget-object v1, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->uiUdn:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 549
    const-string v0, "START_ACTION"

    iget v1, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->startAction:I

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 550
    const-string v0, "END_ACTION"

    iget v1, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->endAction:I

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 552
    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 557
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "{DB_UDN: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->dbUdn:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", UI_UDN: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->uiUdn:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", START_ACTION: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->startAction:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", END_ACTION: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->endAction:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", ZB_CAB_START: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->zbCapabilityStart:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", ZB_CAP_END"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->zbCapabilityEnd:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
