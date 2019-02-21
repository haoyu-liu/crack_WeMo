.class public interface abstract Lcom/belkin/wemo/push/cmd/IPushNotificationHandler;
.super Ljava/lang/Object;
.source "IPushNotificationHandler.java"


# virtual methods
.method public abstract registerWithPushServer(Landroid/content/Context;Lcom/belkin/wemo/push/cmd/listener/RegisterWithPushCloudListener;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/exception/InvalidArgumentsException;
        }
    .end annotation
.end method

.method public abstract registerWithWeMoCloud(Landroid/content/Context;Ljava/lang/String;Lcom/belkin/wemo/push/cmd/listener/RegisterWithWeMoCloudListener;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/exception/InvalidArgumentsException;
        }
    .end annotation
.end method

.method public abstract unregisterFromPushServer(Landroid/content/Context;Lcom/belkin/wemo/push/cmd/listener/UnregisterFromPushCloudListener;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/exception/InvalidArgumentsException;
        }
    .end annotation
.end method

.method public abstract unregisterFromWeMoCloud(Landroid/content/Context;Ljava/lang/String;Lcom/belkin/wemo/push/cmd/listener/UnregisterFromWeMoCloudListener;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/exception/InvalidArgumentsException;
        }
    .end annotation
.end method
