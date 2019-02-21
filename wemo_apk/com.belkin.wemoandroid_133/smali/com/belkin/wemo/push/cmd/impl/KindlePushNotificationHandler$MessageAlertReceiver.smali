.class public Lcom/belkin/wemo/push/cmd/impl/KindlePushNotificationHandler$MessageAlertReceiver;
.super Lcom/amazon/device/messaging/ADMMessageReceiver;
.source "KindlePushNotificationHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/push/cmd/impl/KindlePushNotificationHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MessageAlertReceiver"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 47
    const-class v0, Lcom/belkin/wemo/push/cmd/impl/KindlePushNotificationHandler;

    invoke-direct {p0, v0}, Lcom/amazon/device/messaging/ADMMessageReceiver;-><init>(Ljava/lang/Class;)V

    .line 48
    return-void
.end method
