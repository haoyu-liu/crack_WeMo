.class final Lio/liteglue/SQLitePlugin$DBQuery;
.super Ljava/lang/Object;
.source "SQLitePlugin.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/liteglue/SQLitePlugin;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "DBQuery"
.end annotation


# instance fields
.field final cbc:Lorg/apache/cordova/CallbackContext;

.field final close:Z

.field final delete:Z

.field final jsonparams:[Lorg/json/JSONArray;

.field final queries:[Ljava/lang/String;

.field final queryIDs:[Ljava/lang/String;

.field final stop:Z

.field final synthetic this$0:Lio/liteglue/SQLitePlugin;


# direct methods
.method constructor <init>(Lio/liteglue/SQLitePlugin;)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 687
    iput-object p1, p0, Lio/liteglue/SQLitePlugin$DBQuery;->this$0:Lio/liteglue/SQLitePlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 688
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/liteglue/SQLitePlugin$DBQuery;->stop:Z

    .line 689
    iput-boolean v2, p0, Lio/liteglue/SQLitePlugin$DBQuery;->close:Z

    .line 690
    iput-boolean v2, p0, Lio/liteglue/SQLitePlugin$DBQuery;->delete:Z

    .line 691
    iput-object v1, p0, Lio/liteglue/SQLitePlugin$DBQuery;->queries:[Ljava/lang/String;

    .line 692
    iput-object v1, p0, Lio/liteglue/SQLitePlugin$DBQuery;->queryIDs:[Ljava/lang/String;

    .line 693
    iput-object v1, p0, Lio/liteglue/SQLitePlugin$DBQuery;->jsonparams:[Lorg/json/JSONArray;

    .line 694
    iput-object v1, p0, Lio/liteglue/SQLitePlugin$DBQuery;->cbc:Lorg/apache/cordova/CallbackContext;

    .line 695
    return-void
.end method

.method constructor <init>(Lio/liteglue/SQLitePlugin;ZLorg/apache/cordova/CallbackContext;)V
    .locals 2
    .param p2, "delete"    # Z
    .param p3, "cbc"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 676
    iput-object p1, p0, Lio/liteglue/SQLitePlugin$DBQuery;->this$0:Lio/liteglue/SQLitePlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 677
    iput-boolean v1, p0, Lio/liteglue/SQLitePlugin$DBQuery;->stop:Z

    .line 678
    iput-boolean v1, p0, Lio/liteglue/SQLitePlugin$DBQuery;->close:Z

    .line 679
    iput-boolean p2, p0, Lio/liteglue/SQLitePlugin$DBQuery;->delete:Z

    .line 680
    iput-object v0, p0, Lio/liteglue/SQLitePlugin$DBQuery;->queries:[Ljava/lang/String;

    .line 681
    iput-object v0, p0, Lio/liteglue/SQLitePlugin$DBQuery;->queryIDs:[Ljava/lang/String;

    .line 682
    iput-object v0, p0, Lio/liteglue/SQLitePlugin$DBQuery;->jsonparams:[Lorg/json/JSONArray;

    .line 683
    iput-object p3, p0, Lio/liteglue/SQLitePlugin$DBQuery;->cbc:Lorg/apache/cordova/CallbackContext;

    .line 684
    return-void
.end method

.method constructor <init>(Lio/liteglue/SQLitePlugin;[Ljava/lang/String;[Ljava/lang/String;[Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V
    .locals 1
    .param p2, "myqueries"    # [Ljava/lang/String;
    .param p3, "qids"    # [Ljava/lang/String;
    .param p4, "params"    # [Lorg/json/JSONArray;
    .param p5, "c"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    const/4 v0, 0x0

    .line 666
    iput-object p1, p0, Lio/liteglue/SQLitePlugin$DBQuery;->this$0:Lio/liteglue/SQLitePlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 667
    iput-boolean v0, p0, Lio/liteglue/SQLitePlugin$DBQuery;->stop:Z

    .line 668
    iput-boolean v0, p0, Lio/liteglue/SQLitePlugin$DBQuery;->close:Z

    .line 669
    iput-boolean v0, p0, Lio/liteglue/SQLitePlugin$DBQuery;->delete:Z

    .line 670
    iput-object p2, p0, Lio/liteglue/SQLitePlugin$DBQuery;->queries:[Ljava/lang/String;

    .line 671
    iput-object p3, p0, Lio/liteglue/SQLitePlugin$DBQuery;->queryIDs:[Ljava/lang/String;

    .line 672
    iput-object p4, p0, Lio/liteglue/SQLitePlugin$DBQuery;->jsonparams:[Lorg/json/JSONArray;

    .line 673
    iput-object p5, p0, Lio/liteglue/SQLitePlugin$DBQuery;->cbc:Lorg/apache/cordova/CallbackContext;

    .line 674
    return-void
.end method
