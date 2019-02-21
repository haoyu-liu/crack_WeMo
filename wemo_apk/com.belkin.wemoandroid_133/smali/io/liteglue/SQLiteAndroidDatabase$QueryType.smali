.class final enum Lio/liteglue/SQLiteAndroidDatabase$QueryType;
.super Ljava/lang/Enum;
.source "SQLiteAndroidDatabase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/liteglue/SQLiteAndroidDatabase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "QueryType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lio/liteglue/SQLiteAndroidDatabase$QueryType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/liteglue/SQLiteAndroidDatabase$QueryType;

.field public static final enum begin:Lio/liteglue/SQLiteAndroidDatabase$QueryType;

.field public static final enum commit:Lio/liteglue/SQLiteAndroidDatabase$QueryType;

.field public static final enum delete:Lio/liteglue/SQLiteAndroidDatabase$QueryType;

.field public static final enum insert:Lio/liteglue/SQLiteAndroidDatabase$QueryType;

.field public static final enum other:Lio/liteglue/SQLiteAndroidDatabase$QueryType;

.field public static final enum rollback:Lio/liteglue/SQLiteAndroidDatabase$QueryType;

.field public static final enum select:Lio/liteglue/SQLiteAndroidDatabase$QueryType;

.field public static final enum update:Lio/liteglue/SQLiteAndroidDatabase$QueryType;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 509
    new-instance v0, Lio/liteglue/SQLiteAndroidDatabase$QueryType;

    const-string v1, "update"

    invoke-direct {v0, v1, v3}, Lio/liteglue/SQLiteAndroidDatabase$QueryType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/liteglue/SQLiteAndroidDatabase$QueryType;->update:Lio/liteglue/SQLiteAndroidDatabase$QueryType;

    .line 510
    new-instance v0, Lio/liteglue/SQLiteAndroidDatabase$QueryType;

    const-string v1, "insert"

    invoke-direct {v0, v1, v4}, Lio/liteglue/SQLiteAndroidDatabase$QueryType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/liteglue/SQLiteAndroidDatabase$QueryType;->insert:Lio/liteglue/SQLiteAndroidDatabase$QueryType;

    .line 511
    new-instance v0, Lio/liteglue/SQLiteAndroidDatabase$QueryType;

    const-string v1, "delete"

    invoke-direct {v0, v1, v5}, Lio/liteglue/SQLiteAndroidDatabase$QueryType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/liteglue/SQLiteAndroidDatabase$QueryType;->delete:Lio/liteglue/SQLiteAndroidDatabase$QueryType;

    .line 512
    new-instance v0, Lio/liteglue/SQLiteAndroidDatabase$QueryType;

    const-string v1, "select"

    invoke-direct {v0, v1, v6}, Lio/liteglue/SQLiteAndroidDatabase$QueryType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/liteglue/SQLiteAndroidDatabase$QueryType;->select:Lio/liteglue/SQLiteAndroidDatabase$QueryType;

    .line 513
    new-instance v0, Lio/liteglue/SQLiteAndroidDatabase$QueryType;

    const-string v1, "begin"

    invoke-direct {v0, v1, v7}, Lio/liteglue/SQLiteAndroidDatabase$QueryType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/liteglue/SQLiteAndroidDatabase$QueryType;->begin:Lio/liteglue/SQLiteAndroidDatabase$QueryType;

    .line 514
    new-instance v0, Lio/liteglue/SQLiteAndroidDatabase$QueryType;

    const-string v1, "commit"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lio/liteglue/SQLiteAndroidDatabase$QueryType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/liteglue/SQLiteAndroidDatabase$QueryType;->commit:Lio/liteglue/SQLiteAndroidDatabase$QueryType;

    .line 515
    new-instance v0, Lio/liteglue/SQLiteAndroidDatabase$QueryType;

    const-string v1, "rollback"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lio/liteglue/SQLiteAndroidDatabase$QueryType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/liteglue/SQLiteAndroidDatabase$QueryType;->rollback:Lio/liteglue/SQLiteAndroidDatabase$QueryType;

    .line 516
    new-instance v0, Lio/liteglue/SQLiteAndroidDatabase$QueryType;

    const-string v1, "other"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lio/liteglue/SQLiteAndroidDatabase$QueryType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/liteglue/SQLiteAndroidDatabase$QueryType;->other:Lio/liteglue/SQLiteAndroidDatabase$QueryType;

    .line 508
    const/16 v0, 0x8

    new-array v0, v0, [Lio/liteglue/SQLiteAndroidDatabase$QueryType;

    sget-object v1, Lio/liteglue/SQLiteAndroidDatabase$QueryType;->update:Lio/liteglue/SQLiteAndroidDatabase$QueryType;

    aput-object v1, v0, v3

    sget-object v1, Lio/liteglue/SQLiteAndroidDatabase$QueryType;->insert:Lio/liteglue/SQLiteAndroidDatabase$QueryType;

    aput-object v1, v0, v4

    sget-object v1, Lio/liteglue/SQLiteAndroidDatabase$QueryType;->delete:Lio/liteglue/SQLiteAndroidDatabase$QueryType;

    aput-object v1, v0, v5

    sget-object v1, Lio/liteglue/SQLiteAndroidDatabase$QueryType;->select:Lio/liteglue/SQLiteAndroidDatabase$QueryType;

    aput-object v1, v0, v6

    sget-object v1, Lio/liteglue/SQLiteAndroidDatabase$QueryType;->begin:Lio/liteglue/SQLiteAndroidDatabase$QueryType;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lio/liteglue/SQLiteAndroidDatabase$QueryType;->commit:Lio/liteglue/SQLiteAndroidDatabase$QueryType;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lio/liteglue/SQLiteAndroidDatabase$QueryType;->rollback:Lio/liteglue/SQLiteAndroidDatabase$QueryType;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lio/liteglue/SQLiteAndroidDatabase$QueryType;->other:Lio/liteglue/SQLiteAndroidDatabase$QueryType;

    aput-object v2, v0, v1

    sput-object v0, Lio/liteglue/SQLiteAndroidDatabase$QueryType;->$VALUES:[Lio/liteglue/SQLiteAndroidDatabase$QueryType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 508
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lio/liteglue/SQLiteAndroidDatabase$QueryType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 508
    const-class v0, Lio/liteglue/SQLiteAndroidDatabase$QueryType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lio/liteglue/SQLiteAndroidDatabase$QueryType;

    return-object v0
.end method

.method public static values()[Lio/liteglue/SQLiteAndroidDatabase$QueryType;
    .locals 1

    .prologue
    .line 508
    sget-object v0, Lio/liteglue/SQLiteAndroidDatabase$QueryType;->$VALUES:[Lio/liteglue/SQLiteAndroidDatabase$QueryType;

    invoke-virtual {v0}, [Lio/liteglue/SQLiteAndroidDatabase$QueryType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/liteglue/SQLiteAndroidDatabase$QueryType;

    return-object v0
.end method
