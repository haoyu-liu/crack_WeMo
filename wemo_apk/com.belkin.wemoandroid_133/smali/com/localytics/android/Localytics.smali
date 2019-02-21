.class public Lcom/localytics/android/Localytics;
.super Ljava/lang/Object;
.source "Localytics.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/localytics/android/Localytics$Log;,
        Lcom/localytics/android/Localytics$ProfileScope;,
        Lcom/localytics/android/Localytics$InAppMessageDismissButtonLocation;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1232
    return-void
.end method

.method public static addAnalyticsListener(Lcom/localytics/android/AnalyticsListener;)V
    .locals 1
    .param p0, "listener"    # Lcom/localytics/android/AnalyticsListener;

    .prologue
    .line 361
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/localytics/android/LocalyticsManager;->addAnalyticsListener(Lcom/localytics/android/AnalyticsListener;)V

    .line 362
    return-void
.end method

.method public static addMessagingListener(Lcom/localytics/android/MessagingListener;)V
    .locals 1
    .param p0, "listener"    # Lcom/localytics/android/MessagingListener;

    .prologue
    .line 994
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/localytics/android/LocalyticsManager;->addMessagingListener(Lcom/localytics/android/MessagingListener;)V

    .line 995
    return-void
.end method

.method public static addProfileAttributesToSet(Ljava/lang/String;[J)V
    .locals 1
    .param p0, "attributeName"    # Ljava/lang/String;
    .param p1, "attributeValue"    # [J

    .prologue
    .line 536
    sget-object v0, Lcom/localytics/android/Localytics$ProfileScope;->APPLICATION:Lcom/localytics/android/Localytics$ProfileScope;

    invoke-static {p0, p1, v0}, Lcom/localytics/android/Localytics;->addProfileAttributesToSet(Ljava/lang/String;[JLcom/localytics/android/Localytics$ProfileScope;)V

    .line 537
    return-void
.end method

.method public static addProfileAttributesToSet(Ljava/lang/String;[JLcom/localytics/android/Localytics$ProfileScope;)V
    .locals 1
    .param p0, "attributeName"    # Ljava/lang/String;
    .param p1, "attributeValue"    # [J
    .param p2, "scope"    # Lcom/localytics/android/Localytics$ProfileScope;

    .prologue
    .line 525
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2}, Lcom/localytics/android/LocalyticsManager;->addProfileAttributesToSet(Ljava/lang/String;[JLcom/localytics/android/Localytics$ProfileScope;)V

    .line 526
    return-void
.end method

.method public static addProfileAttributesToSet(Ljava/lang/String;[Ljava/lang/String;)V
    .locals 1
    .param p0, "attributeName"    # Ljava/lang/String;
    .param p1, "attributeValue"    # [Ljava/lang/String;

    .prologue
    .line 559
    sget-object v0, Lcom/localytics/android/Localytics$ProfileScope;->APPLICATION:Lcom/localytics/android/Localytics$ProfileScope;

    invoke-static {p0, p1, v0}, Lcom/localytics/android/Localytics;->addProfileAttributesToSet(Ljava/lang/String;[Ljava/lang/String;Lcom/localytics/android/Localytics$ProfileScope;)V

    .line 560
    return-void
.end method

.method public static addProfileAttributesToSet(Ljava/lang/String;[Ljava/lang/String;Lcom/localytics/android/Localytics$ProfileScope;)V
    .locals 1
    .param p0, "attributeName"    # Ljava/lang/String;
    .param p1, "attributeValue"    # [Ljava/lang/String;
    .param p2, "scope"    # Lcom/localytics/android/Localytics$ProfileScope;

    .prologue
    .line 548
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2}, Lcom/localytics/android/LocalyticsManager;->addProfileAttributesToSet(Ljava/lang/String;[Ljava/lang/String;Lcom/localytics/android/Localytics$ProfileScope;)V

    .line 549
    return-void
.end method

.method public static addProfileAttributesToSet(Ljava/lang/String;[Ljava/util/Date;)V
    .locals 1
    .param p0, "attributeName"    # Ljava/lang/String;
    .param p1, "attributeValue"    # [Ljava/util/Date;

    .prologue
    .line 582
    sget-object v0, Lcom/localytics/android/Localytics$ProfileScope;->APPLICATION:Lcom/localytics/android/Localytics$ProfileScope;

    invoke-static {p0, p1, v0}, Lcom/localytics/android/Localytics;->addProfileAttributesToSet(Ljava/lang/String;[Ljava/util/Date;Lcom/localytics/android/Localytics$ProfileScope;)V

    .line 583
    return-void
.end method

.method public static addProfileAttributesToSet(Ljava/lang/String;[Ljava/util/Date;Lcom/localytics/android/Localytics$ProfileScope;)V
    .locals 1
    .param p0, "attributeName"    # Ljava/lang/String;
    .param p1, "attributeValue"    # [Ljava/util/Date;
    .param p2, "scope"    # Lcom/localytics/android/Localytics$ProfileScope;

    .prologue
    .line 571
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2}, Lcom/localytics/android/LocalyticsManager;->addProfileAttributesToSet(Ljava/lang/String;[Ljava/util/Date;Lcom/localytics/android/Localytics$ProfileScope;)V

    .line 572
    return-void
.end method

.method public static clearInAppMessageDisplayActivity()V
    .locals 1

    .prologue
    .line 792
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/localytics/android/LocalyticsManager;->clearInAppMessageDisplayActivity()V

    .line 793
    return-void
.end method

.method public static closeSession()V
    .locals 1

    .prologue
    .line 236
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/localytics/android/LocalyticsManager;->closeSession()V

    .line 237
    return-void
.end method

.method static decrementActivityCounter()V
    .locals 1

    .prologue
    .line 173
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/localytics/android/LocalyticsManager;->decrementActivityCounter()V

    .line 174
    return-void
.end method

.method public static decrementProfileAttribute(Ljava/lang/String;J)V
    .locals 1
    .param p0, "attributeName"    # Ljava/lang/String;
    .param p1, "decrementValue"    # J

    .prologue
    .line 698
    sget-object v0, Lcom/localytics/android/Localytics$ProfileScope;->APPLICATION:Lcom/localytics/android/Localytics$ProfileScope;

    invoke-static {p0, p1, p2, v0}, Lcom/localytics/android/Localytics;->decrementProfileAttribute(Ljava/lang/String;JLcom/localytics/android/Localytics$ProfileScope;)V

    .line 699
    return-void
.end method

.method public static decrementProfileAttribute(Ljava/lang/String;JLcom/localytics/android/Localytics$ProfileScope;)V
    .locals 5
    .param p0, "attributeName"    # Ljava/lang/String;
    .param p1, "decrementValue"    # J
    .param p3, "scope"    # Lcom/localytics/android/Localytics$ProfileScope;

    .prologue
    .line 687
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    const-wide/16 v2, -0x1

    mul-long/2addr v2, p1

    invoke-virtual {v0, p0, v2, v3, p3}, Lcom/localytics/android/LocalyticsManager;->incrementProfileAttribute(Ljava/lang/String;JLcom/localytics/android/Localytics$ProfileScope;)V

    .line 688
    return-void
.end method

.method public static deleteProfileAttribute(Ljava/lang/String;)V
    .locals 1
    .param p0, "attributeName"    # Ljava/lang/String;

    .prologue
    .line 719
    sget-object v0, Lcom/localytics/android/Localytics$ProfileScope;->APPLICATION:Lcom/localytics/android/Localytics$ProfileScope;

    invoke-static {p0, v0}, Lcom/localytics/android/Localytics;->deleteProfileAttribute(Ljava/lang/String;Lcom/localytics/android/Localytics$ProfileScope;)V

    .line 720
    return-void
.end method

.method public static deleteProfileAttribute(Ljava/lang/String;Lcom/localytics/android/Localytics$ProfileScope;)V
    .locals 1
    .param p0, "attributeName"    # Ljava/lang/String;
    .param p1, "scope"    # Lcom/localytics/android/Localytics$ProfileScope;

    .prologue
    .line 709
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/localytics/android/LocalyticsManager;->deleteProfileAttribute(Ljava/lang/String;Lcom/localytics/android/Localytics$ProfileScope;)V

    .line 710
    return-void
.end method

.method public static dismissCurrentInAppMessage()V
    .locals 1

    .prologue
    .line 821
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/localytics/android/LocalyticsManager;->dismissCurrentInAppMessage()V

    .line 822
    return-void
.end method

.method public static getAnalyticsHost()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1174
    sget-object v0, Lcom/localytics/android/Constants;->ANALYTICS_HOST:Ljava/lang/String;

    return-object v0
.end method

.method public static getAppKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1131
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/localytics/android/LocalyticsManager;->getAppKey()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getCustomDimension(I)Ljava/lang/String;
    .locals 1
    .param p0, "dimension"    # I

    .prologue
    .line 343
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/localytics/android/LocalyticsManager;->getCustomDimension(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getCustomerId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1042
    const-string v0, "customer_id"

    invoke-static {v0}, Lcom/localytics/android/Localytics;->getIdentifier(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getIdentifier(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "key"    # Ljava/lang/String;

    .prologue
    .line 1054
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/localytics/android/LocalyticsManager;->getIdentifier(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getInAppMessageDismissButtonLocation()Lcom/localytics/android/Localytics$InAppMessageDismissButtonLocation;
    .locals 1

    .prologue
    .line 1163
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/localytics/android/LocalyticsManager;->getInAppMessageDismissButtonLocation()Lcom/localytics/android/Localytics$InAppMessageDismissButtonLocation;

    move-result-object v0

    return-object v0
.end method

.method public static getInstallId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1121
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/localytics/android/LocalyticsManager;->getInstallationId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getLibraryVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1141
    const-string v0, "androida_3.4.0"

    return-object v0
.end method

.method public static getMessagingHost()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1196
    sget-object v0, Lcom/localytics/android/Constants;->MARKETING_HOST:Ljava/lang/String;

    return-object v0
.end method

.method public static getProfilesHost()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1218
    sget-object v0, Lcom/localytics/android/Constants;->PROFILES_HOST:Ljava/lang/String;

    return-object v0
.end method

.method public static getPushRegistrationId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 850
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/localytics/android/LocalyticsManager;->getPushRegistrationId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getSessionTimeoutInterval()J
    .locals 4

    .prologue
    .line 1111
    sget-wide v0, Lcom/localytics/android/Constants;->SESSION_EXPIRATION:J

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    return-wide v0
.end method

.method static handleNotificationReceived(Landroid/content/Intent;)V
    .locals 1
    .param p0, "intent"    # Landroid/content/Intent;

    .prologue
    .line 915
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/localytics/android/LocalyticsManager;->handleNotificationReceived(Landroid/content/Intent;)V

    .line 916
    return-void
.end method

.method public static handlePushNotificationOpened(Landroid/content/Intent;)V
    .locals 1
    .param p0, "intent"    # Landroid/content/Intent;

    .prologue
    .line 894
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/localytics/android/LocalyticsManager;->handlePushNotificationOpened(Landroid/content/Intent;)V

    .line 895
    return-void
.end method

.method static handleRegistration(Landroid/content/Intent;)V
    .locals 1
    .param p0, "intent"    # Landroid/content/Intent;

    .prologue
    .line 904
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/localytics/android/LocalyticsManager;->handleRegistration(Landroid/content/Intent;)V

    .line 905
    return-void
.end method

.method public static handleTestMode(Landroid/content/Intent;)V
    .locals 1
    .param p0, "intent"    # Landroid/content/Intent;

    .prologue
    .line 929
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/localytics/android/LocalyticsManager;->handleTestMode(Landroid/content/Intent;)V

    .line 930
    return-void
.end method

.method static incrementActivityCounter()V
    .locals 1

    .prologue
    .line 162
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/localytics/android/LocalyticsManager;->incrementActivityCounter()V

    .line 163
    return-void
.end method

.method public static incrementProfileAttribute(Ljava/lang/String;J)V
    .locals 1
    .param p0, "attributeName"    # Ljava/lang/String;
    .param p1, "incrementValue"    # J

    .prologue
    .line 675
    sget-object v0, Lcom/localytics/android/Localytics$ProfileScope;->APPLICATION:Lcom/localytics/android/Localytics$ProfileScope;

    invoke-static {p0, p1, p2, v0}, Lcom/localytics/android/Localytics;->incrementProfileAttribute(Ljava/lang/String;JLcom/localytics/android/Localytics$ProfileScope;)V

    .line 676
    return-void
.end method

.method public static incrementProfileAttribute(Ljava/lang/String;JLcom/localytics/android/Localytics$ProfileScope;)V
    .locals 1
    .param p0, "attributeName"    # Ljava/lang/String;
    .param p1, "incrementValue"    # J
    .param p3, "scope"    # Lcom/localytics/android/Localytics$ProfileScope;

    .prologue
    .line 664
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/localytics/android/LocalyticsManager;->incrementProfileAttribute(Ljava/lang/String;JLcom/localytics/android/Localytics$ProfileScope;)V

    .line 665
    return-void
.end method

.method public static integrate(Landroid/content/Context;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 86
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/localytics/android/Localytics;->integrate(Landroid/content/Context;Ljava/lang/String;)V

    .line 87
    return-void
.end method

.method public static integrate(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "localyticsKey"    # Ljava/lang/String;

    .prologue
    .line 100
    if-nez p0, :cond_0

    .line 102
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "context cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 105
    :cond_0
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/localytics/android/LocalyticsManager;->integrate(Landroid/content/Context;Ljava/lang/String;)V

    .line 106
    return-void
.end method

.method static isAppInForeground()Z
    .locals 1

    .prologue
    .line 151
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/localytics/android/LocalyticsManager;->isAppInForeground()Z

    move-result v0

    return v0
.end method

.method static isAutoIntegrate()Z
    .locals 1

    .prologue
    .line 128
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/localytics/android/LocalyticsManager;->isAutoIntegrate()Z

    move-result v0

    return v0
.end method

.method public static isLoggingEnabled()Z
    .locals 1

    .prologue
    .line 1089
    sget-boolean v0, Lcom/localytics/android/Constants;->IS_LOGGING_ENABLED:Z

    return v0
.end method

.method public static isOptedOut()Z
    .locals 1

    .prologue
    .line 207
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/localytics/android/LocalyticsManager;->isOptedOut()Z

    move-result v0

    return v0
.end method

.method public static isPushDisabled()Z
    .locals 1

    .prologue
    .line 884
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/localytics/android/LocalyticsManager;->isPushDisabled()Z

    move-result v0

    return v0
.end method

.method public static isTestModeEnabled()Z
    .locals 1

    .prologue
    .line 954
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/localytics/android/LocalyticsManager;->isTestModeEnabled()Z

    move-result v0

    return v0
.end method

.method public static openSession()V
    .locals 1

    .prologue
    .line 224
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/localytics/android/LocalyticsManager;->openSession()V

    .line 225
    return-void
.end method

.method public static registerPush(Ljava/lang/String;)V
    .locals 1
    .param p0, "senderId"    # Ljava/lang/String;

    .prologue
    .line 831
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/localytics/android/LocalyticsManager;->registerPush(Ljava/lang/String;)V

    .line 832
    return-void
.end method

.method static registerPush(Ljava/lang/String;J)V
    .locals 1
    .param p0, "senderId"    # Ljava/lang/String;
    .param p1, "delay"    # J

    .prologue
    .line 842
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2}, Lcom/localytics/android/LocalyticsManager;->registerPush(Ljava/lang/String;J)V

    .line 843
    return-void
.end method

.method public static removeAnalyticsListener(Lcom/localytics/android/AnalyticsListener;)V
    .locals 1
    .param p0, "listener"    # Lcom/localytics/android/AnalyticsListener;

    .prologue
    .line 372
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/localytics/android/LocalyticsManager;->removeAnalyticsListener(Lcom/localytics/android/AnalyticsListener;)V

    .line 373
    return-void
.end method

.method public static removeMessagingListener(Lcom/localytics/android/MessagingListener;)V
    .locals 1
    .param p0, "listener"    # Lcom/localytics/android/MessagingListener;

    .prologue
    .line 1005
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/localytics/android/LocalyticsManager;->removeMessagingListener(Lcom/localytics/android/MessagingListener;)V

    .line 1006
    return-void
.end method

.method public static removeProfileAttributesFromSet(Ljava/lang/String;[J)V
    .locals 1
    .param p0, "attributeName"    # Ljava/lang/String;
    .param p1, "attributeValue"    # [J

    .prologue
    .line 606
    sget-object v0, Lcom/localytics/android/Localytics$ProfileScope;->APPLICATION:Lcom/localytics/android/Localytics$ProfileScope;

    invoke-static {p0, p1, v0}, Lcom/localytics/android/Localytics;->removeProfileAttributesFromSet(Ljava/lang/String;[JLcom/localytics/android/Localytics$ProfileScope;)V

    .line 607
    return-void
.end method

.method public static removeProfileAttributesFromSet(Ljava/lang/String;[JLcom/localytics/android/Localytics$ProfileScope;)V
    .locals 1
    .param p0, "attributeName"    # Ljava/lang/String;
    .param p1, "attributeValue"    # [J
    .param p2, "scope"    # Lcom/localytics/android/Localytics$ProfileScope;

    .prologue
    .line 594
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2}, Lcom/localytics/android/LocalyticsManager;->removeProfileAttributesFromSet(Ljava/lang/String;[JLcom/localytics/android/Localytics$ProfileScope;)V

    .line 595
    return-void
.end method

.method public static removeProfileAttributesFromSet(Ljava/lang/String;[Ljava/lang/String;)V
    .locals 1
    .param p0, "attributeName"    # Ljava/lang/String;
    .param p1, "attributeValue"    # [Ljava/lang/String;

    .prologue
    .line 629
    sget-object v0, Lcom/localytics/android/Localytics$ProfileScope;->APPLICATION:Lcom/localytics/android/Localytics$ProfileScope;

    invoke-static {p0, p1, v0}, Lcom/localytics/android/Localytics;->removeProfileAttributesFromSet(Ljava/lang/String;[Ljava/lang/String;Lcom/localytics/android/Localytics$ProfileScope;)V

    .line 630
    return-void
.end method

.method public static removeProfileAttributesFromSet(Ljava/lang/String;[Ljava/lang/String;Lcom/localytics/android/Localytics$ProfileScope;)V
    .locals 1
    .param p0, "attributeName"    # Ljava/lang/String;
    .param p1, "attributeValue"    # [Ljava/lang/String;
    .param p2, "scope"    # Lcom/localytics/android/Localytics$ProfileScope;

    .prologue
    .line 618
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2}, Lcom/localytics/android/LocalyticsManager;->removeProfileAttributesFromSet(Ljava/lang/String;[Ljava/lang/String;Lcom/localytics/android/Localytics$ProfileScope;)V

    .line 619
    return-void
.end method

.method public static removeProfileAttributesFromSet(Ljava/lang/String;[Ljava/util/Date;)V
    .locals 1
    .param p0, "attributeName"    # Ljava/lang/String;
    .param p1, "attributeValue"    # [Ljava/util/Date;

    .prologue
    .line 652
    sget-object v0, Lcom/localytics/android/Localytics$ProfileScope;->APPLICATION:Lcom/localytics/android/Localytics$ProfileScope;

    invoke-static {p0, p1, v0}, Lcom/localytics/android/Localytics;->removeProfileAttributesFromSet(Ljava/lang/String;[Ljava/util/Date;Lcom/localytics/android/Localytics$ProfileScope;)V

    .line 653
    return-void
.end method

.method public static removeProfileAttributesFromSet(Ljava/lang/String;[Ljava/util/Date;Lcom/localytics/android/Localytics$ProfileScope;)V
    .locals 1
    .param p0, "attributeName"    # Ljava/lang/String;
    .param p1, "attributeValue"    # [Ljava/util/Date;
    .param p2, "scope"    # Lcom/localytics/android/Localytics$ProfileScope;

    .prologue
    .line 641
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2}, Lcom/localytics/android/LocalyticsManager;->removeProfileAttributesFromSet(Ljava/lang/String;[Ljava/util/Date;Lcom/localytics/android/Localytics$ProfileScope;)V

    .line 642
    return-void
.end method

.method public static setAnalyticsHost(Ljava/lang/String;)V
    .locals 0
    .param p0, "host"    # Ljava/lang/String;

    .prologue
    .line 1185
    sput-object p0, Lcom/localytics/android/Constants;->ANALYTICS_HOST:Ljava/lang/String;

    .line 1186
    return-void
.end method

.method public static setCustomDimension(ILjava/lang/String;)V
    .locals 1
    .param p0, "dimension"    # I
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 331
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/localytics/android/LocalyticsManager;->setCustomDimension(ILjava/lang/String;)V

    .line 332
    return-void
.end method

.method public static setCustomerEmail(Ljava/lang/String;)V
    .locals 1
    .param p0, "email"    # Ljava/lang/String;

    .prologue
    .line 729
    const-string v0, "email"

    invoke-static {v0, p0}, Lcom/localytics/android/Localytics;->setSpecialCustomerIdentifierAndAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 730
    return-void
.end method

.method public static setCustomerFirstName(Ljava/lang/String;)V
    .locals 1
    .param p0, "firstName"    # Ljava/lang/String;

    .prologue
    .line 739
    const-string v0, "first_name"

    invoke-static {v0, p0}, Lcom/localytics/android/Localytics;->setSpecialCustomerIdentifierAndAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 740
    return-void
.end method

.method public static setCustomerFullName(Ljava/lang/String;)V
    .locals 1
    .param p0, "fullName"    # Ljava/lang/String;

    .prologue
    .line 759
    const-string v0, "full_name"

    invoke-static {v0, p0}, Lcom/localytics/android/Localytics;->setSpecialCustomerIdentifierAndAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 760
    return-void
.end method

.method public static setCustomerId(Ljava/lang/String;)V
    .locals 1
    .param p0, "customerId"    # Ljava/lang/String;

    .prologue
    .line 1032
    const-string v0, "customer_id"

    invoke-static {v0, p0}, Lcom/localytics/android/Localytics;->setIdentifier(Ljava/lang/String;Ljava/lang/String;)V

    .line 1033
    return-void
.end method

.method public static setCustomerLastName(Ljava/lang/String;)V
    .locals 1
    .param p0, "lastName"    # Ljava/lang/String;

    .prologue
    .line 749
    const-string v0, "last_name"

    invoke-static {v0, p0}, Lcom/localytics/android/Localytics;->setSpecialCustomerIdentifierAndAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 750
    return-void
.end method

.method public static setIdentifier(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 1021
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/localytics/android/LocalyticsManager;->setIdentifier(Ljava/lang/String;Ljava/lang/String;)V

    .line 1022
    return-void
.end method

.method public static setInAppMessageDismissButtonImage(Landroid/content/res/Resources;I)V
    .locals 1
    .param p0, "resources"    # Landroid/content/res/Resources;
    .param p1, "id"    # I

    .prologue
    .line 965
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/localytics/android/LocalyticsManager;->setInAppMessageDismissButtonImage(Landroid/content/res/Resources;I)V

    .line 966
    return-void
.end method

.method public static setInAppMessageDismissButtonImage(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
    .locals 1
    .param p0, "resources"    # Landroid/content/res/Resources;
    .param p1, "image"    # Landroid/graphics/Bitmap;

    .prologue
    .line 976
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/localytics/android/LocalyticsManager;->setInAppMessageDismissButtonImage(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    .line 977
    return-void
.end method

.method public static setInAppMessageDismissButtonLocation(Lcom/localytics/android/Localytics$InAppMessageDismissButtonLocation;)V
    .locals 1
    .param p0, "buttonLocation"    # Lcom/localytics/android/Localytics$InAppMessageDismissButtonLocation;

    .prologue
    .line 1152
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/localytics/android/LocalyticsManager;->setInAppMessageDismissButtonLocation(Lcom/localytics/android/Localytics$InAppMessageDismissButtonLocation;)V

    .line 1153
    return-void
.end method

.method public static setInAppMessageDisplayActivity(Landroid/support/v4/app/FragmentActivity;)V
    .locals 1
    .param p0, "activity"    # Landroid/support/v4/app/FragmentActivity;

    .prologue
    .line 782
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/localytics/android/LocalyticsManager;->setInAppMessageDisplayActivity(Landroid/support/v4/app/FragmentActivity;)V

    .line 783
    return-void
.end method

.method static setIsAutoIntegrate(Z)V
    .locals 1
    .param p0, "autoIntegrate"    # Z

    .prologue
    .line 139
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/localytics/android/LocalyticsManager;->setIsAutoIntegrate(Z)V

    .line 140
    return-void
.end method

.method public static setLocation(Landroid/location/Location;)V
    .locals 1
    .param p0, "location"    # Landroid/location/Location;

    .prologue
    .line 1064
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/localytics/android/LocalyticsManager;->setLocation(Landroid/location/Location;)V

    .line 1065
    return-void
.end method

.method public static setLoggingEnabled(Z)V
    .locals 0
    .param p0, "enabled"    # Z

    .prologue
    .line 1078
    sput-boolean p0, Lcom/localytics/android/Constants;->IS_LOGGING_ENABLED:Z

    .line 1079
    return-void
.end method

.method public static setMessagingHost(Ljava/lang/String;)V
    .locals 0
    .param p0, "host"    # Ljava/lang/String;

    .prologue
    .line 1207
    sput-object p0, Lcom/localytics/android/Constants;->MARKETING_HOST:Ljava/lang/String;

    .line 1208
    return-void
.end method

.method public static setOptedOut(Z)V
    .locals 1
    .param p0, "newOptOut"    # Z

    .prologue
    .line 196
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/localytics/android/LocalyticsManager;->setOptedOut(Z)V

    .line 197
    return-void
.end method

.method public static setProfileAttribute(Ljava/lang/String;J)V
    .locals 1
    .param p0, "attributeName"    # Ljava/lang/String;
    .param p1, "attributeValue"    # J

    .prologue
    .line 398
    sget-object v0, Lcom/localytics/android/Localytics$ProfileScope;->APPLICATION:Lcom/localytics/android/Localytics$ProfileScope;

    invoke-static {p0, p1, p2, v0}, Lcom/localytics/android/Localytics;->setProfileAttribute(Ljava/lang/String;JLcom/localytics/android/Localytics$ProfileScope;)V

    .line 399
    return-void
.end method

.method public static setProfileAttribute(Ljava/lang/String;JLcom/localytics/android/Localytics$ProfileScope;)V
    .locals 1
    .param p0, "attributeName"    # Ljava/lang/String;
    .param p1, "attributeValue"    # J
    .param p3, "scope"    # Lcom/localytics/android/Localytics$ProfileScope;

    .prologue
    .line 387
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/localytics/android/LocalyticsManager;->setProfileAttribute(Ljava/lang/String;JLcom/localytics/android/Localytics$ProfileScope;)V

    .line 388
    return-void
.end method

.method public static setProfileAttribute(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p0, "attributeName"    # Ljava/lang/String;
    .param p1, "attributeValue"    # Ljava/lang/String;

    .prologue
    .line 444
    sget-object v0, Lcom/localytics/android/Localytics$ProfileScope;->APPLICATION:Lcom/localytics/android/Localytics$ProfileScope;

    invoke-static {p0, p1, v0}, Lcom/localytics/android/Localytics;->setProfileAttribute(Ljava/lang/String;Ljava/lang/String;Lcom/localytics/android/Localytics$ProfileScope;)V

    .line 445
    return-void
.end method

.method public static setProfileAttribute(Ljava/lang/String;Ljava/lang/String;Lcom/localytics/android/Localytics$ProfileScope;)V
    .locals 1
    .param p0, "attributeName"    # Ljava/lang/String;
    .param p1, "attributeValue"    # Ljava/lang/String;
    .param p2, "scope"    # Lcom/localytics/android/Localytics$ProfileScope;

    .prologue
    .line 433
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2}, Lcom/localytics/android/LocalyticsManager;->setProfileAttribute(Ljava/lang/String;Ljava/lang/String;Lcom/localytics/android/Localytics$ProfileScope;)V

    .line 434
    return-void
.end method

.method public static setProfileAttribute(Ljava/lang/String;Ljava/util/Date;)V
    .locals 1
    .param p0, "attributeName"    # Ljava/lang/String;
    .param p1, "attributeValue"    # Ljava/util/Date;

    .prologue
    .line 490
    sget-object v0, Lcom/localytics/android/Localytics$ProfileScope;->APPLICATION:Lcom/localytics/android/Localytics$ProfileScope;

    invoke-static {p0, p1, v0}, Lcom/localytics/android/Localytics;->setProfileAttribute(Ljava/lang/String;Ljava/util/Date;Lcom/localytics/android/Localytics$ProfileScope;)V

    .line 491
    return-void
.end method

.method public static setProfileAttribute(Ljava/lang/String;Ljava/util/Date;Lcom/localytics/android/Localytics$ProfileScope;)V
    .locals 1
    .param p0, "attributeName"    # Ljava/lang/String;
    .param p1, "attributeValue"    # Ljava/util/Date;
    .param p2, "scope"    # Lcom/localytics/android/Localytics$ProfileScope;

    .prologue
    .line 479
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2}, Lcom/localytics/android/LocalyticsManager;->setProfileAttribute(Ljava/lang/String;Ljava/util/Date;Lcom/localytics/android/Localytics$ProfileScope;)V

    .line 480
    return-void
.end method

.method public static setProfileAttribute(Ljava/lang/String;[J)V
    .locals 1
    .param p0, "attributeName"    # Ljava/lang/String;
    .param p1, "attributeValue"    # [J

    .prologue
    .line 421
    sget-object v0, Lcom/localytics/android/Localytics$ProfileScope;->APPLICATION:Lcom/localytics/android/Localytics$ProfileScope;

    invoke-static {p0, p1, v0}, Lcom/localytics/android/Localytics;->setProfileAttribute(Ljava/lang/String;[JLcom/localytics/android/Localytics$ProfileScope;)V

    .line 422
    return-void
.end method

.method public static setProfileAttribute(Ljava/lang/String;[JLcom/localytics/android/Localytics$ProfileScope;)V
    .locals 1
    .param p0, "attributeName"    # Ljava/lang/String;
    .param p1, "attributeValue"    # [J
    .param p2, "scope"    # Lcom/localytics/android/Localytics$ProfileScope;

    .prologue
    .line 410
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2}, Lcom/localytics/android/LocalyticsManager;->setProfileAttribute(Ljava/lang/String;[JLcom/localytics/android/Localytics$ProfileScope;)V

    .line 411
    return-void
.end method

.method public static setProfileAttribute(Ljava/lang/String;[Ljava/lang/String;)V
    .locals 1
    .param p0, "attributeName"    # Ljava/lang/String;
    .param p1, "attributeValue"    # [Ljava/lang/String;

    .prologue
    .line 467
    sget-object v0, Lcom/localytics/android/Localytics$ProfileScope;->APPLICATION:Lcom/localytics/android/Localytics$ProfileScope;

    invoke-static {p0, p1, v0}, Lcom/localytics/android/Localytics;->setProfileAttribute(Ljava/lang/String;[Ljava/lang/String;Lcom/localytics/android/Localytics$ProfileScope;)V

    .line 468
    return-void
.end method

.method public static setProfileAttribute(Ljava/lang/String;[Ljava/lang/String;Lcom/localytics/android/Localytics$ProfileScope;)V
    .locals 1
    .param p0, "attributeName"    # Ljava/lang/String;
    .param p1, "attributeValue"    # [Ljava/lang/String;
    .param p2, "scope"    # Lcom/localytics/android/Localytics$ProfileScope;

    .prologue
    .line 456
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2}, Lcom/localytics/android/LocalyticsManager;->setProfileAttribute(Ljava/lang/String;[Ljava/lang/String;Lcom/localytics/android/Localytics$ProfileScope;)V

    .line 457
    return-void
.end method

.method public static setProfileAttribute(Ljava/lang/String;[Ljava/util/Date;)V
    .locals 1
    .param p0, "attributeName"    # Ljava/lang/String;
    .param p1, "attributeValue"    # [Ljava/util/Date;

    .prologue
    .line 513
    sget-object v0, Lcom/localytics/android/Localytics$ProfileScope;->APPLICATION:Lcom/localytics/android/Localytics$ProfileScope;

    invoke-static {p0, p1, v0}, Lcom/localytics/android/Localytics;->setProfileAttribute(Ljava/lang/String;[Ljava/util/Date;Lcom/localytics/android/Localytics$ProfileScope;)V

    .line 514
    return-void
.end method

.method public static setProfileAttribute(Ljava/lang/String;[Ljava/util/Date;Lcom/localytics/android/Localytics$ProfileScope;)V
    .locals 1
    .param p0, "attributeName"    # Ljava/lang/String;
    .param p1, "attributeValue"    # [Ljava/util/Date;
    .param p2, "scope"    # Lcom/localytics/android/Localytics$ProfileScope;

    .prologue
    .line 502
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2}, Lcom/localytics/android/LocalyticsManager;->setProfileAttribute(Ljava/lang/String;[Ljava/util/Date;Lcom/localytics/android/Localytics$ProfileScope;)V

    .line 503
    return-void
.end method

.method public static setProfilesHost(Ljava/lang/String;)V
    .locals 0
    .param p0, "host"    # Ljava/lang/String;

    .prologue
    .line 1229
    sput-object p0, Lcom/localytics/android/Constants;->PROFILES_HOST:Ljava/lang/String;

    .line 1230
    return-void
.end method

.method public static setPushDisabled(Z)V
    .locals 1
    .param p0, "disable"    # Z

    .prologue
    .line 873
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/localytics/android/LocalyticsManager;->setPushDisabled(Z)V

    .line 874
    return-void
.end method

.method public static setPushRegistrationId(Ljava/lang/String;)V
    .locals 1
    .param p0, "registrationId"    # Ljava/lang/String;

    .prologue
    .line 860
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/localytics/android/LocalyticsManager;->setPushRegistrationId(Ljava/lang/String;)V

    .line 861
    return-void
.end method

.method public static setSessionTimeoutInterval(J)V
    .locals 2
    .param p0, "seconds"    # J

    .prologue
    .line 1100
    const-wide/16 v0, 0x3e8

    mul-long/2addr v0, p0

    sput-wide v0, Lcom/localytics/android/Constants;->SESSION_EXPIRATION:J

    .line 1101
    return-void
.end method

.method private static setSpecialCustomerIdentifierAndAttribute(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 764
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "$"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/localytics/android/Localytics$ProfileScope;->ORGANIZATION:Lcom/localytics/android/Localytics$ProfileScope;

    invoke-static {v0, p1, v1}, Lcom/localytics/android/Localytics;->setProfileAttribute(Ljava/lang/String;Ljava/lang/String;Lcom/localytics/android/Localytics$ProfileScope;)V

    .line 765
    invoke-static {p0, p1}, Lcom/localytics/android/Localytics;->setIdentifier(Ljava/lang/String;Ljava/lang/String;)V

    .line 766
    return-void
.end method

.method public static setTestModeEnabled(Z)V
    .locals 1
    .param p0, "enabled"    # Z

    .prologue
    .line 943
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/localytics/android/LocalyticsManager;->setTestModeEnabled(Z)V

    .line 944
    return-void
.end method

.method public static tagEvent(Ljava/lang/String;)V
    .locals 4
    .param p0, "eventName"    # Ljava/lang/String;

    .prologue
    .line 249
    const/4 v0, 0x0

    const-wide/16 v2, 0x0

    invoke-static {p0, v0, v2, v3}, Lcom/localytics/android/Localytics;->tagEvent(Ljava/lang/String;Ljava/util/Map;J)V

    .line 250
    return-void
.end method

.method public static tagEvent(Ljava/lang/String;Ljava/util/Map;)V
    .locals 2
    .param p0, "eventName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 266
    .local p1, "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-wide/16 v0, 0x0

    invoke-static {p0, p1, v0, v1}, Lcom/localytics/android/Localytics;->tagEvent(Ljava/lang/String;Ljava/util/Map;J)V

    .line 267
    return-void
.end method

.method public static tagEvent(Ljava/lang/String;Ljava/util/Map;J)V
    .locals 2
    .param p0, "eventName"    # Ljava/lang/String;
    .param p2, "customerValueIncrease"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;J)V"
        }
    .end annotation

    .prologue
    .line 298
    .local p1, "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/localytics/android/LocalyticsManager;->tagEvent(Ljava/lang/String;Ljava/util/Map;J)V

    .line 299
    return-void
.end method

.method public static tagScreen(Ljava/lang/String;)V
    .locals 1
    .param p0, "screen"    # Ljava/lang/String;

    .prologue
    .line 312
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/localytics/android/LocalyticsManager;->tagScreen(Ljava/lang/String;)V

    .line 313
    return-void
.end method

.method public static triggerInAppMessage(Ljava/lang/String;)V
    .locals 1
    .param p0, "triggerName"    # Ljava/lang/String;

    .prologue
    .line 802
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/localytics/android/Localytics;->triggerInAppMessage(Ljava/lang/String;Ljava/util/Map;)V

    .line 803
    return-void
.end method

.method public static triggerInAppMessage(Ljava/lang/String;Ljava/util/Map;)V
    .locals 2
    .param p0, "triggerName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 813
    .local p1, "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p0, p1, v1}, Lcom/localytics/android/LocalyticsManager;->triggerInAppMessage(Ljava/lang/String;Ljava/util/Map;Z)V

    .line 814
    return-void
.end method

.method public static upload()V
    .locals 1

    .prologue
    .line 115
    invoke-static {}, Lcom/localytics/android/LocalyticsManager;->getInstance()Lcom/localytics/android/LocalyticsManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/localytics/android/LocalyticsManager;->upload()V

    .line 116
    return-void
.end method
