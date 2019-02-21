.class public Lcom/belkin/cordova/plugin/callback/SetBlobStorageCallback;
.super Ljava/lang/Object;
.source "SetBlobStorageCallback.java"

# interfaces
.implements Lcom/belkin/cordova/plugin/callback/SuccessPluginResultCallback;
.implements Lcom/belkin/cordova/plugin/callback/ErrorPluginResultCallback;


# instance fields
.field private mCallbackContext:Lorg/apache/cordova/CallbackContext;


# direct methods
.method public constructor <init>(Lorg/apache/cordova/CallbackContext;)V
    .locals 0
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    iput-object p1, p0, Lcom/belkin/cordova/plugin/callback/SetBlobStorageCallback;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    .line 11
    return-void
.end method


# virtual methods
.method public onError(Ljava/lang/String;)V
    .locals 0
    .param p1, "error"    # Ljava/lang/String;

    .prologue
    .line 17
    return-void
.end method

.method public onSuccess(Ljava/lang/String;)V
    .locals 0
    .param p1, "result"    # Ljava/lang/String;

    .prologue
    .line 23
    return-void
.end method
