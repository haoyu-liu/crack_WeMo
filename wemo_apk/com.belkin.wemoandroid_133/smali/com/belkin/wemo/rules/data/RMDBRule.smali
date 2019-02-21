.class public abstract Lcom/belkin/wemo/rules/data/RMDBRule;
.super Lcom/belkin/wemo/rules/data/RMRule;
.source "RMDBRule.java"


# static fields
.field public static final ACTION_OFF:I = 0x0

.field public static final ACTION_ON:I = 0x1

.field public static final ALL_WEEK:I = -0x1

.field public static final CALENDAR_FRIDAY:I = 0x4

.field public static final CALENDAR_MONDAY:I = 0x0

.field public static final CALENDAR_SATURDAY:I = 0x5

.field public static final CALENDAR_SUNDAY:I = 0x6

.field public static final CALENDAR_THURSDAY:I = 0x3

.field public static final CALENDAR_TUESDAY:I = 0x1

.field public static final CALENDAR_WEDNESDAY:I = 0x2

.field public static final DAY_ID_ARR:Ljava/lang/String; = "DAY_ID_ARR"

.field public static DAY_STR_FRIDAY:Ljava/lang/String; = null

.field public static DAY_STR_MONDAY:Ljava/lang/String; = null

.field public static DAY_STR_SATURDAY:Ljava/lang/String; = null

.field public static DAY_STR_SUNDAY:Ljava/lang/String; = null

.field public static DAY_STR_THURSDAY:Ljava/lang/String; = null

.field public static DAY_STR_TUESDAY:Ljava/lang/String; = null

.field public static DAY_STR_WEDNESDAY:Ljava/lang/String; = null

.field public static final DEFAULT_LED_FADE:I = 0x1e

.field public static final DEFAULT_RULE_ORDER:I = 0x2

.field public static final DEFAULT_SYNC:Ljava/lang/String; = "NOSYNC"

.field public static final DEFAULT_UI_LED_FADE:I = 0x3

.field public static final DEVICE_ID:Ljava/lang/String; = "DEVICE_ID"

.field public static final END_ACTION:Ljava/lang/String; = "END_ACTION"

.field public static final END_TIME_SINCE_MIDNIGHT:Ljava/lang/String; = "END_TIME_SINCE_MIDNIGHT"

.field public static final FRIDAY:I = 0x6

.field public static final MONDAY:I = 0x2

.field public static final PREFIX_SUNRISE:I = 0x1

.field public static final PREFIX_SUNSET:I = 0x2

.field public static final RULE_DURATION:Ljava/lang/String; = "RULE_DURATION"

.field public static final RULE_END_TIME_CODE:Ljava/lang/String; = "RULE_END_TIME_CODE"

.field public static final RULE_START_TIME_CODE:Ljava/lang/String; = "RULE_START_TIME_CODE"

.field public static final RULE_TIME_CODE_NO_LOCATION:I = 0x0

.field public static final RULE_TIME_CODE_SUNRISE:I = 0x1

.field public static final RULE_TIME_CODE_SUNSET:I = 0x2

.field public static final SATURDAY:I = 0x7

.field public static final SENSOR_DURATION:Ljava/lang/String; = "SENSOR_DURATION"

.field public static final START_ACTION:Ljava/lang/String; = "START_ACTION"

.field public static final START_BRIGHTNESS:Ljava/lang/String; = "START_BRIGHTNESS"

.field public static final START_LED_FADE_SEC:Ljava/lang/String; = "START_LED_FADE_SEC"

.field public static final START_TIME_SINCE_MIDNIGHT:Ljava/lang/String; = "START_TIME_SINCE_MIDNIGHT"

.field public static final SUNDAY:I = 0x1

.field private static final TAG:Ljava/lang/String;

.field public static final TARGET_DEV_ARR:Ljava/lang/String; = "TARGET_DEV_ARR"

.field public static final THURSDAY:I = 0x5

