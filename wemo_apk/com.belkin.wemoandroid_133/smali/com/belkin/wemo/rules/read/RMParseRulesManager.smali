.class public final enum Lcom/belkin/wemo/rules/read/RMParseRulesManager;
.super Ljava/lang/Enum;
.source "RMParseRulesManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/rules/read/RMParseRulesManager$ParseRulesTypeRunnable;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/belkin/wemo/rules/read/RMParseRulesManager;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/belkin/wemo/rules/read/RMParseRulesManager;

.field public static final enum INSTANCE:Lcom/belkin/wemo/rules/read/RMParseRulesManager;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 13
    new-instance v0, Lcom/belkin/wemo/rules/read/RMParseRulesManager;

    const-string v1, "INSTANCE"

    invoke-direct {v0, v1, v2}, Lcom/belkin/wemo/rules/read/RMParseRulesManager;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/belkin/wemo/rules/read/RMParseRulesManager;->INSTANCE:Lcom/belkin/wemo/rules/read/RMParseRulesManager;

    .line 11
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/belkin/wemo/rules/read/RMParseRulesManager;

    sget-object v1, Lcom/belkin/wemo/rules/read/RMParseRulesManager;->INSTANCE:Lcom/belkin/wemo/rules/read/RMParseRulesManager;

    aput-object v1, v0, v2

    sput-object v0, Lcom/belkin/wemo/rules/read/RMParseRulesManager;->$VALUES:[Lcom/belkin/wemo/rules/read/RMParseRulesManager;

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
    .line 15
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 17
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/belkin/wemo/rules/read/RMParseRulesManager;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 11
    const-class v0, Lcom/belkin/wemo/rules/read/RMParseRulesManager;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/rules/read/RMParseRulesManager;

    return-object v0
.end method

.method public static values()[Lcom/belkin/wemo/rules/read/RMParseRulesManager;
    .locals 1

    .prologue
    .line 11
    sget-object v0, Lcom/belkin/wemo/rules/read/RMParseRulesManager;->$VALUES:[Lcom/belkin/wemo/rules/read/RMParseRulesManager;

    invoke-virtual {v0}, [Lcom/belkin/wemo/rules/read/RMParseRulesManager;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/belkin/wemo/rules/read/RMParseRulesManager;

    return-object v0
.end method


# virtual methods
.method public parseRules(Lcom/belkin/wemo/rules/read/callback/RMParseRulesSuccessCallback;Lcom/belkin/wemo/rules/read/callback/RMParseRulesErrorCallback;)V
    .locals 4
    .param p1, "successCallback"    # Lcom/belkin/wemo/rules/read/callback/RMParseRulesSuccessCallback;
    .param p2, "errorCallback"    # Lcom/belkin/wemo/rules/read/callback/RMParseRulesErrorCallback;

    .prologue
    .line 23
    new-instance v0, Lcom/belkin/wemo/rules/read/RMParseRulesHandler;

    const/4 v1, 0x1

    invoke-direct {v0, p1, p2, v1}, Lcom/belkin/wemo/rules/read/RMParseRulesHandler;-><init>(Lcom/belkin/wemo/rules/read/callback/RMParseRulesSuccessCallback;Lcom/belkin/wemo/rules/read/callback/RMParseRulesErrorCallback;I)V

    .line 27
    .local v0, "handler":Lcom/belkin/wemo/rules/read/RMParseRulesHandler;
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v1

    new-instance v2, Lcom/belkin/wemo/rules/read/RMParseRulesManager$ParseRulesTypeRunnable;

    sget-object v3, Lcom/belkin/wemo/rules/read/type/db/RMReadDBRulesFactory;->INSTANCE:Lcom/belkin/wemo/rules/read/type/db/RMReadDBRulesFactory;

    invoke-virtual {v3}, Lcom/belkin/wemo/rules/read/type/db/RMReadDBRulesFactory;->getParseDBRulesInstance()Lcom/belkin/wemo/rules/read/type/RMIReadRulesType;

    move-result-object v3

    invoke-direct {v2, p0, v3, v0}, Lcom/belkin/wemo/rules/read/RMParseRulesManager$ParseRulesTypeRunnable;-><init>(Lcom/belkin/wemo/rules/read/RMParseRulesManager;Lcom/belkin/wemo/rules/read/type/RMIReadRulesType;Lcom/belkin/wemo/rules/read/RMParseRulesHandler;)V

    invoke-virtual {v1, v2}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    .line 36
    return-void
.end method
