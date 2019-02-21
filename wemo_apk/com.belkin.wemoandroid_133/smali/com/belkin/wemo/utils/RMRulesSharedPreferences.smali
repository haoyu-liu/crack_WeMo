.class public Lcom/belkin/wemo/utils/RMRulesSharedPreferences;
.super Lcom/belkin/wemo/utils/RMWeMoSharedPreferences;
.source "RMRulesSharedPreferences.java"


# static fields
.field public static final DEFAULT_RULES_DB_VERSION:Ljava/lang/String; = "0"

.field public static final KEY_RULES_DB_VERSION:Ljava/lang/String; = "rules_db_version"

.field private static rulesUtils:Lcom/belkin/wemo/utils/RMRulesSharedPreferences;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Lcom/belkin/wemo/utils/RMWeMoSharedPreferences;-><init>()V

    .line 14
    return-void
.end method

.method public static instance()Lcom/belkin/wemo/utils/RMRulesSharedPreferences;
    .locals 2

    .prologue
    .line 17
    sget-object v0, Lcom/belkin/wemo/utils/RMRulesSharedPreferences;->rulesUtils:Lcom/belkin/wemo/utils/RMRulesSharedPreferences;

    if-nez v0, :cond_0

    .line 18
    new-instance v0, Lcom/belkin/wemo/utils/RMRulesSharedPreferences;

    invoke-direct {v0}, Lcom/belkin/wemo/utils/RMRulesSharedPreferences;-><init>()V

    sput-object v0, Lcom/belkin/wemo/utils/RMRulesSharedPreferences;->rulesUtils:Lcom/belkin/wemo/utils/RMRulesSharedPreferences;

    .line 19
    sget-object v0, Lcom/belkin/wemo/utils/RMRulesSharedPreferences;->rulesUtils:Lcom/belkin/wemo/utils/RMRulesSharedPreferences;

    sget-object v1, Lcom/belkin/wemo/WeMo;->INSTANCE:Lcom/belkin/wemo/WeMo;

    invoke-virtual {v1}, Lcom/belkin/wemo/WeMo;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/utils/RMRulesSharedPreferences;->init(Landroid/content/Context;)V

    .line 21
    :cond_0
    sget-object v0, Lcom/belkin/wemo/utils/RMRulesSharedPreferences;->rulesUtils:Lcom/belkin/wemo/utils/RMRulesSharedPreferences;

    return-object v0
.end method


# virtual methods
.method protected getFilename()Ljava/lang/String;
    .locals 1

    .prologue
    .line 26
    const-class v0, Lcom/belkin/wemo/utils/RMRulesSharedPreferences;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
