.class Lcom/belkin/rules/dbmigration/SensorDBMigrator$1;
.super Ljava/lang/Thread;
.source "SensorDBMigrator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/rules/dbmigration/SensorDBMigrator;->migrate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/rules/dbmigration/SensorDBMigrator;


# direct methods
.method constructor <init>(Lcom/belkin/rules/dbmigration/SensorDBMigrator;)V
    .locals 0

    .prologue
    .line 224
    iput-object p1, p0, Lcom/belkin/rules/dbmigration/SensorDBMigrator$1;->this$0:Lcom/belkin/rules/dbmigration/SensorDBMigrator;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 226
    iget-object v0, p0, Lcom/belkin/rules/dbmigration/SensorDBMigrator$1;->this$0:Lcom/belkin/rules/dbmigration/SensorDBMigrator;

    invoke-static {v0}, Lcom/belkin/rules/dbmigration/SensorDBMigrator;->access$000(Lcom/belkin/rules/dbmigration/SensorDBMigrator;)V

    .line 227
    return-void
.end method