.field public static final TUESDAY:I = 0x3

.field public static final TYPE:Ljava/lang/String; = "TYPE"

.field public static final UDN:Ljava/lang/String; = "UDN"

.field public static final WEDNESDAY:I = 0x4

.field public static final WEEKDAYS:I = 0x8

.field public static final WEEKEND:I = 0x9

.field public static final WIFI_DEV_ARR:Ljava/lang/String; = "WIFI_DEV_ARR"

.field public static final ZB_CAPABILITY_BRIGHTNESS:Ljava/lang/String; = "10008"

.field public static final ZB_CAPABILITY_STATE:Ljava/lang/String; = "10006"

.field public static final ZIGBEE_DEV_ARR:Ljava/lang/String; = "ZIGBEE_DEV_ARR"

.field public static final ZIGBEE_DEV_ID:Ljava/lang/String; = "ZIGBEE_DEV_ID"


# instance fields
.field protected calendarIndexToDBDayMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field protected calendarIndexToDayStrMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected dayList:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private endDate:Ljava/lang/String;

.field protected endTime:I

.field private latitude:F

.field private longtitude:F

.field private ruleCodeEnd:I

.field private ruleCodeStart:I

.field private ruleDeviceSet:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;",
            ">;"
        }
    .end annotation
.end field

.field protected ruleDuration:I

.field private ruleOrder:I

.field private ruleType:Lcom/belkin/wemo/rules/data/RMDBRuleType;

.field private startDate:Ljava/lang/String;

.field protected startTime:I

.field private sync:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 43
    const-class v0, Lcom/belkin/wemo/rules/data/RMDBRule;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/rules/data/RMDBRule;->TAG:Ljava/lang/String;

    .line 72
    const-string v0, "Mon"

    sput-object v0, Lcom/belkin/wemo/rules/data/RMDBRule;->DAY_STR_MONDAY:Ljava/lang/String;

    .line 73
    const-string v0, "Tues"

    sput-object v0, Lcom/belkin/wemo/rules/data/RMDBRule;->DAY_STR_TUESDAY:Ljava/lang/String;

    .line 74
    const-string v0, "Wed"

    sput-object v0, Lcom/belkin/wemo/rules/data/RMDBRule;->DAY_STR_WEDNESDAY:Ljava/lang/String;

    .line 75
    const-string v0, "Thurs"

    sput-object v0, Lcom/belkin/wemo/rules/data/RMDBRule;->DAY_STR_THURSDAY:Ljava/lang/String;

    .line 76
    const-string v0, "Fri"

    sput-object v0, Lcom/belkin/wemo/rules/data/RMDBRule;->DAY_STR_FRIDAY:Ljava/lang/String;

    .line 77
    const-string v0, "Sat"

    sput-object v0, Lcom/belkin/wemo/rules/data/RMDBRule;->DAY_STR_SATURDAY:Ljava/lang/String;

    .line 78
    const-string v0, "Sun"

    sput-object v0, Lcom/belkin/wemo/rules/data/RMDBRule;->DAY_STR_SUNDAY:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, -0x1

    .line 149
    invoke-direct {p0}, Lcom/belkin/wemo/rules/data/RMRule;-><init>()V

    .line 104
    const-string v0, "NOSYNC"

    iput-object v0, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->sync:Ljava/lang/String;

    .line 107
    const/4 v0, 0x2

    iput v0, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->ruleOrder:I

    .line 108
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->startDate:Ljava/lang/String;

    .line 109
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->endDate:Ljava/lang/String;

    .line 120
    iput v1, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->startTime:I

    .line 123
    iput v1, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->endTime:I

    .line 124
    iput v1, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->ruleDuration:I

    .line 150
    invoke-direct {p0}, Lcom/belkin/wemo/rules/data/RMDBRule;->initDataStructures()V

    .line 151
    return-void
.end method

