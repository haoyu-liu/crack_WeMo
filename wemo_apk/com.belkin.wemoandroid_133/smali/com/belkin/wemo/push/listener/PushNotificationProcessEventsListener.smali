.class public interface abstract Lcom/belkin/wemo/push/listener/PushNotificationProcessEventsListener;
.super Ljava/lang/Object;
.source "PushNotificationProcessEventsListener.java"


# virtual methods
.method public abstract onPushServedRegistrationError(Ljava/lang/String;)V
.end method

.method public abstract onPushServedUnregisterError(Ljava/lang/String;)V
.end method

.method public abstract onRegisteredWithPushServer(Ljava/lang/String;)V
.end method

.method public abstract onRegisteredWithWeMoCloud()V
.end method

.method public abstract onUnregisteredOnWeMoCloud()V
.end method

.method public abstract onUnregisteredWithPushServer(Ljava/lang/String;)V
.end method

.method public abstract onWemoCloudRegistrationFailed(Lcom/belkin/wemo/error/WeMoError;)V
.end method

.method public abstract onWemoCloudUnregisterFailed(Lcom/belkin/wemo/error/WeMoError;)V
.end method
