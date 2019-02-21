.class public Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarLinkData;
.super Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarData;
.source "RMPluginWeeklyCalendarLinkData.java"


# instance fields
.field private calendarListData:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "pluginId"    # Ljava/lang/String;
    .param p2, "mac"    # Ljava/lang/String;
    .param p3, "calendarListData"    # Ljava/lang/String;

    .prologue
    .line 9
    invoke-direct {p0, p1, p2}, Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarData;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    iput-object p3, p0, Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarLinkData;->calendarListData:Ljava/lang/String;

    .line 11
    return-void
.end method


# virtual methods
.method public assembleWeeklyCalendarData()Ljava/lang/String;
    .locals 3

    .prologue
    .line 15
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "<CalendarList>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/data/RMPluginWeeklyCalendarLinkData;->calendarListData:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</CalendarList>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 16
    .local v0, "data":Ljava/lang/String;
    return-object v0
.end method
