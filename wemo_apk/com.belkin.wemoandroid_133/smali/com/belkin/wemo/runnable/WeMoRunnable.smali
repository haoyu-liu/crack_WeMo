.class public abstract Lcom/belkin/wemo/runnable/WeMoRunnable;
.super Ljava/lang/Object;
.source "WeMoRunnable.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field protected TAG:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    invoke-virtual {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;->getLoggerTag()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/runnable/WeMoRunnable;->TAG:Ljava/lang/String;

    .line 54
    return-void
.end method


# virtual methods
.method protected getLoggerTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 57
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