.method public constructor <init>(ILcom/belkin/wemo/rules/data/RMDBRuleType;IILjava/lang/String;Ljava/util/HashMap;IIIIJ)V
    .locals 2
    .param p1, "ruleId"    # I
    .param p2, "type"    # Lcom/belkin/wemo/rules/data/RMDBRuleType;
    .param p3, "rulesType"    # I
    .param p4, "state"    # I
    .param p5, "displayName"    # Ljava/lang/String;
    .param p7, "value"    # I
    .param p8, "level"    # I
    .param p9, "onModeOffset"    # I
    .param p10, "offModeOffset"    # I
    .param p11, "sunriseSunsetEndTime"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/belkin/wemo/rules/data/RMDBRuleType;",
            "II",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;>;IIIIJ)V"
        }
    .end annotation

    .prologue
    .local p6, "ruleDeviceUDNDaysMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/Integer;>;>;"
    const/4 v1, -0x1

    .line 142
    invoke-direct {p0, p1, p3, p5, p4}, Lcom/belkin/wemo/rules/data/RMRule;-><init>(IILjava/lang/String;I)V

    .line 104
    const-string v0, "NOSYNC"

    iput-object v0, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->sync:Ljava/lang/String;

    .line 107
    const/4 v0, 0x2

    iput v0, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->ruleOrder:I

    .line 108
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->startDate:Ljava/lang/String;

    .line 109
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->endDate:Ljava/lang/String;

    .line 120
    iput v1, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->startTime:I

    .line 123
    iput v1, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->endTime:I

    .line 124
    iput v1, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->ruleDuration:I

    .line 144
    iput-object p2, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->ruleType:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    .line 145
    invoke-direct {p0}, Lcom/belkin/wemo/rules/data/RMDBRule;->initDataStructures()V

    .line 146
    return-void
.end method

.method private calculateTimeCode(I)I
    .locals 1
    .param p1, "startTime"    # I

    .prologue
    .line 402
    rem-int/lit8 v0, p1, 0xa

    return v0
.end method

.method private initDataStructures()V
    .locals 8

    .prologue
    const/4 v7, 0x5

    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    .line 154
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->dayList:Ljava/util/Set;

    .line 156
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->calendarIndexToDayStrMap:Ljava/util/Map;

    .line 157
    iget-object v0, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->calendarIndexToDayStrMap:Ljava/util/Map;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sget-object v2, Lcom/belkin/wemo/rules/data/RMDBRule;->DAY_STR_FRIDAY:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 158
    iget-object v0, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->calendarIndexToDayStrMap:Ljava/util/Map;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sget-object v2, Lcom/belkin/wemo/rules/data/RMDBRule;->DAY_STR_MONDAY:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 159
    iget-object v0, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->calendarIndexToDayStrMap:Ljava/util/Map;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sget-object v2, Lcom/belkin/wemo/rules/data/RMDBRule;->DAY_STR_SATURDAY:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 160
    iget-object v0, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->calendarIndexToDayStrMap:Ljava/util/Map;

    const/4 v1, 0x6

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sget-object v2, Lcom/belkin/wemo/rules/data/RMDBRule;->DAY_STR_SUNDAY:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 161
    iget-object v0, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->calendarIndexToDayStrMap:Ljava/util/Map;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sget-object v2, Lcom/belkin/wemo/rules/data/RMDBRule;->DAY_STR_THURSDAY:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 162
    iget-object v0, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->calendarIndexToDayStrMap:Ljava/util/Map;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sget-object v2, Lcom/belkin/wemo/rules/data/RMDBRule;->DAY_STR_TUESDAY:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 163
    iget-object v0, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->calendarIndexToDayStrMap:Ljava/util/Map;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sget-object v2, Lcom/belkin/wemo/rules/data/RMDBRule;->DAY_STR_WEDNESDAY:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 165
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->calendarIndexToDBDayMap:Ljava/util/Map;

    .line 166
    iget-object v0, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->calendarIndexToDBDayMap:Ljava/util/Map;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x6

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 167
    iget-object v0, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->calendarIndexToDBDayMap:Ljava/util/Map;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 168
    iget-object v0, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->calendarIndexToDBDayMap:Ljava/util/Map;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x7

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 169
    iget-object v0, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->calendarIndexToDBDayMap:Ljava/util/Map;

    const/4 v1, 0x6

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 170
    iget-object v0, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->calendarIndexToDBDayMap:Ljava/util/Map;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 171
    iget-object v0, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->calendarIndexToDBDayMap:Ljava/util/Map;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 172
    iget-object v0, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->calendarIndexToDBDayMap:Ljava/util/Map;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 174
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->ruleDeviceSet:Ljava/util/Set;

    .line 176
    invoke-virtual {p0}, Lcom/belkin/wemo/rules/data/RMDBRule;->assignDBRuleType()Lcom/belkin/wemo/rules/data/RMDBRuleType;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->ruleType:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    .line 177
    return-void
