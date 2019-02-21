.class public Lcom/belkin/database/BridgeLocalDatabase$BridgeDatabaseHelper;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "BridgeLocalDatabase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/database/BridgeLocalDatabase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "BridgeDatabaseHelper"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/database/BridgeLocalDatabase;


# direct methods
.method public constructor <init>(Lcom/belkin/database/BridgeLocalDatabase;Landroid/content/Context;Ljava/lang/String;I)V
    .locals 1
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "version"    # I

    .prologue
    .line 167
    iput-object p1, p0, Lcom/belkin/database/BridgeLocalDatabase$BridgeDatabaseHelper;->this$0:Lcom/belkin/database/BridgeLocalDatabase;

    .line 168
    const/4 v0, 0x0

    invoke-direct {p0, p2, p3, v0, p4}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 169
    return-void
.end method


# virtual methods
.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 175
    :try_start_0
    const-string v0, "CREATE TABLE IF NOT EXISTS leddevices(_ledid INTEGER PRIMARY KEY AUTOINCREMENT, led_deviceid TEXT, led_cloudid TEXT, led_image_raw TEXT)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 182
    :goto_0
    return-void

    .line 179
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 1
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "oldVersion"    # I
    .param p3, "newVersion"    # I

    .prologue
    .line 187
    :try_start_0
    const-string v0, "DROP TABLE IF EXISTS leddevices"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 191
    :goto_0
    return-void

    .line 188
    :catch_0
    move-exception v0

    goto :goto_0
.end method
