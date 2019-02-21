.class public final Lcom/almworks/sqlite4java/SQLiteColumnMetadata;
.super Ljava/lang/Object;
.source "SQLiteColumnMetadata.java"


# instance fields
.field private final myAutoinc:Z

.field private final myCollSeq:Ljava/lang/String;

.field private final myDataType:Ljava/lang/String;

.field private final myNotNull:Z

.field private final myPrimaryKey:Z


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;ZZZ)V
    .locals 0
    .param p1, "dataType"    # Ljava/lang/String;
    .param p2, "collSeq"    # Ljava/lang/String;
    .param p3, "notNull"    # Z
    .param p4, "primaryKey"    # Z
    .param p5, "autoinc"    # Z

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object p1, p0, Lcom/almworks/sqlite4java/SQLiteColumnMetadata;->myDataType:Ljava/lang/String;

    .line 43
    iput-object p2, p0, Lcom/almworks/sqlite4java/SQLiteColumnMetadata;->myCollSeq:Ljava/lang/String;

    .line 44
    iput-boolean p3, p0, Lcom/almworks/sqlite4java/SQLiteColumnMetadata;->myNotNull:Z

    .line 45
    iput-boolean p4, p0, Lcom/almworks/sqlite4java/SQLiteColumnMetadata;->myPrimaryKey:Z

    .line 46
    iput-boolean p5, p0, Lcom/almworks/sqlite4java/SQLiteColumnMetadata;->myAutoinc:Z

    .line 47
    return-void
.end method


# virtual methods
.method public getCollSeq()Ljava/lang/String;
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteColumnMetadata;->myCollSeq:Ljava/lang/String;

    return-object v0
.end method

.method public getDataType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lcom/almworks/sqlite4java/SQLiteColumnMetadata;->myDataType:Ljava/lang/String;

    return-object v0
.end method

.method public isAutoinc()Z
    .locals 1

    .prologue
    .line 81
    iget-boolean v0, p0, Lcom/almworks/sqlite4java/SQLiteColumnMetadata;->myAutoinc:Z

    return v0
.end method

.method public isNotNull()Z
    .locals 1

    .prologue
    .line 67
    iget-boolean v0, p0, Lcom/almworks/sqlite4java/SQLiteColumnMetadata;->myNotNull:Z

    return v0
.end method

.method public isPrimaryKey()Z
    .locals 1

    .prologue
    .line 74
    iget-boolean v0, p0, Lcom/almworks/sqlite4java/SQLiteColumnMetadata;->myPrimaryKey:Z

    return v0
.end method