.end method


# virtual methods
.method public addDay(Ljava/lang/Integer;)V
    .locals 1
    .param p1, "day"    # Ljava/lang/Integer;

    .prologue
    .line 284
    iget-object v0, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->dayList:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 285
    return-void
.end method

.method public addRuleDevice(Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;)Z
    .locals 3
    .param p1, "device"    # Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;

    .prologue
    .line 301
    sget-object v0, Lcom/belkin/wemo/rules/data/RMDBRule;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Rule device add request. UI_UDN: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->getUiUdn()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; RuleID: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/belkin/wemo/rules/data/RMDBRule;->getRuleId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 302
    iget-object v0, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->ruleDeviceSet:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method protected abstract assignDBRuleType()Lcom/belkin/wemo/rules/data/RMDBRuleType;
.end method

.method protected assignRuleType()I
    .locals 1

    .prologue
    .line 293
    const/4 v0, 0x2

    return v0
.end method

.method public deleteDevice(Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;)Z
    .locals 3
    .param p1, "device"    # Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;

    .prologue
    .line 306
    sget-object v0, Lcom/belkin/wemo/rules/data/RMDBRule;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Rule device delete request. UI_UDN: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->getUiUdn()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; RuleID: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/belkin/wemo/rules/data/RMDBRule;->getRuleId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 307
    iget-object v0, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->ruleDeviceSet:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 350
    if-ne p0, p1, :cond_1

    .line 377
    :cond_0
    :goto_0
    return v1

    .line 353
    :cond_1
    invoke-super {p0, p1}, Lcom/belkin/wemo/rules/data/RMRule;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    move v1, v2

    .line 354
    goto :goto_0

    .line 356
    :cond_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    move v1, v2

    .line 357
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 359
    check-cast v0, Lcom/belkin/wemo/rules/data/RMDBRule;

    .line 360
    .local v0, "other":Lcom/belkin/wemo/rules/data/RMDBRule;
    iget-object v3, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->dayList:Ljava/util/Set;

    if-nez v3, :cond_4

    .line 361
    iget-object v3, v0, Lcom/belkin/wemo/rules/data/RMDBRule;->dayList:Ljava/util/Set;

    if-eqz v3, :cond_5

    move v1, v2

    .line 362
    goto :goto_0

    .line 364
    :cond_4
    iget-object v3, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->dayList:Ljava/util/Set;

    iget-object v4, v0, Lcom/belkin/wemo/rules/data/RMDBRule;->dayList:Ljava/util/Set;

    invoke-interface {v3, v4}, Ljava/util/Set;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    move v1, v2

    .line 365
    goto :goto_0

    .line 367
    :cond_5
    iget-object v3, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->ruleDeviceSet:Ljava/util/Set;

    if-nez v3, :cond_6

    .line 368
    iget-object v3, v0, Lcom/belkin/wemo/rules/data/RMDBRule;->ruleDeviceSet:Ljava/util/Set;

    if-eqz v3, :cond_7

    move v1, v2

    .line 369
    goto :goto_0

    .line 371
    :cond_6
    iget-object v3, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->ruleDeviceSet:Ljava/util/Set;

    iget-object v4, v0, Lcom/belkin/wemo/rules/data/RMDBRule;->ruleDeviceSet:Ljava/util/Set;

    invoke-interface {v3, v4}, Ljava/util/Set;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_7

    move v1, v2

    .line 372
    goto :goto_0

    .line 374
    :cond_7
    iget-object v3, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->ruleType:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    iget-object v4, v0, Lcom/belkin/wemo/rules/data/RMDBRule;->ruleType:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    if-eq v3, v4, :cond_0

    move v1, v2

    .line 375
    goto :goto_0
