.class Lcom/belkin/rules/dbmigration/SwitchDBMigratior$1;
.super Ljava/lang/Thread;
.source "SwitchDBMigratior.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->migrate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/rules/dbmigration/SwitchDBMigratior;


# direct methods
.method constructor <init>(Lcom/belkin/rules/dbmigration/SwitchDBMigratior;)V
    .locals 0

    .prologue
    .line 180
    iput-object p1, p0, Lcom/belkin/rules/dbmigration/SwitchDBMigratior$1;->this$0:Lcom/belkin/rules/dbmigration/SwitchDBMigratior;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 182
    iget-object v0, p0, Lcom/belkin/rules/dbmigration/SwitchDBMigratior$1;->this$0:Lcom/belkin/rules/dbmigration/SwitchDBMigratior;

    invoke-static {v0}, Lcom/belkin/rules/dbmigration/SwitchDBMigratior;->access$000(Lcom/belkin/rules/dbmigration/SwitchDBMigratior;)V

    .line 183
    return-void
.end method
