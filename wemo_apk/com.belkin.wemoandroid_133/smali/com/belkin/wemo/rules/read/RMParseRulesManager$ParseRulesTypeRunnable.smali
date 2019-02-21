.class Lcom/belkin/wemo/rules/read/RMParseRulesManager$ParseRulesTypeRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "RMParseRulesManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/rules/read/RMParseRulesManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ParseRulesTypeRunnable"
.end annotation


# instance fields
.field private handler:Lcom/belkin/wemo/rules/read/RMParseRulesHandler;

.field private parseRulesTypeIns:Lcom/belkin/wemo/rules/read/type/RMIReadRulesType;

.field final synthetic this$0:Lcom/belkin/wemo/rules/read/RMParseRulesManager;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/read/RMParseRulesManager;Lcom/belkin/wemo/rules/read/type/RMIReadRulesType;Lcom/belkin/wemo/rules/read/RMParseRulesHandler;)V
    .locals 0
    .param p2, "parseRulesTypeIns"    # Lcom/belkin/wemo/rules/read/type/RMIReadRulesType;
    .param p3, "handler"    # Lcom/belkin/wemo/rules/read/RMParseRulesHandler;

    .prologue
    .line 44
    iput-object p1, p0, Lcom/belkin/wemo/rules/read/RMParseRulesManager$ParseRulesTypeRunnable;->this$0:Lcom/belkin/wemo/rules/read/RMParseRulesManager;

    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 45
    iput-object p2, p0, Lcom/belkin/wemo/rules/read/RMParseRulesManager$ParseRulesTypeRunnable;->parseRulesTypeIns:Lcom/belkin/wemo/rules/read/type/RMIReadRulesType;

    .line 46
    iput-object p3, p0, Lcom/belkin/wemo/rules/read/RMParseRulesManager$ParseRulesTypeRunnable;->handler:Lcom/belkin/wemo/rules/read/RMParseRulesHandler;

    .line 47
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 51
    iget-object v0, p0, Lcom/belkin/wemo/rules/read/RMParseRulesManager$ParseRulesTypeRunnable;->parseRulesTypeIns:Lcom/belkin/wemo/rules/read/type/RMIReadRulesType;

    iget-object v1, p0, Lcom/belkin/wemo/rules/read/RMParseRulesManager$ParseRulesTypeRunnable;->handler:Lcom/belkin/wemo/rules/read/RMParseRulesHandler;

    iget-object v2, p0, Lcom/belkin/wemo/rules/read/RMParseRulesManager$ParseRulesTypeRunnable;->handler:Lcom/belkin/wemo/rules/read/RMParseRulesHandler;

    invoke-interface {v0, v1, v2}, Lcom/belkin/wemo/rules/read/type/RMIReadRulesType;->parseRules(Lcom/belkin/wemo/rules/read/type/callback/RMReadRulesTypeSuccessCallback;Lcom/belkin/wemo/rules/read/type/callback/RMReadRulesTypeErrorCallback;)V

    .line 52
    return-void
.end method
