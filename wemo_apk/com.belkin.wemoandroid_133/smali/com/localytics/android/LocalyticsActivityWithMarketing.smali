.class public Lcom/localytics/android/LocalyticsActivityWithMarketing;
.super Landroid/support/v4/app/FragmentActivity;
.source "LocalyticsActivityWithMarketing.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Landroid/support/v4/app/FragmentActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 0
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 26
    invoke-super {p0, p1}, Landroid/support/v4/app/FragmentActivity;->onNewIntent(Landroid/content/Intent;)V

    .line 27
    invoke-virtual {p0, p1}, Lcom/localytics/android/LocalyticsActivityWithMarketing;->setIntent(Landroid/content/Intent;)V

    .line 28
    return-void
.end method

.method public onPause()V
    .locals 0

    .prologue
    .line 16
    invoke-static {}, Lcom/localytics/android/Localytics;->dismissCurrentInAppMessage()V

    .line 17
    invoke-static {}, Lcom/localytics/android/Localytics;->clearInAppMessageDisplayActivity()V

    .line 18
    invoke-static {}, Lcom/localytics/android/Localytics;->closeSession()V

    .line 19
    invoke-static {}, Lcom/localytics/android/Localytics;->upload()V

    .line 20
    invoke-super {p0}, Landroid/support/v4/app/FragmentActivity;->onPause()V

    .line 21
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 33
    invoke-super {p0}, Landroid/support/v4/app/FragmentActivity;->onResume()V

    .line 34
    invoke-static {}, Lcom/localytics/android/Localytics;->openSession()V

    .line 35
    invoke-static {p0}, Lcom/localytics/android/Localytics;->setInAppMessageDisplayActivity(Landroid/support/v4/app/FragmentActivity;)V

    .line 36
    invoke-virtual {p0}, Lcom/localytics/android/LocalyticsActivityWithMarketing;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-static {v0}, Lcom/localytics/android/Localytics;->handlePushNotificationOpened(Landroid/content/Intent;)V

    .line 37
    invoke-virtual {p0}, Lcom/localytics/android/LocalyticsActivityWithMarketing;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-static {v0}, Lcom/localytics/android/Localytics;->handleTestMode(Landroid/content/Intent;)V

    .line 38
    invoke-static {}, Lcom/localytics/android/Localytics;->upload()V

    .line 39
    return-void
.end method
