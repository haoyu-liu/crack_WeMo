.class public Lcom/almworks/sqlite4java/SQLiteInterruptedException;
.super Lcom/almworks/sqlite4java/SQLiteException;
.source "SQLiteInterruptedException.java"


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 30
    const/16 v0, 0x9

    const-string v1, ""

    invoke-direct {p0, v0, v1}, Lcom/almworks/sqlite4java/SQLiteInterruptedException;-><init>(ILjava/lang/String;)V

    .line 31
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .locals 0
    .param p1, "resultCode"    # I
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 34
    invoke-direct {p0, p1, p2}, Lcom/almworks/sqlite4java/SQLiteException;-><init>(ILjava/lang/String;)V

    .line 35
    return-void
.end method
