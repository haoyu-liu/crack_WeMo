.class public Lcom/belkin/controller/SensorEventChangeController;
.super Ljava/lang/Object;
.source "SensorEventChangeController.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "SensorEventChangeController"

.field private static sInstance:Lcom/belkin/controller/SensorEventChangeController;


# instance fields
.field private listenersList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/belkin/controller/SensorEventChangeListener;",
            ">;"
        }
    .end annotation
.end field

.field private mContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 19
    const/4 v0, 0x0

    sput-object v0, Lcom/belkin/controller/SensorEventChangeController;->sInstance:Lcom/belkin/controller/SensorEventChangeController;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object v0, p0, Lcom/belkin/controller/SensorEventChangeController;->listenersList:Ljava/util/ArrayList;

    .line 21
    iput-object v0, p0, Lcom/belkin/controller/SensorEventChangeController;->mContext:Landroid/content/Context;

    .line 24
    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object v0, p0, Lcom/belkin/controller/SensorEventChangeController;->listenersList:Ljava/util/ArrayList;

    .line 21
    iput-object v0, p0, Lcom/belkin/controller/SensorEventChangeController;->mContext:Landroid/content/Context;

    .line 27
    iput-object p1, p0, Lcom/belkin/controller/SensorEventChangeController;->mContext:Landroid/content/Context;

    .line 28
    return-void
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/belkin/controller/SensorEventChangeController;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 31
    const-class v1, Lcom/belkin/controller/SensorEventChangeController;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/belkin/controller/SensorEventChangeController;->sInstance:Lcom/belkin/controller/SensorEventChangeController;

    if-nez v0, :cond_0

    .line 32
    new-instance v0, Lcom/belkin/controller/SensorEventChangeController;

    invoke-direct {v0, p0}, Lcom/belkin/controller/SensorEventChangeController;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/belkin/controller/SensorEventChangeController;->sInstance:Lcom/belkin/controller/SensorEventChangeController;

    .line 33
    :cond_0
    sget-object v0, Lcom/belkin/controller/SensorEventChangeController;->sInstance:Lcom/belkin/controller/SensorEventChangeController;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 31
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public addNotificationListener(Lcom/belkin/controller/SensorEventChangeListener;)V
    .locals 2
    .param p1, "listener"    # Lcom/belkin/controller/SensorEventChangeListener;

    .prologue
    .line 68
    if-nez p1, :cond_0

    .line 69
    const-string v0, "SensorEventChangeController"

    const-string v1, "listener is null returning.."

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    :goto_0
    return-void

    .line 72
    :cond_0
    iget-object v0, p0, Lcom/belkin/controller/SensorEventChangeController;->listenersList:Ljava/util/ArrayList;

    if-nez v0, :cond_1

    .line 73
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/belkin/controller/SensorEventChangeController;->listenersList:Ljava/util/ArrayList;

    .line 75
    :cond_1
    iget-object v0, p0, Lcom/belkin/controller/SensorEventChangeController;->listenersList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 76
    const-string v0, "SensorEventChangeController"

    const-string v1, "added Notification Listener"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    iget-object v0, p0, Lcom/belkin/controller/SensorEventChangeController;->listenersList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 79
    :cond_2
    const-string v0, "SensorEventChangeController"

    const-string v1, "Notification Listener already exists"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public changeStateNotification(Lorg/json/JSONObject;)Z
    .locals 11
    .param p1, "messageObject"    # Lorg/json/JSONObject;

    .prologue
    .line 37
    const/4 v6, 0x0

    .line 38
    .local v6, "isNotificationShown":Z
    if-eqz p1, :cond_4

    .line 40
    :try_start_0
    const-string v9, "productName"

    invoke-virtual {p1, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 41
    .local v8, "productName":Ljava/lang/String;
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_4

    .line 42
    const-string v9, "AlarmSensor"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_0

    const-string v9, "PIR"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_0

    const-string v9, "Fob"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_0

    const-string v9, "DWSensor"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 44
    :cond_0
    const-string v9, "capabilityId"

    invoke-virtual {p1, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 45
    .local v3, "capabilityIDs":Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_3

    .line 46
    const-string v9, ","

    invoke-virtual {v3, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 47
    .local v2, "capabilityIDArray":[Ljava/lang/String;
    move-object v0, v2

    .local v0, "arr$":[Ljava/lang/String;
    array-length v7, v0

    .local v7, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    :goto_0
    if-ge v5, v7, :cond_3

    aget-object v1, v0, v5

    .line 48
    .local v1, "capabilityID":Ljava/lang/String;
    const-string v9, "10500"

    invoke-virtual {v1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_1

    const-string v9, "20502"

    invoke-virtual {v1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 49
    :cond_1
    iget-object v9, p0, Lcom/belkin/controller/SensorEventChangeController;->mContext:Landroid/content/Context;

    invoke-static {v9}, Lcom/belkin/wemo/cache/utils/SharePreferences;->updateSensorEventCounter(Landroid/content/Context;)V

    .line 47
    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 54
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v1    # "capabilityID":Ljava/lang/String;
    .end local v2    # "capabilityIDArray":[Ljava/lang/String;
    .end local v5    # "i$":I
    .end local v7    # "len$":I
    :cond_3
    invoke-static {}, Lcom/belkin/wemo/cache/utils/WemoUtils;->isAppInForeground()Z

    move-result v9

    if-nez v9, :cond_5

    .line 55
    const/4 v6, 0x1

    .line 64
    .end local v3    # "capabilityIDs":Ljava/lang/String;
    .end local v8    # "productName":Ljava/lang/String;
    :cond_4
    :goto_1
    return v6

    .line 57
    .restart local v3    # "capabilityIDs":Ljava/lang/String;
    .restart local v8    # "productName":Ljava/lang/String;
    :cond_5
    invoke-virtual {p0}, Lcom/belkin/controller/SensorEventChangeController;->sendNotification()V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 60
    .end local v3    # "capabilityIDs":Ljava/lang/String;
    .end local v8    # "productName":Ljava/lang/String;
    :catch_0
    move-exception v4

    .line 61
    .local v4, "e":Lorg/json/JSONException;
    const-string v9, "SensorEventChangeController"

    const-string v10, "JSONException in setting json object"

    invoke-static {v9, v10, v4}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method public sendNotification()V
    .locals 3

    .prologue
    .line 84
    iget-object v2, p0, Lcom/belkin/controller/SensorEventChangeController;->listenersList:Ljava/util/ArrayList;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/belkin/controller/SensorEventChangeController;->listenersList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_1

    .line 85
    iget-object v2, p0, Lcom/belkin/controller/SensorEventChangeController;->listenersList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/belkin/controller/SensorEventChangeListener;

    .line 86
    .local v1, "listener":Lcom/belkin/controller/SensorEventChangeListener;
    if-eqz v1, :cond_0

    .line 87
    invoke-interface {v1}, Lcom/belkin/controller/SensorEventChangeListener;->sensorEventsCounter()V

    goto :goto_0

    .line 91
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "listener":Lcom/belkin/controller/SensorEventChangeListener;
    :cond_1
    return-void
.end method
