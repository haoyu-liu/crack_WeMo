.class public Lcom/belkin/cordova/plugin/AppSettingsPlugin;
.super Lorg/apache/cordova/CordovaPlugin;
.source "AppSettingsPlugin.java"


# static fields
.field public static final TAG:Ljava/lang/String; = "AppSettingsPlugin"


# instance fields
.field private mAppSettingsController:Lcom/belkin/controller/AppSettingsController;

.field private mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 27
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    .line 24
    iput-object v0, p0, Lcom/belkin/cordova/plugin/AppSettingsPlugin;->mContext:Landroid/content/Context;

    .line 25
    iput-object v0, p0, Lcom/belkin/cordova/plugin/AppSettingsPlugin;->mAppSettingsController:Lcom/belkin/controller/AppSettingsController;

    .line 29
    return-void
.end method

.method static synthetic access$000(Lcom/belkin/cordova/plugin/AppSettingsPlugin;)Lcom/belkin/controller/AppSettingsController;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/AppSettingsPlugin;

    .prologue
    .line 20
    iget-object v0, p0, Lcom/belkin/cordova/plugin/AppSettingsPlugin;->mAppSettingsController:Lcom/belkin/controller/AppSettingsController;

    return-object v0
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 3
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "inParamArray"    # Lorg/json/JSONArray;
    .param p3, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 42
    const-string v0, "AppSettingsPlugin"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "action: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    const-string v0, "reportAProblem"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 45
    const-string v0, "AppSettingsPlugin"

    const-string v1, " ACTION_REPORT_A_PROBLEM"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    new-instance v0, Lcom/belkin/cordova/plugin/AppSettingsPlugin$1;

    invoke-direct {v0, p0, p3, p2}, Lcom/belkin/cordova/plugin/AppSettingsPlugin$1;-><init>(Lcom/belkin/cordova/plugin/AppSettingsPlugin;Lorg/apache/cordova/CallbackContext;Lorg/json/JSONArray;)V

    invoke-static {v0}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V

    .line 74
    :cond_0
    :goto_0
    const/4 v0, 0x1

    return v0

    .line 67
    :cond_1
    const-string v0, "getLocalEmailBody"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 68
    const-string v0, "AppSettingsPlugin"

    const-string v1, " ACTION_GET_LOCAL_EMAIL_BODY"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    if-eqz p3, :cond_0

    .line 70
    new-instance v0, Lcom/belkin/devices/runnable/GetLocalEmailBodyRunnable;

    iget-object v1, p0, Lcom/belkin/cordova/plugin/AppSettingsPlugin;->mContext:Landroid/content/Context;

    invoke-direct {v0, p3, v1}, Lcom/belkin/devices/runnable/GetLocalEmailBodyRunnable;-><init>(Lorg/apache/cordova/CallbackContext;Landroid/content/Context;)V

    invoke-static {v0}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public initialize(Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V
    .locals 2
    .param p1, "cordova"    # Lorg/apache/cordova/CordovaInterface;
    .param p2, "webView"    # Lorg/apache/cordova/CordovaWebView;

    .prologue
    .line 33
    const-string v0, "AppSettingsPlugin"

    const-string v1, "AppSettingsPlugin initialize"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    invoke-super {p0, p1, p2}, Lorg/apache/cordova/CordovaPlugin;->initialize(Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V

    .line 35
    invoke-interface {p1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/cordova/plugin/AppSettingsPlugin;->mContext:Landroid/content/Context;

    .line 36
    iget-object v0, p0, Lcom/belkin/cordova/plugin/AppSettingsPlugin;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/belkin/controller/AppSettingsController;->getInstance(Landroid/content/Context;)Lcom/belkin/controller/AppSettingsController;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/cordova/plugin/AppSettingsPlugin;->mAppSettingsController:Lcom/belkin/controller/AppSettingsController;

    .line 37
    return-void
.end method
