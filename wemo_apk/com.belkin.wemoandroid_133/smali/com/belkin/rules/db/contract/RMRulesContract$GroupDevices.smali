.class public abstract Lcom/belkin/rules/db/contract/RMRulesContract$GroupDevices;
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
    name = "GroupDevices"
.end annotation


# static fields
.field public static final COLUMN_NAME_DEVICE_ID:Ljava/lang/String; = "DeviceID"

.field public static final COLUMN_NAME_GROUP_DEVICE_PK:Ljava/lang/String; = "GroupDevicePK"

.field public static final COLUMN_NAME_GROUP_ID:Ljava/lang/String; = "GroupID"

.field public static final CREATE_TABLE:Ljava/lang/String; = "CREATE TABLE IF NOT EXISTS GROUPDEVICES(GroupDevicePK INTEGER PRIMARY KEY AUTOINCREMENT, GroupID INTEGER , DeviceID TEXT )"

.field public static final TABLE_NAME:Ljava/lang/String; = "GROUPDEVICES"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 145
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
