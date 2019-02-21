.class public Lcom/belkin/wemo/exception/InvalidArgumentsException;
.super Lcom/belkin/wemo/exception/WeMoException;
.source "InvalidArgumentsException.java"


# static fields
.field private static final serialVersionUID:J = 0x711e1b76fecf5a8fL


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
