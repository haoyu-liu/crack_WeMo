.class public Lcom/belkin/wemo/rules/device/dbrules/comm/error/RMRulesCommError;
.super Lcom/belkin/wemo/error/WeMoError;
.source "RMRulesCommError.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Lcom/belkin/wemo/error/WeMoError;-><init>()V

    .line 14
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .locals 0
    .param p1, "errorCode"    # I
    .param p2, "errorMessage"    # Ljava/lang/String;

    .prologue
    .line 9
    invoke-direct {p0, p1, p2}, Lcom/belkin/wemo/error/WeMoError;-><init>(ILjava/lang/String;)V

    .line 10
    return-void
.end method
