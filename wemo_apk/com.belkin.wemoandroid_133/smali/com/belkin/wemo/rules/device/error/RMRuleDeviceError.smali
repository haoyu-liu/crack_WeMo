.class public Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;
.super Lcom/belkin/wemo/error/WeMoError;
.source "RMRuleDeviceError.java"


# instance fields
.field private deviceUdn:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Lcom/belkin/wemo/error/WeMoError;-><init>()V

    .line 22
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "errorCode"    # I
    .param p2, "errorMessage"    # Ljava/lang/String;
    .param p3, "deviceUdn"    # Ljava/lang/String;

    .prologue
    .line 11
    invoke-direct {p0, p1, p2}, Lcom/belkin/wemo/error/WeMoError;-><init>(ILjava/lang/String;)V

    .line 12
    invoke-virtual {p0, p3}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;->setDeviceUdn(Ljava/lang/String;)V

    .line 13
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "deviceUdn"    # Ljava/lang/String;

    .prologue
    .line 16
    invoke-direct {p0}, Lcom/belkin/wemo/error/WeMoError;-><init>()V

    .line 17
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;->setDeviceUdn(Ljava/lang/String;)V

    .line 18
    return-void
.end method


# virtual methods
.method public getDeviceUdn()Ljava/lang/String;
    .locals 1

    .prologue
    .line 28
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;->deviceUdn:Ljava/lang/String;

    return-object v0
.end method

.method public setDeviceUdn(Ljava/lang/String;)V
    .locals 1
    .param p1, "deviceUdn"    # Ljava/lang/String;

    .prologue
    .line 35
    if-eqz p1, :cond_0

    .line 36
    iput-object p1, p0, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;->deviceUdn:Ljava/lang/String;

    .line 40
    :goto_0
    return-void

    .line 38
    :cond_0
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;->deviceUdn:Ljava/lang/String;

    goto :goto_0
.end method
