.class public Lcom/belkin/wemo/push/cmd/impl/KindlePushNotificationHandler;
.super Lcom/amazon/device/messaging/ADMMessageHandlerBase;
.source "KindlePushNotificationHandler.java"

# interfaces
.implements Lcom/belkin/wemo/push/cmd/IPushNotificationHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/push/cmd/impl/KindlePushNotificationHandler$MessageAlertReceiver;
    }
.end annotation


# static fields
.field public static final TAG:Ljava/lang/String; = "KindlePushNotificationHandler"

.field private static registerWithPushCloudListener:Lcom/belkin/wemo/push/cmd/listener/RegisterWithPushCloudListener;

.field private static unregisterFromPushCloudListener:Lcom/belkin/wemo/push/cmd/listener/UnregisterFromPushCloudListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 55
    const-class v0, Lcom/belkin/wemo/push/cmd/impl/KindlePushNotificationHandler;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/amazon/device/messaging/ADMMessageHandlerBase;-><init>(Ljava/lang/String;)V

    .line 57
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    .line 66
    invoke-direct {p0, p1}, Lcom/amazon/device/messaging/ADMMessageHandlerBase;-><init>(Ljava/lang/String;)V

    .line 67
    return-void
.end method

.method private verifyMD5Checksum(Landroid/os/Bundle;)V
    .locals 11
    .param p1, "extras"    # Landroid/os/Bundle;

    .prologue
    .line 106
    const-string v2, "collapse_key"

    .line 108
    .local v2, "consolidationKey":Ljava/lang/String;
    invoke-virtual {p1}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v4

    .line 109
    .local v4, "extrasKeySet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 110
    .local v3, "extrasHashMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 112
    .local v6, "key":Ljava/lang/String;
    const-string v8, "adm_message_md5"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_0

    const-string v8, "collapse_key"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 114
    invoke-virtual {p1, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v3, v6, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 117
    .end local v6    # "key":Ljava/lang/String;
    :cond_1
    new-instance v1, Lcom/belkin/wemo/push/adm/ADMMD5ChecksumCalculator;

    invoke-direct {v1}, Lcom/belkin/wemo/push/adm/ADMMD5ChecksumCalculator;-><init>()V

    .line 118
    .local v1, "checksumCalculator":Lcom/belkin/wemo/push/adm/ADMMD5ChecksumCalculator;
    invoke-virtual {v1, v3}, Lcom/belkin/wemo/push/adm/ADMMD5ChecksumCalculator;->calculateChecksum(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v7

    .line 119
    .local v7, "md5":Ljava/lang/String;
    const-string v8, "KindlePushNotificationHandler"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "ADMMessageHandler:onMessage App md5: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 122
    const-string v8, "adm_message_md5"

    invoke-virtual {p1, v8}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 123
    .local v0, "admMd5":Ljava/lang/String;
    const-string v8, "KindlePushNotificationHandler"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "ADMMessageHandler:onMessage ADM md5: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 126
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_2

    .line 128
    const-string v8, "KindlePushNotificationHandler"

    const-string v9, "ADMMessageHandler:onMessage MD5 checksum verification failure. Message received with errors"

    invoke-static {v8, v9}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    :cond_2
    return-void
.end method


# virtual methods
.method protected onMessage(Landroid/content/Intent;)V
    .locals 7
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 73
    const-string v4, "KindlePushNotificationHandler"

    const-string v5, "Push Notification: Push Notification received from ADM Server."

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 77
    .local v0, "extras":Landroid/os/Bundle;
    invoke-direct {p0, v0}, Lcom/belkin/wemo/push/cmd/impl/KindlePushNotificationHandler;->verifyMD5Checksum(Landroid/os/Bundle;)V

    .line 80
    const-string v4, "message"

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 81
    .local v2, "msg":Ljava/lang/String;
    const-string v4, "timeStamp"

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 83
    .local v3, "time":Ljava/lang/String;
    if-eqz v2, :cond_0

    if-nez v3, :cond_1

    .line 85
    :cond_0
    const-string v4, "KindlePushNotificationHandler"

    const-string v5, "Push Notification: OnMessage(): Unable to extract message data.Make sure that msgKey and timeKey values match data elements of your JSON message"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    :cond_1
    const-string v4, "KindlePushNotificationHandler"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Push Notification: Message contained in intent: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    new-instance v1, Landroid/content/Intent;

    const-string v4, "com.belkin.wemo.intent.ACTION_ADM_MESSAGE_RECEIVED"

    invoke-direct {v1, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 92
    .local v1, "kindleCustomBroadcastIntent":Landroid/content/Intent;
    const-string v4, "message"

    invoke-virtual {v1, v4, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 93
    const-string v4, "com.belkin.android.adm.ON_MESSAGE"

    invoke-virtual {v1, v4, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 95
    invoke-virtual {p0, v1}, Lcom/belkin/wemo/push/cmd/impl/KindlePushNotificationHandler;->sendBroadcast(Landroid/content/Intent;)V

    .line 96
    return-void
.end method

.method protected onRegistered(Ljava/lang/String;)V
    .locals 3
    .param p1, "registrationId"    # Ljava/lang/String;

    .prologue
    .line 150
    const-string v0, "KindlePushNotificationHandler"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Push Notification: ADM Registration Success. Registration ID: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 152
    sget-object v0, Lcom/belkin/wemo/push/cmd/impl/KindlePushNotificationHandler;->registerWithPushCloudListener:Lcom/belkin/wemo/push/cmd/listener/RegisterWithPushCloudListener;

    invoke-interface {v0, p1}, Lcom/belkin/wemo/push/cmd/listener/RegisterWithPushCloudListener;->onRegisteredWithPush(Ljava/lang/String;)V

    .line 153
    const/4 v0, 0x0

    sput-object v0, Lcom/belkin/wemo/push/cmd/impl/KindlePushNotificationHandler;->registerWithPushCloudListener:Lcom/belkin/wemo/push/cmd/listener/RegisterWithPushCloudListener;

    .line 154
    return-void
.end method

.method protected onRegistrationError(Ljava/lang/String;)V
    .locals 3
    .param p1, "errorStr"    # Ljava/lang/String;

    .prologue
    .line 137
    const-string v0, "KindlePushNotificationHandler"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Push Notification: ADM Registration Error - "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 138
    sget-object v0, Lcom/belkin/wemo/push/cmd/impl/KindlePushNotificationHandler;->registerWithPushCloudListener:Lcom/belkin/wemo/push/cmd/listener/RegisterWithPushCloudListener;

    if-eqz v0, :cond_0

    .line 141
    :cond_0
    sget-object v0, Lcom/belkin/wemo/push/cmd/impl/KindlePushNotificationHandler;->registerWithPushCloudListener:Lcom/belkin/wemo/push/cmd/listener/RegisterWithPushCloudListener;

    new-instance v1, Lcom/belkin/wemo/push/error/PushNotificationError;

    const/16 v2, -0x64

    invoke-direct {v1, v2, p1}, Lcom/belkin/wemo/push/error/PushNotificationError;-><init>(ILjava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/belkin/wemo/push/cmd/listener/RegisterWithPushCloudListener;->onRegistrationFailed(Lcom/belkin/wemo/push/error/PushNotificationError;)V

    .line 143
    const/4 v0, 0x0

    sput-object v0, Lcom/belkin/wemo/push/cmd/impl/KindlePushNotificationHandler;->registerWithPushCloudListener:Lcom/belkin/wemo/push/cmd/listener/RegisterWithPushCloudListener;

    .line 144
    return-void
.end method

.method protected onUnregistered(Ljava/lang/String;)V
    .locals 3
    .param p1, "registrationId"    # Ljava/lang/String;

    .prologue
    .line 160
    const-string v0, "KindlePushNotificationHandler"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Push Notification: ADM unregister success fo registration ID: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 162
    sget-object v0, Lcom/belkin/wemo/push/cmd/impl/KindlePushNotificationHandler;->unregisterFromPushCloudListener:Lcom/belkin/wemo/push/cmd/listener/UnregisterFromPushCloudListener;

    invoke-interface {v0, p1}, Lcom/belkin/wemo/push/cmd/listener/UnregisterFromPushCloudListener;->onUnregisteredFromPushCloud(Ljava/lang/String;)V

    .line 163
    const/4 v0, 0x0

    sput-object v0, Lcom/belkin/wemo/push/cmd/impl/KindlePushNotificationHandler;->unregisterFromPushCloudListener:Lcom/belkin/wemo/push/cmd/listener/UnregisterFromPushCloudListener;

    .line 164
    return-void
.end method

.method public registerWithPushServer(Landroid/content/Context;Lcom/belkin/wemo/push/cmd/listener/RegisterWithPushCloudListener;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "listener"    # Lcom/belkin/wemo/push/cmd/listener/RegisterWithPushCloudListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/exception/InvalidArgumentsException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 174
    if-nez p1, :cond_0

    .line 175
    const-string v2, "KindlePushNotificationHandler"

    const-string v3, "Push Notification: Registering with ADM - Context is null!"

    invoke-static {v2, v3}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 176
    new-instance v2, Lcom/belkin/wemo/exception/InvalidArgumentsException;

    const-string v3, "Context in NULL!"

    invoke-direct {v2, v3}, Lcom/belkin/wemo/exception/InvalidArgumentsException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 178
    :cond_0
    if-nez p2, :cond_1

    .line 179
    const-string v2, "KindlePushNotificationHandler"

    const-string v3, "Push Notification: Registration Error - RegisterWithPushCloudListener instance is invalid!"

    invoke-static {v2, v3}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 180
    new-instance v2, Lcom/belkin/wemo/exception/InvalidArgumentsException;

    const-string v3, "RegisterWithPushCloudListener instance is invalid"

    invoke-direct {v2, v3}, Lcom/belkin/wemo/exception/InvalidArgumentsException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 183
    :cond_1
    sput-object p2, Lcom/belkin/wemo/push/cmd/impl/KindlePushNotificationHandler;->registerWithPushCloudListener:Lcom/belkin/wemo/push/cmd/listener/RegisterWithPushCloudListener;

    .line 184
    const-string v2, "KindlePushNotificationHandler"

    const-string v3, "Push Notification: Registering with ADM (Kindle)"

    invoke-static {v2, v3}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 186
    new-instance v0, Lcom/amazon/device/messaging/ADM;

    invoke-direct {v0, p1}, Lcom/amazon/device/messaging/ADM;-><init>(Landroid/content/Context;)V

    .line 188
    .local v0, "adm":Lcom/amazon/device/messaging/ADM;
    invoke-virtual {v0}, Lcom/amazon/device/messaging/ADM;->isSupported()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 189
    invoke-virtual {v0}, Lcom/amazon/device/messaging/ADM;->getRegistrationId()Ljava/lang/String;

    move-result-object v1

    .line 191
    .local v1, "registrationId":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 193
    const-string v2, "KindlePushNotificationHandler"

    const-string v3, "Push Notification: Start register as registeration ID is NULL."

    invoke-static {v2, v3}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 194
    invoke-virtual {v0}, Lcom/amazon/device/messaging/ADM;->startRegister()V

    .line 214
    .end local v1    # "registrationId":Ljava/lang/String;
    :goto_0
    return-void

    .line 198
    .restart local v1    # "registrationId":Ljava/lang/String;
    :cond_2
    sget-object v2, Lcom/belkin/wemo/push/cmd/impl/KindlePushNotificationHandler;->registerWithPushCloudListener:Lcom/belkin/wemo/push/cmd/listener/RegisterWithPushCloudListener;

    invoke-interface {v2, v1}, Lcom/belkin/wemo/push/cmd/listener/RegisterWithPushCloudListener;->onAlreadyRegisteredWithPush(Ljava/lang/String;)V

    .line 201
    sput-object v4, Lcom/belkin/wemo/push/cmd/impl/KindlePushNotificationHandler;->registerWithPushCloudListener:Lcom/belkin/wemo/push/cmd/listener/RegisterWithPushCloudListener;

    goto :goto_0

    .line 205
    .end local v1    # "registrationId":Ljava/lang/String;
    :cond_3
    const-string v2, "KindlePushNotificationHandler"

    const-string v3, "Push Notification: Registration Error - ADM is NOT supported!"

    invoke-static {v2, v3}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 206
    sget-object v2, Lcom/belkin/wemo/push/cmd/impl/KindlePushNotificationHandler;->registerWithPushCloudListener:Lcom/belkin/wemo/push/cmd/listener/RegisterWithPushCloudListener;

    new-instance v3, Lcom/belkin/wemo/push/error/PushNotificationError;

    invoke-direct {v3}, Lcom/belkin/wemo/push/error/PushNotificationError;-><init>()V

    invoke-interface {v2, v3}, Lcom/belkin/wemo/push/cmd/listener/RegisterWithPushCloudListener;->onRegistrationFailed(Lcom/belkin/wemo/push/error/PushNotificationError;)V

    .line 208
    sput-object v4, Lcom/belkin/wemo/push/cmd/impl/KindlePushNotificationHandler;->registerWithPushCloudListener:Lcom/belkin/wemo/push/cmd/listener/RegisterWithPushCloudListener;

    goto :goto_0
.end method

.method public registerWithWeMoCloud(Landroid/content/Context;Ljava/lang/String;Lcom/belkin/wemo/push/cmd/listener/RegisterWithWeMoCloudListener;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "registrationId"    # Ljava/lang/String;
    .param p3, "listener"    # Lcom/belkin/wemo/push/cmd/listener/RegisterWithWeMoCloudListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/exception/InvalidArgumentsException;
        }
    .end annotation

    .prologue
    .line 220
    invoke-static {p1, p2, p3}, Lcom/belkin/wemo/push/cloud/WeMoCloudPushMessagingUtility;->sendPushRegistrationIdToWeMoCloud(Landroid/content/Context;Ljava/lang/String;Lcom/belkin/wemo/push/cmd/listener/RegisterWithWeMoCloudListener;)V

    .line 221
    return-void
.end method

.method public unregisterFromPushServer(Landroid/content/Context;Lcom/belkin/wemo/push/cmd/listener/UnregisterFromPushCloudListener;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "listener"    # Lcom/belkin/wemo/push/cmd/listener/UnregisterFromPushCloudListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/exception/InvalidArgumentsException;
        }
    .end annotation

    .prologue
    .line 229
    if-nez p1, :cond_0

    .line 230
    const-string v1, "KindlePushNotificationHandler"

    const-string v2, "Push Notification: Unregistering from ADM - Context is null!"

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 231
    new-instance v1, Lcom/belkin/wemo/exception/InvalidArgumentsException;

    const-string v2, "Context in NULL!"

    invoke-direct {v1, v2}, Lcom/belkin/wemo/exception/InvalidArgumentsException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 233
    :cond_0
    if-nez p2, :cond_1

    .line 234
    const-string v1, "KindlePushNotificationHandler"

    const-string v2, "Push Notification: Unregister Error - UnregisterFromPushCloudListener instance is invalid!"

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 235
    new-instance v1, Lcom/belkin/wemo/exception/InvalidArgumentsException;

    const-string v2, "RegisterWithPushCloudListener instance is invalid"

    invoke-direct {v1, v2}, Lcom/belkin/wemo/exception/InvalidArgumentsException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 238
    :cond_1
    sput-object p2, Lcom/belkin/wemo/push/cmd/impl/KindlePushNotificationHandler;->unregisterFromPushCloudListener:Lcom/belkin/wemo/push/cmd/listener/UnregisterFromPushCloudListener;

    .line 239
    const-string v1, "KindlePushNotificationHandler"

    const-string v2, "Push Notification: unregistering from ADM (Kindle)"

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 241
    new-instance v0, Lcom/amazon/device/messaging/ADM;

    invoke-direct {v0, p1}, Lcom/amazon/device/messaging/ADM;-><init>(Landroid/content/Context;)V

    .line 242
    .local v0, "adm":Lcom/amazon/device/messaging/ADM;
    invoke-virtual {v0}, Lcom/amazon/device/messaging/ADM;->isSupported()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 244
    invoke-virtual {v0}, Lcom/amazon/device/messaging/ADM;->startUnregister()V

    .line 254
    :goto_0
    return-void

    .line 248
    :cond_2
    const-string v1, "KindlePushNotificationHandler"

    const-string v2, "Push Notification: Unregister Error - ADM is NOT supported!"

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 249
    sget-object v1, Lcom/belkin/wemo/push/cmd/impl/KindlePushNotificationHandler;->unregisterFromPushCloudListener:Lcom/belkin/wemo/push/cmd/listener/UnregisterFromPushCloudListener;

    new-instance v2, Lcom/belkin/wemo/push/error/PushNotificationError;

    invoke-direct {v2}, Lcom/belkin/wemo/push/error/PushNotificationError;-><init>()V

    invoke-interface {v1, v2}, Lcom/belkin/wemo/push/cmd/listener/UnregisterFromPushCloudListener;->onUnregisterFailed(Lcom/belkin/wemo/push/error/PushNotificationError;)V

    .line 251
    const/4 v1, 0x0

    sput-object v1, Lcom/belkin/wemo/push/cmd/impl/KindlePushNotificationHandler;->unregisterFromPushCloudListener:Lcom/belkin/wemo/push/cmd/listener/UnregisterFromPushCloudListener;

    goto :goto_0
.end method

.method public unregisterFromWeMoCloud(Landroid/content/Context;Ljava/lang/String;Lcom/belkin/wemo/push/cmd/listener/UnregisterFromWeMoCloudListener;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "registrationId"    # Ljava/lang/String;
    .param p3, "listener"    # Lcom/belkin/wemo/push/cmd/listener/UnregisterFromWeMoCloudListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/exception/InvalidArgumentsException;
        }
    .end annotation

    .prologue
    .line 259
    invoke-static {p1, p2, p3}, Lcom/belkin/wemo/push/cloud/WeMoCloudPushMessagingUtility;->unregisterAppFromWeMoCloudForPush(Landroid/content/Context;Ljava/lang/String;Lcom/belkin/wemo/push/cmd/listener/UnregisterFromWeMoCloudListener;)V

    .line 260
    return-void
.end method
