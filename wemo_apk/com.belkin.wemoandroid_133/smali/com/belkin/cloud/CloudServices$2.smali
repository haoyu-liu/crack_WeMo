.class Lcom/belkin/cloud/CloudServices$2;
.super Ljava/lang/Object;
.source "CloudServices.java"

# interfaces
.implements Ljavax/net/ssl/HostnameVerifier;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/cloud/CloudServices;->getDeviceIconBase64(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/cloud/CloudServices;

.field final synthetic val$hostName:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/belkin/cloud/CloudServices;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 196
    iput-object p1, p0, Lcom/belkin/cloud/CloudServices$2;->this$0:Lcom/belkin/cloud/CloudServices;

    iput-object p2, p0, Lcom/belkin/cloud/CloudServices$2;->val$hostName:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public verify(Ljava/lang/String;Ljavax/net/ssl/SSLSession;)Z
    .locals 1
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "sess"    # Ljavax/net/ssl/SSLSession;

    .prologue
    .line 198
    iget-object v0, p0, Lcom/belkin/cloud/CloudServices$2;->val$hostName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 199
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
