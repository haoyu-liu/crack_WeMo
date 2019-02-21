.class public Lcom/localytics/android/LocalyticsActivity;
.super Landroid/app/Activity;
.source "LocalyticsActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 0
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 25
    invoke-super {p0, p1}, Landroid/app/Activity;->onNewIntent(Landroid/content/Intent;)V

    .line 26
    invoke-virtual {p0, p1}, Lcom/localytics/android/LocalyticsActivity;->setIntent(Landroid/content/Intent;)V

    .line 27
    return-void
.end method

.method public onPause()V
    .locals 0

    .prologue
    .line 32
    invoke-static {}, Lcom/localytics/android/Localytics;->closeSession()V

    .line 33
    invoke-static {}, Lcom/localytics/android/Localytics;->upload()V

    .line 34
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 35
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 16
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 17
    invoke-static {}, Lcom/localytics/android/Localytics;->openSession()V

    .line 18
    invoke-virtual {p0}, Lcom/localytics/android/LocalyticsActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-static {v0}, Lcom/localytics/android/Localytics;->handlePushNotificationOpened(Landroid/content/Intent;)V

    .line 19
    invoke-static {}, Lcom/localytics/android/Localytics;->upload()V

    .line 20
    return-void
.end method
