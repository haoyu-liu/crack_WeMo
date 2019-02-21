.class public Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
.super Lcom/belkin/wemo/exception/WeMoException;
.source "RuleDBException.java"


# static fields
.field private static final serialVersionUID:J = 0x7a914ce694e33e5dL


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 13
    invoke-direct {p0, p1}, Lcom/belkin/wemo/exception/WeMoException;-><init>(Ljava/lang/String;)V

    .line 14
    return-void
.end method
