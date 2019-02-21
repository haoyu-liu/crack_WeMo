.class interface abstract Lcom/localytics/android/LocalyticsDao;
.super Ljava/lang/Object;
.source "LocalyticsDao.java"


# virtual methods
.method public abstract getApiKey()Ljava/lang/String;
.end method

.method public abstract getAppContext()Landroid/content/Context;
.end method

.method public abstract getCalendar()Ljava/util/Calendar;
.end method

.method public abstract getCurrentTimeMillis()J
.end method

.method public abstract getCustomDimension(I)Ljava/lang/String;
.end method

.method public abstract getCustomerIdInMemory()Ljava/lang/String;
.end method

.method public abstract getCustomerIdInMemory(Z)Ljava/lang/String;
.end method

.method public abstract getCustomerIdInitiatedLatch()Ljava/util/concurrent/CountDownLatch;
.end method

.method public abstract getIdentifiers()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getInstallationId()Ljava/lang/String;
.end method

.method public abstract getProxy()Ljava/net/Proxy;
.end method

.method public abstract getPushRegistrationId()Ljava/lang/String;
.end method

.method public abstract getTimeStringForSQLite()Ljava/lang/String;
.end method

.method public abstract isAppInForeground()Z
.end method

.method public abstract isAutoIntegrate()Z
.end method

.method public abstract isPushDisabled()Z
.end method

.method public abstract setCustomDimension(ILjava/lang/String;)V
.end method

.method public abstract setCustomerIdInMemory(Ljava/lang/String;)V
.end method

.method public abstract setInstallationId(Ljava/lang/String;)V
.end method

.method public abstract setScreenFlow(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract setTestModeEnabled(Z)V
.end method

.method public abstract tagEvent(Ljava/lang/String;)V
.end method

.method public abstract tagEvent(Ljava/lang/String;Ljava/util/Map;)V
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
.end method

.method public abstract tagEvent(Ljava/lang/String;Ljava/util/Map;J)V
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
.end method

.method public abstract triggerInAppMessage(Ljava/lang/String;)V
.end method

.method public abstract triggerInAppMessage(Ljava/lang/String;Ljava/util/Map;)V
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
.end method

.method public abstract triggerInAppMessage(Ljava/lang/String;Ljava/util/Map;Z)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation
.end method

.method public abstract upload()V
.end method
