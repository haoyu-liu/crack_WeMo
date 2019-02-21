.class public Lcom/belkin/rules/parser/ResponseParser;
.super Ljava/lang/Object;
.source "ResponseParser.java"


# instance fields
.field RuleId:I

.field context:Landroid/content/Context;

.field days:[I

.field daysCount:I

.field deviceData:Lcom/belkin/rules/data/RuleDeviceData;

.field rulesData:Lcom/belkin/rules/data/RulesData;

.field rulesDeviceTable:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/belkin/rules/data/RuleDeviceData;",
            ">;"
        }
    .end annotation
.end field

.field rulesTable:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/belkin/rules/data/RulesData;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    new-instance v0, Lcom/belkin/rules/data/RulesData;

    invoke-direct {v0}, Lcom/belkin/rules/data/RulesData;-><init>()V

    iput-object v0, p0, Lcom/belkin/rules/parser/ResponseParser;->rulesData:Lcom/belkin/rules/data/RulesData;

    .line 53
    new-instance v0, Lcom/belkin/rules/data/RuleDeviceData;

    invoke-direct {v0}, Lcom/belkin/rules/data/RuleDeviceData;-><init>()V

    iput-object v0, p0, Lcom/belkin/rules/parser/ResponseParser;->deviceData:Lcom/belkin/rules/data/RuleDeviceData;

    .line 56
    iput-object p1, p0, Lcom/belkin/rules/parser/ResponseParser;->context:Landroid/content/Context;

    .line 58
    return-void
.end method

.method private Reset()V
    .locals 1

    .prologue
    .line 67
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/belkin/rules/parser/ResponseParser;->rulesTable:Ljava/util/ArrayList;

    .line 68
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/belkin/rules/parser/ResponseParser;->rulesDeviceTable:Ljava/util/ArrayList;

    .line 69
    return-void
.end method

