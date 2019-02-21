.class public Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarNonLinkData;
.super Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarData;
.source "RMPluginWeeklyCalendarNonLinkData.java"


# instance fields
.field private friday:Ljava/lang/String;

.field private monday:Ljava/lang/String;

.field private saturday:Ljava/lang/String;

.field private sunday:Ljava/lang/String;

.field private thursday:Ljava/lang/String;

.field private tuesday:Ljava/lang/String;

.field private wednesday:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "pluginId"    # Ljava/lang/String;
    .param p2, "mac"    # Ljava/lang/String;
    .param p3, "monday"    # Ljava/lang/String;
    .param p4, "tuesday"    # Ljava/lang/String;
    .param p5, "wednesday"    # Ljava/lang/String;
    .param p6, "thursday"    # Ljava/lang/String;
    .param p7, "friday"    # Ljava/lang/String;
    .param p8, "saturday"    # Ljava/lang/String;
    .param p9, "sunday"    # Ljava/lang/String;

    .prologue
    .line 22
    invoke-direct {p0, p1, p2}, Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarData;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    iput-object p3, p0, Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarNonLinkData;->monday:Ljava/lang/String;

    .line 24
    iput-object p4, p0, Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarNonLinkData;->tuesday:Ljava/lang/String;

    .line 25
    iput-object p5, p0, Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarNonLinkData;->wednesday:Ljava/lang/String;

    .line 26
    iput-object p6, p0, Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarNonLinkData;->thursday:Ljava/lang/String;

    .line 27
    iput-object p7, p0, Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarNonLinkData;->friday:Ljava/lang/String;

    .line 28
    iput-object p8, p0, Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarNonLinkData;->saturday:Ljava/lang/String;

    .line 29
    iput-object p9, p0, Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarNonLinkData;->sunday:Ljava/lang/String;

    .line 30
    return-void
.end method


# virtual methods
.method public assembleWeeklyCalendarData()Ljava/lang/String;
    .locals 3

    .prologue
    .line 119
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "<mon>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarNonLinkData;->monday:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</mon>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<tues>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarNonLinkData;->tuesday:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</tues>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<wed>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarNonLinkData;->wednesday:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</wed>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<thur>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarNonLinkData;->thursday:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</thur>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<fri>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarNonLinkData;->friday:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</fri>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<sat>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarNonLinkData;->saturday:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</sat>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<sun>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarNonLinkData;->sunday:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</sun>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 126
    .local v0, "data":Ljava/lang/String;
    return-object v0
.end method

.method public getFriday()Ljava/lang/String;
    .locals 1

    .prologue
    .line 84
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarNonLinkData;->friday:Ljava/lang/String;

    return-object v0
.end method

.method public getMonday()Ljava/lang/String;
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarNonLinkData;->monday:Ljava/lang/String;

    return-object v0
.end method

.method public getSaturday()Ljava/lang/String;
    .locals 1

    .prologue
    .line 96
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarNonLinkData;->saturday:Ljava/lang/String;

    return-object v0
.end method

.method public getSunday()Ljava/lang/String;
    .locals 1

    .prologue
    .line 108
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarNonLinkData;->sunday:Ljava/lang/String;

    return-object v0
.end method

.method public getThursday()Ljava/lang/String;
    .locals 1

    .prologue
    .line 72
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarNonLinkData;->thursday:Ljava/lang/String;

    return-object v0
.end method

.method public getTuesday()Ljava/lang/String;
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarNonLinkData;->tuesday:Ljava/lang/String;

    return-object v0
.end method

.method public getWednesday()Ljava/lang/String;
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarNonLinkData;->wednesday:Ljava/lang/String;

    return-object v0
.end method

.method public setFriday(Ljava/lang/String;)V
    .locals 0
    .param p1, "friday"    # Ljava/lang/String;

    .prologue
    .line 90
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarNonLinkData;->friday:Ljava/lang/String;

    .line 91
    return-void
.end method

.method public setMonday(Ljava/lang/String;)V
    .locals 0
    .param p1, "monday"    # Ljava/lang/String;

    .prologue
    .line 42
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarNonLinkData;->monday:Ljava/lang/String;

    .line 43
    return-void
.end method

.method public setSaturday(Ljava/lang/String;)V
    .locals 0
    .param p1, "saturday"    # Ljava/lang/String;

    .prologue
    .line 102
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarNonLinkData;->saturday:Ljava/lang/String;

    .line 103
    return-void
.end method

.method public setSunday(Ljava/lang/String;)V
    .locals 0
    .param p1, "sunday"    # Ljava/lang/String;

    .prologue
    .line 114
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarNonLinkData;->sunday:Ljava/lang/String;

    .line 115
    return-void
.end method

.method public setThursday(Ljava/lang/String;)V
    .locals 0
    .param p1, "thursday"    # Ljava/lang/String;

    .prologue
    .line 78
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarNonLinkData;->thursday:Ljava/lang/String;

    .line 79
    return-void
.end method

.method public setTuesday(Ljava/lang/String;)V
    .locals 0
    .param p1, "tuesday"    # Ljava/lang/String;

    .prologue
    .line 54
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarNonLinkData;->tuesday:Ljava/lang/String;

    .line 55
    return-void
.end method

.method public setWednesday(Ljava/lang/String;)V
    .locals 0
    .param p1, "wednesday"    # Ljava/lang/String;

    .prologue
    .line 66
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarNonLinkData;->wednesday:Ljava/lang/String;

    .line 67
    return-void
.end method
