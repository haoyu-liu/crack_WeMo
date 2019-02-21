.class public Lcom/belkin/widgets/WidgetData;
.super Ljava/lang/Object;
.source "WidgetData.java"


# static fields
.field private static final GROUP_KEY:Ljava/lang/String; = "isGroup"

.field private static final ID_KEY:Ljava/lang/String; = "id"

.field private static final LIGHT_LEVEL_KEY:Ljava/lang/String; = "lightLevel"

.field private static final NAME_KEY:Ljava/lang/String; = "name"

.field private static final STATE_KEY:Ljava/lang/String; = "state"

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private data:Lorg/json/JSONObject;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 12
    const-class v0, Lcom/belkin/widgets/WidgetData;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/widgets/WidgetData;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/belkin/wemo/cache/data/DeviceInformation;)V
    .locals 4
    .param p1, "info"    # Lcom/belkin/wemo/cache/data/DeviceInformation;

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    iput-object v3, p0, Lcom/belkin/widgets/WidgetData;->data:Lorg/json/JSONObject;

    .line 25
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getGroupID()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 26
    const/4 v1, 0x0

    .line 27
    .local v1, "isGroup":Z
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFriendlyName()Ljava/lang/String;

    move-result-object v2

    .line 28
    .local v2, "name":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v0

    .line 34
    .local v0, "id":Ljava/lang/String;
    :goto_0
    invoke-virtual {p0, v2}, Lcom/belkin/widgets/WidgetData;->setName(Ljava/lang/String;)Z

    .line 35
    invoke-virtual {p0, v0}, Lcom/belkin/widgets/WidgetData;->setId(Ljava/lang/String;)Z

    .line 36
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getState()I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/belkin/widgets/WidgetData;->setState(I)Z

    .line 37
    invoke-virtual {p0, v1}, Lcom/belkin/widgets/WidgetData;->setIsGroup(Z)Z

    .line 38
    invoke-static {p1}, Lcom/belkin/widgets/WidgetData;->getLightLevelPercentage(Lcom/belkin/wemo/cache/data/DeviceInformation;)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/belkin/widgets/WidgetData;->setLightLevel(I)Z

    .line 39
    return-void

    .line 30
    .end local v0    # "id":Ljava/lang/String;
    .end local v1    # "isGroup":Z
    .end local v2    # "name":Ljava/lang/String;
    :cond_0
    const/4 v1, 0x1

    .line 31
    .restart local v1    # "isGroup":Z
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getGroupName()Ljava/lang/String;

    move-result-object v2

    .line 32
    .restart local v2    # "name":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getGroupID()Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "id":Ljava/lang/String;
    goto :goto_0
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 3
    .param p1, "jsonStr"    # Ljava/lang/String;

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/belkin/widgets/WidgetData;->data:Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    :goto_0
    return-void

    .line 44
    :catch_0
    move-exception v0

    .line 45
    .local v0, "e":Lorg/json/JSONException;
    sget-object v1, Lcom/belkin/widgets/WidgetData;->TAG:Ljava/lang/String;

    const-string v2, "JSONException while building WidgetData: "

    invoke-static {v1, v2, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private static getLightLevelPercentage(Lcom/belkin/wemo/cache/data/DeviceInformation;)I
    .locals 7
    .param p0, "info"    # Lcom/belkin/wemo/cache/data/DeviceInformation;

    .prologue
    .line 130
    if-eqz p0, :cond_1

    .line 132
    :try_start_0
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/belkin/wemo/cache/utils/IsDevice;->Dimmer(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 133
    const-string v5, "brightness"

    invoke-virtual {p0, v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getAttributeValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 134
    .local v1, "dimmerBrightness":Ljava/lang/String;
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    .line 150
    .end local v1    # "dimmerBrightness":Ljava/lang/String;
    :goto_0
    return v5

    .line 136
    :cond_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-virtual {p0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getCapabilities()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v5}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 137
    .local v0, "capabilitiesJson":Lorg/json/JSONObject;
    if-eqz v0, :cond_1

    const-string v5, "levelControl"

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 138
    const-string v5, "levelControl"

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 139
    .local v4, "levelControl":[Ljava/lang/String;
    array-length v5, v4

    if-lez v5, :cond_1

    const/4 v5, 0x0

    aget-object v5, v4, v5

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 141
    const/4 v5, 0x0

    aget-object v5, v4, v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 142
    .local v3, "level":I
    mul-int/lit8 v5, v3, 0x64

    div-int/lit16 v5, v5, 0xff
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 146
    .end local v0    # "capabilitiesJson":Lorg/json/JSONObject;
    .end local v3    # "level":I
    .end local v4    # "levelControl":[Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 147
    .local v2, "e":Lorg/json/JSONException;
    sget-object v5, Lcom/belkin/widgets/WidgetData;->TAG:Ljava/lang/String;

    const-string v6, "Unable to parse device capabilities string"

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 150
    .end local v2    # "e":Lorg/json/JSONException;
    :cond_1
    const/4 v5, -0x1

    goto :goto_0
.end method


# virtual methods
.method public getId()Ljava/lang/String;
    .locals 2

    .prologue
    .line 113
    iget-object v0, p0, Lcom/belkin/widgets/WidgetData;->data:Lorg/json/JSONObject;

    const-string v1, "id"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLightLevel()I
    .locals 3

    .prologue
    .line 121
    iget-object v0, p0, Lcom/belkin/widgets/WidgetData;->data:Lorg/json/JSONObject;

    const-string v1, "lightLevel"

    const/4 v2, -0x1

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 105
    iget-object v0, p0, Lcom/belkin/widgets/WidgetData;->data:Lorg/json/JSONObject;

    const-string v1, "name"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getState()I
    .locals 3

    .prologue
    .line 117
    iget-object v0, p0, Lcom/belkin/widgets/WidgetData;->data:Lorg/json/JSONObject;

    const-string v1, "state"

    const/4 v2, -0x1

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public isGroup()Z
    .locals 2

    .prologue
    .line 109
    iget-object v0, p0, Lcom/belkin/widgets/WidgetData;->data:Lorg/json/JSONObject;

    const-string v1, "isGroup"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public setId(Ljava/lang/String;)Z
    .locals 4
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 61
    const/4 v1, 0x1

    .line 63
    .local v1, "success":Z
    :try_start_0
    iget-object v2, p0, Lcom/belkin/widgets/WidgetData;->data:Lorg/json/JSONObject;

    const-string v3, "id"

    invoke-virtual {v2, v3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 68
    :goto_0
    return v1

    .line 64
    :catch_0
    move-exception v0

    .line 65
    .local v0, "e":Lorg/json/JSONException;
    sget-object v2, Lcom/belkin/widgets/WidgetData;->TAG:Ljava/lang/String;

    const-string v3, "JSONException while building WidgetData: "

    invoke-static {v2, v3, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 66
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public setIsGroup(Z)Z
    .locals 4
    .param p1, "isGroup"    # Z

    .prologue
    .line 83
    const/4 v1, 0x1

    .line 85
    .local v1, "success":Z
    :try_start_0
    iget-object v2, p0, Lcom/belkin/widgets/WidgetData;->data:Lorg/json/JSONObject;

    const-string v3, "isGroup"

    invoke-virtual {v2, v3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 90
    :goto_0
    return v1

    .line 86
    :catch_0
    move-exception v0

    .line 87
    .local v0, "e":Lorg/json/JSONException;
    sget-object v2, Lcom/belkin/widgets/WidgetData;->TAG:Ljava/lang/String;

    const-string v3, "JSONException while building WidgetData: "

    invoke-static {v2, v3, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 88
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public setLightLevel(I)Z
    .locals 4
    .param p1, "lightLevel"    # I

    .prologue
    .line 94
    const/4 v1, 0x1

    .line 96
    .local v1, "success":Z
    :try_start_0
    iget-object v2, p0, Lcom/belkin/widgets/WidgetData;->data:Lorg/json/JSONObject;

    const-string v3, "lightLevel"

    invoke-virtual {v2, v3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 101
    :goto_0
    return v1

    .line 97
    :catch_0
    move-exception v0

    .line 98
    .local v0, "e":Lorg/json/JSONException;
    sget-object v2, Lcom/belkin/widgets/WidgetData;->TAG:Ljava/lang/String;

    const-string v3, "JSONException while building WidgetData: "

    invoke-static {v2, v3, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 99
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public setName(Ljava/lang/String;)Z
    .locals 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 50
    const/4 v1, 0x1

    .line 52
    .local v1, "success":Z
    :try_start_0
    iget-object v2, p0, Lcom/belkin/widgets/WidgetData;->data:Lorg/json/JSONObject;

    const-string v3, "name"

    invoke-virtual {v2, v3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 57
    :goto_0
    return v1

    .line 53
    :catch_0
    move-exception v0

    .line 54
    .local v0, "e":Lorg/json/JSONException;
    sget-object v2, Lcom/belkin/widgets/WidgetData;->TAG:Ljava/lang/String;

    const-string v3, "JSONException while building WidgetData: "

    invoke-static {v2, v3, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 55
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public setState(I)Z
    .locals 4
    .param p1, "state"    # I

    .prologue
    .line 72
    const/4 v1, 0x1

    .line 74
    .local v1, "success":Z
    :try_start_0
    iget-object v2, p0, Lcom/belkin/widgets/WidgetData;->data:Lorg/json/JSONObject;

    const-string v3, "state"

    invoke-virtual {v2, v3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 79
    :goto_0
    return v1

    .line 75
    :catch_0
    move-exception v0

    .line 76
    .local v0, "e":Lorg/json/JSONException;
    sget-object v2, Lcom/belkin/widgets/WidgetData;->TAG:Ljava/lang/String;

    const-string v3, "JSONException while building WidgetData: "

    invoke-static {v2, v3, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 77
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 126
    iget-object v0, p0, Lcom/belkin/widgets/WidgetData;->data:Lorg/json/JSONObject;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