.end method

.method public getDaySet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 269
    iget-object v0, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->dayList:Ljava/util/Set;

    return-object v0
.end method

.method public getEndDate()Ljava/lang/String;
    .locals 1

    .prologue
    .line 241
    iget-object v0, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->endDate:Ljava/lang/String;

    return-object v0
.end method

.method public getEndTime()I
    .locals 1

    .prologue
    .line 409
    iget v0, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->endTime:I

    return v0
.end method

.method public getLatitude()F
    .locals 1

    .prologue
    .line 188
    iget v0, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->latitude:F

    return v0
.end method

.method public getLongtitude()F
    .locals 1

    .prologue
    .line 180
    iget v0, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->longtitude:F

    return v0
.end method

.method public getRuleCodeEnd()I
    .locals 1

    .prologue
    .line 452
    iget v0, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->ruleCodeEnd:I

    return v0
.end method

.method public getRuleCodeStart()I
    .locals 1

    .prologue
    .line 438
    iget v0, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->ruleCodeStart:I

    return v0
.end method

.method public getRuleDeviceSet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;",
            ">;"
        }
    .end annotation

    .prologue
    .line 313
    iget-object v0, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->ruleDeviceSet:Ljava/util/Set;

    return-object v0
.end method

.method public getRuleDuration()I
    .locals 1

    .prologue
    .line 424
    iget v0, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->ruleDuration:I

    return v0
.end method

.method public getRuleOrder()I
    .locals 1

    .prologue
    .line 213
    iget v0, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->ruleOrder:I

    return v0
.end method

.method public getRuleType()Lcom/belkin/wemo/rules/data/RMDBRuleType;
    .locals 1

    .prologue
    .line 199
    iget-object v0, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->ruleType:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    return-object v0
.end method

.method public getStartDate()Ljava/lang/String;
    .locals 1

    .prologue
    .line 227
    iget-object v0, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->startDate:Ljava/lang/String;

    return-object v0
.end method

.method public getStartTime()I
    .locals 1

    .prologue
    .line 384
    iget v0, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->startTime:I

    return v0
.end method

.method public getSync()Ljava/lang/String;
    .locals 1

    .prologue
    .line 255
    iget-object v0, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->sync:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 5

    .prologue
    const/4 v3, 0x0

    .line 327
    const/16 v0, 0x1f

    .line 328
    .local v0, "prime":I
    invoke-super {p0}, Lcom/belkin/wemo/rules/data/RMRule;->hashCode()I

    move-result v1

    .line 329
    .local v1, "result":I
    mul-int/lit8 v4, v1, 0x1f

    iget-object v2, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->dayList:Ljava/util/Set;

    if-nez v2, :cond_0

    move v2, v3

    :goto_0
    add-int v1, v4, v2

    .line 330
    mul-int/lit8 v4, v1, 0x1f

    iget-object v2, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->ruleDeviceSet:Ljava/util/Set;

    if-nez v2, :cond_1

    move v2, v3

    :goto_1
    add-int v1, v4, v2

    .line 332
    mul-int/lit8 v2, v1, 0x1f

    iget-object v4, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->ruleType:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    if-nez v4, :cond_2

    :goto_2
    add-int v1, v2, v3

    .line 333
    return v1

    .line 329
    :cond_0
    iget-object v2, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->dayList:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->hashCode()I

    move-result v2

    goto :goto_0

    .line 330
    :cond_1
    iget-object v2, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->ruleDeviceSet:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->hashCode()I

    move-result v2

    goto :goto_1

    .line 332
    :cond_2
    iget-object v3, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->ruleType:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    invoke-virtual {v3}, Lcom/belkin/wemo/rules/data/RMDBRuleType;->hashCode()I

    move-result v3

    goto :goto_2
