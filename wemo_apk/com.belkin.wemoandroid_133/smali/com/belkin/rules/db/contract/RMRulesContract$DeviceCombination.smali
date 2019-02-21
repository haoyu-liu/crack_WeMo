.class public abstract Lcom/belkin/rules/db/contract/RMRulesContract$DeviceCombination;
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
    name = "DeviceCombination"
.end annotation


# static fields
.field public static final COLUMN_NAME_DEVICE_COMBINATION_PK:Ljava/lang/String; = "DeviceCombinationPK"

.field public static final COLUMN_NAME_DEVICE_GROUP_ID:Ljava/lang/String; = "DeviceGroupID"

.field public static final COLUMN_NAME_DEVICE_ID:Ljava/lang/String; = "DeviceID"

.field public static final COLUMN_NAME_RULE_ID:Ljava/lang/String; = "RuleID"

.field public static final COLUMN_NAME_SENSOR_GROUP_ID:Ljava/lang/String; = "SensorGroupID"

.field public static final COLUMN_NAME_SENSOR_ID:Ljava/lang/String; = "SensorID"

.field public static final CREATE_TABLE:Ljava/lang/String; = "CREATE TABLE IF NOT EXISTS DEVICECOMBINATION(DeviceCombinationPK INTEGER PRIMARY KEY AUTOINCREMENT, RuleID INTEGER , SensorID TEXT , SensorGroupID INTEGER , DeviceID TEXT , DeviceGroupID INTEGER )"

.field public static final TABLE_NAME:Ljava/lang/String; = "DEVICECOMBINATION"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 124
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
