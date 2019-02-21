.class public abstract Lcom/belkin/wemo/rules/db/contract/RMRulesContract$SensorNotification;
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
    name = "SensorNotification"
.end annotation


# static fields
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

.field public static final COLUMN_NAME_NOTIFICATION_DURATION:Ljava/lang/String; = "NotificationDuration"

.field public static final COLUMN_NAME_NOTIFICATION_MESSAGE:Ljava/lang/String; = "NotificationMessage"

.field public static final COLUMN_NAME_NOTIFY_RULE_ID:Ljava/lang/String; = "NotifyRuleID"

.field public static final COLUMN_NAME_RULE_ID:Ljava/lang/String; = "RuleID"

.field public static final COLUMN_NAME_SENSOR_NOTIFICATION_PK:Ljava/lang/String; = "SensorNotificationPK"

.field public static final CREATE_TABLE:Ljava/lang/String; = "CREATE TABLE IF NOT EXISTS SENSORNOTIFICATION(SensorNotificationPK INTEGER PRIMARY KEY AUTOINCREMENT, RuleID INTEGER , NotifyRuleID INTEGER , NotificationMessage TEXT , NotificationDuration INTEGER )"

.field public static final DROP_TABLE:Ljava/lang/String; = "DROP TABLE IF EXISTS SENSORNOTIFICATION"

.field public static final SELECTION_BY_RULE_ID:Ljava/lang/String; = "RuleID=?"

.field public static final TABLE_NAME:Ljava/lang/String; = "SENSORNOTIFICATION"


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 232
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "RuleID"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "NotifyRuleID"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "NotificationMessage"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "NotificationDuration"

    aput-object v2, v0, v1

    sput-object v0, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$SensorNotification;->COLUMNS:[Ljava/lang/String;

    .line 233
    sget-object v0, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$SensorNotification;->COLUMNS:[Ljava/lang/String;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/rules/db/contract/RMRulesContract$SensorNotification;->COLUMNS_LIST:Ljava/util/List;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 212
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
