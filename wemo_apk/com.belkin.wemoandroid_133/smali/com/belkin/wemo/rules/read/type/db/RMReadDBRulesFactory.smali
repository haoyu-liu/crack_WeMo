.class public final enum Lcom/belkin/wemo/rules/read/type/db/RMReadDBRulesFactory;
.super Ljava/lang/Enum;
.source "RMReadDBRulesFactory.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/belkin/wemo/rules/read/type/db/RMReadDBRulesFactory;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/belkin/wemo/rules/read/type/db/RMReadDBRulesFactory;

.field public static final enum INSTANCE:Lcom/belkin/wemo/rules/read/type/db/RMReadDBRulesFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 7
    new-instance v0, Lcom/belkin/wemo/rules/read/type/db/RMReadDBRulesFactory;

    const-string v1, "INSTANCE"

    invoke-direct {v0, v1, v2}, Lcom/belkin/wemo/rules/read/type/db/RMReadDBRulesFactory;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/belkin/wemo/rules/read/type/db/RMReadDBRulesFactory;->INSTANCE:Lcom/belkin/wemo/rules/read/type/db/RMReadDBRulesFactory;

    .line 5
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/belkin/wemo/rules/read/type/db/RMReadDBRulesFactory;

    sget-object v1, Lcom/belkin/wemo/rules/read/type/db/RMReadDBRulesFactory;->INSTANCE:Lcom/belkin/wemo/rules/read/type/db/RMReadDBRulesFactory;

    aput-object v1, v0, v2

    sput-object v0, Lcom/belkin/wemo/rules/read/type/db/RMReadDBRulesFactory;->$VALUES:[Lcom/belkin/wemo/rules/read/type/db/RMReadDBRulesFactory;

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
    .line 9
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 11
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/belkin/wemo/rules/read/type/db/RMReadDBRulesFactory;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 5
    const-class v0, Lcom/belkin/wemo/rules/read/type/db/RMReadDBRulesFactory;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/rules/read/type/db/RMReadDBRulesFactory;

    return-object v0
.end method

.method public static values()[Lcom/belkin/wemo/rules/read/type/db/RMReadDBRulesFactory;
    .locals 1

    .prologue
    .line 5
    sget-object v0, Lcom/belkin/wemo/rules/read/type/db/RMReadDBRulesFactory;->$VALUES:[Lcom/belkin/wemo/rules/read/type/db/RMReadDBRulesFactory;

    invoke-virtual {v0}, [Lcom/belkin/wemo/rules/read/type/db/RMReadDBRulesFactory;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/belkin/wemo/rules/read/type/db/RMReadDBRulesFactory;

    return-object v0
.end method


# virtual methods
.method public getParseDBRulesInstance()Lcom/belkin/wemo/rules/read/type/RMIReadRulesType;
    .locals 1

    .prologue
    .line 14
    new-instance v0, Lcom/belkin/wemo/rules/read/type/db/RMReadDBRules;

    invoke-direct {v0}, Lcom/belkin/wemo/rules/read/type/db/RMReadDBRules;-><init>()V

    return-object v0
.end method
