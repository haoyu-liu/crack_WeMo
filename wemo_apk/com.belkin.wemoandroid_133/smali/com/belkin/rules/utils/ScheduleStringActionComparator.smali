.class public Lcom/belkin/rules/utils/ScheduleStringActionComparator;
.super Ljava/lang/Object;
.source "ScheduleStringActionComparator.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/belkin/rules/utils/ScheduleStringAction;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/belkin/rules/utils/ScheduleStringAction;Lcom/belkin/rules/utils/ScheduleStringAction;)I
    .locals 2
    .param p1, "o1"    # Lcom/belkin/rules/utils/ScheduleStringAction;
    .param p2, "o2"    # Lcom/belkin/rules/utils/ScheduleStringAction;

    .prologue
    .line 8
    invoke-virtual {p1}, Lcom/belkin/rules/utils/ScheduleStringAction;->getTime()I

    move-result v0

    invoke-virtual {p2}, Lcom/belkin/rules/utils/ScheduleStringAction;->getTime()I

    move-result v1

    sub-int/2addr v0, v1

    return v0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 5
    check-cast p1, Lcom/belkin/rules/utils/ScheduleStringAction;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Lcom/belkin/rules/utils/ScheduleStringAction;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/belkin/rules/utils/ScheduleStringActionComparator;->compare(Lcom/belkin/rules/utils/ScheduleStringAction;Lcom/belkin/rules/utils/ScheduleStringAction;)I

    move-result v0

    return v0
.end method
