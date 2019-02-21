.class public Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$ProcessDBModel;
.super Ljava/lang/Object;
.source "StoreRulesLocalRunnable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ProcessDBModel"
.end annotation


# instance fields
.field private state:I

.field final synthetic this$0:Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;

.field private udn:Ljava/lang/String;

.field private weeklyCalendarArray:[Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;)V
    .locals 0

    .prologue
    .line 456
    iput-object p1, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$ProcessDBModel;->this$0:Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 458
    return-void
.end method

.method public constructor <init>(Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;ILjava/lang/String;[Ljava/lang/String;)V
    .locals 0
    .param p2, "state"    # I
    .param p3, "udn"    # Ljava/lang/String;
    .param p4, "weeklyCalendarArr"    # [Ljava/lang/String;

    .prologue
    .line 460
    iput-object p1, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$ProcessDBModel;->this$0:Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 461
    iput p2, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$ProcessDBModel;->state:I

    .line 462
    iput-object p3, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$ProcessDBModel;->udn:Ljava/lang/String;

    .line 463
    iput-object p4, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$ProcessDBModel;->weeklyCalendarArray:[Ljava/lang/String;

    .line 464
    return-void
.end method


# virtual methods
.method public getState()I
    .locals 1

    .prologue
    .line 467
    iget v0, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$ProcessDBModel;->state:I

    return v0
.end method

.method public getUdn()Ljava/lang/String;
    .locals 1

    .prologue
    .line 473
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$ProcessDBModel;->udn:Ljava/lang/String;

    return-object v0
.end method

.method public getWeeklyCalendarArray()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 479
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$ProcessDBModel;->weeklyCalendarArray:[Ljava/lang/String;

    return-object v0
.end method

.method public setState(I)V
    .locals 0
    .param p1, "state"    # I

    .prologue
    .line 470
    iput p1, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$ProcessDBModel;->state:I

    .line 471
    return-void
.end method

.method public setUdn(Ljava/lang/String;)V
    .locals 0
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 476
    iput-object p1, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$ProcessDBModel;->udn:Ljava/lang/String;

    .line 477
    return-void
.end method

.method public setWeeklyCalendarArray([Ljava/lang/String;)V
    .locals 0
    .param p1, "weeklyCalendarArray"    # [Ljava/lang/String;

    .prologue
    .line 482
    iput-object p1, p0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable$ProcessDBModel;->weeklyCalendarArray:[Ljava/lang/String;

    .line 483
    return-void
.end method
