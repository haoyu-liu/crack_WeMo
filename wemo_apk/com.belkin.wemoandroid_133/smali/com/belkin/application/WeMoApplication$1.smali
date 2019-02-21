.class Lcom/belkin/application/WeMoApplication$1;
.super Ljava/lang/Object;
.source "WeMoApplication.java"

# interfaces
.implements Ljavax/net/ssl/X509TrustManager;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/application/WeMoApplication;->trustAllCertificates()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/application/WeMoApplication;


# direct methods
.method constructor <init>(Lcom/belkin/application/WeMoApplication;)V
    .locals 0

    .prologue
    .line 68
    iput-object p1, p0, Lcom/belkin/application/WeMoApplication$1;->this$0:Lcom/belkin/application/WeMoApplication;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public checkClientTrusted([Ljava/security/cert/X509Certificate;Ljava/lang/String;)V
    .locals 0
    .param p1, "certs"    # [Ljava/security/cert/X509Certificate;
    .param p2, "authType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;
        }
    .end annotation

    .prologue
    .line 77
    return-void
.end method

.method public checkServerTrusted([Ljava/security/cert/X509Certificate;Ljava/lang/String;)V
    .locals 3
    .param p1, "certs"    # [Ljava/security/cert/X509Certificate;
    .param p2, "authType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;
        }
    .end annotation

    .prologue
    .line 82
    const/4 v1, 0x0

    :try_start_0
    aget-object v1, p1, v1

    invoke-virtual {v1}, Ljava/security/cert/X509Certificate;->checkValidity()V
    :try_end_0
    .catch Ljava/security/cert/CertificateExpiredException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/security/cert/CertificateNotYetValidException; {:try_start_0 .. :try_end_0} :catch_1

    .line 90
    return-void

    .line 83
    :catch_0
    move-exception v0

    .line 84
    .local v0, "e":Ljava/security/cert/CertificateExpiredException;
    iget-object v1, p0, Lcom/belkin/application/WeMoApplication$1;->this$0:Lcom/belkin/application/WeMoApplication;

    invoke-static {v1}, Lcom/belkin/application/WeMoApplication;->access$000(Lcom/belkin/application/WeMoApplication;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "CertificateExpiredException"

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    new-instance v1, Ljava/security/cert/CertificateException;

    const-string v2, "CertificateExpiredException"

    invoke-direct {v1, v2}, Ljava/security/cert/CertificateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 86
    .end local v0    # "e":Ljava/security/cert/CertificateExpiredException;
    :catch_1
    move-exception v0

    .line 87
    .local v0, "e":Ljava/security/cert/CertificateNotYetValidException;
    iget-object v1, p0, Lcom/belkin/application/WeMoApplication$1;->this$0:Lcom/belkin/application/WeMoApplication;

    invoke-static {v1}, Lcom/belkin/application/WeMoApplication;->access$000(Lcom/belkin/application/WeMoApplication;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "CertificateNotYetValidException"

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    new-instance v1, Ljava/security/cert/CertificateException;

    const-string v2, "CertificateNotYetValidException"

    invoke-direct {v1, v2}, Ljava/security/cert/CertificateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getAcceptedIssuers()[Ljava/security/cert/X509Certificate;
    .locals 2

    .prologue
    .line 70
    const/4 v1, 0x0

    new-array v0, v1, [Ljava/security/cert/X509Certificate;

    .line 71
    .local v0, "trustedCertificateArray":[Ljava/security/cert/X509Certificate;
    return-object v0
.end method