.method private addDeviceTable()V
    .locals 5

    .prologue
    const/4 v4, -0x1

    .line 219
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/belkin/rules/parser/ResponseParser;->rulesDeviceTable:Ljava/util/ArrayList;

    .line 222
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/belkin/rules/parser/ResponseParser;->days:[I

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 224
    new-instance v1, Lcom/belkin/rules/data/RuleDeviceData;

    invoke-direct {v1}, Lcom/belkin/rules/data/RuleDeviceData;-><init>()V

    iput-object v1, p0, Lcom/belkin/rules/parser/ResponseParser;->deviceData:Lcom/belkin/rules/data/RuleDeviceData;

    .line 225
    iget-object v1, p0, Lcom/belkin/rules/parser/ResponseParser;->deviceData:Lcom/belkin/rules/data/RuleDeviceData;

    iget-object v2, p0, Lcom/belkin/rules/parser/ResponseParser;->days:[I

    aget v2, v2, v0

    invoke-virtual {v1, v2}, Lcom/belkin/rules/data/RuleDeviceData;->setDayId(I)V

    .line 226
    iget-object v1, p0, Lcom/belkin/rules/parser/ResponseParser;->deviceData:Lcom/belkin/rules/data/RuleDeviceData;

    iget-object v2, p0, Lcom/belkin/rules/parser/ResponseParser;->rulesData:Lcom/belkin/rules/data/RulesData;

    invoke-virtual {v2}, Lcom/belkin/rules/data/RulesData;->getStartAction()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/belkin/rules/data/RuleDeviceData;->setStartAction(I)V

    .line 227
    iget-object v1, p0, Lcom/belkin/rules/parser/ResponseParser;->deviceData:Lcom/belkin/rules/data/RuleDeviceData;

    iget-object v2, p0, Lcom/belkin/rules/parser/ResponseParser;->rulesData:Lcom/belkin/rules/data/RulesData;

    invoke-virtual {v2}, Lcom/belkin/rules/data/RulesData;->getEndAction()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/belkin/rules/data/RuleDeviceData;->setEndAction(I)V

    .line 228
    iget-object v1, p0, Lcom/belkin/rules/parser/ResponseParser;->deviceData:Lcom/belkin/rules/data/RuleDeviceData;

    iget-object v2, p0, Lcom/belkin/rules/parser/ResponseParser;->rulesData:Lcom/belkin/rules/data/RulesData;

    invoke-virtual {v2}, Lcom/belkin/rules/data/RulesData;->getUuid()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/belkin/rules/data/RuleDeviceData;->setUuid(Ljava/lang/String;)V

    .line 229
    iget-object v1, p0, Lcom/belkin/rules/parser/ResponseParser;->deviceData:Lcom/belkin/rules/data/RuleDeviceData;

    iget-object v2, p0, Lcom/belkin/rules/parser/ResponseParser;->rulesData:Lcom/belkin/rules/data/RulesData;

    invoke-virtual {v2}, Lcom/belkin/rules/data/RulesData;->getRuleId()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/belkin/rules/data/RuleDeviceData;->setRuleId(I)V

    .line 230
    iget-object v1, p0, Lcom/belkin/rules/parser/ResponseParser;->deviceData:Lcom/belkin/rules/data/RuleDeviceData;

    iget-object v2, p0, Lcom/belkin/rules/parser/ResponseParser;->rulesData:Lcom/belkin/rules/data/RulesData;

    invoke-virtual {v2}, Lcom/belkin/rules/data/RulesData;->getStartTime()D

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/belkin/rules/data/RuleDeviceData;->setStartTime(D)V

    .line 231
    iget-object v1, p0, Lcom/belkin/rules/parser/ResponseParser;->deviceData:Lcom/belkin/rules/data/RuleDeviceData;

    iget-object v2, p0, Lcom/belkin/rules/parser/ResponseParser;->rulesData:Lcom/belkin/rules/data/RulesData;

    invoke-virtual {v2}, Lcom/belkin/rules/data/RulesData;->getEndTime()D

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/belkin/rules/data/RuleDeviceData;->setEndTime(D)V

    .line 232
    iget-object v1, p0, Lcom/belkin/rules/parser/ResponseParser;->deviceData:Lcom/belkin/rules/data/RuleDeviceData;

    iget-object v2, p0, Lcom/belkin/rules/parser/ResponseParser;->rulesData:Lcom/belkin/rules/data/RulesData;

    invoke-virtual {v2}, Lcom/belkin/rules/data/RulesData;->getRuleDuration()D

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/belkin/rules/data/RuleDeviceData;->setRuleDuration(D)V

    .line 233
    iget-object v1, p0, Lcom/belkin/rules/parser/ResponseParser;->deviceData:Lcom/belkin/rules/data/RuleDeviceData;

    const-string v2, "-1"

    invoke-virtual {v1, v2}, Lcom/belkin/rules/data/RuleDeviceData;->setType(Ljava/lang/String;)V

    .line 234
    iget-object v1, p0, Lcom/belkin/rules/parser/ResponseParser;->deviceData:Lcom/belkin/rules/data/RuleDeviceData;

    invoke-virtual {v1, v4}, Lcom/belkin/rules/data/RuleDeviceData;->setValue(I)V

    .line 235
    iget-object v1, p0, Lcom/belkin/rules/parser/ResponseParser;->deviceData:Lcom/belkin/rules/data/RuleDeviceData;

    invoke-virtual {v1, v4}, Lcom/belkin/rules/data/RuleDeviceData;->setLevel(I)V

    .line 236
    iget-object v1, p0, Lcom/belkin/rules/parser/ResponseParser;->deviceData:Lcom/belkin/rules/data/RuleDeviceData;

    const-string v2, "0"

    invoke-virtual {v1, v2}, Lcom/belkin/rules/data/RuleDeviceData;->setGroupId(Ljava/lang/String;)V

    .line 238
    iget-object v1, p0, Lcom/belkin/rules/parser/ResponseParser;->rulesDeviceTable:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/belkin/rules/parser/ResponseParser;->deviceData:Lcom/belkin/rules/data/RuleDeviceData;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 222
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_0

    .line 243
    :cond_0
    return-void
.end method

.method private setSelectedDays(Ljava/lang/String;)V
    .locals 4
    .param p1, "selectedDays"    # Ljava/lang/String;

    .prologue
    .line 161
    const-string v2, "-"

    invoke-virtual {p1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 162
    .local v1, "mDays":[Ljava/lang/String;
    array-length v2, v1

    iput v2, p0, Lcom/belkin/rules/parser/ResponseParser;->daysCount:I

    .line 163
    iget v2, p0, Lcom/belkin/rules/parser/ResponseParser;->daysCount:I

    new-array v2, v2, [I

    iput-object v2, p0, Lcom/belkin/rules/parser/ResponseParser;->days:[I

    .line 166
    const/4 v0, 0x0

    .local v0, "count":I
    :goto_0
    array-length v2, v1

    if-ge v0, v2, :cond_7

    .line 169
    const-string v2, "days::"

    aget-object v3, v1, v0

    invoke-static {v2, v3}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 171
    aget-object v2, v1, v0

    sget-object v3, Lcom/belkin/rules/utils/RulesConstants;->MON:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 173
    iget-object v2, p0, Lcom/belkin/rules/parser/ResponseParser;->rulesData:Lcom/belkin/rules/data/RulesData;

    aget-object v3, v1, v0

    invoke-virtual {v2, v3}, Lcom/belkin/rules/data/RulesData;->setMon(Ljava/lang/String;)V

    .line 174
    iget-object v2, p0, Lcom/belkin/rules/parser/ResponseParser;->days:[I

    const/4 v3, 0x2

    aput v3, v2, v0

    .line 166
    :cond_0
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 176
    :cond_1
    aget-object v2, v1, v0

    sget-object v3, Lcom/belkin/rules/utils/RulesConstants;->TUE:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 178
    iget-object v2, p0, Lcom/belkin/rules/parser/ResponseParser;->rulesData:Lcom/belkin/rules/data/RulesData;

    aget-object v3, v1, v0

    invoke-virtual {v2, v3}, Lcom/belkin/rules/data/RulesData;->setTue(Ljava/lang/String;)V

    .line 179
    iget-object v2, p0, Lcom/belkin/rules/parser/ResponseParser;->days:[I

    const/4 v3, 0x3

    aput v3, v2, v0

    goto :goto_1

    .line 181
    :cond_2
    aget-object v2, v1, v0

    sget-object v3, Lcom/belkin/rules/utils/RulesConstants;->WED:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 183
    iget-object v2, p0, Lcom/belkin/rules/parser/ResponseParser;->rulesData:Lcom/belkin/rules/data/RulesData;

    aget-object v3, v1, v0

    invoke-virtual {v2, v3}, Lcom/belkin/rules/data/RulesData;->setWed(Ljava/lang/String;)V

    .line 184
    iget-object v2, p0, Lcom/belkin/rules/parser/ResponseParser;->days:[I

    const/4 v3, 0x4

    aput v3, v2, v0

    goto :goto_1

    .line 186
    :cond_3
    aget-object v2, v1, v0

    sget-object v3, Lcom/belkin/rules/utils/RulesConstants;->THRU:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 188
    iget-object v2, p0, Lcom/belkin/rules/parser/ResponseParser;->rulesData:Lcom/belkin/rules/data/RulesData;

    aget-object v3, v1, v0

    invoke-virtual {v2, v3}, Lcom/belkin/rules/data/RulesData;->setThru(Ljava/lang/String;)V

    .line 189
    iget-object v2, p0, Lcom/belkin/rules/parser/ResponseParser;->days:[I

    const/4 v3, 0x5

    aput v3, v2, v0

    goto :goto_1

    .line 191
    :cond_4
    aget-object v2, v1, v0

    sget-object v3, Lcom/belkin/rules/utils/RulesConstants;->FRI:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 193
    iget-object v2, p0, Lcom/belkin/rules/parser/ResponseParser;->rulesData:Lcom/belkin/rules/data/RulesData;

    aget-object v3, v1, v0

    invoke-virtual {v2, v3}, Lcom/belkin/rules/data/RulesData;->setFri(Ljava/lang/String;)V

    .line 194
    iget-object v2, p0, Lcom/belkin/rules/parser/ResponseParser;->days:[I

    const/4 v3, 0x6

    aput v3, v2, v0

    goto :goto_1

    .line 196
    :cond_5
    aget-object v2, v1, v0

    sget-object v3, Lcom/belkin/rules/utils/RulesConstants;->SAT:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 198
    iget-object v2, p0, Lcom/belkin/rules/parser/ResponseParser;->rulesData:Lcom/belkin/rules/data/RulesData;

    aget-object v3, v1, v0

    invoke-virtual {v2, v3}, Lcom/belkin/rules/data/RulesData;->setSat(Ljava/lang/String;)V

    .line 199
    iget-object v2, p0, Lcom/belkin/rules/parser/ResponseParser;->days:[I

    const/4 v3, 0x7

    aput v3, v2, v0

    goto :goto_1

    .line 201
    :cond_6
    aget-object v2, v1, v0

    sget-object v3, Lcom/belkin/rules/utils/RulesConstants;->SUN:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 203
    iget-object v2, p0, Lcom/belkin/rules/parser/ResponseParser;->rulesData:Lcom/belkin/rules/data/RulesData;

    aget-object v3, v1, v0

    invoke-virtual {v2, v3}, Lcom/belkin/rules/data/RulesData;->setSun(Ljava/lang/String;)V

    .line 204
    iget-object v2, p0, Lcom/belkin/rules/parser/ResponseParser;->days:[I

    const/4 v3, 0x1

    aput v3, v2, v0

    goto/16 :goto_1

    .line 209
    :cond_7
    return-void
.end method


# virtual methods
.method public ParseJson(Lorg/json/JSONArray;)Z
    .locals 14
    .param p1, "inArray"    # Lorg/json/JSONArray;

    .prologue
    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 83
    :try_start_0
    invoke-direct {p0}, Lcom/belkin/rules/parser/ResponseParser;->Reset()V

    .line 86
    if-eqz p1, :cond_3

    .line 89
    const-string v10, "Json array"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "inArray"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    const/4 v6, 0x0

    .local v6, "startAction":I
    const/4 v0, 0x0

    .line 92
    .local v0, "endAction":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v10

    if-ge v1, v10, :cond_2

    .line 94
    const/4 v10, 0x1

    invoke-virtual {p1, v10}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    .line 95
    .local v5, "rulesObj":Lorg/json/JSONObject;
    iget-object v10, p0, Lcom/belkin/rules/parser/ResponseParser;->rulesData:Lcom/belkin/rules/data/RulesData;

    sget-object v11, Lcom/belkin/rules/utils/RulesConstants;->STATE:Ljava/lang/String;

    invoke-virtual {v5, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v11

    invoke-virtual {v10, v11}, Lcom/belkin/rules/data/RulesData;->setState(I)V

    .line 96
    iget-object v10, p0, Lcom/belkin/rules/parser/ResponseParser;->rulesData:Lcom/belkin/rules/data/RulesData;

    sget-object v11, Lcom/belkin/rules/utils/RulesConstants;->RULE_TYPE:Ljava/lang/String;

    invoke-virtual {v5, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Lcom/belkin/rules/data/RulesData;->setRuleType(Ljava/lang/String;)V

    .line 97
    iget-object v10, p0, Lcom/belkin/rules/parser/ResponseParser;->rulesData:Lcom/belkin/rules/data/RulesData;

    sget-object v11, Lcom/belkin/rules/utils/RulesConstants;->RULE_NAME:Ljava/lang/String;

    invoke-virtual {v5, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Lcom/belkin/rules/data/RulesData;->setRuleName(Ljava/lang/String;)V

    .line 98
    sget-object v10, Lcom/belkin/rules/utils/RulesConstants;->SELECTED_RANGE:Ljava/lang/String;

    invoke-virtual {v5, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {p0, v10}, Lcom/belkin/rules/parser/ResponseParser;->setSelectedDays(Ljava/lang/String;)V

    .line 100
    sget-object v10, Lcom/belkin/rules/utils/RulesConstants;->DEVICES:Ljava/lang/String;

    invoke-virtual {v5, v10}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .line 101
    .local v3, "obj":Lorg/json/JSONObject;
    iget-object v10, p0, Lcom/belkin/rules/parser/ResponseParser;->rulesData:Lcom/belkin/rules/data/RulesData;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, ""

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v3}, Lorg/json/JSONObject;->names()Lorg/json/JSONArray;

    move-result-object v12

    const/4 v13, 0x0

    invoke-virtual {v12, v13}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Lcom/belkin/rules/data/RulesData;->setUuid(Ljava/lang/String;)V

    .line 102
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, ""

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v3}, Lorg/json/JSONObject;->names()Lorg/json/JSONArray;

    move-result-object v11

    const/4 v12, 0x0

    invoke-virtual {v11, v12}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v3, v10}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    .line 104
    .local v4, "rulesDataObj":Lorg/json/JSONObject;
    iget-object v10, p0, Lcom/belkin/rules/parser/ResponseParser;->rulesData:Lcom/belkin/rules/data/RulesData;

    sget-object v11, Lcom/belkin/rules/utils/RulesConstants;->FNAME:Ljava/lang/String;

    invoke-virtual {v4, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Lcom/belkin/rules/data/RulesData;->setFName(Ljava/lang/String;)V

    .line 105
    const-string v10, "Json Parser"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "fname"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget-object v12, p0, Lcom/belkin/rules/parser/ResponseParser;->rulesData:Lcom/belkin/rules/data/RulesData;

    invoke-virtual {v12}, Lcom/belkin/rules/data/RulesData;->getFName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 106
    sget-object v10, Lcom/belkin/rules/utils/RulesConstants;->SENSOR_DURATION:Ljava/lang/String;

    sget-object v11, Lcom/belkin/rules/utils/RulesConstants;->SENSOR_DURATION:Ljava/lang/String;

    invoke-virtual {v4, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    sget-object v10, Lcom/belkin/rules/utils/RulesConstants;->START_ACTION:Ljava/lang/String;

    invoke-virtual {v4, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    .line 108
    iget-object v10, p0, Lcom/belkin/rules/parser/ResponseParser;->rulesData:Lcom/belkin/rules/data/RulesData;

    invoke-virtual {v10, v6}, Lcom/belkin/rules/data/RulesData;->setStartAction(I)V

    .line 109
    sget-object v10, Lcom/belkin/rules/utils/RulesConstants;->SELECTED_LED_VALUE:Ljava/lang/String;

    sget-object v11, Lcom/belkin/rules/utils/RulesConstants;->SELECTED_LED_VALUE:Ljava/lang/String;

    invoke-virtual {v4, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    sget-object v10, Lcom/belkin/rules/utils/RulesConstants;->END_ACTION:Ljava/lang/String;

    invoke-virtual {v4, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 111
    iget-object v10, p0, Lcom/belkin/rules/parser/ResponseParser;->rulesData:Lcom/belkin/rules/data/RulesData;

    invoke-virtual {v10, v0}, Lcom/belkin/rules/data/RulesData;->setEndAction(I)V

    .line 113
    sget-object v10, Lcom/belkin/rules/utils/RulesConstants;->WHEN:Ljava/lang/String;

    invoke-virtual {v5, v10}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 116
    sget-object v10, Lcom/belkin/rules/utils/RulesConstants;->WHEN:Ljava/lang/String;

    invoke-virtual {v5, v10}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    .line 118
    .local v7, "whenObj":Lorg/json/JSONObject;
    sget-object v10, Lcom/belkin/rules/utils/RulesConstants;->RULE_DURATION:Ljava/lang/String;

    sget-object v11, Lcom/belkin/rules/utils/RulesConstants;->RULE_DURATION:Ljava/lang/String;

    invoke-virtual {v7, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    iget-object v10, p0, Lcom/belkin/rules/parser/ResponseParser;->rulesData:Lcom/belkin/rules/data/RulesData;

    sget-object v11, Lcom/belkin/rules/utils/RulesConstants;->RULE_DURATION:Ljava/lang/String;

    invoke-virtual {v7, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v12

    invoke-virtual {v10, v12, v13}, Lcom/belkin/rules/data/RulesData;->setRuleDuration(D)V

    .line 121
    if-eq v6, v0, :cond_1

    .line 122
    iget-object v10, p0, Lcom/belkin/rules/parser/ResponseParser;->rulesData:Lcom/belkin/rules/data/RulesData;

    sget-object v11, Lcom/belkin/rules/utils/RulesConstants;->ENDTIME:Ljava/lang/String;

    invoke-virtual {v7, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v12

    invoke-virtual {v10, v12, v13}, Lcom/belkin/rules/data/RulesData;->setEndTime(D)V

    .line 127
    :goto_1
    iget-object v10, p0, Lcom/belkin/rules/parser/ResponseParser;->rulesData:Lcom/belkin/rules/data/RulesData;

    sget-object v11, Lcom/belkin/rules/utils/RulesConstants;->START_TIME:Ljava/lang/String;

    invoke-virtual {v7, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v12

    invoke-virtual {v10, v12, v13}, Lcom/belkin/rules/data/RulesData;->setStartTime(D)V

    .line 92
    .end local v7    # "whenObj":Lorg/json/JSONObject;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    .line 124
    .restart local v7    # "whenObj":Lorg/json/JSONObject;
    :cond_1
    iget-object v10, p0, Lcom/belkin/rules/parser/ResponseParser;->rulesData:Lcom/belkin/rules/data/RulesData;

    const-wide/16 v12, 0x0

    invoke-virtual {v10, v12, v13}, Lcom/belkin/rules/data/RulesData;->setEndTime(D)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 144
    .end local v0    # "endAction":I
    .end local v1    # "i":I
    .end local v3    # "obj":Lorg/json/JSONObject;
    .end local v4    # "rulesDataObj":Lorg/json/JSONObject;
    .end local v5    # "rulesObj":Lorg/json/JSONObject;
    .end local v6    # "startAction":I
    .end local v7    # "whenObj":Lorg/json/JSONObject;
    :catch_0
    move-exception v2

    .line 146
    .local v2, "jse":Lorg/json/JSONException;
    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    move v8, v9

    .line 147
    .end local v2    # "jse":Lorg/json/JSONException;
    :goto_2
    return v8

    .line 132
    .restart local v0    # "endAction":I
    .restart local v1    # "i":I
    .restart local v6    # "startAction":I
    :cond_2
    :try_start_1
    iget-object v10, p0, Lcom/belkin/rules/parser/ResponseParser;->rulesData:Lcom/belkin/rules/data/RulesData;

    iget v11, p0, Lcom/belkin/rules/parser/ResponseParser;->RuleId:I

    invoke-virtual {v10, v11}, Lcom/belkin/rules/data/RulesData;->setRuleId(I)V

    .line 133
    iget-object v10, p0, Lcom/belkin/rules/parser/ResponseParser;->rulesTable:Ljava/util/ArrayList;

    iget-object v11, p0, Lcom/belkin/rules/parser/ResponseParser;->rulesData:Lcom/belkin/rules/data/RulesData;

    invoke-virtual {v10, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 134
    invoke-direct {p0}, Lcom/belkin/rules/parser/ResponseParser;->addDeviceTable()V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    .end local v0    # "endAction":I
    .end local v1    # "i":I
    .end local v6    # "startAction":I
    :cond_3
    move v8, v9

    .line 140
    goto :goto_2
.end method

.method public getRulesData()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/belkin/rules/data/RulesData;",
            ">;"
        }
    .end annotation

    .prologue
    .line 265
    iget-object v0, p0, Lcom/belkin/rules/parser/ResponseParser;->rulesTable:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/belkin/rules/parser/ResponseParser;->rulesTable:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 266
    iget-object v0, p0, Lcom/belkin/rules/parser/ResponseParser;->rulesTable:Ljava/util/ArrayList;

    .line 268
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getRulesDeviceData()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/belkin/rules/data/RuleDeviceData;",
            ">;"
        }
    .end annotation

    .prologue
    .line 251
    iget-object v0, p0, Lcom/belkin/rules/parser/ResponseParser;->rulesDeviceTable:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/belkin/rules/parser/ResponseParser;->rulesDeviceTable:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 252
    iget-object v0, p0, Lcom/belkin/rules/parser/ResponseParser;->rulesDeviceTable:Ljava/util/ArrayList;

    .line 254
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getUDN()Ljava/lang/String;
    .locals 1

    .prologue
    .line 288
    iget-object v0, p0, Lcom/belkin/rules/parser/ResponseParser;->rulesData:Lcom/belkin/rules/data/RulesData;

    invoke-virtual {v0}, Lcom/belkin/rules/data/RulesData;->getUuid()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setNewRuleId(I)V
    .locals 0
    .param p1, "RuleId"    # I

    .prologue
    .line 279
    iput p1, p0, Lcom/belkin/rules/parser/ResponseParser;->RuleId:I

    .line 280
    return-void
.end method
