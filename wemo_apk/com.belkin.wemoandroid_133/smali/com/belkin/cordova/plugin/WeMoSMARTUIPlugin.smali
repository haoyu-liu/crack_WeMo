.class public Lcom/belkin/cordova/plugin/WeMoSMARTUIPlugin;
.super Lorg/apache/cordova/CordovaPlugin;
.source "WeMoSMARTUIPlugin.java"


# static fields
.field public static final ACTION_GET_LOCAL_DEVICE_INFO:Ljava/lang/String; = "getLocalDeviceInfo"

.field private static final TAG:Ljava/lang/String; = "WeMoSMARTUIPlugin"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/belkin/cordova/plugin/WeMoSMARTUIPlugin;D)D
    .locals 3
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/WeMoSMARTUIPlugin;
    .param p1, "x1"    # D

    .prologue
    .line 15
    invoke-direct {p0, p1, p2}, Lcom/belkin/cordova/plugin/WeMoSMARTUIPlugin;->round(D)D

    move-result-wide v0

    return-wide v0
.end method

.method private getLocalDeviceInfo(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 2
    .param p1, "args"    # Lorg/json/JSONArray;
    .param p2, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/belkin/cordova/plugin/WeMoSMARTUIPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lcom/belkin/cordova/plugin/WeMoSMARTUIPlugin$1;

    invoke-direct {v1, p0, p2}, Lcom/belkin/cordova/plugin/WeMoSMARTUIPlugin$1;-><init>(Lcom/belkin/cordova/plugin/WeMoSMARTUIPlugin;Lorg/apache/cordova/CallbackContext;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 92
    const/4 v0, 0x1

    return v0
.end method

.method private round(D)D
    .locals 5
    .param p1, "d"    # D

    .prologue
    const-wide/high16 v2, 0x4024000000000000L    # 10.0

    .line 31
    mul-double v0, v2, p1

    invoke-static {v0, v1}, Ljava/lang/Math;->round(D)J

    move-result-wide v0

    long-to-double v0, v0

    div-double/2addr v0, v2

    return-wide v0
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 1
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 23
    const-string v0, "getLocalDeviceInfo"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 24
    invoke-direct {p0, p2, p3}, Lcom/belkin/cordova/plugin/WeMoSMARTUIPlugin;->getLocalDeviceInfo(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z

    move-result v0

    .line 27
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
