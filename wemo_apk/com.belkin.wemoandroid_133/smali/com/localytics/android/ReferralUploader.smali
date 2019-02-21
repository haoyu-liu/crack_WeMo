.class final Lcom/localytics/android/ReferralUploader;
.super Lcom/localytics/android/BaseUploadThread;
.source "ReferralUploader.java"


# static fields
.field private static final ANALYTICS_URL_HTTP:Ljava/lang/String; = "http://%s/api/v2/applications/%s/uploads"

.field private static final ANALYTICS_URL_HTTPS:Ljava/lang/String; = "https://%s/api/v2/uploads"


# instance fields
.field private mFirstSessionEvent:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/localytics/android/AnalyticsHandler;Ljava/lang/String;Lcom/localytics/android/LocalyticsDao;)V
    .locals 2
    .param p1, "sessionHandler"    # Lcom/localytics/android/AnalyticsHandler;
    .param p2, "firstSessionEvent"    # Ljava/lang/String;
    .param p3, "localyticsDao"    # Lcom/localytics/android/LocalyticsDao;

    .prologue
    .line 19
    const/4 v0, 0x0

    invoke-interface {p3}, Lcom/localytics/android/LocalyticsDao;->getCustomerIdInMemory()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, p1, v0, v1, p3}, Lcom/localytics/android/BaseUploadThread;-><init>(Lcom/localytics/android/BaseHandler;Ljava/util/TreeMap;Ljava/lang/String;Lcom/localytics/android/LocalyticsDao;)V

    .line 20
    iput-object p2, p0, Lcom/localytics/android/ReferralUploader;->mFirstSessionEvent:Ljava/lang/String;

    .line 21
    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .prologue
    .line 40
    invoke-virtual {p0}, Lcom/localytics/android/ReferralUploader;->uploadData()I

    .line 41
    return-void
.end method

.method uploadData()I
    .locals 7

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 26
    iget-object v0, p0, Lcom/localytics/android/ReferralUploader;->mFirstSessionEvent:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 28
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[REFERRAL] reupload first session: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/localytics/android/ReferralUploader;->mFirstSessionEvent:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/localytics/android/Localytics$Log;->i(Ljava/lang/String;)I

    .line 29
    invoke-virtual {p0}, Lcom/localytics/android/ReferralUploader;->getApiKey()Ljava/lang/String;

    move-result-object v6

    .line 30
    .local v6, "apiKey":Ljava/lang/String;
    sget-boolean v0, Lcom/localytics/android/Constants;->USE_HTTPS:Z

    if-eqz v0, :cond_1

    const-string v0, "https://%s/api/v2/uploads"

    new-array v1, v5, [Ljava/lang/Object;

    sget-object v3, Lcom/localytics/android/Constants;->ANALYTICS_HOST:Ljava/lang/String;

    aput-object v3, v1, v4

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 31
    .local v2, "uploadUrl":Ljava/lang/String;
    :goto_0
    sget-object v1, Lcom/localytics/android/BaseUploadThread$UploadType;->ANALYTICS:Lcom/localytics/android/BaseUploadThread$UploadType;

    iget-object v3, p0, Lcom/localytics/android/ReferralUploader;->mFirstSessionEvent:Ljava/lang/String;

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/ReferralUploader;->upload(Lcom/localytics/android/BaseUploadThread$UploadType;Ljava/lang/String;Ljava/lang/String;IZ)Z

    .line 34
    .end local v2    # "uploadUrl":Ljava/lang/String;
    .end local v6    # "apiKey":Ljava/lang/String;
    :cond_0
    return v4

    .line 30
    .restart local v6    # "apiKey":Ljava/lang/String;
    :cond_1
    const-string v0, "http://%s/api/v2/applications/%s/uploads"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    sget-object v3, Lcom/localytics/android/Constants;->ANALYTICS_HOST:Ljava/lang/String;

    aput-object v3, v1, v4

    aput-object v6, v1, v5

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method
