.class public Lcom/belkin/application/WeMoApplication;
.super Landroid/app/Application;
.source "WeMoApplication.java"


# static fields
.field public static final WEMO_API_KEY:Ljava/lang/String; = "dummy_api_key"


# instance fields
.field private final TAG:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 33
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    .line 35
    const-class v0, Lcom/belkin/application/WeMoApplication;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/application/WeMoApplication;->TAG:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000(Lcom/belkin/application/WeMoApplication;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/application/WeMoApplication;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/belkin/application/WeMoApplication;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method private trustAllCertificates()V
    .locals 5

    .prologue
    .line 67
    const/4 v3, 0x1

    :try_start_0
    new-array v2, v3, [Ljavax/net/ssl/TrustManager;

    const/4 v3, 0x0

    new-instance v4, Lcom/belkin/application/WeMoApplication$1;

    invoke-direct {v4, p0}, Lcom/belkin/application/WeMoApplication$1;-><init>(Lcom/belkin/application/WeMoApplication;)V

    aput-object v4, v2, v3

    .line 94
    .local v2, "trustAllCertificates":[Ljavax/net/ssl/TrustManager;
    const-string v3, "SSL"

    invoke-static {v3}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v1

    .line 95
    .local v1, "sslContent":Ljavax/net/ssl/SSLContext;
    const/4 v3, 0x0

    new-instance v4, Ljava/security/SecureRandom;

    invoke-direct {v4}, Ljava/security/SecureRandom;-><init>()V

    invoke-virtual {v1, v3, v2, v4}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 96
    invoke-virtual {v1}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v3

    invoke-static {v3}, Ljavax/net/ssl/HttpsURLConnection;->setDefaultSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    .line 97
    new-instance v3, Lcom/belkin/application/WeMoApplication$2;

    invoke-direct {v3, p0}, Lcom/belkin/application/WeMoApplication$2;-><init>(Lcom/belkin/application/WeMoApplication;)V

    invoke-static {v3}, Ljavax/net/ssl/HttpsURLConnection;->setDefaultHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 106
    .end local v1    # "sslContent":Ljavax/net/ssl/SSLContext;
    .end local v2    # "trustAllCertificates":[Ljavax/net/ssl/TrustManager;
    :goto_0
    return-void

    .line 103
    :catch_0
    move-exception v0

    .line 104
    .local v0, "e":Ljava/lang/Exception;
    iget-object v3, p0, Lcom/belkin/application/WeMoApplication;->TAG:Ljava/lang/String;

    const-string v4, "Exception while executing code to trust all certificates: "

    invoke-static {v3, v4, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method


# virtual methods
.method public onCreate()V
    .locals 3

    .prologue
    .line 40
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 41
    new-instance v1, Lcom/localytics/android/LocalyticsActivityLifecycleCallbacks;

    invoke-direct {v1, p0}, Lcom/localytics/android/LocalyticsActivityLifecycleCallbacks;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, v1}, Lcom/belkin/application/WeMoApplication;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 45
    :try_start_0
    const-string v1, "dummy_api_key"

    invoke-virtual {p0}, Lcom/belkin/application/WeMoApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/WeMo;->initialize(Ljava/lang/String;Landroid/content/Context;)V

    .line 49
    invoke-static {}, Lcom/belkin/wemo/rules/RMRulesSDK;->init()V
    :try_end_0
    .catch Lcom/belkin/wemo/exception/WeMoInitException; {:try_start_0 .. :try_end_0} :catch_0

    .line 59
    :goto_0
    const-string v1, "https://api.xbcs.net:8443"

    const-string v2, "https://devtest-1373897041.us-east-1.elb.amazonaws.com:8443"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 60
    iget-object v1, p0, Lcom/belkin/application/WeMoApplication;->TAG:Ljava/lang/String;

    const-string v2, "TRUSTING ALL CERTIFICATES. CURRENT CLOUD: https://api.xbcs.net:8443"

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    invoke-direct {p0}, Lcom/belkin/application/WeMoApplication;->trustAllCertificates()V

    .line 63
    :cond_0
    return-void

    .line 50
    :catch_0
    move-exception v0

    .line 51
    .local v0, "e":Lcom/belkin/wemo/exception/WeMoInitException;
    iget-object v1, p0, Lcom/belkin/application/WeMoApplication;->TAG:Ljava/lang/String;

    const-string v2, "WeMoInitException while initializing WeMoSDK: "

    invoke-static {v1, v2, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
