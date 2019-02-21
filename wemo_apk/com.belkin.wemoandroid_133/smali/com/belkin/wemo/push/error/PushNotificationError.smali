.class public Lcom/belkin/wemo/push/error/PushNotificationError;
.super Lcom/belkin/wemo/error/WeMoError;
.source "PushNotificationError.java"


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 13
    const/16 v0, -0x64

    const-string v1, "Error during register/unregister Push Notification!"

    invoke-direct {p0, v0, v1}, Lcom/belkin/wemo/error/WeMoError;-><init>(ILjava/lang/String;)V

    .line 14
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .locals 0
    .param p1, "errorCode"    # I
    .param p2, "errorMessage"    # Ljava/lang/String;

    .prologue
    .line 9
    invoke-direct {p0, p1, p2}, Lcom/belkin/wemo/error/WeMoError;-><init>(ILjava/lang/String;)V

    .line 10
    return-void
.end method
