.class Lcom/belkin/remoteservice/SSLSocketFactoryImpl$1;
.super Ljava/lang/Object;
.source "SSLSocketFactoryImpl.java"

# interfaces
.implements Ljavax/net/ssl/X509TrustManager;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/remoteservice/SSLSocketFactoryImpl;-><init>(Ljava/security/KeyStore;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/remoteservice/SSLSocketFactoryImpl;


# direct methods
.method constructor <init>(Lcom/belkin/remoteservice/SSLSocketFactoryImpl;)V
    .locals 0

    .prologue
    .line 36
    iput-object p1, p0, Lcom/belkin/remoteservice/SSLSocketFactoryImpl$1;->this$0:Lcom/belkin/remoteservice/SSLSocketFactoryImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public checkClientTrusted([Ljava/security/cert/X509Certificate;Ljava/lang/String;)V
    .locals 0
    .param p1, "chain"    # [Ljava/security/cert/X509Certificate;
    .param p2, "authType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;
        }
    .end annotation

    .prologue
    .line 39
    return-void
.end method

.method public checkServerTrusted([Ljava/security/cert/X509Certificate;Ljava/lang/String;)V
    .locals 3
    .param p1, "chain"    # [Ljava/security/cert/X509Certificate;
    .param p2, "authType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;
        }
    .end annotation

    .prologue
    .line 44
    const/4 v1, 0x0

    :try_start_0
    aget-object v1, p1, v1

    invoke-virtual {v1}, Ljava/security/cert/X509Certificate;->checkValidity()V
    :try_end_0
    .catch Ljava/security/cert/CertificateExpiredException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/security/cert/CertificateNotYetValidException; {:try_start_0 .. :try_end_0} :catch_1

    .line 52
    return-void

    .line 45
    :catch_0
    move-exception v0

    .line 46
    .local v0, "e":Ljava/security/cert/CertificateExpiredException;
    iget-object v1, p0, Lcom/belkin/remoteservice/SSLSocketFactoryImpl$1;->this$0:Lcom/belkin/remoteservice/SSLSocketFactoryImpl;

    invoke-static {v1}, Lcom/belkin/remoteservice/SSLSocketFactoryImpl;->access$000(Lcom/belkin/remoteservice/SSLSocketFactoryImpl;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "CertificateExpiredException"

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    new-instance v1, Ljava/security/cert/CertificateException;

    const-string v2, "CertificateExpiredException"

    invoke-direct {v1, v2}, Ljava/security/cert/CertificateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 48
    .end local v0    # "e":Ljava/security/cert/CertificateExpiredException;
    :catch_1
    move-exception v0

    .line 49
    .local v0, "e":Ljava/security/cert/CertificateNotYetValidException;
    iget-object v1, p0, Lcom/belkin/remoteservice/SSLSocketFactoryImpl$1;->this$0:Lcom/belkin/remoteservice/SSLSocketFactoryImpl;

    invoke-static {v1}, Lcom/belkin/remoteservice/SSLSocketFactoryImpl;->access$000(Lcom/belkin/remoteservice/SSLSocketFactoryImpl;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "CertificateNotYetValidException"

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    new-instance v1, Ljava/security/cert/CertificateException;

    const-string v2, "CertificateNotYetValidException"

    invoke-direct {v1, v2}, Ljava/security/cert/CertificateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getAcceptedIssuers()[Ljava/security/cert/X509Certificate;
    .locals 1

    .prologue
    .line 55
    const/4 v0, 0x0

    return-object v0
.end method
