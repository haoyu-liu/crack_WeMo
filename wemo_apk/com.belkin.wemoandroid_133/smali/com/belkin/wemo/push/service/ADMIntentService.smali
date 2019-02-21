.class public Lcom/belkin/wemo/push/service/ADMIntentService;
.super Lcom/belkin/wemo/push/service/PushNotificationIntentService;
.source "ADMIntentService.java"


# static fields
.field public static final ADM_SERVICE_NAME:Ljava/lang/String; = "ADMIntentService"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 16
    const-string v0, "ADMIntentService"

    invoke-direct {p0, v0}, Lcom/belkin/wemo/push/service/PushNotificationIntentService;-><init>(Ljava/lang/String;)V

    .line 17
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 12
    invoke-direct {p0, p1}, Lcom/belkin/wemo/push/service/PushNotificationIntentService;-><init>(Ljava/lang/String;)V

    .line 13
    return-void
.end method


# virtual methods
.method protected getNotificationMessage(Landroid/content/Intent;)Lcom/belkin/wemo/push/PushNotificationInfo;
    .locals 2
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 21
    new-instance v0, Lcom/belkin/wemo/push/PushNotificationInfo;

    invoke-direct {v0}, Lcom/belkin/wemo/push/PushNotificationInfo;-><init>()V

    .line 22
    .local v0, "messageInfo":Lcom/belkin/wemo/push/PushNotificationInfo;
    const-string v1, "message"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/push/PushNotificationInfo;->setPushNotificationMsg(Ljava/lang/String;)V

    .line 23
    return-object v0
.end method
