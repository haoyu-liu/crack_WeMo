.class public Lcom/belkin/wemo/exception/InvalidActionException;
.super Lcom/belkin/wemo/exception/WeMoException;
.source "InvalidActionException.java"


# static fields
.field private static final serialVersionUID:J = -0x27bc11f0c9044319L


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 11
    invoke-direct {p0, p1}, Lcom/belkin/wemo/exception/WeMoException;-><init>(Ljava/lang/String;)V

    .line 12
    return-void
.end method