.end method

.method public removeDay(Ljava/lang/Integer;)V
    .locals 1
    .param p1, "day"    # Ljava/lang/Integer;

    .prologue
    .line 288
    iget-object v0, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->dayList:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 289
    return-void
.end method

.method public setDayList(Ljava/util/Set;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 276
    .local p1, "dayList":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    if-eqz p1, :cond_0

    .line 277
    iput-object p1, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->dayList:Ljava/util/Set;

    .line 281
    :goto_0
    return-void

    .line 279
    :cond_0
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->dayList:Ljava/util/Set;

    goto :goto_0
.end method

.method public setEndDate(Ljava/lang/String;)V
    .locals 0
    .param p1, "endDate"    # Ljava/lang/String;

    .prologue
    .line 248
    iput-object p1, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->endDate:Ljava/lang/String;

    .line 249
    return-void
.end method

.method public setEndTime(I)V
    .locals 1
    .param p1, "endTime"    # I

    .prologue
    .line 416
    iput p1, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->endTime:I

    .line 417
    invoke-direct {p0, p1}, Lcom/belkin/wemo/rules/data/RMDBRule;->calculateTimeCode(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/belkin/wemo/rules/data/RMDBRule;->setRuleCodeEnd(I)V

    .line 418
    return-void
.end method

.method public setLatitude(F)V
    .locals 0
    .param p1, "latitude"    # F

    .prologue
    .line 192
    iput p1, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->latitude:F

    .line 193
    return-void
.end method

.method public setLongtitude(F)V
    .locals 0
    .param p1, "longtitude"    # F

    .prologue
    .line 184
    iput p1, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->longtitude:F

    .line 185
    return-void
.end method

.method public setRuleCodeEnd(I)V
    .locals 0
    .param p1, "ruleCodeEnd"    # I

    .prologue
    .line 459
    iput p1, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->ruleCodeEnd:I

    .line 460
    return-void
.end method

.method public setRuleCodeStart(I)V
    .locals 0
    .param p1, "ruleCodeStart"    # I

    .prologue
    .line 445
    iput p1, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->ruleCodeStart:I

    .line 446
    return-void
.end method

.method public setRuleDeviceSet(Ljava/util/Set;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 319
    .local p1, "ruleDeviceSet":Ljava/util/Set;, "Ljava/util/Set<Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;>;"
    iput-object p1, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->ruleDeviceSet:Ljava/util/Set;

    .line 320
    return-void
.end method

.method public setRuleDuration(I)V
    .locals 0
    .param p1, "ruleDuration"    # I

    .prologue
    .line 431
    iput p1, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->ruleDuration:I

    .line 432
    return-void
.end method

.method public setRuleOrder(I)V
    .locals 0
    .param p1, "ruleOrder"    # I

    .prologue
    .line 220
    iput p1, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->ruleOrder:I

    .line 221
    return-void
.end method

.method public setRuleType(Lcom/belkin/wemo/rules/data/RMDBRuleType;)V
    .locals 0
    .param p1, "type"    # Lcom/belkin/wemo/rules/data/RMDBRuleType;

    .prologue
    .line 206
    iput-object p1, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->ruleType:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    .line 207
    return-void
.end method

.method public setStartDate(Ljava/lang/String;)V
    .locals 0
    .param p1, "startDate"    # Ljava/lang/String;

    .prologue
    .line 234
    iput-object p1, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->startDate:Ljava/lang/String;

    .line 235
    return-void
.end method

.method public setStartTime(I)V
    .locals 1
    .param p1, "startTime"    # I

    .prologue
    .line 391
    iput p1, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->startTime:I

    .line 392
    invoke-direct {p0, p1}, Lcom/belkin/wemo/rules/data/RMDBRule;->calculateTimeCode(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/belkin/wemo/rules/data/RMDBRule;->setRuleCodeStart(I)V

    .line 393
    return-void
.end method

.method public setSync(Ljava/lang/String;)V
    .locals 0
    .param p1, "sync"    # Ljava/lang/String;

    .prologue
    .line 262
    iput-object p1, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->sync:Ljava/lang/String;

    .line 263
    return-void
.end method

.method public toJSON(Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .locals 7
    .param p1, "jo"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 476
    invoke-super {p0, p1}, Lcom/belkin/wemo/rules/data/RMRule;->toJSON(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    .line 477
    const-string v5, "DB_RULE_TYPE"

    invoke-virtual {p0}, Lcom/belkin/wemo/rules/data/RMDBRule;->getRuleType()Lcom/belkin/wemo/rules/data/RMDBRuleType;

    move-result-object v6

    invoke-virtual {p1, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 478
    const-string v5, "START_TIME_SINCE_MIDNIGHT"

    iget v6, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->startTime:I

    invoke-virtual {p1, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 479
    const-string v5, "END_TIME_SINCE_MIDNIGHT"

    iget v6, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->endTime:I

    invoke-virtual {p1, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 480
    const-string v5, "RULE_DURATION"

    iget v6, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->ruleDuration:I

    invoke-virtual {p1, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 481
    const-string v5, "RULE_START_TIME_CODE"

    invoke-virtual {p0}, Lcom/belkin/wemo/rules/data/RMDBRule;->getRuleCodeStart()I

    move-result v6

    invoke-virtual {p1, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 482
    const-string v5, "RULE_END_TIME_CODE"

    invoke-virtual {p0}, Lcom/belkin/wemo/rules/data/RMDBRule;->getRuleCodeEnd()I

    move-result v6

    invoke-virtual {p1, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 484
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 485
    .local v1, "daysJA":Lorg/json/JSONArray;
    iget-object v5, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->dayList:Ljava/util/Set;

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 486
    .local v0, "day":Ljava/lang/Integer;
    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_0

    .line 488
    .end local v0    # "day":Ljava/lang/Integer;
    :cond_0
    const-string v5, "DAY_ID_ARR"

    invoke-virtual {p1, v5, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 491
    new-instance v4, Lorg/json/JSONArray;

    invoke-direct {v4}, Lorg/json/JSONArray;-><init>()V

    .line 492
    .local v4, "ruleDevicesJA":Lorg/json/JSONArray;
    iget-object v5, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->ruleDeviceSet:Ljava/util/Set;

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;

    .line 493
    .local v2, "device":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {v2, v5}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->toJSON(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_1

    .line 495
    .end local v2    # "device":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    :cond_1
    const-string v5, "WIFI_DEV_ARR"

    invoke-virtual {p1, v5, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 497
    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .locals 6

    .prologue
    .line 464
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-super {p0}, Lcom/belkin/wemo/rules/data/RMRule;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "; START_TIME: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->startTime:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "; END_TIME: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->endTime:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "; RULE_DURATION: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->ruleDuration:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 466
    .local v3, "stringRep":Ljava/lang/String;
    const/4 v2, 0x0

    .line 467
    .local v2, "ruleDevicesStr":Ljava/lang/String;
    iget-object v4, p0, Lcom/belkin/wemo/rules/data/RMDBRule;->ruleDeviceSet:Ljava/util/Set;

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;

    .line 468
    .local v1, "ruleDevice":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 469
    goto :goto_0

    .line 471
    .end local v1    # "ruleDevice":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    :cond_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "; RULE_DEVICES: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method
