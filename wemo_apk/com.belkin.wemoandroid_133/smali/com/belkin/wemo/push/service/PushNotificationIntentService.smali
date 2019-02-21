.class public abstract Lcom/belkin/wemo/push/service/PushNotificationIntentService;
.super Landroid/app/IntentService;
.source "PushNotificationIntentService.java"


# static fields
.field public static final LARGE_ICON_BITMAP_SIZE:I = 0x32

.field public static final PUSH_LED_COLOR:I = -0xff0100

.field public static final PUSH_LED_OFF_TIME_MS:I = 0x3e8

.field public static final PUSH_LED_ON_TIME_MS:I = 0x12c

.field public static final PUSH_PENDING_INTENT_REQUEST_CODE:I = 0x0

.field public static final SMALL_ICON_BITMAP_SIZE:I = 0x18

.field private static volatile notifyIdCounter:I


# instance fields
.field protected final TAG:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 42
    invoke-direct {p0, p1}, Landroid/app/IntentService;-><init>(Ljava/lang/String;)V

    .line 43
    invoke-direct {p0}, Lcom/belkin/wemo/push/service/PushNotificationIntentService;->getLoggerTag()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/push/service/PushNotificationIntentService;->TAG:Ljava/lang/String;

    .line 44
    return-void
.end method

.method private getLoggerTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 47
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getVettedNotificationMessage(Lcom/belkin/wemo/push/PushNotificationInfo;)Ljava/lang/String;
    .locals 6
    .param p1, "notificationInfo"    # Lcom/belkin/wemo/push/PushNotificationInfo;

    .prologue
    .line 173
    invoke-virtual {p1}, Lcom/belkin/wemo/push/PushNotificationInfo;->getEventCode()Ljava/lang/String;

    move-result-object v1

    .line 174
    .local v1, "msgInIntent":Ljava/lang/String;
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2}, Ljava/lang/String;-><init>()V

    .line 176
    .local v2, "notificationMessage":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/belkin/wemo/push/service/PushNotificationIntentService;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f070005

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 178
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/belkin/wemo/push/service/PushNotificationIntentService;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f07000b

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/belkin/wemo/push/service/PushNotificationIntentService;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f07000c

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 202
    :cond_0
    :goto_0
    return-object v2

    .line 181
    :cond_1
    invoke-virtual {p0}, Lcom/belkin/wemo/push/service/PushNotificationIntentService;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f070006

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 183
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/belkin/wemo/push/service/PushNotificationIntentService;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f07000d

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/belkin/wemo/push/service/PushNotificationIntentService;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f07000f

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 186
    :cond_2
    invoke-virtual {p1}, Lcom/belkin/wemo/push/PushNotificationInfo;->getEventCode()Ljava/lang/String;

    move-result-object v3

    const-string v4, "overtempon"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3

    invoke-virtual {p1}, Lcom/belkin/wemo/push/PushNotificationInfo;->getEventCode()Ljava/lang/String;

    move-result-object v3

    const-string v4, "overtempon2"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 188
    :cond_3
    invoke-virtual {p1}, Lcom/belkin/wemo/push/PushNotificationInfo;->getFriendlyName()Ljava/lang/String;

    move-result-object v0

    .line 189
    .local v0, "friendlyName":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 190
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/belkin/wemo/push/service/PushNotificationIntentService;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f07000e

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_0

    .line 192
    .end local v0    # "friendlyName":Ljava/lang/String;
    :cond_4
    invoke-virtual {p1}, Lcom/belkin/wemo/push/PushNotificationInfo;->getPushNotificationMsg()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_5

    .line 194
    invoke-virtual {p1}, Lcom/belkin/wemo/push/PushNotificationInfo;->getPushNotificationMsg()Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_0

    .line 198
    :cond_5
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/belkin/wemo/push/service/PushNotificationIntentService;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f070008

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_0
.end method

