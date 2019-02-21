.class public abstract Lcom/belkin/wemo/rules/db/contract/RMRulesContract$RuleDevices;
.super Ljava/lang/Object;
.source "RMRulesContract.java"

# interfaces
.implements Landroid/provider/BaseColumns;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/rules/db/contract/RMRulesContract;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "RuleDevices"
.end annotation


# static fields
.field public static final ADD_COLUMN_COUNTDOWN_TIME:Ljava/lang/String; = "ALTER TABLE RULEDEVICES ADD COLUMN CountdownTime INTEGER"

.field public static final ADD_COLUMN_OFF_MODE_OFFSET:Ljava/lang/String; = "ALTER TABLE RULEDEVICES ADD COLUMN OffModeOffset INTEGER"

.field public static final ADD_COLUMN_ON_MODE_OFFSET:Ljava/lang/String; = "ALTER TABLE RULEDEVICES ADD COLUMN OnModeOffset INTEGER"

.field public static final ADD_COLUMN_ZB_CAPABILITY_END:Ljava/lang/String; = "ALTER TABLE RULEDEVICES ADD COLUMN ZBCapabilityEnd TEXT"

.field public static final ADD_COLUMN_ZB_CAPABILITY_START:Ljava/lang/String; = "ALTER TABLE RULEDEVICES ADD COLUMN ZBCapabilityStart TEXT"

.field public static final COLUMNS:[Ljava/lang/String;

.field public static final COLUMNS_LIST:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final COLUMN_NAME_COUNTDOWN_TIME:Ljava/lang/String; = "CountdownTime"

.field public static final COLUMN_NAME_DAY_ID:Ljava/lang/String; = "DayID"

.field public static final COLUMN_NAME_DEVICE_ID:Ljava/lang/String; = "DeviceID"

.field public static final COLUMN_NAME_END_ACTION:Ljava/lang/String; = "EndAction"

.field public static final COLUMN_NAME_END_TIME:Ljava/lang/String; = "EndTime"

.field public static final COLUMN_NAME_GROUP_ID:Ljava/lang/String; = "GroupID"

.field public static final COLUMN_NAME_LEVEL:Ljava/lang/String; = "Level"

.field public static final COLUMN_NAME_OFF_MODE_OFFSET:Ljava/lang/String; = "OffModeOffset"

.field public static final COLUMN_NAME_ON_MODE_OFFSET:Ljava/lang/String; = "OnModeOffset"

.field public static final COLUMN_NAME_RULE_DEVICE_PK:Ljava/lang/String; = "RuleDevicePK"

.field public static final COLUMN_NAME_RULE_DURATION:Ljava/lang/String; = "RuleDuration"

.field public static final COLUMN_NAME_RULE_ID:Ljava/lang/String; = "RuleID"

.field public static final COLUMN_NAME_SENSOR_DURATION:Ljava/lang/String; = "SensorDuration"

.field public static final COLUMN_NAME_START_ACTION:Ljava/lang/String; = "StartAction"

.field public static final COLUMN_NAME_START_TIME:Ljava/lang/String; = "StartTime"

.field public static final COLUMN_NAME_TYPE:Ljava/lang/String; = "Type"

.field public static final COLUMN_NAME_VALUE:Ljava/lang/String; = "Value"

.field public static final COLUMN_NAME_ZB_CAPABILITY_END:Ljava/lang/String; = "ZBCapabilityEnd"

.field public static final COLUMN_NAME_ZB_CAPABILITY_START:Ljava/lang/String; = "ZBCapabilityStart"

.field public static final CREATE_TABLE:Ljava/lang/String; = "CREATE TABLE IF NOT EXISTS RULEDEVICES(RuleDevicePK INTEGER PRIMARY KEY AUTOINCREMENT, RuleID INTEGER , DeviceID TEXT , GroupID INTEGER , DayID INTEGER , StartTime INTEGER, RuleDuration INTEGER , StartAction REAL, EndAction REAL, SensorDuration INTEGER , Type INTEGER , Value INTEGER , Level INTEGER, ZBCapabilityStart TEXT, ZBCapabilityEnd TEXT,OnModeOffset INTEGER, OffModeOffset INTEGER, CountdownTime INTEGER, EndTime INTEGER)"

.field public static final DROP_COLUMN_PRODUCT_NAME:Ljava/lang/String; = "ALTER TABLE RULEDEVICES DROP COLUMN ProductName"

.field public static final DROP_TABLE:Ljava/lang/String; = "DROP TABLE IF EXISTS RULEDEVICES"

.field public static final ORDER_BY:Ljava/lang/String; = "RuleID"

.field public static final SELECTION_BY_DEVICE_ID:Ljava/lang/String; = "DeviceID=?"

.field public static final SELECTION_BY_RULE_ID:Ljava/lang/String; = "RuleID=?"

.field public static final TABLE_NAME:Ljava/lang/String; = "RULEDEVICES"


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 121
    const/16 v0, 0x12

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "RuleID"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "DeviceID"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "GroupID"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "DayID"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "StartTime"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "RuleDuration"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "StartAction"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "EndAction"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "SensorDuration"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "Type"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "Value"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "Level"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "ZBCapabilityStart"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "ZBCapabilityEnd"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "OnModeOffset"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    const-string v2, "OffModeOffset"

    aput-object v2, v0, v1

    const/16 v1, 0x10

    const-string v2, "CountdownTime"

    aput-object v2, v0, v1

    const/16 v1, 0x11

    const-string v2, "EndTime"

    aput-object v2, v0, v1

    sput-object v0, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$RuleDevices;->COLUMNS:[Ljava/lang/String;

    .line 141
    sget-object v0, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$RuleDevices;->COLUMNS:[Ljava/lang/String;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$RuleDevices;->COLUMNS_LIST:Ljava/util/List;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
