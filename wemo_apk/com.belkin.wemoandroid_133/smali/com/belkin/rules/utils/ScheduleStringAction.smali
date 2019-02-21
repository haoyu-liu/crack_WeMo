.class public Lcom/belkin/rules/utils/ScheduleStringAction;
.super Ljava/lang/Object;
.source "ScheduleStringAction.java"


# instance fields
.field private schedule:Ljava/lang/String;

.field private time:I


# direct methods
.method public constructor <init>(ILjava/lang/String;)V
    .locals 0
    .param p1, "time"    # I
    .param p2, "schedule"    # Ljava/lang/String;

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    iput p1, p0, Lcom/belkin/rules/utils/ScheduleStringAction;->time:I

    .line 10
    iput-object p2, p0, Lcom/belkin/rules/utils/ScheduleStringAction;->schedule:Ljava/lang/String;

    .line 11
    return-void
.end method


# virtual methods
.method public getSchedule()Ljava/lang/String;
    .locals 1

    .prologue
    .line 22
    iget-object v0, p0, Lcom/belkin/rules/utils/ScheduleStringAction;->schedule:Ljava/lang/String;

    return-object v0
.end method

.method public getTime()I
    .locals 1

    .prologue
    .line 14
    iget v0, p0, Lcom/belkin/rules/utils/ScheduleStringAction;->time:I

    return v0
.end method

.method public setSchedule(Ljava/lang/String;)V
    .locals 0
    .param p1, "schedule"    # Ljava/lang/String;

    .prologue
    .line 26
    iput-object p1, p0, Lcom/belkin/rules/utils/ScheduleStringAction;->schedule:Ljava/lang/String;

    .line 27
    return-void
.end method

.method public setTime(I)V
    .locals 0
    .param p1, "time"    # I

    .prologue
    .line 18
    iput p1, p0, Lcom/belkin/rules/utils/ScheduleStringAction;->time:I

    .line 19
    return-void
.end method