.method private getWeMoNotification(Landroid/content/Context;Lcom/belkin/wemo/push/PushNotificationInfo;)Landroid/app/Notification;
    .locals 13
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "notificationInfo"    # Lcom/belkin/wemo/push/PushNotificationInfo;

    .prologue
    const v10, 0x7f02000c

    const v12, 0x7f070007

    const/4 v11, 0x0

    .line 126
    invoke-direct {p0, p2}, Lcom/belkin/wemo/push/service/PushNotificationIntentService;->getVettedNotificationMessage(Lcom/belkin/wemo/push/PushNotificationInfo;)Ljava/lang/String;

    move-result-object v7

    .line 128
    .local v7, "vettedMsg":Ljava/lang/String;
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_1

    .line 129
    new-instance v3, Landroid/support/v4/app/NotificationCompat$Builder;

    invoke-direct {v3, p0}, Landroid/support/v4/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;)V

    .line 131
    .local v3, "builder":Landroid/support/v4/app/NotificationCompat$Builder;
    invoke-virtual {p0, v12}, Lcom/belkin/wemo/push/service/PushNotificationIntentService;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Landroid/support/v4/app/NotificationCompat$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 132
    const/4 v8, 0x2

    invoke-static {v8}, Landroid/media/RingtoneManager;->getDefaultUri(I)Landroid/net/Uri;

    move-result-object v0

    .line 133
    .local v0, "alarmSound":Landroid/net/Uri;
    invoke-virtual {v3, v0}, Landroid/support/v4/app/NotificationCompat$Builder;->setSound(Landroid/net/Uri;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 134
    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v9, 0x15

    if-lt v8, v9, :cond_0

    .line 135
    const v8, 0x7f020012

    invoke-virtual {v3, v8}, Landroid/support/v4/app/NotificationCompat$Builder;->setSmallIcon(I)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 140
    :goto_0
    invoke-virtual {p0, v12}, Lcom/belkin/wemo/push/service/PushNotificationIntentService;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 141
    invoke-virtual {v3, v7}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 143
    const/4 v8, 0x1

    invoke-virtual {v3, v8}, Landroid/support/v4/app/NotificationCompat$Builder;->setAutoCancel(Z)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 145
    invoke-virtual {p0}, Lcom/belkin/wemo/push/service/PushNotificationIntentService;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-static {v8, v10}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 147
    .local v2, "bm":Landroid/graphics/Bitmap;
    const/16 v8, 0x18

    invoke-static {v8, p1}, Lcom/belkin/wemo/utils/WeMoUtils;->convertDpToPixels(ILandroid/content/Context;)I

    move-result v1

    .line 148
    .local v1, "bitmapMeasure":I
    invoke-static {v2, v1, v1, v11}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v8

    invoke-virtual {v3, v8}, Landroid/support/v4/app/NotificationCompat$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 149
    const v8, -0xff0100

    const/16 v9, 0x12c

    const/16 v10, 0x3e8

    invoke-virtual {v3, v8, v9, v10}, Landroid/support/v4/app/NotificationCompat$Builder;->setLights(III)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 152
    const/16 v8, 0x32

    invoke-static {v8, p1}, Lcom/belkin/wemo/utils/WeMoUtils;->convertDpToPixels(ILandroid/content/Context;)I

    move-result v5

    .line 153
    .local v5, "largeIconBitmapMeasure":I
    new-instance v8, Landroid/support/v4/app/NotificationCompat$BigTextStyle;

    invoke-direct {v8}, Landroid/support/v4/app/NotificationCompat$BigTextStyle;-><init>()V

    invoke-virtual {v8, v7}, Landroid/support/v4/app/NotificationCompat$BigTextStyle;->bigText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$BigTextStyle;

    move-result-object v8

    invoke-virtual {p0, v12}, Lcom/belkin/wemo/push/service/PushNotificationIntentService;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/support/v4/app/NotificationCompat$BigTextStyle;->setBigContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$BigTextStyle;

    move-result-object v8

    invoke-virtual {v3, v8}, Landroid/support/v4/app/NotificationCompat$Builder;->setStyle(Landroid/support/v4/app/NotificationCompat$Style;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v8

    invoke-static {v2, v5, v5, v11}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/support/v4/app/NotificationCompat$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 158
    new-instance v6, Landroid/content/Intent;

    const-class v8, Lcom/belkin/activity/MainActivity;

    invoke-direct {v6, p0, v8}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 160
    .local v6, "notificationIntent":Landroid/content/Intent;
    const-string v8, "macAddress"

    invoke-virtual {p2}, Lcom/belkin/wemo/push/PushNotificationInfo;->getMac()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v8, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 161
    const-string v8, "eventCode"

    invoke-virtual {p2}, Lcom/belkin/wemo/push/PushNotificationInfo;->getEventCode()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v8, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 163
    const/high16 v8, 0x8000000

    invoke-static {p0, v11, v6, v8}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v4

    .line 165
    .local v4, "contentIntent":Landroid/app/PendingIntent;
    invoke-virtual {v3, v4}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 167
    invoke-virtual {v3}, Landroid/support/v4/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v8

    .line 169
    .end local v0    # "alarmSound":Landroid/net/Uri;
    .end local v1    # "bitmapMeasure":I
    .end local v2    # "bm":Landroid/graphics/Bitmap;
    .end local v3    # "builder":Landroid/support/v4/app/NotificationCompat$Builder;
    .end local v4    # "contentIntent":Landroid/app/PendingIntent;
    .end local v5    # "largeIconBitmapMeasure":I
    .end local v6    # "notificationIntent":Landroid/content/Intent;
    :goto_1
    return-object v8

    .line 137
    .restart local v0    # "alarmSound":Landroid/net/Uri;
    .restart local v3    # "builder":Landroid/support/v4/app/NotificationCompat$Builder;
    :cond_0
    invoke-virtual {v3, v10}, Landroid/support/v4/app/NotificationCompat$Builder;->setSmallIcon(I)Landroid/support/v4/app/NotificationCompat$Builder;

    goto :goto_0

    .line 169
    .end local v0    # "alarmSound":Landroid/net/Uri;
    .end local v3    # "builder":Landroid/support/v4/app/NotificationCompat$Builder;
    :cond_1
    const/4 v8, 0x0

    goto :goto_1
.end method

.method private postNotification(Lcom/belkin/wemo/push/PushNotificationInfo;I)V
    .locals 5
    .param p1, "notificationInfo"    # Lcom/belkin/wemo/push/PushNotificationInfo;
    .param p2, "notifyId"    # I

    .prologue
    .line 113
    invoke-virtual {p0}, Lcom/belkin/wemo/push/service/PushNotificationIntentService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 114
    .local v0, "context":Landroid/content/Context;
    if-eqz v0, :cond_0

    .line 115
    invoke-direct {p0, v0, p1}, Lcom/belkin/wemo/push/service/PushNotificationIntentService;->getWeMoNotification(Landroid/content/Context;Lcom/belkin/wemo/push/PushNotificationInfo;)Landroid/app/Notification;

    move-result-object v2

    .line 116
    .local v2, "pushNotification":Landroid/app/Notification;
    if-eqz v2, :cond_0

    .line 118
    const-string v3, "notification"

    invoke-virtual {p0, v3}, Lcom/belkin/wemo/push/service/PushNotificationIntentService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/NotificationManager;

    .line 119
    .local v1, "manager":Landroid/app/NotificationManager;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/belkin/wemo/push/service/PushNotificationIntentService;->TAG:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3, p2, v2}, Landroid/app/NotificationManager;->notify(Ljava/lang/String;ILandroid/app/Notification;)V

    .line 122
    .end local v1    # "manager":Landroid/app/NotificationManager;
    .end local v2    # "pushNotification":Landroid/app/Notification;
    :cond_0
    return-void
.end method

.method private sendBroadcastTodisplayMessageDialog(Ljava/lang/String;ILjava/lang/String;)V
    .locals 2
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "notifyId"    # I
    .param p3, "eventCode"    # Ljava/lang/String;

    .prologue
    .line 103
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.belkin.wemo.intent.ACTION_DISPLAY_PUSH_MESSAGE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 105
    .local v0, "displayMessageBroadcastIntent":Landroid/content/Intent;
    const-string v1, "push_message"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 106
    const-string v1, "notify_id"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 107
    const-string v1, "event_code"

    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 108
    invoke-virtual {p0, v0}, Lcom/belkin/wemo/push/service/PushNotificationIntentService;->sendBroadcast(Landroid/content/Intent;)V

    .line 109
    return-void
.end method


# virtual methods
.method protected abstract getNotificationMessage(Landroid/content/Intent;)Lcom/belkin/wemo/push/PushNotificationInfo;
.end method

.method protected onHandleIntent(Landroid/content/Intent;)V
    .locals 7
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 52
    iget-object v4, p0, Lcom/belkin/wemo/push/service/PushNotificationIntentService;->TAG:Ljava/lang/String;

    const-string v5, "Push Notificcation: Intent received for posting notification."

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/push/service/PushNotificationIntentService;->getNotificationMessage(Landroid/content/Intent;)Lcom/belkin/wemo/push/PushNotificationInfo;

    move-result-object v2

    .line 56
    .local v2, "messageInfo":Lcom/belkin/wemo/push/PushNotificationInfo;
    if-eqz v2, :cond_2

    .line 57
    iget-object v4, p0, Lcom/belkin/wemo/push/service/PushNotificationIntentService;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "PushNotificationInfo: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v2}, Lcom/belkin/wemo/push/PushNotificationInfo;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    invoke-virtual {v2}, Lcom/belkin/wemo/push/PushNotificationInfo;->getPushNotificationMsg()Ljava/lang/String;

    move-result-object v1

    .line 59
    .local v1, "message":Ljava/lang/String;
    invoke-virtual {v2}, Lcom/belkin/wemo/push/PushNotificationInfo;->getEventCode()Ljava/lang/String;

    move-result-object v0

    .line 60
    .local v0, "eventCode":Ljava/lang/String;
    iget-object v4, p0, Lcom/belkin/wemo/push/service/PushNotificationIntentService;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Push Notification: Message contained in intent (IF NOT NULL THEN TO BE SHOWN IN NOTIFICATION TRAY AND (POSSIBLY) VIA ALERT DIALOG: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 64
    sget v4, Lcom/belkin/wemo/push/service/PushNotificationIntentService;->notifyIdCounter:I

    add-int/lit8 v3, v4, 0x1

    sput v3, Lcom/belkin/wemo/push/service/PushNotificationIntentService;->notifyIdCounter:I

    .line 66
    .local v3, "notifyId":I
    invoke-virtual {v2}, Lcom/belkin/wemo/push/PushNotificationInfo;->isAlertDialogRequired()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 68
    invoke-direct {p0, v1, v3, v0}, Lcom/belkin/wemo/push/service/PushNotificationIntentService;->sendBroadcastTodisplayMessageDialog(Ljava/lang/String;ILjava/lang/String;)V

    .line 70
    :cond_0
    invoke-direct {p0, v2, v3}, Lcom/belkin/wemo/push/service/PushNotificationIntentService;->postNotification(Lcom/belkin/wemo/push/PushNotificationInfo;I)V

    .line 97
    .end local v0    # "eventCode":Ljava/lang/String;
    .end local v1    # "message":Ljava/lang/String;
    .end local v3    # "notifyId":I
    :cond_1
    :goto_0
    invoke-static {p1}, Lcom/belkin/wemo/push/broadcastreceiver/PushMessageBroadcastReceiver;->completeWakefulIntent(Landroid/content/Intent;)Z

    .line 98
    return-void

    .line 73
    :cond_2
    iget-object v4, p0, Lcom/belkin/wemo/push/service/PushNotificationIntentService;->TAG:Ljava/lang/String;

    const-string v5, "Push Notification: PushNotificationInfo is NULL"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
