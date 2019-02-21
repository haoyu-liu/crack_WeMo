.class public Lcom/localytics/android/PushReceiver;
.super Landroid/content/BroadcastReceiver;
.source "PushReceiver.java"


# static fields
.field private static final MAX_RETRIES:I = 0x3

.field private static final RETRY_DELAY:J = 0x1388L

.field private static numRetries:I

.field static retrySenderId:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 12
    const/4 v0, 0x0

    sput-object v0, Lcom/localytics/android/PushReceiver;->retrySenderId:Ljava/lang/String;

    .line 16
    const/4 v0, 0x0

    sput v0, Lcom/localytics/android/PushReceiver;->numRetries:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 22
    invoke-static {p1}, Lcom/localytics/android/DatapointHelper;->getLocalyticsAppKeyOrNull(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 23
    .local v0, "appKey":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 25
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5, v0}, Lcom/localytics/android/Localytics;->integrate(Landroid/content/Context;Ljava/lang/String;)V

    .line 28
    :cond_0
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v5

    const-string v6, "com.google.android.c2dm.intent.REGISTRATION"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 30
    invoke-static {p2}, Lcom/localytics/android/Localytics;->handleRegistration(Landroid/content/Intent;)V

    .line 72
    :cond_1
    :goto_0
    return-void

    .line 34
    :cond_2
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    .line 37
    .local v2, "extras":Landroid/os/Bundle;
    :try_start_0
    const-string v5, "com.google.android.gms.gcm.GoogleCloudMessaging"

    const-string v6, "getInstance"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Class;

    const/4 v8, 0x0

    const-class v9, Landroid/content/Context;

    aput-object v9, v7, v8

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object p1, v8, v9

    invoke-static {v5, v6, v7, v8}, Lcom/localytics/android/ReflectionUtils;->tryInvokeStatic(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 38
    .local v3, "gcm":Ljava/lang/Object;
    if-eqz v3, :cond_1

    .line 40
    const-string v5, "getMessageType"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Class;

    const/4 v7, 0x0

    const-class v8, Landroid/content/Intent;

    aput-object v8, v6, v7

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object p2, v7, v8

    invoke-static {v3, v5, v6, v7}, Lcom/localytics/android/ReflectionUtils;->tryInvokeInstance(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 41
    .local v4, "messageType":Ljava/lang/String;
    invoke-virtual {v2}, Landroid/os/Bundle;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_1

    .line 43
    const-string v5, "com.google.android.gms.gcm.GoogleCloudMessaging"

    const-string v6, "ERROR_SERVICE_NOT_AVAILABLE"

    invoke-static {v5, v6}, Lcom/localytics/android/ReflectionUtils;->tryGetStaticField(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 45
    sget-object v5, Lcom/localytics/android/PushReceiver;->retrySenderId:Ljava/lang/String;

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 47
    sget v5, Lcom/localytics/android/PushReceiver;->numRetries:I

    add-int/lit8 v5, v5, 0x1

    sput v5, Lcom/localytics/android/PushReceiver;->numRetries:I

    .line 48
    sget v5, Lcom/localytics/android/PushReceiver;->numRetries:I

    const/4 v6, 0x3

    if-gt v5, v6, :cond_3

    .line 50
    const-string v5, "GCM registration ERROR_SERVICE_NOT_AVAILABLE. Retrying in 5000 milliseconds."

    invoke-static {v5}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;)I

    .line 51
    sget-object v5, Lcom/localytics/android/PushReceiver;->retrySenderId:Ljava/lang/String;

    const-wide/16 v6, 0x1388

    invoke-static {v5, v6, v7}, Lcom/localytics/android/Localytics;->registerPush(Ljava/lang/String;J)V

    .line 57
    :goto_1
    const/4 v5, 0x0

    sput-object v5, Lcom/localytics/android/PushReceiver;->retrySenderId:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 67
    .end local v3    # "gcm":Ljava/lang/Object;
    .end local v4    # "messageType":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 69
    .local v1, "e":Ljava/lang/Exception;
    const-string v5, "Something went wrong with GCM"

    invoke-static {v5, v1}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 55
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v3    # "gcm":Ljava/lang/Object;
    .restart local v4    # "messageType":Ljava/lang/String;
    :cond_3
    const/4 v5, 0x0

    :try_start_1
    sput v5, Lcom/localytics/android/PushReceiver;->numRetries:I

    goto :goto_1

    .line 60
    :cond_4
    const-string v5, "com.google.android.gms.gcm.GoogleCloudMessaging"

    const-string v6, "MESSAGE_TYPE_MESSAGE"

    invoke-static {v5, v6}, Lcom/localytics/android/ReflectionUtils;->tryGetStaticField(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 62
    invoke-static {p2}, Lcom/localytics/android/Localytics;->handleNotificationReceived(Landroid/content/Intent;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0
.end method
