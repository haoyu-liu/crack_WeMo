.class Lcom/belkin/application/WeMoApplication$2;
.super Ljava/lang/Object;
.source "WeMoApplication.java"

# interfaces
.implements Ljavax/net/ssl/HostnameVerifier;


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
    .line 97
    iput-object p1, p0, Lcom/belkin/application/WeMoApplication$2;->this$0:Lcom/belkin/application/WeMoApplication;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public verify(Ljava/lang/String;Ljavax/net/ssl/SSLSession;)Z
    .locals 1
    .param p1, "arg0"    # Ljava/lang/String;
    .param p2, "arg1"    # Ljavax/net/ssl/SSLSession;

    .prologue
    .line 100
    const/4 v0, 0x1

    return v0
.end method
