.class public Lcom/belkin/rules/utils/RulesConstants;
.super Ljava/lang/Object;
.source "RulesConstants.java"


# static fields
.field public static ACTION_OFF:I

.field public static ACTION_ON:I

.field public static AWAY_MODE:Ljava/lang/String;

.field public static COMMA:C

.field public static DEVICES:Ljava/lang/String;

.field public static ENDTIME:Ljava/lang/String;

.field public static END_ACTION:Ljava/lang/String;

.field public static EVERYDAY:I

.field public static FNAME:Ljava/lang/String;

.field public static FRI:Ljava/lang/String;

.field public static FRIDAY:I

.field public static MAX_HOUR:I

.field public static MIDNIGHT_END_TIME:I

.field public static MIN_TIME:I

.field public static MON:Ljava/lang/String;

.field public static MONDAY:I

.field public static OFFSET_SEP:C

.field public static RULES_DATA:Ljava/lang/String;

.field public static RULE_ACTIVATE:C

.field public static RULE_DEACTIVATE:C

.field public static RULE_DURATION:Ljava/lang/String;

.field public static RULE_INSIGHT:Ljava/lang/String;

.field public static RULE_MAKER_MOTION:Ljava/lang/String;

.field public static RULE_MAKER_MOTION_NOTIFICATION:Ljava/lang/String;

.field public static RULE_MOTION:Ljava/lang/String;

.field public static RULE_NAME:Ljava/lang/String;

.field public static RULE_SENSOR_NOTIFICATION:Ljava/lang/String;

.field public static RULE_SIMPLE_TIMER:Ljava/lang/String;

.field public static RULE_TIME_INTERVAL:Ljava/lang/String;

.field public static RULE_TYPE:Ljava/lang/String;

.field public static SAT:Ljava/lang/String;

.field public static SATURDAY:I

.field public static SCHD_SEP:C

.field public static SELECTED_LED_VALUE:Ljava/lang/String;

.field public static SELECTED_RANGE:Ljava/lang/String;

.field public static SEMICOLUMN:C

.field public static SENSOR_DURATION:Ljava/lang/String;

.field public static SHARP:C

.field public static START_ACTION:Ljava/lang/String;

.field public static START_TIME:Ljava/lang/String;

.field public static STATE:Ljava/lang/String;

.field public static SUN:Ljava/lang/String;

.field public static SUNDAY:I

.field public static THRU:Ljava/lang/String;

.field public static THURSDAY:I

.field public static TUE:Ljava/lang/String;

.field public static TUESDAY:I

.field public static WED:Ljava/lang/String;

.field public static WEDNESDAY:I

.field public static WEEKDAYS:I

.field public static WEEKEND:I

