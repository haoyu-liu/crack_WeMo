.class public Lcom/belkin/cordova/plugin/runnable/FirmwareUpdateRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "FirmwareUpdateRunnable.java"


# instance fields
.field private mCallback:Lcom/belkin/cordova/plugin/callback/FirmwareUpdateCallback;

.field private mInParamArray:Lorg/json/JSONArray;


# direct methods
.method public constructor <init>(Lorg/json/JSONArray;Lcom/belkin/cordova/plugin/callback/FirmwareUpdateCallback;)V
    .locals 0
    .param p1, "inParamArray"    # Lorg/json/JSONArray;
    .param p2, "callback"    # Lcom/belkin/cordova/plugin/callback/FirmwareUpdateCallback;

    .prologue
    .line 15
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 17
    iput-object p1, p0, Lcom/belkin/cordova/plugin/runnable/FirmwareUpdateRunnable;->mInParamArray:Lorg/json/JSONArray;

    .line 18
    iput-object p2, p0, Lcom/belkin/cordova/plugin/runnable/FirmwareUpdateRunnable;->mCallback:Lcom/belkin/cordova/plugin/callback/FirmwareUpdateCallback;

    .line 19
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 25
    iget-object v1, p0, Lcom/belkin/cordova/plugin/runnable/FirmwareUpdateRunnable;->mInParamArray:Lorg/json/JSONArray;

    if-eqz v1, :cond_0

    .line 26
    iget-object v1, p0, Lcom/belkin/cordova/plugin/runnable/FirmwareUpdateRunnable;->mInParamArray:Lorg/json/JSONArray;

    invoke-static {v1}, Lcom/belkin/firmware/FirmwareUpdateManager;->processFirwareUpdatePayload(Lorg/json/JSONArray;)Z

    move-result v0

    .line 27
    .local v0, "response":Z
    if-eqz v0, :cond_1

    .line 28
    iget-object v1, p0, Lcom/belkin/cordova/plugin/runnable/FirmwareUpdateRunnable;->mCallback:Lcom/belkin/cordova/plugin/callback/FirmwareUpdateCallback;

    invoke-static {v0}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/belkin/cordova/plugin/callback/FirmwareUpdateCallback;->onSuccess(Ljava/lang/String;)V

    .line 33
    .end local v0    # "response":Z
    :cond_0
    :goto_0
    return-void

    .line 30
    .restart local v0    # "response":Z
    :cond_1
    iget-object v1, p0, Lcom/belkin/cordova/plugin/runnable/FirmwareUpdateRunnable;->mCallback:Lcom/belkin/cordova/plugin/callback/FirmwareUpdateCallback;

    invoke-static {v0}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/belkin/cordova/plugin/callback/FirmwareUpdateCallback;->onError(Ljava/lang/String;)V

    goto :goto_0
.end method
