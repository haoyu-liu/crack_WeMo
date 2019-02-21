.class public abstract Lcom/belkin/rules/db/contract/RMRulesContract$SensorNotification;
.super Ljava/lang/Object;
.source "RMRulesContract.java"

# interfaces
.implements Landroid/provider/BaseColumns;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/rules/db/contract/RMRulesContract;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "SensorNotification"
.end annotation


# static fields
.field public static final COLUMN_NAME_NOTIFICATION_DURATION:Ljava/lang/String; = "NotificationDuration"

.field public static final COLUMN_NAME_NOTIFICATION_MESSAGE:Ljava/lang/String; = "NotificationMessage"

.field public static final COLUMN_NAME_NOTIFY_RULE_ID:Ljava/lang/String; = "NotifyRuleID"

.field public static final COLUMN_NAME_RULE_ID:Ljava/lang/String; = "RuleID"

.field public static final COLUMN_NAME_SENSOR_NOTIFICATION_PK:Ljava/lang/String; = "SensorNotificationPK"

.field public static final CREATE_TABLE:Ljava/lang/String; = "CREATE TABLE IF NOT EXISTS SENSORNOTIFICATION(SensorNotificationPK INTEGER PRIMARY KEY AUTOINCREMENT, RuleID INTEGER , NotifyRuleID INTEGER , NotificationMessage TEXT , NotificationDuration INTEGER )"

.field public static final TABLE_NAME:Ljava/lang/String; = "SENSORNOTIFICATION"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 176
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