.field public static WHEN:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 5
    const/16 v0, 0x7c

    sput-char v0, Lcom/belkin/rules/utils/RulesConstants;->SCHD_SEP:C

    .line 6
    const/16 v0, 0x2c

    sput-char v0, Lcom/belkin/rules/utils/RulesConstants;->COMMA:C

    .line 7
    const/16 v0, 0x23

    sput-char v0, Lcom/belkin/rules/utils/RulesConstants;->SHARP:C

    .line 8
    const/16 v0, 0x24

    sput-char v0, Lcom/belkin/rules/utils/RulesConstants;->OFFSET_SEP:C

    .line 9
    const/16 v0, 0x3b

    sput-char v0, Lcom/belkin/rules/utils/RulesConstants;->SEMICOLUMN:C

    .line 10
    const/16 v0, 0x31

    sput-char v0, Lcom/belkin/rules/utils/RulesConstants;->RULE_ACTIVATE:C

    .line 11
    const/16 v0, 0x30

    sput-char v0, Lcom/belkin/rules/utils/RulesConstants;->RULE_DEACTIVATE:C

    .line 13
    const-string v0, "Simple Switch"

    sput-object v0, Lcom/belkin/rules/utils/RulesConstants;->RULE_SIMPLE_TIMER:Ljava/lang/String;

    .line 14
    const-string v0, "Time Interval"

    sput-object v0, Lcom/belkin/rules/utils/RulesConstants;->RULE_TIME_INTERVAL:Ljava/lang/String;

    .line 15
    const-string v0, "Insight Rule"

    sput-object v0, Lcom/belkin/rules/utils/RulesConstants;->RULE_INSIGHT:Ljava/lang/String;

    .line 16
    const-string v0, "Motion Controlled"

    sput-object v0, Lcom/belkin/rules/utils/RulesConstants;->RULE_MOTION:Ljava/lang/String;

    .line 17
    const-string v0, "Away Mode"

    sput-object v0, Lcom/belkin/rules/utils/RulesConstants;->AWAY_MODE:Ljava/lang/String;

    .line 18
    const-string v0, "Maker Sensor Rule"

    sput-object v0, Lcom/belkin/rules/utils/RulesConstants;->RULE_MAKER_MOTION:Ljava/lang/String;

    .line 19
    const-string v0, "Maker Notify Rule"

    sput-object v0, Lcom/belkin/rules/utils/RulesConstants;->RULE_MAKER_MOTION_NOTIFICATION:Ljava/lang/String;

    .line 20
    const-string v0, "Notify Me"

    sput-object v0, Lcom/belkin/rules/utils/RulesConstants;->RULE_SENSOR_NOTIFICATION:Ljava/lang/String;

    .line 22
    sput v1, Lcom/belkin/rules/utils/RulesConstants;->ACTION_OFF:I

    .line 23
    sput v2, Lcom/belkin/rules/utils/RulesConstants;->ACTION_ON:I

    .line 25
    sput v1, Lcom/belkin/rules/utils/RulesConstants;->EVERYDAY:I

    .line 26
    sput v2, Lcom/belkin/rules/utils/RulesConstants;->MONDAY:I

    .line 27
    const/4 v0, 0x2

    sput v0, Lcom/belkin/rules/utils/RulesConstants;->TUESDAY:I

    .line 28
    const/4 v0, 0x3

    sput v0, Lcom/belkin/rules/utils/RulesConstants;->WEDNESDAY:I

    .line 29
    const/4 v0, 0x4

    sput v0, Lcom/belkin/rules/utils/RulesConstants;->THURSDAY:I

    .line 30
    const/4 v0, 0x5

    sput v0, Lcom/belkin/rules/utils/RulesConstants;->FRIDAY:I

    .line 31
    const/4 v0, 0x6

    sput v0, Lcom/belkin/rules/utils/RulesConstants;->SATURDAY:I

    .line 32
    const/4 v0, 0x7

    sput v0, Lcom/belkin/rules/utils/RulesConstants;->SUNDAY:I

    .line 33
    const/16 v0, 0x8

    sput v0, Lcom/belkin/rules/utils/RulesConstants;->WEEKDAYS:I

    .line 34
    const/16 v0, 0x9

    sput v0, Lcom/belkin/rules/utils/RulesConstants;->WEEKEND:I

    .line 36
    const v0, 0x15180

    sput v0, Lcom/belkin/rules/utils/RulesConstants;->MAX_HOUR:I

    .line 37
    const/16 v0, 0xa

    sput v0, Lcom/belkin/rules/utils/RulesConstants;->MIN_TIME:I

    .line 38
    const v0, 0x1517f

    sput v0, Lcom/belkin/rules/utils/RulesConstants;->MIDNIGHT_END_TIME:I

    .line 40
    const-string v0, "State"

    sput-object v0, Lcom/belkin/rules/utils/RulesConstants;->STATE:Ljava/lang/String;

    .line 41
    const-string v0, "RuleType"

    sput-object v0, Lcom/belkin/rules/utils/RulesConstants;->RULE_TYPE:Ljava/lang/String;

    .line 42
    const-string v0, "RuleName"

    sput-object v0, Lcom/belkin/rules/utils/RulesConstants;->RULE_NAME:Ljava/lang/String;

    .line 43
    const-string v0, "SelectedDayOrRange"

    sput-object v0, Lcom/belkin/rules/utils/RulesConstants;->SELECTED_RANGE:Ljava/lang/String;

    .line 44
    const-string v0, "rulesDataList"

    sput-object v0, Lcom/belkin/rules/utils/RulesConstants;->RULES_DATA:Ljava/lang/String;

    .line 45
    const-string v0, "Devices"

    sput-object v0, Lcom/belkin/rules/utils/RulesConstants;->DEVICES:Ljava/lang/String;

    .line 46
    const-string v0, "FName"

    sput-object v0, Lcom/belkin/rules/utils/RulesConstants;->FNAME:Ljava/lang/String;

    .line 47
    const-string v0, "SensorDuration"

    sput-object v0, Lcom/belkin/rules/utils/RulesConstants;->SENSOR_DURATION:Ljava/lang/String;

    .line 48
    const-string v0, "StartAction"

    sput-object v0, Lcom/belkin/rules/utils/RulesConstants;->START_ACTION:Ljava/lang/String;

    .line 49
    const-string v0, "SelectedLedValue"

    sput-object v0, Lcom/belkin/rules/utils/RulesConstants;->SELECTED_LED_VALUE:Ljava/lang/String;

    .line 50
    const-string v0, "EndAction"

    sput-object v0, Lcom/belkin/rules/utils/RulesConstants;->END_ACTION:Ljava/lang/String;

    .line 51
    const-string v0, "When"

    sput-object v0, Lcom/belkin/rules/utils/RulesConstants;->WHEN:Ljava/lang/String;

    .line 52
    const-string v0, "RuleDuration"

    sput-object v0, Lcom/belkin/rules/utils/RulesConstants;->RULE_DURATION:Ljava/lang/String;

    .line 53
    const-string v0, "EndTime"

    sput-object v0, Lcom/belkin/rules/utils/RulesConstants;->ENDTIME:Ljava/lang/String;

    .line 54
    const-string v0, "StartTime"

    sput-object v0, Lcom/belkin/rules/utils/RulesConstants;->START_TIME:Ljava/lang/String;

    .line 55
    const-string v0, "Mon"

    sput-object v0, Lcom/belkin/rules/utils/RulesConstants;->MON:Ljava/lang/String;

    .line 56
    const-string v0, "Tue"

    sput-object v0, Lcom/belkin/rules/utils/RulesConstants;->TUE:Ljava/lang/String;

    .line 57
    const-string v0, "Wed"

    sput-object v0, Lcom/belkin/rules/utils/RulesConstants;->WED:Ljava/lang/String;

    .line 58
    const-string v0, "Thu"

    sput-object v0, Lcom/belkin/rules/utils/RulesConstants;->THRU:Ljava/lang/String;

    .line 59
    const-string v0, "Fri"

    sput-object v0, Lcom/belkin/rules/utils/RulesConstants;->FRI:Ljava/lang/String;

    .line 60
    const-string v0, "Sat"

    sput-object v0, Lcom/belkin/rules/utils/RulesConstants;->SAT:Ljava/lang/String;

    .line 61
    const-string v0, "Sun"

    sput-object v0, Lcom/belkin/rules/utils/RulesConstants;->SUN:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
