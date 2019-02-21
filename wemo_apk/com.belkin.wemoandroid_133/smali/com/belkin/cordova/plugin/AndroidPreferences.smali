.class public Lcom/belkin/cordova/plugin/AndroidPreferences;
.super Lorg/apache/cordova/CordovaPlugin;
.source "AndroidPreferences.java"


# static fields
.field public static final LOG_NAME:Ljava/lang/String; = "AndroidPreferences Plugin"

.field public static final LOG_PROV:Ljava/lang/String; = "PhoneGapLog"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    return-void
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 2
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 23
    iget-object v0, p0, Lcom/belkin/cordova/plugin/AndroidPreferences;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lcom/belkin/cordova/plugin/AndroidPreferences$1;

    invoke-direct {v1, p0, p2, p3, p1}, Lcom/belkin/cordova/plugin/AndroidPreferences$1;-><init>(Lcom/belkin/cordova/plugin/AndroidPreferences;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 62
    const/4 v0, 0x1

    return v0
.end method
