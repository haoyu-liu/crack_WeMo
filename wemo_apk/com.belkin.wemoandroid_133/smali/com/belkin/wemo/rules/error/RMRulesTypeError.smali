.class public Lcom/belkin/wemo/rules/error/RMRulesTypeError;
.super Lcom/belkin/wemo/error/WeMoError;
.source "RMRulesTypeError.java"


# instance fields
.field private rulesType:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Lcom/belkin/wemo/error/WeMoError;-><init>()V

    .line 20
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .locals 0
    .param p1, "errorCode"    # I
    .param p2, "errorMessage"    # Ljava/lang/String;

    .prologue
    .line 10
    invoke-direct {p0, p1, p2}, Lcom/belkin/wemo/error/WeMoError;-><init>(ILjava/lang/String;)V

    .line 11
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;I)V
    .locals 0
    .param p1, "errorCode"    # I
    .param p2, "errorMessage"    # Ljava/lang/String;
    .param p3, "rulesType"    # I

    .prologue
    .line 14
    invoke-direct {p0, p1, p2}, Lcom/belkin/wemo/error/WeMoError;-><init>(ILjava/lang/String;)V

    .line 15
    iput p3, p0, Lcom/belkin/wemo/rules/error/RMRulesTypeError;->rulesType:I

    .line 16
    return-void
.end method


# virtual methods
.method public getRulesType()I
    .locals 1

    .prologue
    .line 26
    iget v0, p0, Lcom/belkin/wemo/rules/error/RMRulesTypeError;->rulesType:I

    return v0
.end method

.method public setRulesType(I)V
    .locals 0
    .param p1, "rulesType"    # I

    .prologue
    .line 33
    iput p1, p0, Lcom/belkin/wemo/rules/error/RMRulesTypeError;->rulesType:I

    .line 34
    return-void
.end method
